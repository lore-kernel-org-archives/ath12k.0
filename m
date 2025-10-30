Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A886BCCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Hf+wEBwc7Rzr1pIbO2ZOzrCbf45iMRZH1tYzls+nMg=; b=WUv1+hf2OsSEnAk5cgFurklEFb
	aXq3ieOYxQI1/OUAYE06H7osSSlT/NHlLwbJPcIQ1QCFpumLe+Q+UP0vHMRixCizh5/VVhl80l/rE
	AqTH9r2tNPNqYZmlCHc8zdfw2kAlbOM5MuKFRzD7/ImDMZPJhXeAj9tZWUoNrrk0WUWCeTvXIL6Tb
	5jFBBECm1fLWvHNeqXvOsaOIIJiQHj8eQ2VguTOjtutVMIpxSNkPqHo+LFjwAW+KXQg+CjNhF4hEQ
	HDeX86FA7zFFYMm9ypivTfgLevunMs4Oy7/nzl8xe5onsQRrlU8KLggq/KpvJho0ZqVAYT95vVtwk
	s0Q5VcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOKC-00000003mxq-1q0L;
	Thu, 30 Oct 2025 08:48:04 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOK9-00000003mwg-1M70;
	Thu, 30 Oct 2025 08:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3Hf+wEBwc7Rzr1pIbO2ZOzrCbf45iMRZH1tYzls+nMg=;
	t=1761814081; x=1763023681; b=QpKwMHkj8wEL1QkP3lOv/Moxi48bMPE3ZjzXcTeTdGvvsyv
	2Dnj0Ys7nfY+P7DN8jUSp6RVpnV3g65IvN97lhyan9dLsz5hKsOr/irKH1lckgN/y0NvgvzRCtl8w
	CMEp44zJ/xWJI9wSf4AoV420speeob0QogZAhleUryKXleJ4PCj26NiIFp5Z6ftlWnCisNyVjdc/D
	KMoVxajfrA2g+yx63Vc6K1jMx3Pb+uuXlOG4KVMwEwv8ujylI7vUpk0G+HB7XdBd4M2SDEhlnrR+j
	bPRrY9ZGJZRpobL7d9oNWJ9H7ZdtRCGVpoplPJWOnuXkSpDv7zIq8a6DZl64dwXA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1vEOK4-0000000GDBZ-1Lgp;
	Thu, 30 Oct 2025 09:47:56 +0100
Message-ID: <b6a9de98b9b09c73003b89331ba235c3a959c3fd.camel@sipsolutions.net>
Subject: Re: [RFC][v1][Design] AP Architecture for Roaming with Wi-Fi 8
 Seamless Mobility Domain (SMD)
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Aditya Sathish <quic_asathish@quicinc.com>, Johannes Berg
	 <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	hostap@lists.infradead.org
Date: Thu, 30 Oct 2025 09:47:55 +0100
In-Reply-To: <fb0a1ddb-af24-47f9-9d75-0a8f2e346d81@quicinc.com>
References: <fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com>
	 <c618e0e8fdee9f7aa2628aefdf2dc04c48e6e9b7.camel@sipsolutions.net>
	 <30403bb70a2a017c90b1d4a5a1a07514bb670822.camel@sipsolutions.net>
	 <fb0a1ddb-af24-47f9-9d75-0a8f2e346d81@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014802_435573_3383C59F 
X-CRM114-Status: GOOD (  26.34  )
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

On Wed, 2025-10-29 at 16:17 -0700, Aditya Sathish wrote:
> [SNIP]
>=20
> > A good part of this argument - "pending management frames" - really goe=
s
> > back to hostapd's architecture and single-threadedness, but really I
> > don't think "hostapd's current architecture implies more latency"
> > implies "we must put this into the kernel."
> >=20
> > Continuing that thought: I think that hostapd's architecture currently
> > leaves a lot to be desired, in particular around how MLD works, and
> > obviously, at least to some extent, being single-threaded is an
> > architectural advantage in hostapd.
> >=20
> > However, user space also affords far more flexibility than kernel space=
,
> > for example some things could be written in rust (with its "fearless
> > concurrency", which I can attest to), split out to a separate thread or
> > process, etc.
> >=20
> > Anyway ... I guess in a way I'm using the opportunity here to lament th=
e
> > lack of architectural work in hostapd which isn't necessarily related t=
o
> > this, but I suspect that had hostapd historically had more architectura=
l
> > flexibility we might not even be having this discussion?
> On hostapd architecture: we have had internal discussions with Jouni and
> recognize the limitations of its single-threaded model at least in contex=
t
> of SMD roaming. We are yet to identify any features outside of SMD which
> holds a critical latency requirement. As such, we see _full_ multi-thread=
ing
> as a significant undertaking without any users of this benefit outside of
> SMD (at least at this time).
>=20
> Given this, we are exploring an alternative approach =E2=80=94 introducin=
g worker
> threads for low-priority kernel events while enabling prioritized handlin=
g
> for sequences like ST Execution and the inter-AP messaging in the main
> thread. This could offer a tractable path to bring multi-threading withou=
t
> having to do a deep-dive study on the impact of parallelism on existing
> features.

Do we have a clear picture of what the performance issues might be?

To me, it seems a bit that talking about threading might be a red
heering. It could be that the primary issue is the prioritization of
events when there is a burst of activity.

We should not need threading as long as each individual event can be
processed quickly and hostapd is able to keep up overall. In that case,
we have an event ordering issue which can likely be solved by using
multiple nl80211 sockets and giving them different priorities in the
mainloop. By doing that, you can effectively pull all time-critical
events to the front of the queue and ensure they are processed with
only a short delay.

Now, that doesn't invalidate your point at all. If we do have tasks
that take a long time (crypto?, external requests?), then it can make
sense to push just the slow part into a separate thread and pick up
processing in the main thread once it has finished.

Benjamin

> To summarize,
> (1) We will defer offloading the ST Execution and inter-AP communication
> =C2=A0=C2=A0=C2=A0 to mac80211 until we are ready to demonstrate the need=
. Until then,
> =C2=A0=C2=A0=C2=A0 we will proceed with hostapd-based ST Preparation, ST =
Execution and
> =C2=A0=C2=A0=C2=A0 inter-AP communication.
> (2) We are planning to explore the introduction of worker threads for low=
-
> =C2=A0=C2=A0=C2=A0 priority kernel events while enabling prioritized hand=
ling for
> =C2=A0=C2=A0=C2=A0 sequences like ST Execution in the main thread.
>=20
> Regards,
> Aditya
>=20
> Regards,
> Aditya
>=20
>=20
> _______________________________________________
> Hostap mailing list
> Hostap@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/hostap

