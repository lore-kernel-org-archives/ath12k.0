Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41211CCD199
	for <ath12k@archiver.kernel.org>; Fri, 17 Oct 2025 06:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXVip7qUUaoAmVSrXKaM0eqYjY4eXN1C0RFj768PV0I=; b=bDM63jnskKDUbsuk2ojC7OY13i
	Rx8iKYESEBahK4gr7h2uO2PhWnorWpOyf90nrarZaHviT5t9GHSGXNDmtiP2ZFeudALP9OklLCfW6
	OuUplUN/k/n41mbNOXMXiZuxp0V41voTdejlXQMz1aauwlxvbNd7XNbooWqhbWArMCZFIDZPACr3F
	5k0CtFoAZbBXeU1jeClxL7xp/8Jm4zgrEly+IlGn6nJeQ+SmXkfV2q31HyfJfrJsIG2tqOwg3ZEqd
	OuNRBAnDwAB1aQUPa4bhUbB+E0JMr40MHgmGpOcRC56rJSGH0CHLBUv8hS7wLvNIQ02UhhzGLBJfy
	/iIxMglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dWe-00000006gNq-3wxx;
	Fri, 17 Oct 2025 06:01:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dWZ-00000006gMu-1GQQ
	for ath12k@lists.infradead.org;
	Fri, 17 Oct 2025 06:01:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLO16006554
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 06:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NXVip7qUUaoAmVSrXKaM0eqYjY4eXN1C0RF
	j768PV0I=; b=Qq/SErpTVK/xGZhbMIR1MVupZwr3LkGbxcX1eYK9ou72ol0NZo7
	TdJA+tuXES1TBR2332h3U58PxaNdAQVR46W8HiMJbQxL+Mthxs/+4F1REWk14Qks
	uas4/DhscSqO4C/udp/4C4proXKN42/0pq6uGiDAZQlNjT3kF6xgLgg7PyBo94Sf
	KgCG8JuLuh/QipBXCSs/iXgmqL01q9MXE191LqaEpLqCtZigQ1jfLnWN/gSna4rI
	PA090BlvSvSOEstSFvKZL0LTJiR/2lqmmRjW5Vf1vKLASs1jG5r7YkFilER8EayO
	iKQ0ETFV7SqMl4fvEt2WkrAA6keMOS6tauA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff130ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 06:01:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so2838562a91.1
        for <ath12k@lists.infradead.org>; Thu, 16 Oct 2025 23:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680870; x=1761285670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXVip7qUUaoAmVSrXKaM0eqYjY4eXN1C0RFj768PV0I=;
        b=bkXGxa8JxRoQAeHsqz8bSsK2Re7sCdpIQmTZ1GEJmwTzqoKe1dzxUq4rIr5F57oMHj
         ImSSL9YfbEs+DPz7lfOWzSUKVYHD+0fYg7DZTRvib+DazPam/H9BYhZowXq3LNMReDZa
         57gDdPUJTIhD9RO8EwaVFccC6d2AygGy4dZ2LwzFcXutvlDwG5Ranr07qlH64V8pEDHA
         Rek06Ir40AUk554BIg2bfKS7YpxlWw/pddz3bBHBZ/hhBOX3JCN3bMB+ALszns+SYdHg
         eqMYSsnF4p0hyZnxv88SRvspLjyHZE6mSnu8SDTIf4TpNwXTj2R3xKaxcb7ON7YSgtT+
         2ucw==
X-Gm-Message-State: AOJu0Ywq5/Ay0YOealGkt1+Vt3sDA4p1nAh+H0iRobzNNAMOAlJ2hf1k
	9Ec2/UA7AQ7OtksVAEPz04fWLrQKt1efzItL1uZh24yovOvhPmgC70nzalJG2XlbzmNvouu7VcY
	odmb04KZtxLqiJrQeIyKlEvPbWaBirJiOiubk1uwJUbmjKNDC6M1SHxjSYIeHFO0+
X-Gm-Gg: ASbGncsPGbW9SKZYeWzJDg6j4pxYWWWqWQ7YPj4l15sp2nnRP8KExaoZulJPZRnL2Qv
	bR9FrUh/hXiF/yZO18nIQBoH9hdBsZ3PHZTncjqdAJ5+dU8bhrq5rwDV6sT81KiX6eUsH24CIci
	XJ8+EFB4z3tjVPg/iiFv5bd56zxlPkXrKnVBnF3vSbOkaG5JBrDfrluObzj+3/9Ag6LLTv8iYau
	1DDDM+UODzOEXCkae0Hd/oFUzW7giQv3m8h9Qeu2/YZe//dBVWSpgmI61Rm7EJVZr+CHbEVZ2/j
	3xh99K//SnRlTsBVGiYXQ/xFWl5Ri4ZamwkO62yy7byDKLma10nTUAmjZq0qPo1unWQf82sl2wW
	wdQbfmUmlO0wckjpiLx/NEKD3WzAPnLPRyaKC/EQeETXnJCoJd02RlN4=
X-Received: by 2002:a17:90b:1dc4:b0:330:6f13:53fc with SMTP id 98e67ed59e1d1-33bcf8f870bmr2674199a91.27.1760680869452;
        Thu, 16 Oct 2025 23:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM3l3MY5E0RYtBUQHvroX17kcxgvQ5ZZxaLZM9FxMwOqKf6rv6P9OM6AODTEl2oKVj8t7frA==
X-Received: by 2002:a17:90b:1dc4:b0:330:6f13:53fc with SMTP id 98e67ed59e1d1-33bcf8f870bmr2674108a91.27.1760680866945;
        Thu, 16 Oct 2025 23:01:06 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb66c5cf0sm4189172a91.21.2025.10.16.23.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:01:06 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        wei.zhang@oss.qualcomm.com
Subject: [PATCH v2 ath-next] wifi: ath12k: add support for BSS color change
Date: Thu, 16 Oct 2025 23:01:00 -0700
Message-ID: <20251017060100.1751692-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0ragO7r5VEke
 ypuavu5y4g81lk/sIYxLa8Ckupr7QQUAVKtpHofq1BIr2BpO5IOloeWjH5hRQwSh/VyhlF2lMJ1
 Rge/FiPXvfOzubMWrc7H3lbXMYS5/iVHTAToHWPD7OOGtBu3gZhQuy+RqAv5OQVVdv5EoNe+XjF
 rlmK3joN/1YRh66vkhCVp4X6tvvyQydIBB50pjlMafLih700iQdqK1MdHwv4X8GWt3BouqlCSpi
 6j9EwRV6MbnomccNYf3Srv2GmpiWnHpJZLYAd1r06zHQ46nCBZp9j4OHSijAN5I7QQCawYQ6lof
 TzR+pmlTO3bZFB27ozH5L8Yeywc2RamHhkVhJkSbQ==
X-Proofpoint-GUID: rDgyExgOc2nQxkb383Zd95C8gSiGWiWq
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f1dba6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h_ugYnesCczPr4A79BAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rDgyExgOc2nQxkb383Zd95C8gSiGWiWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_230111_552034_D14457D1 
X-CRM114-Status: GOOD (  23.56  )
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

Add support for handling BSS color collision events reported by firmware.

There are two scenarios where a BSS color collision may be detected:
1. The AP's MAC detects the collision directly, and firmware reports a
   BSS color collision event to the host.
2. A STA associated with the AP detects the collision. The notification
   frame from the peer is routed directly to the AP firmware, which handles
   it and sends the BSS color collision event to the host.

Add logic to parse and handle such events, and pass the data
up to mac80211.

Unlike CSA, firmware does not provide an offload mechanism for BSS color
change. Instead, the color change process is triggered via beacon offload
TX completion events sent by firmware.

BSS color feature is enabled depending on service flag advertised by
firmware, based on which color change functionality is invoked.

This change builds upon the following ath11k patch.
commit 886433a98425 ("ath11k: add support for BSS color change")

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
Changes in v2:
- Drop "This patch" from commit message
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 58 +++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.c  | 73 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 24 +++++++++
 4 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 02a32b9f3ac2..41da0efaa854 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -356,6 +356,7 @@ struct ath12k_link_vif {
 	bool pairwise_key_done;
 	u16 num_stations;
 	bool is_csa_in_progress;
+	struct wiphy_work bcn_tx_work;
 };
 
 struct ath12k_vif {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 86b79deacf03..eb9b9a322870 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3834,6 +3834,38 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
 		ath12k_warn(ar->ab, "failed to set beacon tx rate %d\n", ret);
 }
 
+static void ath12k_mac_bcn_tx_event(struct ath12k_link_vif *arvif)
+{
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
+	struct ieee80211_bss_conf *link_conf;
+
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(arvif->ar->ab, "failed to get link conf for vdev %u\n",
+			    arvif->vdev_id);
+		return;
+	}
+
+	if (link_conf->color_change_active) {
+		if (ieee80211_beacon_cntdwn_is_complete(vif, arvif->link_id)) {
+			ieee80211_color_change_finish(vif, arvif->link_id);
+			return;
+		}
+
+		ieee80211_beacon_update_cntdwn(vif, arvif->link_id);
+		ath12k_mac_setup_bcn_tmpl(arvif);
+	}
+}
+
+static void ath12k_mac_bcn_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	struct ath12k_link_vif *arvif = container_of(work, struct ath12k_link_vif,
+						     bcn_tx_work);
+
+	lockdep_assert_wiphy(wiphy);
+	ath12k_mac_bcn_tx_event(arvif);
+}
+
 static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
 				  struct ath12k_link_vif *arvif, int link_id)
 {
@@ -3863,6 +3895,7 @@ static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
 	INIT_LIST_HEAD(&arvif->list);
 	INIT_DELAYED_WORK(&arvif->connection_loss_work,
 			  ath12k_mac_vif_sta_connection_loss_work);
+	wiphy_work_init(&arvif->bcn_tx_work, ath12k_mac_bcn_tx_work);
 
 	arvif->num_stations = 0;
 
@@ -3900,6 +3933,7 @@ static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
 	cancel_delayed_work_sync(&arvif->connection_loss_work);
+	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &arvif->bcn_tx_work);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac remove link interface (vdev %d link id %d)",
 		   arvif->vdev_id, arvif->link_id);
@@ -4547,8 +4581,25 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 							    ATH12K_BSS_COLOR_AP_PERIODS,
 							    info->he_bss_color.enabled);
 			if (ret)
-				ath12k_warn(ar->ab, "failed to set bss color collision on vdev %i: %d\n",
+				ath12k_warn(ar->ab, "failed to set bss color collision on vdev %u: %d\n",
 					    arvif->vdev_id,  ret);
+
+			param_id = WMI_VDEV_PARAM_BSS_COLOR;
+			if (info->he_bss_color.enabled)
+				param_value = info->he_bss_color.color <<
+					      IEEE80211_HE_OPERATION_BSS_COLOR_OFFSET;
+			else
+				param_value = IEEE80211_HE_OPERATION_BSS_COLOR_DISABLED;
+
+			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+							    param_id,
+							    param_value);
+			if (ret)
+				ath12k_warn(ar->ab, "failed to set bss color param on vdev %u: %d\n",
+					    arvif->vdev_id,  ret);
+			else
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "bss color param 0x%x set on vdev %u\n",
+					   param_value, arvif->vdev_id);
 		} else if (vif->type == NL80211_IFTYPE_STATION) {
 			ret = ath12k_wmi_send_bss_color_change_enable_cmd(ar,
 									  arvif->vdev_id,
@@ -13972,6 +14023,11 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
+	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
+		     ab->wmi_ab.svc_map)) {
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BSS_COLOR);
+		ieee80211_hw_set(hw, DETECTS_COLOR_COLLISION);
+	}
 
 	wiphy->cipher_suites = cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e76275bd6916..5075d86df36f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -14,6 +14,7 @@
 #include <linux/uuid.h>
 #include <linux/time.h>
 #include <linux/of.h>
+#include <linux/cleanup.h>
 #include "core.h"
 #include "debugfs.h"
 #include "debug.h"
@@ -190,6 +191,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_11d_new_cc_event) },
 	[WMI_TAG_PER_CHAIN_RSSI_STATS] = {
 		.min_len = sizeof(struct wmi_per_chain_rssi_stat_params) },
+	[WMI_TAG_OBSS_COLOR_COLLISION_EVT] = {
+		.min_len = sizeof(struct wmi_obss_color_collision_event) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -3850,6 +3853,58 @@ int ath12k_wmi_fils_discovery(struct ath12k *ar, u32 vdev_id, u32 interval,
 	return ret;
 }
 
+static void
+ath12k_wmi_obss_color_collision_event(struct ath12k_base *ab, struct sk_buff *skb)
+{
+	const struct wmi_obss_color_collision_event *ev;
+	struct ath12k_link_vif *arvif;
+	u32 vdev_id, evt_type;
+	u64 bitmap;
+
+	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ath12k_warn(ab, "failed to parse OBSS color collision tlv %ld\n",
+			    PTR_ERR(tb));
+		return;
+	}
+
+	ev = tb[WMI_TAG_OBSS_COLOR_COLLISION_EVT];
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch OBSS color collision event\n");
+		return;
+	}
+
+	vdev_id = le32_to_cpu(ev->vdev_id);
+	evt_type = le32_to_cpu(ev->evt_type);
+	bitmap = le64_to_cpu(ev->obss_color_bitmap);
+
+	guard(rcu)();
+
+	arvif = ath12k_mac_get_arvif_by_vdev_id(ab, vdev_id);
+	if (!arvif) {
+		ath12k_warn(ab, "no arvif found for vdev %u in OBSS color collision event\n",
+			    vdev_id);
+		return;
+	}
+
+	switch (evt_type) {
+	case WMI_BSS_COLOR_COLLISION_DETECTION:
+		ieee80211_obss_color_collision_notify(arvif->ahvif->vif,
+						      bitmap,
+						      arvif->link_id);
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "obss color collision detected vdev %u event %d bitmap %016llx\n",
+			   vdev_id, evt_type, bitmap);
+		break;
+	case WMI_BSS_COLOR_COLLISION_DISABLE:
+	case WMI_BSS_COLOR_FREE_SLOT_TIMER_EXPIRY:
+	case WMI_BSS_COLOR_FREE_SLOT_AVAILABLE:
+		break;
+	default:
+		ath12k_warn(ab, "unknown OBSS color collision event type %d\n", evt_type);
+	}
+}
+
 static void
 ath12k_fill_band_to_mac_param(struct ath12k_base  *soc,
 			      struct ath12k_wmi_pdev_band_arg *arg)
@@ -7014,12 +7069,26 @@ static void ath12k_vdev_start_resp_event(struct ath12k_base *ab, struct sk_buff
 
 static void ath12k_bcn_tx_status_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
+	struct ath12k_link_vif *arvif;
+	struct ath12k *ar;
 	u32 vdev_id, tx_status;
 
 	if (ath12k_pull_bcn_tx_status_ev(ab, skb, &vdev_id, &tx_status) != 0) {
 		ath12k_warn(ab, "failed to extract bcn tx status");
 		return;
 	}
+
+	guard(rcu)();
+
+	arvif = ath12k_mac_get_arvif_by_vdev_id(ab, vdev_id);
+	if (!arvif) {
+		ath12k_warn(ab, "invalid vdev %u in bcn tx status\n",
+			    vdev_id);
+		return;
+	}
+
+	ar = arvif->ar;
+	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &arvif->bcn_tx_work);
 }
 
 static void ath12k_vdev_stopped_event(struct ath12k_base *ab, struct sk_buff *skb)
@@ -9877,6 +9946,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID:
 		ath12k_wmi_rssi_dbm_conversion_params_info_event(ab, skb);
 		break;
+	case WMI_OBSS_COLOR_COLLISION_DETECTION_EVENTID:
+		ath12k_wmi_obss_color_collision_event(ab, skb);
+		break;
 	/* add Unsupported events (rare) here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
@@ -9887,7 +9959,6 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	/* add Unsupported events (frequent) here */
 	case WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID:
 	case WMI_MGMT_RX_FW_CONSUMED_EVENTID:
-	case WMI_OBSS_COLOR_COLLISION_DETECTION_EVENTID:
 		/* debug might flood hence silently ignore (no-op) */
 		break;
 	case WMI_PDEV_UTF_EVENTID:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 64bd968989c8..911ef9d52817 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4928,6 +4928,24 @@ struct wmi_obss_spatial_reuse_params_cmd {
 #define ATH12K_BSS_COLOR_STA_PERIODS				10000
 #define ATH12K_BSS_COLOR_AP_PERIODS				5000
 
+/**
+ * enum wmi_bss_color_collision - Event types for BSS color collision handling
+ * @WMI_BSS_COLOR_COLLISION_DISABLE: Indicates that BSS color collision detection
+ *                                   is disabled.
+ * @WMI_BSS_COLOR_COLLISION_DETECTION: Event triggered when a BSS color collision
+ *                                     is detected.
+ * @WMI_BSS_COLOR_FREE_SLOT_TIMER_EXPIRY: Event indicating that the timer for waiting
+ *                                        on a free BSS color slot has expired.
+ * @WMI_BSS_COLOR_FREE_SLOT_AVAILABLE: Event indicating that a free BSS color slot
+ *                                     has become available.
+ */
+enum wmi_bss_color_collision {
+	WMI_BSS_COLOR_COLLISION_DISABLE = 0,
+	WMI_BSS_COLOR_COLLISION_DETECTION,
+	WMI_BSS_COLOR_FREE_SLOT_TIMER_EXPIRY,
+	WMI_BSS_COLOR_FREE_SLOT_AVAILABLE,
+};
+
 struct wmi_obss_color_collision_cfg_params_cmd {
 	__le32 tlv_header;
 	__le32 vdev_id;
@@ -4945,6 +4963,12 @@ struct wmi_bss_color_change_enable_params_cmd {
 	__le32 enable;
 } __packed;
 
+struct wmi_obss_color_collision_event {
+	__le32 vdev_id;
+	__le32 evt_type;
+	__le64 obss_color_bitmap;
+} __packed;
+
 #define ATH12K_IPV4_TH_SEED_SIZE 5
 #define ATH12K_IPV6_TH_SEED_SIZE 11
 

base-commit: d5ce93f136fbee2b7afbe221f34ca881036f8de3
-- 
2.34.1


