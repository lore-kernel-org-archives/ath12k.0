Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EB2C3ABB6
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuOgMBFk69ocFUKbXkV75GSj/N1LEmEBamJEKAL56jQ=; b=Km7FawcuZR/IH2z+akcrKVaFVt
	paew8ZzzNKypIiX+veCpYSeid5FVX6AYY5CjgXy3csk/s+ogrXCWb2xLtpEJrrMIgk6y+fZUh7T+j
	IQ4g0RaRwR2AGDueixHK4x+aCwCQtjLcUHGOb3fl3I76ElvsDjb44LZm7TwPFgV4E25C20vRoiVTT
	j4QyQIIpsQPF1ib6alRP3LrrqykmPHxEiIR2f6giLdB30CDxhk9i9Fzaaf7sXm+OoQfmz5asgIpzX
	T9kee/fLnF5Ujjup+tW+gcHzuKItGiMFPtVCvHJWFpjMUxstXENtVnsDQoJNxy9t1obB/guB4/uRu
	vX6e/r5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6Fd-00000009J8C-1GrK;
	Tue, 06 May 2025 00:33:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Qs-00000008oEv-2G5n
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43B21A4CEDB;
	Mon,  5 May 2025 22:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF12C4CEE4;
	Mon,  5 May 2025 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484625;
	bh=Iorwx/78CiNVkAt+h36FsYKKL7SESneynjnqM6o1jN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brnFPH0Bo9F78qbw6rFVFKfrNBLhvWAd+SIrbcTEG0voE3PKpSf7Kapz4WBHY37XU
	 JgDc2Nve+Lzj912y60pAPWrj0Md+UtvCwpoNoabRqsTC7GTy63Ci6EtpmcTRFW1E7h
	 mUosthKPDOvbVCUGtjI+a0K+T1zxIC+dvrza9Jx/Un5YR99n+WY6fjBdq5JQtaPTGJ
	 nZGda5bhx3h78Fc/ig0dKHAirh2r1oZOsHIo6CpsB3tdxGhbt0NTKQQlxe+LhSAC2/
	 oqagYas8QgwcSw3OIVOL7zNQZvIfCVZU59zO3D/x/wklc5wH+8L/TyrNtxkVkOSTRt
	 oxhEVV2dC9NgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Avula Sri Charan <quic_asrichar@quicinc.com>,
	Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 569/642] wifi: ath12k: Avoid napi_sync() before napi_enable()
Date: Mon,  5 May 2025 18:13:05 -0400
Message-Id: <20250505221419.2672473-569-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153706_708881_F137D0FD 
X-CRM114-Status: GOOD (  12.43  )
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

From: Avula Sri Charan <quic_asrichar@quicinc.com>

[ Upstream commit 268c73d470a5790a492a2fc2ded084b909d144f3 ]

In case of MHI error a reset work will be queued which will try
napi_disable() after napi_synchronize().

As the napi will be only enabled after qmi_firmware_ready event,
trying napi_synchronize() before napi_enable() will result in
indefinite sleep in case of a firmware crash in QMI init sequence.

To avoid this, introduce napi_enabled flag to check if napi is enabled
or not before calling napi_synchronize().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Link: https://patch.msgid.link/20250124090058.3194299-1-quic_tamizhr@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/pci.c  | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 6325ac493f82c..2699c383fc4c9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -166,6 +166,7 @@ struct ath12k_ext_irq_grp {
 	u32 num_irq;
 	u32 grp_id;
 	u64 timestamp;
+	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device *napi_ndev;
 };
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index ee14b84845487..895b2314d1d58 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -483,8 +483,11 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 
 		ath12k_pci_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -1114,7 +1117,11 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
+
 		ath12k_pci_ext_grp_enable(irq_grp);
 	}
 
-- 
2.39.5


