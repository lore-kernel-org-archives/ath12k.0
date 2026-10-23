Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA54606A31A
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IvdfjluD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cLxLNcLT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ejHZ6pvh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9lv12kc3XOEh/6mGhcZ4j2RuF4+816x28PJz0CFe5p4=; b=IvdfjluD3XBfoyuKFWnOLUQwoL
	JxKnxQpEEugDRy+9nwXw8hBTdhvdPK2z/dJkGIuzygNhhHMz/VSXhG2cvM+Zicr6IrBRG3wRFwDNf
	w2fYtU49lxROdbzFGyuTQ5G+pBDA7saXtt39ix/Ey0c9o4MRbXaZhgv5VN21PUyi60igYYRFRcn68
	VYzuQQef6tueaUKXeXHmLNXFhpKUJAfppANt8dwgrNkswGhHNVhevZx1YVMc2cew0+JELd8OwUv8I
	03b/JunzZUZd3nK0oClmdV0KofBnEqX+5nqjBfc5c6cGvrKk1M8G4YnIfaOfrrQNtn/Tr4vw+07IA
	aXgPSovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBYj-0000000G1OM-3dmF;
	Fri, 23 Oct 2026 09:27:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBYh-0000000G1Mt-3OK5
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 09:27:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMOA1048158
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9lv12kc3XOEh/6mGhcZ4j2Ru
	F4+816x28PJz0CFe5p4=; b=cLxLNcLTOB7rE5wD+i2jf3tDh/3SXKV+/eOM6peS
	9SqGbjkViRMUAwiTJKhXRTWUh5IJp+M9K9glLIzD7uhH8pVY6Cc7l/Fg3Q8rBEh9
	nlavNho7GKFI1AsRCpO4g2YOwV2u3x6hMCwoJoaTJjHejOgEAkR5mcoNxdw0CbA+
	YPItldyXJDMQWkQMitw38Lbp4Da3plgs7yH+Kx+5D+lOuZU0VEY2YyEjE48CBkbY
	63ha2rpwJ8XI60lUT8XwUWwJ3LrmQQBLciy1RYddVn755R8Whk3N0EyjfrlyhJSy
	comnGSSN6vM774x71nzqf4rOLv0+6YcWBDTpKUeu/zAhog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbk18x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 09:27:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso112280585a.1
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792747650; x=1793352450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lv12kc3XOEh/6mGhcZ4j2RuF4+816x28PJz0CFe5p4=;
        b=ejHZ6pvhsgjeWQkyL0MA7rDVXrvuhErqzGqgNoYnM7mYLh63EhF69OBCy0jn8DsjHG
         AlQRrCsQUhplirn0t2Cq/k9KwDh0/HhzPTpKMxrjyETlM3bZfNVxWjeR6YEkdEydVgnd
         3XT0ZKawApW5fdiLUbCQV4Gzii/fookAJhkUjqDLdJYI3lJPNzZNB3yN/X2yunDSgUKs
         72CEd5si0WXprYACZoozqOoSdBPyecWzHalk3M6lv5zNMHM2S7RXTeyyyezwLfdIrgvj
         +dyIkt9PD0yzDl4dCaWHNhKX9/IFC0q8/D7GEyQ94EGg78oj1XGscda4o2HfQwHC+Xru
         Ootw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747650; x=1793352450;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lv12kc3XOEh/6mGhcZ4j2RuF4+816x28PJz0CFe5p4=;
        b=dWMj63nmSYrGljPTJsYnO5HomRZCGfonWHiwEU0wK9MXo2v3ylHryfbVg4UfoAk/qS
         8Mtt8kFzIW75kQeH2lXuscdCvHFAdM20/atQG+DoNI7CKQJGy6Tx/6bNJNJTShjoOCL6
         C9OoIQ/MmB/ywBCEBIl69Cweka7dQw6X5E9SvDZrc+tPIWt+foq71aUVEf0dk7KdMzaz
         9kHeMykM3o/YJB/1o+cEsVNQlx40HXWMkIvsxz9UCYnqoiD1fOhyyYFjZJPdSZ5DR/LT
         bciIsc8YzBZxhZ8hO+OVArLAo4aW9S9FZLgz2gN+hxpF0iZ7JinjYknjVTOoMhFVHAbl
         YCoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWU+Xch+WBYzMPURy1VJMyLdPmJ4yoCJyITOnQkuXbrRJ1jjlbjJ/Abg1JN8xJgIayJFf8zfY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKIPo/bFzAh+Zvq2xBufKeXVCx+mYuYywj+v2PSnchnzDeMzuYN
	5gW3h+CacO8y149BFNzP4JY+kUBLBSCAQBCkLtKqOtOLK2hvpl7vZo43IbH/6g0gFtcttRsqEp/
	5DmybpcxnGx1aXTNLzMsTRH22fr5y2UnSOIfF0b/BQ3irFF49cchMvbC4fZhHbI7Z
X-Gm-Gg: AYBFou1TNEf+eD59lYXmPd6P7q02dRmvHtwEHfVySIPrUaWHcknufraG/BIIvsTuGr0
	OcH2Rt8EF//1Wzs1rXrESnF8NhKJNIg5smnHuCbNdep6oeDsrEnwSUNKftRt3RZLV/Ztp1zK7D/
	JhgZbV6xZI8LHXjlrH4b/C+oT6BQuHnuLHOX1/48E1bewusjlst8XRcI+vxmeN17hQz30XfqJ1J
	lCNeaHifXUL0JhxPCUIyDeP2pz6snPNfhE9emXT4zfeFCZ+s3QOUcFq+QjjyW3xLMLTjH2st6uo
	YQW14jGVit34weHq+JZ9rY8ult75CNXO99PDJ8cz5aHwULb6GQVyiauTQjwyVOIL6lxHk+PGKjg
	sX5OMFCUjbFo=
X-Received: by 2002:a05:620a:4505:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93f6f78710emr325900685a.23.1792747650049;
        Fri, 23 Oct 2026 02:27:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93f6f78710emr325897885a.23.1792747649444;
        Fri, 23 Oct 2026 02:27:29 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211bda21dsm54466305e9.11.2026.10.23.02.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:27:28 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:27:27 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH ath-current] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
Message-ID: <atsof77Ru3vW4l0s@lore-desk>
References: <20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com>
 <41eff135-80fe-4820-b9c4-48705159a013@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HZrZ1ts+FdlZCftW"
Content-Disposition: inline
In-Reply-To: <41eff135-80fe-4820-b9c4-48705159a013@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNyBTYWx0ZWRfXxcKINNQyypOz
 6kUH5JpYJHhKgI7i0zDOZoUpXfMgCCx2XirSVYqF1UqWd8DL8Gs0azAFLfsPOyzXVYDR+Hnw8li
 HwRA9YfwWMWpHphji1EdaHSDn2wqPrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNyBTYWx0ZWRfX1n+LqWc6e/v9
 6FmVPi7FsUvtUc6I74D6a7Yeep+JvWTEIcXOU2G1B8vdwtIVW3xvu81OWo96MWQSWxUMVecuFWj
 6et2Xxgdksn+/Rx4KcdSjLL+xkVBwsV+qjDbvbAsCzDj0VmozvZjMTaxM71rOqeamcXWd2DADY/
 Jz3zK4GAG1Rrxda0zq9afZNcm8BRSXWwIko/IJnsMmioRhkB7V9wdoVq3I4WZO9kyDWC2Nww737
 2sv8dqItQa9Yz0SqIe7Yb05od/0IKa+0nnXTINTo9I4A8d99aq8psX1Xg1l15H4bdBixc554btU
 /5loUPCCW1UiHoPXqsurv/fG9sQj+DMrwsK+hj8G05AJCs/yHZRaCMQjbyvH1XNV4fIaoGiV0+f
 rWV3/Wimw9W2YNnhAJzTPs7gC/APmEiYtuOBS8YTaznkEX6Bu9HJY9Ep8uVvjB9jfJZKl7NJJUE
 MhtjpNexPfG4K6g3InQ==
X-Proofpoint-ORIG-GUID: yf7ZXv32UWFq8-aLRi7LkslMtb3fDboe
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb2882 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=MzmxzcrYCnjYavR0kDUA:9
 a=CjuIK1q_8ugA:10 a=EDCNbuhR6sifr4SWXDUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yf7ZXv32UWFq8-aLRi7LkslMtb3fDboe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_022731_972052_980A70A9 
X-CRM114-Status: GOOD (  16.88  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--HZrZ1ts+FdlZCftW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/17/2026 5:16 PM, Lorenzo Bianconi wrote:
>=20
> > --- a/drivers/net/wireless/ath/ath12k/core.h
> > +++ b/drivers/net/wireless/ath/ath12k/core.h
> > @@ -149,6 +149,7 @@ struct ath12k_skb_rxcb {
> >  	u8 tid;
> >  	u16 peer_id;
> >  	bool is_end_of_ppdu;
> > +	bool reinjected;
>=20
> rxcb->is_frag already identifies a reinjected frame, can we use it instea=
d?

Hi Baochen,

I agree, we can use is_frag and drop reinjected field. I will fix it in v2.

>=20
>=20
> > diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c
> b/drivers/net/wireless/ath/ath12k/dp_rx.c
> > index 8fa0e90b4531..0003cc5a3720 100644
> > --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> > +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> > @@ -138,6 +138,7 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *d=
p,
> >  		if (!rx_desc)
> >  			goto fail_dma_unmap;
> >
> > +		ATH12K_SKB_RXCB(skb)->reinjected =3D false;
>=20
> These skbs come straight from dev_alloc_skb(), which clears CB area insid=
e, so this is not
> required. But for readability purpose I have no objection to keep it.

ack, I will drop it in v2.

Regards,
Lorenzo

--HZrZ1ts+FdlZCftW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatsofwAKCRA6cBh0uS2t
rPThAP9iSya+erfxLC2cUfy5puh3lne7T29gwCslj5ZZ6DbaRQEAzUPMdOy6EFaF
9+0cOYXh9y8wc1ywO4X5CrChESUTXAU=
=Buzo
-----END PGP SIGNATURE-----

--HZrZ1ts+FdlZCftW--

