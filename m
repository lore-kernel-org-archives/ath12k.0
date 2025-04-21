Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C18C369D3
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GANNV6oVj+ynefjA8lZ1Q4dBfFUbWKfBAr9zn5iRes=; b=KsPQsgiaS3f6Q62ugAc4DYIbVG
	2Dgy5eaiv4BGQPlk1vpMvriNwdDeTBJMyLvqE65kIQud+MrgoDrfrS0YG4t+NjCAjf86TjZDoc1fD
	gYAJmB9IvzKVz1StwQqJr9fE42jq53Fwl/funlzo2Ek0FhcL0TPwwpuQNNVMcX8HzibL7AsClpTXh
	ayZ1UfQIUMBY1n4ZjXaAR8JURA6HqR64iI5uT3OGLUgHOwJnrROhv3cTKSKRFztByJYHZD85aAuL/
	blQdeHM+X5e1F3LpKXGwT5FQwIhcn/hvQ8ipjGeA5XOWKEU13IQRJJPrFy5jrmoGepv58pvEp4XxJ
	FxomHXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0R-00000003S6r-3TVQ;
	Mon, 21 Apr 2025 02:35:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0P-00000003S5a-2z5d
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNJZjX004662
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5GANNV6oVj+
	ynefjA8lZ1Q4dBfFUbWKfBAr9zn5iRes=; b=oTRlBkH939TgEXDbEAzaPdney3t
	e0gZ5pyiiWJohnIvmLghbbnVaxMHDXSU3aqEv0Yb0SZM8Lk09sCxGFxqvD24wNRe
	U+8UenguoAtcHYEF+HZ1m8s7FPKocrQ/RIzx09B60d8LYKz5BCEt1kYcaTUNCovP
	rnErmeLoEF4Q520CKNu7Vq0fF7Rj0g+g9eBBPYATK5o+McuBGS4z/ihdeUfflnEs
	OiI46Vl5JZR4HIl8EIAa1E2U5tgk+8CtuaLQPJiqcHDEbULmvYJ3dm1ZGLmbKPDN
	i8rumvi1g7+DYnI1D/BspmBqfCgxB9er8Y1fwsYw8AUAV+0hWKhd3FSAqPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bjptv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22403329f9eso27619465ad.3
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202927; x=1745807727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GANNV6oVj+ynefjA8lZ1Q4dBfFUbWKfBAr9zn5iRes=;
        b=cf1jmbpH0VvhzwKvwzn6ip6NmUhTUgL/BauY7oGee5vq3YCz4R9Ogv9vQVbkLEgLyg
         BNHYrCdvVZZIxl0fXz/wBALzOjQaUuuNSzer+50FMnVsBpcrLUHXY8yxINrZ3n1JDDly
         Em//bcOGvDt8llMAXkfvOdcLLS+Ahnjv3KrIQrQM+ByzjZEBV1M7FfYTPqRrXcuQzq6M
         W27mLHxAW3js5zGPjRFUOj9D/mKPuom+vyuh8wNGcstQrwSefLGURiGvRQqc/FvUts5X
         7AjISWGvpkSSfZ7+aQ8nc3bZkiqi8QQnatXTwp+1ZJagxdcAYD/IwZKauvDga1L1HIbH
         /PBg==
X-Gm-Message-State: AOJu0YywezEQeJKfF+EuyYftH6/H1s9rPTJfPYfQbOPupiqekvGuhyGz
	Ha+D3BPv7orkONN5Ea4pXWGXPQsZrVcC6AUwW6mvAubevPV4I4CGnhp7tyqStmPyWg0DbfSdnCT
	t4IpSouV2Y2EP4Wb+9yhPmbsoH1d4UxnD4jM7x2+GBfvSEGHdlr8FEvClzwIREL7BUJqKDAc=
X-Gm-Gg: ASbGncs1V62O7ndtsB0Q+k9QmEDYZQaEOH5gsyRaZW8+JzOVvpVHVc1BasAzYtwY/UF
	MFwYebHo6u6SsG2IeHnukwyggqGuERdpo3oY+2C/unNtEMbyp5CHylUj+UfU5CKVnPKMQe5ck+o
	HNM4Qi3wBOytI/VAmU4G2i8QyERcSARejP/p8iy9CA+oXZrD/nehsNsR/aZNInEK4Z62W1v/LmI
	HDDSIKBgbMwpu2mZrEMHRfmrNa8HEb5ZZficJP3eFMZzA1zOISxtMYs59LQ3FLt+Lcg2z6FanVH
	DrStGSD+ap17iF6hPBnf9PS1rf2GUx5gw3s91bxYHdjyZiIITWq9coFH83j/a+86H+D1a0fmUxH
	io4KEwQs8vzI=
X-Received: by 2002:a17:903:3c6b:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22c535ac9bfmr162517625ad.28.1745202927513;
        Sun, 20 Apr 2025 19:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRr0smnK1NdojnxpwCSUqg4Dyvf8nrvqRhSYegMFwP0d3YuzIGBYuLA/UYnWSYF2rwwZlnvQ==
X-Received: by 2002:a17:903:3c6b:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22c535ac9bfmr162517345ad.28.1745202927051;
        Sun, 20 Apr 2025 19:35:27 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:26 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 05/13] wifi: ath12k: add interrupt configuration for mon status ring
Date: Mon, 21 Apr 2025 10:34:36 +0800
Message-Id: <20250421023444.1778-6-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6805aef5 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8wUhg8T_1bdp2XeRaFAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5Wzj_2YRFloDVmoW7Bok7uHHXRrMGnxQ
X-Proofpoint-GUID: 5Wzj_2YRFloDVmoW7Bok7uHHXRrMGnxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193533_756731_C1F01197 
X-CRM114-Status: GOOD (  20.02  )
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

The monitor mode design is:
1. Hardware captures packets on the air.
2. Hardware stores the packets into related rings.
3. When the ring buffer reaches the interrupt threshold, it triggers
the interrupt.
4. Reap and process the ring buffer in ath12k_dp_service_srng().

Here the interrupt thresholds are intr_timer_thres_us, low_threshold and
intr_batch_cntr_thres_entries. An interrupt will be triggered once:
1. Number of packets in the ring reaches intr_batch_cntr_thres_entries.
2. Number of packets in the ring reaches low_threshold(by timer).
3. Timer reaches intr_timer_thres_us.

So, add interrupt configuration for the mon status ring, then start
to process ring buffers when the interrupt arrives.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c  | 24 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hw.c  | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/hw.h  |  1 +
 drivers/net/wireless/ath/ath12k/pci.c |  3 ++-
 4 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index ad873013e46c..5eec14a7b1ea 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -168,6 +168,8 @@ static int ath12k_dp_srng_calculate_msi_group(struct ath12k_base *ab,
 		grp_mask = &ab->hw_params->ring_mask->reo_status[0];
 		break;
 	case HAL_RXDMA_MONITOR_STATUS:
+		grp_mask = &ab->hw_params->ring_mask->rx_mon_status[0];
+		break;
 	case HAL_RXDMA_MONITOR_DST:
 		grp_mask = &ab->hw_params->ring_mask->rx_mon_dest[0];
 		break;
@@ -274,12 +276,17 @@ int ath12k_dp_srng_setup(struct ath12k_base *ab, struct dp_srng *ring,
 		break;
 	case HAL_RXDMA_BUF:
 	case HAL_RXDMA_MONITOR_BUF:
-	case HAL_RXDMA_MONITOR_STATUS:
 		params.low_threshold = num_entries >> 3;
 		params.flags |= HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN;
 		params.intr_batch_cntr_thres_entries = 0;
 		params.intr_timer_thres_us = HAL_SRNG_INT_TIMER_THRESHOLD_RX;
 		break;
+	case HAL_RXDMA_MONITOR_STATUS:
+		params.low_threshold = num_entries >> 3;
+		params.flags |= HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN;
+		params.intr_batch_cntr_thres_entries = 1;
+		params.intr_timer_thres_us = HAL_SRNG_INT_TIMER_THRESHOLD_RX;
+		break;
 	case HAL_TX_MONITOR_DST:
 		params.low_threshold = DP_TX_MONITOR_BUF_SIZE_MAX >> 3;
 		params.flags |= HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN;
@@ -919,6 +926,21 @@ int ath12k_dp_service_srng(struct ath12k_base *ab,
 			goto done;
 	}
 
+	if (ab->hw_params->ring_mask->rx_mon_status[grp_id]) {
+		ring_mask = ab->hw_params->ring_mask->rx_mon_status[grp_id];
+		for (i = 0; i < ab->num_radios; i++) {
+			for (j = 0; j < ab->hw_params->num_rxdma_per_pdev; j++) {
+				int id = i * ab->hw_params->num_rxdma_per_pdev + j;
+
+				if (ring_mask & BIT(id)) {
+					/* TODO: add monitor mode function */
+					if (budget <= 0)
+						goto done;
+				}
+			}
+		}
+	}
+
 	if (ab->hw_params->ring_mask->rx_mon_dest[grp_id]) {
 		monitor_mode = ATH12K_DP_RX_MONITOR_MODE;
 		ring_mask = ab->hw_params->ring_mask->rx_mon_dest[grp_id];
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index a46d82857c5d..482b0f4e8f95 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -118,6 +118,10 @@ static const struct ath12k_hw_ops wcn7850_ops = {
 #define ATH12K_TX_MON_RING_MASK_0 0x1
 #define ATH12K_TX_MON_RING_MASK_1 0x2
 
+#define ATH12K_RX_MON_STATUS_RING_MASK_0 0x1
+#define ATH12K_RX_MON_STATUS_RING_MASK_1 0x2
+#define ATH12K_RX_MON_STATUS_RING_MASK_2 0x4
+
 /* Target firmware's Copy Engine configuration. */
 static const struct ce_pipe_config ath12k_target_ce_config_wlan_qcn9274[] = {
 	/* CE0: host->target HTC control and raw streams */
@@ -836,6 +840,12 @@ static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_wcn7850 = {
 	},
 	.rx_mon_dest = {
 	},
+	.rx_mon_status = {
+		0, 0, 0, 0,
+		ATH12K_RX_MON_STATUS_RING_MASK_0,
+		ATH12K_RX_MON_STATUS_RING_MASK_1,
+		ATH12K_RX_MON_STATUS_RING_MASK_2,
+	},
 	.rx = {
 		0, 0, 0,
 		ATH12K_RX_RING_MASK_0,
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 024cfcd2cc15..0fbc17649df4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -135,6 +135,7 @@ enum hal_encrypt_type;
 struct ath12k_hw_ring_mask {
 	u8 tx[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	u8 rx_mon_dest[ATH12K_EXT_IRQ_GRP_NUM_MAX];
+	u8 rx_mon_status[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	u8 rx[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	u8 rx_err[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	u8 rx_wbm_rel[ATH12K_EXT_IRQ_GRP_NUM_MAX];
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 528a4a57d136..5c012f7fcd97 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -600,7 +600,8 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 		    ab->hw_params->ring_mask->rx_wbm_rel[i] ||
 		    ab->hw_params->ring_mask->reo_status[i] ||
 		    ab->hw_params->ring_mask->host2rxdma[i] ||
-		    ab->hw_params->ring_mask->rx_mon_dest[i]) {
+		    ab->hw_params->ring_mask->rx_mon_dest[i] ||
+		    ab->hw_params->ring_mask->rx_mon_status[i]) {
 			num_irq = 1;
 		}
 
-- 
2.34.1


