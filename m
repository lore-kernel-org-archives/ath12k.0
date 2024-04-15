Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF2BC4345F
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOqa0YfnR3nkXm1VRAGfM5py7wxw2EPMxlMmMQs0bZM=; b=Ydei25i7xYMYSq+WzqHZOuUN/7
	76Up11GpWR0YMUa7NtKg+GlDUpl/m9nDU6pcHaXZYCWLfvK8ZS88YA4SuLhewelYUH0r8JbXgIxik
	XLGHXf4dg14fX9Z3ZxNb25rEQIkvl8kAUS6/OTogWdK+wdhoHr2Mh8IP7tboYUHZ7nAVjTogVKsCP
	GPsRwMuDgsVwuukanfGWgJgTutcIhixtL1aJ/6baCTz+bus7XG3hhYVwJlloXcYp12jY/tcQ/rwqV
	MQ57norKhsypALXH5TX4jyESignE6N7YUbY23wnXT/DgKgi2aLPKDYIlvILEuRDm/gg/2I6X8gXNt
	JvGiYYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNJL-00000008gcw-3axu
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 14:27:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNJI-00000008gZZ-19Aj
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 14:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HOqa0YfnR3nkXm1VRAGfM5py7wxw2EPMxlMmMQs0bZM=;
	t=1713191266; x=1714400866; b=hO3mNA/T85xb52N9jl6X59oTjiOcy3Po0xgwxxDgqFklq06
	xGrLNE97W3gSZIuTGc96r++IJmHKkn4MuI7dNm5NfPCTp2tdSCHG511DiyMb6VYiQluL38V3KbC6Z
	tkguUVWEgVVzILwIQW2KMSuWuYt1YSd0yyLnuYFIoBuYirwfgt0Gza8g9UMsOC19Ul3TvVCwUX7YR
	8o76RETTFEy0AxFjoJ4+8DcLNSKp9CRo/2DTceAktky66gnWszYMDwVxQpUebl4P9XPjiVaQ83QhU
	mvnX+mh9Zz7dMzWpxMDludF5beWPItwYdMQNY4d+ThUyQpcwj2PTlWtT9Im5i/bg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rwNJ9-00000007yTA-02Fs;
	Mon, 15 Apr 2024 16:27:43 +0200
Message-ID: <c58f318641ec2e836a23f8769eb32c67326643a5.camel@sipsolutions.net>
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user
 space in multi-hardware wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, Vasanthakumar
	Thiagarajan <quic_vthiagar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 15 Apr 2024 16:27:41 +0200
In-Reply-To: <6147ac95-a572-62df-619d-33078d51ccc3@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
	 <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
	 <14909268-53de-a686-eecd-443ce153c756@quicinc.com>
	 <6147ac95-a572-62df-619d-33078d51ccc3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_072752_486168_8A0EBB6D 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, 2024-04-12 at 10:57 +0530, Karthikeyan Periyasamy wrote:
> > > > + * @NL80211_IFACE_COMB_PER_HW_COMB_LIMITS: nested attribute=20
> > > > containing the
> > > > + *=C2=A0=C2=A0=C2=A0 limits for the given interface types, see
> > > > + *=C2=A0=C2=A0=C2=A0 &enum nl80211_iface_limit_attrs.
> > > > + * @NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM: u32 attribute giving t=
he=20
> > > > maximum
> > > > + *=C2=A0=C2=A0=C2=A0 number of interfaces that can be created in t=
his group. This=20
> > > > number
> > > > + *=C2=A0=C2=A0=C2=A0 does not apply to the interfaces purely manag=
ed in software.
> > > > + * @NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS: u32 attribute=20
> > > > specifying the
> > > > + *=C2=A0=C2=A0=C2=A0 number of different channels that can be used=
 in this group.
> > > > + * @NUM_NL80211_IFACE_COMB_PER_HW_COMB: number of attributes
> > > > + * @MAX_NL80211_IFACE_COMB_PER_HW_COMB: highest attribute number
> > > > + */
> > > > +enum nl80211_if_comb_per_hw_comb_attrs {
> > > > +=C2=A0=C2=A0=C2=A0 NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
> > > > +=C2=A0=C2=A0=C2=A0 NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
> > > > +=C2=A0=C2=A0=C2=A0 NL80211_IFACE_COMB_PER_HW_COMB_LIMITS,
> > > > +=C2=A0=C2=A0=C2=A0 NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
> > > > +=C2=A0=C2=A0=C2=A0 NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,
> > >=20
> > > Almost all these attributes duplicate - including their docs -
> > > attributes from enum nl80211_if_combination_attrs. Is it really worth
> > > doing that, rather than adding NL80211_IFACE_COMB_HW_IDX and document=
ing
> > > the different uses of the attribute set?
> > >=20
> >=20
> > I agree, more duplication. So we have to have the per_hw_comb_attrs
> > defines like below?
> >=20
> > enum nl80211_if_comb_per_hw_comb_attrs {
> >  =C2=A0=C2=A0=C2=A0=C2=A0NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
> >  =C2=A0=C2=A0=C2=A0=C2=A0NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX =3D
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NL8=
0211_IFACE_COMB_NUM_CHANNELS + 1,
> >  =C2=A0=C2=A0=C2=A0=C2=A0/* keep last */
> >  =C2=A0=C2=A0=C2=A0=C2=A0NUM_NL80211_IFACE_COMB_PER_HW_COMB,
> >  =C2=A0=C2=A0=C2=A0=C2=A0MAX_NL80211_IFACE_COMB_PER_HW_COMB =3D
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NUM=
_NL80211_IFACE_COMB_PER_HW_COMB - 1
> > };
> >=20
>=20
> I agree this approach. Instead of NUM_NL80211_IFACE_COMB_PER_HW_COMB,=20
> shall we have MAX_NL80211_IFACE_COMB like below so that hw_idx attribute=
=20
> value will not get conflict to any IFACE combination attributes
>=20
>   enum nl80211_if_comb_per_hw_comb_attrs {
>        NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
>        NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX =3D
>                MAX_NL80211_IFACE_COMB + 1,
>        /* keep last */
>        NUM_NL80211_IFACE_COMB_PER_HW_COMB,
>        MAX_NL80211_IFACE_COMB_PER_HW_COMB =3D
>                NUM_NL80211_IFACE_COMB_PER_HW_COMB - 1
> };
>=20

You haven't thought this through - what happens here if something is
added to enum nl80211_if_combination_attrs?

johannes

