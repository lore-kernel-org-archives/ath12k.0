Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CCAC10F15
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8p7b4C6CDp0TTv3/UFNRntuk3/leQiq7ModHlvtGIw=; b=uF5nFtp6x2C18k8dIiKp3bxnvw
	rlvimQDdK6cYMapQrQTXjmu9tmyOzdR3M/2devVU7uBV/1pWA34pQTUZFtDJAqzJAMeQtbQGNODmd
	po7oSiDMRrij+U3nCgMNe6urnmITuf60AblTotrEKHO067wDCY8w3cPDGaOZ8Vqw4xDuvjhV19e0e
	K6cAH+RNJSh3NhT2pQyCc77EMeCyBFKQt6uom55hJGs2OhWYXMmzrvRogYi1GwSSO2IN6knpiKWCK
	QgCXJGlhPIG8dkwCtpVH3exMVTtHoTbgu2v/YeeWIcTKZG8bKZh9CWI+yereTzjUhQN18WzySd09v
	EFsdB+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZAg-00000003Y2U-2nfi
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 09:44:10 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZAe-00000003Y1J-1Tzp
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 09:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=V8p7b4C6CDp0TTv3/UFNRntuk3/leQiq7ModHlvtGIw=;
	t=1713951843; x=1715161443; b=Rvs+HCWAcIY2c2ylWv6+3njHZo87CUKfqALKjaVGp50B0uw
	KzbdzlO3IqIn0W+Tqe9uCoNIAXucQ2jRmK9kWGsxEqu+78udFcpMOOySXps2aic743MEK9Av2vC0q
	7egJyD/2irl8MCs8OId0jTOQfrmP+b/ZJiJ6B+ijSidv3y+VVX2cNYhCG4m/mFt9yQzKZ1wqzkNOd
	NwsoDHN3H+2HTZRq8ZO/gpL/S/2tgy1x1exxOHijg2JukG1iMhgEFMtaQFbBPfVrpF1Py0KmX0xAf
	+XFwoMozvbYDXTpDSqGvDiDSlRhwuA69+me6iaQt8NcKzfgiU0g5ZzAfZ12A+lCQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rzZAV-00000003UY1-3hjz;
	Wed, 24 Apr 2024 11:44:00 +0200
Message-ID: <3dc4339f5c3f603027c2214058e7e3251652a7f0.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Wed, 24 Apr 2024 11:43:58 +0200
In-Reply-To: <87il07t7zq.fsf@kernel.org>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
	 <20240424065646.1666166-4-quic_periyasa@quicinc.com>
	 <517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
	 <87il07t7zq.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_024408_424939_D68C1D91 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2024-04-24 at 12:39 +0300, Kalle Valo wrote:
>=20
> Exactly. Swithing to use wiphy_lock() definitely one of my longterm
> goals in ath12k. I already started working on switching ath12k to use
> wiphy_lock() but IIRC I got blocked by not being able to call
> wiphy_delayed_work_cancel() without taking wiphy_lock.

That's because I didn't want to have an async version, but theoretically
we could have a version of it that just cancels the timer. If you don't
hold the wiphy mutex already you could even wait for it to finish. It
just adds more complexity there, and I was trying to make it all a lot
more obvious :)

johannes

