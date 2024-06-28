Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF812C3064D
	for <ath12k@archiver.kernel.org>; Fri, 28 Jun 2024 08:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZyxT8ItNiF9TeT/7R/54tZccSvg3dFdAq5unyzBKrk=; b=js/VU4D/E7cVUk2soMHy8HMVTe
	iDEyXdD39gDb9rGMs6vDbv6+/M8gPWGCF0R/L6Rao5fmidjFrAvZbN1Z/VJ4rTRnEdDLjbxnXidON
	i6FIHUET1loQjXB3iwqltHEOaZVMZEKs6noUOgU+pY9cgKZem/uDzonspF6A6R5Tw55t5cifiXFeU
	GgsWjanogrexMp2Nf3Zut2yH/Rdhkyir1+ezNa466VMIEWJeFx8RdGZ1cuPuc1Hp+gZw7Drg1e30M
	GG2Xxe/hYpfQfyMgXHGQ2+m9G5mwQkRzqiqMiJsk/ElVS04aWO0JxC2FVYtwWP0ALlK9EHm9hAoTG
	+b6RryEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6YH-0000000CzOt-0vD0
	for ath12k@archiver.kernel.org;
	Fri, 28 Jun 2024 08:01:49 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6YE-0000000CzOC-1OTr
	for ath12k@lists.infradead.org;
	Fri, 28 Jun 2024 08:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=uZyxT8ItNiF9TeT/7R/54tZccSvg3dFdAq5unyzBKrk=;
	t=1719561704; x=1720771304; b=HHllmuPD4/++GjLxNtlHJiCQsiJ/VWNSE3PBspKwOicCIHM
	FCi5KkH1GkMOeRedvwZvH6EnQ+BYvXNA5TjHajcFUwv1gWK0YQYGqFvgKbZS1ZIbjjJ+ZXYpT7dhx
	LCkUOD46S/Tpx4KwfbbMUqkyV7xugk6xOTA1DO0mrxQxxlVaCZnZKz1mQn97+bD1tsuWxD7ASjWso
	WA0vO4SFF4UxXOurpbQpp6JcbW15h7i0SzpkIpHYhqP+nH7l1/ZV++QWx6vwa8ZAi4SH4ZlRP4vlp
	zz8E2ctKAs5n0f4alhF15yUV9IgOfVamNeKrUwq9P8DNETWXokdyiy2nWKzy4h7g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sN6Y8-00000009TIJ-2QJ8;
	Fri, 28 Jun 2024 10:01:40 +0200
Message-ID: <59d364472721ab469da0a794baa8c33d78716434.camel@sipsolutions.net>
Subject: Re: [PATCH 01/10] wifi: nl80211: split helper function from
 nl80211_put_iface_combinations
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org
Date: Fri, 28 Jun 2024 10:01:39 +0200
In-Reply-To: <2160a27fc614e2a9a3cba9902e14d305db15530e.1718881762.git-series.nbd@nbd.name>
References: <cover.a7730420cfba0f204a60e4c30e6b0e07b441ff6b.1718881762.git-series.nbd@nbd.name>
	 <2160a27fc614e2a9a3cba9902e14d305db15530e.1718881762.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_010146_593441_9F54AEDD 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, 2024-06-20 at 13:11 +0200, Felix Fietkau wrote:
>=20
> +static int nl80211_put_ifcomb_data(struct sk_buff *msg, bool large, int =
idx,
> +				   const struct ieee80211_iface_combination *c)
>  {
> -	struct nlattr *nl_combis;
> -	int i, j;
> +	struct nlattr *nl_combi, *nl_limits;
> +	int i;
> =20
> -	nl_combis =3D nla_nest_start_noflag(msg,
> -					  NL80211_ATTR_INTERFACE_COMBINATIONS);
> -	if (!nl_combis)
> +	nl_combi =3D nla_nest_start_noflag(msg, idx);
> +	if (!nl_combi)
>  		goto nla_put_failure;

Not sure why the diff looks so much different here between my git and
yours, but anyway ...

Even if it's ugly here, I do think you should add an argument to the
function

	..., u16 nested

pass 0 for the existing user, and NLA_F_NESTED for the later new users,
and use

	nla_nest_start_noflag(msg, idx | nested);

etc. for all the nla_nest_start_noflag() calls in this function. I
really don't want to propagate the _noflag() API further.

(The above was the simplest I could come up with, maybe you can find a
better solution, but callikng nla_nest_start() conditionally seemed
worse)

johannes

