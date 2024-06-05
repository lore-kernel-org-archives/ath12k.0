Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F55C25B76
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NJEcI/gwWKWhWtJcgMb3b1YliXBYBRU0fVxhC2YDSU=; b=02kVSMifHFKtlYmp5aim/JC8RY
	IixTZxew/FhNufffuMT3fL8wfgQtqxsZJZms6ZM0L2jx4nVYC3PApy1prPveWdNmAB/dW+z0pL9fh
	ADW8IkudpYDHxITgAlUDyOSmAQ1zvayJeMJTilfTHgg6JQBBUpBCfDovKCTekyCw5YoDHL6JGopax
	yXEdblQ2/gM1q9cJxHfGqYaBTi4aDCSs9PTlmx5GCmDJGOzLdhhf6+hXTj+zDtiixuMxMCOzxKgbo
	c4Fjsi0WYJjWBKtxVeDPlArrC+oOzogdNWqdiLf15NPXZ7FR3q4+su/Hi5nDAuTri1ad1PsWB3e3K
	Z2HDwHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvQR-00000007AbK-04z4
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 18:31:55 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvQJ-00000007AVF-0aYw
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 18:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2NJEcI/gwWKWhWtJcgMb3b1YliXBYBRU0fVxhC2YDSU=; b=Wop9uO6vK+JOxR68IqQ6E7MHys
	Y/zyirXDj9fS246aTF7x/shHVIfnkfstB+4U5Qi+iOcm1Hvc/G9z6gu2CgWKy7iitUCi1BUorcVkS
	0ngOtt+qbaP9eX+zAyMFtdloomldjOiGXvpuDD/Jdy1AEwb0zEiJ1xm/QSAZEi9cpCvw=;
Received: from p4ff130d0.dip0.t-ipconnect.de ([79.241.48.208] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1sEvQA-008Gwq-00;
	Wed, 05 Jun 2024 20:31:38 +0200
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	quic_adisi@quicinc.com,
	quic_periyasa@quicinc.com,
	ath12k@lists.infradead.org
Subject: [RFC v2 3/7] wifi: cfg80211: extend interface combination check for multi-radio
Date: Wed,  5 Jun 2024 20:31:26 +0200
Message-ID: <8fc2f117346fcb4ed11bb20cdf9cb1f88bcf64b4.1717611760.git-series.nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
References: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_113147_198998_3854DE7B 
X-CRM114-Status: GOOD (  15.76  )
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

Add a field in struct iface_combination_params to check per-radio
interface combinations instead of per-wiphy ones.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 include/net/cfg80211.h |  2 ++
 net/wireless/util.c    | 29 +++++++++++++++++------------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 27355e08ae52..c1439ac975d6 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1595,6 +1595,7 @@ struct cfg80211_color_change_settings {
  *
  * Used to pass interface combination parameters
  *
+ * @radio: when set, check radio specific interface combinations.
  * @num_different_channels: the number of different channels we want
  *	to use for verification
  * @radar_detect: a bitmap where each bit corresponds to a channel
@@ -1608,6 +1609,7 @@ struct cfg80211_color_change_settings {
  *	the verification
  */
 struct iface_combination_params {
+	const struct wiphy_radio *radio;
 	int num_different_channels;
 	u8 radar_detect;
 	int iftype_num[NUM_NL80211_IFTYPES];
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 2bde8a354631..fc3e8fbb4cc2 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2309,9 +2309,6 @@ static void cfg80211_calculate_bi_data(struct wiphy *wiphy, u32 new_beacon_int,
 {
 	struct wireless_dev *wdev;
 
-	*beacon_int_gcd = 0;
-	*beacon_int_different = false;
-
 	list_for_each_entry(wdev, &wiphy->wdev_list, list) {
 		int wdev_bi;
 
@@ -2366,13 +2363,15 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 					    void *data),
 			       void *data)
 {
+	const struct wiphy_radio *radio = params->radio;
+	const struct ieee80211_iface_combination *c;
 	const struct ieee80211_regdomain *regdom;
 	enum nl80211_dfs_regions region = 0;
-	int i, j, iftype;
+	int i, j, n, iftype;
 	int num_interfaces = 0;
 	u32 used_iftypes = 0;
-	u32 beacon_int_gcd;
-	bool beacon_int_different;
+	u32 beacon_int_gcd = 0;
+	bool beacon_int_different = false;
 
 	/*
 	 * This is a bit strange, since the iteration used to rely only on
@@ -2384,8 +2383,10 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 	 * cfg80211 already - the only thing not would appear to be any new
 	 * interfaces (while being brought up) and channel/radar data.
 	 */
-	cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
-				   &beacon_int_gcd, &beacon_int_different);
+	if (!radio)
+			cfg80211_calculate_bi_data(wiphy, params->new_beacon_int,
+						   &beacon_int_gcd,
+						   &beacon_int_different);
 
 	if (params->radar_detect) {
 		rcu_read_lock();
@@ -2402,13 +2403,17 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 			used_iftypes |= BIT(iftype);
 	}
 
-	for (i = 0; i < wiphy->n_iface_combinations; i++) {
-		const struct ieee80211_iface_combination *c;
+	if (radio) {
+		c = radio->iface_combinations;
+		n = radio->n_iface_combinations;
+	} else {
+		c = wiphy->iface_combinations;
+		n = wiphy->n_iface_combinations;
+	}
+	for (i = 0; i < n; i++, c++) {
 		struct ieee80211_iface_limit *limits;
 		u32 all_iftypes = 0;
 
-		c = &wiphy->iface_combinations[i];
-
 		if (num_interfaces > c->max_interfaces)
 			continue;
 		if (params->num_different_channels > c->num_different_channels)
-- 
git-series 0.9.1

