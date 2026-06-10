Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DDCD98C7
	for <ath12k@archiver.kernel.org>; Wed, 10 Jun 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGxZJjqUSM+cCMiYJPCLks95WMObgDOYKtdcr0R5aaI=; b=BgzKdY+lwqucVhLPsmkC4A0kou
	H2/Xyk64SAyhTaIMIstfHrGeqAFSxV2qOEdXI7AceEecwhH+jxgcQcgogQ44u94Vh1cPmwMVgZHKx
	B1jvZgbeUXFMoKkonswR8s+UcfIxJXo/PPjxA6abk4Iv3f65ui8jNIOizB3qoW266aVQbZN/urp0m
	Nx+oN6T27zLQDKynwtIG3hQolhK/ayaJ2QxEvkVOIDUv97yogQ4l10lwRM9oSgW93lDStKORpwE/o
	Tg4HZyKhV+AIueYjwhLQ5Wt7Dm8M1k/dVys90X1OSOXeay8IygCJiMJS0FIaSqVhCWlVKEQmthte7
	HLK1ZSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGMg-00000007Pkq-2YVS;
	Wed, 10 Jun 2026 10:40:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGMe-00000007PjQ-00Kf
	for ath12k@lists.infradead.org;
	Wed, 10 Jun 2026 10:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=hGxZJjqUSM+cCMiYJPCLks95WMObgDOYKtdcr0R5aaI=;
	t=1781088051; x=1782297651; b=V+dGdF8piuNt7vY6GaHMtvg454TmTbBNj7FgHPD/IXa1CSj
	SbIyzPn0DrMZDqTB/3QjhWQMU5h9FDIKOr6UR/oNhoxC6fCc44Dql/2YpSf7UGNzgzZHtN/q5rPSp
	YQ9FGiwEmYUuhymEtiIkGrwSDAd9FP1AzzXTIrAA8WtsbUjPv+Al2Yvb4scFiByizc7H3zn5GHM+e
	ObhoManYfBjMC+puuuHjXtxW9Zgu2l96vgO6vxlqfQtDjX3b/q14rL1GKpBzoMDAUWMVbq+E+0J7w
	JxYl+uwwVpfXcdV6WsiZ+rHc6bSdTHvrT6wf2CZhVstqh7ONV7kfxZ9r4HD/elUQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wXGMT-00000007tKz-47kZ;
	Wed, 10 Jun 2026 12:40:42 +0200
Message-ID: <9ad7cb4143a5d73b69eb98849921cf1c72f392e4.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 4/5] wifi: cfg80211: Fragment per-link
 station stats in nl80211_dump_station()
From: Johannes Berg <johannes@sipsolutions.net>
To: Praneesh P <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Wed, 10 Jun 2026 12:40:40 +0200
In-Reply-To: <19098782-24e9-4707-8207-6244371a904f@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
	 <20260607175912.2266215-5-praneesh.p@oss.qualcomm.com>
	 <88c183f827eb184e6d471964662b7ee89caf63ad.camel@sipsolutions.net>
	 <19098782-24e9-4707-8207-6244371a904f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_034052_040363_F68517AF 
X-CRM114-Status: GOOD (  22.19  )
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

On Tue, 2026-06-09 at 00:31 +0530, Praneesh P wrote:
>=20
> > That seems really odd? why even bother going into the whole thing if
> > it's invalid? Also, doesn't that ENOENT get propagated all the way and
> > it aborts? I guess it does but it should never happen because of
> > valid_links? Still seems a bit odd.
> Both the link_sinfo null check and is_valid_ether_addr() check
> will be moved to the top of the function, before any header or
> nest construction. The null check for sinfo->links[link_idx] is
> already guarded upstream by the valid_links bitmask so it should
> never be NULL in practice, I'll add a WARN_ON_ONCE and skip rather
> than returning -ENOENT, which would otherwise abort the entire dump.
> Will it be okay ?

I guess? Anyway the structure will change based on our other discussion
below.

> ok, I will try to align with this suggested model. I'll refactor so the=
=20
> outer loop
> produces exactly one netlink message per iteration, with header
> construction in one place:
>=20
> while (true) {
>  =C2=A0 =C2=A0 if (ctx->phase =3D=3D PHASE_AGGREGATED) {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fetch sinfo from driver once per station =
*/
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&ctx->sinfo, ...);
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* allocate links[], call rdev_dump_station(=
) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* apply cfg80211_sta_set_mld_sinfo() if nee=
ded */
>  =C2=A0 =C2=A0 }
>=20
>  =C2=A0 =C2=A0 hdr =3D nl80211hdr_put(msg, ...);
>  =C2=A0 =C2=A0 /* common attrs: ifindex, wdev, mac, generation */
>  =C2=A0 =C2=A0 nla_put_u32(msg, NL80211_ATTR_IFINDEX, ...);
>  =C2=A0 =C2=A0 nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, ...);
>  =C2=A0 =C2=A0 nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, ctx->mac_addr);
>  =C2=A0 =C2=A0 nla_put_u32(msg, NL80211_ATTR_GENERATION, ...);
>=20
>  =C2=A0 =C2=A0 switch (ctx->phase) {
>  =C2=A0 =C2=A0 case PHASE_AGGREGATED:
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 nl80211_put_sta_info_common(msg, rdev, &ctx-=
>sinfo);
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx->phase =3D PHASE_PER_LINK;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx->link_idx =3D first_valid_link();
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>  =C2=A0 =C2=A0 case PHASE_PER_LINK:
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 nl80211_put_link_station(msg, rdev, &ctx->si=
nfo, ctx->link_idx);
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 advance ctx->link_idx to next valid link;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (no more links) {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg80211_sinfo_release_content=
(&ctx->sinfo);
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx->sta_idx++;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx->phase =3D PHASE_AGGREGATE=
D;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>  =C2=A0 =C2=A0 }
>=20
>  =C2=A0 =C2=A0 genlmsg_end(msg, hdr);=C2=A0 =C2=A0/* or genlmsg_cancel() =
on EMSGSIZE=20
> break-out */
> }
>=20
>=20
> This eliminates the duplicated nla_put_u32/u64/MAC header blocks
> that currently exist in both nl80211_send_accumulated_station()
> and nl80211_send_link_station(), and makes the EMSGSIZE bail-out
> uniform since we return before committing the message.

Sounds good!

> should the rdev_dump_station() / sinfo fill stay outside the
> per-message loop (as a separate if (phase =3D=3D AGGREGATED) guard
> at the top), or is it preferable to fold it into the switch
> case? I've sketched the former above since fetching sinfo is
> logically per-station, not per-message. I'm also ok to adjust
> if you'd prefer it inside the switch ?

I think it has to stay above otherwise you can't unify pushing the MAC
address to the message? And then perhaps you could even unify the nest
push (i.e. NL80211_ATTR_STA_INFO nest start), but I'm not sure how that
interacts with other code and it's not really important. The header is
more important since it could change in the future.

johannes

