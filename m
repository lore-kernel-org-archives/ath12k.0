Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59EBC2BBCA
	for <ath12k@archiver.kernel.org>; Fri, 28 Jun 2024 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dekaps9oFogcEKDa7jpmS968SeNyOL1iWhUKfbeTCV8=; b=Nm3XQTvzYjxmpOJJjr+KiXSkKh
	F1+F1X34WB9VKlxDXPo4j5gr+liE+psby2+xDUknwE+srpksoT1g/d0BR21kNphTGLFojVC7V+wqq
	hDOQiEU/lKIvn1dJcYHWPDFKShYWMsMP+ofaayDp3TQdQlowAfjj2ok1fQqKD8TXxwBrbNM6vCdBc
	6gYfXr+zwPqpbeut/yxuqIVTliT9rmiNms7/bWjo5KZEpJuTRtRSLyrxN3LKEcS5mCWu9pQF4d9M3
	OimDQkVRgYsCYrXUG7rTNxVZaG5LJ2kCjqFG/13Uuvi23ubV2cEGGM9OZ9M+tw8LfS6JMdX6/fn/u
	F00F1yGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8H7-0000000DKah-2SPX
	for ath12k@archiver.kernel.org;
	Fri, 28 Jun 2024 09:52:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8H3-0000000DKXx-2uSw
	for ath12k@lists.infradead.org;
	Fri, 28 Jun 2024 09:52:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8qm4c011470;
	Fri, 28 Jun 2024 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dekaps9oFog
	cEKDa7jpmS968SeNyOL1iWhUKfbeTCV8=; b=CsCNtqMk13iaS08psyrw1Frz8bI
	004XSDr/mNuPClYZOR1y7hXlbuUZR7WZ5ZKp79fTSU/asPA7pj5HsuJ4FqB7YQt2
	sME9HsBandUqVbXI8fpSUBQ0Tq9fa7A+XvyMnqPuiTVY73J9wGLIBwrS9/rBta8c
	IY5k7/1s0SHLQhSEYMqcNIKvInkbHfiw72AfYcktVIwQDC47gM39P9TFDWBwgtGb
	afjAjua9lOI3RI6nTEmsNrAD5z/+PULPELYoIYNMZQaENvLI+HMl16YpzDEVOe7z
	RpW2axPv8om6Mh+To/xmqpaZu7jkmx1RILwHzAp026zzCYZZ32fcmN2aoAA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqf4ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:52:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45S9q5tM017518;
	Fri, 28 Jun 2024 09:52:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpmmm2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:52:05 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45S9q4sV017506;
	Fri, 28 Jun 2024 09:52:04 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45S9q4w1017505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:52:04 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id F3FDD410E0; Fri, 28 Jun 2024 15:22:03 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v9 3/8] wifi: ath12k: Add ath12k_get_num_hw api
Date: Fri, 28 Jun 2024 15:21:34 +0530
Message-Id: <20240628095139.292952-4-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628095139.292952-1-quic_hprem@quicinc.com>
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: phbgjVaazTDdgPcgYpdvxHXPjWWJ5xrr
X-Proofpoint-GUID: phbgjVaazTDdgPcgYpdvxHXPjWWJ5xrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=883
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_025209_870217_5CE9EE2B 
X-CRM114-Status: GOOD (  14.96  )
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

Currently, one or more ath12k_hw is part of device (ath12k_base) but
in future, ath12k_hw would be part of device group (ath12k_hw_group).
Hence, num_hw under device would be moved to device group.

To facilitate above transition, add helper ath12k_get_num_hw() api to
get the number of radios per device. In future, this helper would be
able to get the number of radios in a device group.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 8 ++++----
 drivers/net/wireless/ath/ath12k/core.h | 5 +++++
 drivers/net/wireless/ath/ath12k/mac.c  | 8 ++++----
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 75ed1df397f7..690896c1cca1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -979,7 +979,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	rfkill_radio_on = ab->rfkill_radio_on;
 	spin_unlock_bh(&ab->base_lock);
 
-	for (i = 0; i < ab->num_hw; i++) {
+	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
@@ -1031,7 +1031,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 	if (ab->is_reset)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
-	for (i = 0; i < ab->num_hw; i++) {
+	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
@@ -1070,7 +1070,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 	struct ath12k *ar;
 	int i, j;
 
-	for (i = 0; i < ab->num_hw; i++) {
+	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
@@ -1125,7 +1125,7 @@ static void ath12k_core_restart(struct work_struct *work)
 	}
 
 	if (ab->is_reset) {
-		for (i = 0; i < ab->num_hw; i++) {
+		for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 			ah = ath12k_ab_to_ah(ab, i);
 			ieee80211_restart_hw(ah->hw);
 		}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bb767a562559..e7238dab16a0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1081,4 +1081,9 @@ static inline void ath12k_ab_set_ah(struct ath12k_base *ab, int idx,
 {
 	ab->ah[idx] = ah;
 }
+
+static inline int ath12k_get_num_hw(struct ath12k_base *ab)
+{
+	return ab->num_hw;
+}
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 693a2ee9d541..b18cc4dfbf44 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9345,7 +9345,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 	ab->cc_freq_hz = 320000;
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
 
-	for (i = 0; i < ab->num_hw; i++) {
+	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		ah = ath12k_ab_to_ah(ab, i);
 
 		ret = ath12k_mac_hw_register(ah);
@@ -9372,7 +9372,7 @@ void ath12k_mac_unregister(struct ath12k_base *ab)
 	struct ath12k_hw *ah;
 	int i;
 
-	for (i = ab->num_hw - 1; i >= 0; i--) {
+	for (i = ath12k_get_num_hw(ab) - 1; i >= 0; i--) {
 		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
@@ -9441,7 +9441,7 @@ void ath12k_mac_destroy(struct ath12k_base *ab)
 		pdev->ar = NULL;
 	}
 
-	for (i = 0; i < ab->num_hw; i++) {
+	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
 			continue;
@@ -9464,7 +9464,7 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 	ab->num_hw = ab->num_radios;
 	radio_per_hw = 1;
 
-	for (i = 0; i < ab->num_hw; i++) {
+	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		for (j = 0; j < radio_per_hw; j++) {
 			pdev_map[j].ab = ab;
 			pdev_map[j].pdev_idx = (i * radio_per_hw) + j;
-- 
2.34.1


