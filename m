Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9CECD8C8E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeDU4ktLEM8lXtFt9kqcyMtBd1d+P7EPRUiZl8WNCvw=; b=VJecFhzPTE5UEt2cz2klskIMlv
	MMcKLwL3+JuoHP3Yp6oykSvJGlicsG5kFF2ENjabY4twP6GeKUzrPeImk5xHIFHCMOmbeENODYi7p
	wOQVBjwGp+M8xfRkCAlxZ8mQgz0W1C4Y5UmhTH0Ea33jFXRKIi01XXqAUoZ8XEQYKZFpXn4LAplXV
	P9z1WHVJPD8a0cGzbrqboEoF5yv7TQ2wDEJh93NrUCHfaIadAUPO2xvByqeu30DnYCqxR9w9Hbcg0
	CiPrdGKQbP+KygTpMHKr6YoWlJqpL1iuNjzy3tarCZzdi9pnNkf1NSJn+EAkUu45I4DUiOPaJUHnC
	6XXzksnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUFD-00000002y5W-3yn9;
	Mon, 08 Jun 2026 07:17:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUFB-00000002y4q-1O4f
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 07:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=UeDU4ktLEM8lXtFt9kqcyMtBd1d+P7EPRUiZl8WNCvw=;
	t=1780903077; x=1782112677; b=djij09nwwZnZ3UichOl4h08f2mpM2ET/pEDIYidqPnJrsm8
	mqHx053xGj6BsVD4Z6jWDhuqnub8TZPHxPYBdRBGMQjJkJrNBKaOBQzuY7DKxW/K/d2rSxIEzV/ec
	SkJ2Aar5sI4QlTbf/UuIVBQc5papuTrLlZnz7s/rKOgTHO+ZBB2I4xLaLH2xjTyoQnRuJVDChsqHp
	T5pxEY4Q+9HXDMwW2BWJ+JPNK58VUpEYuLfFnRTHVn2UyUJf5S3XC4CSSKFjAjAYMdcpw+kIxDHPk
	oUOp5LC++ZCc1dzwwYU2J01Sdn1mGOwO2bVaFfQ1To95CiHS7ZUv/JxeyoV9XrBA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wWUF8-00000005Yzc-0ju0;
	Mon, 08 Jun 2026 09:17:54 +0200
Message-ID: <ba13edbcfa590fe2bd764719b843e6ee8c675310.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 1/5] wifi: cfg80211: Drop unused link
 stats handling in nl80211_send_station()
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Mon, 08 Jun 2026 09:17:53 +0200
In-Reply-To: <20260607175912.2266215-2-praneesh.p@oss.qualcomm.com>
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
	 <20260607175912.2266215-2-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_001757_367171_8AF6ABCF 
X-CRM114-Status: UNSURE (   6.13  )
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

On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
>=20
> -static int nl80211_fill_link_station(struct sk_buff *msg,
> -				     struct cfg80211_registered_device *rdev,
> -				     struct link_station_info *link_sinfo)

It's a bit odd that you're dropping this only to reintroduce it in patch
4, but I guess it served at least to notice that:

> -	link_sinfoattr =3D nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);

all of the nla_nest_start() calls in it really shouldn't have been
_noflag in the new code at all.

johannes

