Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E8EE7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evMrGhun3skLK+NwQ9/caA/c/xE6JRSloAj4djVupAo=; b=eyQ7D1N1tUUx43A7z3zDl7cLJU
	nLt4hEaMh26pua632TKIrDSW/+73uMIgrN9C7eoBYkNQ9fb8zBi2OM3l2j8+QZh5tirpRCfmc/kQm
	t3FeLHJ/5KYs1wjTtzlBo7eD235prMXEvhO3W1sdIJZsJktFklsw2aeS83pWaetU4Tt2Yr0L7E+bH
	zULAv2k3XeYgIN6e7hJNGkCDWOMC9dm4VJ36h+PtRkZUFzpDtgsQ4fvWf7mI9oPWAE4dprksIXPLx
	XYFqSOcaM8C4KJZupzLel+N8/443hsfuYtXxpQ3c6yj/PCF86P3DDDSkPmUMrs3iu0GeWS0YAU9y4
	b7JQ09JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJLp-0000000EU1D-0xdx
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 09:49:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJKs-0000000ETpO-3WQH
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 09:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2E4CA42026;
	Wed, 11 Dec 2024 09:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB47CC4CED2;
	Wed, 11 Dec 2024 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733910529;
	bh=V1//Crgpq21awYzH4xbCFgkeMElVTB4auODT606jKo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgJWTdR2nYLXFkwtMvd6dSfw4U4/WXsOAt1rLHLfBytowRfAJ+KQvynRU6278eHE3
	 Pxk7oqsmtjK57UQ/6o7Kac4zSnwY6577LgFuVcej+8Mh5HfYpXTLg4YDE0u8ditsCi
	 zgoKGDoogId5awpjkexlgfDIcmr0pRCDzGy/x9K+UzNaNtOavKsIIoWTs+hEJlLIAh
	 FZpnHm5zcdqmW1+7uw3JDgkTIF1qjrmu2WefELnPzv6x0RaBYBjrwLps8T/01XKhDo
	 NROEQ+EHI/WIa7fOZwjC9xNhchvo++vlyg8wF4UBiuwPJBcO6CtYMm2yVsPw9v9D2n
	 EZ3s7uW+CnqJQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLJKv-000000005kl-0ISY;
	Wed, 11 Dec 2024 10:48:53 +0100
Date: Wed, 11 Dec 2024 10:48:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Gregoire <gregoire.s93@live.fr>,
	Baochen Qiang <quic_bqiang@quicinc.com>, ath12k@lists.infradead.org
Subject: Re: WCN7850 disconnects and reconnects in a loop
Message-ID: <Z1lgBV6b1A6fLoK5@hovoldconsulting.com>
References: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
 <Z1hOweEsmXrIZByQ@hovoldconsulting.com>
 <87wmg6r7sm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmg6r7sm.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_014850_946365_F682C895 
X-CRM114-Status: GOOD (  18.25  )
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

On Wed, Dec 11, 2024 at 09:35:37AM +0200, Kalle Valo wrote:
> Johan Hovold <johan@kernel.org> writes:

> > I'm seeing iwd repeatedly failing to connect with reason
> > PREV_AUTH_NOT_VALID with WCN7850 on the Lenovo ThinkPad T14s (and the
> > Snapdragon X1E CRD reference design).
> >
> > I first noticed this with 6.10 when starting to work on the Qualcomm X
> > Elite platform, but never got around to investigating it. I've confirmed
> > that the issue is still there with 6.13-rc1 and that adding
> > ControlPortOverNL80211=false allows iwd to connect.
> >
> > Looking at Gregoire's logs now, it looks like the deauthentication
> > reason is different:
> >
> > 	(Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)
> >
> > instead of
> >
> > 	(Reason: 2=PREV_AUTH_NOT_VALID)
> >
> > but the same control port workaround allows iwd to connect.
> 
> Is there a bugzilla report about this? Unfortunately I have not been
> able to follow bugzilla lately due to MLO work but it would be still
> good to file this (if that's not done already).

Yes, sorry, I should have included the link (it was posted later in the
original thread):

	https://bugzilla.kernel.org/show_bug.cgi?id=218733

I only noticed that Gregoire's symptoms were slightly different when
replying to this thread. Let me know if you prefer that I file a
separate bugzilla report for the PREV_AUTH_NOT_VALID case.

The exact same setup (kernel, distro and router) works fine with ath11k
and WCN6855 (e.g. as found in the Lenovo ThinkPad X13s).

Johan

