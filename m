Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BDDC54E58
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2da5FMJB4EIPg9LTpbxDKx7c28kqgLmjTeHq8PP9oY=; b=zVv9LrUA7gzaZQURmMsm5sR4ky
	ls5R6h6nyYUvt63nQV4V5SkunumCyQWBhaNWuIR75wz1jHBWnKmTlury93sGviTaY5WmyoJFFN4nZ
	N3rHh60M5jMVAWZAVEAV2bsFoQdCuXU5V+mnoTNAi1A7/wn6OdffLKptHo/18OWwe0cGPJ6iIYQl9
	R81eb3VwfG7Pi03tPjpKoALSLviQwW8fPk1BW+aVf4qfs4Wa64ZGCrtJb4Hns0p3BUQ+qO39llTYW
	SwVLlXxp7PHAuSemn6GElXS5XX/oIdYpUM9CjZnfKWdBFylzoIR0cq0D/louEZbhMnNqvs+H2VSSU
	RCox0Vmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3s-000000051Al-3njk
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 09:04:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3o-0000000517L-2mQs
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 09:04:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C4oN6k016181;
	Tue, 12 Mar 2024 09:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=X2da5FMJB4EIPg9LTpbxDKx7c28kqgLmjTeHq8PP9oY=; b=FC
	yNwPZKJxyrvq/mhyjxz79B02rxwgsoatRCTuXIceWmSx7sgmhAVrUjvYxJPamwc6
	5hZ5VBhNTyAw7/xbuTmXvo6XdqXIGU/3gfFsp9M/bCRMZNhsY1Q0d4nIpB+LZGZP
	Ugj6/aGp1QAdf1yzRDcxf6Wn4tx6CsyanzBuItea2Wgdm9Eb02FeTjoHjwJDqDe8
	D5n9JL2t6NYVxxFirEaviFSmcn8jOJ1Dz0UkrRPflHZXqiiSKgkc4lk7zENLZ0Vn
	wGOisKONKXfOw2/HpBcmu1dWyDG7JgkPZ4FGvPgBuu8FlNsphI64ZHS46m4SYB3d
	9evzxi1y5fO2fi8Vjhnw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtgc3gej2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C94ZdK013497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:35 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 02:04:33 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH v3 08/12] wifi: ath12k: Add additional checks for vif and sta iterators
Date: Tue, 12 Mar 2024 14:33:47 +0530
Message-ID: <20240312090351.1620218-9-quic_ramess@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pUxRppZ0FEyl5WRjYjLTSCgXLtM0P4ds
X-Proofpoint-GUID: pUxRppZ0FEyl5WRjYjLTSCgXLtM0P4ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=758 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_020436_813700_A7B1759A 
X-CRM114-Status: GOOD (  16.06  )
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

Since vif and sta objects of different radios are added to same
local hw list in mac80211, additional checks need to be done
in driver to ensure we are processing the intended vif
and sta corresponding to the radio when the vif and sta mac80211
iterator utils are used from driver.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 22 ++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/p2p.c  |  3 ++-
 drivers/net/wireless/ath/ath12k/p2p.h  |  1 +
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fe151aa90687..4b21e7bcec3f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -291,6 +291,7 @@ struct ath12k_vif {
 
 struct ath12k_vif_iter {
 	u32 vdev_id;
+	struct ath12k *ar;
 	struct ath12k_vif *arvif;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fab92f08fdb7..a77d6dbaea46 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -533,7 +533,8 @@ static void ath12k_get_arvif_iter(void *data, u8 *mac,
 	struct ath12k_vif_iter *arvif_iter = data;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 
-	if (arvif->vdev_id == arvif_iter->vdev_id)
+	if (arvif->vdev_id == arvif_iter->vdev_id &&
+	    arvif->ar == arvif_iter->ar)
 		arvif_iter->arvif = arvif;
 }
 
@@ -543,6 +544,7 @@ struct ath12k_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id)
 	u32 flags;
 
 	arvif_iter.vdev_id = vdev_id;
+	arvif_iter.ar = ar;
 
 	flags = IEEE80211_IFACE_ITER_RESUME_ALL;
 	ieee80211_iterate_active_interfaces_atomic(ath12k_ar_to_hw(ar),
@@ -6818,14 +6820,19 @@ struct ath12k_mac_change_chanctx_arg {
 	struct ieee80211_vif_chanctx_switch *vifs;
 	int n_vifs;
 	int next_vif;
+	struct ath12k *ar;
 };
 
 static void
 ath12k_mac_change_chanctx_cnt_iter(void *data, u8 *mac,
 				   struct ieee80211_vif *vif)
 {
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_mac_change_chanctx_arg *arg = data;
 
+	if (arvif->ar != arg->ar)
+		return;
+
 	if (rcu_access_pointer(vif->bss_conf.chanctx_conf) != arg->ctx)
 		return;
 
@@ -6836,9 +6843,13 @@ static void
 ath12k_mac_change_chanctx_fill_iter(void *data, u8 *mac,
 				    struct ieee80211_vif *vif)
 {
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_mac_change_chanctx_arg *arg = data;
 	struct ieee80211_chanctx_conf *ctx;
 
+	if (arvif->ar != arg->ar)
+		return;
+
 	ctx = rcu_access_pointer(vif->bss_conf.chanctx_conf);
 	if (ctx != arg->ctx)
 		return;
@@ -6957,7 +6968,7 @@ static void
 ath12k_mac_update_active_vif_chan(struct ath12k *ar,
 				  struct ieee80211_chanctx_conf *ctx)
 {
-	struct ath12k_mac_change_chanctx_arg arg = { .ctx = ctx };
+	struct ath12k_mac_change_chanctx_arg arg = { .ctx = ctx, .ar = ar };
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -7533,6 +7544,9 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
 	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
 	struct ath12k *ar = arvif->ar;
 
+	if (arsta->arvif != arvif)
+		return;
+
 	spin_lock_bh(&ar->data_lock);
 	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
 	spin_unlock_bh(&ar->data_lock);
@@ -7543,10 +7557,14 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
 static void ath12k_mac_disable_peer_fixed_rate(void *data,
 					       struct ieee80211_sta *sta)
 {
+	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
 	struct ath12k_vif *arvif = data;
 	struct ath12k *ar = arvif->ar;
 	int ret;
 
+	if (arsta->arvif != arvif)
+		return;
+
 	ret = ath12k_wmi_set_peer_param(ar, sta->addr,
 					arvif->vdev_id,
 					WMI_PEER_PARAM_FIXED_RATE,
diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index d334df720032..3a851ee15b2f 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -121,7 +121,7 @@ static void ath12k_p2p_noa_update_vdev_iter(void *data, u8 *mac,
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_p2p_noa_arg *arg = data;
 
-	if (arvif->vdev_id != arg->vdev_id)
+	if (arvif->ar != arg->ar || arvif->vdev_id != arg->vdev_id)
 		return;
 
 	ath12k_p2p_noa_update(arvif, arg->noa);
@@ -132,6 +132,7 @@ void ath12k_p2p_noa_update_by_vdev_id(struct ath12k *ar, u32 vdev_id,
 {
 	struct ath12k_p2p_noa_arg arg = {
 		.vdev_id = vdev_id,
+		.ar = ar,
 		.noa = noa,
 	};
 
diff --git a/drivers/net/wireless/ath/ath12k/p2p.h b/drivers/net/wireless/ath/ath12k/p2p.h
index 5768139a7844..b2eec51a9900 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.h
+++ b/drivers/net/wireless/ath/ath12k/p2p.h
@@ -12,6 +12,7 @@ struct ath12k_wmi_p2p_noa_info;
 
 struct ath12k_p2p_noa_arg {
 	u32 vdev_id;
+	struct ath12k *ar;
 	const struct ath12k_wmi_p2p_noa_info *noa;
 };
 
-- 
2.25.1


