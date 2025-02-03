Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579DCC02190
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 02:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuipzKLdYKYXQcHDKVRnnhs2Nw5HUFtQLJ/FXNgtzHs=; b=2L5BILTtdSjyCs0QWhdWoHSUQ3
	WTMtDLp2+Mgx0t31fjiCICyBjTSXHdNLGlF7w+V2OIEpXQlZNeIGPY3w0h+TdaQ4Z60k+5Uhkpy8F
	kj/lk+hVro3Hwk5X5DCk/4x79J9xkJi9QgY95Dk36VsAPKgdiUKeOu6mgLx+1zc2l9WFCCV41x1wE
	zN+TdP1xdCKyEk3cYcA2EKlt1RPO7jVckApssgj5pIhJmiSnWOKwXzx9JS+RTiGODY1v/H1BKXlsT
	C6bw1YIoh14Mcw6/U2KIJ9aMluJRFi4MsB2NNOeS9CodyV4npCQ+Kwn2tbRHCWGxih4t12WibhIck
	osnKC2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1temXv-0000000ESdq-0Ns8
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 02:50:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1temXq-0000000EScL-3l44
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 02:50:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5132ht4h029044;
	Mon, 3 Feb 2025 02:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuipzKLdYKYXQcHDKVRnnhs2Nw5HUFtQLJ/FXNgtzHs=; b=BtVIQAqP6l6/ttl/
	noV4VjZ4cDJLn0cPiBeChorGmRzRhuZ2omWzaeiX4/OTqy4LB3KKBU26okvi2ymS
	EdmBr1bCtt1zSf+Xg4zDc9PzSOiYtghplwq7VCbi0W9p5haETYtpbODgiOWFib7v
	Ffl7FKAIBP6loF6cRvmV9RUISDT1XrWMdOZsjfVLAdKc4GdtJYGucyOAItYJ0lqV
	lBWp8fErWQnu2MEnWo1oRbP/3UeWGg0PaWW39X6WxF7GUTX3+9D8sFrC3mLjKyI3
	u0Ko/R5Q9f8/nL9mqrMcVGAN8ud+8lLAg1gdMUgcGo+p9JBsK0IgdZ+exQ2O9AHu
	tUQ5bw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44j6narvs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 02:50:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5132oeDt010571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 02:50:40 GMT
Received: from hu-bmahalin-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 18:50:40 -0800
From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bmahalin@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath12k: Add support for MLO Multicast handling in driver
Date: Sun, 2 Feb 2025 18:50:16 -0800
Message-ID: <20250203025016.3851279-3-quic_bmahalin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203025016.3851279-1-quic_bmahalin@quicinc.com>
References: <20250203025016.3851279-1-quic_bmahalin@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hj1M2pfIU95saCirHt3mZ5uxdvP_cAqU
X-Proofpoint-GUID: hj1M2pfIU95saCirHt3mZ5uxdvP_cAqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-02_11,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_185042_942793_F73A1BA7 
X-CRM114-Status: GOOD (  25.88  )
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

For MLO netdevice, the broadcast frame should be transmitted with the
same sequence number on all the links.

Per IEEE 802.11be-2024 section 10.3.2.14.2 "Transmitter requirements",
An AP MLD shall use SNS11 in Table 10-5 (Transmitter sequence number
spaces) maintained by the MLD to determine the sequence number of a
group addressed data frame that is transmitted by an AP affiliated
with the AP MLD so that the same group addressed Data frame
transmitted over multiple links by the AP MLD uses the same
sequence number for transmission on each link.

Currently the MLO multicast handling is done in the mac80211 layer.
Enable support for handling MLO Multicast in the driver to update the
hardware descriptors in a custom way to handle the multicast frames.
Firmware expects the MLO multicast frames to the submitted to the
hardware with special vdev_id (actual vdev_id + 128) to recognize it as
a host inspected frame to avoid using the reinjected path and it also
uses the multicast global sequence number (GSN) provided by the host
in the HTT metadata to process and transmit it with the same sequence
number.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h  |  1 +
 drivers/net/wireless/ath/ath12k/dp.h    |  6 ++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 16 ++++-
 drivers/net/wireless/ath/ath12k/dp_tx.h |  4 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 93 +++++++++++++++++++++++--
 5 files changed, 112 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 28db100cfac0..b8c336bc02d8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -330,6 +330,7 @@ struct ath12k_vif {
 	u32 key_cipher;
 	u8 tx_encap_type;
 	bool ps;
+	atomic_t mcbc_gsn;
 
 	struct ath12k_link_vif deflink;
 	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7cdc62aa35be..75435a931548 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -385,6 +385,12 @@ struct ath12k_dp {
 /* peer meta data */
 #define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 3)
 
+/* Global sequence number */
+#define HTT_TCL_META_DATA_TYPE_GLOBAL_SEQ_NUM		3
+#define HTT_TCL_META_DATA_GLOBAL_SEQ_HOST_INSPECTED	BIT(2)
+#define HTT_TCL_META_DATA_GLOBAL_SEQ_NUM		GENMASK(14, 3)
+#define HTT_TX_MLO_MCAST_HOST_REINJECT_BASE_VDEV_ID	128
+
 /* HTT tx completion is overlaid in wbm_release_ring */
 #define HTT_TX_WBM_COMP_INFO0_STATUS		GENMASK(16, 13)
 #define HTT_TX_WBM_COMP_INFO1_REINJECT_REASON	GENMASK(3, 0)
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 5ed41783d039..0c55760e3566 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -219,7 +219,7 @@ static int ath12k_dp_tx_align_payload(struct ath12k_base *ab,
 }
 
 int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
-		 struct sk_buff *skb)
+		 struct sk_buff *skb, bool gsn_valid, int mcbc_gsn)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_dp *dp = &ab->dp;
@@ -292,13 +292,27 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		msdu_ext_desc = true;
 	}
 
+	if (gsn_valid) {
+		/* Reset and Initialize meta_data_flags with Global Sequence
+		 * Number (GSN) info.
+		 */
+		ti.meta_data_flags =
+			u32_encode_bits(HTT_TCL_META_DATA_TYPE_GLOBAL_SEQ_NUM,
+					HTT_TCL_META_DATA_TYPE) |
+			u32_encode_bits(mcbc_gsn, HTT_TCL_META_DATA_GLOBAL_SEQ_NUM);
+	}
+
 	ti.encap_type = ath12k_dp_tx_get_encap_type(arvif, skb);
 	ti.addr_search_flags = arvif->hal_addr_search_flags;
 	ti.search_type = arvif->search_type;
 	ti.type = HAL_TCL_DESC_TYPE_BUFFER;
 	ti.pkt_offset = 0;
 	ti.lmac_id = ar->lmac_id;
+
 	ti.vdev_id = arvif->vdev_id;
+	if (gsn_valid)
+		ti.vdev_id += HTT_TX_MLO_MCAST_HOST_REINJECT_BASE_VDEV_ID;
+
 	ti.bss_ast_hash = arvif->ast_hash;
 	ti.bss_ast_idx = arvif->ast_idx;
 	ti.dscp_tid_tbl_idx = 0;
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.h b/drivers/net/wireless/ath/ath12k/dp_tx.h
index 46dce23501f3..a5904097dc34 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_DP_TX_H
@@ -17,7 +17,7 @@ struct ath12k_dp_htt_wbm_tx_status {
 
 int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab);
 int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
-		 struct sk_buff *skb);
+		 struct sk_buff *skb, bool gsn_valid, int mcbc_gsn);
 void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id);
 
 int ath12k_dp_tx_htt_h2t_ppdu_stats_req(struct ath12k *ar, u32 mask);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4fb7e235be66..544b4dc8aec2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7151,6 +7151,22 @@ static void ath12k_mac_add_p2p_noa_ie(struct ath12k *ar,
 	spin_unlock_bh(&ar->data_lock);
 }
 
+/* Note: called under rcu_read_lock() */
+static void ath12k_mlo_mcast_update_tx_link_address(struct ieee80211_vif *vif,
+						    u8 link, struct sk_buff *skb,
+						    u32 info_flags)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_bss_conf *bss_conf;
+
+	if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP)
+		return;
+
+	bss_conf = rcu_dereference(vif->link_conf[link]);
+	if (bss_conf)
+		ether_addr_copy(hdr->addr2, bss_conf->addr);
+}
+
 /* Note: called under rcu_read_lock() */
 static u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 				 u8 link, struct sk_buff *skb, u32 info_flags)
@@ -7262,9 +7278,15 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_key_conf *key = info->control.hw_key;
 	struct ieee80211_sta *sta = control->sta;
+	struct ath12k_link_vif *tmp_arvif;
 	u32 info_flags = info->flags;
-	struct ath12k *ar;
+	struct sk_buff *msdu_copied;
+	struct ath12k *ar, *tmp_ar;
+	unsigned long links_map;
+	bool is_mcast = false;
+	struct ethhdr *eth;
 	bool is_prb_rsp;
+	u16 mcbc_gsn;
 	u8 link_id;
 	int ret;
 
@@ -7301,6 +7323,9 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	is_prb_rsp = ieee80211_is_probe_resp(hdr->frame_control);
 
 	if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
+		eth = (struct ethhdr *)skb->data;
+		is_mcast = is_multicast_ether_addr(eth->h_dest);
+
 		skb_cb->flags |= ATH12K_SKB_HW_80211_ENCAP;
 	} else if (ieee80211_is_mgmt(hdr->frame_control)) {
 		ret = ath12k_mac_mgmt_tx(ar, skb, is_prb_rsp);
@@ -7312,14 +7337,70 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 		return;
 	}
 
+	if (!(info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP))
+		is_mcast = is_multicast_ether_addr(hdr->addr1);
+
 	/* This is case only for P2P_GO */
 	if (vif->type == NL80211_IFTYPE_AP && vif->p2p)
 		ath12k_mac_add_p2p_noa_ie(ar, vif, skb, is_prb_rsp);
 
-	ret = ath12k_dp_tx(ar, arvif, skb);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to transmit frame %d\n", ret);
-		ieee80211_free_txskb(hw, skb);
+	if (!vif->valid_links || !is_mcast ||
+	    test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags)) {
+		ret = ath12k_dp_tx(ar, arvif, skb, false, 0);
+		if (unlikely(ret)) {
+			ath12k_warn(ar->ab, "failed to transmit frame %d\n", ret);
+			ieee80211_free_txskb(ar->ah->hw, skb);
+			return;
+		}
+	} else {
+		mcbc_gsn = atomic_inc_return(&ahvif->mcbc_gsn) & 0xfff;
+
+		links_map = ahvif->links_map;
+		for_each_set_bit(link_id, &links_map,
+				 IEEE80211_MLD_MAX_NUM_LINKS) {
+			tmp_arvif = rcu_dereference(ahvif->link[link_id]);
+			if (!tmp_arvif || !tmp_arvif->is_up)
+				continue;
+
+			tmp_ar = tmp_arvif->ar;
+			msdu_copied = skb_copy(skb, GFP_ATOMIC);
+			if (!msdu_copied) {
+				ath12k_err(ar->ab,
+					   "skb copy failure link_id 0x%X vdevid 0x%X\n",
+					   link_id, tmp_arvif->vdev_id);
+				continue;
+			}
+
+			ath12k_mlo_mcast_update_tx_link_address(vif, link_id,
+								msdu_copied,
+								info_flags);
+
+			skb_cb = ATH12K_SKB_CB(msdu_copied);
+			info = IEEE80211_SKB_CB(msdu_copied);
+			skb_cb->link_id = link_id;
+
+			ret = ath12k_dp_tx(tmp_ar, tmp_arvif,
+					   msdu_copied, true, mcbc_gsn);
+
+			if (unlikely(ret)) {
+				if (ret == -ENOMEM) {
+					/* Drops are expected during heavy multicast
+					 * frame flood. Print with debug log
+					 * level to avoid lot of console prints
+					 */
+					ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+						   "failed to transmit frame %d\n",
+						   ret);
+				} else {
+					ath12k_warn(ar->ab,
+						    "failed to transmit frame %d\n",
+						    ret);
+				}
+
+				dev_kfree_skb_any(msdu_copied);
+			}
+		}
+		ieee80211_free_txskb(ar->ah->hw, skb);
 	}
 }
 
@@ -11098,6 +11179,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
 		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
 		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
+
+		ieee80211_hw_set(hw, MLO_MCAST_MULTI_LINK_TX);
 	}
 
 	hw->queues = ATH12K_HW_MAX_QUEUES;
-- 
2.34.1


