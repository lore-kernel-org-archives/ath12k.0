Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C266C369B5
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/ObABjOV6tmamGjv9L2Q13+VEF7f80WjKn+a2KmsZU=; b=mwFAyPgpVa2Ekd0SECdk62iF0z
	H+1AA4Z+bIALLCezevsKkhOwHPZ11FN9pR6z7WXYa9xsFI5AHolv3kRuo78XEziyT2ZCxhiwANI5m
	OJj+UF9HUYI8wjHxAfvSE0jr1wC/wztKSN7X1Swo6jNQobPu0YDcDnq2wRkNbIfo7Y0Yn1VB4W2lz
	K7xJY2xrxZXaSULRLh18VDsoCyXEsHTxcbko4B3trHX8ji77iGOYErDlGmnVND8lpo3b+WDjhOZp7
	or99XVd0tXXQQLFa4aNfOGt/VMVoPSHluMiUhRPoiTXQPdsBM66TGgLmc/1902CzGuMRKXunDOddn
	El/B3W/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F9I-000000014uX-2NuR
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 08:26:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F91-000000014V9-0fAh;
	Mon, 14 Apr 2025 08:26:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744619176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/ObABjOV6tmamGjv9L2Q13+VEF7f80WjKn+a2KmsZU=;
	b=CwLQ96esYh4P4KVCJatZ8Hs44GlzB55o2RFDlB2NnoKBpBTwtnnttXtq6VROizK0QMlx2I
	fdJ7j4gqaLBCoqlkfZ1RXGFlNyiBmJWKENL3vw8Uczt17RPRBi5rxA4Gava5iUDAFYvikp
	QE5M9Z54sDWEXNx5tdtopJ9DVVmmtcwowrh/m0D/S2+B66LoJJ3a6+WPDaej08VijYy+gj
	pOup6JcF7y5Pcc3mwYSDOXBypIIu4AFPIaunhtcjzU8or4EWnQYp44LtnOrIkU7bntJpWC
	NctE2AcFsSHEFFVm1SrRM5+S1R3TygES0fgt3lu+ss6ppElalDk8lhMyfXz0Ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744619176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/ObABjOV6tmamGjv9L2Q13+VEF7f80WjKn+a2KmsZU=;
	b=stqjzGM4ft7DElxC/qKesdImygtnGtJLw7FA4P6YSG5XAK7GUU0TpDDd0NwKpK+oBLbwLL
	p8/cYaEmZo1280CA==
Date: Mon, 14 Apr 2025 10:26:06 +0200
Subject: [PATCH net-next 5/7] wifi: mwifiex: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-restricted-pointers-net-v1-5-12af0ce46cdd@linutronix.de>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>
Cc: ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 linux-rdma@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619172; l=1442;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DUG1+lN4hYWTRXUIHu9/uXnn+NTpymOB/TnWz/zGsdo=;
 b=4Oqz6NIxNX2Dv35WuWlxsIW56xiHSeN4apRT/2S8GealXzW3EYzYF9P9h2Mhnx6cG1SWclSLx
 d+XUSmGw7EEAI1exWfEp1WbMYoqGspvBdqwaN+gAowvrX+qdbEJLvEv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_012619_337916_08E38328 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There are still a few users of %pK left, but these use it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/net/wireless/marvell/mwifiex/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wireless/marvell/mwifiex/pcie.c
index dd2a42e732f2398892915e1a3ac88b7d3fb4ed3f..a760de191fce7340040b1bc74efb35cf52ce8368 100644
--- a/drivers/net/wireless/marvell/mwifiex/pcie.c
+++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
@@ -2971,7 +2971,7 @@ static int mwifiex_init_pcie(struct mwifiex_adapter *adapter)
 		goto err_iomap2;
 	}
 
-	pr_notice("PCI memory map Virt0: %pK PCI memory map Virt2: %pK\n",
+	pr_notice("PCI memory map Virt0: %p PCI memory map Virt2: %p\n",
 		  card->pci_mmap, card->pci_mmap1);
 
 	ret = mwifiex_pcie_alloc_buffers(adapter);

-- 
2.49.0


