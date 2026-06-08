Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D94FCD8C8E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIZJExVAW/SiQTfvjS5WGXHRXQJ/5VxQHzaox57JJlw=; b=BhMMtZ87/7aT1QBrHCxUdwBTPO
	enL3YzuJNoUEJ9/2AYXtQaC9YErDCZqEIfcqShZbaSpdJBOVMPiRiS9/WnAl+yJqepiIWnfDBjdfw
	TZr9i5DRSIcNsOqrJGuNNEeAGoKV25NfXuGaD4gMIsirm1B5FcOPY4Gxf+gCp6Oykhm9EMpmG6ovX
	GbG23dOjBE8P8i2y3PNQjjtIYp7cHSgXpXA71bh9d2L6my4j9p5nihQoG1Yg/L6GkHA7LIIbGrYOw
	aKCHSfVvRXWxbw/pakhGumu3xos4RstyR+DXJVxy7p0dIwHgbe0ZtCE0PPeHr+VVRKTsloynNCLX4
	0jaV48RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUE2-00000002xwh-37by;
	Mon, 08 Jun 2026 07:16:46 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUDz-00000002xwI-2qow
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 07:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=UIZJExVAW/SiQTfvjS5WGXHRXQJ/5VxQHzaox57JJlw=;
	t=1780903003; x=1782112603; b=Ms3NH5gsMqmhJgAhi0fbCCr91ps+cOGW/p8BqH7CXh7ZsI2
	LBl9+6XrChUeSuPOULswDz3VE5PSflHWCQpYiNs+CQFuDOB+tJxPv20dNpftzHk42gIj29Eop96l4
	K7tpQKsMn00Ji0V1sTSHvfzVVjfb4UOc/tFAkYtif6YyRQtt1EnclNKMnGKm1zwe5vfBITkPsoS1L
	p/JR/o22zx1Iwvmuzah+eIW7hOeh4e2+T9sBqaUVl1Un5m2r8XPFAWmGFd53u87bN+a6HYLYHK7d3
	OFe09WxPzPUwaCaSfSLivpW7Lwl8/VKaQlJ98S/9tMRcTQLbzv0gfd3HKCwD4siw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wWUDw-00000005Yx2-0xCr;
	Mon, 08 Jun 2026 09:16:40 +0200
Message-ID: <7d251045171a4146604b8788479efc0e99224ff8.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 0/5] wifi: cfg80211: Add fragmented
 per-link station stats in MLO
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Mon, 08 Jun 2026 09:16:39 +0200
In-Reply-To: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_001643_724308_4AA26756 
X-CRM114-Status: GOOD (  10.71  )
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

On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
> This series introduces fragmentation support for Multi-Link Operation
> (MLO) station statistics in nl80211.
>=20
> The current nl80211_dump_station() implementation works well for legacy
> (single-link) stations, but it does not scale for MLO peers. With
> multiple links per station, dumping all per-link information in a single
> netlink message can exceed size limits, resulting in -EMSGSIZE errors
> and incomplete dumps.
>=20
> With 802.11be (Wi=E2=80=91Fi 7), a single station may have multiple links=
, each
> with its own statistics. To address this, this series introduces a
> stateful dump mechanism that splits station information into multiple
> messages when required.
>=20
> The dump is performed in two phases:
>   - Phase 0: Aggregated (station-level) statistics
>   - Phase 1: Per-link statistics sent in separate messages

[snip]

Overall, this approach seems (mostly?) right. I have a couple of
comments reading the code itself, but also:

> Aggregated Stats (Phase 0)
>=20
> NL80211_CMD_NEW_STATION
>  =E2=94=9C=E2=94=80 NL80211_ATTR_IFINDEX
>  =E2=94=9C=E2=94=80 NL80211_ATTR_MAC
>  =E2=94=9C=E2=94=80 NL80211_ATTR_GENERATION
>  =E2=94=94=E2=94=80 NL80211_ATTR_STA_INFO
>       =E2=94=9C=E2=94=80 <aggregated station attributes>
>       =E2=94=94=E2=94=80 ...
>=20
> Note: No NL80211_ATTR_MLO_LINKS is included in this phase.
> Per=E2=80=91link stats are sent in Phase 1.
>=20
> Per-Link Stats (Phase 1)
>=20
> NL80211_CMD_NEW_STATION
>   =E2=94=9C=E2=94=80 NL80211_ATTR_IFINDEX
>   =E2=94=9C=E2=94=80 NL80211_ATTR_MAC                 (MLO MAC)
>   =E2=94=9C=E2=94=80 NL80211_ATTR_GENERATION
>   =E2=94=94=E2=94=80 NL80211_ATTR_STA_INFO
>        =E2=94=94=E2=94=80 NL80211_ATTR_MLO_LINKS
>             =E2=94=9C=E2=94=80 [link0]
>             =E2=94=82    =E2=94=9C=E2=94=80 NL80211_ATTR_MLO_LINK_ID =3D =
0
>             =E2=94=82    =E2=94=9C=E2=94=80 NL80211_ATTR_MAC =3D <link0 M=
AC>
>             =E2=94=82    =E2=94=9C=E2=94=80 NL80211_STA_INFO_RX_BYTES
>             =E2=94=82    =E2=94=9C=E2=94=80 NL80211_STA_INFO_TX_BYTES
>             =E2=94=82    =E2=94=94=E2=94=80 ... more link0 stats ...

This description is missing another nesting level as
NL80211_ATTR_STA_INFO no?

johannes

