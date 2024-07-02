Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3F7C3064D
	for <ath12k@archiver.kernel.org>; Tue,  2 Jul 2024 11:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV/ANj3jKAjuMpJ11DXLC1T9vhymTAa8DJXksYH6ngI=; b=O2UAh4Ih7oTRphnSa7UYAqamQP
	VosAXnX1KN7r/dtIRtig4tNHcP46xDSLqP5LGefhFIJT84yRbrkTs9ntsvHYpVlqbuh8ja1tRddi4
	PCNGntU8HdlVk+0MglGQvxIx9lFdFrtRk0MW0MOGaZ2BvKLplihzykauGI1Pvqg/dfsKub1rommwS
	lyiNgllU8SCEVK5M31rackucD+5Hvm5hvI363i05gLJvUF7+Hnq213rbGe9vB6tAMYCmsnaY3T69O
	c7NcuO0X5iBLQ1bTlGrHUSXsKK2GIU8VUsG1xAb6e7eWXYxCJuc/FAMFZSkiVyns5bAYru4WpuA57
	sUvU1p4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc6f-00000006aKQ-1koQ
	for ath12k@archiver.kernel.org;
	Tue, 02 Jul 2024 11:55:33 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc6c-00000006aK2-43Hd
	for ath12k@lists.infradead.org;
	Tue, 02 Jul 2024 11:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JV/ANj3jKAjuMpJ11DXLC1T9vhymTAa8DJXksYH6ngI=; b=DvPfiuZPh3OrczUpTlHXEedC+0
	lfEO1v2N4yIZzycUiAKp20x0PKdzlFNNlMM97sPCn8a2LBJpT+AtlGXwOE7CMsGhB35/N6LToQBCD
	90nXcYh9prQ3NzpWZPppM/sEJiqXj0zGGIwUq687xQl0IWr61uD1E++KXcPOkcNg0cmM=;
Received: from p54ae9766.dip0.t-ipconnect.de ([84.174.151.102] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sObnt-001lDm-0Q;
	Tue, 02 Jul 2024 13:36:09 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH v4 10/10] wifi: mac80211_hwsim: add support for multi-radio wiphy
Date: Tue,  2 Jul 2024 13:36:05 +0200
Message-ID: <cbc5d8a0821ce6ce761b79425e8f1496bc20d595.1719919832.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.39da4d3b01ce5545ac85da8cab3179f7c7a351a8.1719919832.git-series.nbd@nbd.name>
References: <cover.39da4d3b01ce5545ac85da8cab3179f7c7a351a8.1719919832.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_045531_500734_EADC846A 
X-CRM114-Status: GOOD (  16.83  )
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

This registers one wiphy radio per supported band. Number of different
channels is set per radio.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 74 +++++++++++++++++---
 drivers/net/wireless/virtual/mac80211_hwsim.h |  4 +-
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index 8491eb32f760..86ff0ad5992e 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -69,6 +69,10 @@ static bool mlo;
 module_param(mlo, bool, 0444);
 MODULE_PARM_DESC(mlo, "Support MLO");
 
+static bool multi_radio;
+module_param(multi_radio, bool, 0444);
+MODULE_PARM_DESC(mlo, "Support Multiple Radios per wiphy");
+
 /**
  * enum hwsim_regtest - the type of regulatory tests we offer
  *
@@ -669,6 +673,10 @@ struct mac80211_hwsim_data {
 	struct ieee80211_iface_limit if_limits[3];
 	int n_if_limits;
 
+	struct ieee80211_iface_combination if_combination_radio;
+	struct wiphy_radio_freq_range radio_range[NUM_NL80211_BANDS];
+	struct wiphy_radio radio[NUM_NL80211_BANDS];
+
 	u32 ciphers[ARRAY_SIZE(hwsim_ciphers)];
 
 	struct mac_address addresses[2];
@@ -917,6 +925,7 @@ static const struct nla_policy hwsim_genl_policy[HWSIM_ATTR_MAX + 1] = {
 	[HWSIM_ATTR_MLO_SUPPORT] = { .type = NLA_FLAG },
 	[HWSIM_ATTR_PMSR_SUPPORT] = NLA_POLICY_NESTED(hwsim_pmsr_capa_policy),
 	[HWSIM_ATTR_PMSR_RESULT] = NLA_POLICY_NESTED(hwsim_pmsr_peers_result_policy),
+	[HWSIM_ATTR_MULTI_RADIO] = { .type = NLA_FLAG },
 };
 
 #if IS_REACHABLE(CONFIG_VIRTIO)
@@ -4018,6 +4027,7 @@ struct hwsim_new_radio_params {
 	bool reg_strict;
 	bool p2p_device;
 	bool use_chanctx;
+	bool multi_radio;
 	bool destroy_on_close;
 	const char *hwname;
 	bool no_vif;
@@ -4094,6 +4104,12 @@ static int append_radio_msg(struct sk_buff *skb, int id,
 			return ret;
 	}
 
+	if (param->multi_radio) {
+		ret = nla_put_flag(skb, HWSIM_ATTR_MULTI_RADIO);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (param->hwname) {
 		ret = nla_put(skb, HWSIM_ATTR_RADIO_NAME,
 			      strlen(param->hwname), param->hwname);
@@ -5114,6 +5130,7 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 	struct net *net;
 	int idx, i;
 	int n_limits = 0;
+	int n_bands = 0;
 
 	if (WARN_ON(param->channels > 1 && !param->use_chanctx))
 		return -EINVAL;
@@ -5217,22 +5234,22 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 		n_limits++;
 	}
 
+	data->if_combination.radar_detect_widths =
+				BIT(NL80211_CHAN_WIDTH_5) |
+				BIT(NL80211_CHAN_WIDTH_10) |
+				BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+				BIT(NL80211_CHAN_WIDTH_20) |
+				BIT(NL80211_CHAN_WIDTH_40) |
+				BIT(NL80211_CHAN_WIDTH_80) |
+				BIT(NL80211_CHAN_WIDTH_160);
+
 	if (data->use_chanctx) {
 		hw->wiphy->max_scan_ssids = 255;
 		hw->wiphy->max_scan_ie_len = IEEE80211_MAX_DATA_LEN;
 		hw->wiphy->max_remain_on_channel_duration = 1000;
-		data->if_combination.radar_detect_widths = 0;
 		data->if_combination.num_different_channels = data->channels;
 	} else {
 		data->if_combination.num_different_channels = 1;
-		data->if_combination.radar_detect_widths =
-					BIT(NL80211_CHAN_WIDTH_5) |
-					BIT(NL80211_CHAN_WIDTH_10) |
-					BIT(NL80211_CHAN_WIDTH_20_NOHT) |
-					BIT(NL80211_CHAN_WIDTH_20) |
-					BIT(NL80211_CHAN_WIDTH_40) |
-					BIT(NL80211_CHAN_WIDTH_80) |
-					BIT(NL80211_CHAN_WIDTH_160);
 	}
 
 	if (!n_limits) {
@@ -5350,6 +5367,9 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 
 	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
 		struct ieee80211_supported_band *sband = &data->bands[band];
+		struct wiphy_radio_freq_range *radio_range;
+		const struct ieee80211_channel *c;
+		struct wiphy_radio *radio;
 
 		sband->band = band;
 
@@ -5423,8 +5443,36 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 		mac80211_hwsim_sband_capab(sband);
 
 		hw->wiphy->bands[band] = sband;
+
+		if (!param->multi_radio)
+			continue;
+
+		c = sband->channels;
+		radio_range = &data->radio_range[n_bands];
+		radio_range->start_freq = ieee80211_channel_to_khz(c) - 10000;
+
+		c += sband->n_channels - 1;
+		radio_range->end_freq = ieee80211_channel_to_khz(c) + 10000;
+
+		radio = &data->radio[n_bands++];
+		radio->freq_range = radio_range;
+		radio->n_freq_range = 1;
+		radio->iface_combinations = &data->if_combination_radio;
+		radio->n_iface_combinations = 1;
 	}
 
+	if (param->multi_radio) {
+		hw->wiphy->radio = data->radio;
+		hw->wiphy->n_radio = n_bands;
+
+		memcpy(&data->if_combination_radio, &data->if_combination,
+		       sizeof(data->if_combination));
+		data->if_combination.num_different_channels *= n_bands;
+	}
+
+	if (data->use_chanctx)
+		data->if_combination.radar_detect_widths = 0;
+
 	/* By default all radios belong to the first group */
 	data->group = 1;
 	mutex_init(&data->mutex);
@@ -6042,6 +6090,9 @@ static int hwsim_new_radio_nl(struct sk_buff *msg, struct genl_info *info)
 	else
 		param.use_chanctx = (param.channels > 1);
 
+	if (info->attrs[HWSIM_ATTR_MULTI_RADIO])
+		param.multi_radio = true;
+
 	if (info->attrs[HWSIM_ATTR_REG_HINT_ALPHA2])
 		param.reg_alpha2 =
 			nla_data(info->attrs[HWSIM_ATTR_REG_HINT_ALPHA2]);
@@ -6122,7 +6173,7 @@ static int hwsim_new_radio_nl(struct sk_buff *msg, struct genl_info *info)
 
 	param.mlo = info->attrs[HWSIM_ATTR_MLO_SUPPORT];
 
-	if (param.mlo)
+	if (param.mlo || param.multi_radio)
 		param.use_chanctx = true;
 
 	if (info->attrs[HWSIM_ATTR_RADIO_NAME]) {
@@ -6815,7 +6866,8 @@ static int __init init_mac80211_hwsim(void)
 
 		param.p2p_device = support_p2p_device;
 		param.mlo = mlo;
-		param.use_chanctx = channels > 1 || mlo;
+		param.multi_radio = multi_radio;
+		param.use_chanctx = channels > 1 || mlo || multi_radio;
 		param.iftypes = HWSIM_IFTYPE_SUPPORT_MASK;
 		if (param.p2p_device)
 			param.iftypes |= BIT(NL80211_IFTYPE_P2P_DEVICE);
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.h b/drivers/net/wireless/virtual/mac80211_hwsim.h
index 28c1db482e79..f32fc3a492b0 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.h
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.h
@@ -157,6 +157,9 @@ enum hwsim_commands {
  *	to provide details about peer measurement request (nl80211_peer_measurement_attrs)
  * @HWSIM_ATTR_PMSR_RESULT: nested attributed used with %HWSIM_CMD_REPORT_PMSR
  *	to provide peer measurement result (nl80211_peer_measurement_attrs)
+ * @HWSIM_ATTR_MULTI_RADIO: Register multiple wiphy radios (flag).
+ *	Adds one radio for each band. Number of supported channels will be set for
+ *	each radio instead of for the wiphy.
  * @__HWSIM_ATTR_MAX: enum limit
  */
 enum hwsim_attrs {
@@ -189,6 +192,7 @@ enum hwsim_attrs {
 	HWSIM_ATTR_PMSR_SUPPORT,
 	HWSIM_ATTR_PMSR_REQUEST,
 	HWSIM_ATTR_PMSR_RESULT,
+	HWSIM_ATTR_MULTI_RADIO,
 	__HWSIM_ATTR_MAX,
 };
 #define HWSIM_ATTR_MAX (__HWSIM_ATTR_MAX - 1)
-- 
git-series 0.9.1

