Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700B9C36014
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5+qTA+LLz4Jx6UQ3b64exjwirEJK4llLLmjD0W1NJk=; b=eYSLisLSa6D/toQ6Wm4/GAgHIo
	pMeATr9X/9E19s2EfXe7SmHwImH0jAlfpNpbi9sBREouLTJr+5U0NHmVCy4gA5NluGbAJFL4s8499
	qXX4yLFEam8Zg0BCRuDIxPVbsSI60IXC5KMtg+wuRoRvmTnOgtLqf074cepn2KA8iDIJ2RCzifNfU
	VCM5ai1MZmHwaN2Q8+GvXMq6dTWlRKp5KgOS0mO3wsum8CLcbXYLyVNRo6E2DIX67hqUAw+mzTpuX
	bOJ+IdUgy83/TuGaE4boPYXG1jW0n2GJI/XozngsPATk5fFrPGy7OCrE704QRkomf01L8GIu9Xqfb
	0jZMAplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PpZ-00000009d82-0ueE
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 19:02:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PpV-00000009d5p-1CZv
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 19:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E0D55C6C62;
	Thu,  3 Apr 2025 19:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50752C4CEEA;
	Thu,  3 Apr 2025 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706940;
	bh=NEE8XyyBTIzK9+F1SjLTLthFKKuHvJLm8dwTdO5OlAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6ucFMMAeJ1LR05ByL8m3vyhAGo5m6VYmuG3G5g+MHi2Pm6cPaD0mPWZqntU+kZSW
	 Mcw5fKP43TS1EZkJIYOAAw0WPQgdA+z9DMtQ3dCaxUmRnc4F32PxmM/IhrnByG8opr
	 x9ueVZPQWD4lEcDQox7MAUJH3lf+bpJ3WzmXvOq+35DLZikXaCgc0MaMLAHV9wxoTt
	 7AIjteSrLu3JfXiXZ6QfAdfy3fcGxeDOlhFrLPODAuxcfM+owaTjC4aQTyId7Ol8x1
	 0MnxyPXmhkrga2tiRHEGs8Pb8Em5oDoXkj44SLfl260IuwjWYz8VodbzaMci6pRipv
	 /9H6/zztyJThA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 04/54] wifi: ath12k: fix memory leak in ath12k_pci_remove()
Date: Thu,  3 Apr 2025 15:01:19 -0400
Message-Id: <20250403190209.2675485-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190209.2675485-1-sashal@kernel.org>
References: <20250403190209.2675485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120221_362971_303DF285 
X-CRM114-Status: UNSURE (   9.57  )
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
 drivers/net/wireless/ath/ath12k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 06cff3849ab8d..ee61afe564b92 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1734,9 +1734,9 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	cancel_work_sync(&ab->reset_work);
 	cancel_work_sync(&ab->dump_work);
 	ath12k_core_deinit(ab);
-	ath12k_fw_unmap(ab);
 
 qmi_fail:
+	ath12k_fw_unmap(ab);
 	ath12k_mhi_unregister(ab_pci);
 
 	ath12k_pci_free_irq(ab);
-- 
2.39.5


