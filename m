Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF39C6FD1F
	for <ath12k@archiver.kernel.org>; Tue, 26 Mar 2024 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbtUGTxTvdJ+nSK0YCv7H45g7hymlRPfVV935Zo+Jys=; b=loIZdcybUjZ3hKo/orZJyphwZL
	r6Onv0E17wOpxdjgeA0Hue5OVz29hA2A8b1XeBnDdWu5nU01xG9n9RuEX3W4DIcg8Pf+TQtCI8Nb/
	k82DgYqJdfwf2hw1aA4PBBZT9ZE+H25o/9uCxzgD3Tnvu+Hn5//0gs0eoJrAFwmYJ+DHcRHV9Nag+
	ExaZJ5irTPIIJU1vWz2/aSGj5BWYEfdfhwGVNARWTEZNHVR7AfsfLQsHVHN9Okcv2bZCJriev3U1x
	2IE5ZopB/W3S64th4E/p/mpFVFKc/M02E4eoUU5qqvpqN8PEF0Mt8RhUERLl35ZU11ZGEycIjazGW
	JQQMtqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp6Pe-00000004Z7g-0vDi
	for ath12k@archiver.kernel.org;
	Tue, 26 Mar 2024 13:00:22 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp6PY-00000004Z6v-2ZPy
	for ath12k@lists.infradead.org;
	Tue, 26 Mar 2024 13:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=XbtUGTxTvdJ+nSK0YCv7H45g7hymlRPfVV935Zo+Jys=;
	t=1711458013; x=1712667613; b=n6+LIudRPm7nKwEoKXG5HReIh01fzjW9aCjiHcItEYaYUF3
	nNGN09PN8NTl4i9B4h+SmbHlHWneFWybMW00QW1O/OnVdOmXXez+N8pkTHaZ98ZbqMNNlKFzZmrgV
	Ja2ncW1ZioKpX+8FMoKLGa8vmdZ5PfTdy+WiKBqo3oZSE3QDHISEJ3mekyNFz/7IZsAqsF88MsnX6
	jjFn13pZHOB1RFaoFkgy0J+Ou0oWr9gXbIi2PTgBJyxtt4lEVGNfl6z8Xb3TspXtMHqwmB+DSJRsy
	WFHivcKVseK/rLRHepC4Z7SAK5J07dOC7qJ5KRjl9ynB3Cag7TpWzr0bFbmpE3hw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rp6PR-0000000Fj8w-2tR7;
	Tue, 26 Mar 2024 14:00:09 +0100
Message-ID: <8efc258b698acd504c1fc699d026b906bf383894.camel@sipsolutions.net>
Subject: Re: [PATCH 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 26 Mar 2024 14:00:08 +0100
In-Reply-To: <20240325201031.10837-2-quic_pradeepc@quicinc.com>
References: <20240325201031.10837-1-quic_pradeepc@quicinc.com>
	 <20240325201031.10837-2-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_060016_678157_0E8F3D36 
X-CRM114-Status: UNSURE (   6.29  )
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

On Mon, 2024-03-25 at 13:10 -0700, Pradeep Kumar Chitrapu wrote:
> Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
> to pass EHT MU-MIMO configurations from user space to driver in
> AP mode.

This ^^ doesn't match this:

> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP=
) or transmission
> + *	(non-AP STA) of an EHT TB PPDU on an RU that spans the entire PPDU
> + *	bandwidth
>=20

which doesn't match the implementation ... Wouldn't be a bad idea to
actually do what it documents though, I guess?

johannes

