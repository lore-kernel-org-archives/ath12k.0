Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E8C4707B
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 04:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/OQR0q3KCH05rwa90lVSCV3bxx60uHAxJFT2QIgg+8=; b=qa89bL9UvjsoBY5gyHwQST/LOE
	bGOjG2Dmt8XDFvy3DQIw8+XwoJwr1X+2UOEsnIlQUAAN4+8AK2upNX2QjKlY61oRMdQC8HXaCKzPO
	y94dNh46BOaKGoDV1vvNAaply70rmU7QHzFXF979D+2chllmmKal4sODcGS6Wmv0xNeTj+n2Nvdba
	IrWdD3kivXq8se3jGuexiBV24vuwka9bPJxMwxg4rmeicSKzf1B0dCUXIMrKIuA/RcySCN4Evz2zr
	t2L1PdLJPgX3mWrZjsat5r3+G4aOJikJbVx1CdG0v8B84Zz4vIWVK5fhibf22So6Qp90n8dOdXmvQ
	JZdYcGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2X-00FrIa-0C
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 04:51:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2U-00FrGx-2g
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 04:51:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B3F25h002571;
	Thu, 11 Jan 2024 04:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=K/OQR0q3KCH05rwa90lV
	SCV3bxx60uHAxJFT2QIgg+8=; b=o+bEWQq6J7bmzPl9YZ8BzXjXW0Ob+jkxXj3t
	9jNue0ccH4p9adfH1SieqEuv2CMu9fuyxcMlclK8NZLJlfWgkGE+Qwuh0ka4kIf+
	vUe4DM2uf6Wpe3JBYhplCEOuiCXuIZiuOesdLOgY8xpHZ3tbTpWFNtT+1lhGB+Ld
	gxxYuuexy5Vb+qJFrGHUCVOz+YPWftfYQL/NG4ZweHtF9Abwcon/TJppcn+DUEVv
	sQtPqATF74RqtFRM81kYaoZl887yCmeknmDdy2kD6jj5uw+C0jgXrs6mo/kXoLFF
	XUEEJxQHEXAbxmJYJ3W2pARZo0/mQNZBoYtBK6MdqvoLvX5yeQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhsb2j8yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40B4pXAS017407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:33 GMT
Received: from srirrama-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 20:51:31 -0800
From: Sriram R <quic_srirrama@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH 07/12] wifi: ath12k: Cache vdev configs before vdev create
Date: Thu, 11 Jan 2024 10:20:40 +0530
Message-ID: <20240111045045.28377-8-quic_srirrama@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111045045.28377-1-quic_srirrama@quicinc.com>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8LKpRtsReBZde7UdUXxWVX9P7hWB4lDO
X-Proofpoint-GUID: 8LKpRtsReBZde7UdUXxWVX9P7hWB4lDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=635 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_205134_879455_55E1E4E8 
X-CRM114-Status: GOOD (  23.52  )
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

Since the vdev create for a corresponding vif is deferred
until a channel is assigned, cache the information which
are received through mac80211 ops between add_interface()
and assign_vif_chanctx() and set them once the vdev is
created on one of the ath12k radios as the channel gets
assigned via assign_vif_chanctx().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  19 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 130 ++++++++++++++++++-------
 2 files changed, 114 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 8c107565905b..0b55a3f533cd 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -212,6 +212,24 @@ enum ath12k_monitor_flags {
 	ATH12K_FLAG_MONITOR_ENABLED,
 };
 
+struct ath12k_tx_conf {
+	bool changed;
+	u16 ac;
+	struct ieee80211_tx_queue_params tx_queue_params;
+};
+
+struct ath12k_key_conf {
+	bool changed;
+	enum set_key_cmd cmd;
+	struct ieee80211_key_conf *key;
+};
+
+struct ath12k_vif_cache {
+	struct ath12k_tx_conf tx_conf;
+	struct ath12k_key_conf key_conf;
+	u32 bss_conf_changed;
+};
+
 struct ath12k_vif {
 	u32 vdev_id;
 	enum wmi_vdev_type vdev_type;
@@ -265,6 +283,7 @@ struct ath12k_vif {
 	u8 tx_encap_type;
 	u8 vdev_stats_id;
 	u32 punct_bitmap;
+	struct ath12k_vif_cache cache;
 };
 
 struct ath12k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 13203ca500f2..91d378c5f2cf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2859,10 +2859,11 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	ar = ath12k_get_ar_by_vif(hw, vif);
 
-	/* TODO if the vdev is not created on a certain radio,
+	/* if the vdev is not created on a certain radio,
 	 * cache the info to be updated later on vdev creation
 	 */
 	if (!ar) {
+		arvif->cache.bss_conf_changed |= changed;
 		mutex_unlock(&ah->conf_mutex);
 		return;
 	}
@@ -3381,13 +3382,12 @@ static int ath12k_clear_peer_keys(struct ath12k_vif *arvif,
 	return first_errno;
 }
 
-static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
-				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
-				 struct ieee80211_key_conf *key)
+static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
+			      struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+			      struct ieee80211_key_conf *key)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar;
-	struct ath12k_base *ab;
+	struct ath12k_hw *ah = ar->ah;
+	struct ath12k_base *ab = ar->ab;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_peer *peer;
 	struct ath12k_sta *arsta;
@@ -3395,34 +3395,11 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	int ret = 0;
 	u32 flags = 0;
 
-	/* BIP needs to be done in software */
-	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
-	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
-		return 1;
-
-	mutex_lock(&ah->conf_mutex);
-
-	ar = ath12k_get_ar_by_vif(hw, vif);
-	if (!ar) {
-		mutex_unlock(&ah->conf_mutex);
-		WARN_ON_ONCE(1);
-		return -EINVAL;
-	}
-	ab = ar->ab;
+	lockdep_assert_held(&ah->conf_mutex);
+	lockdep_assert_held(&ar->conf_mutex);
 
-	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags)) {
-		mutex_unlock(&ah->conf_mutex);
+	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags))
 		return 1;
-	}
-
-	if (key->keyidx > WMI_MAX_KEY_INDEX) {
-		mutex_unlock(&ah->conf_mutex);
-		return -ENOSPC;
-	}
-
-	mutex_lock(&ar->conf_mutex);
 
 	if (sta)
 		peer_addr = sta->addr;
@@ -3515,7 +3492,49 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	spin_unlock_bh(&ab->base_lock);
 
 exit:
+	return ret;
+}
+
+static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+				 struct ieee80211_key_conf *key)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k *ar;
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+	int ret;
+
+	/* BIP needs to be done in software */
+	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
+	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
+	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
+	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
+		return 1;
+
+	if (key->keyidx > WMI_MAX_KEY_INDEX)
+		return -ENOSPC;
+
+	mutex_lock(&ah->conf_mutex);
+
+	ar = ath12k_get_ar_by_vif(hw, vif);
+	if (!ar) {
+		/* ar is expected to be valid when sta ptr is available */
+		if (sta) {
+			mutex_unlock(&ah->conf_mutex);
+			WARN_ON_ONCE(1);
+			return -EINVAL;
+		}
+		arvif->cache.key_conf.cmd = cmd;
+		arvif->cache.key_conf.key = key;
+		arvif->cache.key_conf.changed = true;
+		mutex_unlock(&ah->conf_mutex);
+		return 0;
+	}
+
+	mutex_lock(&ar->conf_mutex);
+	ret = ath12k_mac_set_key(ar, cmd, vif, sta, key);
 	mutex_unlock(&ar->conf_mutex);
+
 	mutex_unlock(&ah->conf_mutex);
 	return ret;
 }
@@ -4357,7 +4376,10 @@ static int ath12k_mac_op_conf_tx(struct ieee80211_hw *hw,
 
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
-		/* TODO cache the info and apply after vdev is created */
+		/* cache the info and apply after vdev is created */
+		arvif->cache.tx_conf.changed = true;
+		arvif->cache.tx_conf.ac = ac;
+		arvif->cache.tx_conf.tx_queue_params = *params;
 		mutex_unlock(&ah->conf_mutex);
 		return -EINVAL;
 	}
@@ -5990,6 +6012,43 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 	return ret;
 }
 
+static void ath12k_mac_vif_cache_flush(struct ath12k *ar,  struct ieee80211_vif *vif)
+{
+	struct ath12k_hw *ah = ar->ah;
+	struct ath12k_base *ab = ar->ab;
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+	int ret;
+
+	lockdep_assert_held(&ah->conf_mutex);
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (arvif->cache.tx_conf.changed) {
+		ret = ath12k_mac_conf_tx(arvif, 0, arvif->cache.tx_conf.ac,
+					 &arvif->cache.tx_conf.tx_queue_params);
+		if (ret)
+			ath12k_warn(ab,
+				    "unable to apply tx config parameters to vdev %d\n",
+				    ret);
+	}
+
+	if (arvif->cache.bss_conf_changed)
+		ath12k_mac_bss_info_changed(ar, arvif, &vif->bss_conf,
+					    arvif->cache.bss_conf_changed);
+
+	if (arvif->cache.key_conf.changed) {
+		ret = ath12k_mac_set_key(ar, arvif->cache.key_conf.cmd,
+					 vif, NULL,
+					 arvif->cache.key_conf.key);
+		if (ret) {
+			WARN_ON_ONCE(1);
+			ath12k_warn(ab, "unable to apply set key param to vdev %d ret %d\n",
+				    arvif->vdev_id, ret);
+		}
+	}
+
+	memset(&arvif->cache, 0, sizeof(struct ath12k_vif_cache));
+}
+
 static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 						    struct ieee80211_vif *vif,
 						    struct ieee80211_chanctx_conf *ctx)
@@ -6077,10 +6136,11 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 		goto unlock;
 	}
 
-	/* TODO If the vdev is created during channel assign and not during
+	/* If the vdev is created during channel assign and not during
 	 * add_interface(), Apply any parameters for the vdev which were received
 	 * after add_interface, corresponding to this vif.
 	 */
+	ath12k_mac_vif_cache_flush(ar, vif);
 
 unlock:
 	mutex_unlock(&ar->conf_mutex);
-- 
2.17.1


