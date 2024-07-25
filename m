Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EE3C3DA5D
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4KF4yERWDTYx8Cx9KSKG61bpOzj/JomvYCW4XNG8wFo=; b=GTCk4jEHwa/VbELQC3xpnljzOx
	CHlpaM69tpJWpkjH165rBABqsbYRyxkh6xlc5H2cowtCnNMQgewyfPL/8dZjfAQA4/7kTl2IN4tgL
	ReA58KUj2kiW8P5TLCp0G6wOGL+Pr27YKEnZAM8F+9Du9ifYlDhFfiNkwciR4O/svLDIln/zIBrCj
	gsnbmHUm7xhiSJ+Cs+OgSDgStrRo41PVkNN0ta8mvyiiPnl5om/BEmsy5YhSx7SUrjFbGQ7w1EYh0
	91w0/QfMaU3IpfyCf0xqgC/vZk5L3VI0UUT+z/7DTcSFnFUovTUdXIX3kKQzwH2dblVlhssu9mZOD
	SrIhI9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWv69-00000000XMl-2BW0
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 09:49:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWv5k-00000000XI8-0fub
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 09:49:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P9fJDu009311;
	Thu, 25 Jul 2024 09:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4KF4yERWDTYx8Cx9KSKG61
	bpOzj/JomvYCW4XNG8wFo=; b=jAAK12Y5pj2x5ic1sGUSMStKH+RxSl4WyEcSr6
	EL624q3Fjqh9nfAV2bxBlm8YVUyDjZMDDZg6MXQ3po0i5xmY+ypar/s7zO77x162
	2uyjPqG8FhxdYnBHX27+9rUazb9BW71S0SfuLsRzaegPFLF0OyfxD+JEPLGzSUcP
	QrbQ27GwbLCwrTikF61V8cPat2xDAbjjtUEeCkWtiKm/ujGF68q40cS77qRqTOsh
	dk1RDmRSUKSp7iAoA//FMf2Sw6BsA7xryG3MivEqW3JUUI6PZkWd34r8KwLspjLH
	IVyO+tcVnuvR8yzVlkAzTqEuHYeWTY9bGXyYy8ATPtKXyguw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487mr6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 09:48:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46P9mpTT003675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 09:48:51 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 02:48:49 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH] wifi: ath12k: prepare vif config caching for MLO
Date: Thu, 25 Jul 2024 15:18:36 +0530
Message-ID: <20240725094836.287448-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RbxBHngAy66exybHJst-pqg2UvUfRZL6
X-Proofpoint-GUID: RbxBHngAy66exybHJst-pqg2UvUfRZL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_09,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407250065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_024856_368091_410FEC01 
X-CRM114-Status: GOOD (  19.03  )
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

Currently vif configuration cache pointers are placed in arvif and
caching is done whenever a link vif configuration is received before
driver created vdev for it (i.e. before channel is assigned),
this is possible because current code only uses default
link(ahvif->deflink) which is preallocated.

With MLO changes the ieee80211_vif drv priv is now ahvif and its
arvifs(link vif) other than deflink can be allocated dynamically
during channel assignment. Hence maintain link level cache
in ahvif and whenever channel is assigned for link vif and vdev is created,
flush the corresponding link vif cache from ahvif.

Current code uses cache of ATH12K_DEFAULT_LINK_ID(0) which is the cache
of ahvif->deflink.

Co-developed-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
Depends-on:
[PATCH v6 0/3] wifi: ath12k: prepare vif and sta datastructure
Link: https://lore.kernel.org/linux-wireless/20240711165511.3100433-4-quic_ramess@quicinc.com/
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 39 +++++++++++++-------------
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 13f8695c2337..5b880f6970a3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -272,7 +272,6 @@ struct ath12k_link_vif {
 	u32 punct_bitmap;
 	u8 link_id;
 	struct ath12k_vif *ahvif;
-	struct ath12k_vif_cache *cache;
 	struct ath12k_rekey_data rekey_data;
 };
 
@@ -306,6 +305,7 @@ struct ath12k_vif {
 
 	struct ath12k_link_vif deflink;
 	struct ath12k_link_vif __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
+	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
 	/* indicates bitmap of link vif created in FW */
 	u16 links_map;
 };
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b36b9250c924..4063787cdfcf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3455,18 +3455,19 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 	}
 }
 
-static struct ath12k_vif_cache *ath12k_arvif_get_cache(struct ath12k_link_vif *arvif)
+static struct ath12k_vif_cache *ath12k_ahvif_get_link_cache(struct ath12k_vif *ahvif,
+							    u8 link_id)
 {
-	if (!arvif->cache)
-		arvif->cache = kzalloc(sizeof(*arvif->cache), GFP_KERNEL);
+	if (!ahvif->cache[link_id])
+		ahvif->cache[link_id] = kzalloc(sizeof(*ahvif->cache[0]), GFP_KERNEL);
 
-	return arvif->cache;
+	return ahvif->cache[link_id];
 }
 
-static void ath12k_arvif_put_cache(struct ath12k_link_vif *arvif)
+static void ath12k_ahvif_put_link_cache(struct ath12k_vif *ahvif, u8 link_id)
 {
-	kfree(arvif->cache);
-	arvif->cache = NULL;
+	kfree(ahvif->cache[link_id]);
+	ahvif->cache[link_id] = NULL;
 }
 
 static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
@@ -3493,15 +3494,14 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (!ar) {
 		/* TODO Once link vif is fetched based on link id from
-		 * info, avoid using the deflink above and cache the link
-		 * configs in ahvif per link.
+		 * info, avoid using ATH12K_DEFAULT_LINK_ID.
 		 */
-		cache = ath12k_arvif_get_cache(arvif);
+		cache = ath12k_ahvif_get_link_cache(ahvif, ATH12K_DEFAULT_LINK_ID);
 		if (!cache) {
 			mutex_unlock(&ah->conf_mutex);
 			return;
 		}
-		arvif->cache->bss_conf_changed |= changed;
+		cache->bss_conf_changed |= changed;
 		mutex_unlock(&ah->conf_mutex);
 		return;
 	}
@@ -4172,7 +4172,7 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			return -EINVAL;
 		}
 
-		cache = ath12k_arvif_get_cache(arvif);
+		cache = ath12k_ahvif_get_link_cache(ahvif, ATH12K_DEFAULT_LINK_ID);
 		if (!cache) {
 			mutex_unlock(&ah->conf_mutex);
 			return -ENOSPC;
@@ -5103,7 +5103,7 @@ static int ath12k_mac_op_conf_tx(struct ieee80211_hw *hw,
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
 		/* cache the info and apply after vdev is created */
-		cache = ath12k_arvif_get_cache(arvif);
+		cache = ath12k_ahvif_get_link_cache(ahvif, ATH12K_DEFAULT_LINK_ID);
 		if (!cache) {
 			mutex_unlock(&ah->conf_mutex);
 			return -ENOSPC;
@@ -6819,10 +6819,11 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	return ret;
 }
 
-static void ath12k_mac_vif_cache_flush(struct ath12k *ar,  struct ath12k_link_vif *arvif)
+static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ath12k_link_vif *arvif)
 {
-	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
-	struct ath12k_vif_cache *cache = arvif->cache;
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
+	struct ath12k_vif_cache *cache = ahvif->cache[arvif->link_id];
 	struct ath12k_base *ab = ar->ab;
 
 	int ret;
@@ -6853,7 +6854,7 @@ static void ath12k_mac_vif_cache_flush(struct ath12k *ar,  struct ath12k_link_vi
 			ath12k_warn(ab, "unable to apply set key param to vdev %d ret %d\n",
 				    arvif->vdev_id, ret);
 	}
-	ath12k_arvif_put_cache(arvif);
+	ath12k_ahvif_put_link_cache(ahvif, arvif->link_id);
 }
 
 static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
@@ -7059,7 +7060,7 @@ static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arv
 	spin_unlock_bh(&ar->data_lock);
 
 	ath12k_peer_cleanup(ar, arvif->vdev_id);
-	ath12k_arvif_put_cache(arvif);
+	ath12k_ahvif_put_link_cache(ahvif, arvif->link_id);
 
 	idr_for_each(&ar->txmgmt_idr,
 		     ath12k_mac_vif_txmgmt_idr_remove, vif);
@@ -7099,7 +7100,7 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 		/* if we cached some config but never received assign chanctx,
 		 * free the allocated cache.
 		 */
-		ath12k_arvif_put_cache(arvif);
+		ath12k_ahvif_put_link_cache(ahvif, ATH12K_DEFAULT_LINK_ID);
 		mutex_unlock(&ah->conf_mutex);
 		return;
 	}

base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
prerequisite-patch-id: f87638504028796f96a183930bf1799f55b9d268
prerequisite-patch-id: dc15d6df954760395ff72d9bcf14aace5adefbe7
prerequisite-patch-id: b43d0571ad6b42c80a16e65dc2c54657f3cd3dc5
-- 
2.25.1


