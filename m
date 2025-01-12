Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE6DE7719D
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXiaEYJZyP3oUoyUnjQ5V5vGNqVmGLpMPipY3C6eLto=; b=z7tE8E1dBtguHgJrUCol3upFSs
	TraZfPtTA1WPoi9Y39vXp1u8Ot6GjISeWHXtXiw07treeLEhUwN1fs9bz8FFZuL3HH9ffKMEiGphP
	IYCVTEX2KxOhgtlcWpbv/1ttmu/zN+foUdzch4vo/9RODa1sm4L1Ty8UknLows2ha1PodVrsoxc9U
	RCkL77lqAlomtgi5PBWGmm6FCjo8tEOSp5c6wd6YgjxhLHT1i2UPWdgfIyf1a/s5TLBPhzSql7cVL
	8QgqlaQSUToI8MGCkiupHUTm+svUIY8omk+a1U+VCaZV4VqrLEaSpYncgrxJ5GMTJRjJJUh8+RtXY
	ru+w4g4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDO-00000002Ddv-0e6c
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 07:16:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDL-00000002DcK-2SUk
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 07:16:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C7GQPb017106;
	Sun, 12 Jan 2025 07:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXiaEYJZyP3oUoyUnjQ5V5vGNqVmGLpMPipY3C6eLto=; b=NucCj4lWu+1jXpX+
	e8xvPdX2EtfF3uLvj8Um+vclfzWn9Tm6Uwia1UzfFGV0dk2dOKYYD9VrBK0+sVw2
	PH6wa89CA7JPy/8kPQU0Smo8a22K6APVbWiGDqt9jsBUe7TqiZf1UWtV9XFYFhGx
	oUOsHFjFPZd7+bglSzzZ3vKmd3zZfg+kF3JNsMnFE35hB0j7xhCc7Xz23Bqbm1L0
	eTW0rxHi+J/+MpV0bdORw2Aefo36zZp5Y/tI0wg0Vi8VPJCEf2FkC3/GlWhomrmt
	7xSZ8rVhRQl/wLOCBl+5cXWWFkQQshkm4ci0kg/nQqyrMf10SeEcRVLjA/cjyrBH
	5dt/Vw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkfhpp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C7Gn1s001090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:49 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 Jan 2025 23:16:47 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH v4 2/4] wifi: ath12k: Refactor the ath12k_hw get helper function argument
Date: Sun, 12 Jan 2025 12:46:28 +0530
Message-ID: <20250112071630.4059410-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ONtmxDnNbyg0L-WeJVWCQuL-9AStbbB7
X-Proofpoint-ORIG-GUID: ONtmxDnNbyg0L-WeJVWCQuL-9AStbbB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_231651_738285_F97CF862 
X-CRM114-Status: GOOD (  15.09  )
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

Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
ath12k_hw get helper function takes the device handle and the index as
parameters. Here, the index parameter is specific to the group handle.
Therefore, change this helper function argument from the device handle
to the group handle.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  8 ++++----
 drivers/net/wireless/ath/ath12k/core.h |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c  | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c6b35aac96e..af49e7db4928 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1184,7 +1184,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	spin_unlock_bh(&ab->base_lock);
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ab->ag, i);
 		if (!ah)
 			continue;
 
@@ -1236,7 +1236,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ab->ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1275,7 +1275,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 	int i, j;
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ab->ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1337,7 +1337,7 @@ static void ath12k_core_restart(struct work_struct *work)
 		}
 
 		for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-			ah = ath12k_ab_to_ah(ab, i);
+			ah = ath12k_ag_to_ah(ab->ag, i);
 			ieee80211_restart_hw(ah->hw);
 		}
 	}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 9eb4eb410af2..4932bd1c2096 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1194,9 +1194,9 @@ static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
 	for ((index) = 0; ((index) < (ah)->num_radio && \
 	     ((ar) = &(ah)->radio[(index)])); (index)++)
 
-static inline struct ath12k_hw *ath12k_ab_to_ah(struct ath12k_base *ab, int idx)
+static inline struct ath12k_hw *ath12k_ag_to_ah(struct ath12k_hw_group *ag, int idx)
 {
-	return ab->ag->ah[idx];
+	return ag->ah[idx];
 }
 
 static inline void ath12k_ag_set_ah(struct ath12k_hw_group *ag, int idx,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6a7a01c35f02..285bb88acb90 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11244,7 +11244,7 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 	int ret;
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 
 		ret = ath12k_mac_hw_register(ah);
 		if (ret)
@@ -11257,7 +11257,7 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -11276,7 +11276,7 @@ void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
 
 	for (i = ath12k_get_num_hw(ab) - 1; i >= 0; i--) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -11357,7 +11357,7 @@ void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 	}
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -11438,7 +11438,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
-- 
2.34.1


