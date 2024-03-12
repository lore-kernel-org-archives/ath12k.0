Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F9CC54E68
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvjfdcTrjYKphBrQKCuUq1u72/zj3phU2mx/GW37wxM=; b=sZAOgaYcHJ3zlHUhg0v9z4dgON
	lo8Ywka1gZZ4OfEQpUu4y6Y8QZlKtl5mRdXoGvj0cQAvoBWwjU+MgO+Q0jzVIuWvlubeL/8Hc0qfs
	9GB2C3T+mRbNvpHWrFM5nP11yN7MaAAmf3nqDgBuh1+H5z91fdfz3Ou5gp6pP3UJWjTtEXhN1pHoc
	AxHYRlWuxEW1uSnNKZ2C1h7kuPKcXLbM8fho9eoqSAgsIK2P63RK5k4rKgWXGlfhOuU3atdri9OGZ
	nME8fai44ANQnzHO1Z5SfWbR1ZspBXevqFhCl5jDVYwHndHBxSV1GzHHcs94a672CL7rhYLKhCXKU
	ei+Q+pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3p-0000000518D-2n7l
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 09:04:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3l-0000000514q-1i3O
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 09:04:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C57qsB029587;
	Tue, 12 Mar 2024 09:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=DvjfdcTrjYKphBrQKCuUq1u72/zj3phU2mx/GW37wxM=; b=gS
	VF/m5UohrZbzAA0w36UmCYWnulHPn0zdv707b3FxAKHxriuNiR6HmoRVEpPUmKcA
	UnLuOGPGfPwaOC6amGKspz1baN7sj7OzKujW3pRpIIRy5RXxojg+F2Bax1NqdwH4
	l0w2kZ5mfKZ5PuZKlJu+ajEfwoS7+b54cZQRbdlMNz1KeJ5T/ejSw9kuakqj/KkP
	JBLGVTgdPTWFuhHI6tQSI4OPF7WLSFcCX1ZXDWfJQXyXjlDHkuzXtY8exIgYCUAF
	r0Q2K9DDCAFevf0WOnqImTHW2S4bgPPdUxPYS5rbQ+Hvf2mAc8UrG0AiFLG6Zhvl
	hP/cmXp8XyWQe3K1u7Dg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtd508sbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C94WDr022946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:32 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 02:04:29 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v3 06/12] wifi: ath12k: fetch correct radio based on vdev status
Date: Tue, 12 Mar 2024 14:33:45 +0530
Message-ID: <20240312090351.1620218-7-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312090351.1620218-1-quic_ramess@quicinc.com>
References: <20240312090351.1620218-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IKNE87NbVKCVQkz7DwmUub-PIPNcorq5
X-Proofpoint-ORIG-GUID: IKNE87NbVKCVQkz7DwmUub-PIPNcorq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=979 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403120070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_020433_632688_CC5B2F7B 
X-CRM114-Status: GOOD (  18.69  )
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

From: Sriram R <quic_srirrama@quicinc.com>

For ops which passes the vif info, fetch the radio(ar)
to be used for corresponding functions based on the
the vdev creation status. If the vdev is not created yet,
which could happen when the ops are called before channel
is assigned for the vif, the data needs to be cached and this
is done in followup changes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 75 +++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3ce1407e0e5f..6d2176b0a556 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -645,6 +645,24 @@ static struct ath12k *ath12k_get_ar_by_ctx(struct ieee80211_hw *hw,
 	return ath12k_mac_get_ar_by_chan(hw, ctx->def.chan);
 }
 
+static struct ath12k *ath12k_get_ar_by_vif(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif)
+{
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	/* If there is one pdev within ah, then we return
+	 * ar directly.
+	 */
+	if (ah->num_radio == 1)
+		return ah->radio;
+
+	if (arvif->is_created)
+		return arvif->ar;
+
+	return NULL;
+}
+
 static void ath12k_pdev_caps_update(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -2998,11 +3016,17 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 					   struct ieee80211_bss_conf *info,
 					   u64 changed)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_vif(hw, vif);
+
+	/* TODO if the vdev is not created on a certain radio,
+	 * cache the info to be updated later on vdev creation
+	 */
+
+	if (!ar)
+		return;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -3497,7 +3521,6 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 				 struct ieee80211_key_conf *key)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
@@ -3514,7 +3537,11 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
 		return 1;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_vif(hw, vif);
+	if (!ar) {
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 	ab = ar->ab;
 
 	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags))
@@ -4092,7 +4119,6 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				   enum ieee80211_sta_state old_state,
 				   enum ieee80211_sta_state new_state)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
@@ -4104,7 +4130,11 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	     new_state == IEEE80211_STA_NOTEXIST))
 		cancel_work_sync(&arsta->update_wk);
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_vif(hw, vif);
+	if (!ar) {
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -4255,14 +4285,17 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 					struct ieee80211_sta *sta,
 					u32 changed)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_peer *peer;
 	u32 bw, smps;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_vif(hw, vif);
+	if (!ar) {
+		WARN_ON_ONCE(1);
+		return;
+	}
 
 	spin_lock_bh(&ar->ab->base_lock);
 
@@ -4438,12 +4471,15 @@ static int ath12k_mac_op_conf_tx(struct ieee80211_hw *hw,
 				 unsigned int link_id, u16 ac,
 				 const struct ieee80211_tx_queue_params *params)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	int ret;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_vif(hw, vif);
+	if (!ar) {
+		/* TODO cache the info and apply after vdev is created */
+		return -EINVAL;
+	}
 
 	mutex_lock(&ar->conf_mutex);
 	ret = ath12k_mac_conf_tx(arvif, link_id, ac, params);
@@ -6459,6 +6495,10 @@ static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	int ret = -EINVAL;
 
+	ar = ath12k_get_ar_by_vif(hw, vif);
+	if (!ar)
+		return -EINVAL;
+
 	ar = ath12k_ah_to_ar(ah, 0);
 
 	mutex_lock(&ar->conf_mutex);
@@ -7214,11 +7254,24 @@ static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 				u32 queues, bool drop)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
+	struct ath12k *ar;
+	int i;
 
 	if (drop)
 		return;
 
+	/* vif can be NULL when flush() is considered for hw */
+	if (!vif) {
+		for_each_ar(i, ah, ar)
+			ath12k_mac_flush(ar);
+		return;
+	}
+
+	ar = ath12k_get_ar_by_vif(hw, vif);
+
+	if (!ar)
+		return;
+
 	ath12k_mac_flush(ar);
 }
 
-- 
2.25.1


