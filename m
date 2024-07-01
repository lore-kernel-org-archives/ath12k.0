Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5EDC30653
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJILTiXHMWzTg3uHaRJKYQCdP/JUg7GP7I9ysmxqugI=; b=1Cfz6SBw4Tge/aXVF4YtjzSdnd
	99IV6YaC3a9NCX1ljIrM6zXlRYAugvitALiAxTcKcNjG+lIiwi3+G3aCLfYz6HdnMpQVAdl+JzIZx
	SsHiB3s10g+v7qhXbstoD69plfYB7FJIHYPh2OSDXK1tY+rDspMOi7h+A3EC1/FBzOr4kFoyedNC0
	VVAkgItM9i1g1a0DErGlsVIFajMWtp5+xyurlAN91FGZrWqpwmaVALaEdIH2rDB76yHIPa3+tkr13
	xIpBLpqwPEv9+ThGmJ3kcTE7jdqctne6lpRK5GOViijke7yu0P4Ot9BzGTiL69HuljWfj3ItgwBsU
	czv85XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGFu-00000003FcF-1z6Z
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 12:35:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFm1-000000031j8-34bB
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 12:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=UJILTiXHMWzTg3uHaRJKYQCdP/JUg7GP7I9ysmxqugI=;
	t=1719835485; x=1721045085; b=sQi6BZYmKHUH8apsFkBg3HRmwhdPCkfcq7Z54CFJ6sRzqDc
	8yIAs3vSaND7kljZ5gFnATV96b7zPlfqLuY+gpRgFwf4JrHXsEx6Y6aucQb9vNp0DcOzbH1iu0bdE
	+la38Y02dyVX3Q1VtMhe3e3jrObYpFi0NqEd6bl97Iw7tV6LAsMjnLhTqNyTDgbdRu3UF/kQS7IHK
	UeaPfU+vKinhvMxoXSpBVarXqk169cLhqk4hKZPbnA/6cRVSRt+tc/yHHGcpDc0hO55ELG2wXob4L
	aA5l00snVMhWJ3Svs3ZrekPo1+uaBo31RsSa7xmVbCjIQEr+URkOQP40lAkJ169g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sOFlz-000000025y8-0AgX;
	Mon, 01 Jul 2024 14:04:43 +0200
Message-ID: <73665af6175acf9f264c076824b65d2b24476cde.camel@sipsolutions.net>
Subject: Re: [PATCH v2 02/10] wifi: cfg80211: add support for advertising
 multiple radios belonging to a wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Mon, 01 Jul 2024 14:04:42 +0200
In-Reply-To: <52f91e3121547ec50a9ea1fa1b7f395a96da52df.1719733819.git-series.nbd@nbd.name>
References: <cover.692a4cf1c6bce46eadecbcbf0f3e9e599099f8c4.1719733819.git-series.nbd@nbd.name>
	 <52f91e3121547ec50a9ea1fa1b7f395a96da52df.1719733819.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050445_793429_6E776BFC 
X-CRM114-Status: UNSURE (   7.99  )
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

Oops, forgot one thing already:


> +static int nl80211_put_radio(struct wiphy *wiphy, struct sk_buff *msg, i=
nt idx)
> +{

...

> +		const struct wiphy_radio_freq_range *range =3D &r->freq_range[i];
> +		int ret;
> +
> +		freq =3D nla_nest_start(msg, NL80211_WIPHY_RADIO_ATTR_FREQ_RANGE);

need to check freq

> +		ret =3D nla_put_u32(msg, NL80211_WIPHY_RADIO_FREQ_ATTR_START,
> +				  range->start_freq) ||
> +		      nla_put_u32(msg, NL80211_WIPHY_RADIO_FREQ_ATTR_END,
> +				  range->end_freq);
> +		nla_nest_end(msg, freq);
> +
> +		if (ret)
> +			goto nla_put_failure;

and this 'ret' business is pointless? You can just 'goto
nla_put_failure' even in the middle of the nested, it will be unwound
properly on a higher level.

johannes


