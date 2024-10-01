Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC76CF64BE
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFBeJ6MgT6zo4FyBxtLrxgVA2X3Qucidq9sPOh6rCn8=; b=pV6QT13GcROROG/acKvDgyD/BK
	Qo/Y2Qs5Mw1Y3RWojNHLpueqaIS8PhaK6JCbXzPQvZU7CgjNSyeYLbEYL1Edt4jBGCIf0GF4TU8O9
	dH39R3sWfNBWlYyf0C5oPT4g3Wypl0aav49h9DIVLH1LdzsvRHaipyxTVOcTs005YvkpuaMW8TzKO
	YLY8rG2APwifgnFfYOnSOIJk6nTGvSHfE8roSiG5UmbNDAH9rlzcjLa/S1m0hfOMP6UTmGluLEjWz
	+TTR6xHlJVw3wBD8cNInQYawJRDOUkeIsRf2GeqgKiF3/H7Ub2BUs/B1RnPl4jlL/rFXvpQoQBgXX
	11hqB8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXEQ-00000001t4j-1GLw
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 07:23:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXDM-00000001szV-0oJc
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 07:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JFBeJ6MgT6zo4FyBxtLrxgVA2X3Qucidq9sPOh6rCn8=;
	t=1727767351; x=1728976951; b=f0O7SlD1s43pJu3FYnWOBsbjV1Xsh9rAp/hPkom5NxtyFCP
	qdjdQi9ZrtLElCsdd6koAN4ilnIM9lbaZ0WuDhdmEy+z2pTfGN5qWZN/QaWIjiJEzH3TWGVTbJgz1
	UtGZhWimrjMWnFSnsHIZWVjD8UU1+wcrSADYG+a8mP3UdUtf/YL0zkH3u/vWqTPlAvm4TZF2TBpgi
	USdnxRAAIzbqIR85eQgPHB7Ax0ZewClNpDOUv84lvsakcMlykBSyDg+kb/NfvV3ONMLrr479Eihkj
	Xrv5Z1dPiX9XnCNTszqBj300bT4YA/t02FwysiCwkeYUgCpVerI3hP5xfK5cbW2Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1svXDJ-0000000EeNZ-11Lk;
	Tue, 01 Oct 2024 09:22:29 +0200
Message-ID: <c103db90ed53a75cae10baba0ae52dae85bf1c3f.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 01 Oct 2024 09:22:28 +0200
In-Reply-To: <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
	 <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
	 <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_002232_256356_795D08D5 
X-CRM114-Status: GOOD (  23.48  )
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

On Tue, 2024-10-01 at 12:47 +0530, Aditya Kumar Singh wrote:
> On 10/1/24 12:01, Johannes Berg wrote:
> >=20
> > > +		/*
> > > +		 * inform about the link info changed parameters after all
> > > +		 * stations are also added
> > > +		 */
> >=20
> > I don't understand that comment - you're not doing anything with the
> > stations here? And per the commit log it's explicitly _not_ after doing
> > the AP station. I'm not sure we should set up everything before the AP
> > station?
> >=20
>=20
> Okay let me try to explain the situation here -
>=20
> In the *if (add)* block, drivers are informed about the new links added=
=20
> via drv_change_vif_links().

Sure.

> For drivers like ath12k, we know which link=20
> is changing, but since the channel contexts for the new links aren=E2=80=
=99t=20
> available yet, the driver can=E2=80=99t determine which link the firmware=
 should=20
> create the interface for. This is because we have more than one firmware=
=20
> operating under this interface (grouped multiple hardware under single=
=20
> wiphy). Therefore, this notification isn=E2=80=99t very helpful in creati=
ng the=20
> link interface now.

Yes, you said that.

> Next, in the loop list_for_each_entry(sta, &local->sta_list, list),=20
> drv_change_sta_links() is called to notify drivers that the links for a=
=20
> given station (STA) have changed. Drivers use this callback to create=20
> the link stations after the STA has moved to the authorized state.

Yes, I also got that.

> At this point, the driver knows which ML STA and which link STA to=20
> create. However, to create a link STA, the corresponding link interface=
=20
> must exist first.

Right, you said that too :)

> Currently, it doesn=E2=80=99t, so the driver can=E2=80=99t add the link S=
TA.

Right.

But that doesn't explain the *comment*, which literally says:

   inform about the link info changed parameters after all stations are
   also added

but you
 (a) don't add stations here
 (b) if you're thinking about link stations, the link stations are
     only added _after_ this comment and the link info change ...


> Later, in the loop for_each_set_bit(link_id, &add,=20
> IEEE80211_MLD_MAX_NUM_LINKS), channels are added. At this stage, the=20
> driver will actually create the link on the interface at its own level.=
=20
> Since here using the channel information, appropriate firmware can be=20
> picked. For example 2 GHz or 5 GHz or 6 GHz firmware.

Picking "firmware" sounds very odd here, I'd say you mean "which device
to pick"?

> hmm... yeah true that. May be I will move this once the old links are=20
> removed?
>=20

I'd think at least that?

But also this seems to break out driver for other reasons, because it
initializes rate control somewhere here and needs a station for that.
Didn't look deeply into that yet though.

johannes

