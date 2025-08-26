Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3625ACA0EFA
	for <ath12k@archiver.kernel.org>; Tue, 26 Aug 2025 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CNCV9qaRum1DYnlFliK7Vi8YJ+RutKRZ8GpCrZR+NPs=; b=rsHmKIytgj14enqd5rADXm1vuC
	syVSfJ0mfs5HuJMSMavoo00yLnRJBWbxEBhrQuAhrG8bJzFIj7njY4b41PxiN8rDphwvQO/zKKFKn
	Z70yIQHafSm1sWjFGAubtI48K0LAJf3TCMG/M2Z8BFfmcHEdunctlP+uQZL6BJCNPmWGc/MyxiiDo
	ot12DWMIttk/kmJn7OrNVRsfusgeQXomqqc1+/e3jCw/clGNLyZEW+vzfUXKI+lF89HxXk2EU93wy
	sas6GWHmi2dQEJV4+3Y0W3XazHs1OV8bxOjJXTylk+kPnLT5UHNafyILE1tohssydsPfPudrqjuWN
	WIAXS/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqs6x-0000000BpqY-3TJ8;
	Tue, 26 Aug 2025 11:45:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrMz-0000000BgyH-0GLy
	for ath12k@lists.infradead.org;
	Tue, 26 Aug 2025 10:57:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q3BHcV006924;
	Tue, 26 Aug 2025 10:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CNCV9qaRum1DYnlFliK7Vi
	8YJ+RutKRZ8GpCrZR+NPs=; b=LM6K0fbKk5RQXJnQU95+EEXNrUKA62/h9X/RWQ
	q0nzQYUXsT9Mo5d/qKkaR8llGRWV8Mq+nWoMDWKt8/JDuXw8yweNe5WlJlBlEx+x
	tmP49sf0BTS2j4WTbL2maUjSCDV6ZZtS95RMr1drv1h3hokTM7gHa6W3X/iOQsJC
	p7rVt/Orw5Yp929Ub7gLkaBzf0H2AwGJVnH+uvgKk8vTs8QpMA/5DsPyPHRMIDPQ
	Wa6Ph4Zeb+Sq2EF8EP2RQgEyk004BeVCEhTP1dVwRWDTDnjK/u7gJaAouX1YqxbR
	9Gu8gwnzyVHJ0uUfFA2UVtuFn6RUXpzgYXfftTxsOxNw+UAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unrdgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:57:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QAvcYC016785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:57:38 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 03:57:36 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Add support to set per-radio RTS threshold
Date: Tue, 26 Aug 2025 16:27:14 +0530
Message-ID: <20250826105714.1188131-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lNygKB7uvdxxT_zhtJmJFqPGOm7trupf
X-Proofpoint-ORIG-GUID: lNygKB7uvdxxT_zhtJmJFqPGOm7trupf
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ad9323 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=3yoqSv9YOmdF3HXSz3sA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXwddZ9UYMMMai
 jXI2AmaxOb7NhmvEkP74RYTD5Dg/NJAFUrGBGF6zrtaGk4ufvmtVeJB1jonlRz4455yUncCsXBn
 P2ooXgQwXR1yOE8koBnFCLVprXUSrh1Rg+7in4syjA7TLbOoTv36SCmXEaqUJ3dKrZ4v1v76fKh
 NcWxQp3fBjkIczg/yTXlbIzwUuKH7KCy1RqtgHpmMidHs4yE1CaqsFZg5ek7mb00HwG2w7tBieh
 OPedUrEsgjKmt00P/oFHjXS9rEbIV6BLyqDsS9b862WgPoS0owVGZyCiewhBbDOpzatMJuCpR7+
 j1UvLEy4nwDGjWtin3xz/4NI3XD/UotM+/24+pRjq+l6DvEKCEd9CBdaxNFczBvwBnnw5Z1jdlK
 ujAvvioW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_035741_226332_2B205799 
X-CRM114-Status: GOOD (  21.75  )
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

Currently, command to set RTS threshold makes changes to the threshold of
all radios in the multi-radio wiphy. But each radio in a multi-radio wiphy
can have different RTS threshold requirements.

To support this requirement, use the index of radio for which the RTS
threshold needs to be changed from mac80211 - radio_idx. Based on the value
passed, set the RTS threshold value for the corresponding radios. Following
are the possible values of radio_idx and the corresponding behavior in
multi-radio wiphys:
 1. radio_idx is -1: consider RTS threshold as a global parameter, i.e.,
    make changes to all the radios in a wiphy. If setting RTS threshold
    fails for any radio, then the previous RTS threshold values of
    respective radios will be restored.
 2. radio_idx denotes a specific radio: make changes in RTS threshold to
    that radio alone.
 3. radio_idx is any other number: report it as an invalid number.

In case of single-radio wiphys, continue with the existing behavior, i.e.,
set the passed RTS threshold value to the radio present.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  3 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 50 ++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 519f826f56c8..da7e99f2ca0b 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_CORE_H
@@ -730,6 +730,7 @@ struct ath12k {
 	u32 txpower_scale;
 	u32 power_scale;
 	u32 chan_tx_pwr;
+	u32 rts_threshold;
 	u32 num_stations;
 	u32 max_num_stations;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd1ec3b2c084..c0e0423464e3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <net/mac80211.h>
@@ -9848,6 +9848,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 	param_id = WMI_VDEV_PARAM_RTS_THRESHOLD;
 	param_value = hw->wiphy->rts_threshold;
+	ar->rts_threshold = param_value;
 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 					    param_id, param_value);
 	if (ret) {
@@ -11675,16 +11676,32 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw,
 					   int radio_idx, u32 value)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct wiphy *wiphy = hw->wiphy;
 	struct ath12k *ar;
-	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret = 0, i;
+	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD;
+	int ret = 0, ret_err, i;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	/* Currently we set the rts threshold value to all the vifs across
-	 * all radios of the single wiphy.
-	 * TODO Once support for vif specific RTS threshold in mac80211 is
-	 * available, ath12k can make use of it.
-	 */
+	if (radio_idx >= wiphy->n_radio || radio_idx < -1)
+		return -EINVAL;
+
+	if (radio_idx != -1) {
+		/* Update RTS threshold in specified radio */
+		ar = ath12k_ah_to_ar(ah, radio_idx);
+		ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
+		if (ret) {
+			ath12k_warn(ar->ab,
+				    "failed to set RTS config for all vdevs of pdev %d",
+				    ar->pdev->pdev_id);
+			return ret;
+		}
+
+		ar->rts_threshold = value;
+		return 0;
+	}
+
+	/* Radio_index passed is -1, so set RTS threshold for all radios. */
 	for_each_ar(ah, ar, i) {
 		ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
 		if (ret) {
@@ -11693,6 +11710,25 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw,
 			break;
 		}
 	}
+	if (!ret) {
+		/* Setting new RTS threshold for vdevs of all radios passed, so update
+		 * the RTS threshold value for all radios
+		 */
+		for_each_ar(ah, ar, i)
+			ar->rts_threshold = value;
+		return 0;
+	}
+
+	/* RTS threshold config failed, revert to the previous RTS threshold */
+	for (i = i - 1; i >= 0; i--) {
+		ar = ath12k_ah_to_ar(ah, i);
+		ret_err = ath12k_set_vdev_param_to_all_vifs(ar, param_id,
+							    ar->rts_threshold);
+		if (ret_err)
+			ath12k_warn(ar->ab,
+				    "failed to restore RTS threshold for all vdevs of pdev %d",
+				    ar->pdev->pdev_id);
+	}
 
 	return ret;
 }

base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028
-- 
2.25.1


