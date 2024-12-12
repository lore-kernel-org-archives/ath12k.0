Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC293E7717D
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC9rAb9zCKZkZsLnw6isWKQVA7rvKja8/xZGMta4lLc=; b=GjI8TCuMcuR0rL3O3diWrnV7Lw
	iUkIUzGzh8VPB+wJsOVkT5092kMsoCwEeIopOsgj5zsGBIK4INKOUaugW42f74TD6MLB6oIZRkZl6
	sGqBeEry4A+XDhBZ5oVSb9eAixgxEHr5ai8xdmKxZRsVB6z0/ym5caILHuSydlWmuJx2Yz2kO4xs/
	pqZhLtGWpEeUEvkaE8ojYcmj1//er+6l/0jXGkABaxQoq7st1m0DsI7AO9HWkdL3wNjvMYAaV9HB4
	WGp0aRd8Dg7fsP78OYs8b+tLO8Wo9IGTcGRzOhf5htQoc1vAI3AfsCm5kapFVb5LSkL1lq5EIAOT0
	+TZuacaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXOV-0000000Gd1t-1r7l
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 00:49:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXOR-0000000GczI-3urC
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 00:49:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD5nP002087;
	Thu, 12 Dec 2024 00:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XC9rAb9zCKZkZsLnw6isWKQVA7rvKja8/xZGMta4lLc=; b=k3DNAs4nepCo9n2F
	JZgdgR7bCrOk7dBATo7yiCxOYqWVl1Gm9LK756t4dueyzel8PMWM8uxg+IxU80uU
	AxQRdMCg8W8Fy4YwWUIs51QoyWgIqxxCMuzTyDVHto/XoHEH6JzIT1PJzTCDzGd+
	078cLr9Qz2Y1ylO+WYYcD1ki877nUfBf5w5PkPn3AnA+okZDfeJEHE8Cjn2jwfaW
	Z4h1dz+V4nv6D2ZcT6/chGdkzRCHH6bs4WynNFJgUvUtUo+hzbgv7EdEnotSugKN
	oFCiF45lWQZu2PYrfBSXozYfnjEDfXDCImVYdD70aisb9uHfSOcnh2ldqZQbOj19
	Oa+13w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9un7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:49:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC0nQbf032238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:49:26 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 16:49:24 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 2/4] wifi: ath12k: Refactor the ath12k_hw get helper function argument
Date: Thu, 12 Dec 2024 06:19:04 +0530
Message-ID: <20241212004906.3087425-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nnYMb81efKayg07ZJLZBK07n-gNQDMxy
X-Proofpoint-GUID: nnYMb81efKayg07ZJLZBK07n-gNQDMxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=964
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_164928_090355_1998D4DE 
X-CRM114-Status: GOOD (  15.22  )
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
---
 drivers/net/wireless/ath/ath12k/core.c |  8 ++++----
 drivers/net/wireless/ath/ath12k/core.h |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c  | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 49d1ac15cb7a..bf391e6e8f72 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1109,7 +1109,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	spin_unlock_bh(&ab->base_lock);
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ab->ag, i);
 		if (!ah)
 			continue;
 
@@ -1161,7 +1161,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ab->ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1200,7 +1200,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 	int i, j;
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ab->ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1262,7 +1262,7 @@ static void ath12k_core_restart(struct work_struct *work)
 		}
 
 		for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-			ah = ath12k_ab_to_ah(ab, i);
+			ah = ath12k_ag_to_ah(ab->ag, i);
 			ieee80211_restart_hw(ah->hw);
 		}
 	}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3173d94989c9..56e740ec61e8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1170,9 +1170,9 @@ static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
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
index 8f2ca05617e6..7116516b4c01 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10826,7 +10826,7 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 	int ret;
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 
 		ret = ath12k_mac_hw_register(ah);
 		if (ret)
@@ -10839,7 +10839,7 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -10858,7 +10858,7 @@ void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
 
 	for (i = ath12k_get_num_hw(ab) - 1; i >= 0; i--) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -10936,7 +10936,7 @@ void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 	}
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -11017,7 +11017,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 
 err:
 	for (i = i - 1; i >= 0; i--) {
-		ah = ath12k_ab_to_ah(ab, i);
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
-- 
2.34.1


