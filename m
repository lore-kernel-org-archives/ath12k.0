Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE196C4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KExW29pFg2U1j32PSnZKZGEMbN+QiSoNNAFNVkXT0sg=; b=127p99v7WODwTIBv1NmQKRE/L2
	H+uwPimcj4psI0WBIMRSszYS+PXKcnNw1DFLHyGID5Yn2s8pEJ0cOU6+TPJ+DGNLvwBHkb4LF3wDT
	APyjCr2oZqGrJs9PoJdtmbisDXi0AYtIh/q29lB0jJ/8jBgeRIA3tnWT2iBNBBiofygVQ77ltTE42
	MGygb72j+vR3/Y1sUvrQCWMo8yedqf+1+6Xyy8hOYRk1tF2V4/UpUTLZTuZJs9z8b3ccSG0R0Y2CM
	pljeS9Ym/ZnlBKTgpD1sxupcFJKPxBqZGBtIG/IZ0TxLwQw3OqV7r011mFeFRmO5ZmHKaRBuzULPg
	j/+uoLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZIj-00000003Z9R-2Eis
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 09:52:29 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZIg-00000003Z8z-2ZVh
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 09:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=KExW29pFg2U1j32PSnZKZGEMbN+QiSoNNAFNVkXT0sg=;
	t=1713952345; x=1715161945; b=taaMDWtLJ+zDdBFbp7v/EG95gOzYvqlnILA9063GyTblWa5
	K2BnI0SL52642R91EXycxxcNvX7YafY7smOvBX/rEzUiIkIjDfEb8P5yA+np6uD8a+pjWMt9q4Z3m
	6waGTvqpc6Dck/DQoQOjgRuvHzrXKz0/EtC46SkJn8FpHnA9aINk8Dx+Pb/NHdSHTEekXh4yYcUe+
	1GemfSzaaTO3KteVjCY5+XMhoj0efPFnoKA7juaYI8I/bD2XQQPq0y3uU+zz1F+IwthAglIP81m3m
	y1VkCf7FzZqGm0xjOuVld5hxGTr/hRbrdoevGA3L8BjnJfNcQGw80+pHCdGpJlJA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rzZId-00000003Us9-0tSA;
	Wed, 24 Apr 2024 11:52:23 +0200
Message-ID: <0bfbb5549b48296e6219488d47caccd10e818700.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Wed, 24 Apr 2024 11:52:22 +0200
In-Reply-To: <87edavt7h8.fsf@kernel.org>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
	 <20240424065646.1666166-4-quic_periyasa@quicinc.com>
	 <517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
	 <87il07t7zq.fsf@kernel.org>
	 <3dc4339f5c3f603027c2214058e7e3251652a7f0.camel@sipsolutions.net>
	 <87edavt7h8.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_025226_748815_7939DA24 
X-CRM114-Status: GOOD (  16.02  )
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

On Wed, 2024-04-24 at 12:50 +0300, Kalle Valo wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
>=20
> > On Wed, 2024-04-24 at 12:39 +0300, Kalle Valo wrote:
> > >=20
> > > Exactly. Swithing to use wiphy_lock() definitely one of my longterm
> > > goals in ath12k. I already started working on switching ath12k to use
> > > wiphy_lock() but IIRC I got blocked by not being able to call
> > > wiphy_delayed_work_cancel() without taking wiphy_lock.
> >=20
> > That's because I didn't want to have an async version, but theoreticall=
y
> > we could have a version of it that just cancels the timer. If you don't
> > hold the wiphy mutex already you could even wait for it to finish. It
> > just adds more complexity there, and I was trying to make it all a lot
> > more obvious :)
>=20
> Yeah, understandable. I think changing ath12k WMI event handling to use
> wiphy_work makes sense, running them in tasklet context feels overkill.

Maybe. Note that the wiphy lock _can_ create delays etc. here, if you're
doing other configuration work at the same time, or similar. Though I
guess eventually you need locking there anyway, to access the HW. So it
can be a bit of a trade-off.

I expect this will evolve over time even in mac80211, though so far we
haven't seen any bad effect from it.

johannes

