Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CBEEDF151
	for <ath12k@archiver.kernel.org>; Fri, 13 Feb 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS2h1Kddm9w8T7RZLXnccTq+/EyFxF7WwBUsGnMZxOc=; b=Rplk0s+/8jlx29U4wkL3mRea5d
	/obZ3MZx3MSneUgXOZkTjSghs90mC95+5aFyWXFZwQsIjiNuIED/9n/i8igVnZNEPBzckxb1Nun9A
	JCROkSy2OEFP5N6GtsRO41MDx7boYFc0NRZI4046GkL20S4ZnmeeyuNsIw6848iVMFGQHGBhLEFvG
	IFXJZGmiY0+EU/lfawTqi2Hz7d9/8YDciaPY8RfvZqZlMkgBFQfa9peLqCVVLqnQx/EsM2WH/85k3
	bsCAZSQZQmEWDl63+jDVmMx3ZvoB1AeRwPDHmkbVMp1q9awlIB5cmmXC+ykNHcXhWlVOlPmWbOJoi
	Qx4VjWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqO9-00000003Jdx-2FPT;
	Fri, 13 Feb 2026 10:27:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqO6-00000003Jdb-3TD4
	for ath12k@lists.infradead.org;
	Fri, 13 Feb 2026 10:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=DS2h1Kddm9w8T7RZLXnccTq+/EyFxF7WwBUsGnMZxOc=;
	t=1770978422; x=1772188022; b=Lzq62Yzc0gZJWNHw9kK+IUxCyA4Ksp74Qm1URg13H2YlL2N
	pfxmLuucmgFHozX6QgT6spOuWwYSkXNY8yaduuBiv5NaQkCwo4670WPlR5qlYZMhUYlvSrUm4XJ9D
	ny96EKzQUTtNDpXlvw8Vvar+Wy9x06cErT+c/IemRtUa264fyv3NPboWdTcf/qmTjAEIgUxSkcQzA
	2HQOfhTh//9dSWNTlyNS0n/MYI2W3KP3kXPcpD64h2U2A+6OXkRBrJHSmkL7CgOVCezuOQV2eHdBo
	aMakJ1FaCQQGbmXSbG9Je4/BwmDjzfhJmCpG1mU7OXSL3MQBJubu65qydTvqSoLQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vqqO2-00000007NB7-0SRV;
	Fri, 13 Feb 2026 11:26:58 +0100
Message-ID: <9576fdbc0b9b62caba88e05716d7c7028512130d.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v8 2/3] wifi: cfg80211: add initial UHR
 support
From: Johannes Berg <johannes@sipsolutions.net>
To: Harshitha Prem <harshitha.prem@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>, 
	vasanthakumar.thiagarajan@oss.qualcomm.com, Lorenzo Bianconi
 <lorenzo@kernel.org>, 	ath12k@lists.infradead.org, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>,  Ping-Ke Shih <pkshih@realtek.com>
Date: Fri, 13 Feb 2026 11:26:57 +0100
In-Reply-To: <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
References: <20260130154259.265130-5-johannes@sipsolutions.net>
		 <20260130164259.54cc12fbb307.I26126bebd83c7ab17e99827489f946ceabb3521f@changeid>
		 <f96125eeda23451c19067359eb9d10b4047bcdd3.camel@sipsolutions.net>
		 <5d54feea-d0cd-4bd7-b0d2-02e42f0fe5e1@oss.qualcomm.com>
	 <be9ab3c7f05b0f56f19aee0ffc7c2f96138b9a05.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_022702_891651_E43BC37C 
X-CRM114-Status: GOOD (  19.25  )
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

On Fri, 2026-02-13 at 11:11 +0100, Johannes Berg wrote:
> Hi Harshita,
>=20
> > > Should we add a separate netlink attribute for the UHR operation, whi=
ch
> > > hostapd would fill with the _full_ data like it appears in associatio=
n
> > > response etc.?
> > >=20
> > > That way, hostapd doesn't need to build a separate data/attribute
> > > structure but can just use hostapd_eid_uhr_operation(..., false) for =
it.
> > >=20
> > > An alternative would be to add more attributes for everything, but it=
's
> > > probably more complicated on both sides?
>=20
> > Thank you for the suggestions.
> >=20
> > We feel that using separate nested attributes for each feature is the b=
etter approach, as this allows us to reuse the attributes for the Enhanced =
BSS Parameter Critical Update procedure, where similar information is carri=
ed in the UHR parameters update element.
>=20
> Heh, I'll admit I'm surprised - I'm usually the one advocating for
> finer-grained attributes, and here I didn't ;-)

Wait, so I wrote a lot and forgot to circle back to this question ...

Basically I think that it's not going to be useful to split it up. I
have no objections to it, but it complicates the code (especially in
hostapd) quite a bit, because it's going to be either

 1) include each thing (NPCA, DBE, ...) in its own attribute, so that
    e.g. NPCA would be 4 or 6 bytes per spec format, but then we need
    separate validation for each in nl80211

 2) we really break it all down to each individual value, so e.g. NPCA
    would have separate attributes for minimum duration threshold,
    switch and switch back delay, initial QSRC and a MOPLEN flag; this
    is a bit easier to capture in a policy, but a LOT of parameters
    overall.

The thing - and why I wrote so much - is that we basically only need a
single current, and in the case of updates additionally a single post-
update, UHR operation.

So unless we're going to completely design away from beacon templates
and create an API where including the UHR Parameters Update element is
fully the firmware's (or driver's) responsibility across all the
different frame types, then the split isn't really needed. And even if
we _do_ design it completely that way, giving the post-update UHR
operation and comparing to the pre-update one isn't a huge stretch for a
design that just required fully rebuilding all the frames (parsing all
the way into fragmented elements and putting them back together in a
completely new way, including re-fragmenting elements and subelements
etc. which all sounds very messy to me.)

johannes

