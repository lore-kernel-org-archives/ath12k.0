Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC68C27C79
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42ZCArE5bd76XlgcFgg80hu5d/Tp9VZxzntk2qX1VN4=; b=gC6z+NFdm/vhzn94z5fuO1TXMe
	ApxqMZjXX8DZPEb7h9bvRc0C7Ujq8SuM+30ZrEdLHlW75uVIRxytrT8YltIbzDXie51r6oB2pAtek
	fbvgRpgnbFx8PJ7SiGFHrwbu4GXhiVyiTMVXv8WN4klmIem99bQvq4u7cuej7FHshbYWxtK96f7u5
	Lt0uAw8vSbAMIWJARztTW4raYOQWSiR/RYiKfYhYaFyaP41p2BUiGSHfZcXGn8qCecXWXIbjiAzDM
	4IrRy6V4JGHSSpbySRu4co3KgrZqyU72BQMSPtnBE/7Osxden7/0XA/3MVeQiolHfkk7XeAAmCldm
	EaKFXRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKFm7-00000004idD-1FDC
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 11:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKFm6-00000004id2-2Zv3
	for ath12k@bombadil.infradead.org;
	Thu, 20 Jun 2024 11:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=42ZCArE5bd76XlgcFgg80hu5d/Tp9VZxzntk2qX1VN4=; b=YR2JUvM+LO2LzjaAJ7xyuJekfM
	9flX6DBHBGzONWg+zU/OSxMTpnQexGonmFxQzlBTFn//SEDNUmC1ZuEHDxYwu5uNjNvV62mteHlPh
	HVoqmDVN3H7EbiV5KBTP2HoUVSnlX4Kc04CpRErPD5X2CJ3ctJOCtL9EL74hJr5oXmfSvGbINQ4QJ
	xJDgQ5wPOSkf+RrMwiLPHA6stFYk4ifdEb/HdQ9D/+HjJJ2+E7ULCfPjEvCv+IRrMdH6UeHetLhDZ
	xBK5fxP4xL+5fu24sxSmHrT8stOaGLJp0+Le9hi6uP+9wbl7SgSjbDOujqRdIFMBOY4Hd9rhpEgnS
	Su8B1nfA==;
Received: from nbd.name ([46.4.11.11])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKFm3-00000007XTr-0qf7
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 11:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=42ZCArE5bd76XlgcFgg80hu5d/Tp9VZxzntk2qX1VN4=; b=j6z4wEgkVoRiKvtsq5hqmp2VZW
	EmWO48ijMf5Gxu9p3gwH5afghl+pF63tHpQ8rH+91bMtvx6vmPaUcvUkMLIApfh2wiRVOwDKqCezI
	UppWgvnyfDjxwe/bNBvl19D8qoz7INrkPXxpE3d97Wtol1DDKdUaV5fxTnDOoBDBWRls=;
Received: from p4ff13dca.dip0.t-ipconnect.de ([79.241.61.202] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sKFhO-00Ei9k-0v;
	Thu, 20 Jun 2024 13:11:26 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [PATCH 10/10] wifi: mac80211_hwsim: add support for multi-radio wiphy
Date: Thu, 20 Jun 2024 13:11:22 +0200
Message-ID: <b2f7aea3341e8610880e46d91e984a6e2c14b3f3.1718881762.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
References: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_121615_788551_B19E9BC1 
X-CRM114-Status: GOOD (  16.32  )
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
 drivers/net/wireless/virtual/mac80211_hwsim.c | 77 +++++++++++++++++---
 drivers/net/wireless/virtual/mac80211_hwsim.h |  3 +-
 2 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index b5afaec61827..d8dc1a2da72b 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -69,6 +69,9 @@ static bool mlo;
 module_param(mlo, bool, 0444);
 MODULE_PARM_DESC(mlo, "Support MLO");
 
+static bool multi_radio;
+module_param(multi_radio, bool, 0444);
+MODULE_PARM_DESC(mlo, "Support Multiple Radios per wiphy");
 /**
  * enum hwsim_regtest - the type of regulatory tests we offer
  *
@@ -669,6 +672,10 @@ struct mac80211_hwsim_data {
 	struct ieee80211_iface_limit if_limits[3];
 	int n_if_limits;
 
+	struct ieee80211_iface_combination if_combination_radio;
+	struct wiphy_radio_freq_range radio_range[4];
+	struct wiphy_radio radio[4];
+
 	u32 ciphers[ARRAY_SIZE(hwsim_ciphers)];
 
 	struct mac_address addresses[2];
@@ -4017,6 +4024,7 @@ struct hwsim_new_radio_params {
 	bool reg_strict;
 	bool p2p_device;
 	bool use_chanctx;
+	bool multi_radio;
 	bool destroy_on_close;
 	const char *hwname;
 	bool no_vif;
@@ -4093,6 +4101,12 @@ static int append_radio_msg(struct sk_buff *skb, int id,
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
@@ -5113,6 +5127,7 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 	struct net *net;
 	int idx, i;
 	int n_limits = 0;
+	int n_bands = 0;
 
 	if (WARN_ON(param->channels > 1 && !param->use_chanctx))
 		return -EINVAL;
@@ -5216,22 +5231,22 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
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
@@ -5349,6 +5364,9 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 
 	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
 		struct ieee80211_supported_band *sband = &data->bands[band];
+		struct wiphy_radio_freq_range *radio_range;
+		const struct ieee80211_channel *c;
+		struct wiphy_radio *radio;
 
 		sband->band = band;
 
@@ -5422,8 +5440,41 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 		mac80211_hwsim_sband_capab(sband);
 
 		hw->wiphy->bands[band] = sband;
+
+		if (!param->multi_radio)
+			continue;
+
+		if (WARN_ON_ONCE(n_bands >= ARRAY_SIZE(data->radio))) {
+			err = -EINVAL;
+			goto failed_hw;
+		}
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
+	}
+
+	if (param->multi_radio) {
+		hw->wiphy->radio = data->radio;
+		hw->wiphy->n_radio = n_bands;
+
+		memcpy(&data->if_combination_radio, &data->if_combination,
+		       sizeof(data->if_combination));
+		data->if_combination.num_different_channels *= n_bands;
 	}
 
+	if (data->use_chanctx)
+		data->if_combination.radar_detect_widths = 0;
+
 	/* By default all radios belong to the first group */
 	data->group = 1;
 	mutex_init(&data->mutex);
@@ -6041,6 +6092,9 @@ static int hwsim_new_radio_nl(struct sk_buff *msg, struct genl_info *info)
 	else
 		param.use_chanctx = (param.channels > 1);
 
+	if (info->attrs[HWSIM_ATTR_MULTI_RADIO])
+		param.multi_radio = true;
+
 	if (info->attrs[HWSIM_ATTR_REG_HINT_ALPHA2])
 		param.reg_alpha2 =
 			nla_data(info->attrs[HWSIM_ATTR_REG_HINT_ALPHA2]);
@@ -6121,7 +6175,7 @@ static int hwsim_new_radio_nl(struct sk_buff *msg, struct genl_info *info)
 
 	param.mlo = info->attrs[HWSIM_ATTR_MLO_SUPPORT];
 
-	if (param.mlo)
+	if (param.mlo || param.multi_radio)
 		param.use_chanctx = true;
 
 	if (info->attrs[HWSIM_ATTR_RADIO_NAME]) {
@@ -6815,7 +6869,8 @@ static int __init init_mac80211_hwsim(void)
 
 		param.p2p_device = support_p2p_device;
 		param.mlo = mlo;
-		param.use_chanctx = channels > 1 || mlo;
+		param.multi_radio = multi_radio;
+		param.use_chanctx = channels > 1 || mlo || multi_radio;
 		param.iftypes = HWSIM_IFTYPE_SUPPORT_MASK;
 		if (param.p2p_device)
 			param.iftypes |= BIT(NL80211_IFTYPE_P2P_DEVICE);
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.h b/drivers/net/wireless/virtual/mac80211_hwsim.h
index 21b1afd83dc1..2a890c4903db 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.h
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.h
@@ -157,6 +157,8 @@ enum hwsim_commands {
  *	to provide details about peer measurement request (nl80211_peer_measurement_attrs)
  * @HWSIM_ATTR_PMSR_RESULT: nested attributed used with %HWSIM_CMD_REPORT_PMSR
  *	to provide peer measurement result (nl80211_peer_measurement_attrs)
+ * @HWSIM_ATTR_MULTI_RADIO: register multiple wiphy radios (one per band).
+ *	Number of supported channels for the phy will be per radio.
  * @__HWSIM_ATTR_MAX: enum limit
  */
 enum hwsim_attrs {
@@ -189,6 +191,7 @@ enum hwsim_attrs {
 	HWSIM_ATTR_PMSR_SUPPORT,
 	HWSIM_ATTR_PMSR_REQUEST,
 	HWSIM_ATTR_PMSR_RESULT,
+	HWSIM_ATTR_MULTI_RADIO,
 	__HWSIM_ATTR_MAX,
 };
 #define HWSIM_ATTR_MAX (__HWSIM_ATTR_MAX - 1)
-- 
git-series 0.9.1

