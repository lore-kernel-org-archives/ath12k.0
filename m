Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA68C369C2
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogKk7Ch4n5KRdey7TSKOBxUhF8fwc5Le2tMxYatMVrc=; b=NBEedzDy9cUcemc2hCiDCDq/s3
	3P1cJPfHGgoyhmEZQqBNp+DP8jTYnYKPlvleTBQa/o35tZ1p7FsoxAFPofrAHnEw3n49vVFrB3nb7
	00rnz8oZKLO/8ucx2wfGm1+v0Ygmu0/cIFLwKP6hwUK1awAuRt3XUTdbskwUxa8Fx9JwLjD1etezP
	RvTldF2PjpMKbxaIVaY6/IS17ki9VjEuAe/qNp3HClnSj9XxM14IYTlOC0RvqNA7In3P1EZ5exIuP
	ZHOTkNtitWZ7aBPlN/28omhg0rJtEDSCinOOoW3jvIQ9KnBWoTvy8TfipkrDyKJ1vD7YgC5Y5kIUE
	O0PgD7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bwv-0000000Evgb-3gwF;
	Fri, 18 Apr 2025 02:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bwu-0000000EvgB-2PyV
	for ath12k@bombadil.infradead.org;
	Fri, 18 Apr 2025 02:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ogKk7Ch4n5KRdey7TSKOBxUhF8fwc5Le2tMxYatMVrc=; b=nyxhb7Qif8/2MFATGKF7C6eO8n
	nAj+t/YJkNxtnAsIm/0XdiDBkoHsJvfpXMvysYxODWQazCKAbyHxnV0nWwZdd7IWGRYAPCyV8Vhwm
	RVZfUZwJ3OyY5UC37Y+RfP7eIB00NtE6bonD2OpPIkDC58yTUDRFB3vHLxwHl7xicl/jlkzQ1sFvb
	4olIEMqL1REbRKmocAVbLQb3eZph5k33UvH4610DIcbiUY7P34EcxPqo/r0xQFFF3vMJVqb5eEMsm
	PpSiS6nNtdw8avoW4fts9Cs9ACqJfTfRJVLgczNrZNruM5NIF+o+AIGFr6Sq6cGayQvInK782zI97
	WgB1hR0w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5btw-0000000ASIU-45y2
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:59:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClNEm015930;
	Fri, 18 Apr 2025 02:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogKk7Ch4n5KRdey7TSKOBxUhF8fwc5Le2tMxYatMVrc=; b=Trut2AnUgVUx+l8l
	/IJbyOuFIXOAaT7gzOKYHjrmb+L6fbGkiXsv51UCR0X2i/OappfYkoYYvNqTczgY
	5s3ZC/o9OkJQ+7dftrpvbCym7y56qRNW1So3MVX5DZ+iNrtUK4Ajl8OOpPijAkJi
	UE4LGFweo/Arcs7uHtSn3RAilXJ7aLQNaFm6gP12aKRtaQkUp94BduI8xwpdEva8
	EWo+qhtiwpq5bY21oxVGWwx6bx4eWwaYhor+8WfZ4atNaYNpQDp+gTbwhfyIwhL3
	kloneoW2lKOWNEBR0piiVZnS45TgvgmheERM29iDppvHDuxZOKf+3fVjT+SSgkuz
	bVQArQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqh1jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2uFTJ021569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:15 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:56:13 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:44 +0800
Subject: [PATCH ath-next 11/15] wifi: ath12k: add parse of transmit power
 envelope element
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-11-c869c86cad60@quicinc.com>
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T_w57GWg5TQfDpAFtD5gLAzYx6Y53No0
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6801bf50 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=BOI7iK2FISCZ2k_OSdsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T_w57GWg5TQfDpAFtD5gLAzYx6Y53No0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_035723_402379_752A8E81 
X-CRM114-Status: GOOD (  16.80  )
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

The Transmit Power Envelope element conveys the local maximum transmit
power for various transmission bandwidths, this element is present in
various frames, e.g. beacon and probe response etc, transmitted by AP.
A station shall determine a local maximum transmit power from it.

So parse and save them for later use.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +
 drivers/net/wireless/ath/ath12k/mac.c  | 71 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mac.h  | 40 +++++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ef65e8b35b8cdac395ef456d0d9aa0c338b7da03..9f64fa00b131357c5c1b75f4eacae912f563416d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -317,6 +317,8 @@ struct ath12k_link_vif {
 
 	/* only used in station mode */
 	bool is_sta_assoc_link;
+
+	struct ath12k_reg_tpc_power_info reg_tpc_info;
 };
 
 struct ath12k_vif {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4d59572ff207dd084b32bff51fa973e525f2aa70..c2f3aa3ce60a32b288590bd81cdcdabe6fab547e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9742,6 +9742,72 @@ static int ath12k_start_vdev_delay(struct ath12k *ar,
 	return 0;
 }
 
+static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
+					struct ath12k_link_vif *arvif)
+{
+	struct ieee80211_bss_conf *bss_conf = ath12k_mac_get_link_bss_conf(arvif);
+	struct ath12k_reg_tpc_power_info *tpc_info = &arvif->reg_tpc_info;
+	struct ieee80211_parsed_tpe_eirp *local_non_psd, *reg_non_psd;
+	struct ieee80211_parsed_tpe_psd *local_psd, *reg_psd;
+	struct ieee80211_parsed_tpe *tpe = &bss_conf->tpe;
+	enum wmi_reg_6g_client_type client_type;
+	struct ath12k_reg_info *reg_info;
+	struct ath12k_base *ab = ar->ab;
+	bool psd_valid, non_psd_valid;
+	int i;
+
+	reg_info = ab->reg_info[ar->pdev_idx];
+	client_type = reg_info->client_type;
+
+	local_psd = &tpe->psd_local[client_type];
+	reg_psd = &tpe->psd_reg_client[client_type];
+	local_non_psd = &tpe->max_local[client_type];
+	reg_non_psd = &tpe->max_reg_client[client_type];
+
+	psd_valid = local_psd->valid | reg_psd->valid;
+	non_psd_valid = local_non_psd->valid | reg_non_psd->valid;
+
+	if (!psd_valid && !non_psd_valid) {
+		ath12k_warn(ab,
+			    "no transmit power envelope match client power type %d\n",
+			    client_type);
+		return;
+	};
+
+	if (psd_valid) {
+		tpc_info->is_psd_power = true;
+
+		tpc_info->num_pwr_levels = max(local_psd->count,
+					       reg_psd->count);
+		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
+			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
+
+		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
+			tpc_info->tpe[i] = min(local_psd->power[i],
+					       reg_psd->power[i]) / 2;
+			ath12k_dbg(ab, ATH12K_DBG_MAC,
+				   "TPE PSD power[%d] : %d\n",
+				   i, tpc_info->tpe[i]);
+		}
+	} else {
+		tpc_info->is_psd_power = false;
+		tpc_info->eirp_power = 0;
+
+		tpc_info->num_pwr_levels = max(local_non_psd->count,
+					       reg_non_psd->count);
+		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
+			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
+
+		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
+			tpc_info->tpe[i] = min(local_non_psd->power[i],
+					       reg_non_psd->power[i]) / 2;
+			ath12k_dbg(ab, ATH12K_DBG_MAC,
+				   "non PSD power[%d] : %d\n",
+				   i, tpc_info->tpe[i]);
+		}
+	}
+}
+
 static int
 ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
@@ -9780,6 +9846,11 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx assign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
+	if (ath12k_wmi_supports_6ghz_cc_ext(ar) &&
+	    ctx->def.chan->band == NL80211_BAND_6GHZ &&
+	    ahvif->vdev_type == WMI_VDEV_TYPE_STA)
+		ath12k_mac_parse_tx_pwr_env(ar, arvif);
+
 	arvif->punct_bitmap = ctx->def.punctured;
 
 	/* for some targets bss peer must be created before vdev_start */
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index da37332352fe66c350bbe8d2285ba3f76bfc9d81..d167b969406b071e95d5d2812288657f22d9092e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -67,6 +67,46 @@ struct ath12k_mac_get_any_chanctx_conf_arg {
 	struct ieee80211_chanctx_conf *chanctx_conf;
 };
 
+/**
+ * struct ath12k_chan_power_info - TPE containing power info per channel chunk
+ * @chan_cfreq: channel center freq (MHz)
+ * e.g.
+ * channel 37/20 MHz,  it is 6135
+ * channel 37/40 MHz,  it is 6125
+ * channel 37/80 MHz,  it is 6145
+ * channel 37/160 MHz, it is 6185
+ * @tx_power: transmit power (dBm)
+ */
+struct ath12k_chan_power_info {
+	u16 chan_cfreq;
+	s8 tx_power;
+};
+
+/* ath12k only deals with 320 MHz, so 16 subchannels */
+#define ATH12K_NUM_PWR_LEVELS  16
+
+/**
+ * struct ath12k_reg_tpc_power_info - regulatory TPC power info
+ * @is_psd_power: is PSD power or not
+ * @eirp_power: Maximum EIRP power (dBm), valid only if power is PSD
+ * @ap_power_type: type of power (SP/LPI/VLP)
+ * @num_pwr_levels: number of power levels
+ * @reg_max: Array of maximum TX power (dBm) per PSD value
+ * @ap_constraint_power: AP constraint power (dBm)
+ * @tpe: TPE values processed from TPE IE
+ * @chan_power_info: power info to send to firmware
+ */
+struct ath12k_reg_tpc_power_info {
+	bool is_psd_power;
+	u8 eirp_power;
+	enum wmi_reg_6g_ap_type ap_power_type;
+	u8 num_pwr_levels;
+	u8 reg_max[ATH12K_NUM_PWR_LEVELS];
+	u8 ap_constraint_power;
+	s8 tpe[ATH12K_NUM_PWR_LEVELS];
+	struct ath12k_chan_power_info chan_power_info[ATH12K_NUM_PWR_LEVELS];
+};
+
 extern const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default;
 
 #define ATH12K_SCAN_11D_INTERVAL		600000

-- 
2.34.1


