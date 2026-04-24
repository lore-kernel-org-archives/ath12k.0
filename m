Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3576FED3DA
	for <ath12k@archiver.kernel.org>; Fri, 24 Apr 2026 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeH/wRvlMGgMd5dC0u7MqW4CKB/r2MwZpbBb2EJdTBo=; b=pmPYz+1UFq/aTAHJ4Qj4TjMZAZ
	g1r9hpvebyLizhEqY1ey3SbStQfKjiCY5d4Gm0tJDAnl9BNOwWDFNlPkhonKk2aVNUF+6GR2sqDq0
	ENCnnaBq05EsUJzYIZ1wV9EvUjmEEkRIWvnNRjQU4v4a849uc4w5m0YiqAh23M0gZEglDE6Vl+aYI
	oscAcPKeEaQOZuYcWz5SsTokgV+6Px8bEdmolzOa2bQQvGrccPhLnHEzOhyvnmrd8r4n8TagI27HV
	2gCx+FRpmYHzmjxF8//E8HrKnRVQxoV8tgdGBhDOPWYa4SMJBxZ6OsyGd8/IvST4JQUHf2H4nYDq0
	TCwunmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpN-0000000DLMa-363v;
	Fri, 24 Apr 2026 14:48:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpM-0000000DLMC-3dsw
	for ath12k@bombadil.infradead.org;
	Fri, 24 Apr 2026 14:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SeH/wRvlMGgMd5dC0u7MqW4CKB/r2MwZpbBb2EJdTBo=; b=UWGitns4lABlaQCgI9wjsxHcGr
	Iv1FeiA22mWJ3FaUU4Ucu25vs0k+goeRdRBGcUqzNh3CidRtM2Rli/p6UyJz9O2Dm2MvB3C8DB/8c
	7qTxnl+aFkzsHuCSDaQzSJfGaTmH/TMPF5zKc/0JNc9b+5Fe7pEm+uXq/sKXxgs2eOd/5+0YZDBop
	QGBTdo0bib7L30kLohl/Xg/Z+29QjOBl0HqRROAQud/eyoLoYGxyNxPwQxEOCeoN/O6+yX0c2Ce/b
	bsUFNyi6TD4/3pfRUgF1mRhC2i/8HcEQJpF2Yrw4At1+/Xy+c0rXcgq8O4x6cwZiSsAs4g+IS3BA+
	lBQgqMUA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpK-0000000Ezcr-0dlg
	for ath12k@lists.infradead.org;
	Fri, 24 Apr 2026 14:48:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488b0046078so72118795e9.1
        for <ath12k@lists.infradead.org>; Fri, 24 Apr 2026 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777042096; x=1777646896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeH/wRvlMGgMd5dC0u7MqW4CKB/r2MwZpbBb2EJdTBo=;
        b=Jxj50re2rVEh/8JoByZEhB+gCkNvI0vTJm4VS+aZjFlhz5aN+f9jzyUvHrhZUboQOH
         IbzfOSgzsKCULDgL79HdFzpgLX8rXnX+QsywL60n953Pp/c6iZl+7MiUW4n7/Z5YT9jp
         f28+U/2ETGKIWCmZfCx6AoFGGeK7BvE7rYxacaQjI4xArVYIXm6WdQpdfYBHnPOiUVJb
         H+KdkL873VG5Q2j5J93ftUJntYE8QVyzCbR1OVp1Dy9p1qNpn5n2Nsaa78540o2C3Mok
         QrQM+dOn9QohgSDTcTC2V5yFwfe7pqJyDzxisRKt78r8q7SfGdMiZ1aikUwgP4HYcj06
         u3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777042096; x=1777646896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SeH/wRvlMGgMd5dC0u7MqW4CKB/r2MwZpbBb2EJdTBo=;
        b=XD0QREiFlKuuooOJ1d1OjAEOP9OVwCj4yQ56ZTPBXkOUBjSXZZRtET6Pi5DNkPOces
         3RuB3dfDunDfCuP/uayIN8z0h9Ys5QgcZmQ9P7nIpORyrmnJJmUrMuj4YnCgQHkxdMHt
         xolCtAMGSBgtZwxHzGKIx6TRTYkSmAGoftrwsT/PgfcEE/UyMtmtwRpaS4qzvVRgS3go
         JCoSTG7xbIAoKbGhiaujWsHj+36baIq9WYJl3N9qFsQbMjzorSgbLz2SAArocJBn2ewZ
         OZyEzbxfXtDsh94+lGQ3hJhaTAyD03eF8ISVfvVR6GKUqjHq8DtrtxZ/Au6VeMQ8Hf25
         Nemg==
X-Gm-Message-State: AOJu0YyaPqwQ/IEp8exLwAu44RyIdRHUTT8Id8FuR7Wd5pkUU7H6F8zO
	uQ3svW9CljxGKHMv2XvVZIll4EzUg39LfB7hY1x7rabrovmkerk2Z3ZBqCExSw==
X-Gm-Gg: AeBDiespz3UaIGiA+rFPJERH0YegK01Um7AQgjXCK6LH+v5J7Z/O1WSHsHo8HlmCVbK
	tCePtdzjDvQyE8YUOCo2XAGspVuoLmW6nEtbFxlrSGYZQpfQoRYJ7PYMRDoz4YT9SB8eccfeT/p
	CZIpQPMW8ASL6bDHsExZzinyPqxcLWxSzMkkZMl/F5EpdaUuKWyAI37jvelsY+NVRll9gWr96DC
	rzNKGpKky1h0d0iKTuEae+6qwnuFIYTj9/9IWEeOUhDbSJMsCCoQNQsAfwjmlGSoeEacbWLbEXB
	D1p58ixlxVUpECoB9lnbOYNczDv2z2+P4XzodqZd2weaViQZruh/ohRPqNIPQyYMiCdHDZUnzK5
	gPXfpzUfUid5+Fs8vjCX1odeVezhW5xCJXnCl1V1gN80/+bWl4dNDNE805HnOUCjrxTK+ATEgI7
	QbrV46kXp39i2jdtokRLKtOckZ3Mf7X2w+8Z8OsFghyem5oEP01czmLgHiegpaiBlUBeY=
X-Received: by 2002:a05:600c:a30b:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488fb750a2bmr319030345e9.10.1777042095604;
        Fri, 24 Apr 2026 07:48:15 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm157605825e9.26.2026.04.24.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 07:48:15 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath11k: fix error path leaks in some WMI calls
Date: Fri, 24 Apr 2026 16:48:13 +0200
Message-ID: <20260424144813.1708214-3-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424144813.1708214-1-nico.escande@gmail.com>
References: <20260424144813.1708214-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_154818_239152_62DC6D7B 
X-CRM114-Status: GOOD (  12.60  )
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

This is the same pattern that was previously identified as problematic:
direct 'return ath11k_wmi_cmd_send(...)' will leak the skb in the error
path if it is not explicitly handled.

Fixes: c417b247ba04 ("ath11k: implement hardware data filter")
Fixes: 9cbd7fc9be82 ("ath11k: support MAC address randomization in scan")
Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
Fixes: fec4b898f369 ("ath11k: Add WoW net-detect functionality")
Fixes: c3c36bfe998b ("ath11k: support ARP and NS offload")
Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
Fixes: 652f69ed9c1b ("ath11k: Add support for SAR")
Fixes: 0f84a156aa3b ("ath11k: Handle keepalive during WoWLAN suspend and resume")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 112 ++++++++++++++++++++++----
 1 file changed, 96 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 024c2aad9fb4..dca6e011cc40 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9299,7 +9299,7 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
 {
 	struct wmi_hw_data_filter_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9324,7 +9324,13 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
 		   "hw data filter enable %d filter_bitmap 0x%x\n",
 		   enable, filter_bitmap);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_HW_DATA_FILTER_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
@@ -9389,7 +9395,7 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 	struct sk_buff *skb;
 	struct wmi_scan_prob_req_oui_cmd *cmd;
 	u32 prob_req_oui;
-	int len;
+	int ret, len;
 
 	prob_req_oui = (((u32)mac_addr[0]) << 16) |
 		       (((u32)mac_addr[1]) << 8) | mac_addr[2];
@@ -9408,7 +9414,13 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "scan prob req oui %d\n",
 		   prob_req_oui);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SCAN_PROB_REQ_OUI_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SCAN_PROB_REQ_OUI_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_SCAN_PROB_REQ_OUI_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
@@ -9418,6 +9430,7 @@ int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 	struct wmi_wow_add_del_event_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9435,7 +9448,13 @@ int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow add wakeup event %s enable %d vdev_id %d\n",
 		   wow_wakeup_event(event), enable, vdev_id);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
@@ -9448,6 +9467,7 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 	struct sk_buff *skb;
 	u8 *ptr;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd) +
 	      sizeof(*tlv) +			/* array struct */
@@ -9540,7 +9560,13 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow add pattern vdev_id %d pattern_id %d pattern_offset %d\n",
 		   vdev_id, pattern_id, pattern_offset);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_ADD_WAKE_PATTERN_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
@@ -9548,6 +9574,7 @@ int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
 	struct wmi_wow_del_pattern_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9566,7 +9593,13 @@ int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow del pattern vdev_id %d pattern_id %d\n",
 		   vdev_id, pattern_id);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_DEL_WAKE_PATTERN_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 static struct sk_buff *
@@ -9710,6 +9743,7 @@ int ath11k_wmi_wow_config_pno(struct ath11k *ar, u32 vdev_id,
 			      struct wmi_pno_scan_req  *pno_scan)
 {
 	struct sk_buff *skb;
+	int ret;
 
 	if (pno_scan->enable)
 		skb = ath11k_wmi_op_gen_config_pno_start(ar, vdev_id, pno_scan);
@@ -9719,7 +9753,13 @@ int ath11k_wmi_wow_config_pno(struct ath11k *ar, u32 vdev_id,
 	if (IS_ERR_OR_NULL(skb))
 		return -ENOMEM;
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 static void ath11k_wmi_fill_ns_offload(struct ath11k *ar,
@@ -9837,6 +9877,7 @@ int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 	u8 *buf_ptr;
 	size_t len;
 	u8 ns_cnt, ns_ext_tuples = 0;
+	int ret;
 
 	offload = &arvif->arp_ns_offload;
 	ns_cnt = offload->ipv6_count;
@@ -9875,7 +9916,13 @@ int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 	if (ns_ext_tuples)
 		ath11k_wmi_fill_ns_offload(ar, offload, &buf_ptr, enable, 1);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_SET_ARP_NS_OFFLOAD_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
@@ -9883,7 +9930,7 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 {
 	struct wmi_gtk_rekey_offload_cmd *cmd;
 	struct ath11k_rekey_data *rekey_data = &arvif->rekey_data;
-	int len;
+	int ret, len;
 	struct sk_buff *skb;
 	__le64 replay_ctr;
 
@@ -9917,14 +9964,20 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "offload gtk rekey vdev: %d %d\n",
 		   arvif->vdev_id, enable);
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID offload\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 				 struct ath11k_vif *arvif)
 {
 	struct wmi_gtk_rekey_offload_cmd *cmd;
-	int len;
+	int ret, len;
 	struct sk_buff *skb;
 
 	len = sizeof(*cmd);
@@ -9941,7 +9994,13 @@ int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "get gtk rekey vdev_id: %d\n",
 		   arvif->vdev_id);
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID getinfo\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_val)
@@ -9951,6 +10010,7 @@ int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_va
 	struct sk_buff *skb;
 	u8 *buf_ptr;
 	u32 len, sar_len_aligned, rsvd_len_aligned;
+	int ret;
 
 	sar_len_aligned = roundup(BIOS_SAR_TABLE_LEN, sizeof(u32));
 	rsvd_len_aligned = roundup(BIOS_SAR_RSVD1_LEN, sizeof(u32));
@@ -9981,7 +10041,13 @@ int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_va
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
 
-	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
@@ -9992,6 +10058,7 @@ int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
 	struct sk_buff *skb;
 	u8 *buf_ptr;
 	u32 len, rsvd_len_aligned;
+	int ret;
 
 	rsvd_len_aligned = roundup(BIOS_SAR_RSVD2_LEN, sizeof(u32));
 	len = sizeof(*cmd) + TLV_HDR_SIZE + rsvd_len_aligned;
@@ -10011,7 +10078,13 @@ int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
 
-	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_sta_keepalive(struct ath11k *ar,
@@ -10022,6 +10095,7 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 	struct wmi_sta_keepalive_arp_resp *arp;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd) + sizeof(*arp);
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
@@ -10053,7 +10127,13 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 		   "sta keepalive vdev %d enabled %d method %d interval %d\n",
 		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
 
-	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_STA_KEEPALIVE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar)
-- 
2.53.0


