Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ABECA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv50HkcJaAwj1X8YYLMMAgmlyDTg6+rpfqYO/vB0gT4=; b=txjDjduF2ZK1y5Yzr3reoGEY6m
	gE0rn0/dRfN59sNJue1TGydjOMH9ZuhJKanUcP5ysVz4PJGEwUh2P0YuJVR0304BUMAbCOkE0OUM4
	NMjo0YA3fGuR31CFNSO0BSClwC3pRRqHkVqSTXTjvLSRLXQT7nhYnolknRLvMr5nLsPB/m/crbNQv
	c0zsIFWuAo+K9xdm+359ZcehYOh41WNam2plRqScNc9pjdOGEt2skz867ort2NJqbMY16XTZQNB8f
	jdiUkUxysUWZx2WkFWKONYPE9k/V/Y6oZ41ODKkTQn55h6Km/QCU3tih3T///wKMIeskHisbxlvyW
	pHa7yObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpgP-00000004aIP-0ufW;
	Thu, 08 Oct 2026 15:05:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpgM-00000004aHk-2Pcp
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 15:05:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVFPJ4148770
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 15:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kv50HkcJaAwj1X8YYLMMAgml
	yDTg6+rpfqYO/vB0gT4=; b=pC0y3p5uYjSZR0ZbTSl3M5CjReBAHW/nBPlYQocq
	VD6N3BrY1ymr8iGeWFfHrXzS6OMAqsbqvqaj+PS+0Av/DGd6cyvcRlDODF9hnJPt
	n6aB3FZYw2B0ylJ6LjYL73D0BCEpplsuJL2xSFsHRC8PYajLAiWdbGjhuc2X9b4d
	/2Yp0qO8UUn+ZZkZhooEcGpXq63aVdDzqnsNVv3EK5dWQSw0m09jSXBGqF308xMu
	Ijw8laItcEwH6lUWONwu7m4D70nYZ0N1dRI6V4E+K9V1Lyc2+lZ/CQfmgLqMTrYW
	Tzo5SEN2N44BkBgiaww6QsSMKHSJRsnkvQcREAl8HucTJA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6bf87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 15:05:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5cf33256d2aso707120e0c.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471916; x=1792076716; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kv50HkcJaAwj1X8YYLMMAgmlyDTg6+rpfqYO/vB0gT4=;
        b=CSUNLki4yqOzj2rckHCcw+dWMGRHziiLAO1rtU08wRikBL16ULPq3oz56VEXpbk9Jk
         f5ou5bgP29aQLwzBgIJ4Pwge9x2usSaPcFijR3yH+1sbdjZPqJMhBrHEWNMIzq0Qnlc1
         +WRv48BLZNA+FizoEayBDDPcOtXfJ7d3nFniyO7NDFIatOFfrBC4i75ZcM7GgO11WyYw
         QjqBDJZbgnnCABpR1bkVE0f5EOKhxKIVvjGTYVuQnXIQDfj/wQcR2rQFWFbBwy6gmTF5
         2cL3NbZGWJHgpDUE3v3GvjKwlRXk8SVrim6p45e2DnZVItoFBqwUWc75jzbfYJYWqRNm
         Qp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471916; x=1792076716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv50HkcJaAwj1X8YYLMMAgmlyDTg6+rpfqYO/vB0gT4=;
        b=nPruuBZ7SF9KVQEzXF5APJqDYsR9QRlL3voi8nomFsouEPICvI3SClAOmE2gYaeIQk
         CcYMeVv9n2Kni4FQbocbvQYyPlGequZU5i2bEzQxSGkGYAdzwJ9bZ4cD29m/JYzEGhXa
         Yc39px3UUQxw3Ohs1AETmhJ2fDBfrLrFzt40k7GMEluJSnlubc7EmTtz/Y3jJV1HQc5C
         d/sd1iyFzdC0tHJUGBqogGj1V7zc7xIQH/EutcLbYW1QOzumBA26aAzFImbnj0wP3z3L
         FK1pMWQVKfDKKBBBLAQYmREwxYD3SfShrpJdz7HrAyS7av+i0yMwAoTCPQR5YCx0wgAL
         NgQw==
X-Forwarded-Encrypted: i=1; AKwUvBy0Bc4d5rfMw16+a87miBBDP3IDshzb8TVQsOmYXuwKai5Pul9LqGPOqWzAUgIeVKR5icWArs8=@lists.infradead.org
X-Gm-Message-State: AFq9FYLbq4pYeMHebflf0f4JTLcc0zAiy83Zqtf4zY6F+NLGjw6JstEd
	ySIQnbrx0Fd1Nh9opMN+uNAaTv96c5XvMt8+qCF2argvYv/BmMNgP4JME5RQSlKkwc2vEqllGk6
	KUTzdCFahbT/J6if7JIvt+xG9n53E6TVNZw5qYK7VR30ClDOvNRWuKVMJGxy4sLWj
X-Gm-Gg: AYBFou2geFndRg86ZrCIYOqxgb+sDxJwBrvbNXNVHV6n28jon/qSd/CBK3mRsTHUZcF
	i5OQKVS/OlstvTQ+E5L0vdf1JZmfbmdctuzF0vQ5ozSpvPTDOde/MX3spx3YTvpIzQ4b5b5Tho7
	sG0UjhyqPBtMAN2o4mHNBnbJhs3oxnZoi7JB5rnKuL4UwfURbP3+v0mu+Vk18grGU4a0KJM3Znr
	YtB4dczlhtku+ql5XLCppvJW0QtnSXZbEgc1wocXKQP5eUdZMlASx9DRnVLe+hzAIWAe0A7IHl7
	P7hqgRY0QmgiiyXgIjq/Beqa7cVAhTsXtweS2N+PFhV0K1hq3tiKn1efX26G2lR0SfusIYDPxTL
	WlQBLMjGDaqEl2A==
X-Received: by 2002:a05:6122:8b81:b0:5df:12d3:e99 with SMTP id 71dfb90a1353d-5e82ae07fb3mr811395e0c.16.1791471916277;
        Thu, 08 Oct 2026 08:05:16 -0700 (PDT)
X-Received: by 2002:a05:6122:8b81:b0:5df:12d3:e99 with SMTP id 71dfb90a1353d-5e82ae07fb3mr811322e0c.16.1791471915160;
        Thu, 08 Oct 2026 08:05:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb288sm98046005e9.4.2026.10.08.08.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:05:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 17:05:13 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/3] wifi: ath12k: fix datapath lookup in
 ath12k_wifi7_dp_rx_process_err()
Message-ID: <asexKZv9_Y5soQZX@lore-desk>
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
 <20261008-ath12k-pp-v1-1-68f888cd7eec@oss.qualcomm.com>
 <5f55176d-12a7-47aa-97ae-9a2ea071d815@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WWNr85YoYd/pGTWO"
Content-Disposition: inline
In-Reply-To: <5f55176d-12a7-47aa-97ae-9a2ea071d815@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hANxp65rDb6ZpyLX0qFgfxOAM-Ga7hC9
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7b12d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0XBF_llQh2_0MlobpeUA:9 a=CjuIK1q_8ugA:10
 a=3iFN0n3oArMhL2KwSckA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: hANxp65rDb6ZpyLX0qFgfxOAM-Ga7hC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MCBTYWx0ZWRfX9c5blQkORCZT
 m64mup7I+k+DX8kKbuh4+9UEoW46qC5Sw7HQmj+etqBS5XwWFSApV7EOcFWHinAQpArRzcsz3pa
 CuBCeq8pj7F8Ma++E/SWBXTOKhK01EHqbRGvGUts2wmcftQ60Q0V7tqeI0xxmucKjVz3ms3hViG
 5I7TfSiUxbrG4P0izsem+BNOk+NfBJFXnhXiojwCtMwa8apa6gFYqn+zmzEc8xEntvf/+oxqqjE
 /QsqALNK8YiLnGvNenygBsrSMmrgsUPh6pwlBqxIIlA2VAwBzICOHus+En7a+lEhrrZ+NkCTWiq
 i39T5lCPDGo6ozEiaCLQ8iAqM0/K9ny44SbqLQkUfpV7DWxWYmUTdws2HW/p2InMixkyZXS80uR
 GU3GYyJp4AmNdIZM1VwCaNIxjm9MlxHcrhRX+Q87L/Bqt2nELOU0egnMMpTRdHgaL7IRv5Az1qT
 AzvEnCK99IbAYmNu30g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MCBTYWx0ZWRfX4I3W/J3LvAs5
 TklVyKASneQ4ZlJL37stCD+anI9xX9ZLy075VOlvdDkfT2pYtlIUc/nyV+oGY+tbtRaMm8gvWBq
 7PJmLd7IuP6OHzATI8jFE5gBQWVn4Fg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_080518_726840_A66730E8 
X-CRM114-Status: GOOD (  26.03  )
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

--WWNr85YoYd/pGTWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/8/2026 6:15 AM, Lorenzo Bianconi wrote:
> > ath12k_wifi7_dp_rx_process_err() resolves the per-pdev datapath with
> > ath12k_dp_to_pdev_dp(dp, pdev_idx), using the local 'dp', while
> > 'pdev_idx' is computed from the owning 'partner_dp'. As dp_pdevs[] is
> > indexed per ath12k_dp, this picks the wrong pdev when the REO exception
> > descriptor was sourced by a partner device in a multi-device group.
> >=20
> > The error is currently masked by the drop condition that only processes
> > same-device fragments (partner_dp->device_id =3D=3D dp->device_id), but=
 it
> > is still incorrect and would misbehave as soon as that restriction is
> > relaxed.
> >=20
> > Look the pdev datapath up from partner_dp, as already done in the other
> > Rx processing paths.
> >=20
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0=
_SILICONZ_UPSTREAM-3
>=20
> Tested-on is not an official upstream tag but is an ath-specific tag. The=
re
> should be a blank line separating this tag from the official tags.
>=20
> No need to repost for this, I can fix it in my tree.

ack, thx.

>=20
> > Fixes: 9e0ee04f818f ("wifi: ath12k: Refactor data path pdev struct")
>=20
> If this issue is masked then IMO we don't need to backport to LTS kernels=
 and
> hence should drop the fixes tag or add Cc: <stable+noautosel@kernel.org>

ack.

Regards,
Lorenzo

>=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/ne=
t/wireless/ath/ath12k/wifi7/dp_rx.c
> > index a32c804403e8..633cb91b9e5d 100644
> > --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> > +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> > @@ -1536,7 +1536,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_=
dp *dp, struct napi_struct *nap
> > =20
> >  		rcu_read_lock();
> > =20
> > -		dp_pdev =3D ath12k_dp_to_pdev_dp(dp, pdev_idx);
> > +		dp_pdev =3D ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
> >  		if (!dp_pdev) {
> >  			rcu_read_unlock();
> >  			continue;
> >=20
>=20

--WWNr85YoYd/pGTWO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasexKQAKCRA6cBh0uS2t
rIVxAQCaXh5SOgMv9efSXCjBSNkPEHRSHj6+sKy3Q0PmDjQjAAD/UPxa3Hl3FZPT
O4fmW6y334gp9+GmVAdxMQjYuirMEAE=
=kLwg
-----END PGP SIGNATURE-----

--WWNr85YoYd/pGTWO--

