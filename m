Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED904CE7D07
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCnBD1U7QvNvLUmdBdi6Nq3cRHnR8hJD3Ky8Id7tHF8=; b=HrfGQmnfljjG5vrJtGMqkkTFt5
	9FlEudKOSXYS6tq+zwNS78rn/gkJemC3Nn1sjVfo/Zcape/nroiU22INTL2Ft1h8oI68BJPYhpaIk
	ZGK6n01o8hBrTANSf+PcaCytuOhWwmjr/qi8ul0yD42JO1cEV4rkQm29GWgfACQ24v1FkMxxm73G4
	E8lTl/0DPWn9lVynT90keDUGddGpwsUszQovxbUBKI0r+8fsCt3W3GgKiQi89ZZ8X3L4yqr/Dp0sh
	3qcGIRwTFIqcuTiPjtmHaFgwfxG4qW6VC+RI6zrXo3rlvGktMC/DN+mRJo34GSUZw2K5wz1mDdtNi
	xC/sgs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZfC-00000002Ht3-2qfJ
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 09:59:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZf9-00000002Hsa-3E7S
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 09:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=nCnBD1U7QvNvLUmdBdi6Nq3cRHnR8hJD3Ky8Id7tHF8=;
	t=1727776763; x=1728986363; b=VJD4nBFXXFtQ2wu09WBIG+XyY2Jap2d7FY1+pck8J+DdTX5
	44UkS1+SxD2c6gqir/2zWUIiYM0c+hopf6pAaaaFDNof3OKIBzlosUECRvxZzQUTz6WxXT2gJM/Aa
	UEkuhWnvhnxbJgIYcqgvQ1dHcDMbFCM8BmgAr7j4MKBYgdXIKWahaW1K4AD+re49GlwJUpgA6p3Mc
	OIW+3k8ItMfLoXz4HL4ZfvDGOBBSKGOyK7PnuS7LOB9vmdCv5VdJxfwh4on8EP7dnVph8vA5S3u/Z
	6yGFmVCmX9F1otpeW7v8YqL8kU6S6KTmoRhTNIW/uQVWL2tbjcBGT0Y0Aj0fG5lg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1svZf5-0000000Ei2N-3UIk;
	Tue, 01 Oct 2024 11:59:20 +0200
Message-ID: <93df47a867ee1f8d84cabdbc953707eab2ea3704.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: re-order assigning channel in
 activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 01 Oct 2024 11:59:19 +0200
In-Reply-To: <20241001085034.2745669-1-quic_adisi@quicinc.com>
References: <20241001085034.2745669-1-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_025923_837301_59CCF39B 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, 2024-10-01 at 14:20 +0530, Aditya Kumar Singh wrote:
> The current flow in _ieee80211_set_active_links() does not align with the
> operational requirements of drivers that groups multiple hardware
> under a single wiphy. These drivers (e.g ath12k) rely on channel
> assignment to determine the appropriate hardware for each link. Without
> this, the drivers cannot correctly establish the link interface.
>=20
> Currently in _ieee80211_set_active_links(), after calling
> drv_change_vif_links() on the driver, the state of all connected stations
> is updated via drv_change_sta_links(). This is followed by handling keys
> in the links, and finally, assigning the channel to the links.
> Consequently, drv_change_sta_links() prompts drivers to create the statio=
n
> entry at their level and within their firmware. However, since channels
> have not yet been assigned to links at this stage, drivers have not
> created the necessary link interface for establishing link stations,
> leading to failures in activating the links.
>=20
> Therefore, re-order the logic so that after drv_change_vif_links() and
> removing the old links, channels are assigned to newly added links.
> Following this, the flow proceeds to station handling.
>=20

I tried this again but I fear it fundamentally cannot work with iwlwifi.

We have this comment:

        /* Initialize rate control for the AP station, since we might be
         * doing a link switch here - we cannot initialize it before since
         * this needs the phy context assigned (and in FW?), and we cannot
         * do it later because it needs to be initialized as soon as we're
         * able to TX on the link, i.e. when active.
         */

which sort of indicates that we're working around it, but it also
correctly says that we cannot activate a link before we have the (link)
station.

In the flow as you changed it we'd activate the link in firmware before
the stations are added, but that isn't allowed. There's not really a
good place to hook into after the station is added, unless we somehow
want to activate the link from the station change, but that seems ...
odd to say the least? Though I guess it's already somewhat odd to init
rate control here as written now...

Maybe we can hook into the later link info change. This seems to
initially work, but still doing more tests:


diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c b/driver=
s/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c
index 9753d2c1df3e..5d90fb53b762 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c
@@ -343,33 +343,20 @@ __iwl_mvm_mld_assign_vif_chanctx(struct iwl_mvm *mvm,
 	if (ret)
 		goto out;
=20
-	/* Initialize rate control for the AP station, since we might be
-	 * doing a link switch here - we cannot initialize it before since
-	 * this needs the phy context assigned (and in FW?), and we cannot
-	 * do it later because it needs to be initialized as soon as we're
-	 * able to TX on the link, i.e. when active.
+	/*
+	 * if link switching (link not active yet) we'll activate it in
+	 * firmware later on link-info change, which mac80211 guarantees
+	 * for link switch after the stations are set up
 	 */
-	if (mvmvif->ap_sta) {
-		struct ieee80211_link_sta *link_sta;
-
-		rcu_read_lock();
-		link_sta =3D rcu_dereference(mvmvif->ap_sta->link[link_id]);
-
-		if (!WARN_ON_ONCE(!link_sta))
-			iwl_mvm_rs_rate_init(mvm, vif, mvmvif->ap_sta,
-					     link_conf, link_sta,
-					     phy_ctxt->channel->band);
-		rcu_read_unlock();
+	if (ieee80211_vif_link_active(vif, link_conf->link_id)) {
+		ret =3D iwl_mvm_link_changed(mvm, vif, link_conf,
+					   LINK_CONTEXT_MODIFY_ACTIVE |
+					   LINK_CONTEXT_MODIFY_RATES_INFO,
+					   true);
+		if (ret)
+			goto out;
 	}
=20
-	/* then activate */
-	ret =3D iwl_mvm_link_changed(mvm, vif, link_conf,
-				   LINK_CONTEXT_MODIFY_ACTIVE |
-				   LINK_CONTEXT_MODIFY_RATES_INFO,
-				   true);
-	if (ret)
-		goto out;
-
 	if (vif->type =3D=3D NL80211_IFTYPE_STATION)
 		iwl_mvm_send_ap_tx_power_constraint_cmd(mvm, vif,
 							link_conf,
@@ -786,6 +773,11 @@ iwl_mvm_mld_link_info_changed_station(struct iwl_mvm *=
mvm,
 	if (WARN_ON_ONCE(!mvmvif->link[link_conf->link_id]))
 		return;
=20
+	/* not yet marked active in vif means during link switch */
+	if (!ieee80211_vif_link_active(vif, link_conf->link_id) &&
+	    vif->cfg.assoc && mvmvif->link[link_conf->link_id]->phy_ctxt)
+		link_changes |=3D LINK_CONTEXT_MODIFY_ACTIVE;
+
 	has_he =3D link_conf->he_support && !iwlwifi_mod_params.disable_11ax;
 	has_eht =3D link_conf->eht_support && !iwlwifi_mod_params.disable_11be;
=20


johannes

