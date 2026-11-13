Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4615606A333
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 10:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oCII+lwd;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LWFwYS3p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXOel52r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E2CuMJq93HBm3Qt4pvRzKdiLs4s9xzGSgrnBEL2nArk=; b=oCII+lwdXEwO14Dj9VjqD+vA1q
	iIN7FxySU/NhGngtuMLsqqdR9BkJL1DgfdGQVXTjFiqT3y2Z5y21cHOQod9rp9XnIOdkPupTye1ys
	pDUYT8k/cayAQfIatl87n1jS57J6IF9PY8swXuXrzkAej5JAqLjvd1zLyP3aDLpHKliiDJwqxnPgr
	96beLExD8akfRy5O4UqZC5LvfYvgyhjw43iuTRjOKn2HRJ+NwAt52RTg0YPrfXjoBPyI699L4jHiG
	tXdt2veKkefgkKmHDgW+nzZwqOAMyiHuHS8h+H/IcXQTtlHgPtey3CKhmylL5NcZxpUEGAIuL8UbP
	tTSk3pFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoUY-0000000CMTj-41qH;
	Fri, 13 Nov 2026 10:26:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoUV-0000000CMTL-2fzp
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 10:26:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UvSD3164523
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E2CuMJq93HBm3Qt4pvRzKdiL
	s4s9xzGSgrnBEL2nArk=; b=LWFwYS3p13fiStYYe8DAMHGdJPS5Hn3B5WxRMEpV
	I3XY0irpzqDF3wq+Hy1VNdvsyexB7osH2YfXHx+Ms4MrKOwVP8kIFSoDKHUxnsOB
	1RbnIzgZ+R5lt+WrI8jZFzjM6mEVU33LE1RF2E8Zg5iL5cdriOSE0yMsjC3lK4Br
	ux/M5thdtOMivP88PNX1YfUEs2BfKE2Oerml4Bk24+BKXUzhdRDdu2OxswJfx85E
	2BChRBZ+PARQabUBJyr880xGDWBmVgK27Cg/BZfpo9G44zt2vTYnUsdxQp2DMlHZ
	LTgIz/tDRpu6XyJPFFi2Spt3cRzllhYEdQHsKG6geXr8Jw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms9xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:26:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so184833985a.2
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 02:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565602; x=1795170402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2CuMJq93HBm3Qt4pvRzKdiLs4s9xzGSgrnBEL2nArk=;
        b=LXOel52rI5SwvOlApZoUDzdwA+lQH5QhW355UcKK1qjYWxFJ7oEHwwa+4ccs5rppC7
         Hbxi4gGmii9Q/9wogWcoqlIUWD2BSEoh0LU5wXu36J6JFj6gssRyrdvQ7x4wfkdfoTEh
         RcAI1584GEAdkLh0eDhK/3r2l98ExIOsEr5uL7KIMZwTb5W23k3dwyvi69CrLfkNIJJE
         CirNFund3kRBDu64vnGl6d8zQ/DlzbM6IuoqCvB0MGVTEt/Y82myXf4kskEhasW+cqC8
         hnfKUniwYWJNxzdbQpHjnxi4i6vOtjX5lkMLAvIy7Xuv2Cp6aO8wpn1bZTO780mo7j9V
         gHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565602; x=1795170402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2CuMJq93HBm3Qt4pvRzKdiLs4s9xzGSgrnBEL2nArk=;
        b=i5/I3hnEQZTX4TTtyiRWD07WF/k/RSZApOwX84znX7g8JvCjFCiUXa7TvRxOOR82ul
         46p8ok3BVjQbckqYpKh01v98Dw2nYDEv2uQaLG15ZYMDdRdZMT5XdS71xHsRFyfvIPSE
         y5rkFOoKvW6tw5gAxp8uDl0NYtBmxr7GhqrCxZTSr/7SofRAxo5uiNuYeOnhzkeRfDZH
         9i+Hj6lVfbPs126r2UyKPJiTvzYUU+EWGLzj0eqx5GzuJ8fMUD62luo8F7qzfIjlwgFz
         WFROJQrBv2EDW0U3zvJUGUNTFA2CujirSx68r3wo8JOlMFj779mYwBRx7kltxawWVuHm
         PCgQ==
X-Forwarded-Encrypted: i=1; AL+hErH7gHEYY0NG6oaZYegzeWacnmIk/DbPH9eCLSbf+sqKQPYUNtgz9LX8H1VbzNQW06pIyzaPREw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9+kWTSniefARAaTthLEswXwsJ4OslCt68smKy1uSxwLuinrMIy
	2L/TynD6IQynnpZirAWrnTTCQfM37a25OI6fB2gTak+km4S8HWl4BadLKqPRd0cg8vun622UwYh
	O1O3/mwyUMncOS2CqP7Atkxp6tbanz6aiNo4eVagXtjo3H+FvotZaUNwANNALsH9m
X-Gm-Gg: AYBFou2tSj3fKoVno5jBE7kUR+wFKYC2Ewns3RtK+LUbQl9IHdMy0ggzPtg6hmWLe6S
	G7Qnd53XLx20n861GSme0RGZy9hp6vMoUrt5/UnHtU311wbq2lTJUSIohav74FIBH3EmMMLSKhF
	guMm+dDs4Ik3MW6Dj53w6j1jfuIadh5Vm6eikn162Cnxk4aPMwGvGONxPIwlFYFBPbVNfZV36gQ
	mYitR2e8QUD14S9e3JBxsm9A8G3LoCPbDfZnmDLKXQsmylYum8+e6WNJst5y/Qw+3ynlNg24blK
	H2HvyJME34oX0WgNhtopZEPIIOdMRiwbWc2RgjAONDB9Pdg7FxhSX0W9BnqzPcJzwj9IPDVEAqg
	er+4sOKaG+hsr3ZmeCiMvHb0uZPcJ8UIOUfAHRM3w6GVvhXHtemPoaU8ZUeUvYg==
X-Received: by 2002:a05:620a:6849:b0:945:e4ed:d87 with SMTP id af79cd13be357-9494ba7d39emr352976785a.16.1794565601541;
        Fri, 13 Nov 2026 02:26:41 -0800 (PST)
X-Received: by 2002:a05:620a:6849:b0:945:e4ed:d87 with SMTP id af79cd13be357-9494ba7d39emr352972785a.16.1794565600940;
        Fri, 13 Nov 2026 02:26:40 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm16382245e9.2.2026.11.13.02.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:26:39 -0800 (PST)
Date: Fri, 13 Nov 2026 11:26:38 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: validate RX frame length
 before undecapsulation
Message-ID: <avbl3iulRGwsfLhR@lore-desk>
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
 <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
 <4ae460ec-fe87-44e4-a6d2-e1d7f6391fba@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gj02mhaqJiBZs5r0"
Content-Disposition: inline
In-Reply-To: <4ae460ec-fe87-44e4-a6d2-e1d7f6391fba@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k3vkBxoswMjs-bAdwap_tXPsD5rRwwuq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXzySmUELqm0Rx
 wJRzGDGIPSli9JAoH0p944uBrKSPDh/hbvmhxIzCv9C3sNCm2JwJxrNnCevFmY0J37QK66D5L40
 NzcW8aUqPo9Io8JdLhil3nujt8WLjb+wIWN5AWF4b3cqxAAZbdHZJbyh9/Z7erd8OEoNkK/uZLD
 /ntvrMnH9nsRQM7kefkgid59sUNYy2O00WutK0vdAfsWSKhwtzXuh/LjfaSmj1tmX8/fKt37Viz
 0pJE3e/Th4PJR0gRdKmjoT32d2WbVwC9dav4w77zA7R859PLOeG8E/94fiUz/u/oK1eFQSQvGEK
 rULShmsuwotpvuFjjlDU64DWspwVlnatiOEb9dljFfgotvNOZHWbDY7BUeeAhGEVzs9tQ0reAPv
 UO0AXioK/HX4IjsuwwUzMfbm+iW7B9Kw9shcHuWqy772auCzQzIrqQSnKHJtfR/CaIoqfZyeOt0
 tom5C40ojCroHCMJmnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX5d9UX/yuPP+D
 hYhYifSBB4g8DTsP981UJmALEyWryD+BzGZcd7xUVjAb6ttqq6bYGca40mkLxptj4BlF0XouSpQ
 iduqNmkorNs0DnpW3VGL9U3yHMuv0CQ=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6e5e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=pf-AwWE2P4KV4mUivRQA:9 a=CjuIK1q_8ugA:10 a=jXzn2BpXbAUnuv-v0lEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: k3vkBxoswMjs-bAdwap_tXPsD5rRwwuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022645_166129_895AC357 
X-CRM114-Status: GOOD (  25.32  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--Gj02mhaqJiBZs5r0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> On 10/16/2026 11:16 PM, Lorenzo Bianconi wrote:
> > Reject truncated raw frames before removing the FCS trailer. Without th=
is
> > check, subtracting FCS_LEN from a shorter skb underflows and leaves the
>=20
> skb_trim() has the check itself, so there will be no underflow?

I agree the commit message is misleading, I think we just need to return an
error in case the skb does not contain the FCS.

>=20
> > FCS untrimmed.
> >=20
> > Also verify that the frame contains enough data for the 802.11 header a=
nd
> > the crypto header before moving the header to make room for the crypto
> > parameters.
> >=20
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ_UPSTREAM-3
> >=20
> > Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices=
")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/dp_rx.c       | 46 ++++++++++++++++++-=
--------
> >  drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 +++---
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 +++++++++----
> >  3 files changed, 51 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wire=
less/ath/ath12k/dp_rx.c
> > index 36be543b7c50..40b8da34268f 100644
> > --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> > +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> > @@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct a=
th12k_pdev_dp *dp_pdev,
> >  	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
> >  }
> > =20
> > -static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> > -				       struct sk_buff *msdu,
> > -				       enum hal_encrypt_type enctype,
> > -				       struct ieee80211_rx_status *status,
> > -				       bool decrypted)
> > +static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> > +				      struct sk_buff *msdu,
> > +				      enum hal_encrypt_type enctype,
> > +				      struct ieee80211_rx_status *status,
> > +				      bool decrypted)
> >  {
> >  	struct ath12k_dp *dp =3D dp_pdev->dp;
> >  	struct ath12k_skb_rxcb *rxcb =3D ATH12K_SKB_RXCB(msdu);
> > @@ -1014,13 +1014,16 @@ static void ath12k_dp_rx_h_undecap_raw(struct a=
th12k_pdev_dp *dp_pdev,
> >  	if (!rxcb->is_first_msdu ||
> >  	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
> >  		WARN_ON_ONCE(1);
> > -		return;
> > +		return 0;
> >  	}
> > =20
> > +	if (msdu->len < FCS_LEN)
> > +		return -EINVAL;
> > +
>=20
> every later trim in this function has the same problem: msdu->len minus t=
he MIC, ICV or
> MMIC length is not checked either. should we add check for them as well?

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> >  	skb_trim(msdu, msdu->len - FCS_LEN);
> > =20
> >  	if (!decrypted)
> > -		return;
> > +		return 0;
> > =20
> >  	hdr =3D (void *)msdu->data;
> > =20
>=20
> [...]
>=20

--Gj02mhaqJiBZs5r0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavbl3gAKCRA6cBh0uS2t
rDRMAQCyvkyDRb9Pk8zul/SQoBmtkI7egkUVJrFFvxlluV2mKAD+JKV9lmFVSDlH
+MYqPyUfXSulc8jh4lXtUZ4+1k/rsgI=
=XBf3
-----END PGP SIGNATURE-----

--Gj02mhaqJiBZs5r0--

