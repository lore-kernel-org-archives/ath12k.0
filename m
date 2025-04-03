Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF6C369A1
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w6lOBMH0OPhiP23pURe7GX6tXmkUc1DFNPNhEFw7QQ=; b=Zg0scZqAI3lEkk3r8exRMnw0bG
	pxFaUwrV/lW5cAgVcJQCPuV3YSq8jUzduyUQ5PsOsBEUzeibQ+fWsaPlmrQF+8ofG7N6fiuMI0LJy
	kCF4Sivv4wqAR5WgHiDekGQwRbNrihAmRYlUrKB3w9DIB/jNKXwrN2Ym6W6Q3mVMuA/Xu1bRP1+TT
	h8pAl35Ikhp7XKLf1aVsmjloW+JAN/vRJmpDIzSE0euTiGJ2cMWoxcOQ+rCilR4MbIH/ZiqBgRdMX
	CGz5ZbP8aT/SDm3DMrDhUzcIEKYixYFovNlPjmZUv+sbTfKozlai5szJXYf8VIHJwGFCrbU09zi82
	n/17Didw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PuW-00000009eU3-3rWu
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 19:07:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PrM-00000009dhk-1TSH
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 19:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D26CCA45ADF;
	Thu,  3 Apr 2025 18:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79303C4CEE3;
	Thu,  3 Apr 2025 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707055;
	bh=UYF8jU967ayurQp0ptIlcf8oWc7tyZ1m9jYVdGcC2i4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pYKSEM3Jg11aELufgkwCqe2F7aYRt/jjgM1N4HHz7nqFEfsPRRQx5ox61M937s6yQ
	 apLZub3rHa+QEqK7SyPKtln3HdgN2GpFnIwrHepRbGEy6qaqdP87gjANA8kbL8UXJD
	 aqB44B/msFg99atZkwegn4cUVtCCYXN62Va4xIAEY0BsrSdFHKZ/ONF34Q9qNL5wdd
	 e6sYmhuMn3q2L7qb8Xba8ZXzXkWkZKR6InRx4HEfgB9uBSzV5OXSTDjGhfY5nQbcg2
	 gVwRW/j9T0ueglEa9GRbXfv4vuIFdd8XM/Ad6Thea1XrDDsd6ILjt9EiiFNgdrb9tg
	 U2R/VAX7UbkDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 03/49] wifi: ath12k: fix memory leak in ath12k_pci_remove()
Date: Thu,  3 Apr 2025 15:03:22 -0400
Message-Id: <20250403190408.2676344-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190408.2676344-1-sashal@kernel.org>
References: <20250403190408.2676344-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120416_457060_9161C19B 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Miaoqing Pan <quic_miaoqing@quicinc.com>

[ Upstream commit 1b24394ed5c8a8d8f7b9e3aa9044c31495d46f2e ]

Kmemleak reported this error:

  unreferenced object 0xffff1c165cec3060 (size 32):
    comm "insmod", pid 560, jiffies 4296964570 (age 235.596s)
    backtrace:
      [<000000005434db68>] __kmem_cache_alloc_node+0x1f4/0x2c0
      [<000000001203b155>] kmalloc_trace+0x40/0x88
      [<0000000028adc9c8>] _request_firmware+0xb8/0x608
      [<00000000cad1aef7>] firmware_request_nowarn+0x50/0x80
      [<000000005011a682>] local_pci_probe+0x48/0xd0
      [<00000000077cd295>] pci_device_probe+0xb4/0x200
      [<0000000087184c94>] really_probe+0x150/0x2c0

The firmware memory was allocated in ath12k_pci_probe(), but not
freed in ath12k_pci_remove() in case ATH12K_FLAG_QMI_FAIL bit is
set. So call ath12k_fw_unmap() to free the memory.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.2.0-02280-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Link: https://patch.msgid.link/20250123080226.1116479-1-quic_miaoqing@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index cf907550e6a4a..67cbf78ad9134 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1727,6 +1727,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	ath12k_core_deinit(ab);
 
 qmi_fail:
+	ath12k_fw_unmap(ab);
 	ath12k_mhi_unregister(ab_pci);
 
 	ath12k_pci_free_irq(ab);
-- 
2.39.5


