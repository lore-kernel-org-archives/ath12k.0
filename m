Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC5ACD1292
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSGasXfZtO+c9IL1zinDoYDH1VVpFxRJQjka+adS58A=; b=NuMZhvFHP6lWC2nbhayNh2nh36
	2jv/vE6Wpxt3tY/4IECWoLJ9uluIyearMDgVXeHhkkhJXgdokWipfP8e6qI1xwWj7nhU42ujRSdQH
	fQvSRzqi6WJR2UeP/doa/bt9BXKexqWCJPfJ4KEVmKuzcVxG5P0YE0QEXslm/La/1BErdcbLZmgGG
	GhRGrLKDxxOmBMNHGhGdMvq/rmH+ajqx7pQ+AdBn1/A4tt92Vry2D7QIo2KSeHYRj5EoqciKd3zdD
	KA88eVqiKoYAkXPrpFCWvmUyprAYES3XAYbAn0lGOvUfEJEz3q6UvqvM9qSpilobt+IRHrU6y6HDH
	cshQKbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttwN-0000000GWTO-0Kjw
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 18:41:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttw1-0000000GWLx-1hIG
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 18:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=PSGasXfZtO+c9IL1zinDoYDH1VVpFxRJQjka+adS58A=;
	t=1712601692; x=1713811292; b=q3+rQu6hJr0z73Lpbf0r73TzBOv7WV0YHNpfCTm+mWTdD0n
	gD3H11yf7MTA77uGVXD3z5l7dG5MReTlDZyvQKQSrM1dWu+Wlu1K9+ubwarcMieGmbkPiAdSQoBFt
	ygqNV4GUo8vg8fZHrVzH/fzqDhcAyaMkXUxRRYIVNJwBU0rrGVguQ1rTzL/F0EY6D0/iq8Xdr3Mu/
	miHX+xD8XuQOvo5VvrcevYGC03hGE/pfdBy9zmLD7haDF+BwQfd2ZnIo3maTtu6nOZ9DSY5kI3hNM
	ToqeeC5HVyGqhH+kkw7RcOLjBDbCMqVR8e3HToljyXjv8dYbtG3eFOsTjqzwqbsQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rttvs-0000000GQlm-0K3H;
	Mon, 08 Apr 2024 20:41:28 +0200
Message-ID: <e599d1b1c7c6e32856eb5374cfaa20965b49b44c.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: cfg80211: Clear mlo_links info when STA disconnect
From: Johannes Berg <johannes@sipsolutions.net>
To: Xin Deng <quic_deng@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 08 Apr 2024 20:41:27 +0200
In-Reply-To: <20240327032448.15098-1-quic_deng@quicinc.com>
References: <20240327032448.15098-1-quic_deng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_114137_675461_CB802010 
X-CRM114-Status: GOOD (  12.08  )
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

On Tue, 2024-03-26 at 20:24 -0700, Xin Deng wrote:
> wdev->valid_links is not cleared when upper layer disconnect from a
> wdev->AP MLD. It has been observed that this would prevent offchannel
> operations like remain-on-channel which would be needed for user space
> operations with Public Action frame.

I agree that's a problem, we shouldn't leave the valid_links set.

> Signed-off-by: Xin Deng <quic_deng@quicinc.com>
> ---
>  net/wireless/sme.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/net/wireless/sme.c b/net/wireless/sme.c
> index 82e3ce42206c..86e837f37f8c 100644
> --- a/net/wireless/sme.c
> +++ b/net/wireless/sme.c
> @@ -492,6 +492,7 @@ void cfg80211_wdev_release_link_bsses(struct wireless=
_dev *wdev, u16 link_mask)
>  				 &wdev->links[link].client.current_bss->pub);
>  		wdev->links[link].client.current_bss =3D NULL;
>  	}
> +	wdev->valid_links =3D 0;
>=20

But this is (very obviously, even with only the limited context shown!)
in the completely wrong place.

johannes

