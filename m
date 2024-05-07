Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7346AC10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=506CAO+iBgTlQnbH2aXPvFgvMayo/gSiLO3W3JeVs+I=; b=MhoegNa90ptfaAn70kJzo41OIt
	824SPft0Z4VxyC98+uQ99wVOgreyDmKuB5tY0/u6gkYq84wpEIKif/cMXNzBk2Ursrm0FEIo0T3m4
	SttFULmIp69fNCsGcsbji+yyWU28qkRtsX8sOGKm9g7oVBCQMNQr+C+qvaHc1GmXKSoD+ky9DWp/C
	FbNPTwsaz2m16a9DB35Qi6irtEZjx0scp/1RY1Nfo3YmCIm5H7Jf4s5mex/lC1xeh1ldITGY9TXl8
	ldcBilj4q05W8FUXW8gscCY3qmz7a9Vx0qVKnpQvto/VdlLyb28iaPMJ0rXhKgU8STcBLm4QP5z/V
	0XLFh/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtV-00000009d08-02UG
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 04:57:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtR-00000009cxc-3t2b
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 04:57:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4473Iku5020657;
	Tue, 7 May 2024 04:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=506CAO+
	iBgTlQnbH2aXPvFgvMayo/gSiLO3W3JeVs+I=; b=mjUV+3QGjMSk7c5XCGicecQ
	iI5mtnEnT75CUMDxNxXVr9HWrpCDL9mvuwMzXwt/mNpmXODnHhYBXs6CRZafgSaf
	+wq4u1r/mJTMEAeg8llleuIYRzzDY5Cw8u4BwrKhNYfTDhkERcuwhOChv8/ttWdX
	UJ+YGOwmbE+um5+ua5H8+ngzB3uKzrpK+6cSutsAKFVFDtgyAHgJSP6BxJqqaIVM
	FUzQUiKQBkqxPHAsgxJXOICJwSKn0dtFhgICdInPvj2ZU8GXhyX1tKxCCTxWRTeK
	5CnyQd2HgPsibYiyiVuY1Mw1jnTA4PDseZTJUFuFUMGE2NCxQsnvx7jM1qZeHWg=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyc9b04nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 04:57:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4474vM9F003603;
	Tue, 7 May 2024 04:57:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3xwe3kn4yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 04:57:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4474vMBU003597;
	Tue, 7 May 2024 04:57:22 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4474vLQd003594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 04:57:22 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 075AF4114D; Tue,  7 May 2024 10:27:21 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v4 2/8] wifi: ath12k: Add helpers to get or set ath12k_hw
Date: Tue,  7 May 2024 10:26:56 +0530
Message-Id: <20240507045702.2858954-3-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507045702.2858954-1-quic_hprem@quicinc.com>
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eW1ZoGKIDx9jTOlBkJBmuwkQEO_sHhU5
X-Proofpoint-ORIG-GUID: eW1ZoGKIDx9jTOlBkJBmuwkQEO_sHhU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=679
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_215734_127937_87DC6135 
X-CRM114-Status: GOOD (  14.29  )
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
---
 drivers/net/wireless/ath/ath12k/core.c |  6 +++---
 drivers/net/wireless/ath/ath12k/core.h | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/mac.c  | 23 +++++++++++++----------
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b7fcdc39f990..217a1081fa94 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -950,7 +950,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	spin_unlock_bh(&ab->base_lock);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -1002,7 +1002,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1041,7 +1041,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 	int i, j;
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3cfc65b36579..c88262276cd9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1058,4 +1058,15 @@ static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
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
index 4f07ac8c0287..ff26cbc63b0a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8886,7 +8886,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
 
 	for (i = 0; i < ab->num_hw; i++) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 
 		ret = ath12k_mac_hw_register(ah);
 		if (ret)
@@ -8897,7 +8897,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -8913,7 +8913,7 @@ void ath12k_mac_unregister(struct ath12k_base *ab)
 	int i;
 
 	for (i = ab->num_hw - 1; i >= 0; i--) {
-		ah = ab->ah[i];
+		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
 
@@ -8971,6 +8971,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 void ath12k_mac_destroy(struct ath12k_base *ab)
 {
 	struct ath12k_pdev *pdev;
+	struct ath12k_hw *ah;
 	int i;
 
 	for (i = 0; i < ab->num_radios; i++) {
@@ -8982,11 +8983,12 @@ void ath12k_mac_destroy(struct ath12k_base *ab)
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
 
@@ -9017,7 +9019,7 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 			goto err;
 		}
 
-		ab->ah[i] = ah;
+		ath12k_ab_set_ah(ab, i, ah);
 	}
 
 	ath12k_dp_pdev_pre_alloc(ab);
@@ -9026,11 +9028,12 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 
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


