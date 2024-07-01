Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2F8C2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS0gvai3FpUXlWITG0+rNA8YHXwBihMeWS5NcwHHw0Y=; b=V4Ayem4nx736FsC964LfOWZ6uQ
	IyIKcy3ogaFCwN9Z4P1lddCQ6xQWMg461mUHEJNLmkRF0I2EQTxgzqSHjFR5W2V9MaDrGbjNW9vwC
	qaHJ6oQZXBgeKbESOJdMMHKddvHWHTC6jLiwcnmCCwAa7MZfOyna4cm9mW/mVV0MmdeWJjsFheYaG
	oet0lRrAzmpl9wOGy9tGMqhDZpxI77ksOqFQDMWgBkMPG3xWTcdwbf0AHUVDFQzKBUT7o4oTB+d1M
	lrvuH0R4zcPxDxQLge4Pf017uL0wW0FAq8sd2C6H82awOUbBtZLosPL//PILcYJUWrhKcs7kz8HSs
	aS6G39Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHJI-00000003Xjx-46R5
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 13:43:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHJA-00000003Xfy-0dKx
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 13:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=GS0gvai3FpUXlWITG0+rNA8YHXwBihMeWS5NcwHHw0Y=;
	t=1719841383; x=1721050983; b=WAlHgB6iZf+85Y5xuhDqnF6t9ZYyYpKeAWf8kM8wEC71rny
	w8RTOk/HexXISggwWdjsEvQOpTyO3naHmIKHbuyC49GumyVJdLPQvl/x/aenXORF3gY3RKDLbfVRV
	82hyhseTXTDX8FV1K/F2jCWMKKSUL4+t6jm6HPD8M+PqZP85/mJxzmEzo/x8UQey3Rzv9txuXOfrI
	zwA1gkeUrldtbesAm/Zt/Hm4PJDZtedVNJh/3mvfdrBtaS6oiUBmSOtKg3btodljxXwAZTP/Qk4e3
	dCD5sM+Wq2xsKQCwngpNDbERemufjdAui5eXkDjt50Yx9n29pN2/nP2D7E+cOEmA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sOHJ6-00000002Hju-2UP2;
	Mon, 01 Jul 2024 15:43:00 +0200
Message-ID: <b5d1ea21c5cbbceac0e5a4f94a68ee9e2c182e3b.camel@sipsolutions.net>
Subject: Re: [PATCH v2 10/10] wifi: mac80211_hwsim: add support for
 multi-radio wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Mon, 01 Jul 2024 15:42:59 +0200
In-Reply-To: <816345bafb43d5ef5078f94ca309d5d3da2619e7.1719733819.git-series.nbd@nbd.name>
References: <cover.692a4cf1c6bce46eadecbcbf0f3e9e599099f8c4.1719733819.git-series.nbd@nbd.name>
	 <816345bafb43d5ef5078f94ca309d5d3da2619e7.1719733819.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_064304_210921_B89282EC 
X-CRM114-Status: GOOD (  12.33  )
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

On Sun, 2024-06-30 at 09:50 +0200, Felix Fietkau wrote:
> This registers one wiphy radio per supported band. Number of different
> channels is set per radio.
>=20
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/net/wireless/virtual/mac80211_hwsim.c | 78 +++++++++++++++++---
>  drivers/net/wireless/virtual/mac80211_hwsim.h |  4 +-
>  2 files changed, 71 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/=
wireless/virtual/mac80211_hwsim.c
> index 8491eb32f760..50aa2f838e9e 100644
> --- a/drivers/net/wireless/virtual/mac80211_hwsim.c
> +++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
> @@ -69,6 +69,9 @@ static bool mlo;
>  module_param(mlo, bool, 0444);
>  MODULE_PARM_DESC(mlo, "Support MLO");
> =20
> +static bool multi_radio;
> +module_param(multi_radio, bool, 0444);
> +MODULE_PARM_DESC(mlo, "Support Multiple Radios per wiphy");
>  /**

nit: keep a blank line

> @@ -5423,8 +5442,41 @@ static int mac80211_hwsim_new_radio(struct genl_in=
fo *info,
>  		mac80211_hwsim_sband_capab(sband);
> =20
>  		hw->wiphy->bands[band] =3D sband;
> +
> +		if (!param->multi_radio)
> +			continue;
> +
> +		if (WARN_ON_ONCE(n_bands >=3D ARRAY_SIZE(data->radio))) {

Not sure you should WARN_ON for userspace stuff; it's hwsim, but syzbot
will complain. Could use GENL_SET_ERR_MSG() though.

johannes

