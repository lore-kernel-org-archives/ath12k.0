Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C78C25B7C
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei03v/CYUBCQYP94hlE/M/Cli/p1dOmmt2/VlXFAs+k=; b=RlBdxO/4vZD9cCgVkD2J9mlk8k
	HmoIUCWvSalVkyoIgKV4iJXmSw+Vy3icQnxrSPxPlJcmnjoj0C2wRMprHrGCRLbyXv3gZD9FSjy03
	XxacEfVwtnU8A47xAqM61csB//JE5oTQ190yWQr6R50ebejYaK4OT9lFj62izKu5MawfFjXPC0T1b
	nZPyRM3FSWnpr0WdWz1kCEsJsNdkcrVEnzO/CMfvY6s9QVwJE9o3M2hwrQCdQg/L1qojvzYMmzYxN
	fzjhFXqdSOIT9/M+Yq/QLpcBEqT4zbPUAxss2rvhVqgJph4Xd8G+P4I9G8+DuX/UG3cEB0uKo6V51
	TrykmzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvK-0000000E5Vy-1dw1
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 07:37:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvH-0000000E5UB-3edq
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 07:37:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R0pBRE012802
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ei03v/CYUBC
	QYP94hlE/M/Cli/p1dOmmt2/VlXFAs+k=; b=EKEjPTWmL+gdtyXjNk+fOhrlPHN
	iXC30wGRYfnm1ApBtGLeLmBT0CxTwz44RSphJB9psuSpiO9Oc6y24Ls9XKi5LTMy
	zkJgQNLqQE92rjfvOu02kZ1+DtqYJ/V+pI8yMev6w8o5dtzRyq93Pik8KdNU6FO0
	XEUkLNglvZs0bLB20DIFgNNuCxTH6c88aguAWJdCB0C4v3YQKuUF6Hiq9Mo84vhe
	frnz/RFoY2ZkEIm3boPNwbEYHTROxjtormaTqEuMadUJwqzkYMbkCnTcCUnvAU+A
	TPNmknzFg+vUCXwu9pWy3ohx0B4NdtUW9tgUhKXsznrth1ooWc/f/PvHBnQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h2van-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44R7UIOm010620
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3yb92k9asg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44R7bVIm017215
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:31 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44R7bVcA017214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 07:37:31 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 793984114B; Mon, 27 May 2024 13:07:30 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v6 2/8] wifi: ath12k: Add helpers to get or set ath12k_hw
Date: Mon, 27 May 2024 13:07:17 +0530
Message-Id: <20240527073723.2520319-3-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073723.2520319-1-quic_hprem@quicinc.com>
References: <20240527073723.2520319-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wrwwyp_XIs7ZP0y0fyt7Cx2Hw866Zla8
X-Proofpoint-ORIG-GUID: Wrwwyp_XIs7ZP0y0fyt7Cx2Hw866Zla8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=694 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_003735_947491_BAAC06E3 
X-CRM114-Status: GOOD (  14.90  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, one or more ath12k_hw is part of a device (ath12k_base) but
in future, it would be part of device group abstraction (ath12k_hw_group),
i.e., when multiple radios (ar) across different devices can be combined
together in a device group (ath12k_hw_group).

In order to facilitate the above transition, introduce helpers such as
ath12k_ab_to_ah() and ath12k_ab_set_ah() to get and set values of ath12k_hw
respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  6 +++---
 drivers/net/wireless/ath/ath12k/core.h | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/mac.c  | 23 +++++++++++++----------
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 342d0ab12105..3925bb70d479 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -947,7 +947,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	spin_unlock_bh(&ab->base_lock);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -999,7 +999,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1038,7 +1038,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 	int i, j;
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7d20b09c52e6..3f5c9fa9d04c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1051,4 +1051,15 @@ static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
 #define for_each_ar(ah, ar, index) \
 	for ((index) = 0; ((index) < (ah)->num_radio && \
 	     ((ar) = &(ah)->radio[(index)])); (index)++)
+
+static inline struct ath12k_hw *ath12k_ab_to_ah(struct ath12k_base *ab, int idx)
+{
+	return ab->ah[idx];
+}
+
+static inline void ath12k_ab_set_ah(struct ath12k_base *ab, int idx,
+				    struct ath12k_hw *ah)
+{
+	ab->ah[idx] = ah;
+}
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 784964ae03ec..f8e8320b8598 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9158,7 +9158,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 
 		ret = ath12k_mac_hw_register(ah);
 		if (ret)
@@ -9169,7 +9169,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -9185,7 +9185,7 @@ void ath12k_mac_unregister(struct ath12k_base *ab)
 	int i;
 
 	for (i = ab->num_hw - 1; i >= 0; i--) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -9243,6 +9243,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 void ath12k_mac_destroy(struct ath12k_base *ab)
 {
 	struct ath12k_pdev *pdev;
+	struct ath12k_hw *ah;
 	int i;
 
 	for (i = 0; i < ab->num_radios; i++) {
@@ -9254,11 +9255,12 @@ void ath12k_mac_destroy(struct ath12k_base *ab)
 	}
 
 	for (i = 0; i < ab->num_hw; i++) {
-		if (!ab->ah[i])
+		ah = ath12k_ab_to_ah(ab, i);
+		if (!ah)
 			continue;
 
-		ath12k_mac_hw_destroy(ab->ah[i]);
-		ab->ah[i] = NULL;
+		ath12k_mac_hw_destroy(ah);
+		ath12k_ab_set_ah(ab, i, NULL);
 	}
 }
 
@@ -9289,7 +9291,7 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 			goto err;
 		}
 
-		ab->ah[i] = ah;
+		ath12k_ab_set_ah(ab, i, ah);
 	}
 
 	ath12k_dp_pdev_pre_alloc(ab);
@@ -9298,11 +9300,12 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		if (!ab->ah[i])
+		ah = ath12k_ab_to_ah(ab, i);
+		if (!ah)
 			continue;
 
-		ath12k_mac_hw_destroy(ab->ah[i]);
-		ab->ah[i] = NULL;
+		ath12k_mac_hw_destroy(ah);
+		ath12k_ab_set_ah(ab, i, NULL);
 	}
 
 	return ret;
-- 
2.34.1


