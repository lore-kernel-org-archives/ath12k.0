Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD629C77B60
	for <ath12k@archiver.kernel.org>; Thu, 23 Mar 2023 11:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APMh5luDnFsoer9/f01D6y/z9yj0lM99vb4UF+Wv918=; b=a2AcTEDCDXam3s
	bUyO7DYUpVHjhOk2QCSl6equj3ko9roEBFAxJsyUfDg8ZNm1RRxvzvMUALmfXr+I8c+HJNlLmUSMf
	YJ5zUaAF7d2qzLZGtub9x1i3cEafE8CLN4SNHjuW4PmEXZ0/WLuwnrwwiMvRPZ5iUyvXHwFJtRZkW
	3FiOvQC6JKSavs4hp27wOilJYHSAPjDOs9I128KMpQ4vsqL5OknPCX5MlQhFlYhetCsOKAECMJ7Yb
	MUm1lLZrCpMxUobTTt2nGPvDBbpN7nx6x3L194OmyJV/NN1cCmGKq4COv/WI0ZYjprUalSGwWn/Ta
	tUR5/n1SUCZWxAqXBKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJBG-001jr8-1S
	for ath12k@archiver.kernel.org;
	Thu, 23 Mar 2023 11:32:30 +0000
Received: from out-19.mta1.migadu.com ([2001:41d0:203:375::13])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJB6-001jkY-06
	for ath12k@lists.infradead.org;
	Thu, 23 Mar 2023 11:32:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679570795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTUWX3aTLswoFCHtkP0zXcRP9Ge0kmAhVIeOjF5/rGc=;
	b=tGiiSgjvr0b+Z7aAWVjX2r/RSBTRbfF/dareLKLdicHxsBVQ+Zgy38C5/P8Iap3KDd/lpi
	etzTUrtxWpnsW2G4MBYbkdgMdil/d8miyjYW4eFjJCqX6Xr0L3JGtvmgwYf67neCzmGbMe
	PGsYNpHJG7jSQRcfAuPzg0tb3MaqB9w=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Cc: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yan-Hsuan Chuang <tony0620emma@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: [PATCH 3/5] wifi: ath12k: Remove redundant pci_clear_master
Date: Thu, 23 Mar 2023 19:26:11 +0800
Message-Id: <20230323112613.7550-3-cai.huoqing@linux.dev>
In-Reply-To: <20230323112613.7550-1-cai.huoqing@linux.dev>
References: <20230323112613.7550-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_043220_290063_7AF9032C 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Remove pci_clear_master to simplify the code,
the bus-mastering is also cleared in do_pci_disable_device,
like this:
./drivers/pci/pci.c:2197
static void do_pci_disable_device(struct pci_dev *dev)
{
	u16 pci_command;

	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
	if (pci_command & PCI_COMMAND_MASTER) {
		pci_command &= ~PCI_COMMAND_MASTER;
		pci_write_config_word(dev, PCI_COMMAND, pci_command);
	}

	pcibios_disable_device(dev);
}.
And dev->is_busmaster is set to 0 in pci_disable_device.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/net/wireless/ath/ath12k/pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index d32637b0113d..9ee47caf8485 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -755,14 +755,12 @@ static int ath12k_pci_claim(struct ath12k_pci *ab_pci, struct pci_dev *pdev)
 	if (!ab->mem) {
 		ath12k_err(ab, "failed to map pci bar %d\n", ATH12K_PCI_BAR_NUM);
 		ret = -EIO;
-		goto clear_master;
+		goto release_region;
 	}
 
 	ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot pci_mem 0x%pK\n", ab->mem);
 	return 0;
 
-clear_master:
-	pci_clear_master(pdev);
 release_region:
 	pci_release_region(pdev, ATH12K_PCI_BAR_NUM);
 disable_device:
@@ -778,7 +776,6 @@ static void ath12k_pci_free_region(struct ath12k_pci *ab_pci)
 
 	pci_iounmap(pci_dev, ab->mem);
 	ab->mem = NULL;
-	pci_clear_master(pci_dev);
 	pci_release_region(pci_dev, ATH12K_PCI_BAR_NUM);
 	if (pci_is_enabled(pci_dev))
 		pci_disable_device(pci_dev);
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
