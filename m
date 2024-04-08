Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A56C67861
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0MtRO1+soqHxny4chjfSSFFBCIprjNXz7K3OWIW7yzs=; b=KWib8aB7JXZIFh9g7fwyMyQtsB
	GN0X6//0Sc7AG+4ZdjnJbqOa1FDTzZSPRzumvJKszQ9LviXiVnoHjyZCYK6P5Y0IY6k9phQMW2w0w
	1PQutbFwQuiEa/2vXEx4hxYrxabueCE+1EdMVsNEJ3H7NEzTEss3iDeOIEKq56pmL7PCgAMO+BGz/
	MNwrCk6khbmaJyisi7oEaIHYSJmL9zQB4TuvgDZxO/RclIEOvW5C8E/iyge9h8SYuQDbROwB2vn0i
	K1Nyzwy7+Flude4Ss4F7sdNA4JVENbORvxcLB8qE3vGedubZAFCfGJqUX0j+vopF7J3aTwUEWGUIL
	ahWIlmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkPS-0000000EuQ6-2M9S
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 08:31:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkPO-0000000EuNu-23Se
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 08:31:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4386e2hL013278;
	Mon, 8 Apr 2024 08:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=0MtRO1+
	soqHxny4chjfSSFFBCIprjNXz7K3OWIW7yzs=; b=d9/tD+iJdxYAEB+7LQNjXH/
	C4fc1UkLrTphAfR36s+bhyawHFJPCZrqFEmm/mCUo/2JFnxl6UJiGPjrfB0R68ma
	Dq0Gtxd00FhBDl3h1f/hywjKQtLQVZ1pu0dFeEKD2Ew6iX6McdMBGQ5QEodj7BwU
	d6qEutolX/5yC+jOEZpvXMhMTjwGLBYNSQ1s6BmG8iDTv1yvC93bNWXYe1jMzvC5
	LueKcnvK+Q6giaUFLQfpfufPTiMjPdwhO0MQeZr28Fzp6WYkPVgBwL8B7eoo9MBo
	d0j9pbNyW07/6+pL0GTIKSIzfQuOQgSPXf5RLlduic4fw7xBeMxYVmBEA9jJ7xw=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbfyg6v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 08:31:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4388VFZ3031992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 08:31:15 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 8 Apr 2024 01:31:14 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: dynamically update peer puncturing bitmap for STA
Date: Mon, 8 Apr 2024 16:30:47 +0800
Message-ID: <20240408083047.22548-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FAfzVIdcO9eySTBnHQdifBlR6__B3Ubz
X-Proofpoint-GUID: FAfzVIdcO9eySTBnHQdifBlR6__B3Ubz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_013118_563251_D46C7128 
X-CRM114-Status: GOOD (  13.21  )
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

Every time EHT Operation element changed, mac80211 will parse it and
extract the valid puncturing bitmap according to the bandwidth.

Current driver only update puncturing bitmap to firmware as vdev
parameter. Which can only meet the needs of AP. But STA will also use
it as peer parameter. If only update as vdev parameter, might cause
firmware crash. QCN9274 is the same. 

So update bandwidth and puncturing bitmap as peer parameters once they
changed for STA. Then send them to the firmware by WMI event.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v2:
    1. remove mac80211 patch because it is merged.
    2. add station mode judgment.
    3. rebased on tag: ath-202404051226.

---
 drivers/net/wireless/ath/ath12k/mac.c | 61 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 16 +++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2df966723c44..adcb2681e50e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6503,6 +6503,57 @@ ath12k_mac_change_chanctx_fill_iter(void *data, u8 *mac,
 	arg->next_vif++;
 }
 
+static u32 ath12k_mac_nlwidth_to_wmiwidth(enum nl80211_chan_width width)
+{
+	switch (width) {
+	case NL80211_CHAN_WIDTH_20:
+		return WMI_CHAN_WIDTH_20;
+	case NL80211_CHAN_WIDTH_40:
+		return WMI_CHAN_WIDTH_40;
+	case NL80211_CHAN_WIDTH_80:
+		return WMI_CHAN_WIDTH_80;
+	case NL80211_CHAN_WIDTH_160:
+		return WMI_CHAN_WIDTH_160;
+	case NL80211_CHAN_WIDTH_80P80:
+		return WMI_CHAN_WIDTH_80P80;
+	case NL80211_CHAN_WIDTH_5:
+		return WMI_CHAN_WIDTH_5;
+	case NL80211_CHAN_WIDTH_10:
+		return WMI_CHAN_WIDTH_10;
+	case NL80211_CHAN_WIDTH_320:
+		return WMI_CHAN_WIDTH_320;
+	default:
+		WARN_ON(1);
+		return WMI_CHAN_WIDTH_20;
+	}
+}
+
+static int ath12k_mac_update_peer_puncturing_width(struct ath12k *ar,
+						   struct ath12k_vif *arvif,
+						   struct cfg80211_chan_def def)
+{
+	u32 param_id, param_value;
+	int ret;
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA)
+		return 0;
+
+	param_id = WMI_PEER_CHWIDTH_PUNCTURE_20MHZ_BITMAP;
+	param_value = ath12k_mac_nlwidth_to_wmiwidth(def.width) |
+		u32_encode_bits((~def.punctured),
+				WMI_PEER_PUNCTURE_BITMAP);
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "Set puncturing bitmap %02x and width %d for vdev: %d\n",
+		   def.punctured, def.width, arvif->vdev_id);
+
+	ret = ath12k_wmi_set_peer_param(ar, arvif->bssid,
+					arvif->vdev_id, param_id,
+					param_value);
+
+	return ret;
+}
+
 static void
 ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   struct ieee80211_vif_chanctx_switch *vifs,
@@ -6595,6 +6646,16 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 				    arvif->vdev_id, ret);
 			continue;
 		}
+
+		ret = ath12k_mac_update_peer_puncturing_width(arvif->ar, arvif,
+							      vifs[i].new_ctx->def);
+		if (ret) {
+			ath12k_warn(ar->ab,
+				    "failed to update puncturing bitmap %02x and width %d: %d\n",
+				    vifs[i].new_ctx->def.punctured,
+				    vifs[i].new_ctx->def.width, ret);
+			continue;
+		}
 	}
 
 	/* Restart the internal monitor vdev on new channel */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 78afc94a815d..0941272334cd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2195,8 +2195,11 @@ enum wmi_peer_param {
 	WMI_PEER_SET_MAX_TX_RATE = 17,
 	WMI_PEER_SET_MIN_TX_RATE = 18,
 	WMI_PEER_SET_DEFAULT_ROUTING = 19,
+	WMI_PEER_CHWIDTH_PUNCTURE_20MHZ_BITMAP = 39,
 };
 
+#define WMI_PEER_PUNCTURE_BITMAP		GENMASK(23, 8)
+
 enum wmi_slot_time {
 	WMI_VDEV_SLOT_TIME_LONG = 1,
 	WMI_VDEV_SLOT_TIME_SHORT = 2,
@@ -2600,6 +2603,19 @@ struct ath12k_wmi_soc_hal_reg_caps_params {
 	__le32 num_phy;
 } __packed;
 
+enum wmi_channel_width {
+	WMI_CHAN_WIDTH_20 = 0,
+	WMI_CHAN_WIDTH_40 = 1,
+	WMI_CHAN_WIDTH_80 = 2,
+	WMI_CHAN_WIDTH_160 = 3,
+	WMI_CHAN_WIDTH_80P80 = 4,
+	WMI_CHAN_WIDTH_5 = 5,
+	WMI_CHAN_WIDTH_10 = 6,
+	WMI_CHAN_WIDTH_165 = 7,
+	WMI_CHAN_WIDTH_160P160 = 8,
+	WMI_CHAN_WIDTH_320 = 9,
+};
+
 #define WMI_MAX_EHTCAP_MAC_SIZE  2
 #define WMI_MAX_EHTCAP_PHY_SIZE  3
 #define WMI_MAX_EHTCAP_RATE_SET  3
-- 
2.34.1


