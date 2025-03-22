Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55738C35FFC
	for <ath12k@archiver.kernel.org>; Sat, 22 Mar 2025 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp6wMmpdVwBU4pDmuRCX8vo8ezEjV9Zo8H7H6eeFiDk=; b=zU1YFt6GAnGOohw4XdwVuS3KlY
	cmg/u5BQ+HiPnB4q6ijkpt8K0MhR9+YelVKu40SJ5zOClB+58nU0F6j+4u2yQTZ4GfHQ47buTzVGw
	qUDnbB4lmPVxEWP0+m6VbttD5jONK6dy0Wpb6puaXycViYnwc4VqGQfggwPvRgkWkC29ln326dAi8
	147B1S4XIQNeGQz9b5G8Z7TeHvtEc1+ESpDTF3/YSzcqEhpy1j/DAs2LptEirjPh9zT0Nb9zVOR48
	aTrBnGo9ERAM/zDZ0CuDLGz1P36xs6V13TQznNHhGWToexIMEuH0r1VoAJoAl1+DtZXSONCuyUbcQ
	9lG/kUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvumc-0000000H80A-43ru
	for ath12k@archiver.kernel.org;
	Sat, 22 Mar 2025 09:04:46 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvumb-0000000H7z7-160S;
	Sat, 22 Mar 2025 09:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Lp6wMmpdVwBU4pDmuRCX8vo8ezEjV9Zo8H7H6eeFiDk=;
	t=1742634283; x=1743843883; b=rwo1Jh/dWPih5XtjvvZcsi7wWX7xUhVgu18gQKyiJYs0Fo9
	qkHf7CDZ3oDcwNe7u9gcHea6VnMHTKlKsLrsAtiTNomHoe2F3jpTkXVE5NA1C3WVEc/lAXJBktbW4
	fkImDttPW1ShO2YQdFZghmNH3rd/oTQ7gT66i1pM7MZtDcBKl1t+pP4hGR5P/amWB9cskcZPODkAa
	c40GkI3PujOc1gT9dM6BqKs9PqEj04bYcc7y5Qw7k1rrtaDltGsw80vN7b+IhKUXjtCIF/zcDUsGT
	1EVBppGQKg9hjoX8sMevyyKJbWPdSbPnlirIUxl0YANJvHZ1PZmasDvve6itPcXw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tvumV-00000001trl-1JPB;
	Sat, 22 Mar 2025 10:04:39 +0100
Message-ID: <b3efabfe73ad2c194e49a01342f90eda6c7903af.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/3] wifi: nl80211: add link id of transmitted
 profile for MLO MBSSID
From: Johannes Berg <johannes@sipsolutions.net>
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, Muna
 Sinada	 <muna.sinada@oss.qualcomm.com>
Date: Sat, 22 Mar 2025 10:04:38 +0100
In-Reply-To: <4e4e4737-6040-4ec2-a3be-3fe1aba7b7cf@oss.qualcomm.com>
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
	 <20250310200237.652950-2-aloka.dixit@oss.qualcomm.com>
	 <52beaa2c05c91590797cc1f53b779fca085c8850.camel@sipsolutions.net>
	 <4e4e4737-6040-4ec2-a3be-3fe1aba7b7cf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_020445_299670_314D481F 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, 2025-03-13 at 15:59 -0700, Aloka Dixit wrote:
> On 3/12/2025 1:55 AM, Johannes Berg wrote:
> > Hi Aloka, all,
> >=20
> > > + * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitte=
d profile.
> > > + *	This parameter is mandatory if the transmitted profile is part of=
 an MLD
> > > + *	and the interface getting configured is a non-transmitted profile=
. For all
> > > + *	other cases it will be ignored.
> >=20
> > So I guess it's a question of what "the interface getting configured"
> > means, but I guess you could set up the transmitting interface?
> >=20
> Right, if the interface getting configured is the transmitted profile=20
> the link_id is ignored.

But I guess I don't understand yet why it's not needed? If you want to
configure MBSSID stuff for the transmitting profile it seems you'd need
the right link anyway?

But if it's not needed, should we at least validate it's correct or so?

> The 'else' case in the highlighted snippet above is the same scenario as=
=20
> the 'else' case you referred to, which is one layer out: "else if=20
> (!config->index) {".
>=20
> Both are executed when the interface getting configured is the=20
> transmitting interface. The difference between these two 'else's is that=
=20
> in one case userspace explicitly provides=20
> "NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX" and in other it hasn't.

Right.

> Similarly, for MLO, mac80211 does not need the link_id of the tx=20
> interface because it already has the link_conf for it as part of basic=
=20
> AP configuration parameters, hence link_id is ignored in both 'else's.

Oh so you're saying that you have an outer link_id already in
nl80211_start_ap() (or other callers). So then I guess we're back to
validating it, in line with how we say:

                if ((!config->index && tx_ifindex !=3D dev->ifindex) ||
                    (config->index && tx_ifindex =3D=3D dev->ifindex))
                        return -EINVAL;

now?

johannes

