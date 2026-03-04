Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CEEB7EC9
	for <ath12k@archiver.kernel.org>; Wed,  4 Mar 2026 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuD5dsiX9j+Dpr5R5z8n24aMxt10pxKsVhlen7pPwfc=; b=j2mE3oez0hs6Jh5E2A4sgRmIfn
	0Qh1D4dnfZ30ftHWg5Mc04PwXDWAAUpEeoIShikoBJAAndPDDioBgR81DG34aExIOFBsNATl8oijn
	o1ZfRjIAOoi9D2HD234M64w47MTy+VPcrIrXX4GbC9/KxSQeNBOJzKsgGwU/e72iCzv1jZt/VVYOi
	IONtL2yGt+5UtJzjdpetUqw+PHRT/eb0h1HOlTaVaNoXg+DJRbzApnIPrfFn56Av/sGjY3lAzLU/G
	vac01XairKeWdrbtGK0+9a4QwaCQYH2GKC2EnHjNnDWGw700xz9DqxG6S5o8F1HZSIEAz00QoxZMi
	wPmi6qXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjnT-0000000H0vS-3HGd;
	Wed, 04 Mar 2026 10:49:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjnR-0000000H0ud-2veG
	for ath12k@lists.infradead.org;
	Wed, 04 Mar 2026 10:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=LuD5dsiX9j+Dpr5R5z8n24aMxt10pxKsVhlen7pPwfc=;
	t=1772621381; x=1773830981; b=l3a84u44QZ5e9CCWGCyjYqCRSx0X9AbCvpvMXMQv0+cV0Ue
	ZJUxgSMwTK2zPn5cIKGzctui0vMxKaM6JEY9SQpHg9X1NfrRiNkcPqx9aZ6NW+/+8O5z+dS9RW4Dw
	PQ/Ql3FhH52TdV/XyX211x2ScZ3L/nUvMFYc/rSEl+s8UvCe3D2DM2CX8WJP0a+dVBWkDO+pC8X2X
	3YQ6LbKV9pBJ++e0SjfJmLXQh1Gdh5IeO0P+5DTQuMvjw1m1KRZ3XsmUOnAf0LkUUKAdyzZxAqLWF
	zs1rRAqd0x8evGzuBe0+sT0rKjwZJ7W+jAEYzUCYrpLYW8zVXV0OYEX8OH7TdZBg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vxjnN-000000081oe-31VZ;
	Wed, 04 Mar 2026 11:49:37 +0100
Message-ID: <f256b3e7fa9227caf0bbd6696b81aa79b145945c.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v5 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Wed, 04 Mar 2026 11:49:36 +0100
In-Reply-To: <20260304085343.1093993-3-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260304085343.1093993-1-karthikeyan.kathirvel@oss.qualcomm.com>
	 <20260304085343.1093993-3-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_024941_732063_3F11418A 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, 2026-03-04 at 14:23 +0530, Karthikeyan Kathirvel wrote:
>=20
> +++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
> @@ -4478,6 +4478,43 @@ static const struct ieee80211_sband_iftype_data sb=
and_capa_2ghz[] =3D {
>  			},
>  			/* PPE threshold information is not supported */
>  		},
> +		.uhr_cap =3D {

Missing from the context, but this is non-AP side.

> +			.has_uhr =3D true,
> +			.mac =3D {
> +				.mac_cap[0] =3D
> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
> +					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |

"Reserved for a non-AP STA."

Maybe we're just better off doing this as we implement features?

I've applied patch 1 with some minor edits.

johannes

