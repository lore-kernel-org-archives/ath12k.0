Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212F6CD11BF
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCsYaVEKMkGQwYzJW31btqEC9bHTe2J1o/slDIZtuM8=; b=iPetWIpM9niFBwSUR47DxFG4qw
	wwde7f3J6DuRz1VbRMbCXkFVakUGjYefaR/FtyGL2zK1hPPmYn9+xtenmkHmBb+t8C72BPPoGV1R0
	fhDqqdZwvkqoPTvjczVLqGHd3u+Rr1vjqjFtJ868YlWsaeatLcbl+BundBRrANosugpdPqSlCRBh/
	6NOmKqzbLg96EHnRvsmrOoKAnXZ4fZBUczdmL2AT/PKmkK3bZdMV/a3E3TLlu/h3omqg/WY9dSG1F
	hGdx//Pe3Fi3AGlBhPVIPKsA3zXBEDduA8UBipw5oebYfX6yrVvSSxAnt8P7BjaZwm17fHf9z/bn/
	Vz7rZiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn1Kn-00000000jZv-3E9f
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 19:10:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn1KY-00000000jST-2P2p
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 19:10:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KEjclU004888;
	Wed, 20 Mar 2024 19:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=bCsYaVEKMkGQwYzJW31btqEC9bHTe2J1o/slDIZtuM8=; b=bK
	Hi8Dxy4BfXSdQ3Q/4+r2j4YNErR7L6ed30CainqhV8wt4pPXVSw0cmFeQR39h45J
	+cBYTZau/NRG612liy221UWS1YVWCsc/qwaZ3cAXhpRQ3xiCmdQH327CVlUjwjoy
	cHlAT5JHTo6S8K/RwJU1HQGnRv6Uasve3HXELxGASKDFWEpZYE0zmL9+MrjL3Uu2
	+eHX5tfXJl7UJX5LUVQfMl82Eqpa56mburfpYq38JHN3X75SJT0TtmVqxGx8Jj6D
	Gc6FUP+G4R91lq1COHidv/UbpfrXAePLF0WodEB4FNr1Whvz9cK2zvX0miY8ONyA
	6X/2rS2y1MKp0raJb5nQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wypxq23qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 19:10:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KJAGP7016458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 19:10:16 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 20 Mar 2024 12:10:14 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH v5 08/12] wifi: ath12k: Add additional checks for vif and sta iterators
Date: Thu, 21 Mar 2024 00:39:39 +0530
Message-ID: <20240320190943.3850106-9-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320190943.3850106-1-quic_ramess@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gvnc2S9Dk0VXeLQM_zXUAje9lcDorNlQ
X-Proofpoint-GUID: gvnc2S9Dk0VXeLQM_zXUAje9lcDorNlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=839 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403200154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_121032_167179_2DACC95B 
X-CRM114-Status: GOOD (  15.62  )
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
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 22 ++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/p2p.c  |  3 ++-
 drivers/net/wireless/ath/ath12k/p2p.h  |  1 +
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fa0606c460c6..1a3162fb0cfc 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -291,6 +291,7 @@ struct ath12k_vif {
 
 struct ath12k_vif_iter {
 	u32 vdev_id;
+	struct ath12k *ar;
 	struct ath12k_vif *arvif;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0274eac33b1f..b129d5282783 100644
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
@@ -6849,14 +6851,19 @@ struct ath12k_mac_change_chanctx_arg {
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
 
@@ -6867,9 +6874,13 @@ static void
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
@@ -6988,7 +6999,7 @@ static void
 ath12k_mac_update_active_vif_chan(struct ath12k *ar,
 				  struct ieee80211_chanctx_conf *ctx)
 {
-	struct ath12k_mac_change_chanctx_arg arg = { .ctx = ctx };
+	struct ath12k_mac_change_chanctx_arg arg = { .ctx = ctx, .ar = ar };
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -7564,6 +7575,9 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
 	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
 	struct ath12k *ar = arvif->ar;
 
+	if (arsta->arvif != arvif)
+		return;
+
 	spin_lock_bh(&ar->data_lock);
 	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
 	spin_unlock_bh(&ar->data_lock);
@@ -7574,10 +7588,14 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
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


