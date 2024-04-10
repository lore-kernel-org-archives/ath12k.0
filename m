Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E61FCD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vrhE4tKbLahCAkQehQfWkPykNqCr9lzHvLBR7qefoE=; b=IeXiPpOitcwdRQ8r9mGTRea6eM
	vrWrhVL8gCVPSewebUli86K339BrL7WaROtqRgENdYCMVkq1dGWPzb/nKPzvjjOgrUDzxd5IUwh09
	Eyo2QA2jySEo6AZdnUdxeyTL+l/mM+vrcMyanUSUOZTD/J/rnE0TLiKAdYOtkQtupm5e9TK44eJio
	UT8SL/NA7itth/LL3BgcjrY0D277WZLVylasal4VJdcyFMObNXgi3MowkGwxsN4zSEIkfTbLw//wh
	Zaj4R0nkc+EzezWhp0zEi1APkHD8npQ2xdaBj9AKVeoahzpBB+OBWpLBiPItSHLqtpR1PmKaIWiCG
	xDnNpO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRvV-00000005VNS-0w2d
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 06:59:21 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRvR-00000005VKX-2EJ6
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 06:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4vrhE4tKbLahCAkQehQfWkPykNqCr9lzHvLBR7qefoE=;
	t=1712732352; x=1713941952; b=N9IqGE4/YORbk7YrxClaiyZ5InisqVZOHA+NfMbMdIMxf2B
	4YHs+t1Nr7jwvozqv5xcyfatVnsZtsxu8c7EBMqklh7A3xH4jy2wmuhZTFKNvlgdLe80zo6MGyagd
	3LjDv97yXz0weLjK0l1OGYPWcrKzuBSsBiPzkaJY+biiHmo6SH9TlUmdzIQWU69s3e0iviRxQf8r3
	WGrYamX81p8gLwO8YnOjpsP1jMkMPvqmXRYowUXRT/4RjgVAlQcg8DFto2Oy9Gb2DbtBlI8u2h3sD
	a+39xgV9aqzaSoZmxzoC9g0lcF87icznsbwU3hxZcAo4nEsbTn63cNASM1y+q78w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ruRvH-00000001Ce8-3QgS;
	Wed, 10 Apr 2024 08:59:09 +0200
Message-ID: <1ab360a11f618ba16a3fb23f368c568f8ff57d36.camel@sipsolutions.net>
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user
 space in multi-hardware wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, Vasanthakumar
	Thiagarajan <quic_vthiagar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 10 Apr 2024 08:59:06 +0200
In-Reply-To: <13bbfe51-5a91-3c67-9b11-2f30a43f38ff@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
	 <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
	 <14909268-53de-a686-eecd-443ce153c756@quicinc.com>
	 <13bbfe51-5a91-3c67-9b11-2f30a43f38ff@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_235917_996751_C10D7F20 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed, 2024-04-10 at 09:40 +0530, Karthikeyan Periyasamy wrote:
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
> @johannes Berg
>=20
>=20
> Any comments on the vasanth suggested approach ?

Think about it, do you have any comments? I mean, you've _already_ sent
an email, why not actually say something about the topic?

johannes

