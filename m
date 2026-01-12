Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A199FCF45C8
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w6Tj3c80QNPoEFJ+jUkPjNVkHVGv9bw6L8g0i9X4PU=; b=T4os88B8jvqNix06UmhnaUGm7p
	Cn8/pjVAL/qOteTZytSNDXDw+hVlXSRbR4GBYbXFfptwu/XuUJZUdDWQlGxGcj96S50L+Mh+RIWRf
	yAaWDVlzgql1+QeS5D/8v0GjLQqjU10qnhpCioDFCnB85QOoB76qklBmpBlDgHqVK+SY4fUKUtLg7
	fuJlMWAiVXWYyIdPFXylLDpH2uhw6kWcN0atvXxEoSet4y1FYSQQFaracziJ9TML0Q4h6bZXbf6Oq
	gNTH3f+3cC+SPKD6Jy3bAq3TzyBe9nA2QnfKg9yDSfCNyEqXSNLv+L0KymqJV7RvPd2zh7a1Pb8Lv
	FMpRjxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNKu-00000005xuV-1Lig;
	Mon, 12 Jan 2026 19:12:20 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNKs-00000005xtl-0YRJ;
	Mon, 12 Jan 2026 19:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2w6Tj3c80QNPoEFJ+jUkPjNVkHVGv9bw6L8g0i9X4PU=;
	t=1768245138; x=1769454738; b=r6toPJuJbB2y8aTpYneypXMGCokmzURBQOaagEhGLZrhL/Y
	Z1Vx+oNBUlwYpwIapQxAwfxDZIb2Ln75zusqBj+xPgLKuUvRDJ9Ii9SktKYlPEsOus7h0idUsflnT
	UpniTjV5opTqdRHmROlsdEs5zuEz7cd2kjDJSC+aghpFhaAgdqnikYIezKsh/zGkNV594VmY14P9m
	eB3RMLwcGs+3zAw6EuQXcXcIKgZ3CyFINe6hJWUVFmXus7oPs5TVrmxkZr7FQln8nE4czBnYBnNOh
	0LuzKAx4zNl4V9u37Z/4zpovzxqQNfpBUc7m4GgGkiz4C4QNPHHtNKK0es/J+OQA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vfNKj-0000000A1GH-1Vdc;
	Mon, 12 Jan 2026 20:12:09 +0100
Message-ID: <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net>
Subject: Re: [DESIGN RFC v3] AP Architecture for Wi-Fi-8 Multi-AP
 Coordination (MAPC)
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhishek Rajkapur Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>, 
	ath12k@lists.infradead.org, hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 12 Jan 2026 20:12:08 +0100
In-Reply-To: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com> (sfid-20260112_195259_393455_5899DC2E)
References: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com>
	 (sfid-20260112_195259_393455_5899DC2E)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_111218_355371_4E9DDCBF 
X-CRM114-Status: GOOD (  16.15  )
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

Hi,

I wish you guys (generally Qualcomm, not you personally) could finish
one thing before opening yet another ;-)

Couple of quick comments:

> +---------------------------------------------------------------+
> >                WLAN Driver (e.g., ath12k)                     |
> >                                                               |
> >   +----------------------+    +---------------------------+   |
> >   |   MAPC Peer Mgmt     |    | MAPC Policy Config Mgmt   |   |
> >   +----------------------+    +---------------------------+   |
> >                                                               |
> >                 +---------------------------+                 |
> >                 | MAPC Event Gen/Notify     |                 |
> >                 +---------------------------+                 |
> +---------------------------------------------------------------+

I think you need to do a lot more to explain why this is in firmware?

> +--------------------------------------------------------------------+
> >                        UHR AP-1                                    |
> >  +---------+       +---------+       +---------+       +---------+ | +-=
--------+
> >  |         |       |         |       |         |       |         | | | =
        |
> >  | hostapd |       | cfg80211|       | mac80211|       |  wlan   | | | =
 UHR    |
> >  |         |       |         |       |         |       | driver  | | | =
 AP-2   |
> >  +----+----+       +----+----+       +----+----+       +----+----+ | +-=
---+----+
> >       |                 |                 |                 |      |   =
   |
> >  +----+---------------+ |                 |                 |      |   =
   |
> >  | init hostapd & HW  | |                 |                 |      |   =
   |
> >  | MAPC support update| |                 |                 |      |   =
   |
> >  +----+---------------+ |  MAPC Discovery |                 |      |   =
   |
> >       |                 |    Request      |                 |      |   =
   |
> >       |                 |(MAPC capability)|                 |      |   =
   |
> >       +-----------------+-----------------+-----------------+------|---=
--->
> >       |                 |  MAPC Discovery |                 |      |   =
   |
> >       |                 |    Response     |                 |      |   =
   |
> >       |                 |(MAPC capability)|                 |      |   =
   |
> >       <-----------------+-----------------+-----------------+------|---=
---+

Those are action frames just going between the hostapd instances (or
similar), why does the firmware need to create an event to hostapd
itself?

> +--------------------------------------------------------------------+   =
        =20
> >                           UHR AP-1                                 |   =
        =20
> >  +---------+       +---------+       +---------+       +---------+ | +-=
--------+
> >  |         |       |         |       |         |       |         | | | =
        |
> >  | hostapd |       | cfg80211|       | mac80211|       |  wlan   | | | =
 UHR    |
> >  |         |       |         |       |         |       | driver  | | | =
 AP-2   |
> >  +----+----+       +----+----+       +----+----+       +----+----+ | +-=
---+----+
> >       |                 |                 |                 |      |   =
   |    =20
> >       |                 |                 |  +--------------+-----+|   =
   |    =20
> >       |                 |                 |  | Notify hostapd to  ||   =
   |    =20
> >       |                 |                 |  |    Trigger MAPC    ||   =
   |    =20
> >       |                 |                 |  |    Negotiation     ||   =
   |    =20
> >       |                 |                 |  +--------------+-----+|   =
   |    =20
> >       |  NL80211_CMD_MAPC_NEGOTIATION_TRIGGER(scheme-id,action)    |   =
   |    =20
> >       <-----------------+-----------------+-----------------+      |   =
   |  =C2=A0

Here, why? What does this do in FW?


> >  =20
> >  +----+---------------+ |                 |                 |      |   =
   |    =20
> >  |parse scheme-id &   | |                 |                 |      |   =
   |    =20
> >  |action. Init MAPC   | |MAPC Negotiation |                 |      |   =
   |    =20
> >  |    Negotiation     | |     Request     |                 |      |   =
   |    =20
> >  +----+---------------+(scheme params & APID1               |      |   =
   |    =20
> >       |              Optype:ESTABLISHMENT/UPDATE)           |      |   =
   |    =20
> >       +-----------------+-----------------+-----------------+------+---=
--->    =20

Hostapd parses something the ... FW gave it? That seems odd. We should
give it in a decent data structure format, if this is at all sensible, I
have no idea.

>           New notifications from cfg80211 to user space:
>           - NL80211_CMD_MAPC_NEGOTIATION_TRIGGER
>             Direction: kernel to user space.
>             Source: cfg80211 on behalf of the WLAN driver/firmware.
>             Purpose: Provide a hint to hostapd that MAPC Negotiation
>             Request should be triggered on this interface. For each=20
>             MAPC scheme, the driver/firmware may request establishment,
>             update, or teardown of an agreement. hostapd is expected
>             to apply policy and iterate over the locally known MAPC
>             peers for this interface.
>=20
>             Attributes:
>             - NL80211_ATTR_MAPC_SCHEMES (nested)
>               Contains one or more per-scheme MAPC negotiation hints. Eac=
h
>               nested entry includes:
>               - NL80211_ATTR_MAPC_SCHEME_TYPE
>                 Identifies the MAPC scheme (e.g., Co-BF, Co-SR, Co-TDMA,
> 				Co-RTWT, Co-CR).
>               - NL80211_ATTR_MAPC_ACTION
>                 Requested negotiation action for this scheme:
>                 - NL80211_MAPC_ACTION_ESTABLISH: establish new agreement(=
s).
>                 - NL80211_MAPC_ACTION_UPDATE: update existing agreement(s=
).
>                 - NL80211_MAPC_ACTION_TEARDOWN: teardown existing agreeme=
nt(s).

Why do you always want to let firmware be in control of everything?
Seems at least for some of this you'd really want the upper layers to
control it for purposes of coordination? How does the FW even know which
other AP it can coordinate with, isn't that something a network
controller would determine?

>       (C) mac80211
>           Two design options are considered for representing MAPC peers i=
n
>           mac80211:
>=20
>           Option-A(Preferred): Reuse existing station management infra
>           - Allocate standard station objects (struct sta_info / struct
>             ieee80211_sta) to represent MAPC peers, and call the WLAN dri=
ver.
>           - Use a subset of the existing mac80211 station states (NOTEXIS=
T,
>             NONE, AUTH) to represent a MAPC stations.

I'd say AUTH doesn't work, for purposes of key management etc. you
really want this to be in AUTHORIZED state.

>           Option-B: Define lightweight MAPC peer/station management
>           infra

But that doesn't seem better either really.

johannes

