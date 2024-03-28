Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE3CCD1283
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vArowKgbDJzmZWDWeF0zjkz6oCdO1S/8qWK3bsATyZE=; b=bUTcDxHe5ATILHazT2wHNtUPJB
	BwodnebJbd4JihEHoFPLsnjqcnbk2miWYbywRhx1irN7756GzBYZOMb81Df/yfTH+qJOQiqFjL5zm
	2sv3q4lz1v+KotFPAH7GTWMi72JxBrjHyvEtmeNZPqWTQoZPEzruXDbprjbEZ3clsoqEvJ7K6Tezo
	3RYAdJeTHMaAkWV5IwIEHjPKZlhlHzFoAGI5ipgNa4Ux7WCeCtOrijgnvoW5L2VcK+kVWKizqVvvK
	ui65gIVnp0I42n2BGbDoJzW+wUak5Bh3REZh6RqTpyTttSU9EkLTQRPKxJq9AeQGCa8ZbOc29RCpD
	YylyGbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsT3-0000000EhiK-08zN
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 16:19:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsSz-0000000Ehgy-34ER
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 16:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=vArowKgbDJzmZWDWeF0zjkz6oCdO1S/8qWK3bsATyZE=;
	t=1711642741; x=1712852341; b=KVLEQDvH/fxwB8U1KCU0mgtPx/SF2qYhVbe+wGi/jmcC85U
	z8MhWj0KjqB7SFBYrGzZ9goXH/34HzY6cUQdklqsnfHmacBQWOSFZ9j+lhFciZaZKhcU/d9MqniPZ
	39J+u5hUsIVg9dPTVyDVATVXD83GOocR98P3AsOwTGKfWzexDL8HeduslRcrFkh9FZZWiu4guQvTX
	oEfsQJIz0cOGHcnhfmDCcEAEYy77loPYfihNlHDP8kF3SmGJ64mkaW2ePaQlilwETvSPsZHMeDkqg
	6PXrhJL0i4WS3owBFhitx6w6IVkWsYY6SsILojlIbcUIUT/5L8f73lfzshl8CuXA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpsSx-000000017qF-1fBQ;
	Thu, 28 Mar 2024 17:18:59 +0100
Message-ID: <0d4878d0dce3c2e9d500d19783dc7be3f995cced.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Karthikeyan Periyasamy
	 <quic_periyasa@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org, Jakub Kicinski
	 <kuba@kernel.org>
Date: Thu, 28 Mar 2024 17:18:58 +0100
In-Reply-To: <3cc984766a2cf1452ac44054cd736c913c356469.camel@sipsolutions.net>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	 <14b739c9-18da-0d58-b58d-cccebc505950@quicinc.com>
	 <3f61f18fbf3372ff88da54cdfbd309e74b2aa4e9.camel@sipsolutions.net>
	 <2b5fdc14-85f0-48ba-9797-c1f43ecab86e@quicinc.com>
	 <3cc984766a2cf1452ac44054cd736c913c356469.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_091901_828758_AD3FF56C 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, 2024-03-28 at 17:17 +0100, Johannes Berg wrote:
> On Thu, 2024-03-28 at 09:14 -0700, Jeff Johnson wrote:
> > On 3/28/2024 9:09 AM, Johannes Berg wrote:
> > > On Thu, 2024-03-28 at 20:40 +0530, Karthikeyan Periyasamy wrote:
> > > >=20
> > > > Can you point to any attribute constructed in this way from kernels=
pace=20
> > > > for the reference to explore more ?
> > >=20
> > > I don't have anything directly, looking at the code finds e.g.
> > > devlink_dpipe_entry_ctx_append() but honestly that's really quite
> > > trivial, it just adds that new attribute while iterating whatever lis=
t
> > > you have.
> >=20
> > Note that we are trying to maintain the same structure used by the curr=
ent
> > wiphy global advertisement since we actually refactor and reuse the exi=
sting code.
>=20
> Partially, yes. That's not true for the one I was discussing _here_,
> notably nl80211_put_multi_hw_support(), however.
>=20
> It's partially true for patch 6, though even there
> nl80211_put_per_hw_iface_combinations() doesn't need to do it that way,
> since that's a whole new attribute (NL80211_IFACE_COMB_PER_HW_COMB) and
> can define the content anew

I should say "content and how it forms an array in the top-level
message" here.

johannes

