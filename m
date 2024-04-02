Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA52CD1294
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/a8uGqezUkiEILPpg/u8F0+YgMzPaGgZR9Gd8WcPy/A=; b=1mnl5i6a+fhdvfPuMKl0qb0oBm
	zvPwVo8CzD6zE7sjzGotGF6UxsnVG6t4/XH5Gh6Qof9E9ev+DTxgD6WNu2Lv58ZCB5R/LP9n2SzXF
	WHknUfnAZHmHf4benDETAcG+hYAw2QhhdXLeQsnfjactzISJR+b/2PZztQJejnigYJcRaE7DinxSk
	sHi+j2AWWRyvWRotp3aybH5IP+5k5dpBv5YNfvPRdDCx7NOiEhj4dExZX+eNt+p3gCYE2JmVJMaM5
	fJIGnCkyhIBgRvjyeaiHP3psHcv+Ac519H36YjFK2H9WF/WqaBYXHe4dveeYc5UQsF2DIzTw1YZtB
	fp+x82eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKR-0000000ComZ-3XwP
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 21:05:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKK-0000000CohC-1dvo
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 21:05:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432JvhWf009472;
	Tue, 2 Apr 2024 21:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=/a8uGqezUkiEILPpg/u8F0+YgMzPaGgZR9Gd8WcPy/A=; b=T/
	KUd8RrRPTRuJvs+BOCSWH25BzAHiJRq1EP3ukDhZf+uxXomdMIZJE3lAWFfxfljB
	B4xUTX+Q4B9xMWyJtVtvzndv1CR2SiimzasMHMaxfkP+VZS6YpTmnBlGiDI1YX70
	+MC65yDpU49c7J7Ec8Y4EapK9Qa//Tw6ltCc43pG9+bskQpYhg+bgEg41Znu7rVP
	cBeMTIZXFzAmvtKyIlKt2RNXyOa+VHaElEKpoO5gynhtVGwvgarZ+Mcap9IkWdQT
	9ZapmN8SAOfP9ZulNIG2yhywvSH7HElAPPKBzXbAaXwrurK1ww0QgwQZ3KphDZMz
	kwm29fME81zENOvGWKuA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ex7t0jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 21:05:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432L5njJ011811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 21:05:49 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 14:05:48 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 2/9] wifi: ath12k: configure MBSSID params in vdev create/start
Date: Tue, 2 Apr 2024 14:05:31 -0700
Message-ID: <20240402210538.7308-3-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240402210538.7308-1-quic_alokad@quicinc.com>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4PbKVVMAE33PWKkJzR86Ol3MXljw2SpM
X-Proofpoint-ORIG-GUID: 4PbKVVMAE33PWKkJzR86Ol3MXljw2SpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_140552_766384_C5E616A5 
X-CRM114-Status: GOOD (  20.01  )
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

Configure multiple BSSID flags and vdev_id of the transmited profile
in vdev create/start commands depending on the service bit
WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 66 ++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c |  3 ++
 drivers/net/wireless/ath/ath12k/wmi.h |  7 +++
 3 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1600e6861881..0a23d0b20f0c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5585,17 +5585,59 @@ ath12k_mac_get_vdev_stats_id(struct ath12k_vif *arvif)
 	return vdev_stats_id;
 }
 
-static void ath12k_mac_setup_vdev_create_arg(struct ath12k_vif *arvif,
-					     struct ath12k_wmi_vdev_create_arg *arg)
+static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_vif *arvif,
+					       u32 *flags, u32 *tx_vdev_id)
+{
+	struct ieee80211_vif *tx_vif = arvif->vif->mbssid_tx_vif;
+	struct ath12k *ar = arvif->ar;
+	struct ath12k_vif *tx_arvif;
+
+	if (!tx_vif)
+		return 0;
+
+	tx_arvif = ath12k_vif_to_arvif(tx_vif);
+
+	if (arvif->vif->bss_conf.nontransmitted) {
+		if (ar->ah->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+			return -EINVAL;
+
+		*flags = WMI_VDEV_MBSSID_FLAGS_NON_TRANSMIT_AP;
+		*tx_vdev_id = tx_arvif->vdev_id;
+	} else if (tx_arvif == arvif) {
+		*flags = WMI_VDEV_MBSSID_FLAGS_TRANSMIT_AP;
+	} else {
+		return -EINVAL;
+	}
+
+	if (arvif->vif->bss_conf.ema_ap)
+		*flags |= WMI_VDEV_MBSSID_FLAGS_EMA_MODE;
+
+	return 0;
+}
+
+static int ath12k_mac_setup_vdev_create_arg(struct ath12k_vif *arvif,
+					    struct ath12k_wmi_vdev_create_arg *arg)
 {
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_pdev *pdev = ar->pdev;
+	int ret;
 
 	arg->if_id = arvif->vdev_id;
 	arg->type = arvif->vdev_type;
 	arg->subtype = arvif->vdev_subtype;
 	arg->pdev_id = pdev->pdev_id;
 
+	arg->mbssid_flags = WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP;
+	arg->mbssid_tx_vdev_id = 0;
+	if (!test_bit(WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT,
+		      ar->ab->wmi_ab.svc_map)) {
+		ret = ath12k_mac_setup_vdev_params_mbssid(arvif,
+							  &arg->mbssid_flags,
+							  &arg->mbssid_tx_vdev_id);
+		if (ret)
+			return ret;
+	}
+
 	if (pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		arg->chains[NL80211_BAND_2GHZ].tx = ar->num_tx_chains;
 		arg->chains[NL80211_BAND_2GHZ].rx = ar->num_rx_chains;
@@ -5611,6 +5653,7 @@ static void ath12k_mac_setup_vdev_create_arg(struct ath12k_vif *arvif,
 	}
 
 	arg->if_stats_id = ath12k_mac_get_vdev_stats_id(arvif);
+	return 0;
 }
 
 static u32
@@ -5832,7 +5875,12 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
 		vif->hw_queue[i] = i % (ATH12K_HW_MAX_QUEUES - 1);
 
-	ath12k_mac_setup_vdev_create_arg(arvif, &vdev_arg);
+	ret = ath12k_mac_setup_vdev_create_arg(arvif, &vdev_arg);
+	if (ret) {
+		ath12k_warn(ab, "failed to create vdev parameters %d: %d\n",
+			    arvif->vdev_id, ret);
+		goto err;
+	}
 
 	ret = ath12k_wmi_vdev_create(ar, vif->addr, &vdev_arg);
 	if (ret) {
@@ -6370,10 +6418,16 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;
 
-	/* Fill the MBSSID flags to indicate AP is non MBSSID by default
-	 * Corresponding flags would be updated with MBSSID support.
-	 */
 	arg.mbssid_flags = WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP;
+	arg.mbssid_tx_vdev_id = 0;
+	if (test_bit(WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT,
+		     ar->ab->wmi_ab.svc_map)) {
+		ret = ath12k_mac_setup_vdev_params_mbssid(arvif,
+							  &arg.mbssid_flags,
+							  &arg.mbssid_tx_vdev_id);
+		if (ret)
+			return ret;
+	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4ae7e16ca042..eb515456c65a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -844,6 +844,8 @@ int ath12k_wmi_vdev_create(struct ath12k *ar, u8 *macaddr,
 	cmd->vdev_subtype = cpu_to_le32(args->subtype);
 	cmd->num_cfg_txrx_streams = cpu_to_le32(WMI_NUM_SUPPORTED_BAND_MAX);
 	cmd->pdev_id = cpu_to_le32(args->pdev_id);
+	cmd->mbssid_flags = cpu_to_le32(args->mbssid_flags);
+	cmd->mbssid_tx_vdev_id = cpu_to_le32(args->mbssid_tx_vdev_id);
 	cmd->vdev_stats_id = cpu_to_le32(args->if_stats_id);
 	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
 
@@ -1049,6 +1051,7 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
 	cmd->he_ops = cpu_to_le32(arg->he_ops);
 	cmd->punct_bitmap = cpu_to_le32(arg->punct_bitmap);
 	cmd->mbssid_flags = cpu_to_le32(arg->mbssid_flags);
+	cmd->mbssid_tx_vdev_id = cpu_to_le32(arg->mbssid_tx_vdev_id);
 
 	if (!restart) {
 		if (arg->ssid) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f70a00f2a587..29e4aa2710c1 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2148,6 +2148,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET = 213,
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
+	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
 
 	WMI_MAX_EXT_SERVICE = 256,
 
@@ -2706,6 +2707,8 @@ struct ath12k_wmi_vdev_create_arg {
 	} chains[NUM_NL80211_BANDS];
 	u32 pdev_id;
 	u8 if_stats_id;
+	u32 mbssid_flags;
+	u32 mbssid_tx_vdev_id;
 };
 
 #define ATH12K_MAX_VDEV_STATS_ID	0x30
@@ -2772,6 +2775,10 @@ struct ath12k_wmi_ssid_params {
 
 enum wmi_vdev_mbssid_flags {
 	WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP	= BIT(0),
+	WMI_VDEV_MBSSID_FLAGS_TRANSMIT_AP	= BIT(1),
+	WMI_VDEV_MBSSID_FLAGS_NON_TRANSMIT_AP	= BIT(2),
+	WMI_VDEV_MBSSID_FLAGS_EMA_MODE		= BIT(3),
+	WMI_VDEV_MBSSID_FLAGS_SCAN_MODE_VAP	= BIT(4),
 };
 
 struct wmi_vdev_start_request_cmd {
-- 
2.39.0


