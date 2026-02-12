Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66760EE36AE
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 17:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aWW69o5XEKE6uKONq0Boob7BmGNpR2tVxxb7IxJa40=; b=R8yaLS7MAD8vL7mQ6c4jOc4J5a
	yFdjzeXPrLMjNrolBvWdzXMttWvlZyZ4/tzcbd1PkvX18TlsLrKnetR9Z1MnDDL7ZH0kLK1QNN7FX
	LWFNsYRxYFj2v8mDnbV+SKENjepjakW3WuGeOyfxgavHRjjm6rdm2/JuBGV+RFxYAm27jXoUu0HdL
	HdbMRlao+I3ksPnVsxblNLZIJT0Hugi7dLFPHClH6aW83QRqo3NDpI3Ot6JxIZgzsBk0Pees47gGZ
	5FyIyhwfTk7ziNxtTCUBhqTKvKVKC19sJCj00GzUyM5x0PEEVUGiIEd8Z9H6T37C9vlKeHqwGuhxi
	V97EBEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaaE-00000002SNr-0WTB;
	Thu, 12 Feb 2026 17:34:30 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaaB-00000002SNT-1LRd
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 17:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4aWW69o5XEKE6uKONq0Boob7BmGNpR2tVxxb7IxJa40=;
	t=1770917667; x=1772127267; b=A6OdNWsXX0cvIdW8svuuyBqhAYX1B1UPJzQtsMaCVY6nqNS
	s762vT6zbnRJk4m3YfltLqx1WqmChnkUflRGfkpUGjBZ4kcq4K6SPVa4SfTUYn/mlndHzOP6EG8oT
	0fptC8x2x+mBDAIQJyq+Ozb/y6iciMzLwSv5VkI+JypUmtk3jRVYfjUjeedyNAQ4rf7TMbgjFe1+p
	qO0SeoM/QGCBlqU+JuAzJk4KIWMXLP7qrL6uFpXuxMVQiz2yhQgC02m8FwVWDj2g5ha3Y8U8cQkuL
	67VrHD/Nyn5HtzfRQdM4qIgRi3P/SPDOBLpyHIWXSTU86vQWJaZSD5UcG5OQc0YQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vqaa5-00000006Sud-2617;
	Thu, 12 Feb 2026 18:34:21 +0100
Message-ID: <7ac00be5cfa6a31b91d72db027030b89195f25a2.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Thu, 12 Feb 2026 18:34:20 +0100
In-Reply-To: <20260212172401.234059-2-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260212172401.234059-2-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_093427_385153_A4C07D67 
X-CRM114-Status: UNSURE (   9.47  )
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

Hi,

Nice, thanks for sending this.

> + * subclause 9.4.1.87. Refer Figure 9-207u.

> + * Please refer IEEE80211_UHR_DPS*

"refer to"? Or "See Figure ..."?

> +#define IEEE80211_UHR_DPS_PADDING_DELAY			0x0000003F
> +#define IEEE80211_UHR_DPS_RESERVED1			0x000000C0
> +#define IEEE80211_UHR_DPS_TRANSITION_DELAY		0x00003F00
> +#define IEEE80211_UHR_DPS_RESERVED2			0x0000C000
> +#define IEEE80211_UHR_DPS_ICF_REQUIRED			0x00010000
> +#define IEEE80211_UHR_DPS_PARAMETERIZED_FLAG		0x00020000
> +#define IEEE80211_UHR_DPS_LC_MODE_BW			0x001C0000
> +#define IEEE80211_UHR_DPS_LC_MODE_NSS			0x01E00000
> +#define IEEE80211_UHR_DPS_LC_MODE_MCS			0x1E000000
> +#define IEEE80211_UHR_DPS_MOBILE_AP_DPS_STATIC_HCM	0x20000000
> +#define IEEE80211_UHR_DPS_RESERVED3			0xC0000000

Not sure I'd defined the ..._RESERVED* ones at all? There's no way we'd
ever use them really unless they get defined to something else.

> + * subclause 9.4.1.87. Refer Figure 9-207u.
> + *
> + * Please refer IEEE80211_UHR_DPS*

Also here as well.

> +#define IEEE80211_UHR_DBE_OPER_BANDWIDTH			0x07
> +#define IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP_PRES	0x08
> +#define IEEE80211_UHR_DBE_OPER_RESERVED				0xF0

same comment about reserved

> +#define IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP		0xFFFF

And this ... I think should just not be there? When would we ever mask a
16 bit value with an all 16 bits mask?

> +#define IEEE80211_UHR_P_EDCA_RESERVED		0x7800
> +/**

reserved again, don't think it makes sense - and probably should have a
blank line before the /**

>  static inline const struct ieee80211_uhr_npca_info *
>  ieee80211_uhr_npca_info(const struct ieee80211_uhr_operation *oper)
>  {
> +	const u8 *pos;
> +
>  	if (!(oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)))
>  		return NULL;
> =20
> -	/* FIXME: DPS */
> +	pos =3D oper->variable;

I'd probably have directly put 'const u8 *pos =3D oper->variable;', but
doesn't really matter.

johannes

