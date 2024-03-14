Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADFCC54E60
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWxK1Vzs86qnKkeML5I8G6bTPpScPlroQ1LbCo3NbEQ=; b=d3zWbNf87cVt5Dk0blXQ99nC1g
	NYUSVN+FZM8PYPOIi0hkkgxfCSDy/W4yZMKZ2HysLW+Zph8r3e9cEgGaCzwMXfCPiTH5tQ0Ix4YSz
	8YLGEkCR4Q7HobiSI1BzMm0BoImaxS15TBimxHrmBfxt4SB8imgo4nKbGz7WVSd0JBVUncUXm5ISt
	3UgI0M7nvB/np96CbMJXpoL95JZnulffXt4WTGy9Kdj906Nh0N4u3Vdf/AGeW0KOWTYpirbuuTOha
	hC3ODE3ClZCtd3pjrh8DkeDQp/ztwziqPO6PzvHi5YDsT5lzDG959iE35Vne4AF9Dv254yWXNIqpb
	hhtMJGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rknea-0000000Ey0j-05Rl
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:10:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkneW-0000000Ey0C-416m
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=gWxK1Vzs86qnKkeML5I8G6bTPpScPlroQ1LbCo3NbEQ=;
	t=1710432594; x=1711642194; b=f/kfEov/+iYCcepQqgncdvhBHo/bkdxbFwmxUyjJ1YJnnO2
	nUuTUPMjYjqdNkbAUKYIGWgzK5eEvorVWsvZ8+rlllICnNmjRSb0BBT16tG5HIu+ovN9wxQIODSVG
	c7yg7h1WuKk/99Twwb2DFPggc/RbVwZ8SEDlS66kVty9hXKtpMvTFUGzHUEZYxdhliQjx+V/cRX4t
	cBy2I71yIqXEe5ngwoeAxg3WtTc7y5P0g/FFgyxDRZPSiasQYexbB3hdj1cfjPDfsQgT6K8Ed9HWR
	MJ+qMiB3o3pW96dFuxxCuLuheuqQz7kWpQp5wpE9VTj6wFVRI1Lg+/J78QBa2pfg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rkneO-0000000GfOL-3vhE;
	Thu, 14 Mar 2024 17:09:49 +0100
Message-ID: <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Miri Korenblit
	 <miriam.rachel.korenblit@intel.com>, ath12k@lists.infradead.org
Date: Thu, 14 Mar 2024 17:09:47 +0100
In-Reply-To: <87bk7g4x08.fsf@kernel.org>
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	 <20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	 <87bk7g4x08.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_090957_221026_E386550D 
X-CRM114-Status: UNSURE (   6.75  )
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

On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
>=20
> > -		hw->wiphy->flags |=3D WIPHY_FLAG_SUPPORTS_MLO;
> > +		hw->wiphy->flags |=3D WIPHY_FLAG_DISABLE_WEXT;
>=20
> I think we should add the same for ath12k, right?
>=20

It's really up to you, I think. I'm hoping to even get this into stable,
FWIW.

The biggest issue here was our firmware, but the stack is also missing
some things, e.g. we see CQM problems (warnings?) if you actually use
multi-link "in the real world".

johannes

