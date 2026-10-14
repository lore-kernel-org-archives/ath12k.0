Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4FBCC6B1A
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKU6SBOy9ApqE53IhaKqksj2pcfRhupWYTN6RzVisPc=; b=HTO5Z3BPc/MdpbvtmHgtVUI/mu
	yuHlzpiajvFr+l/gA/2s3NHCOmhYtJ4R7krANa4e9UpH5OSFXFmL1h5j5z/31M9boNAPEVKCVNAB9
	g3WfEsB7J1VXbwtiqMIb3De7s8cmRW1+nQ3p83sWB8Kc30O02giBhgQvhvFZqc90K3DCdiGt3vTTO
	Y9jQ6pF2U3pLCCS3Dyda57x+O9rLk8EBoyfZbt4DMblCmgzpJCRT3i9pmzjxf6/zOVQ0YqHpwIR7p
	qenysPutwqyqjKaOZLB3a4jK5DICU16LqId7b1N/Xq2hathUdROrWVsKkVUyJ+RNLQkKpQZntGI1s
	Gl3ZPjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH00Q-0000000FjRZ-1Qpe;
	Wed, 14 Oct 2026 14:30:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH00H-0000000FjQd-1Ls8
	for ath12k@bombadil.infradead.org;
	Wed, 14 Oct 2026 14:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bKU6SBOy9ApqE53IhaKqksj2pcfRhupWYTN6RzVisPc=; b=PceiBFM9dSESDsaPsuAt4inxKl
	ijLq6o4WWVzcsURCo3z+r9RcCx/LFvJ/k637GkyOIIfU+CHi4J5kKtuWgvPQihdfNPDQyrF+ojsgp
	eoV3xeWFVxtOnvVoDh3cNA9vEs/aH5fSwSUpfFU+roo2jXRMjl41+5K4lfu3beY96lZamLVjJyBBt
	7nKHiL9nggMwOLLnR2lZmMxB3f5D2LsXM+d3SLNd3QZlwVTBF6nIsnpbjgLBptZzyD1icNaz8Wekj
	yKxfY+p8j6Qm3YCTmuogNCKTtdzG3N3Lnpd4uogDKrbRD0IAQmwEcs4uj5bfFHUeEOntSZ//cUrTJ
	j8VN6qDQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH00E-0000000Gsqd-1ZEP
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 14:30:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ED2RW32873874
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKU6SBOy9ApqE53IhaKqksj2
	pcfRhupWYTN6RzVisPc=; b=HHP8iaiEyNrZIGnMqXJOFhBpOVGYomaOnSj5VZbq
	GOReeHX/0F6tCn2aFlSgtHaodu4T/hVpjYd6uqub3EmABUEaQNb8+M89Yxth/ZN9
	cg8pJ6D0ambk7qB1Y0ACdnmY35YEd07aBpvDfrHCBcgn8Cu63/xY+qivHXHLvoKB
	0ZJSmOPOMYW1gFthBqIX6qikgQOWBTKqa+pCvkA/+GU3rba6C1spyJiWJIksC9EA
	LlbUes5Tv7GqXmtg9kqZ3pSUv28/ueNVK88Dvc8Ta9ULAfkhek+JYmOpWSBZv5d/
	7f8Q+gvuntnO4zq5i6G72ZC35G6TvmoBw3ABA31wh5/Fpg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphk0m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:30:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c07f9547d9so629684137.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988243; x=1792593043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKU6SBOy9ApqE53IhaKqksj2pcfRhupWYTN6RzVisPc=;
        b=WzOaq37WBWIiScK5Y8IYvhk8AGWOGr4dP+DyPHJOt8ehP53KffO/Fh79P/0xgl0iRS
         hQCxjhaZis5HgjREzaTJeumQvm2+QUewjz/MFIGrUL4M/B/crMFIt0cjxVFIU0lXO6Ot
         Ie+qrXXnZrNROtUhIto5ynWOJHuchRLaWHEn++02whiBCDWFfu/mL+NZVR4cW3pc6rhr
         JuyMHuG24lzUaQ0kl/L5P/f5ZX+RBtbHtadzsnmD33lq8JckKc9gi9MhnyKmhKMRuuu5
         pkLqwwEfmcD6cC4jhHScgxPnVuO6JvLPhsvyROPrkn09KVpTnTGmW/KAVhbMZozPiPCs
         KKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988243; x=1792593043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKU6SBOy9ApqE53IhaKqksj2pcfRhupWYTN6RzVisPc=;
        b=EZDrLJjxBEtfuVj1iMEVk8MzHuImgqPHYsxXmHfuGFRZkHNv7hCu/Kvj84FNHjv3oC
         Hsoo+ZzZk+m5PpNfJyayJkUsGEyKQbp9VQTOT1dEjTcBWK9jPYlK8NXDCFkSSha0rm9o
         zFwM5XSGNRnnh4zmuH8v+k5TaPIFElZ6u+1kKYCZlP/CEHq5cIu5oHk8t32P/YUUC+/Q
         pZvrAYY4lGevkBL2JQ2kCgczJIwfx37TPtpQob2S48jOLWTd7T7wUYnF/B0qocxrBeaw
         oe776Cvv+yoxzFUFaYHS+D0VJeb74d0aAOaGRwrnIC1/8R16rHUG2W9TfNd+lAwsEdc+
         SI+w==
X-Forwarded-Encrypted: i=1; AKwUvBwj0rRJ9RWHSV+9QrEipHbhVWDcq6Nh26LMnfPd37GwglTkq/G5AB5emAVyeFjrl2tLaX+YqSE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ58D6o3NjHFeo4jE+fxagyIWBQPowMB/jk6KMVgjATGL2RctHt
	HaLxW0jH1NCKK5joPYSfrE8PcX1PL9PtCtrT0ZyaJOdmU5uj7nrqYLGRH5t3SrnJ5i0bHev6Csq
	OQcd8uWo7ncPVyjFm7Vf5XYzQuLamv6IAEImOGgNlLZt9bwrdLQHWtn3dol0rfIPU
X-Gm-Gg: AYBFou2HmFlz+IrtkNxtumYKIwkEKP/jjhTdM/fg1uIzpn4thgLm5aWfvtwoyBWMtQD
	sLwfjOtN43vyNQp3qMbLq0xIos4OZMV2SgVERRnyYSW7XdRjN9lQt+iq5+LGjwIpIVepmY3TBF7
	Dku2YVh9XTJYUWMz/rIVzmLhKk06cjXHy8m5PEmmtkNo1qibRq8xTzbihGVEo8dDOHBXe3TkHse
	cEYsAB1JTNEfbkGKYKMmDxZeQyaL4Z1+4Z3/nCN2zNdW/tK1Pi8UZtcwzakLoTpKpAIoskQGXZ5
	AQkjAJcayFZErHTqW5hMkddmYW95mLsjnJfaly4pg3GYv+aRakVRBhtB2tAl58VC1Xm+7ZAjTDW
	E5Bs4Wb3ZnrtzgQ==
X-Received: by 2002:a05:6102:1609:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7cb372de97dmr3761493137.17.1791988242926;
        Wed, 14 Oct 2026 07:30:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7cb372de97dmr3761439137.17.1791988240627;
        Wed, 14 Oct 2026 07:30:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b6224f52sm39203665e9.4.2026.10.14.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:30:38 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:30:37 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: ath12k: add page_pool support for rx data path
Message-ID: <as-SDRZQehtr_J1N@lore-desk>
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R3en0U7yalSeIZv0"
Content-Disposition: inline
In-Reply-To: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
X-Proofpoint-GUID: gB7_hEVlcfMMunFuLHEz_ahWXphYXxMB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX97u7jbw8ByUU
 /7tXh0TKkxzpdVPIUTN+qeL+Y6GPq4qLsZix+JvVB13cEs0vQNF/nLDOAREKpPHHlmZNMFqq++d
 gn1tQZmO4qq4bXdEYbp+l2KiLe+1a1Q=
X-Proofpoint-ORIG-GUID: gB7_hEVlcfMMunFuLHEz_ahWXphYXxMB
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf9213 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LpUeRXHAMchiTH5aEiwA:9 a=CjuIK1q_8ugA:10 a=vD29VgyGE-FLY0UuNjsA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX8k4x1yCjVp1Q
 Rtc8GxeT35lL+9p9eMyTSAn6GuJum2YaF+GRkbzfFW1/vX94hVYVWxZ7+1gjYCjCAQBsZ/vJ6nz
 oPdiWt8C9fBpKipPjzNKZjGw3uuQRHlMmZGC9XK+bzJiarVLxiZjYky1eEBJxLH94xdHm8gB7GF
 hUwB9Iqsoa5KHBdZAYXg1sb9azLrfaR78PAF+Xgcc/2lQih0tfO74FyCEGZXhaOS3HA+sQdkxfd
 2U7Pp8c020IYBClOa34N4MOIk7qUU1DKLvpDjOEMtXpDUPT876JfcGiddASTVMvz4H988FkjqM+
 h8bnThek0pcAIVSBoHjm3W3l03ygeMrngKSb267oVDlz/ob1KMq6A8rSptFZIlWEFGPJNX1C36e
 AEP8jCYu0k0RyJzSZQnsiRRUPjno3UpJYFaZK1e9XH2hfZT85dI/S5jQ3L5+/sE1+o9AejXh5MV
 Ad/r1B3X4wq0kxXAIFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_153046_725595_3FCCEF08 
X-CRM114-Status: GOOD (  15.55  )
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

--R3en0U7yalSeIZv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Convert the Rx refill buffers to the page_pool API instead of allocating
> an skb with dev_alloc_skb() and mapping it with dma_map_single().
> Fix DMA direction for reinjeced packets.

Hi Jeff,

I will post v2 of this series addressing received comments.

Regards,
Lorenzo

>=20
> ---
> Lorenzo Bianconi (3):
>       wifi: ath12k: fix datapath lookup in ath12k_wifi7_dp_rx_process_err=
()
>       wifi: ath12k: fix DMA direction for re-injected Rx buffers
>       wifi: ath12k: rely on page_pool APIs for buffer allocation
>=20
>  drivers/net/wireless/ath/ath12k/Kconfig        |   1 +
>  drivers/net/wireless/ath/ath12k/core.h         |   1 +
>  drivers/net/wireless/ath/ath12k/dp.c           |   5 +-
>  drivers/net/wireless/ath/ath12k/dp.h           |   1 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c        | 101 +++++++++++++++++--=
------
>  drivers/net/wireless/ath/ath12k/dp_rx.h        |  29 +++++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c |   5 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  |  67 ++++++++--------
>  8 files changed, 138 insertions(+), 72 deletions(-)
> ---
> base-commit: 17e4b9ea527b6c9491bed60f646bb2eff7d8db7b
> change-id: 20261007-ath12k-pp-e8c62b54d756
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
>=20

--R3en0U7yalSeIZv0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas+SDQAKCRA6cBh0uS2t
rOYnAP4wUFa6b9CcAmU7YVbVVaZqs+enHxacDM0pPTGpcG2/OgD/btgjhhN1AXM4
o+WrMIRllKfMVVjgelgtX/CXxctU8wo=
=AUI5
-----END PGP SIGNATURE-----

--R3en0U7yalSeIZv0--

