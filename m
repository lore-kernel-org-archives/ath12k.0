Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2418ACA101F
	for <ath12k@archiver.kernel.org>; Wed, 10 Sep 2025 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toOUaxdVoGEs/B7DmV3qAM0y9m2553dykhQBsmjvKOU=; b=03EvT0SuKloqinAiWr9rXHHH5Z
	YNLBHs89x2trGDW1tlrhGIiOkj7l+dBHvykjmbQryvSpP1g/knu1fvNNhEY+u4QwWoSh4fJxVLdXj
	5ptJqgDSCkXjAwNffCsOTrNCOMsj2Jnf9oDAqqPxbD6XIb5t66lvBnJKDTCisHu+F1EJS6Dmti1E+
	DlKMInhXtq7vHrtQWq5j6O2UNyCBiWLxwEH3/uC5oudusFmFixFSBdz3d/W/jv1Z65cBOoFPwzTjx
	9m9/ex2DXEmq36vrJTXYU0xeCuHOZsCkIKrO5JlOfsgESIzCON+Z57GcjN9rTfNHWf3hh1kC4oiik
	8Yhfty9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGHF-0000000CxM1-2XI4;
	Wed, 10 Sep 2025 08:34:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGHC-0000000CxJC-2OFy
	for ath12k@lists.infradead.org;
	Wed, 10 Sep 2025 08:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=toOUaxdVoGEs/B7DmV3qAM0y9m2553dykhQBsmjvKOU=;
	t=1757493242; x=1758702842; b=ge842IhJcUxpwvyVzD0FohYaLzpYeU24XeUUUYlV7mORW6B
	oIGQfDjMAcrZbwb23DjTk8Ns1hWf2I8eKXjXOMVx51AlRtwFI5qU4UWrpxwwMjeDDyD9CUlWswZz+
	1JjTpTLu6FrZavPgiESp1kjkteG5gh/hPHvbu777qiZVFJWPYHX6Ckxy0KGijJKbKET+HC6Hu7BHg
	TArmkKgxor84paQ87hbqjGo0cdxuY1PRNqO1pnqfCqCJ6G38ZEQ3+8uEgCGWU6sYXeSgpVHQ3HObK
	VCg3zqjzMxgK2jFB0MP2vfG1wogmsgAbDYXnoWHUvT1ECZYB1vIh/kaJv8zpP/qg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uwGH9-0000000CSys-0CJF;
	Wed, 10 Sep 2025 10:33:59 +0200
Message-ID: <a83d883d0f251c08de7dfe7f2b3e7ab890a9b1df.camel@sipsolutions.net>
Subject: Re: [PATCH wireless] wifi: cfg80211: Fix "no buffer space
 available" error in nl80211_get_station() for MLO
From: Johannes Berg <johannes@sipsolutions.net>
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Wed, 10 Sep 2025 10:33:58 +0200
In-Reply-To: <20250905124800.1448493-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250905124800.1448493-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013402_613468_FC7B6AE9 
X-CRM114-Status: GOOD (  13.96  )
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

On Fri, 2025-09-05 at 18:18 +0530, Nithyanantham Paramasivam wrote:
> Currently, nl80211_get_station() allocates a fixed buffer size using
> NLMSG_DEFAULT_SIZE. In multi-link scenarios - particularly when the
> number of links exceeds two - this buffer size is often insufficient
> to accommodate complete station statistics, resulting in "no buffer
> space available" errors.
>=20
> To address this, modify nl80211_get_station() to return only
> accumulated station statistics and exclude per link stats.
>=20
> Pass a new flag (link_stats) to nl80211_send_station() to control
> the inclusion of per link statistics. This allows retaining
> detailed output with per link data in dump commands, while
> excluding it from other commands where it is not needed.

I guess I'll apply the patch for now since it makes things _better_, but
I'm really not convinced that it's actually sufficient, and I'm very
tempted to throw in another patch to make it always false for 6.17.
Convince me not to? I'll reason below:

It seems to me that with many links, even for dump you could easily need
more space than the size available for a single dump message just like
with get, since there's no fundamental difference between the two. So it
seems to me that not only should it be opt-in from userspace to retrieve
the data during dump, but also there should be the ability to split the
dump not only on a per-STA basis but also per-link within the STA, which
requires some logic adjustments on both sides (hence the opt-in.)

Especially if we start seeing more links and/or more data for each link,
this will otherwise become an issue even in dumps.

johannes

