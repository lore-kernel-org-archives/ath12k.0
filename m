Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB75C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QToXfY/wTkumO5E3egIyolac3Qy+dRyvrj06LGqXpUA=; b=evh1k6rX3RenGOUv3CPHMGHhiN
	E56lwW4N/dRF0kH36z+eaImss4lqY3qI9ZHJ+kaMyJud3nq3+tkwCoeQSecD4zhbG9m0Jlf5G7/ou
	kN2ZC7y6rt0SxlUh1Ykntv89AIr4jU2W7W5um/7kajfAh+/56RT8p+3QGjP72rHbJLp6mbdFxAJVA
	mHYk8W/rn8MEDndaGhtBxwtjznNRRTUVOO7laoQBGXr377xOTRZd6mUjXnIkxTKhuXsdKx0CyYYW5
	ILgD57JYVjMCexkZ2qvEmXZWErOseaPUhKMM4u6l+MlvyQBZtvvTHOr9/PajdrnjJZfOzNNeW1xZN
	YL4utYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkVY-0000000CwUl-3fh3
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:49:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkVW-0000000CwUK-2IV2
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QToXfY/wTkumO5E3egIyolac3Qy+dRyvrj06LGqXpUA=;
	t=1711612146; x=1712821746; b=fv3/S1W65wzC5mgen7EvegFzrswo3xgGlRx9f1lKKEWRL1b
	WouzTfbHfsnOS4LZnumQwNeMVUOMGjE8R9V1EJOHqmX6MIJ4U9aftromNNHqK3QqCxkXsQbqIsVxR
	2ijjqxxexfFWbyyXdhG9OlkrDvAKexixlrwnS3xVSBNqgVvClym0oeN9dZ1p2QuvQ2FvJZ5un9Aih
	9wiIw7B3MSLYOp+Kbyr0DOQcGVHJYUzoIrLvGSx5m74WcQRiI39uyyGdR67CfNwnQ1urFdv/l7ENn
	5QiI9IHMpejWtKjsbx7zLQ8pfn9jzkHDwwUl9mqfUUMkeFgucpDEaVAbeczHB9rA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpkVU-00000000kt6-0pOp;
	Thu, 28 Mar 2024 08:49:04 +0100
Message-ID: <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 08:49:03 +0100
In-Reply-To: <20240328072916.1164195-3-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_004906_606404_766E28A3 
X-CRM114-Status: GOOD (  11.44  )
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

On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>=20
> +/**
> + * nl80211_multi_hw_attrs - multi-hw attributes
> + *
> + * @NL80211_MULTI_HW_ATTR_INVALID: invalid
> + * @NL80211_MULTI_HW_ATTR_IDX: (u8) multi-HW index to refer the underlyi=
ng HW
> + *	for which the supported channel list is advertised. Internally refer
> + *	the index of the wiphy's @hw_chans array.

Is there a good reason to expose this? Seems pretty internal to me, and
not sure what userspace would do with it?

> +	for (i =3D 0; i < wiphy->num_hw; i++) {
> +		hw_mac =3D nla_nest_start(msg, i + 1);

And you kind of even have it here already ...

> @@ -3001,6 +3042,12 @@ static int nl80211_send_wiphy(struct cfg80211_regi=
stered_device *rdev,
>  				rdev->wiphy.hw_timestamp_max_peers))
>  			goto nla_put_failure;
> =20
> +		state->split_start++;
> +		break;
> +	case 17:
> +		if (nl80211_put_multi_hw_support(&rdev->wiphy, msg))
> +			goto nla_put_failure;
>=20

This could be (or get) pretty big, are you sure it's not needed to push
the splitting down into it?

johannes

