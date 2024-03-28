Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43684C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVOuhICxUdhTInSEWv15GWO9hreXzs61ZuyZShZLH68=; b=GdPfZetDD7/mqkjd8NsztfNQCd
	2Mtk/VxERJEfNSFFtyBZ5vOMcNZvR+QiN31Jcv636FgJOfLFfPlu504RGBqK/9FGAowUljh5cvpZs
	cHN2xLSG0Skpaw1xmIfMo+NpMsKReXPjBc+Wg64IEY02hig+R+/5Q35oZIjsERuThBxWVcwXhI/BA
	XtfnQngrvp0pZexAZpLfu/yh0xqtLfxUI0Ae829Zwd+8O957S7PEh/YEOrxx2EttntCjgbU33oJzf
	SwZFUVkWL8BjNWTe/kJlEU1N8zqs8y7eMcXcvX0fO/8f1uniYuLBKoZQK10fqs4btKmM5tFcs8r1F
	GS2PUEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoSO-0000000DpG9-435A
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 12:02:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoSL-0000000DpCX-1qKM
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 12:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=hVOuhICxUdhTInSEWv15GWO9hreXzs61ZuyZShZLH68=;
	t=1711627320; x=1712836920; b=NaBcUAw6PuYoWzaECm5jhGoVRU9UVv9hAr3SwOC8ujFM2v0
	fipwCkrWiv13UKlUQ79rHoqranRlpu+JkNO58DL/fyCSx0wGCDzo3PfZHm5uzYz8GXqQhnAf4bW6c
	jtMpjRrFEC4Jcad18yrkH5pkOJzZvJ0K/jWH9ZqKampoTQfAYnBiZe8MhFqJTk9hhfE1hLaiXeo5I
	mzoZTHnrR8mMQftrcGov4njNH9h/oow+8EXja7HkVTzpioo4tzqdazfXRGPoemQC1+L7O+4NO+wkU
	cVQc+/YcZ7C7uccLHKszpyJIFf8ld0qkS+URCs9w5rxmn8fZfvSEydh9qmDXWwnQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpoSC-00000000wR3-2bD5;
	Thu, 28 Mar 2024 13:01:56 +0100
Message-ID: <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org, Jakub Kicinski
	 <kuba@kernel.org>
Date: Thu, 28 Mar 2024 13:01:55 +0100
In-Reply-To: <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_050205_536086_6D9C12CD 
X-CRM114-Status: GOOD (  21.51  )
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

On Thu, 2024-03-28 at 15:48 +0530, Karthikeyan Periyasamy wrote:
> On 3/28/2024 1:19 PM, Johannes Berg wrote:
> > On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
> > > +/**
> > > + * nl80211_multi_hw_attrs - multi-hw attributes
> > > + *
> > > + * @NL80211_MULTI_HW_ATTR_INVALID: invalid
> > > + * @NL80211_MULTI_HW_ATTR_IDX: (u8) multi-HW index to refer the unde=
rlying HW
> > > + *	for which the supported channel list is advertised. Internally re=
fer
> > > + *	the index of the wiphy's @hw_chans array.
> > Is there a good reason to expose this? Seems pretty internal to me, and
> > not sure what userspace would do with it?
>=20
> Hostapd use this hw index for the channel switch cmd.

What, where? I don't see that in this patchset? And why??

In any case, unless I just missed it and you're going to tell me to look
at patch N, we don't need it here, and then I'd prefer to keep it an
internal detail until it's needed.

> The hw index used as a sanity check to identify whether the user=20
> requested channel fall under the different hw or not.

You mean within hostapd itself? That doesn't make sense, it can derive
that information differently.

> In split-phy hardware, 5GHz band supported by two physical hardware's.=
=20
> First supports 5GHz Low band and second supports 5GHz High band.

In your hardware design anyway, but yeah, I get it.

> In this case, user space cannot use band vise check here to identify=20
> given channel or freq supported in the given hardware.

No, but it also doesn't need an index assigned by the kernel for that.

> > > +	for (i =3D 0; i < wiphy->num_hw; i++) {
> > > +		hw_mac =3D nla_nest_start(msg, i + 1);
> > And you kind of even have it here already ...
>=20
> Then user and kernel have to make an assumption that implicit index used=
=20
> in the life cycle.

Agree that's maybe not a great idea, for all we care this could just use
0 as the index anyway.

Which reminds me ...

Right now, the way you have it, we have the following structure:

NL80211_ATTR_MULTI_HW
- 1
  - NL80211_MULTI_HW_ATTR_IDX: 0
  - NL80211_MULTI_HW_ATTR_FREQS
    - 0: 2412
    - 1: 2417
    ...
- 2
  - NL80211_MULTI_HW_ATTR_IDX: 1
  - NL80211_MULTI_HW_ATTR_FREQS
    - ... as above with 5 GHz etc.
...


Netlink is kind of moving away from nested arrays though:

https://kernel.org/doc/html/latest/userspace-api/netlink/specs.html#multi-a=
ttr-arrays
https://kernel.org/doc/html/latest/userspace-api/netlink/genetlink-legacy.h=
tml#attribute-type-nests

This talks about families, but maybe we shouldn't read that literally
and do the new style for new arrays in existing families as well, not
just new families.

If we do that, including NL80211_MULTI_HW_ATTR_IDX for illustrative
purposes though I think it should be removed, we'd end up with:

NL80211_ATTR_MULTI_HW
 - NL80211_MULTI_HW_ATTR_IDX: 0
 - NL80211_MULTI_HW_ATTR_FREQ: 2412
 - NL80211_MULTI_HW_ATTR_FREQ: 2417
 ...
NL80211_ATTR_MULTI_HW
 - NL80211_MULTI_HW_ATTR_IDX: 1
 - NL80211_MULTI_HW_ATTR_FREQ: 5180
 - NL80211_MULTI_HW_ATTR_FREQ: 5200
 ...

which _is_ a lot more compact, and removes all the uninteresting mid-
level indexing.

So in that sense, I prefer that, but I'm truly not sure how the (hand-
written) userspace code would deal with that.

johannes

