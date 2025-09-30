Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA95CCA468
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yln7dO4iJNJGxI8za3vnDZvBr8+fJN+1cFdtJzHRshY=; b=wCgY6uFjrpwLop1i68F2WDsXrb
	6Z1MFQmy89ZDQZJ+1YvwI5gJroUBU2O0XcbLKOTf5fXHr9hMTNTHcfeqKXninaB0346bRLJegUZ/h
	PyAxGwtyubUOsV+GBDufSGeN2YFvpzB/y3Kw//Tumpcf/EYGst9hbIYmGcHTh8BokCovf3yQilsz0
	t5mL2V65/gN+kqHssEYU4VskmKodycs2wpjTh5GesoUHs8rFb1xtGAgmKmAvqi5bBDiT/sKQxyu0f
	h2PCjsBvGewwMRWlWkqsit8x+SFxCYINOl6GzGMpnOVZMRA7VlPrL3t7FJyFrrfchE4KtL2f42Skh
	IsMqcWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3a7j-00000005M8R-0EwY;
	Tue, 30 Sep 2025 13:10:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3a7g-00000005M6q-2hlA
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 13:10:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UChiq9027458;
	Tue, 30 Sep 2025 13:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yln7dO4iJNJGxI8za3vnDZvBr8+fJN+1cFdtJzHRshY=; b=CSpOl2la81sVxGvb
	zrPvmrm1N8TrTPgGo+wMiqeEAqN6+DxEl6MKHlqaDzF7o7x3Rvt8+JjS6FF4Hzeb
	4vmBT8ZDmM/1LV1GDRrf1iY12YTA+C+LfgS+2lHQZBRmNkQWkr7X/FE4n3slbulN
	Dlu1bRt9Yx2onjzbbq6vFmVBM0q4YbXnWTm2qiOownqJPiNu4iTlkxwfKSJFcH1+
	qrxZxjRiARdgEHJ66iYj9r4ykfSP7TbuGYxTajBE+mIZbsMUua4g3LjPA4mL/7f5
	z+ONJ3x4fR7D6R5G9ccGU1c8AjvvrfR7w55KkxMbKqz2qJv4+NVUS6WQXuV+KOLK
	XeY9sQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851gxtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 13:10:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58UDARr5007717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 13:10:27 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 30 Sep 2025 06:10:26 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng v4 5/6] wifi: ath12k: Add framework for hardware specific DP interrupt handler
Date: Tue, 30 Sep 2025 18:40:04 +0530
Message-ID: <20250930131005.2884253-6-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
References: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dbd6c4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=qyWg75-0Mf4LNtTtF2YA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX5i5saPiO0NjY
 Or2jrHZACEPkxnoYM8SeD2a+XVlJ4D92O6V/flNFyEQuLfpA4vKXU/XyqCEVCM9OVPVAiUAKNnW
 O64IShbUWm/haDhl1+97ECEppwKDb/ia7YaPx1vzIzmUU/mcFBF7AJvCDrtXo7x93/u2Wt4WXjH
 plfpvMQfxfDpO1OEMhanLR1yA8v5QzPBc9N3SQw/BRjJ0JOCrd7+glPoxYL2aej/Dl3eIIw6enb
 rx4QoCT/MidPwTpePdSTalboGdDwhaiX77Ld7zGVkTX5h6722AAb04WRfWzuTBTxGV/RVlSiDTy
 bDVgIaBRFHMf7+wRtM68eDy18VSiH2NFMQfK7oMLFTEnEjKc5obt5lEHTWXcdtuwn7sdF/VOmYH
 fFN8yDfC4bPP4RE9WIomrX8uFtRYnw==
X-Proofpoint-ORIG-GUID: 1szZPfDkrOpuG5QyQcFdGFWuIr-rdCeQ
X-Proofpoint-GUID: 1szZPfDkrOpuG5QyQcFdGFWuIr-rdCeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_061028_689870_C5952D8C 
X-CRM114-Status: GOOD (  17.52  )
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

Currently, the DP service SRNG handler is invoked directly from the NAPI
poll handler, which prevents using different handlers for different
architectures. To fix this, introduce a DP architecture-ops table to
invoke architecture specific handler from NAPI poll handler. Future patches
will leverage this framework to invoke architecture-specific handlers from
common code.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c      |  3 ++-
 drivers/net/wireless/ath/ath12k/dp.h       | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.c      |  3 ++-
 drivers/net/wireless/ath/ath12k/wifi7/dp.c | 13 ++++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp.h |  2 --
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index c545bea18935..7eb8dedaa947 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -525,9 +525,10 @@ static int ath12k_ahb_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 						struct ath12k_ext_irq_grp,
 						napi);
 	struct ath12k_base *ab = irq_grp->ab;
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	int work_done;
 
-	work_done = ath12k_wifi7_dp_service_srng(ab, irq_grp, budget);
+	work_done = ath12k_dp_service_srng(dp, irq_grp, budget);
 	if (work_done < budget) {
 		napi_complete_done(napi, work_done);
 		ath12k_ahb_ext_grp_enable(irq_grp);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 05f48b461774..546f73e46c41 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -367,6 +367,15 @@ struct ath12k_link_stats {
 	u32 tx_desc_type[HAL_TCL_DESC_TYPE_MAX];
 };
 
+/* DP arch ops to communicate from common module
+ * to arch specific module
+ */
+struct ath12k_dp_arch_ops {
+	int (*service_srng)(struct ath12k_dp *dp,
+			    struct ath12k_ext_irq_grp *irq_grp,
+			    int budget);
+};
+
 struct ath12k_dp {
 	struct ath12k_base *ab;
 	u32 mon_dest_ring_stuck_cnt;
@@ -430,6 +439,8 @@ struct ath12k_dp {
 
 	struct ath12k_hw_group *ag;
 	u8 device_id;
+
+	struct ath12k_dp_arch_ops *ops;
 };
 
 static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
@@ -444,6 +455,13 @@ ath12k_dp_hw_grp_to_dp(struct ath12k_dp_hw_group *dp_hw_grp, u8 device_id)
 	return dp_hw_grp->dp[device_id];
 }
 
+static inline int
+ath12k_dp_service_srng(struct ath12k_dp *dp, struct ath12k_ext_irq_grp *irq_grp,
+		       int budget)
+{
+	return dp->ops->service_srng(dp, irq_grp, budget);
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_cc_config(struct ath12k_base *ab);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 672cf2899681..6925abed190a 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -479,10 +479,11 @@ static int ath12k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 						struct ath12k_ext_irq_grp,
 						napi);
 	struct ath12k_base *ab = irq_grp->ab;
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	int work_done;
 	int i;
 
-	work_done = ath12k_wifi7_dp_service_srng(ab, irq_grp, budget);
+	work_done = ath12k_dp_service_srng(dp, irq_grp, budget);
 	if (work_done < budget) {
 		napi_complete_done(napi, work_done);
 		for (i = 0; i < irq_grp->num_irq; i++)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
index adc3480b282b..4465a9e93bf8 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -13,10 +13,11 @@
 #include "dp.h"
 #include "dp_tx.h"
 
-int ath12k_wifi7_dp_service_srng(struct ath12k_base *ab,
-				 struct ath12k_ext_irq_grp *irq_grp,
-				 int budget)
+static int ath12k_wifi7_dp_service_srng(struct ath12k_dp *dp,
+					struct ath12k_ext_irq_grp *irq_grp,
+					int budget)
 {
+	struct ath12k_base *ab = dp->ab;
 	struct napi_struct *napi = &irq_grp->napi;
 	int grp_id = irq_grp->grp_id;
 	int work_done = 0;
@@ -134,6 +135,10 @@ int ath12k_wifi7_dp_service_srng(struct ath12k_base *ab,
 	return tot_work_done;
 }
 
+static struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
+	.service_srng = ath12k_wifi7_dp_service_srng,
+};
+
 /* TODO: remove export once this file is built with wifi7 ko */
 struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab)
 {
@@ -148,6 +153,8 @@ struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab)
 	dp->dev = ab->dev;
 	dp->hw_params = ab->hw_params;
 
+	dp->ops = &ath12k_wifi7_dp_arch_ops;
+
 	return dp;
 }
 EXPORT_SYMBOL(ath12k_wifi7_dp_device_alloc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.h b/drivers/net/wireless/ath/ath12k/wifi7/dp.h
index 2300fda65786..72fdfb368c99 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.h
@@ -13,8 +13,6 @@
 struct ath12k_base;
 struct ath12k_dp;
 
-int ath12k_wifi7_dp_service_srng(struct ath12k_base *ab,
-				 struct ath12k_ext_irq_grp *irq_grp, int budget);
 struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab);
 void ath12k_wifi7_dp_device_free(struct ath12k_dp *dp);
 
-- 
2.34.1


