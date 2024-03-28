Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC81CD11DF
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTcux6tsV0p/3xqWxMopt0TVCxlgxKArOoPe3sFFjw8=; b=CpZ1jLIrKaqgdcFG2iBj5QWRzW
	MidG64o00vTnz96gRChw+jAJdONNZbiZQ8IFe9kopWPlSedjP296e+4KyWL8KPDAYEmaKZ025Uoe+
	Lm2x6EAl5YRbv6l9abAnnKAqNDYoG9MDJ/QBIq+r45+B5zqrYM5VXFy9P0qXUs4GwUW3WUAD2p4eo
	hirg+IErtSQwy9wmRbnoy389uFf2SWbtfqU0cBKoSGtlFKxhTSVawXyVKeL8pNcwr6E+HlRMpQuJA
	eA/UJOD+QJ9r0IGxOgoRfbZMrqJsDmJpShRQ+GX2y8zGOmaV17HxHc9/Ot0tg1mlw4897z9wu7cT9
	22Z0wAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpusf-0000000FGcw-3MDi
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 18:53:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpusc-0000000FGbu-266C
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 18:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OTcux6tsV0p/3xqWxMopt0TVCxlgxKArOoPe3sFFjw8=;
	t=1711652018; x=1712861618; b=OwP+XloaNCf49v/GlQV6YqHlgoiJR/PxxQFU4YoKgy2k4nv
	kDn3YDJ635hGO9i0uqyS4LHB3j3dt7Vy7qcfawLIkug95T1eQgi9KyjX9DK2LBZk7tt0CZhHAznwv
	c//uMe+F7FbAD4TiKCARjiGR+32BncHei/ifUxnx2Le/w1yLCwnOIseOsNpUj4ONJ1sdlDKoEU8So
	xMoSbA071+Q6RDoaUEjYyq7bqFLypJAQenJRwgtEu33rZpj7KWvpbLabATM+PYlmSkoQgWmMQFOMu
	jwQ2nEGxJR7HHsIDN8ivYLSp7HMxNBgE4cKFean2ZGuFUxlYOLA/nMb7NEDD8luw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpusY-00000001F0q-1luv;
	Thu, 28 Mar 2024 19:53:34 +0100
Message-ID: <485ca445f0f0c47179a338df2538e74d520627ad.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Vasanthakumar
	Thiagarajan <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org
Date: Thu, 28 Mar 2024 19:53:33 +0100
In-Reply-To: <20240328114903.1d0c8af9@kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	 <20240328114903.1d0c8af9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_115338_573604_49E6A6F2 
X-CRM114-Status: GOOD (  17.37  )
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

On Thu, 2024-03-28 at 11:49 -0700, Jakub Kicinski wrote:
> > So in that sense, I prefer that, but I'm truly not sure how the (hand-
> > written) userspace code would deal with that.
>=20
> I think the best way today would be two walks:
>=20
> 	for_each_attr() {
> 		switch (type):
> 		case THE_A_ARRAY_1:
> 			cnt1++;
> 			break;
> 		case THE_A_ARRAY_2:
> 			cnt2++;
> 			break;
> 	}
>=20
> 	if (cnt1)
> 		array_1 =3D calloc();
> 	cnt1 =3D 0; /* we'll use it as index in second loop */
> 	if (cnt2)
> 		array_2 =3D calloc();
> 	cnt2 =3D 0;
>=20
> 	for_each_attr() {
> 		/* [ normal parsing, populating array_1[cnt1++] etc. ] */
> 	}

Yeah, that makes sense.

I'm not sure we even need the calloc() all the time, depends what we're
doing with it, of course.

> Compared to "indexed array" the only practical difference I think is
> the fact that all attrs are walked. I think you have to count them
> either way before parsing.

Right, generally the pattern would be something like

nla_for_each_nested(...)
	n++;

// alloc etc.

idx =3D 0;
nla_for_each_nested(...)
	array[idx++] =3D whatever(attr);

or something like that.

So I guess the only thing that changes really is that this now becomes

nla_for_each(...)
	if (type !=3D DESIRED)
		continue;

vs.

nla_for_each_nested(...)


I suppose we could even define a

nla_for_each_type(..., type)

for that.

> I was wondering at some point whether we should require that all
> multi-attr attributes are grouped together. Or add an explicit "count"
> attribute. But couldn't convince myself that such extra rules will
> pay off sufficiently with perf and/or ease of use...

That doesn't seem likely, after all, you'll definitely want to double-
check all that ... Personally, unless you have something super perf
critical, I definitely prefer _not_ having a count like that in the API
because it encourages unsafe code that doesn't do the necessary bounds
checks and then crashes ...

johannes

