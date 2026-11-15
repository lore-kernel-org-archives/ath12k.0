Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECE606A31D
	for <ath12k@archiver.kernel.org>; Sun, 15 Nov 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uobbmjbk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UZdzHikZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjwHkuj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i7dFkPmCniuuS67TMBeU=; b=UobbmjbkEPI85ut4gpyCQCPH3b
	fES8jrV+4TThDbBFwYgU3/H0SpIjISXBvdp9Cu9WZoYulWAJAtpm5A7v4/xNdupQ77PKbKoQEgcuZ
	+FjypXKHRRci3V9ZEYzeOua2IKaylic/U9urkuILMC0VZnoITzxwVa8qXdouqedwrc6ZJ3u+MybVs
	zY2nMFQEhwHDRIuMYtPlKTJdwtxNVBTUTe41XQSBh1kHQ/179VfcdwffZ7juS01dSLPyajQuU7lWV
	rdJkAc0AdUjSkOH13zPCkxP4hhSJ6yzyNmwIPwmKkAo8YfdQd16QT1jtmIEK0QGoi5ZJTSO3i4+Id
	2uR6rJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW49-0000000HHFr-0lGi;
	Sun, 15 Nov 2026 08:58:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW45-0000000HHFW-1njV
	for ath12k@lists.infradead.org;
	Sun, 15 Nov 2026 08:58:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wruS2140937
	for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 08:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i
	7dFkPmCniuuS67TMBeU=; b=UZdzHikZ3+6+aMpSVftEgb6vf3BLx1ON+p3jnnSf
	chOgOWAtafwkVqiTqXvocXlG2xS3Y16pnKTISaO04mwgqQuMNLqK2vb5x+sFMJGj
	2q7fqj3OU5OmtIbp4Vui+0CCu3b3BISgVzTwIJQEOLlQ4qSeMzqIY9L00DCDaQMj
	YQCe+vLuaZfVX3O/6L+1FCZXpDuzf97DtynGm6QxiYeWDN250Qn6AiJZcMUsK6Rk
	jQQvUrzgggtRUzsSVh/+rPOgs7YkT4NtOQJwtcQjo5p3/rsjjOihKlwvaWNGwQbG
	zTcIfNIFbHUp4ASuISdxrQRM+DvNJEE47x78eTpPgqwtcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjtr57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 08:58:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so40548285a.1
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 00:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794733099; x=1795337899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i7dFkPmCniuuS67TMBeU=;
        b=CjwHkuj3lKCQN30mNG0IMdI4kzb9jaWwB+ByUwOiVphNtjqDiFg1OiAzcf40bQBSK5
         fzlaTVVufmYYlaS+unpEUfDRpx6uRd0cfzqO4GGyFc98/xz/GC+3YCg+bpvNUzr1g16r
         A0R/J8IEhoduz81+SzuYyv0Mcei17QMG/8dkst+7InrSejoFzTHLSne4Jekg3OzOF8Tg
         DagwZxpnBnkc0+PPy2Kl7NJhJ8K8cwzJC1t8yJv7h8Di/roJqKLdsd1ohrfbF8ovD2Il
         dg3xK+IQPpVse78HyAgAHpnQw4yPuplNWBCJJGlbhNXUv4YB2fFIDzIXN2XEcamCkjFo
         vfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733099; x=1795337899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LvtZuJ5CN6Lr7Eo+zvU6W+i7dFkPmCniuuS67TMBeU=;
        b=oAax0ZgjyjEOSoZF4TU5eIejlqeuTcQ2r4FpxiaW3ap9Lnk2jdQfmFyDHSFW76UkJE
         UlKJM1e1a2lpSaJpWuNJclFobk3EHb0tvaF/0TZhZKBldzAucgVwgk4xsFM60JFAmIAh
         gSBP67jKdJvvFTKp8XRFCS4f96igwxwszJZpCj4aSTo2eJ1aZ7LDIzErj/Q+HOJFVC62
         6y28mG31JrZ6thypFEWy0cg71DPACy9z8G9c/Nto+5a8Mnu0fxRQNZUlckBl57ksRelN
         meU8ibKqMj7T/2zpgTZb0/XbwrmFU9Xkchfp7s3yeTsW/3yp+i7VKQ9j3toNmCmA0fwk
         9UKg==
X-Forwarded-Encrypted: i=1; AL+hErHHPfSTtXJYKwwEZbDWoQz4cgHaeOYKdHiDL0kTIIryc5YDhqTJQvwPZUKjU0mHlZPfzIPg70c=@lists.infradead.org
X-Gm-Message-State: APuU4Z9/LQVSUjXlBwc7NzbI7Nm2E6iy5kGORqEQVMMv6gVWuvqXUQrN
	szb2/Azztm2AGkcEJsObNTG9hrT0OdhFZD/BiLP1CQUULihL29g7Pl3Yaxp8UG90yy8uvBc2lQk
	9x0gUVFERczHb8YR/S5w+nG+0U/iLBvNJg9mGBdcckSExaYSpd7rhqXHSUCdUJgglFlytY1nH
X-Gm-Gg: AYBFou1VUSQwrtlF/+kNYyuHm93/3mf5Yxkc+Bu7Wj41M7eUpAGYjjKjNjspUfWri4X
	tCMXbgQwJfOSnGZhg5l5ZhS/KjZtrv4Lm25+vD+/LfCLYH1alEs4ZdWPMzUIdDtBmn/gynsYYuC
	siDlkmZOf7j3JRCj/ahBb+chlDUjf7Vm4xMRca/ZO8LHcAEWyi6oEpUi2X38VUsgv2Z6H+MwHDQ
	GjJ2G1MFZBtCEyK3sUn+hYbJBWWixnMjawfjdJLvqj7qo6KzZOCdJROu4Mh+n+crW3X53/JLb3M
	UbqT7looJGlj5wKFjDCKEfAIxy4da12lR25WegD5+YHy9Fouk1UM0A7RyKvqzcMlnCSP8/8M+S/
	mKl3bH9zWHHJuxwt4/bT9kO6Ji+EFpBc1tCzAXjGaEspemklJMtwUJ4p03pLwtw==
X-Received: by 2002:a05:620a:6f01:b0:946:6:129d with SMTP id af79cd13be357-9494bc744a5mr1234051985a.54.1794733099535;
        Sun, 15 Nov 2026 00:58:19 -0800 (PST)
X-Received: by 2002:a05:620a:6f01:b0:946:6:129d with SMTP id af79cd13be357-9494bc744a5mr1234050385a.54.1794733099002;
        Sun, 15 Nov 2026 00:58:19 -0800 (PST)
Received: from localhost ([93.66.91.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm102148105e9.10.2026.11.15.00.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:17 -0800 (PST)
Date: Sun, 15 Nov 2026 09:58:16 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH ath-current v3] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
Message-ID: <avl0KJunNkgixBIS@lore-desk>
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
 <92d632b3-3aee-4786-9c89-b106b66a32ac@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TFQXiE9/RmqGVScH"
Content-Disposition: inline
In-Reply-To: <92d632b3-3aee-4786-9c89-b106b66a32ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfXzHhRZikH7udL
 F45zaG+/QkH8Jz4XuBcL0YPxJKa0sAKt9cx5eX6gn+Zicrlksh3toMtA7sjuP8tTgNnWD5zoeNb
 55HnlgkvWjvqMMTUXmizu0UVBJF/VOKc7j0hsi9x5HaCVNG0OICbJwTqhoTHPS+DzusQUicdttn
 xLSqeQ9TZKij/0nSGl8t/CcwczFeD0riAMEhck+sJMx84Rp9aD1hZlxyGB3UeiAd54AlALLlADr
 VZx8745NJSeipvudm9nylxvRbyWbjCPtVEnRtI53tYITIvlGDmg6Z2gSERRElJ2oaR7J+LxBmvO
 EpRaPS/5w4mEAah3VGWH/wZWfYDf8MuR0vrykSawtUB7vu8I6h9CJr7RsCRqrfCvwSHIrdXbCzd
 dZ6WSlwFOeOVmQvZTXi6obeoH8uKJMngtyoQaVVf+usHxrUgnk3byFWf93Qa9CYYpVekDre0T/m
 Nx4leGMcHODClwT5gDA==
X-Proofpoint-ORIG-GUID: uXfr0onmtIFl_3QpFaasvce-m_xz2sPv
X-Proofpoint-GUID: uXfr0onmtIFl_3QpFaasvce-m_xz2sPv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfX5lMXS+B03YRO
 C5c/YwQnbsv9k7EWOZsf2ViwRWgoy5/Lkobj6PxkBIt2XgP/5q6X41BONWtwu7pNyNI5vmb/nN+
 J1It669y6ENMOPu1bLRm7yZ4EwzbEXE=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af9742c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=8zQ3sPA27H7dy4zktjPBAQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2LnXmgUbajm_jcWkuQEA:9 a=CjuIK1q_8ugA:10
 a=CDx97edxcbZoIHJnS8wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_005821_487365_AE6E83ED 
X-CRM114-Status: GOOD (  24.10  )
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

--TFQXiE9/RmqGVScH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/23/2026 9:49 AM, Lorenzo Bianconi wrote:
> > Defragmented MPDUs that are re-injected into the REO are mapped with
> > DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> > DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> > map direction, so this violates the contract.
> >=20
> > The mapping actually spans both directions, since the host has written
> > the buffer before the REO reads it and the buffer is read back by the
> > host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> >=20
> > Add a common ath12k_dp_unmap_rx_buf() helper that selects
> > DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> > ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use =
it
> > in all the Rx reap and cleanup paths. Map and unmap the re-injected buf=
fer
> > with DMA_BIDIRECTIONAL consistently.
> >=20
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ_UPSTREAM-3
> >=20
> > Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping =
reinjected packets")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Set ATH12K_SKB_RXCB()->paddr before err_unmap_dma condition in
> >   ath12k_wifi7_dp_rx_h_defrag_reo_reinject().
> > - Link to v2: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping=
-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com
> >=20
> > Changes in v2:
> > - Rely on ath12k_skb_rxcb is_frag field and drop reinjected one.
> > - Link to v1: https://lore.kernel.org/r/20261017-ath12k-fix-dma-mapping=
-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com
> > ---
> >  drivers/net/wireless/ath/ath12k/dp.c           |  6 ++---
> >  drivers/net/wireless/ath/ath12k/dp_mon.c       |  5 ++--
> >  drivers/net/wireless/ath/ath12k/dp_rx.c        |  3 +--
> >  drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 17 +++---------
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 ++++++++----------=
--------
> >  6 files changed, 31 insertions(+), 48 deletions(-)
> This conflicts with recently added:
> febe1f8cbccc ("wifi: ath12k: avoid double DMA unmap of held monitor RX bu=
ffers")
>=20
> Please rebase.

ack, I will fix it in v4. Thanks.

Regards,
Lorenzo

>=20
> /jeff

--TFQXiE9/RmqGVScH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavl0KAAKCRA6cBh0uS2t
rDfIAP9LsvchkosseFMCCklR+xp+xLpkmVThJzdpJWr4FgvdMwD/e43bZ8MnuxjP
p0Z+P8Aes18g9Ty6PaAfn4ql5WDFFQ4=
=RQOP
-----END PGP SIGNATURE-----

--TFQXiE9/RmqGVScH--

