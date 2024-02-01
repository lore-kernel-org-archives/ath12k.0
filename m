Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388A0C48286
	for <ath12k@archiver.kernel.org>; Thu,  1 Feb 2024 03:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TV6S+SxUsgpOAXSrXJ9Tfvsz/WfGAW4yRzCgDGwN0Ps=; b=n+C7y9DTAUimUomACa569SSC6D
	MD1Rj6F2CIs58T+UzixNUSFck19rsEfy3Vv2ucjb56gqh99pTMqbklhlrLbyoGs3qHLTbCiiM3cwT
	J41e9AYgNAsavmwgMlSwVmUqBk4u8ZdaU4l1Ev1Gl1P+ky9eo1hP87aZancgMhiZv0uGVmoRbPDt6
	0cXmi61tPzdYTrlFNelvSHB5zHAY1IwNDx8x1dlxAG6oZhpqx9Ysz3C5atV/UVbRkxoX1dUUybYuI
	htl6hJuP6LRPdyX4cBgbDLYjhu5Rd1s1ZKv22SeVLBxI2/j5YTpkGIBTOGCdpChiW4RwwsYAXzJN1
	Wt6uCkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVOE2-00000006RwO-3jM6
	for ath12k@archiver.kernel.org;
	Thu, 01 Feb 2024 03:58:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVODz-00000006Rvi-3TCw
	for ath12k@lists.infradead.org;
	Thu, 01 Feb 2024 03:58:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VM7qe1006534;
	Thu, 1 Feb 2024 03:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=TV6S+Sx
	UsgpOAXSrXJ9Tfvsz/WfGAW4yRzCgDGwN0Ps=; b=XfCHGdVL8Cjz/3vGlEplavT
	i5kXCF+8lLUG+I5bpEJKXLGkAYUGiuumWMQzWSWD5tlpxi6lv4KkNb9ENF7BEfhH
	ilICky1VrYYTjHbzHzFfYzwQt1quzwIdb6E0cuZDPnOdc7XsSezuaU6Yqyqr35I8
	o0hHezT68gPDONnpawZOg0tXCZJWhq0Sdg2TJtomanwQJ+vOR2x90fjUJy1wMUUf
	/o3hMY7EGyWD7DcV4KouTkYsOqzmV2nFDbiTL0xcG/ByceDL+Je4WQnWf9ixhiYO
	VQtHN6b2J3Gob659cW/hZ8R+85Dqpp34mrgOCJn7XzPP5Hnu145qep94jitQhlA=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyq0dsxyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 03:58:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4113wgPO006396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 03:58:42 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 19:58:40 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: enable 802.11 power save mode in station mode
Date: Thu, 1 Feb 2024 11:58:30 +0800
Message-ID: <20240201035830.2534-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xTp-VcRjQ2esePdtQ4ZaW7cyQkJOhDi1
X-Proofpoint-ORIG-GUID: xTp-VcRjQ2esePdtQ4ZaW7cyQkJOhDi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 mlxlogscore=709
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2402010030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_195852_021323_7E0522B8 
X-CRM114-Status: GOOD (  20.64  )
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

To reduce power consumption enable 802.11 power save mode in
station mode. This allows both radio and CPU to sleep more.

Only enable the mode on WCN7850, other chips don't support it
for now.

To test that power save mode is running, run below command and
check there is no NULL Data frame seen by a sniffer:
        iw dev <inf> set power_save off

And run below command, then check there is a NULL Data frame
in sniffer:
        iw dev <inf> set power_save on

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/hw.c   |  8 +++-
 drivers/net/wireless/ath/ath12k/hw.h   |  4 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 54 ++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 5c6c1e2eddb6..6843ec91780d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -264,6 +264,7 @@ struct ath12k_vif {
 	u8 tx_encap_type;
 	u8 vdev_stats_id;
 	u32 punct_bitmap;
+	bool ps;
 };
 
 struct ath12k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index cbb6e2b6d826..6070064a25c7 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/types.h>
@@ -917,6 +917,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.def_num_link = 0,
 		.max_mlo_peer = 256,
+
+		.supports_sta_ps = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -984,6 +986,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.def_num_link = 2,
 		.max_mlo_peer = 32,
+
+		.supports_sta_ps = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1049,6 +1053,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.def_num_link = 0,
 		.max_mlo_peer = 256,
+
+		.supports_sta_ps = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 0c3b416ae150..6a85ddbb34e4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_HW_H
@@ -195,6 +195,8 @@ struct ath12k_hw_params {
 
 	u8 def_num_link;
 	u16 max_mlo_peer;
+
+	bool supports_sta_ps;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a27480a69b27..465480f52903 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2509,12 +2509,60 @@ static int ath12k_mac_fils_discovery(struct ath12k_vif *arvif,
 	return ret;
 }
 
+static void ath12k_mac_vif_setup_ps(struct ath12k_vif *arvif)
+{
+	struct ath12k *ar = arvif->ar;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct ieee80211_conf *conf = &ath12k_ar_to_hw(ar)->conf;
+	enum wmi_sta_powersave_param param;
+	enum wmi_sta_ps_mode psmode;
+	int ret;
+	int timeout;
+	bool enable_ps;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return;
+
+	enable_ps = arvif->ps;
+	if (enable_ps) {
+		psmode = WMI_STA_PS_MODE_ENABLED;
+		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
+
+		timeout = conf->dynamic_ps_timeout;
+		if (timeout == 0) {
+			/* firmware doesn't like 0 */
+			timeout = ieee80211_tu_to_usec(vif->bss_conf.beacon_int) / 1000;
+		}
+
+		ret = ath12k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
+						  timeout);
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
+				    arvif->vdev_id, ret);
+			return;
+		}
+	} else {
+		psmode = WMI_STA_PS_MODE_DISABLED;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
+		   arvif->vdev_id, psmode ? "enable" : "disable");
+
+	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
+	if (ret)
+		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
+			    psmode, arvif->vdev_id, ret);
+}
+
 static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 					struct ath12k_vif *arvif,
 					struct ieee80211_bss_conf *info,
 					u64 changed)
 {
 	struct ieee80211_vif *vif = arvif->vif;
+	struct ieee80211_vif_cfg *vif_cfg = &vif->cfg;
 	struct cfg80211_chan_def def;
 	u32 param_id, param_value;
 	enum nl80211_band band;
@@ -2787,6 +2835,12 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 
 	if (changed & BSS_CHANGED_EHT_PUNCTURING)
 		arvif->punct_bitmap = info->eht_puncturing;
+
+	if (changed & BSS_CHANGED_PS &&
+	    ar->ab->hw_params->supports_sta_ps) {
+		arvif->ps = vif_cfg->ps;
+		ath12k_mac_vif_setup_ps(arvif);
+	}
 }
 
 static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,

base-commit: d4d13947306ab3c98c84389d9397563b550b71b8
-- 
2.25.1


