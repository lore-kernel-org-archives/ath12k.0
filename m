Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334C0EDF14B
	for <ath12k@archiver.kernel.org>; Fri, 13 Feb 2026 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7vFpQOfTHePGlyR51/ZG3a/vz4y8aVNFBUYzTqAQOU=; b=WHGudTBvkpfxGnkWVRaMiF8k6N
	2xWi+ijHkCPbemwREs18Lp9/Ox96n7ILCJ4XVn+8UVA+Eh+RJo0u4/Hg9v6y1qtZbbaW/bea/uItm
	LlDPOItA7zMNlOBBLGzY8p6g7L4uG+Fc0YZqJGp4GP3CUf8riopGr2GS20wZCzz8rP/WTNtokZ4Vf
	rhvtE373F1eZDQDkkK+H0YuQNaPecFZ7ktYkMqqj/UUZ6lVCyIpl9LNRWs1P+nO+bAUd5nyDBufvk
	ujzAeaB69TgzD/GicNk3QKEgTu4hgrZeDppesukLUMiOs/mIrg1lgLaIb1VKaQCxzrfL7P7MdBJdU
	Czm2RC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqq9M-00000003IN4-2Tf3;
	Fri, 13 Feb 2026 10:11:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqq9J-00000003IMI-1oHy
	for ath12k@lists.infradead.org;
	Fri, 13 Feb 2026 10:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=r7vFpQOfTHePGlyR51/ZG3a/vz4y8aVNFBUYzTqAQOU=;
	t=1770977505; x=1772187105; b=km96JzG6izMIifizrJO+DkmpoSiIe+f3Ckpao0hPg/PohNU
	kjvbZdR+Ij/8H8NnscIClXlePGrPH7tJcasxk8/qqdxfiMS0en4Ono7ha+aJ6yBScpA5mmEmOxWls
	xVoZN6Ae4Hjg7TwmVjh1jkvS7cJ8f7C6nHAKnkT6ThB1vGOrpxSLrFrLtvDYKbY50Gb2I9wjSpJlz
	wqEj+M7IzwUgN1d2hllZHqkraf/q7uKJVmMTL8yZfaCH6dcip1Yltr2R+wi4qDPsl86BYLFLf/7Ex
	vtllzEcjWk17JkIPjDjLs4f1zyqvR9/oSNtNcOR1HQjlUh2wGhz1n0LMtD2PaWhw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vqq9E-00000007MW0-2KMi;
	Fri, 13 Feb 2026 11:11:40 +0100
Message-ID: <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
From: Johannes Berg <johannes@sipsolutions.net>
To: Harshitha Prem <harshitha.prem@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>, 
	vasanthakumar.thiagarajan@oss.qualcomm.com, Lorenzo Bianconi
 <lorenzo@kernel.org>, 	ath12k@lists.infradead.org, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>,  Ping-Ke Shih <pkshih@realtek.com>
Date: Fri, 13 Feb 2026 11:11:39 +0100
In-Reply-To: <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
	 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
	 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
	 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_021145_475853_17363E1E 
X-CRM114-Status: GOOD (  24.23  )
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

Hi Harshita,

> > Should we add a separate netlink attribute for the UHR operation, which
> > hostapd would fill with the _full_ data like it appears in association
> > response etc.?
> >=20
> > That way, hostapd doesn't need to build a separate data/attribute
> > structure but can just use hostapd_eid_uhr_operation(..., false) for it=
.
> >=20
> > An alternative would be to add more attributes for everything, but it's
> > probably more complicated on both sides?

> Thank you for the suggestions.
>=20
> We feel that using separate nested attributes for each feature is the bet=
ter approach, as this allows us to reuse the attributes for the Enhanced BS=
S Parameter Critical Update procedure, where similar information is carried=
 in the UHR parameters update element.

Heh, I'll admit I'm surprised - I'm usually the one advocating for
finer-grained attributes, and here I didn't ;-)

> While this approach is slightly more verbose, we believe it offers better=
 extensibility for the future.

Does it actually, though?

I had sort of expected hostapd to add the UHR Parameters Update element
to the beacons, and configure some way of having firmware set the
countdown ("Countdown Timer"). Turns out this is not only in beacons but
also in probe response, (re)association response and (UHR? [1]) link
reconfiguration response frames.

[1] the spec says "Link Reconfiguration Response" but I think it should
say "UHR Link Reconfiguration Response"

But I guess this is going to end up a continuation of the previous wifi7
discussion from last year [2] which hadn't really completed. And Lorenzo
just posted another thing on this [3].

[2] https://lore.kernel.org/linux-wireless/20250717045540.27208-1-aditya.ku=
mar.singh@oss.qualcomm.com/
[3] https://lore.kernel.org/linux-wireless/20260212-mt7996-link-reconf-v1-0=
-2b110340d6c4@kernel.org/


So I think maybe we need to figure out how we will do all of this first?

Naively, I would've said ... something stupid. I'm reading the spec as
I'm writing this ;-) The UHR Parameters Update element is actually
included in all the beacons across the entire AP MLD.

Maybe we need to take a step back from our previous discussion as well,
and introduce a broader concept here?


I could imagine, for example, something where you say in the nl80211 API
some variation of

 1) Let's start a new update operation ("NL80211_CMD_START_MLD_BSS_UPDATE")=
,
    I guess already with some parameters saying:
     - the updated affiliated AP (link)
     - the number of beacon intervals you want to do it for
     - the post-update UHR operation (?)
       (or the new channel if it's CSA? etc.?)

     - maybe - more critical if we use it for CSA - already the beacon
       templates for all the links? with all the things I say in (2)
       below, but that's more complex maybe?

       the reason I say this is that there's a difference here in how
       the counter is done - for CSA etc. the things have to disappear
       from the beacon immediately, for UHR updates they stick around
       and the counter indicates "in the past"

    returning a cookie for the operation.

 2) hostapd updates each link's beacon now including the UHR Parameters
    Update element(s), for each currently ongoing update it includes -
    indexed by the cookie - a list of offsets where the counters are
    updated.

    Thing is that this depends on the operation - CSA will already need
    the post-switch beacon template so the flow can continue without
    involving hostapd, hostapd may however need to update the beacon in
    the interim (both pre- and post-switch ones!) and need to refer
    again to where the counters are filled in ...


Either way, it feels like we've reached the end of where the current
design with CSA and BSS color updates will take us. Lorenzo already gave
up and put the parsing into the driver to find the offsets, but I
personally think that's very inflexible.

Some operations such as link removal may not need to have perfect
timing, but some others like CSA really do want the updates to happen at
the precise moment.

In some way, it's almost good that we haven't completed the WiFi7 part
since the UHR part throws another curveball with the counters
decrementing below zero - for past updates - in a sense.


johannes

