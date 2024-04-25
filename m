Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66FFC25B5C
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsHjv04qDE/+0VQVNuH2rrg4LLOp8V8XxZ5z/DGPlKc=; b=I2yHdR/79cZd0bnkYotNbkpLRD
	tiwkVykLHczOkHWE+fPJ0ivNimzUN1Ela8plRZ2KGH6iOZotzlrIp2RDRYpEyq60zxPzhwdfI3SR5
	OER6pqak3wyJsyw2UnERE8xp/NZXSc0NPDMsIAYYaNjTr1U1+Bh/hj0yh9S9QESyi1aLbhMrl240S
	axMkhct+eE5THwmapRRoAqPRJN7UJLvOzOer6pf++Zl7mepOL2jWYcoBw4Xu7nA5RRr5WXBZq6eqM
	Nn5sgqQFYB5xuTzNtaxZwwJEx2iQHutGvW3mjuEx8oNJi1uVTm3IvFeuFILzin+P1aUQLhqhmO7xO
	fa3eW9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv0t-00000007WYz-2CSF
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 09:03:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv0q-00000007WWa-1jAM
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 09:03:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P84qnL024296;
	Thu, 25 Apr 2024 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=zsHjv04qDE/+0VQVNuH2rrg4LLOp8V8XxZ5z/DGPlKc=; b=eO
	T8aeBk0voakr2Tp3+TA885CVpPibLhD1cGIKSmhgf2Qboln6snjDG1S/43Kj1w5g
	Oa+e4/SFgg4xalk1WwOLDiXTKYNXkiDinZPitJ846llysLLdFNfJUTsfI0auVoWZ
	A/KGLjCAf8+ieUaIQsDRROoU8N8ELVwib32aZXkKuUyeAwkzSeP8XBpfQ8FSpVLP
	CV/naYUoBoVLI/sNoCXGQJ4Sx95h2X1fP8YkPG04PYMc8/lpRIiMMkP7wYqhdBgl
	EFNNgA8O7Mhfd1fsnh6l6XbhGakyM/2aNBYIe/2FBLbEdas9NapoTJZhZ/7TwLav
	TgaEOhKJK/19oFu8dt/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenp9ft8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:03:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P93RYG012717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:03:27 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 02:03:25 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 3/3] wifi: ath12k: Add lock to protect the hardware state
Date: Thu, 25 Apr 2024 14:33:07 +0530
Message-ID: <20240425090307.3233434-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
References: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rbCqvXsdgjj34qZUhFczliS8kaxLT7xM
X-Proofpoint-ORIG-GUID: rbCqvXsdgjj34qZUhFczliS8kaxLT7xM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_09,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_020328_487336_23E9F001 
X-CRM114-Status: GOOD (  16.61  )
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

Currently, hardware state is not protected across the reconfigure
operations. However, in single wiphy models, multiple radio/links is
exposed as a MAC hardware (ieee80211_hw) through the driver hardware
abstraction (ath12k_hw) layer. In such scenario, we need to protect
hardware state across the multiple radio/link at the driver hardware
abstraction (ath12k_hw) layer. Therefore, introduce a new mutex in
the ath12k_hw layer.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  4 ++++
 drivers/net/wireless/ath/ath12k/core.h |  6 ++++++
 drivers/net/wireless/ath/ath12k/mac.c  | 16 ++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a685cfd6fd92..e9aabdb9341c 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1048,6 +1048,8 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
+		mutex_lock(&ah->hw_mutex);
+
 		switch (ah->state) {
 		case ATH12K_HW_STATE_ON:
 			ah->state = ATH12K_HW_STATE_RESTARTING;
@@ -1078,6 +1080,8 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 				    "device is wedged, will not restart hw %d\n", i);
 			break;
 		}
+
+		mutex_unlock(&ah->hw_mutex);
 	}
 
 	complete(&ab->driver_recovery);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index c4eb8b25398c..d833361948b7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -636,11 +636,17 @@ struct ath12k {
 struct ath12k_hw {
 	struct ieee80211_hw *hw;
 	struct ath12k_base *ab;
+
+	/* Protect the write operation of the hardware state ath12k_hw::state
+	 * between hardware start<=>reconfigure<=>stop transitions.
+	 */
+	struct mutex hw_mutex;
 	enum ath12k_hw_state state;
 	bool regd_updated;
 	bool use_6ghz_regd;
 	u8 num_radio;
 
+	/* Keep last */
 	struct ath12k radio[] __aligned(sizeof(void *));
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 710ed8fa79fd..2626328056dd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5615,10 +5615,13 @@ static void ath12k_mac_wait_reconfigure(struct ath12k_base *ab)
 
 static int ath12k_mac_start(struct ath12k *ar)
 {
+	struct ath12k_hw *ah = ar->ah;
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_pdev *pdev = ar->pdev;
 	int ret;
 
+	lockdep_assert_held(&ah->hw_mutex);
+
 	mutex_lock(&ar->conf_mutex);
 
 	ret = ath12k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_PMF_QOS,
@@ -5733,6 +5736,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 
 	ath12k_drain_tx(ah);
 
+	guard(mutex)(&ah->hw_mutex);
+
 	switch (ah->state) {
 	case ATH12K_HW_STATE_OFF:
 		ah->state = ATH12K_HW_STATE_ON;
@@ -5831,9 +5836,12 @@ int ath12k_mac_rfkill_enable_radio(struct ath12k *ar, bool enable)
 
 static void ath12k_mac_stop(struct ath12k *ar)
 {
+	struct ath12k_hw *ah = ar->ah;
 	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
 	int ret;
 
+	lockdep_assert_held(&ah->hw_mutex);
+
 	mutex_lock(&ar->conf_mutex);
 	ret = ath12k_mac_config_mon_status_default(ar, false);
 	if (ret && (ret != -EOPNOTSUPP))
@@ -5869,10 +5877,14 @@ static void ath12k_mac_op_stop(struct ieee80211_hw *hw)
 
 	ath12k_drain_tx(ah);
 
+	mutex_lock(&ah->hw_mutex);
+
 	ah->state = ATH12K_HW_STATE_OFF;
 
 	for_each_ar(ah, ar, i)
 		ath12k_mac_stop(ar);
+
+	mutex_unlock(&ah->hw_mutex);
 }
 
 static u8
@@ -7921,6 +7933,8 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
 		return;
 
+	guard(mutex)(&ah->hw_mutex);
+
 	if (ah->state != ATH12K_HW_STATE_RESTARTED)
 		return;
 
@@ -8923,6 +8937,8 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 	ah->ab = ab;
 	ah->num_radio = num_pdev_map;
 
+	mutex_init(&ah->hw_mutex);
+
 	for (i = 0; i < num_pdev_map; i++) {
 		ab = pdev_map[i].ab;
 		pdev_idx = pdev_map[i].pdev_idx;
-- 
2.34.1


