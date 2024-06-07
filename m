Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EF3C27C55
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A06AZBW0nm0OZzaXM0gGaBoJK04KsApDfsDkp6veoHo=; b=w4ckX4OB7ysnYla+QUs1CqubEv
	kaqAhzLCzC95zWkICET1ClAjvV3Odg2GjO5Y3SYtNkWIrymzufDOrMudkuiJtnGooI/qfOffVQuoB
	elkiRKt2j7Csc812nh/Xg9u6xaQMjH1Y1RkdCibEwHX4yxtTBKG2AGJ3o4/gJf9Vox0x/0Ac8+eTC
	ohlHTQvIfF389zjOmSJjVXvAu6RmZ0d34PdjcwaJda9lpX1jc4d+8EsracJEINziMob1NpaalhI1R
	KiPdP/ERIAyV2oCVlWVYtqhk7dScAc2IxRRSUMZgfOdLhdKvKB1caEbxoi4nfTAjIq1xNUiL2m239
	WqB9lxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFWa3-0000000DUDR-0BrP
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 10:12:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFWa1-0000000DUCz-0f9m
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 10:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=A06AZBW0nm0OZzaXM0gGaBoJK04KsApDfsDkp6veoHo=;
	t=1717755136; x=1718964736; b=SAPW2w9RIduUuPQwrTS5ngAhQ1Z8cOhAU6/y9lQUvlLyGEn
	Clow0YVBq1JbDZlXO3iYX3AOUiaxj3jPioeEeM0n3h5Skb9m3jA6TRmoG0SKc59I5eUjBc+gzE/ej
	HWk+AbvfBGheAKMXQjhurtpv/8DQh5HDM1dW8KXc9MVISIEyNwhMy1VgGWhmONQARVa1Fdw2p1vsa
	HAO5RTxus3ofwS/tPSICADHrNio+hpUJPwmP9XJZQLVAHGdX7CnbX6UhfVhsgOrACs9dtzORCJrzJ
	rx/nl/btcwBvXMpI8MQrFhFOAGHoVoM28rLL9TH01un6LD6TUo6/eUVgX0fw/9aw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sFWZy-00000000v1a-1uSu;
	Fri, 07 Jun 2024 12:12:14 +0200
Message-ID: <8cac5465a87e2829d4c617995a19d3f4deba2ed8.camel@sipsolutions.net>
Subject: Re: [RFC v3 8/8] wifi: mac80211: add wiphy radio assignment and
 validation
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 07 Jun 2024 12:12:13 +0200
In-Reply-To: <c5abf1ae-bdda-42b2-95c0-9b1c39659bbd@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
	 <9b331a61b8d53284b044bc594cf9952c60164e5f.1717696995.git-series.nbd@nbd.name>
	 <a1cff51f789c21b2b307c58ee4d743a62874cec6.camel@sipsolutions.net>
	 <c5abf1ae-bdda-42b2-95c0-9b1c39659bbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_031217_219487_151A9991 
X-CRM114-Status: GOOD (  13.76  )
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

On Fri, 2024-06-07 at 11:53 +0200, Felix Fietkau wrote:

> > struct wiphy_radio *wiphy_get_radio(struct wiphy *wiphy, ... *chandef);
>=20
> I didn't add such a helper, in case we get hardware where multiple=20
> radios support the same band. That's why ieee80211_find_available_radio=
=20
> loops over all radios until it finds one that matches both the freq=20
> range and the ifcomb constraints.

Ah, fair.

Thinking more about the "whole chandef" thing, I think I want to have a
check in cfg80211 somewhere that ensures you don't split up ranges that
could be used for a wider channel?

Say (for a stupid example) you have a device that (only) supports
channels 36-40:

 * 5180
 * 5200

but now you say it has two radios:

 * radio 1 ranges: 5170-5190
 * radio 2 ranges: 5190-5210

Now you can't use 40 MHz... but nothing will actually really prevent it.

Obviously this is a totally useless case, so I'd argue we should just
check during wiphy registration that you don't split the channel list in
this way with multiple radios?

Even on the potential Qualcomm 5 GHz low/mid/high split radios you'd
have gaps between the channels (e.g. no channel 80, no channel 148), so
it feels like you should always be able to split it in a way that the
radio range boundaries don't land between two adjacent channels in the
channel array.

Not sure how to implement such a check best, probably easiest to find
all non-adjacent channels first:

=20
 - go over bands
   - ensure channels are sorted by increasing frequency
     (not sure we do that today? but every driver probably does)
   - find adjacent channels:
     - while more channels:
       - start_freq =3D current channel's freq - 10
       - end_freq =3D current channel's freq + 10
       - while current channel's freq =3D=3D end_freq - 10:
         - go to next channel
       - check all radio's ranges cover this full or not at all
         (neither start nor end of a range falls into the calculated
          [start_freq, end_freq) interval)

or something like that?

(Also some docs on this I guess!)

johannes

