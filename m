Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F653CF5386
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+6hPcZEaXQvpEkCYqBorhbRrNS0NWocqx0NEUZJbjE=; b=GxXzos37+boFcQA9Tf3IJS9gWU
	46GU9BefFiTBx8ae3fRDAtZtkh2kKvUg8Qqimc3Y/zEemoNyBZlc8f3cW28piUvg6AiUBdwy3InGS
	PDtqFOCk6vud1/Bz0TDeu+auKsDC5bL0KCInx6K5lyAlzmZsusbDfZ2v70F08gZ54U5Kt8SOHIx0v
	5pmWhNCyrlDTjSViPiLzVs/GnPrBGf0BBdkj05B8OWZrFiMS4glcrz9h5UboDHfEcVD9UtoKFhJYS
	hj2MNrlmv6frXblViaxMMuBJkkGJgeYjkLF/5iBZivdZDu2KoqykflXJfyK4BivWmiKUcNnPm7HiX
	FjkOAkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRL-0000000EYBf-2w8d
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 13:30:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRG-0000000EY6F-1oxe
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 13:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5ED34A44EF6
	for <ath12k@lists.infradead.org>; Wed, 23 Oct 2024 13:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EB6C4CEE4;
	Wed, 23 Oct 2024 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729690213;
	bh=25UdV06RM1zMhWc8okhUSDGQGG6N1KonlEa4Juerxus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q3NSIijHbTWwOWOElA9QrSRQvXhc9s0AZyZ8y3i7Lew4x6NGhFM8aQ+UC/He+SDBn
	 HmvXmumGI+j19/Ym3CgJ0qV0ler7xr5+cluctO/h3w8e9EneWD6PRGVWBtfdGFkgg3
	 vwPw2CNgp6GDMO7xSd+QNzCfoObtkj/ehL+vtlI06gpQPRbM+LnWFnFL/YpeTJj+wI
	 xT2tRSzJdbpWpu9PZQy4JRNxLCdm3dI9jiv8Q3gmODzP21TypOcaW3McRy9lZjoAB9
	 kMTqLAtvFWBxHExZJrzboivIsLGweg5EdJ+ebRU1BRsGxIfnuPt5EwXRh70kn0kXQ5
	 vzrBB22FyLsww==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 6/8] wifi: ath12k: add multi-link flag in peer create command
Date: Wed, 23 Oct 2024 16:30:02 +0300
Message-Id: <20241023133004.2253830-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023133004.2253830-1-kvalo@kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_063014_685934_2A230688 
X-CRM114-Status: GOOD (  11.59  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Driver should indicate to firmware whether a peer is multi-link or not in peer
create command using multi-link flag. Add changes to support
WMI_TAG_MLO_PEER_CREATE_PARAMS in WMI_PEER_CREATE_CMDID.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c |  5 +++--
 drivers/net/wireless/ath/ath12k/wmi.c | 27 +++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h |  6 ++++++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 019a1a6c6777..b628bc2fd0f5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4981,8 +4981,9 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 	}
 
 	peer_param.vdev_id = arvif->vdev_id;
-	peer_param.peer_addr = sta->addr;
+	peer_param.peer_addr = arsta->addr;
 	peer_param.peer_type = WMI_PEER_TYPE_DEFAULT;
+	peer_param.ml_enabled = sta->mlo;
 
 	ret = ath12k_peer_create(ar, arvif, sta, &peer_param);
 	if (ret) {
@@ -7016,7 +7017,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_create_arg vdev_arg = {0};
-	struct ath12k_wmi_peer_create_arg peer_param;
+	struct ath12k_wmi_peer_create_arg peer_param = {0};
 	struct ieee80211_bss_conf *link_conf;
 	u32 param_id, param_value;
 	u16 nss;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e089b58bbea1..0583d832fac7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1230,9 +1230,14 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
 	struct wmi_peer_create_cmd *cmd;
 	struct sk_buff *skb;
-	int ret;
+	int ret, len;
+	struct wmi_peer_create_mlo_params *ml_param;
+	void *ptr;
+	struct wmi_tlv *tlv;
 
-	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
+	len = sizeof(*cmd) + TLV_HDR_SIZE + sizeof(*ml_param);
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
 
@@ -1244,9 +1249,23 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
 	cmd->peer_type = cpu_to_le32(arg->peer_type);
 	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
 
+	ptr = skb->data + sizeof(*cmd);
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
+					 sizeof(*ml_param));
+	ptr += TLV_HDR_SIZE;
+	ml_param = ptr;
+	ml_param->tlv_header =
+			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
+					       sizeof(*ml_param));
+	if (arg->ml_enabled)
+		ml_param->flags = cpu_to_le32(ATH12K_WMI_FLAG_MLO_ENABLED);
+
+	ptr += sizeof(*ml_param);
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
-		   "WMI peer create vdev_id %d peer_addr %pM\n",
-		   arg->vdev_id, arg->peer_addr);
+		   "WMI peer create vdev_id %d peer_addr %pM ml_flags 0x%x\n",
+		   arg->vdev_id, arg->peer_addr, ml_param->flags);
 
 	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_PEER_CREATE_CMDID);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 33b9643644c6..07bd275608bf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3026,6 +3026,12 @@ struct ath12k_wmi_peer_create_arg {
 	const u8 *peer_addr;
 	u32 peer_type;
 	u32 vdev_id;
+	bool ml_enabled;
+};
+
+struct wmi_peer_create_mlo_params {
+	__le32 tlv_header;
+	__le32 flags;
 };
 
 struct ath12k_wmi_pdev_set_regdomain_arg {
-- 
2.39.5


