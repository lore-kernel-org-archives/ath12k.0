Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600C1C28B2E
	for <ath12k@archiver.kernel.org>; Wed, 12 Mar 2025 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+PilNQZoDFiaeryP0xd6L+XbRHr4cTqiRxLDV+1U+E=; b=XQZtmV1Yu/YwJDgi4TaXD/xiza
	yC7uVbljJWBEJ4Mc+Oy77KNySSNp/Cw3d8OakRbimu/pITzptL/wyACaUe8zvctMEwkrLvgt8HO6h
	0yKaOLNfex47+aIjaS4jllVjQlzv1H1vfHVJqmSIAkISKbq2sizjXdouznVbT8GFxFIMu5My7Te+k
	HxdoKWB6Z9Xnpzz7ujXIkYNEiZhpoxiVYuz5fDDH5ebQ1d4whXGs6+U3ACeTgG4n9MsdAvMRFlf+X
	4RweuRvrLWWvbqdKkcdWQ3q5crMNEAHs8ScS5lfla7SapUZ4rr8AD9OKNpD5r4AIJfbWzYs/AgojZ
	za4bgwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHtC-00000007shI-0Zwi
	for ath12k@archiver.kernel.org;
	Wed, 12 Mar 2025 08:56:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHsU-00000007sbL-22L3;
	Wed, 12 Mar 2025 08:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=T+PilNQZoDFiaeryP0xd6L+XbRHr4cTqiRxLDV+1U+E=;
	t=1741769750; x=1742979350; b=g47B97lGR/Y05JxrSzRxXGqIUgoAJNiyKj8eVboAjziIOaZ
	AWe6VIZt9YuJgk5W5S18xHgJlUYGoGA4jSlouvHvtzHA/RaXLOwcxtoA6tKt5NDerzoRzjPBtyzme
	Vz6aVi/LUClsBNVRTyiox6pTMLgVLgj3YmrUJDSp1erSwH3c01Wr16lkpTsusWI9mHcfsUMBcbBdR
	r3nUus2qgP1dQ3Hd8fLYsOSSKRWTttIU3wbqApobKtjbLfttak2xN2AMuHhZxqk66mMo1UX6amzds
	s78N3iyOUpTY++E5YVklrUXoBiFv4uH/+b8yxgMKNKq4czhQZalhDHEqCzcN92Ew==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tsHsQ-00000008oaV-0mYh;
	Wed, 12 Mar 2025 09:55:46 +0100
Message-ID: <52beaa2c05c91590797cc1f53b779fca085c8850.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/3] wifi: nl80211: add link id of transmitted
 profile for MLO MBSSID
From: Johannes Berg <johannes@sipsolutions.net>
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, Muna
 Sinada	 <muna.sinada@oss.qualcomm.com>
Date: Wed, 12 Mar 2025 09:55:44 +0100
In-Reply-To: <20250310200237.652950-2-aloka.dixit@oss.qualcomm.com>
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
	 <20250310200237.652950-2-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_015550_519629_55F40694 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Aloka, all,

> + * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted pr=
ofile.
> + *	This parameter is mandatory if the transmitted profile is part of an =
MLD
> + *	and the interface getting configured is a non-transmitted profile. Fo=
r all
> + *	other cases it will be ignored.

So I guess it's a question of what "the interface getting configured"
means, but I guess you could set up the transmitting interface?

> @@ -5561,6 +5563,18 @@ static int nl80211_parse_mbssid_config(struct wiph=
y *wiphy,
>  			}
> =20
>  			config->tx_wdev =3D tx_netdev->ieee80211_ptr;
> +
> +			if (config->tx_wdev->valid_links) {
> +				if (!tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
> +					return -ENOLINK;
> +
> +				config->tx_link_id =3D
> +					nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
> +
> +				if (!(config->tx_wdev->valid_links &
> +				      BIT(config->tx_link_id)))
> +					return -ENOLINK;
> +			}
>  		} else {
>  			config->tx_wdev =3D dev->ieee80211_ptr;
>  		}

So shouldn't that be one layer out, so the link ID can also apply if no
interface index was given, i.e. we took the else branch? Seems like that
should be applicable, or is there a specific reason not to apply in that
case?

johannes

