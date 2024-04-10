Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CEDCD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+mS3LjXAeboYKWMVRHAKrLgD1CfxzElUCTBdIJEHcc=; b=IwA705D2STCdYDsAAD0KGiJSE3
	kMbqpjhr5MI2sPQCtYUtBvAZ8H4psgNPE9EHWPeVDEeYUsY8UvnYt2FaT5+KYrOYHVpFJoG2AMw59
	68V30dqbyYeK+X31h/6BFHVicxEscyqN6syxGSyRoqhhngkKFvi0oOFZJjmwvz+rTGCZGf0WlcPKJ
	dI4D8MQLhoiy03xNHwpi7S9k2cXD0oA2B+DzJxpwdOEQJzHHnDZg6Y8OtPbY1AP8RR+bhPusYBtEB
	Bw5oiTG5UUM+G0OrGHG0G3lCTdYNumREhuPWXhF7WB+5NGoA0U58XGkltxhf0WDU8Ip0rszwceoy3
	W5ds4khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTxR-000000062le-49yi
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 09:09:29 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTxP-000000062kx-41R2
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 09:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=z+mS3LjXAeboYKWMVRHAKrLgD1CfxzElUCTBdIJEHcc=;
	t=1712740166; x=1713949766; b=oHzgxTEojMpdI3U5IkFG2biHC7Du5PhsCP2G2XipmUVKcup
	zwMchroz6oomnMmVYGEmHBmTs1D8UQFW18nGN7Piti+HCJ7BJqu5DC/TJRTvmtAHifUQTCebwvbrh
	BfyikhcGdW9JdG2l2fbK38HXVQAVfeuQ+NKXdECr0et+g2W0BaDgg5VRanCCchkt9N1oC6U7hPm7y
	reoGdEOjjej1MDlIStxd950Y/J+9wrrMBDSXcERm2oCVPlYw5fx9Hu5Q2SJY2Xc/783Gxi6hvFWsD
	kvVst+pUrMAlFO5shTYhiCqv0m7t5K7lvmMp68Y6t3SBxjqBSIXT7SHOgBbaQ85g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ruTxL-00000001HKq-2CJA;
	Wed, 10 Apr 2024 11:09:23 +0200
Message-ID: <c2160c4616ef520d7037f9b7606b47d366f02dd6.camel@sipsolutions.net>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Wed, 10 Apr 2024 11:09:22 +0200
In-Reply-To: <d2e6360b-1092-4e57-47e6-c5f336f32c92@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
	 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
	 <d2e6360b-1092-4e57-47e6-c5f336f32c92@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_020928_094865_FD2D7F8E 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, 2024-04-10 at 14:38 +0530, Karthikeyan Periyasamy wrote:
>=20
> On 3/28/2024 1:16 PM, Johannes Berg wrote:
> > That's a big set, not sure I can review it all at once :)
> >=20
>=20
> I plan to separate the code refactoring changes from this patchset. Do=
=20
> you have any concerns?
>=20
If you split it up? I don't see why.

johannes

