Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C7E77180
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLb0oYUoWyZj9dL/ARgh1zs+QKNLv5s2xoV3AAiJS3w=; b=poH/mVU1pgn8PDhmzqeghnDHQi
	DWUjF1AHbM5OU5pwGmNFoGfqo2YFo6qTTPd60L6QxvsHOjMABsHwx0jHpjQ0qFZkJ0/l7n0eIg4JH
	zZ/6Y4rYZI8sMnKX3qWT3KyDaLynJ0IQRQ6dhZWE/mxGe03ji9pCh5cGYkhdB+e0GGMb6KZDO+WSr
	tQbvZKm7or6/149EjaNs0BU8biB0FNT1CcKr5gSo2eV92Eo2JTiHJp2r+m+XdFhbAU7mdFx+Lk4JP
	tzYBG85t8n/nrtXDhW79M3z0NrnmAaogIDbhjaIm7k05zxLG17tFELmKiKEd3uMTNKJNhftrS0bmT
	8RQjN/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsh-0000000FIzW-2ruS
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOse-0000000FIwq-3nu6
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDD965C5846
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A58DC4CED2;
	Wed, 11 Dec 2024 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931844;
	bh=MMyJbEcUHzrIKi7CjVCmfdUa1sE8p9dCS1p8++sK2r4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ggnc1NYMuAqQ+Z9tiDUvQWzPpf4ju8Pyx+yEl8holSsbLhxgwXuTmno3ERZ78ugTf
	 Y232nD/LPRI+r+G9imG420E1MWrOyxPKJQFn0ror7tHnwVlRk6pr3g0rhfgBQbCg4O
	 Nv4OZFQc/vy+sdTppsxECvjflkbNhepj/Ubm+Tt8BN+52kyPuqqHqdRAQ8iqjj/E0p
	 zPMPERnM55vKsSKw3jd64xHP2eNlZ1yuM6TUERxtf4PgDgjwyZICUGXmdxX+Vl+ziF
	 77gZs4QQIbfaVkhRTeWrNGDgAdYeiPOBwcjEfmtH7f1ND0kvn/LiINBVDweXz1HLGz
	 0PNWP0fy/7AJQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/7] wifi: ath12k: add no-op without debug print in WMI Rx event
Date: Wed, 11 Dec 2024 17:43:54 +0200
Message-Id: <20241211154358.776279-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074405_049768_F25C2004 
X-CRM114-Status: GOOD (  12.22  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

Currently, certain WMI events are frequently received by the host. Since
the host lacks the logic to process these events, the console is flooded
with ‘Unknown eventid:’ debug messages.

To address this, handle these events gracefully without printing debug
messages. There is already a block of event IDs that are ignored with a debug
print. However, this new type of event occurs more frequently, so no debug
print is necessary, and handling it should be a no-op.

While at it, re-arrange the code so that all Unknown event IDs are towards
the end of the switch block.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 20 +++++++++++++-------
 drivers/net/wireless/ath/ath12k/wmi.h |  5 +++++
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e9bda625e9a7..cf5c3efec4b7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7505,13 +7505,6 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_P2P_NOA_EVENTID:
 		ath12k_wmi_p2p_noa_event(ab, skb);
 		break;
-	/* add Unsupported events here */
-	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
-	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
-	case WMI_PDEV_DMA_RING_CFG_RSP_EVENTID:
-		ath12k_dbg(ab, ATH12K_DBG_WMI,
-			   "ignoring unsupported event 0x%x\n", id);
-		break;
 	case WMI_PDEV_DFS_RADAR_DETECTION_EVENTID:
 		ath12k_wmi_pdev_dfs_radar_detected_event(ab, skb);
 		break;
@@ -7533,6 +7526,19 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_MLO_TEARDOWN_COMPLETE_EVENTID:
 		ath12k_wmi_event_teardown_complete(ab, skb);
 		break;
+	/* add Unsupported events (rare) here */
+	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
+	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
+	case WMI_PDEV_DMA_RING_CFG_RSP_EVENTID:
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "ignoring unsupported event 0x%x\n", id);
+		break;
+	/* add Unsupported events (frequent) here */
+	case WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID:
+	case WMI_MGMT_RX_FW_CONSUMED_EVENTID:
+	case WMI_OBSS_COLOR_COLLISION_DETECTION_EVENTID:
+		/* debug might flood hence silently ignore (no-op) */
+		break;
 	/* TODO: Add remaining events */
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 270ed458302e..cd3de0a65543 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -711,6 +711,8 @@ enum wmi_tlv_event_id {
 	WMI_PDEV_RAP_INFO_EVENTID,
 	WMI_CHAN_RF_CHARACTERIZATION_INFO_EVENTID,
 	WMI_SERVICE_READY_EXT2_EVENTID,
+	WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID =
+					WMI_SERVICE_READY_EXT2_EVENTID + 4,
 	WMI_VDEV_START_RESP_EVENTID = WMI_TLV_CMD(WMI_GRP_VDEV),
 	WMI_VDEV_STOPPED_EVENTID,
 	WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID,
@@ -752,6 +754,7 @@ enum wmi_tlv_event_id {
 	WMI_TBTTOFFSET_EXT_UPDATE_EVENTID,
 	WMI_OFFCHAN_DATA_TX_COMPLETION_EVENTID,
 	WMI_HOST_FILS_DISCOVERY_EVENTID,
+	WMI_MGMT_RX_FW_CONSUMED_EVENTID = WMI_HOST_FILS_DISCOVERY_EVENTID + 3,
 	WMI_TX_DELBA_COMPLETE_EVENTID = WMI_TLV_CMD(WMI_GRP_BA_NEG),
 	WMI_TX_ADDBA_COMPLETE_EVENTID,
 	WMI_BA_RSP_SSN_EVENTID,
@@ -850,6 +853,8 @@ enum wmi_tlv_event_id {
 	WMI_MDNS_STATS_EVENTID = WMI_TLV_CMD(WMI_GRP_MDNS_OFL),
 	WMI_SAP_OFL_ADD_STA_EVENTID = WMI_TLV_CMD(WMI_GRP_SAP_OFL),
 	WMI_SAP_OFL_DEL_STA_EVENTID,
+	WMI_OBSS_COLOR_COLLISION_DETECTION_EVENTID =
+				    WMI_EVT_GRP_START_ID(WMI_GRP_OBSS_OFL),
 	WMI_OCB_SET_CONFIG_RESP_EVENTID = WMI_TLV_CMD(WMI_GRP_OCB),
 	WMI_OCB_GET_TSF_TIMER_RESP_EVENTID,
 	WMI_DCC_GET_STATS_RESP_EVENTID,
-- 
2.39.5


