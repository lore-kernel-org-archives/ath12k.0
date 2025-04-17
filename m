Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77598C369D2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1GeXntpnPWyXUESrbciRq82BQz1QlJ7YZ0gk/CUbVc=; b=HUwdLJv/vLEnVwr3EqndGIWxGP
	vsZNd/XZu5NULtqIC8qn5gqjb7Db07Lbj32n/lalEo2byM5V/yaTixhxWVSFEzZXpXX1eohcErzKn
	7ODREmJ/uK8+cgrUl/6d1Air9wepkl0YCjUS/eiGsfnP9gZsIw3NQPA0GI1mD1UaCDMcjwRpgSApM
	/rjg60Mxx/i7cn+dsiQnhQ23GYGvLHEZNp/9QKNb17NrXwCI2vD2iAZqREzvz3Se1Gg/vcjNJmN+B
	lNXaxCUldZbvjntmEkZcmVtmFfLXafbzW21hQymuP/FNiTttV6rHGCi+uaXEMsr4ycGsFbCleW/dl
	jtEqWg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAj-0000000D7Rx-0fRl;
	Thu, 17 Apr 2025 13:20:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAO-0000000D7HT-13FX;
	Thu, 17 Apr 2025 13:20:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744896029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1GeXntpnPWyXUESrbciRq82BQz1QlJ7YZ0gk/CUbVc=;
	b=yuZ3hdlS0nUrlUULOiIVbfJkKVbyppqvbHlS2FV4PHE0yPJR7/k9NSZX7NTQosz3hCIxnI
	80m0fcciH2e8yPHCegiCEWDbu4M0DCNHPj1NKb7YFrGysEz2yIq7xihzImhzVL6plVFJB2
	ADcSIASXby4bV0PP8c8FGM7O//J8rfv8WNurYJ6TG+Y42N8JZjtQFFqsr3M9OFdhnPPrx+
	oqXdE4WxuEdkmzFhz2lIHhaPXqTqWJhP++jqkQu9trCPVcsWbc5lG4N4GIFpxc9Kd235nV
	DpUFGdZrJHEtt1ab68b6AO+cqf8UrOI1gL8Djk9Zdj3ha67kHDpp0Yc/yuUIKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744896029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1GeXntpnPWyXUESrbciRq82BQz1QlJ7YZ0gk/CUbVc=;
	b=DJ9y5yUdNyJvZAr2C+gTNyK6ZzcIz6wYME/IU6h3n1ld9N+CixdHwFfw0mZCow+IKHwlnQ
	NIAIjsnaIIi1ZXBw==
Date: Thu, 17 Apr 2025 15:19:08 +0200
Subject: [PATCH ath-next 2/4] wifi: ath11k: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250417-restricted-pointers-ath-v1-2-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744896028; l=1593;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=StrFXkjU61OZ/Br21albUB1TSXKwVdbD6fzzr0lF8cg=;
 b=qNfUCGEcsX+Nn3t6KcR00t00ASyLvVOQ9TKgoODq6Fiscv21IPuHnZP3h1CZZ+fhT6EfqPdXD
 zojyXNUtyhTBdeQzn4UWhWmDHqDB0JcpZvueCEpIxa0eDWTZKPlTF2u
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_062032_430018_6207B728 
X-CRM114-Status: UNSURE (   8.94  )
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
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 drivers/net/wireless/ath/ath11k/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index 9be1cd742339c95ffa74c09bee924f4eff15134a..a9751ea2a0b73009bfb600d51c3978200ce99114 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -107,7 +107,7 @@ static int ath11k_tm_process_event(struct ath11k_base *ab, u32 cmd_id,
 	u32 pdev_id;
 
 	ath11k_dbg(ab, ATH11K_DBG_TESTMODE,
-		   "event wmi cmd_id %d ftm event msg %pK datalen %d\n",
+		   "event wmi cmd_id %d ftm event msg %p datalen %d\n",
 		   cmd_id, ftm_msg, length);
 	ath11k_dbg_dump(ab, ATH11K_DBG_TESTMODE, NULL, "", ftm_msg, length);
 	pdev_id = DP_HW2SW_MACID(ftm_msg->seg_hdr.pdev_id);

-- 
2.49.0


