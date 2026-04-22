Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A45FA1FC5
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bmBDooZo7vOPaIxv6eVnCqcVx+IqKCBf8vptCbn1QR0=; b=EDRTyWh2ooAzk4eMCoPTcHqFIl
	zfGu+eSJHMI6yu3vT0SwLwemHHeF2TLvIB7DaMOky0dP1BkPDPzQ3gJFFsS3dpzkwJY1OMpyrToLX
	J7JSwdXrZKq9xJluLFuuX3Drk1K1ueEBsalo+8Gzh3tGmedPaxZq+apmGwBB9Y/on1JxgC8RTm0/S
	/jVwatbIZGMjFGfpy+ODCFiBCD3SWscXp2n5lq2G5XlQwt0IqKLQzH9U7ShVYYgb1C7i9U1enEay7
	E0cE4jNwo3UHGf668UvWG0qSsLs6Mf9mm5daOKUsHpSgEBp+fryjLG2IZ2AUaJV3rFcVI1b0dfIit
	iU4qnqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaVb-0000000AWXo-0mdw;
	Wed, 22 Apr 2026 16:33:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaVY-0000000AWX4-3dqw
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 16:33:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so45614045e9.2
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776875579; x=1777480379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmBDooZo7vOPaIxv6eVnCqcVx+IqKCBf8vptCbn1QR0=;
        b=IAehJaQgp7Sb/kRORnAt7VNqN4+qQY4EOIDtkgBX5NakeSX5+3Pb85z8FVviMD08ws
         ++fVmJvGFBG1TVonUCokyH8UUoQLPPvaoAE4I8d7OGnr+c6GzUb1dFlqKoEtyL0uAa/1
         nlamZ7RuCgKNbT6ZN+unJX1tDZjMJZYrH8KM/IiVZ78rzP4nhFXoK8RtYtie97f/s7Uj
         ulBLbj6hmzgB8+yGt0Z0OaF9r0Gvuu4sRVpYdODpywFzpx9pwRWjJPjnZkXPo1g0Wa9p
         N5XazP2HhdODnED3RdBvef1tfac8DwDIo2wRVnXJL3FwTqxWlmk5PGOMzaDBQfnyFz5H
         fN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875579; x=1777480379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmBDooZo7vOPaIxv6eVnCqcVx+IqKCBf8vptCbn1QR0=;
        b=q/wKGS8MKmwbt3oNM2czmJOVgtr4XjefdqD3/HH8T/r1u7u65LapSYynq81gCPe1BQ
         fkBRWTbvgI8XEyNesgSXxXLclVwPt3vqQkPuLSdO2dLGHghaDSoBjoSGwCQJ1RHvtVjI
         vIF6dUywwZ4u2b+Q3srHyJpugjR95q+Mjc2wzQKn3uSwxceZ2UOdf2t8BzF4rTSk3Yyz
         HK8r9jzL4sgHYTRmOxRIty4NB+DXEuqmRRAopZYy2ri7NBWAvUhCoqQVIwReZ37ALYs+
         JH/MM4l0lW313bgNMDFzYDYBk1+R3aOp2SHYtbiOn2T0WxQBXFGaf8208zWfC3+oU5/C
         H+xA==
X-Gm-Message-State: AOJu0YzVQcvyc9hkgaa4J2dKxkL/6gF6PQfkgAezF9/6jcFmMorXqGa7
	u+ONeuyBS6oNu+SQAsXrt2WcEK2UG62raKEynEL/4tu53VZExV8Jy366XqUDCw==
X-Gm-Gg: AeBDievQbyXwLC6SKXd63+gB0CsGgEZBaZgacOpIZBrBJyTe/WbzqpuuyL2K/AkcRbT
	AFjEvhNW/Nxe2Wzat5WURb26FN8LrqKvUtuTrTBJ4/fv4TcD1aSAds+woXTffb7KQ/PVObEt3KO
	xQPU3i5k5pjzextUQnMMSlPjwJQpQpaejYI0LBfSv55CuhptqqUi+W5hbSnUhk0LVUb34g7xXRO
	wa8HmTegOaTCf2DwBOrlKjkBJEWUsw91BYNgqtrbCufuRxSFU1IoLDY8zwCk2jaBppaCnYS25aO
	rZ+nv0wA7wBmMY0JLD7ILmS4LyIouw7Ua5jTBm51glaoLlWuDpMsaSy+z53QTTof4+xcM8Q9hV5
	oK9BhZXzvMDdOcJsGFeLtrGr5vk7+vNtwDuqjVypQQ/wyZ17A+MM/8WSuLoH4dJtc7x3GundwYn
	k2qJcEuBtf9LZGxtr5Yp9//G80QkrypY5q62IibCOFfz9Snsfo1BCT8ZY6lZuQucaLSJg=
X-Received: by 2002:a05:600c:308a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48a54fd690emr83495655e9.12.1776875578748;
        Wed, 22 Apr 2026 09:32:58 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm46189945f8f.26.2026.04.22.09.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:32:58 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath] wifi: ath12k: fix leak in some ath12k_wmi_xxx() functions
Date: Wed, 22 Apr 2026 18:32:58 +0200
Message-ID: <20260422163258.3013872-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_093300_984698_320B621A 
X-CRM114-Status: GOOD (  11.13  )
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

Some wmi functions were using plain 'return ath12k_wmi_cmd_send(...)'
without explicitly handling the error code. This leads to leaking the skb
in case of error.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1

Fixes: 66a9448b1b89 ("wifi: ath12k: implement hardware data filter")
Fixes: 593174170919 ("wifi: ath12k: implement WoW enable and wakeup commands")
Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
Fixes: 16f474d6d49d ("wifi: ath12k: add WoW net-detect functionality")
Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
Fixes: aab4ae566fa1 ("wifi: ath12k: support GTK rekey offload")
Fixes: 7af01e569529 ("wifi: ath12k: handle keepalive during WoWLAN suspend and resume")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 103 ++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 65a05a9520ff..75c87edd2a8a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -10251,7 +10251,7 @@ int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar, struct wmi_hw_data_filter_a
 {
 	struct wmi_hw_data_filter_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10275,7 +10275,13 @@ int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar, struct wmi_hw_data_filter_a
 		   "wmi hw data filter enable %d filter_bitmap 0x%x\n",
 		   arg->enable, arg->hw_filter_bitmap);
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_HW_DATA_FILTER_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
@@ -10283,6 +10289,7 @@ int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
 	struct wmi_wow_host_wakeup_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10295,14 +10302,20 @@ int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow host wakeup ind\n");
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_wow_enable(struct ath12k *ar)
 {
 	struct wmi_wow_enable_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10317,7 +10330,13 @@ int ath12k_wmi_wow_enable(struct ath12k *ar)
 	cmd->pause_iface_config = cpu_to_le32(WOW_IFACE_PAUSE_ENABLED);
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow enable\n");
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
@@ -10327,6 +10346,7 @@ int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
 	struct wmi_wow_add_del_event_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10343,7 +10363,13 @@ int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow add wakeup event %s enable %d vdev_id %d\n",
 		   wow_wakeup_event(event), enable, vdev_id);
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_wow_add_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id,
@@ -10356,6 +10382,7 @@ int ath12k_wmi_wow_add_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id,
 	struct sk_buff *skb;
 	void *ptr;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd) +
 	      sizeof(*tlv) +			/* array struct */
@@ -10435,7 +10462,13 @@ int ath12k_wmi_wow_add_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id,
 	ath12k_dbg_dump(ar->ab, ATH12K_DBG_WMI, NULL, "wow bitmask: ",
 			bitmap->bitmaskbuf, pattern_len);
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_WOW_ADD_WAKE_PATTERN_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_wow_del_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id)
@@ -10443,6 +10476,7 @@ int ath12k_wmi_wow_del_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id)
 	struct wmi_wow_del_pattern_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10459,7 +10493,13 @@ int ath12k_wmi_wow_del_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id)
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow del pattern vdev_id %d pattern_id %d\n",
 		   vdev_id, pattern_id);
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_WOW_DEL_WAKE_PATTERN_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 static struct sk_buff *
@@ -10595,6 +10635,7 @@ int ath12k_wmi_wow_config_pno(struct ath12k *ar, u32 vdev_id,
 			      struct wmi_pno_scan_req_arg  *pno_scan)
 {
 	struct sk_buff *skb;
+	int ret;
 
 	if (pno_scan->enable)
 		skb = ath12k_wmi_op_gen_config_pno_start(ar, vdev_id, pno_scan);
@@ -10604,7 +10645,13 @@ int ath12k_wmi_wow_config_pno(struct ath12k *ar, u32 vdev_id,
 	if (IS_ERR_OR_NULL(skb))
 		return -ENOMEM;
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 static void ath12k_wmi_fill_ns_offload(struct ath12k *ar,
@@ -10717,6 +10764,7 @@ int ath12k_wmi_arp_ns_offload(struct ath12k *ar,
 	void *buf_ptr;
 	size_t len;
 	u8 ns_cnt, ns_ext_tuples = 0;
+	int ret;
 
 	ns_cnt = offload->ipv6_count;
 
@@ -10752,7 +10800,13 @@ int ath12k_wmi_arp_ns_offload(struct ath12k *ar,
 	if (ns_ext_tuples)
 		ath12k_wmi_fill_ns_offload(ar, offload, &buf_ptr, enable, 1);
 
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_SET_ARP_NS_OFFLOAD_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
@@ -10762,7 +10816,7 @@ int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
 	struct wmi_gtk_rekey_offload_cmd *cmd;
 	struct sk_buff *skb;
 	__le64 replay_ctr;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb =  ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10789,7 +10843,13 @@ int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "offload gtk rekey vdev: %d %d\n",
 		   arvif->vdev_id, enable);
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID offload\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
@@ -10797,7 +10857,7 @@ int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
 {
 	struct wmi_gtk_rekey_offload_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb =  ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -10811,7 +10871,13 @@ int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "get gtk rekey vdev_id: %d\n",
 		   arvif->vdev_id);
-	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID getinfo\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_sta_keepalive(struct ath12k *ar,
@@ -10822,6 +10888,7 @@ int ath12k_wmi_sta_keepalive(struct ath12k *ar,
 	struct wmi_sta_keepalive_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd) + sizeof(*arp);
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
@@ -10849,7 +10916,13 @@ int ath12k_wmi_sta_keepalive(struct ath12k *ar,
 		   "wmi sta keepalive vdev %d enabled %d method %d interval %d\n",
 		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
 
-	return ath12k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_STA_KEEPALIVE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath12k_wmi_mlo_setup(struct ath12k *ar, struct wmi_mlo_setup_arg *mlo_params)
-- 
2.53.0


