Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F627C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukAwndyN8wSwuY93m82P0N4u/3kEv+p+1SKSqFRuS2o=; b=OvDC9/sUVMOTrEzD6GcJ0Qd/bf
	iXhz2LrU5g8pXWXDlKkU1ebhnsBoP2AcEeD03vuX4Mqdy4oPfy4k0Y2CCfqLodryW7yb8D2RbQ28n
	yfyDP6zgFJQyUWA1d9Z7MJLIGVvn6b5N2l9QtI1ccfha/KQYE6DGHHx4nQepcZr19ltAzZCzKp7Xr
	uN4OCpIDziLuTAl8ktsEJvUv23pzrDHFhdScw9Y3vyTDKoD/FEDrFnc9Ltegt8CdiQgOEJiCJwxtc
	wT31DLHzaQI+GvKSaplvVGxpBCVMzDLS1ESv3iKzO2ThhezxmMLzb0DnIo1XCr4mO3hHCByJess4n
	P4PRpnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpptE-0000000E7Lx-0WZz
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 13:33:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpptB-0000000E7Kq-1P0A
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 13:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ukAwndyN8wSwuY93m82P0N4u/3kEv+p+1SKSqFRuS2o=;
	t=1711632832; x=1712842432; b=nvZUGmmfgcc1TVNfwQn/fQ1Xx8qkTjbxlx2s2JMiy4Th3iV
	JAcJncAOfOuzkCSRxo9uXZzRGSYS9w7Qb/WKFEJIbtL5FvrOQaw6khkrLD5zLpUvojTf2OGQGD3NW
	PAg92TY7v4OgNSkWQ2PuO97vOPCMF8ibyWE5XIIWByumNnWCIi1nvlpTWFpXOAeO3gX/71/MB1CSE
	VOBqdipcrcFqJYPZXurCJSMi+LPeTyFj7gC/qYsRwEiet10LTUirtl+zOqZQOe7WbIRL0OGBBaMmK
	WwFfCEL9uyhBL6i+vwk9OQZ/pAmYj2/JaG3PPYqSs9FiXLnZniIzfEwM09OdtUPA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rppt8-000000010MD-2pDO;
	Thu, 28 Mar 2024 14:33:50 +0100
Message-ID: <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user
 space in multi-hardware wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 14:33:49 +0100
In-Reply-To: <20240328072916.1164195-7-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_063353_399329_8A6B4F0B 
X-CRM114-Status: GOOD (  18.99  )
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

On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>=20
> + *	When describing per-hardware combinations in multi-hardware in
> + *	one wiphy model, the first possibility can further include the finer
> + *	capabilities like below

Not sure I'd say "below" rather than e.g. "like this:"

> + *	hw_chan_idx =3D 0, numbers =3D [ #{STA} <=3D 1, #{AP} <=3D 1 ],
> + *	channels =3D 1, max =3D 2
> + *	=3D> allows a STA plus an AP interface on the underlying hardware mac
> + *	   advertised at index 0 in wiphy @hw_chans array.
> + *	hw_chan_idx =3D 1, numbers =3D [ #{STA} <=3D 1, #{AP} <=3D 2 ],
> + *	channels =3D 1, max =3D 3
> + *	=3D> allows a STA plus two AP interfaces on the underlying hardware m=
ac
> + *	   advertised at index 1 in wiphy @hw_chans array.

Have you checked the rst output for this? Seems likely that's not going
to be great with that formatting, but I haven't checked.

> + * @NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX: u8 attribute specifying the i=
ndex
> + *	to the wiphy @hw_chans list for which the iface combination is being
> + *	described.

"@hw_chans" doesn't make sense here, this is nl80211, it should refer to
some attribute

but why didn't you just _say_ in the patch 2 discussion that it's used
here ...

> + * @NL80211_IFACE_COMB_PER_HW_COMB_LIMITS: nested attribute containing t=
he
> + *	limits for the given interface types, see
> + *	&enum nl80211_iface_limit_attrs.
> + * @NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM: u32 attribute giving the max=
imum
> + *	number of interfaces that can be created in this group. This number
> + *	does not apply to the interfaces purely managed in software.
> + * @NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS: u32 attribute specifyin=
g the
> + *	number of different channels that can be used in this group.
> + * @NUM_NL80211_IFACE_COMB_PER_HW_COMB: number of attributes
> + * @MAX_NL80211_IFACE_COMB_PER_HW_COMB: highest attribute number
> + */
> +enum nl80211_if_comb_per_hw_comb_attrs {
> +	NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
> +	NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
> +	NL80211_IFACE_COMB_PER_HW_COMB_LIMITS,
> +	NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
> +	NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,

Almost all these attributes duplicate - including their docs -
attributes from enum nl80211_if_combination_attrs. Is it really worth
doing that, rather than adding NL80211_IFACE_COMB_HW_IDX and documenting
the different uses of the attribute set?

> +	hw_combis =3D nla_nest_start(msg, NL80211_IFACE_COMB_PER_HW_COMB);
> +	if (!hw_combis)
> +		return -ENOBUFS;
> +
> +	for (i =3D 0; i < c->n_hw_list; i++) {
> +		struct nlattr *hw_combi, *limits;
> +
> +		hw_combi =3D nla_nest_start(msg, i + 1);

And of course the array and splitting discussions apply here too.

johannes

