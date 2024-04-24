Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93984C10F16
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vyMwt/tR7TvJ6IEDMp+XT2nviPHFdf9JgFwe7zHNqk=; b=h4UVgTzHzNjSNET3aZZ5hXl+ll
	YePoxnMakwUCxV5JRafhWaiS515n52lPixxtXDeW6bDk1yWvLGOnvVvB48mbTUFgl8EPgiBLI2Q8p
	nNPn1C0bomrY1aKFWVs+1SrIHTYIBQLg2I/7cxcgE+H+UH27kLCaO8+vMrfW5ymP7X5bzdJp7fj+c
	WDfO8bfVovSDUPePktkX4jghH327JBSpYGswCCG8DaDdzvMWxZKqV1VbPT0ROYMIuQ0ezA1N6FLrO
	3AtNaKLF/bTvhJBiPvvJewe/GmZ3OjbP7mKKxvcZqJ3RWsQw9gjmzlIPu0+gyomi+L3YBc/ZmgAak
	GCKzljww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWZA-00000002zUY-0aYH
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 06:57:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWZ4-00000002zPd-02Uc
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 06:57:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O6Y0kR017665;
	Wed, 24 Apr 2024 06:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=6vyMwt/tR7TvJ6IEDMp+XT2nviPHFdf9JgFwe7zHNqk=; b=N4
	DqlRI2J/MkJIL5capg8lfHfzWvyplohpPHTJ4BmCmUFsQDIanbZ9hpPkpKAGw80N
	cS8XR5iLPIzdXn21PVz6jmw+79J5VKRkZG6eeG5clzCBdSSs/irDPsWVPcdALSbn
	eid7KL2HCb9Y11zYifV1vQ/SMzftP24FIQIKKwKgGayZrE0MNmZqTuYLhNq27iwm
	jjVcHTJ/2cE9XuPZTYe+7l3tH0ynU0GO7mP4kyrzYq3CzMLwakZyI+L2mSWKsv7U
	xD3D5IsgrKuvv3G4wV0M8JBasU6QI9/56hJk9Eg22eXuZnjTNXW9nLwXDuLAT8J6
	1ue2c3Lszeqmih10TeIw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9fg4am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 06:57:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43O6v7Wx010204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 06:57:07 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Apr 2024 23:57:06 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware state
Date: Wed, 24 Apr 2024 12:26:46 +0530
Message-ID: <20240424065646.1666166-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Uzx3GAmVtB0wZV_FghVQnq97gLQFwRi2
X-Proofpoint-GUID: Uzx3GAmVtB0wZV_FghVQnq97gLQFwRi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_04,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_235710_439502_3C86F34B 
X-CRM114-Status: GOOD (  18.02  )
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
 drivers/net/wireless/ath/ath12k/mac.c  | 29 ++++++++++++++++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)

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
index eff1093fbb6e..3e3e157b6c56 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -634,11 +634,17 @@ struct ath12k {
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
index 8b003c18796d..3dc95d36b6a2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5546,10 +5546,13 @@ static void ath12k_mac_wait_reconfigure(struct ath12k_base *ab)
 
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
@@ -5664,6 +5667,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 
 	ath12k_drain_tx(ah);
 
+	mutex_lock(&ah->hw_mutex);
+
 	switch (ah->state) {
 	case ATH12K_HW_STATE_OFF:
 		ah->state = ATH12K_HW_STATE_ON;
@@ -5678,7 +5683,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 		ah->state = ATH12K_HW_STATE_OFF;
 
 		WARN_ON(1);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	for_each_ar(ah, ar, i) {
@@ -5692,6 +5698,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 		}
 	}
 
+	mutex_unlock(&ah->hw_mutex);
+
 	return 0;
 
 fail_start:
@@ -5700,6 +5708,8 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 		ath12k_mac_stop(ar);
 	}
 
+err:
+	mutex_unlock(&ah->hw_mutex);
 	return ret;
 }
 
@@ -5762,9 +5772,12 @@ int ath12k_mac_rfkill_enable_radio(struct ath12k *ar, bool enable)
 
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
@@ -5800,10 +5813,14 @@ static void ath12k_mac_op_stop(struct ieee80211_hw *hw)
 
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
@@ -7848,8 +7865,12 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
 		return;
 
-	if (ah->state != ATH12K_HW_STATE_RESTARTED)
+	mutex_lock(&ah->hw_mutex);
+
+	if (ah->state != ATH12K_HW_STATE_RESTARTED) {
+		mutex_unlock(&ah->hw_mutex);
 		return;
+	}
 
 	ah->state = ATH12K_HW_STATE_ON;
 	ieee80211_wake_queues(hw);
@@ -7904,6 +7925,8 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 
 		mutex_unlock(&ar->conf_mutex);
 	}
+
+	mutex_unlock(&ah->hw_mutex);
 }
 
 static void
@@ -8850,6 +8873,8 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 	ah->ab = ab;
 	ah->num_radio = num_pdev_map;
 
+	mutex_init(&ah->hw_mutex);
+
 	for (i = 0; i < num_pdev_map; i++) {
 		ab = pdev_map[i].ab;
 		pdev_idx = pdev_map[i].pdev_idx;
-- 
2.34.1


