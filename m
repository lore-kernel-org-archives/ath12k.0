Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200BBCE8D52
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAcwBEQlh8BzPu5oyXiEdaBTUkwwQtlV8qpAo1Ux/0A=; b=LkvjTxD3OvKewBPGPytGOMgEIM
	FI+JZ7Lkg5F9BOyhiBeOtPg3AFheicP7cn1USEvSN5mVEBU1MAnGQjWC1cuGGHUwmrmv1VSNP1aSb
	5yxbO1/vYl8c9nSHjiprE7UqhUYmK4ajOJrTuwwgDq9NL6Ma+tEC71CBsiI1a1Om0mquwzFLKBduN
	h4JyaD+jcq02tPOv3U8WtNr3U6LLexl4eOudytH0r2I/i6GaF+IVKiDPYwLmYc21QJMDu2KrJidh0
	bl7PDrcEXjZ1a7IVY1YAeikFyjS04N/uL5zY8tfo15FO0nPRvfBjd4pxxehlJZZpzHrfUJ2sWD4XH
	6vgLrlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBFC-00000009cLj-2yCH
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 07:06:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBFA-00000009cL8-0LOQ
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 07:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QAcwBEQlh8BzPu5oyXiEdaBTUkwwQtlV8qpAo1Ux/0A=;
	t=1726729583; x=1727939183; b=P/LPsmmv+OCWaSgL30hTzfsoqKZJzgzDBu+FoAgzawvEIa4
	4/ViDjxA5uluOf5iiQd13Yj1R5nUuCLP4U9djan5e72sUDWjwpMnVJsSCeDdV23W6ciK33dAqD0FX
	YJr60FMyiO4yso+WJUDq8Dsgx/OwBgSbAYJZljSQ8wZA74wTgWgexBhg46fWReVLaH6+LIWFP7sVn
	G5Mns+X6cEDBKGXRsFQX1roSSAVrrLQZ4HMEVRTNqbl494ZcNi4b8qPFf8loafsl5Ug/PKU35PAhW
	yXHaDT9NmZxCjj/wHTw85DgF+aEzuOEV63pd+TKIySm1vK3mxtthpr9cZI1420zw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1srBF8-00000003Qm1-0Qv5;
	Thu, 19 Sep 2024 09:06:22 +0200
Message-ID: <33ea3a62b4257b6ef789c30fa8f7bf7e9f1865b5.camel@sipsolutions.net>
Subject: Re: [PATCH RFC v2 1/4] wifi: ath12k: switch to using wiphy_lock()
 and remove ar->conf_mutex
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 19 Sep 2024 09:06:21 +0200
In-Reply-To: <20240918181042.91891-2-kvalo@kernel.org>
References: <20240918181042.91891-1-kvalo@kernel.org>
	 <20240918181042.91891-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_000624_168098_0AB3FA17 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, 2024-09-18 at 21:10 +0300, Kalle Valo wrote:
>=20
> There is now a new sparse warning, but to keep this long patch simple the
> labels will be cleaned up in following patches:
>=20
> drivers/net/wireless/ath/ath12k/mac.c:6635:1: warning: statement expected=
 after label

I believe this is a compiler error on some compilers (in particular
clang), so you probably need to combine patches a little bit.

> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -15,14 +15,14 @@ static ssize_t ath12k_write_simulate_radar(struct fil=
e *file,
>  	struct ath12k *ar =3D file->private_data;
>  	int ret;
> =20
> -	mutex_lock(&ar->conf_mutex);
> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);

I don't think this is an issue here, but I'm not sure if you're aware
that in general, locking the wiphy mutex in some debugfs file handlers
can lead to deadlocks, specifically if those files are later _removed_
while holding the wiphy lock, as is e.g. the case for station, netdev
and link debugfs files. For this, we have wiphy_locked_debugfs_read()
and wiphy_locked_debugfs_write() [1].

[1] you are not required to understand how they are implemented ;-)

> @@ -4310,7 +4301,7 @@ static void ath12k_sta_rc_update_wk(struct work_str=
uct *wk)
> =20
>  	spin_unlock_bh(&ar->data_lock);
> =20
> -	mutex_lock(&ar->conf_mutex);
> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);

Baochen already pointed out that you seem to not remove this later in
patch 4, but in this patch alone you also introduce a bug (that lockdep
should point out to you), which is that you cancel_work_sync() this in
ath12k_mac_op_sta_state(), which clearly holds the wiphy mutex already.

This causes a deadlock. It's fine after patch 4:

>  	/* cancel must be done outside the mutex to avoid deadlock */
>  	if ((old_state =3D=3D IEEE80211_STA_NONE &&
>  	     new_state =3D=3D IEEE80211_STA_NOTEXIST))
> -		cancel_work_sync(&arsta->update_wk);
> +		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);

since for wiphy work it's required to ca<ll it with the mutex held./

You really should remove that comment too though, and perhaps then the
code can be simplified by moving this to the later code also handling
removal (none->notexist transition).

johannes

