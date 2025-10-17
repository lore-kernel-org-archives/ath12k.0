Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DF1CCD184
	for <ath12k@archiver.kernel.org>; Fri, 17 Oct 2025 04:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTUpWyDCca1DPM7My1PLx0/n6qv4ieGjNfMjAfAbqA8=; b=E+PaBlzQ7rdZ9H/giQQN9Wnd7E
	3eZ8MJTuBNnOseZ0K5ROns127Pc/Yqa8Ym6P4iBidom2nBiLhNbF79s1a6n6n1aK9QJ7rudJRQx52
	wDdsktuScNSX93Lqd3pTPOnlP6T4jgXFlIM5uAMmbu1JiNJCkCARlMy6XqpIaEXhJgbUbO/5Lc7a2
	dr4wJoRSiz3/GYqoTr9z1wfcrpjWXeMc3m+6pK++ocHYEpVPxFII5KXpXk3ERRiZNuJKVZU4AzCVb
	42M/TRvw2s6A9rc4vksgNztoMh00SlKC/qkBx1KXysmvu/fcQZQKyURaa+wYgSKZ0RvtgHztJIZTG
	4GPkiNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9bu8-00000006VnV-1o97;
	Fri, 17 Oct 2025 04:17:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9bu5-00000006Vn9-3Xa2
	for ath12k@lists.infradead.org;
	Fri, 17 Oct 2025 04:17:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLPqE025253
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 04:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RTUpWyDCca1DPM7My1PLx0/n6qv4ieGjNfM
	jAfAbqA8=; b=kSn3cWVrSeoaZBd3lwqXa+jqv7ofyMBxPv5PuL21aXSlu4w+NgC
	6lvheGjSQa0bFlLp9me8VeEcOLl/v2p/TZ6TS9NZkL4F+KisQWdcR66IGGM7O+VD
	6NoN8Ezec5cr9yoV8mWS0bAIoQg7pxU421drvzfpRplJ+s+p1tVNCkI1Oo1mBTpn
	ezqfSU4X/urTRaxoJi1BqTmxQsWjyWiUcwPVoIlYksJ0tl93i5r4mxH5mJ9h5WKp
	zwx0pMBFXXOb/0xzkVkDnfPFbLXkBcEHsIMPQSI+4FuErv9gs6hrTf3uyDf5GhAL
	KuxHgYLqybZraugkwSdd/gPuHk2vivva1LQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkjs4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 04:17:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29085106b99so15871575ad.1
        for <ath12k@lists.infradead.org>; Thu, 16 Oct 2025 21:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760674639; x=1761279439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTUpWyDCca1DPM7My1PLx0/n6qv4ieGjNfMjAfAbqA8=;
        b=CqARJmhPUyz1rAD72/dUlmx8eBlzPCUXMH/Pa8A0hZ63pqQwN7ILAbBGvMR2/BUtc1
         XNDLMtYuTtfrQKrGpwY2YM74395RjY+A48jgmUkzSC5CYHrScUArZF/N3gtm98c6uc2P
         gxrGHWkxo3+Bk2a1Fudin9IzIbUXGWU4GnfEQv7zH1WjAHQ4wEVDht+BsMDl3NpyE3cB
         XUITAEHAAUmvBhpgbf7AYfkeb8CP0btN8TUYa/UJzAlTQnY5CwdtyKhLxHvmRKR/AAB5
         ddjbN0M/P+UvXljBMhxqkBF7TuRkX+iZJg3XBn67YMw36fZ1uWTnOQ+S2BHVMXnmCp7u
         LI8g==
X-Gm-Message-State: AOJu0YxoUCSD2Mm0YLUTVsp8sqF5V9lHJftovBEuV2/UfSACOSb1AIcN
	n9GMvlWLKcSqvCQqSCnbpG0dZb+Gk+JcrMwW+T1yJGk/6sXFRtX6o73pk3dF/gX1jMFvBA58vlR
	48YkxcGQ0TtnRNYucbdKxOcU9TGT7v4ByDnmGhKVG8GwsTG/FAGhrh/ZpRDNbTZdI
X-Gm-Gg: ASbGncvudUxfo7L955IwJUgeOELfIWLxuF9UWbbAFYpktKe7oZVfT6d/MLNVHpWQPM3
	MS7P09FB2PVZcsdUJLb9cB3zLEm3/t3Xqid4lB/d1VlvHqlfPrlMP/yByVvUnUArJmF5RcrZfZi
	XUQz0hZeVblZLNQTzZS8dOrVW5QOgG3Ivs0NQ3nQ+wpmYpVv1/b0G2KDXZhqXkGh3ARMfYCBMxI
	I2ZVsnJ+A5r1+l7LAYjuYXtHAziR+qCciOfGy+t0KpoOclCncLisnWkNGcxZWgKLO/fL8pKJzj4
	pcrwcerRJiDB7QP1/7k3yZqNxalxV6W3XqTvYb/EC/O7I9l1QcnoGWvS61oF05J5mv9G60KIlDg
	ZBF0I16/vEMc1mDZ8IXdYYCSxM4yvGWAiHmOj0cnY5t3WQS2jqY+upF8=
X-Received: by 2002:a17:903:1a0e:b0:290:91d2:9315 with SMTP id d9443c01a7336-290cb27ec56mr27206295ad.42.1760674638415;
        Thu, 16 Oct 2025 21:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDPDLtNR6OO725wQU7kikgleMlQ+j6EMPGh8L8U8ZvuA2EnZpDSkNAdWflnuHhTMtn5/64YQ==
X-Received: by 2002:a17:903:1a0e:b0:290:91d2:9315 with SMTP id d9443c01a7336-290cb27ec56mr27205945ad.42.1760674637881;
        Thu, 16 Oct 2025 21:17:17 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290dae3c6cbsm7407035ad.102.2025.10.16.21.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:17:17 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath12k: add support for BSS color change
Date: Thu, 16 Oct 2025 21:17:02 -0700
Message-ID: <20251017041702.1723258-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5Q-RzLEf5izmeeOclooJc9nW7wkeneNn
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1c34f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h_ugYnesCczPr4A79BAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5Q-RzLEf5izmeeOclooJc9nW7wkeneNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX27F1xfFWKGrU
 WcPdpYZ9HI3tLDb2nrlVvsIe9TOGpaEfWu/bbmUZkzNGsIO4JIH3HxJ9AzcGtM4PC4PjNvuICJ8
 dPHT8S0KN/NkQiqhqgfxJ8AJzlbhUjQzcumGlSSxJbFzRuHfHTCjzItmx5MRvyaxEEiPlhaiSR7
 d5Z1+hbQjg11StnXQXZwPNYmfn99KqBJ5bKAKhlVDZP89S7pqaqhBCgdD8sgEGxqLyf9vQXCts+
 OfuC3A3l1qxDrzSXgHjGpO3NV1mWvQ59cqJ57WsZ47jqimZgocSHCTP8dllzBnBHrv6rVdGN83p
 Qusy/2hQVoXFFtFSjRAUkvHfbTOcZ9PkLF7A5cVoqYCfTyqY6p+aVWz9diJUnd4IHxoAtaGlVu/
 nv6VzRVNnHJy+iTP0lbSE6mVoXAa1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_211722_006317_9D0489B1 
X-CRM114-Status: GOOD (  23.54  )
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

This patch add logic to parse and handle such events, and pass the data
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


