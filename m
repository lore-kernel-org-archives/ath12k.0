Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC8C282EC
	for <ath12k@archiver.kernel.org>; Tue, 11 Mar 2025 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ak/6gHLFtxLiBPZaYRNIFIndlh/sye4y350MTKklSIA=; b=xOE2gb1ht4JpiG0xq9Icf9V+/s
	Y7OQfSrzuqjUIUowBytJbjr1usQUIkT5QAu+VkTdcZhycBnGEDdCVTWYMZvZIyEJ/mJk2X0L0fR7Z
	lzVOvxsz2kAl/Zyg0n31Lk/t8kUQuBCAWKvZTA8X4tqhPFf0vaaT8bGMTw0PWLY70HgLkXBCEj41T
	y8ksRckTvKFFdCu+tL3LLOsN70E9FX6f9mjuci7wOkRF5bstLiHhQPrbRcwvpHnLVOBdVGjkG6X3J
	vRY8LCqGLCzl+W9CXTr/G9WW60cwYkZWhZTRLQJN5Q9Q6DhR8K0fwyAftzdzgc96b+mhIkVcKKMWc
	g9KzaESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwqR-00000005KsJ-21qF
	for ath12k@archiver.kernel.org;
	Tue, 11 Mar 2025 10:28:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwis-00000005JUq-14MK
	for ath12k@lists.infradead.org;
	Tue, 11 Mar 2025 10:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Date:MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ak/6gHLFtxLiBPZaYRNIFIndlh/sye4y350MTKklSIA=;
	t=1741688428; x=1742898028; b=BS/cpvI9dcPujEpzBBHA9IMtvOEJP/2l10e1qi14iUumhud
	TVrj4Zg6yJZ2qxbpWYLw0h/LP6Vgas29lhAghOPky5rB2ZOuLfu491yrW7RC8KwthUG/1wXLe8Xe2
	wPn/hyC1/XOTHNXpjWvFVWkTqik8y3kVkM0Qb18VDwA6uKsk19T0GU67dve2dIgOPnc9sGpTL3Hh0
	nO61PN+Wq59X3hdfdi9c2zlXvKhQgdqboAvc0p62q1gk7/wTz0iDkmd8H/rsxpL2sZJPurp+3KCbf
	qKK50GQIly4TVuPktdoO5bn+S8w737Ss2LdjPAv52qmgQU19P1yho66MxyiYzUOQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1trwil-00000007nF5-3kmC;
	Tue, 11 Mar 2025 11:20:24 +0100
Message-ID: <7cdc6950ba188625d691e8fd4726ef6872f6afa1.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 1/4] wifi: cfg80211: Add support to
 get EMLSR capabilities of non-AP MLD
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, Ramasamy
 Kaliappan <quic_rkaliapp@quicinc.com>
In-Reply-To: <20250306062157.1185769-2-quic_ramess@quicinc.com>
References: <20250306062157.1185769-1-quic_ramess@quicinc.com>
	 <20250306062157.1185769-2-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 10:48:04 +0100
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_032030_291885_5B8A1520 
X-CRM114-Status: UNSURE (   4.53  )
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

> =20
> @@ -7095,7 +7096,8 @@ int cfg80211_check_station_change(struct wiphy *wip=
hy,
>  		if (params->ext_capab || params->link_sta_params.ht_capa ||
>  		    params->link_sta_params.vht_capa ||
>  		    params->link_sta_params.he_capa ||
> -		    params->link_sta_params.eht_capa)
> +		    params->link_sta_params.eht_capa ||
> +		    params->eml_cap_present)
>  			return -EINVAL;
>  		if (params->sta_flags_mask & BIT(NL80211_STA_FLAG_SPP_AMSDU))
>  			return -EINVAL;
>=20

EMLSR doesn't make sense for TDLS stations either, does it?

johannes

