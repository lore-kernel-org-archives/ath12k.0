Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6057E77183
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VSiFztw39qS9Lcdm82vYjp1u7aaVWnt8c7FE7BjibE=; b=OPMX1uBlNst37fRY5LdlK9LD5I
	p3f5k4eR4XpnFzmRGNbDwhvSihfRs/CY1lqtPb4I1Op3Q1wq9X8TnYccLLSvT0TMd02JsT4cZ95Yt
	vy+2MQuixw39rQvd+lS8ebBSG4s099vd9CGyiK8Pd+IvXwHg0+JzdljzaEzarP96MsdPwVmjGS/F4
	a3bSRf+QNt0LBXmEz7VZhZCXpaKp4SucEgwPTru8yzJZS0Pk7O9lSBIiTzFu4l1OXkaAaP1wtRd0x
	gfPgo7Wt74kpzJrsvUhxP7i8FLtQzLmiS+XVuayXvvjs7WdtAvFENOcjwbQeLyiqQZHLuT4BuoTyT
	LFEPa2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOje-0000000FGzh-2jGO
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:34:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjc-0000000FGtl-0r8i
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92A9C5C59FD
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BA8C4CED2;
	Wed, 11 Dec 2024 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931283;
	bh=waznicM3+KHfgV1HmksA5+1fyaqEwxvI99nayrQMkMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7jPxGj3DZ4ouwTorvfuIDVK49U2c7q2aYGX6EJ1zeIT32zdoe4v6sNNreeBAe74x
	 YkwNXVuN5CuraQCovktRwuAnrxoUlqFG543nIgHschLfUWlBwN/P0StQkxeFeY+EyP
	 kPLI+FUNcyjFg+7XG7WbdlB+vyVpKEKFgVaOGxbKJQ6iF/KvAa5G6kbc5sCJjXlLU6
	 tTER/LDFsetaovTbNhxaxFk5JJGMz9tV09hHya9U2lQ/H+MR96JpX+zjB8r2dGeMpn
	 qBzGNUkD+cVnActZPPayXlYe8pOOID73TER88Gap4lkn5jbcqoYxSFQQ1crVhcgytp
	 W44zYz1pRixxA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/8] wifi: ath12k: Add MLO WMI setup and teardown functions
Date: Wed, 11 Dec 2024 17:34:30 +0200
Message-Id: <20241211153432.775335-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211153432.775335-1-kvalo@kernel.org>
References: <20241211153432.775335-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073444_351815_0C63B8C6 
X-CRM114-Status: GOOD (  15.05  )
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

From: Bhagavathi Perumal S <quic_bperumal@quicinc.com>

In case of multi device group abstraction, host has to exchange the MLO
commands such as setup, teardown and ready to firmware.

Once multi device group is ready, host has to exchange MLO setup command with
partner devices link information and followed by MLO ready command to firmware.
During deinit, MLO teardown command should be sent to firmware. Firmware would
send MLO setup complete and MLO teardown complete to host for MLO setup command
and MLO teardown command respectively.

Added WMI helper functions for the MLO setup, ready and teardown command
and the handling for corresponding event from firmware. Add appropriate WMI
tag, command id and event id to parse the event and send request.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Bhagavathi Perumal S <quic_bperumal@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 177 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  48 +++++++
 2 files changed, 225 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 402ae477da61..8f4b0941360d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7327,6 +7327,76 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	kfree(tb);
 }
 
+static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
+						struct sk_buff *skb)
+{
+	const struct wmi_mlo_setup_complete_event *ev;
+	struct ath12k *ar = NULL;
+	struct ath12k_pdev *pdev;
+	const void **tb;
+	int ret, i;
+
+	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath12k_warn(ab, "failed to parse mlo setup complete event tlv: %d\n",
+			    ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_MLO_SETUP_COMPLETE_EVENT];
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch mlo setup complete event\n");
+		kfree(tb);
+		return;
+	}
+
+	if (le32_to_cpu(ev->pdev_id) > ab->num_radios)
+		goto skip_lookup;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
+		if (pdev && pdev->pdev_id == le32_to_cpu(ev->pdev_id)) {
+			ar = pdev->ar;
+			break;
+		}
+	}
+
+skip_lookup:
+	if (!ar) {
+		ath12k_warn(ab, "invalid pdev_id %d status %u in setup complete event\n",
+			    ev->pdev_id, ev->status);
+		goto out;
+	}
+
+out:
+	kfree(tb);
+}
+
+static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
+					       struct sk_buff *skb)
+{
+	const struct wmi_mlo_teardown_complete_event *ev;
+	const void **tb;
+	int ret;
+
+	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath12k_warn(ab, "failed to parse teardown complete event tlv: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_MLO_TEARDOWN_COMPLETE];
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch teardown complete event\n");
+		kfree(tb);
+		return;
+	}
+
+	kfree(tb);
+}
+
 static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -7453,6 +7523,12 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
 		ath12k_wmi_gtk_offload_status_event(ab, skb);
 		break;
+	case WMI_MLO_SETUP_COMPLETE_EVENTID:
+		ath12k_wmi_event_mlo_setup_complete(ab, skb);
+		break;
+	case WMI_MLO_TEARDOWN_COMPLETE_EVENTID:
+		ath12k_wmi_event_teardown_complete(ab, skb);
+		break;
 	/* TODO: Add remaining events */
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
@@ -8269,3 +8345,104 @@ int ath12k_wmi_sta_keepalive(struct ath12k *ar,
 
 	return ath12k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
 }
+
+int ath12k_wmi_mlo_setup(struct ath12k *ar, struct wmi_mlo_setup_arg *mlo_params)
+{
+	struct wmi_mlo_setup_cmd *cmd;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	u32 *partner_links, num_links;
+	int i, ret, buf_len, arg_len;
+	struct sk_buff *skb;
+	struct wmi_tlv *tlv;
+	void *ptr;
+
+	num_links = mlo_params->num_partner_links;
+	arg_len = num_links * sizeof(u32);
+	buf_len = sizeof(*cmd) + TLV_HDR_SIZE + arg_len;
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, buf_len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_mlo_setup_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_SETUP_CMD,
+						 sizeof(*cmd));
+	cmd->mld_group_id = mlo_params->group_id;
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	ptr = skb->data + sizeof(*cmd);
+
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, arg_len);
+	ptr += TLV_HDR_SIZE;
+
+	partner_links = ptr;
+	for (i = 0; i < num_links; i++)
+		partner_links[i] = mlo_params->partner_link_id[i];
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_MLO_SETUP_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit WMI_MLO_SETUP_CMDID command: %d\n",
+			    ret);
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	return 0;
+}
+
+int ath12k_wmi_mlo_ready(struct ath12k *ar)
+{
+	struct wmi_mlo_ready_cmd *cmd;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_mlo_ready_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_READY_CMD,
+						 sizeof(*cmd));
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_MLO_READY_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit WMI_MLO_READY_CMDID command: %d\n",
+			    ret);
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	return 0;
+}
+
+int ath12k_wmi_mlo_teardown(struct ath12k *ar)
+{
+	struct wmi_mlo_teardown_cmd *cmd;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_mlo_teardown_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_TEARDOWN_CMD,
+						 sizeof(*cmd));
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->reason_code = WMI_MLO_TEARDOWN_SSR_REASON;
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_MLO_TEARDOWN_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit WMI MLO teardown command: %d\n",
+			    ret);
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 05aa9754118a..640720b68782 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -285,6 +285,7 @@ enum wmi_cmd_group {
 	WMI_GRP_TWT            = 0x3e,
 	WMI_GRP_MOTION_DET     = 0x3f,
 	WMI_GRP_SPATIAL_REUSE  = 0x40,
+	WMI_GRP_MLO            = 0x48,
 };
 
 #define WMI_CMD_GRP(grp_id) (((grp_id) << 12) | 0x1)
@@ -665,6 +666,10 @@ enum wmi_tlv_cmd_id {
 	WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID =
 				WMI_TLV_CMD(WMI_GRP_SPATIAL_REUSE),
 	WMI_PDEV_OBSS_PD_SPATIAL_REUSE_SET_DEF_OBSS_THRESH_CMDID,
+	WMI_MLO_LINK_SET_ACTIVE_CMDID = WMI_TLV_CMD(WMI_GRP_MLO),
+	WMI_MLO_SETUP_CMDID,
+	WMI_MLO_READY_CMDID,
+	WMI_MLO_TEARDOWN_CMDID,
 };
 
 enum wmi_tlv_event_id {
@@ -874,6 +879,9 @@ enum wmi_tlv_event_id {
 	WMI_TWT_DEL_DIALOG_EVENTID,
 	WMI_TWT_PAUSE_DIALOG_EVENTID,
 	WMI_TWT_RESUME_DIALOG_EVENTID,
+	WMI_MLO_LINK_SET_ACTIVE_RESP_EVENTID = WMI_EVT_GRP_START_ID(WMI_GRP_MLO),
+	WMI_MLO_SETUP_COMPLETE_EVENTID,
+	WMI_MLO_TEARDOWN_COMPLETE_EVENTID,
 };
 
 enum wmi_tlv_pdev_param {
@@ -5026,6 +5034,43 @@ struct wmi_twt_disable_event {
 	__le32 status;
 } __packed;
 
+struct wmi_mlo_setup_cmd {
+	__le32 tlv_header;
+	__le32 mld_group_id;
+	__le32 pdev_id;
+} __packed;
+
+struct wmi_mlo_setup_arg {
+	__le32 group_id;
+	u8 num_partner_links;
+	u8 *partner_link_id;
+};
+
+struct wmi_mlo_ready_cmd {
+	__le32 tlv_header;
+	__le32 pdev_id;
+} __packed;
+
+enum wmi_mlo_tear_down_reason_code_type {
+	WMI_MLO_TEARDOWN_SSR_REASON,
+};
+
+struct wmi_mlo_teardown_cmd {
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 reason_code;
+} __packed;
+
+struct wmi_mlo_setup_complete_event {
+	__le32 pdev_id;
+	__le32 status;
+} __packed;
+
+struct wmi_mlo_teardown_complete_event {
+	__le32 pdev_id;
+	__le32 status;
+} __packed;
+
 /* WOW structures */
 enum wmi_wow_wakeup_event {
 	WOW_BMISS_EVENT = 0,
@@ -5751,5 +5796,8 @@ int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
 				 struct ath12k_link_vif *arvif);
 int ath12k_wmi_sta_keepalive(struct ath12k *ar,
 			     const struct wmi_sta_keepalive_arg *arg);
+int ath12k_wmi_mlo_setup(struct ath12k *ar, struct wmi_mlo_setup_arg *mlo_params);
+int ath12k_wmi_mlo_ready(struct ath12k *ar);
+int ath12k_wmi_mlo_teardown(struct ath12k *ar);
 
 #endif
-- 
2.39.5


