Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A216CA601D
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DObaq6Nb/58jUtIY5nWlM2D34IXl0uCF6VmogrMWqoM=; b=yYm6Nco/4cWe6na7V+Ct0fSM9U
	KFGlAeUlqH5A70XW39zTI1AqR0yDxCPU/fZJ1QWygIEO/D+uCaxqw01PqcghosL9k0QSMOiBC2hUh
	V/vCQ7+IvVyksxXleiIlNOr4AAeo5ZhJyLxpYxe4ld5a9EzXJ9BKmJrdkBF3NxrIIe8hQup+F4j3F
	3f9FLn4KXEf7XTsOcjpi0AEF9wVKNDTfQEJPtQMLYrvg6yPyYSSxvEXih+L3DAyFYD2OORSOkNrDT
	R7hVkrZ3dhCReldFLOxJFoXV6zU5Wxks96rHtq+mJRl/0z/o+4A721PwkOTs4Mk3GA6XuBi659y0t
	Y1C1dvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDZg-00000006fLf-1c3h;
	Fri, 09 Oct 2026 16:36:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDZd-00000006fK0-37kA
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 16:35:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GHD9R2798816
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 16:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DObaq6Nb/58jUtIY5nWlM2D3
	4IXl0uCF6VmogrMWqoM=; b=agO31pXRIqFKIObPsE7A9dd/HaNlDYbKRj8RZhqr
	PalWJ9+eJO53bLKhwm8gcU02xPqxk/VHrb2OTAgEFvglkPiGXUWucWY6yVENceTz
	xLlytE2n2iqAgrXBOiI4iLDCCSckkv1FwirAkUTGNNI4TGjFAvQDCnAMBLDBHgFv
	0lu01GoCxIpxOzUOI1kX+zjzslylIxZ2yxtzIuiDlZHl9gjqcp1Mh0hBX57xpNF+
	q9zvk3jKTUtBlK2LZIZ2MDqocRiAsOKU8WkV+e3SKGHHFHWCQfraMTlVzd70vtW9
	XDAyS9YXeds9e0uMw4+bs5spOWEz8XQZ+GMvnTLRigPESA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h72ty0ajt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 16:35:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1251204985a.3
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791563755; x=1792168555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DObaq6Nb/58jUtIY5nWlM2D34IXl0uCF6VmogrMWqoM=;
        b=jIavN8ZcUVT3tho1BclVeuXWzvw95PHOT3eUYCCfSHd7GycsyRlUC2tXOztfbYQvk6
         WUiT0Kw74n8/bNovQs+gd4+8q0hfaoEaFVcYW4C7hwpMpx8wG3gfb6/Xg6YvMGKftMDx
         92SxkFtQXGHNvFQasIlNTbr0IYuC/RH+jfqa260whLsTHjPGe1x8sNPGeEiCr2lq5NIB
         aTYFT+CkVuNcg8tPRK4gMn3aeJR8HOVTNCNuxeFBSLxDA+bDzXTT/KmnpEawl3f67aqY
         wX02yRY7H7lxS33NZ12ZUBdy+YhQWY7SbNz5xtNfinMEjlI8pmNBYgEovbLl73Kvfsra
         KkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563755; x=1792168555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DObaq6Nb/58jUtIY5nWlM2D34IXl0uCF6VmogrMWqoM=;
        b=yaQLaWe2TmL+qwxErspSdOcJvC3yp7O3DbvQwcwEvM8+BlxOLsKmpM8f8utR84nJgr
         xaRXK2CsGkaUbSVh6GiOZzb9hU+jseEFpfUOlkP3blNyIis8yPLftzfZYjj9VhPx1U0I
         rFJxzQm9aFhMZjoFoEjZM60nuNLsFZUDBZJRlAPT5O8u7QkUdLwTWRMAkzxWsOV6Unsc
         Itm5zWSkgkmU/5WbLBrPT7SrY8eXAYpXjeE75z0V+7FKSKkB5zP4MfCQISr+VXhhc/8N
         KTUzgsG2gjz5UiB/2oYV7MKhLyKECBSgpMhDS8YaQIkFQ7qryH8WOzRjOHrOXeFLMZLJ
         SkyA==
X-Forwarded-Encrypted: i=1; AKwUvBzcMdLjOWdguOipAOHN8WRNUJVfM3JNqdJrTea9htm9UvN5KxZcECN1KQYOb6OHako53KFDUYw=@lists.infradead.org
X-Gm-Message-State: AFuF++nBmuDuCCbZBHfS+OE87rSu59c1H8AVGRuCau55BHMpsEecAjkJ
	OtxHKcMdQ5trIud8191HsAacG3NcWmBGgSgt3/OwxuN7dfDRADyYbvNT/PNoTnPWlyFGprbNd9O
	df+koU3fxBk5v76pyWljIPV+M69GfFGAtanwucNtMc2tQPJyVepYO8qAFHwGGCHQc
X-Gm-Gg: AYBFou3+IY0x0o3SMs5UViR7Xfydah7EgCYd9RHZBRV+ITgfOxHxyq7cjMGqMqUqSug
	YUbt88fJw/uu439JrbZBa9nBsvpQsKXvKWF7tMuki8x64WlXlXILiCRJApkQoCWgpyr91hpfsko
	Y+pQV1mTnCxF3WDh9+38/ARg7BO6FFHIe4GsdkKeziF9hJZ4JHxHFpB+hxLSlFEt2QCIzLY1IUc
	i/Sudq+w9n2QSwsR2klEXFjKwQ3ePsxgiycd0ViWVm8gXv3ECyPOgHzM/MbQDm/o5w9s4f6pYta
	l26Jt/8PpeBiBeQfmm1i8uVOb1nimqLBHKgwyGyRhNDuVmebdCkZJixqKIrA0j+p+MP/PI8RfzM
	unkdumu4vQXaIQA==
X-Received: by 2002:a05:620a:40d5:b0:93a:f9:614a with SMTP id af79cd13be357-93ebd21ffc4mr360473085a.34.1791563755112;
        Fri, 09 Oct 2026 09:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:93a:f9:614a with SMTP id af79cd13be357-93ebd21ffc4mr360466885a.34.1791563754373;
        Fri, 09 Oct 2026 09:35:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm79141685e9.12.2026.10.09.09.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:53 -0700 (PDT)
Date: Fri, 9 Oct 2026 18:35:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 3/3] wifi: ath12k: rely on page_pool APIs for buffer
 allocation
Message-ID: <askX6OVi1grqRgL7@lore-desk>
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
 <20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com>
 <934b1a06-48ee-47d7-b985-c3e7221d7880@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3vmZ+iRSMM9VSjr"
Content-Disposition: inline
In-Reply-To: <934b1a06-48ee-47d7-b985-c3e7221d7880@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BtsGwEIBQ9kujIhpKDC7z-xCqGaqrFB6
X-Authority-Analysis: v=2.4 cv=Zvd4uN7G c=1 sm=1 tr=0 ts=6ac917eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=VF8GH8uOMsmr12UB0xUA:9 a=CjuIK1q_8ugA:10 a=v5oEB8NXsXvYOpEHCQgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfXwDH290fhj/8D
 L1UGa2x74lvcccArhclYCdVQLalVfyB6L42RKE2VnpwqvOU0Qz8LCm1LVLQq5S/CZHgMh7NZp1z
 hlstdj6lkqv0bZaR/j1vhrMkTFCCvxQ=
X-Proofpoint-GUID: BtsGwEIBQ9kujIhpKDC7z-xCqGaqrFB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfXwboC7dUcoHVm
 FZRnJVfvsjMocLZQuz+0h47WhVXPaaYLfPonmj3nFvxh45CF1vPCdnKYTQ+aqVfopXJ7AhbGejz
 3SFQCuFp4qhwK0qRDNH2O4E8tWTABln5lnvw2ulJN0quCx+xG7UhtUQtNjuMQJrQDWjybtZYvii
 o0fkH9O075G5XPH6hyoaYyfdWCKOpWIdSsOvMrahcEiKeUXP42HIzO63G7VoocJtTymzJEqNX14
 BypnE6ytyRQtaQ5zUp0TZmQDqV0MNQJEVHmFI0q4GCdyEsVYgwC+8UJIzgwL8J/AoaKiB+YAQfM
 xEfzGh30Lt0UEt7bnaBXEyPbg5eNjIFYfl+QK+NNkBrKlRyYWn6+VSwhfITvskKDNgfz5M1adJJ
 DiKH8QZD3LVqhPLX2DWIjo1/Hy9pmDz6ngXeozb8JkAEt074Bi66swpzdwo6DwJmQDzlY7V5Pab
 dfrR13I15wb7BcHuSKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_093557_912622_9940D0C3 
X-CRM114-Status: GOOD (  22.57  )
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

--l3vmZ+iRSMM9VSjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> On 10/8/2026 9:16 PM, Lorenzo Bianconi wrote:
> > Convert the Rx refill buffers to the page_pool API instead of allocating
> > an skb with dev_alloc_skb() and mapping it with dma_map_single(). The p=
ool
> > handles the DMA mapping and buffer recycling.
> >=20
> > Add a page_pool to struct dp_rxdma_ring, created in
> > ath12k_dp_rxdma_ring_buf_setup() and destroyed in
> > ath12k_dp_rxdma_ring_buf_cleanup().
> >=20
> > Update ath12k_dp_unmap_rx_buf() to sync page_pool buffers for the CPU
> > instead of unmapping them, and guard the teardown paths
> > (ath12k_dp_cc_cleanup(), ath12k_dp_h_msdu_buffer_type()) against
> > page_pool buffers. In the re-inject path, sync an already mapped
> > page_pool buffer for the device instead of mapping it again, and fill t=
he
> > descriptor with the DMA address stored in the rxcb.
> >=20
> > The monitor, CE and TX paths are left unchanged.
> >=20
> > This is just preliminary support: the goal is to use a single page to m=
ap
> > two separated fragments of 2048B.
>=20
> why? please always justify your motivation in detail when the change is n=
ot trival.

my main goal here would be to avoid running dev_alloc_skb()/dma_{map,unmap}=
() on every
rx packets but rely on page_pool APIs in order to recycles and keep pages D=
MA
mapped. I guess this way we will have even a smaller memory footprint.

>=20
> Besides, instead of preliminary patches, why not just send the full suppo=
rt in a single
> series?
>=20

I would like to implement it incrementally (you can find the code here [0])=
 but
I am fine to squash patches in the next iteration.

Regards,
Lorenzo

[0] https://github.com/LorenzoBianconi/wireless-next/tree/b4/ath12k-pp-dev

--l3vmZ+iRSMM9VSjr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaskX6AAKCRA6cBh0uS2t
rAjgAP9+/vCFXrWVv8wk90HKCBooT91BNHMFIuDkxFDsi1KL1QD8D7PLpUa4QlHm
5Km0lZSSNj/IuFwXW5yPH5ao+pRBAAE=
=gbSU
-----END PGP SIGNATURE-----

--l3vmZ+iRSMM9VSjr--

