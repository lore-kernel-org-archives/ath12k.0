Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA15CCCD187
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu3KGIDscAwhEzDbTLctfTIhfENEwbCDmrjyo6yI2Ns=; b=WyHcx1Fh+Cdm8HgTrHDpcBYp1b
	1F38BAE46W/rK41WwcqZPQ4ToINkHMwTaPhRKle2q3lKojD6HDXyGezF7cxs7CTxnnzAKZ9MIgJ5B
	GTrRUvbA44wNmwqORXWH+bkFXIKDz2DBGEWDsgT1r6tfhGVU4xgg0Gl5Vu4VHLNqaSZmpk7VZ6PTr
	gVWce3NosfM6E9vJmia/79J6naLzrPIT8uIKN7qggpumkDUBVZ4G644NPAHVoOfRQUDOzbXYpMBdN
	K5LAHJWikERrKMyqMdUeFu+awp5oF4UXgK2pTsVFwn2TDsEO6Adw0fTWiut9iv1+GDl3Nw7qrYpK1
	G4rxqUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oYI-00000005unk-1oi6;
	Thu, 09 Oct 2025 11:11:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oYF-00000005ulC-3joU
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 11:11:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996FOxo014054;
	Thu, 9 Oct 2025 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vu3KGIDscAwhEzDbTLctfTIhfENEwbCDmrjyo6yI2Ns=; b=ox6X445OHQJW07Xk
	P0ZGRWuW9X49weFFrqbmVzduzKKhxlEJSiqMvPqp90KxDu3MYpQDnIFjZQC2xnp3
	KPO+wXUYrYlycgotiC2WpvaAJc5peCp6i4YdHSklrD7bQsqIkWcu8NqDUjuQVkDc
	+1MG6hSdha30DZo1Oh097Xd5apa5l8gjKNvn+/uk9pYcMW322vKNu6Z+EFlEVL7i
	0CAqjzLMuIF0dW5uEyOxSd9eBGl5YIVc1CvRa5fqg/ffdBgm946M3XU2zIKh7WXM
	vvF+gE5N2AjIGVDXqfEtvRdVvekjMEsJh60E0qBtDJ7m1r/aAM9mAsBiYTqkNjr9
	axs9hQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kjhrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 11:11:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599BBE1h011066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 11:11:14 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 9 Oct 2025 04:11:13 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 09/18] wifi: ath12k: Move HAL SRNG shadow config and get ring id APIs to wifi7 directory
Date: Thu, 9 Oct 2025 16:40:36 +0530
Message-ID: <20251009111045.1763001-10-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
References: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e79853 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=geYsRcAEZK8K0mnbX_QA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2uz1Nqgjtbl2iFes-l5DvKErBd6y0HbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1i0G43vsFGDM
 vT3iPucffS2Dp6OoFm8/HNWqBey1BcsrI+ooXQAaGtokc88PC7if5RmdJJa8EINafdVBx1oswDi
 nFkPiSCXs9Zn/x2aW1W6IqTmA8nkKuxyB06pYH1Prl+j3R/NJig3eJUuAHonwDhG0Mmsc11qQVJ
 k7JhnzJBgbyPocjnnuJi2NU5NJfu0l4D1RAgbrCXlCMWIKdUVL9IVJm9yAOVwUZQWDn1dXoqf4/
 Rqxal7yx6vm0YoQWP6/W+YsIk+1oWOXecavZeKmoTravlNpZzVvB8HqMv8BrL2u2WA8dM03r2sA
 H3cVcllFypW3N2kxaX3ieWtpT+NhTFJhM5fR71CsL8H06XvHvrwta6F+YY+r4hS/E8Ztpl1dRb+
 9m704L+6ib1KiZOy8rL0nOO+upgoJA==
X-Proofpoint-ORIG-GUID: 2uz1Nqgjtbl2iFes-l5DvKErBd6y0HbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_041115_941165_69EF9DC9 
X-CRM114-Status: GOOD (  17.71  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Move the hardware specific HAL APIs to hal.c file
inside wifi7 directory. These APIs will be called
through the hal_ops mechanism, which are registered
separately by qcn and wcn

Handling following APIs:
ath12k_wifi7_hal_srng_update_shadow_config
ath12k_wifi7_hal_srng_get_ring_id

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c         | 101 +++---------------
 drivers/net/wireless/ath/ath12k/hal.h         |   5 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.c   |  86 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h   |   6 ++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |   2 +
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |   2 +
 6 files changed, 117 insertions(+), 85 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 67a7285dc769..d4dd83d9e67f 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -36,6 +36,21 @@ static void ath12k_hal_set_umac_srng_ptr_addr(struct ath12k_base *ab,
 	ab->hal.hal_ops->set_umac_srng_ptr_addr(ab, srng);
 }
 
+static int ath12k_hal_srng_get_ring_id(struct ath12k_hal *hal,
+				       enum hal_ring_type type,
+				       int ring_num, int mac_id)
+{
+	return hal->hal_ops->srng_get_ring_id(hal, type, ring_num, mac_id);
+}
+
+int ath12k_hal_srng_update_shadow_config(struct ath12k_base *ab,
+					 enum hal_ring_type ring_type,
+					 int ring_num)
+{
+	return ab->hal.hal_ops->srng_update_shadow_config(ab, ring_type,
+							  ring_num);
+}
+
 static int ath12k_hal_alloc_cont_rdp(struct ath12k_hal *hal)
 {
 	size_t size;
@@ -97,28 +112,6 @@ static void ath12k_hal_srng_hw_init(struct ath12k_base *ab,
 		ath12k_hal_srng_dst_hw_init(ab, srng);
 }
 
-static int ath12k_hal_srng_get_ring_id(struct ath12k_base *ab,
-				       enum hal_ring_type type,
-				       int ring_num, int mac_id)
-{
-	struct hal_srng_config *srng_config = &ab->hal.srng_config[type];
-	int ring_id;
-
-	if (ring_num >= srng_config->max_rings) {
-		ath12k_warn(ab, "invalid ring number :%d\n", ring_num);
-		return -EINVAL;
-	}
-
-	ring_id = srng_config->start_ring_id + ring_num;
-	if (srng_config->mac_type == ATH12K_HAL_SRNG_PMAC)
-		ring_id += mac_id * HAL_SRNG_RINGS_PER_PMAC;
-
-	if (WARN_ON(ring_id >= HAL_SRNG_RING_ID_MAX))
-		return -EINVAL;
-
-	return ring_id;
-}
-
 int ath12k_hal_srng_get_entrysize(struct ath12k_base *ab, u32 ring_type)
 {
 	struct hal_srng_config *srng_config;
@@ -619,7 +612,7 @@ int ath12k_hal_srng_setup(struct ath12k_base *ab, enum hal_ring_type type,
 	u32 idx;
 	int i;
 
-	ring_id = ath12k_hal_srng_get_ring_id(ab, type, ring_num, mac_id);
+	ring_id = ath12k_hal_srng_get_ring_id(hal, type, ring_num, mac_id);
 	if (ring_id < 0)
 		return ring_id;
 
@@ -706,68 +699,6 @@ int ath12k_hal_srng_setup(struct ath12k_base *ab, enum hal_ring_type type,
 	return ring_id;
 }
 
-static void ath12k_hal_srng_update_hp_tp_addr(struct ath12k_base *ab,
-					      int shadow_cfg_idx,
-					      enum hal_ring_type ring_type,
-					      int ring_num)
-{
-	struct hal_srng *srng;
-	struct ath12k_hal *hal = &ab->hal;
-	int ring_id;
-	struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
-
-	ring_id = ath12k_hal_srng_get_ring_id(ab, ring_type, ring_num, 0);
-	if (ring_id < 0)
-		return;
-
-	srng = &hal->srng_list[ring_id];
-
-	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
-		srng->u.dst_ring.tp_addr = (u32 *)(HAL_SHADOW_REG(shadow_cfg_idx) +
-						   (unsigned long)ab->mem);
-	else
-		srng->u.src_ring.hp_addr = (u32 *)(HAL_SHADOW_REG(shadow_cfg_idx) +
-						   (unsigned long)ab->mem);
-}
-
-int ath12k_hal_srng_update_shadow_config(struct ath12k_base *ab,
-					 enum hal_ring_type ring_type,
-					 int ring_num)
-{
-	struct ath12k_hal *hal = &ab->hal;
-	struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
-	int shadow_cfg_idx = hal->num_shadow_reg_configured;
-	u32 target_reg;
-
-	if (shadow_cfg_idx >= HAL_SHADOW_NUM_REGS)
-		return -EINVAL;
-
-	hal->num_shadow_reg_configured++;
-
-	target_reg = srng_config->reg_start[HAL_HP_OFFSET_IN_REG_START];
-	target_reg += srng_config->reg_size[HAL_HP_OFFSET_IN_REG_START] *
-		ring_num;
-
-	/* For destination ring, shadow the TP */
-	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
-		target_reg += HAL_OFFSET_FROM_HP_TO_TP;
-
-	hal->shadow_reg_addr[shadow_cfg_idx] = target_reg;
-
-	/* update hp/tp addr to hal structure*/
-	ath12k_hal_srng_update_hp_tp_addr(ab, shadow_cfg_idx, ring_type,
-					  ring_num);
-
-	ath12k_dbg(ab, ATH12K_DBG_HAL,
-		   "target_reg %x, shadow reg 0x%x shadow_idx 0x%x, ring_type %d, ring num %d",
-		  target_reg,
-		  HAL_SHADOW_REG(shadow_cfg_idx),
-		  shadow_cfg_idx,
-		  ring_type, ring_num);
-
-	return 0;
-}
-
 void ath12k_hal_srng_shadow_config(struct ath12k_base *ab)
 {
 	struct ath12k_hal *hal = &ab->hal;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 32c6a7d5ea99..774322f1f670 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1702,6 +1702,11 @@ struct hal_ops {
 				       struct hal_srng *srng);
 	void (*srng_src_hw_init)(struct ath12k_base *ab, struct hal_srng *srng);
 	void (*srng_dst_hw_init)(struct ath12k_base *ab, struct hal_srng *srng);
+	int (*srng_update_shadow_config)(struct ath12k_base *ab,
+					 enum hal_ring_type ring_type,
+					 int ring_num);
+	int (*srng_get_ring_id)(struct ath12k_hal *hal, enum hal_ring_type type,
+				int ring_num, int mac_id);
 };
 
 u32 ath12k_wifi7_hal_reo_qdesc_size(u32 ba_window_size, u8 tid);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index 2b81d70e60df..565f43a30deb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -333,3 +333,89 @@ void ath12k_wifi7_hal_set_umac_srng_ptr_addr(struct ath12k_base *ab,
 		}
 	}
 }
+
+int ath12k_wifi7_hal_srng_get_ring_id(struct ath12k_hal *hal,
+				      enum hal_ring_type type,
+				      int ring_num, int mac_id)
+{
+	struct hal_srng_config *srng_config = &hal->srng_config[type];
+	int ring_id;
+
+	if (ring_num >= srng_config->max_rings) {
+		ath12k_warn(hal, "invalid ring number :%d\n", ring_num);
+		return -EINVAL;
+	}
+
+	ring_id = srng_config->start_ring_id + ring_num;
+	if (srng_config->mac_type == ATH12K_HAL_SRNG_PMAC)
+		ring_id += mac_id * HAL_SRNG_RINGS_PER_PMAC;
+
+	if (WARN_ON(ring_id >= HAL_SRNG_RING_ID_MAX))
+		return -EINVAL;
+
+	return ring_id;
+}
+
+static
+void ath12k_wifi7_hal_srng_update_hp_tp_addr(struct ath12k_base *ab,
+					     int shadow_cfg_idx,
+					     enum hal_ring_type ring_type,
+					     int ring_num)
+{
+	struct hal_srng *srng;
+	struct ath12k_hal *hal = &ab->hal;
+	int ring_id;
+	struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
+
+	ring_id = ath12k_wifi7_hal_srng_get_ring_id(hal, ring_type, ring_num,
+						    0);
+	if (ring_id < 0)
+		return;
+
+	srng = &hal->srng_list[ring_id];
+
+	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
+		srng->u.dst_ring.tp_addr = (u32 *)(HAL_SHADOW_REG(shadow_cfg_idx) +
+						   (unsigned long)ab->mem);
+	else
+		srng->u.src_ring.hp_addr = (u32 *)(HAL_SHADOW_REG(shadow_cfg_idx) +
+						   (unsigned long)ab->mem);
+}
+
+int ath12k_wifi7_hal_srng_update_shadow_config(struct ath12k_base *ab,
+					       enum hal_ring_type ring_type,
+					       int ring_num)
+{
+	struct ath12k_hal *hal = &ab->hal;
+	struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
+	int shadow_cfg_idx = hal->num_shadow_reg_configured;
+	u32 target_reg;
+
+	if (shadow_cfg_idx >= HAL_SHADOW_NUM_REGS)
+		return -EINVAL;
+
+	hal->num_shadow_reg_configured++;
+
+	target_reg = srng_config->reg_start[HAL_HP_OFFSET_IN_REG_START];
+	target_reg += srng_config->reg_size[HAL_HP_OFFSET_IN_REG_START] *
+		ring_num;
+
+	/* For destination ring, shadow the TP */
+	if (srng_config->ring_dir == HAL_SRNG_DIR_DST)
+		target_reg += HAL_OFFSET_FROM_HP_TO_TP;
+
+	hal->shadow_reg_addr[shadow_cfg_idx] = target_reg;
+
+	/* update hp/tp addr to hal structure*/
+	ath12k_wifi7_hal_srng_update_hp_tp_addr(ab, shadow_cfg_idx, ring_type,
+						ring_num);
+
+	ath12k_dbg(ab, ATH12K_DBG_HAL,
+		   "target_reg %x, shadow reg 0x%x shadow_idx 0x%x, ring_type %d, ring num %d",
+		  target_reg,
+		  HAL_SHADOW_REG(shadow_cfg_idx),
+		  shadow_cfg_idx,
+		  ring_type, ring_num);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 044ed1dce323..1ea7b025ed71 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -16,4 +16,10 @@ void ath12k_wifi7_hal_srng_src_hw_init(struct ath12k_base *ab,
 				       struct hal_srng *srng);
 void ath12k_wifi7_hal_set_umac_srng_ptr_addr(struct ath12k_base *ab,
 					     struct hal_srng *srng);
+int ath12k_wifi7_hal_srng_update_shadow_config(struct ath12k_base *ab,
+					       enum hal_ring_type ring_type,
+					       int ring_num);
+int ath12k_wifi7_hal_srng_get_ring_id(struct ath12k_hal *hal,
+				      enum hal_ring_type type,
+				      int ring_num, int mac_id);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 070e28a38a70..92769a525c6d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -1004,5 +1004,7 @@ const struct hal_ops hal_qcn9274_ops = {
 	.srng_src_hw_init = ath12k_wifi7_hal_srng_src_hw_init,
 	.srng_dst_hw_init = ath12k_wifi7_hal_srng_dst_hw_init,
 	.set_umac_srng_ptr_addr = ath12k_wifi7_hal_set_umac_srng_ptr_addr,
+	.srng_update_shadow_config = ath12k_wifi7_hal_srng_update_shadow_config,
+	.srng_get_ring_id = ath12k_wifi7_hal_srng_get_ring_id,
 };
 EXPORT_SYMBOL(hal_qcn9274_ops);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 9d1f94db60bd..a941bb4783ae 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -819,5 +819,7 @@ const struct hal_ops hal_wcn7850_ops = {
 	.srng_src_hw_init = ath12k_wifi7_hal_srng_src_hw_init,
 	.srng_dst_hw_init = ath12k_wifi7_hal_srng_dst_hw_init,
 	.set_umac_srng_ptr_addr = ath12k_wifi7_hal_set_umac_srng_ptr_addr,
+	.srng_update_shadow_config = ath12k_wifi7_hal_srng_update_shadow_config,
+	.srng_get_ring_id = ath12k_wifi7_hal_srng_get_ring_id,
 };
 EXPORT_SYMBOL(hal_wcn7850_ops);
-- 
2.34.1


