Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA44D44C50
	for <ath12k@archiver.kernel.org>; Thu, 15 Jan 2026 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgTnJsTai7FjZCieWiXAib1IJbxoUGHkwkLU9+Ktvzw=; b=AGQ71AFN0Q3B9GeZdvvl8pkOKu
	WvOpCQ4NIsAnGlzPO90a4CH0euSVN25S1MyKxePI9A9olbpY25TNa1SgIf+AW/ETlY41vk3yL5oEH
	VUEu0zg6Om1XrrJd2mGXZNablqUv+E3pHLpDI+A+3MiRHDqY89l+0M7zdgXkQOkZhTwhh1AItGjnz
	ToN63Jc5KoQnQoqPM1Lzj1s/p/+fQjE9UuNo7qS+LzkRLHUqpyYaO3ZC4wgXN8FfNBOFhlrQqhxI6
	mzvMnDpI1oZsFOWmA//RiaG0iz1EvtsqRN2L/vs4CVbMPPx7p/NCYxxHBp6RKDArs87FTfxYi1g0z
	KAgj43sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOAu-0000000CSsb-1lo9;
	Thu, 15 Jan 2026 14:18:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOAp-0000000CSqp-2EEA;
	Thu, 15 Jan 2026 14:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YgTnJsTai7FjZCieWiXAib1IJbxoUGHkwkLU9+Ktvzw=;
	t=1768486687; x=1769696287; b=l+qrIkLdFNtNBASMadyIkjU23AllovQkYH/1a5Ja2PkBPG3
	JHz7bhkqV3ivt6n1r0KOsyARt83tEnuRlX8ZBhPezq+JwVFZ4qpEWK6du1/B+Kin4zliPB+d7ijyO
	t2e6efehzLRzWqqEf985HiRbDKbS0TeYTbicapa8C0D5Kki898L35rI6RhYyNnZJyCqZQT1nKQtj5
	PRXBbvcqZCWvrHuamKhVNMrJhcB1yPcaq+BC96mEdu3I1uRGoccmamjepjA0hhMFia+PSfMLwutgV
	Hyt1I6VowAGX2YGrJmz+k2jz1XPjq3+DPbzuFzjLcCVoP0i3OUt30ot57+LN98uw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vgOAh-0000000CYt3-3aTm;
	Thu, 15 Jan 2026 15:18:00 +0100
Message-ID: <52356be3d21920d84579d1a8fd803540c6f9644d.camel@sipsolutions.net>
Subject: Re: [DESIGN RFC v3] AP Architecture for Wi-Fi-8 Multi-AP
 Coordination (MAPC)
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Abhishek Rajkapur
 Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>,
 ath12k@lists.infradead.org, 	hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 15 Jan 2026 15:17:59 +0100
In-Reply-To: <63ff0362-4ee4-4f13-a212-dc1351eefe08@oss.qualcomm.com> (sfid-20260114_201523_158312_F45EB4BD)
References: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com>
	 <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net>
	 <59cec65b29ded381c85d1be943d88e956a4b7e74.camel@sipsolutions.net>
	 <63ff0362-4ee4-4f13-a212-dc1351eefe08@oss.qualcomm.com>
	 (sfid-20260114_201523_158312_F45EB4BD)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_061810_370357_0F4E160F 
X-CRM114-Status: GOOD (  33.70  )
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

On Wed, 2026-01-14 at 11:15 -0800, Jeff Johnson wrote:
> On 1/12/2026 11:18 AM, Johannes Berg wrote:
> > On Mon, 2026-01-12 at 20:12 +0100, Johannes Berg wrote:
> > >=20
> > > Why do you always want to let firmware be in control of everything?
> > > Seems at least for some of this you'd really want the upper layers to
> > > control it for purposes of coordination? How does the FW even know wh=
ich
> > > other AP it can coordinate with, isn't that something a network
> > > controller would determine?
> >=20
> > A less generous reading of this could be: you guys want everything to b=
e
> > controlled by FW, so you don't have to open-source it in hostapd. Now
> > you realize oops, don't really want to do all the security handshake in
> > FW, so we need to ask hostapd and then we need keys and stations and al=
l
> > this stuff. So let's build something nobody else can use, upstream it
> > and we get the best of both worlds - others will maintain the mac80211
> > code for us anyway.
> >=20
> > Am I wrong? Is there a technical reason for not simply doing MAPC
> > discovery/agreement negotiation etc. in hostapd as well, based on
> > driver/hw/fw capabilities, and then you don't need all these strange
> > "triggered by firmware" flows?
>=20
> My perception is that Qualcomm would love for all the Wi-Fi 8 functionali=
ty to
> be in userspace and nl/cfg/mac80211 since then there would be no code
> maintenance overhead on our part -- just you and the userspace maintainer=
s.

:)

> But there are concerns about latency, and internal consensus is that some
> aspects of this functionality has to be handled in firmware (or even hard=
ware)
> in order to meet customer KPIs. This comes from our history of supporting
> large-scale deployments of APs, and the expectations of how Wi-Fi 8 will =
make
> things better. That is why we are posting design RFCs, so that you, as we=
ll as
> engineers from other vendors, can review our proposals and give your feed=
back
> and counter-proposals. We want to avoid developing what might be an
> architecturally pure design that doesn't actually meet customer needs.

Sure, that's fair.

Maybe I can just ask folks to spell out the constraints and reasoning
behind the design?

Taking this specific example, it basically says "FW sends a request to
hostapd, hostapd does the handshake and installs the MAPC station. This
is how we think we should handle the MAPC stations."

It never says _why_ and how any of this happens. What's the magic thing
only the firmware can do to figure out it should start coordinating a
given AP? (Clearly that operation can't be concerned much about latency
if it asks hostapd.)

In fact I'd have expected that in certain cases some controller
infrastructure sitting *on top of hostapd* would decide which APs
coordinate with each other, rather than the firmware. Although I guess
if you hear the beacon on the same channel with a good enough RSSI then
you can coordinate.

I could keep guessing - maybe there's a limited space to do this in FW?
But there's not even anything built into the design where the firmware
can ask to _remove_ it again, as far as I can tell, unless there was an
(unstated) assumption that it can just delete the MAPC station and send
a DEL_STATION notification about it.

The document even says that phase 1 is discovery, and then goes to
completely ignore phase 1 (it's hidden in FW), and describes basically
only phase 2.

> And apologies for the "firehose" of both design and code, but we have a d=
esire
> to ship Wi-Fi 8 products using upstream code. I've passed along informati=
on
> that you want our engineering team to focus on the base NPCA patches so t=
hat
> there is the appropriate foundation. But in parallel we do also hope ther=
e is
> engagement from other vendors on the Design RFCs we are posting. Our goal=
 is
> to upstream as much AP functionality as you can absorb.

Sure, and I appreciate that this is coming. I'm a little overwhelmed by
having so many parallel things going on right now, and all the parallel
design documents don't help.

Maybe this is the point where we consider inviting everyone who wants to
a room for a few days? Even a video room might be better ;-) List some
topics first, present the design briefly, etc.? But I don't know if it's
just the medium.

johannes

