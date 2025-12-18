Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA779D68BE8
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 07:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AcZW8o8Ytkhi7vuFFsBYSRD7i3Sz/+biLuxalg35AZw=; b=4KRY54vFIcR7EbfaM8/7/Y1n7f
	NdNRducW5sQ/xNI1DF+6NqdwR26A/o3skYSlR4PIHoTVuiBqrqrGv+gcZsJlNKfPojl/PJBMuXti/
	LzTPOjA7+02YCfwvZQIyh9kXPEvZtzqnZpM3+IG3RqTisucnFWmjFMoMDyQv8Y39Gt+MS5R/SNATh
	HK55bTgtyqeIhKtswUxOnESORmTfsRnr2E8AEGA3etG73jSTiK8io0BRx/TlW3eGgFC/OI27bjb/z
	XdwNo6wtZfKK8ztT0N41fdjx4D2eI7/cK5lzzG/OVziUSpxWiYSPvsNqkxx7M1I+mE9m9WSBiEpKh
	3xSKnrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8gg-00000007yZW-2hIT;
	Thu, 18 Dec 2025 07:44:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8gc-00000007yZ1-43eY
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 07:44:36 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47789cd2083so1661875e9.2
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766043873; x=1766648673; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcZW8o8Ytkhi7vuFFsBYSRD7i3Sz/+biLuxalg35AZw=;
        b=KeSdoPmQPNdmDyuL8bfNj0/vID51cv9lf1hjx6+uoK2t2kpGA8aautUWsA+GF7sZpD
         iSpDOXhgfMw5JxKPCWp2YJlykYpzvFQz7SmG6GGLOxgJjFyUpmJZ7WqZBJZ5H/vguEkk
         IB5SvdqDMeNk4TloMREaCiAbdWMPitwlK2z5XcSAiLxYzauhLw2LmCS0tTr/KWoTPwAM
         akqufm4rPF5m9/YULrdZPRW5omz+Xdz4vtPDqCcxtwLK+Hfm80aInkyuIQYucdPM0cbm
         prZk1li0jyLN12hcGyLPkyVJabiCswEdWOTJJp/3ivbUKwPewJhaicetxTDPOy6SJOCt
         YkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043873; x=1766648673;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcZW8o8Ytkhi7vuFFsBYSRD7i3Sz/+biLuxalg35AZw=;
        b=xFGnVFKG6N/7hGu+VMCbpBkFyHzcllmcrLeR09jNCxSM6ZvrWLFcSJTNbKF2GeNeeq
         iTc8nPFVaarvE3TwBdf+i9nVP+eLqjCy8eN4odLwOSDBlZHJebso/W+8DFL90VZ4987S
         FJ3pwGttk00Fy3IxMY7Qn5wr3e2nc+uEDkyeZuQzyZ+eosOdnBClaPUUFiBKUHnLi1Ed
         FSJCBKohpkdc5LvA1QCQOYlCleaScAZdQlmVe/66vsAsb/FcTHFnQ7yRaUke63Cvt3w7
         5B2M738QUr1TkyqQ7NAF2C0zL7SUdeB0vrONMK70F8VrgJ8nmM5//8+UEl66uYdwgLY5
         sOlg==
X-Gm-Message-State: AOJu0YxsxGe51SKHC7xqZmvU6aLXdT5ku7FTnkn/fhvNw73vUeikQJEr
	fKUgZ4oeXk+GvyP+zShksco01nxrjn7XxBDYtAztJYFTpdMCqVBFk9vNtqx8wZIzVv5YtM4EpDz
	Rj1wZ2J0=
X-Gm-Gg: AY/fxX59VniNkA35oPARrmbvI1VSwcFluiv38sSNyy5v/XtwUnXTuV4yoMNHlw8UsHR
	rKkIi0robNY5oXy7qlLFOKrANjHMEL7cLiUVByhkyDF4LrLOIOriFJu9sv8Cg/kkWwfsjvpdL6a
	fG1JfHes/iPDj5CmodgzGewGItlm0hZyHdPvB9E+PvluG3kqIyNKg7VdOYR/lHH2uyXzhdGwsao
	uJQIagfyj5vy7ABbbtDm9tj1RselmFt2/Zbo37t5VPyV8/DQTGw9csjJSpbunpmQBDtQ6IicZWl
	O8MgCaF5O5TSIgiYm8tGEZjvZVIAJIDS6C6q8uszLOkxGqdlatD7zRpDm2/HwoUbFb+siK542CZ
	XGTXdXSq9qweUrW+K2LGk5CipGKJy+leG9nlcBZpWrbHoIUvdDXQBhKfmj1pR2y0eUgGBDCeD6W
	ekBqlG6ZlpROEcWGqo
X-Google-Smtp-Source: AGHT+IE8VJN5ti6SBJIeXO2TeUOPENeohw0A8BYkap+2kcyje+sSlpWrKwoVsHgNbj0i93BZbNOwcg==
X-Received: by 2002:a05:600c:5298:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47bdf5f0e9dmr40732465e9.21.1766043873315;
        Wed, 17 Dec 2025 23:44:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3277a61sm25461685e9.12.2025.12.17.23.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:44:33 -0800 (PST)
Date: Thu, 18 Dec 2025 10:44:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: Attach and detach ath12k_dp_link_peer to
 ath12k_dp_peer
Message-ID: <aUOw3SVHgj1PsHBW@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_234435_032129_049DBDBC 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
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

Hello Harsh Kumar Bijlani,

Commit 5525f12fa671 ("wifi: ath12k: Attach and detach
ath12k_dp_link_peer to ath12k_dp_peer") from Oct 24, 2025
(linux-next), leads to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/mac.c:1231 ath12k_mac_peer_cleanup_all()
	error: we previously assumed 'dp_peer' could be null (see line 1229)

drivers/net/wireless/ath/ath12k/mac.c
    1206 void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
    1207 {
    1208         struct ath12k_dp_link_peer *peer, *tmp;
    1209         struct ath12k_base *ab = ar->ab;
    1210         struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
    1211         struct ath12k_link_vif *arvif, *tmp_vif;
    1212         struct ath12k_dp_hw *dp_hw = &ar->ah->dp_hw;
    1213         struct ath12k_dp_peer *dp_peer = NULL;
    1214         u16 peerid_index;
    1215         struct list_head peers;
    1216 
    1217         INIT_LIST_HEAD(&peers);
    1218 
    1219         lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
    1220 
    1221         spin_lock_bh(&dp->dp_lock);
    1222         list_for_each_entry_safe(peer, tmp, &dp->peers, list) {
    1223                 /* Skip Rx TID cleanup for self peer */
    1224                 if (peer->sta && peer->dp_peer)
                                          ^^^^^^^^^^^^^
This assumes that dp_peer can be NULL.

    1225                         ath12k_dp_rx_peer_tid_cleanup(ar, peer);
    1226 
    1227                 /* cleanup dp peer */
    1228                 spin_lock_bh(&dp_hw->peer_lock);
    1229                 dp_peer = peer->dp_peer;
                         ^^^^^^^^^^^^^^^^^^^^^^^

    1230                 peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
--> 1231                 rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
                                            ^^^^^^^^^
Unchecked dereference.  It's not clear if it can be NULL or not.

    1232                 rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
    1233                 spin_unlock_bh(&dp_hw->peer_lock);
    1234 
    1235                 ath12k_dp_link_peer_rhash_delete(dp, peer);
    1236 
    1237                 list_move(&peer->list, &peers);
    1238         }
    1239         spin_unlock_bh(&dp->dp_lock);
    1240 
    1241         synchronize_rcu();
    1242 
    1243         list_for_each_entry_safe(peer, tmp, &peers, list) {
    1244                 ath12k_dp_link_peer_free(peer);
    1245         }
    1246 
    1247         ar->num_peers = 0;
    1248         ar->num_stations = 0;
    1249 
    1250         /* Cleanup rhash table maintained for arsta by iterating over sta */
    1251         ieee80211_iterate_stations_mtx(ar->ah->hw, ath12k_mac_link_sta_rhash_cleanup,
    1252                                        ar);
    1253 
    1254         /* Delete all the self dp_peers on asserted radio */
    1255         list_for_each_entry_safe_reverse(arvif, tmp_vif, &ar->arvifs, list) {
    1256                 if ((arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) &&
    1257                     (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS)) {
    1258                         ath12k_dp_peer_delete(dp_hw, arvif->bssid, NULL);
    1259                         arvif->num_stations = 0;
    1260                 }
    1261         }
    1262 }

regards,
dan carpenter

