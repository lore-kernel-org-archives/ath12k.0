Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5730BC54E60
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCFd1I2Em7XvcmtL4wPtHwPzcp7oEL0x21kdZ4PMWpA=; b=fCKVbQZ9VJ3crQq1iLM9tieSO5
	djlv9Yttp0bHVbQGNZrvJ2Ud6dphaR67q5tQKymlqJDmA4+xyCTYyKMtM0HTezTS3JDgxWdTy51nx
	y1cA/FqHSeAnpVDsWM9BHXEncUWvNA/lM0q3XaULc2L9DoFu+CydEwn0kiiLAq1AfkyiKonlAsTDx
	zMeEfpaLm7ppugT4MVUVWIRNeNEE1CySu8T4MARwYw+Vh6Ur9o0HFxyIm5YLUGUUc3P5puTH5p7Q4
	LmlTgRkq4vrUBVRfbcsqqOuRpCTq66u2UCHDPz56gU1MIZMQPZyID/eWNZj5xsMLJ0StYqIoTRs0u
	9Wyaachg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko43-0000000F1W3-3wvF
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:36:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko41-0000000F1Ue-37z3
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dCFd1I2Em7XvcmtL4wPtHwPzcp7oEL0x21kdZ4PMWpA=;
	t=1710434177; x=1711643777; b=F9UX+QIh+rQMY7LDN7wgZ4wWDdT0hd7/sa3VtmQOzB2k7Wy
	Nt0OuGZqDFa5ZBTLLDtjDP8e5bVPrr6mJ7Nyl1T+hHOjjmmZQqi3u9LAccErpgn4TPvRHdwzo3wgZ
	3S5JR57nQneb2bZe8hoie6CTSiUJR9Tw6bt891GSltxLrmooREFyq/K71XR6e3xcD26KhLnjEtvbG
	4FpGb+TMm3HLqhpNtH3wWPCLZGVIj4D+YEQrHSF3tEOAWkxyTZTvWibSWcvr4WaXPwNiAE47sX5Hd
	CV/BQ/L7ge541n4sa2o/LEWDOWoKq+DntAv5ODb658sThl06mweYLnDvL/K0O2bw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rko3u-0000000GgKk-3Sjq;
	Thu, 14 Mar 2024 17:36:11 +0100
Message-ID: <09e961f89c9d86ff8e60e860376924961a18387b.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Miri Korenblit
	 <miriam.rachel.korenblit@intel.com>, ath12k@lists.infradead.org
Date: Thu, 14 Mar 2024 17:36:09 +0100
In-Reply-To: <3883eb2c-54dc-4492-bbc1-9fea02e7e46e@quicinc.com>
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	 <20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	 <87bk7g4x08.fsf@kernel.org>
	 <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
	 <3883eb2c-54dc-4492-bbc1-9fea02e7e46e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_093617_806253_0EFB6F27 
X-CRM114-Status: UNSURE (   6.51  )
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

>=20
> what does it mean "disable wext" if we are a mac80211 driver that doesn't
> utilize wext?
>=20

You don't have a choice about wireless extension support - cfg80211 will
support wext for any non-MLO drivers.

However now we're faced with the situation where we have devices today
that enable MLO, and thus don't have wext. But if we disable MLO, then
those devices would get wext, and then when we later enable MLO again,
they'd lose wext again ... all that seems very unreasonable, and more
likely to lead to complaints than "new device doesn't support wext",
hence the first patch and disabling it explicitly for a device that will
again get MLO later.

johannes

