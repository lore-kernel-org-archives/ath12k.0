Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F543CD1296
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xqqOaFfBE4Gyh5O+tDEbdi8srqo+WYGp8/jgsm2Po4=; b=OZkQYxHPzII5KRI7cQS5KNkyE3
	V8WE7WCrTrOpJ2s8B4y73XCyeG1NReJSDoSQtbj1gnuLAtoD1I9onikgPQoNcdnSRXWE8Q3DrBLb0
	wx8G+x8kIrIwtDK5UguPhzC8e5iHri716PDXyvVGEpL3xPOo1GS5sFcH/Rp2WnH/iXQpD6rC/z8rb
	0zwOIZap0SfTNKIDYY2cwHflzXyzzKlVj8eB2LQGR0E7GaCXC4/0Xy9+yF3az7xdPxN83HIFbI3DT
	UIXGdgQ8xLGdEhAci+uGTzzYbGl83Da+mg5AvuDK4OsKOCEyFapRm6y0DDuvY3P1QNAQDZ3VYZsrw
	TccsT4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rspVW-00000008ghT-2t0t
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 19:45:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rspVT-00000008gfy-47zb
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 19:45:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435JQZUn025059;
	Fri, 5 Apr 2024 19:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=+xqqOaFfBE4Gyh5O+tDEbdi8srqo+WYGp8/jgsm2Po4=; b=By
	wo6MdP5O9/D3cmXyxDNKexOfOCJt2pysuIepyuY+gd56ZdS/UkebNzpCUOMpWTIn
	DnrNvcYoD2RAutaJDUpEE3nNOweI+p6EcEB/H2jh52j/qK2zh2u9/J62/NML9+st
	IwGsJu58Ae1LymBUu/Dvp6Q291ZHMmIYqgawcpuho0YMQWp/8pmbwHcskP7adllj
	TRhqRtXnZA5jF7YQ1p3nZn5Ems/dZdbIuXYaxr6qu/vZj+ZqNWQLaLTrb76btcIo
	QU83kt/+a13eH+fPcqQe1KQtFQP4DEJlZAva2jq9+1sQ4VxkgFhs2GF/CVYSVycJ
	hW5OG/hf2ruhpGXpf5aA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa8fc248c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 19:45:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435Jjjdh017913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 19:45:45 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:45:43 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v7 05/12] wifi: ath12k: scan statemachine changes for single wiphy
Date: Sat, 6 Apr 2024 01:15:12 +0530
Message-ID: <20240405194519.1337906-6-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405194519.1337906-1-quic_ramess@quicinc.com>
References: <20240405194519.1337906-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OA5FaH4BJxMBcHSNl9cnM0LNvuesUuMo
X-Proofpoint-ORIG-GUID: OA5FaH4BJxMBcHSNl9cnM0LNvuesUuMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_124548_393566_387F3E19 
X-CRM114-Status: GOOD (  32.72  )
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

When multiple radios are advertised as a single wiphy which
supports various bands, a default scan request to mac80211
from cfg80211 will split the driver request based on band,
so each request will have channels belonging to the same band.
With this supported by default, the ath12k driver on receiving
this request checks for one of the channels in the request and
selects the corresponding radio(ar) on which the scan is going
to be performed and creates a vdev on that radio.

Note that on scan completion this vdev is not deleted. If a new
scan request is seen on that same vif for a different band the
vdev will be deleted and created on the new radio supporting the
request. The vdev delete logic is refactored to have this done
dynamically.

The reason for not deleting the vdev on scan stop is to avoid
repeated delete-create sequence if the scan is on the same band.
Also, during channel assign, new vdev creation can be optimized
as well.

Also if the scan is requested when the vdev is in started state,
no switching to new radio is allowed and scan on channels only
within same radio is allowed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 214 +++++++++++++++++++++-----
 1 file changed, 176 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd22d9d8f7d9..f1c1d3030e74 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -245,6 +245,8 @@ static const u32 ath12k_smps_map[] = {
 static int ath12k_start_vdev_delay(struct ath12k *ar,
 				   struct ath12k_vif *arvif);
 static void ath12k_mac_stop(struct ath12k *ar);
+static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif);
+static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ieee80211_vif *vif);
 
 static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
 {
@@ -3010,6 +3012,42 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static struct ath12k*
+ath12k_mac_select_scan_device(struct ieee80211_hw *hw,
+			      struct ieee80211_vif *vif,
+			      struct ieee80211_scan_request *req)
+{
+	struct ath12k_hw *ah = hw->priv;
+	enum nl80211_band band;
+	struct ath12k *ar;
+	int i;
+
+	if (ah->num_radio == 1)
+		return ah->radio;
+
+	/* Currently mac80211 supports splitting scan requests into
+	 * multiple scan requests per band.
+	 * Loop through first channel and determine the scan radio
+	 * TODO: There could be 5 GHz low/high channels in that case
+	 * split the hw request and perform multiple scans
+	 */
+
+	if (req->req.channels[0]->center_freq < ATH12K_MIN_5G_FREQ)
+		band = NL80211_BAND_2GHZ;
+	else if (req->req.channels[0]->center_freq < ATH12K_MIN_6G_FREQ)
+		band = NL80211_BAND_5GHZ;
+	else
+		band = NL80211_BAND_6GHZ;
+
+	for_each_ar(ah, ar, i) {
+		/* TODO 5 GHz low high split changes */
+		if (ar->mac.sbands[band].channels)
+			return ar;
+	}
+
+	return NULL;
+}
+
 void __ath12k_mac_scan_finish(struct ath12k *ar)
 {
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
@@ -3179,15 +3217,68 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				 struct ieee80211_scan_request *hw_req)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar;
+	struct ath12k *ar, *prev_ar;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct cfg80211_scan_request *req = &hw_req->req;
 	struct ath12k_wmi_scan_req_arg arg = {};
 	int ret;
 	int i;
+	bool create = true;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	if (ah->num_radio == 1) {
+		WARN_ON(!arvif->is_created);
+		ar = ath12k_ah_to_ar(ah, 0);
+		goto scan;
+	}
+
+	/* Since the targeted scan device could depend on the frequency
+	 * requested in the hw_req, select the corresponding radio
+	 */
+	ar = ath12k_mac_select_scan_device(hw, vif, hw_req);
+	if (!ar)
+		return -EINVAL;
+
+	/* If the vif is already assigned to a specific vdev of an ar,
+	 * check whether its already started, vdev which is started
+	 * are not allowed to switch to a new radio.
+	 * If the vdev is not started, but was earlier created on a
+	 * different ar, delete that vdev and create a new one. We don't
+	 * delete at the scan stop as an optimization to avoid redundant
+	 * delete-create vdev's for the same ar, in case the request is
+	 * always on the same band for the vif
+	 */
+	if (arvif->is_created) {
+		if (WARN_ON(!arvif->ar))
+			return -EINVAL;
+
+		if (ar != arvif->ar && arvif->is_started)
+			return -EINVAL;
 
+		if (ar != arvif->ar) {
+			/* backup the previously used ar ptr, since the vdev delete
+			 * would assign the arvif->ar to NULL after the call
+			 */
+			prev_ar = arvif->ar;
+			mutex_lock(&prev_ar->conf_mutex);
+			ret = ath12k_mac_vdev_delete(prev_ar, vif);
+			mutex_unlock(&prev_ar->conf_mutex);
+			if (ret)
+				ath12k_warn(prev_ar->ab,
+					    "unable to delete scan vdev %d\n", ret);
+		} else {
+			create = false;
+		}
+	}
+	if (create) {
+		mutex_lock(&ar->conf_mutex);
+		ret = ath12k_mac_vdev_create(ar, vif);
+		mutex_unlock(&ar->conf_mutex);
+		if (ret) {
+			ath12k_warn(ar->ab, "unable to create scan vdev %d\n", ret);
+			return -EINVAL;
+		}
+	}
+scan:
 	mutex_lock(&ar->conf_mutex);
 
 	spin_lock_bh(&ar->data_lock);
@@ -3273,10 +3364,13 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k *ar;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	if (!arvif->is_created)
+		return;
+
+	ar = arvif->ar;
 
 	mutex_lock(&ar->conf_mutex);
 	ath12k_scan_abort(ar);
@@ -5952,6 +6046,7 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 	if (vif->type != NL80211_IFTYPE_MONITOR && ar->monitor_conf_enabled)
 		ath12k_mac_monitor_vdev_create(ar);
 
+	arvif->ar = ar;
 	return ret;
 
 err_peer_del:
@@ -5978,6 +6073,7 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
 	ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->num_created_vdevs--;
 	arvif->is_created = false;
+	arvif->ar = NULL;
 	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
 	ab->free_vdev_map |= 1LL << arvif->vdev_id;
 	ab->free_vdev_stats_id_map &= ~(1LL << arvif->vdev_stats_id);
@@ -5996,15 +6092,10 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 {
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
 	struct ath12k_hw *ah = hw->priv;
+	struct ath12k *ar, *prev_ar;
 	struct ath12k_base *ab;
-	struct ath12k *ar;
 	int ret;
 
-	if (arvif->ar) {
-		WARN_ON(!arvif->is_created);
-		goto out;
-	}
-
 	if (ah->num_radio == 1)
 		ar = ah->radio;
 	else if (ctx)
@@ -6015,8 +6106,43 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	if (!ar)
 		return NULL;
 
+	if (arvif->ar) {
+		/* This is not expected really */
+		if (WARN_ON(!arvif->is_created)) {
+			arvif->ar = NULL;
+			return NULL;
+		}
+
+		if (ah->num_radio == 1)
+			return arvif->ar;
+
+		/* This can happen as scan vdev gets created during multiple scans
+		 * across different radios before a vdev is brought up in
+		 * a certain radio.
+		 */
+		if (ar != arvif->ar) {
+			if (WARN_ON(arvif->is_started))
+				return NULL;
+
+			/* backup the previously used ar ptr since arvif->ar would
+			 * be set to NULL after vdev delete is done
+			 */
+			prev_ar = arvif->ar;
+			mutex_lock(&prev_ar->conf_mutex);
+			ret = ath12k_mac_vdev_delete(prev_ar, vif);
+
+			if (ret)
+				ath12k_warn(prev_ar->ab, "unable to delete vdev %d\n",
+					    ret);
+			mutex_unlock(&prev_ar->conf_mutex);
+		}
+	}
+
 	ab = ar->ab;
 
+	if (arvif->is_created)
+		goto out;
+
 	mutex_lock(&ar->conf_mutex);
 
 	if (vif->type == NL80211_IFTYPE_AP &&
@@ -6108,33 +6234,14 @@ static void ath12k_mac_vif_unref(struct ath12k_dp *dp, struct ieee80211_vif *vif
 	}
 }
 
-static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
-					   struct ieee80211_vif *vif)
+static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ieee80211_vif *vif)
 {
-	struct ath12k *ar;
 	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
-	struct ath12k_base *ab;
+	struct ath12k_base *ab = ar->ab;
 	unsigned long time_left;
 	int ret;
 
-	if (!arvif->is_created)
-		return;
-
-	ar = arvif->ar;
-	ab = ar->ab;
-
-	mutex_lock(&ar->conf_mutex);
-
-	ath12k_dbg(ab, ATH12K_DBG_MAC, "mac remove interface (vdev %d)\n",
-		   arvif->vdev_id);
-
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
-		ret = ath12k_peer_delete(ar, arvif->vdev_id, vif->addr);
-		if (ret)
-			ath12k_warn(ab, "failed to submit AP self-peer removal on vdev %d: %d\n",
-				    arvif->vdev_id, ret);
-	}
-
+	lockdep_assert_held(&ar->conf_mutex);
 	reinit_completion(&ar->vdev_delete_done);
 
 	ret = ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
@@ -6151,6 +6258,10 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 		goto err_vdev_del;
 	}
 
+	ab->free_vdev_map |= 1LL << arvif->vdev_id;
+	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
+	ar->num_created_vdevs--;
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ar->monitor_vdev_id = -1;
 		ar->monitor_vdev_created = false;
@@ -6158,12 +6269,6 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 		ret = ath12k_mac_monitor_vdev_delete(ar);
 	}
 
-	ab->free_vdev_map |= 1LL << (arvif->vdev_id);
-	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
-	ab->free_vdev_stats_id_map &= ~(1LL << arvif->vdev_stats_id);
-	ar->num_created_vdevs--;
-	arvif->is_created = false;
-
 	ath12k_dbg(ab, ATH12K_DBG_MAC, "vdev %pM deleted, vdev_id %d\n",
 		   vif->addr, arvif->vdev_id);
 
@@ -6185,6 +6290,39 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	clear_bit(ATH12K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
 
 	/* TODO: recal traffic pause state based on the available vdevs */
+	arvif->is_created = false;
+	arvif->ar = NULL;
+
+	return ret;
+}
+
+static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif)
+{
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+	struct ath12k_base *ab;
+	struct ath12k *ar;
+	int ret;
+
+	if (!arvif->is_created)
+		return;
+
+	ar = arvif->ar;
+	ab = ar->ab;
+
+	mutex_lock(&ar->conf_mutex);
+
+	ath12k_dbg(ab, ATH12K_DBG_MAC, "mac remove interface (vdev %d)\n",
+		   arvif->vdev_id);
+
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		ret = ath12k_peer_delete(ar, arvif->vdev_id, vif->addr);
+		if (ret)
+			ath12k_warn(ab, "failed to submit AP self-peer removal on vdev %d: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
+	ath12k_mac_vdev_delete(ar, vif);
 
 	mutex_unlock(&ar->conf_mutex);
 }
-- 
2.25.1


