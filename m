Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B173CC6B1D
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=; b=uuMyQUnbriGazoRmFZQUjDFEGw
	pjcsUbAC3hJ5f2jesuyoNTV8t7zp4YXG+QB8iWfVLRUlQJaByOwkuL39V/iIWYrPbAsEyrV1SYisu
	KOTBvT1S+XxH0s35N5GmT8sqoZGIhgCxjn0un6xLWgwCuYQV0IIQ5KpSBRCTB7Swk7QIsvPZilWdb
	w6hrE4i9Ro9XD1429v7qSgsBwnoxXRuJZARTT+4uXtgAerZWBbH0+STvzduV25KGq1MQ9Sp1j7M6g
	2S1OvFlb1bFkcSv+8GsV3AtT53K3H8T2rSczhBqf+r++XJTGG0hOiu56ALSFa3tDdodDPBwouCfJl
	ia+rZz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1ly-0000000Fy6r-2yno;
	Wed, 14 Oct 2026 16:24:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1lw-0000000Fy5m-0o3Q
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 16:24:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb065905380
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 16:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=; b=TVt1quCOhk2aJt2L
	WDTmchuxvsXQSrm6aFnTwnuNdAeUccpUmLuieI9w8wGlC5/ettWRGulXh3iRo2uV
	JH7PDqufGPJdmQ4tNxQoqfa+PADZc1XtieAy+d4s7pZe0AFpiLASqJLr5aWwcil4
	mSVl9ZoWBOr1cuhtlXX5WwH2ha7SfWcjAI0utaiq1irYwRn2muxuT9dBaYMtrziy
	cIZ/nliVPnypcI6pvmV2Oh0i9oi1Vwv6VIVcRaiM5u86fKNZY/NLjUSao+b9AKuf
	SOpafrzLnm07/pxEzoHM3Bvalj2/95ugi9vzZsp+zm9uDrWDYIk8rlUwTVlPkSc3
	JEFFEA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2hdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 16:24:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34e650cff93so738233eec.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 09:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791995042; cv=none;
        d=google.com; s=arc-20260327;
        b=O8ef0exys/ZGmm6g9gJ/CrkYDF7W8+D5b6cIw2ijnirX450Zp0EVeCcEhZqgCpOinK
         sqvFsKE/03Ngl5mym3q/Oqc5n5Ia9yU5iZ8GzehIk4lZ22yvqmr6AxBidQldm4M6hOhq
         W23al8i2niH1Qc4CQ/HBFd1zj5ijCAJd84qlkmh1TLajs3iSpH2iT5S/uBVwBMumFKeo
         epPpgj7QtsNsr5TgVHvwBr2nVycUdJ88ZfoKs1KYxVTkxxmNoVOBIrTfIRt5ythxRgJV
         GpQ3+6vtQs5bgHwuKhqhuzVMMmVDCqHhoJ9ybpUW/iW9roBR97VPiUNgrdHqRlSu90rp
         S6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        fh=8w8GpOcgqMVMVo8TEyWZsw7Zh6mj5KT0qxlyEGjHZpc=;
        b=a2LVsk/B+QkCZUtnFUs/bfCH1O3p1AA+Z+8Ux2CmTdK8YnlrLjbLM69Rwo5joCYJT1
         xO4HVCIDH6BgOtn7uFw/c+d9pEkRP7E2QAPYaZgOHUIYsKY9kRuD3CqrCJ0qqBpGAc9J
         sRs8QvtjuQG85+I2HzAKxNYB3lc44M4gHH9Z/3x+Ia+gAx0EbAm3W9QVpD8bCzWZO+bN
         Ha3C/stDdsLy/SUyEHfJRQFpz/vG3ETt/txPOWhF4KbQOzEisgEIBQ8YSoTro2ujRD6l
         vCrFUtHpG+7oFGB+CgQZ0dOnxGiK1e+Uuh+hkYDgEkwobsUMP3+s0kzVvqyv6UwxsLSc
         wENg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995042; x=1792599842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        b=a5SULRBx2ZZJfw3qVdX4TkVMhi1AujOklzwjxAfAL7awBASqssaSEGGtSX0WQ1mn9Y
         1IrqsjZ2t6jYej0nz9HPNxi+UkWEgljG5lUOt9g9fDAhJLPEsdNxmWYvwZ+ucM9qiOoT
         bpp6YwmfAWXyx3NjOyYF7dyoT0ROECGyTbxAkDV2jGdl+HmRoVvmFtvEjLzDN49BYzzN
         QzWxXHOz5a1XH5/s7hzawNdfP3QyaG1rFGVeQBVsdO5O9goRWm6LUt6RjRIGagfwwgzm
         gDH+Zoe4I8o6I4V2urLjzOKj0n2/CrrCZuDlGkKy5dB2Q4Zf6iWQhEghhFKLw0bNUF+f
         rB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995042; x=1792599842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        b=eB87mOi+g78/RiOPgs0hsw/vjBc/i7pql8DCuyuUKskeCSZsA1ROUUzy5IHP1HHgbW
         15xNA3So05mlciSTHZdW2C9PAOLH6q9gtp6gnpHkjDeyiBNTuLaRzhtByK+CaZ7Mupca
         Oqr56943M0lXF4VjHP3uQRGGp2/NgL5jpByj4oT+z3tG3ZgnniBJayiTG4P9z6JMYK0E
         AYFdESM+zCZgkUuou+pm3RdRcPKyYe2aNEW0BL7Gg7YoUoZcZEJABQ8w1tq1Y7StG/i4
         a3wyIcwjA2TT935WJNH7gFfrEGOoguNuMP/KeRQ0M4VqK5/6QsBnyZ6w++LbW0quuBSP
         Aa9A==
X-Forwarded-Encrypted: i=1; AKwUvByKx8lf+tRJgh4wNbHXGVossT7MlSGj+B7zw04iOyGPMmIHj9NgPecz6vc58PY15weGwJ5biUw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLBPcmoJYDli9xTVMn9Rg5sWbwH7vJkqeEKLcGGwpkEyUOf4KKB
	85wGQnWwg35qBe+EvOWFizh+HQnDt9yo9YMc/hb+MCaIMbvmZbJLRzfrL+uiTYUeCBNAx/SkWK4
	3/sz2FQo/JMV4ZoXzuB8yyL1lQXhvSB+dizrrzp2C6SP0shI5Cg/AfMwyADQ9qHYIY0J7zOC6zL
	UfzrTV36B4xYGbEFnvR/Tcc4RxNFa5t6//l/J4dQf6lPa3nH+1kA==
X-Gm-Gg: AYBFou1OvGZM+2nNV2IEGn49LDTDT7Tez1qWOMJNPlmSIa8mLE00asYDvNPZEoPdBdQ
	j6UWvTAgv4NEso2WpKkPvfjjPf4yUgrzf90SL5ligxx/DTOSWq4j9BflpKfmtw8jwFv16QKyfKl
	iF8kSNml7GhQkzO0l48sTsV4hfx4gFVjJaAbt+7FySQEnPN38WaLVY4ydNchEhqEI/dGXIzBnac
	x5IZOfkZjbS0YinQg==
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id 5a478bee46e88-3537dfdd089mr41541486eec.1.1791995041941;
        Wed, 14 Oct 2026 09:24:01 -0700 (PDT)
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id
 5a478bee46e88-3537dfdd089mr41541456eec.1.1791995041308; Wed, 14 Oct 2026
 09:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260917064825.12747-1-jtornosm@redhat.com>
In-Reply-To: <20260917064825.12747-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:53:49 +0530
X-Gm-Features: AclHuK-uImdXK88rnU2XiKtyAUjSR6pC3yRcEp_C4bR0864jreBK1-o8m4IfHpo
Message-ID: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX4fSOW8wHXRC0
 5HrEiQNZaFpK1Cyu3tZuAqsd8taTwCaQ0imiQytt1lZ4wq93dPuDXy740Fa6CAMH6/bLWXIBq9h
 qWwUEz4OM5Cq9//fPyMXY8Z6o2bu+O4=
X-Proofpoint-ORIG-GUID: 1qgt-gcpeYIgBvZhoHbIvEBrdp6GAuUo
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfaca6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=lWMnthoht6l5_8CjfcsA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfXyFQo6sqq/+DJ
 nqslfsCFgszd02M3cvBX6ZVvL0eIBx+X1Jz6cwETA80i6KhpE1lEelhteIAPh2gq941cU1QTEOS
 94Ib0k9tY9NTbl1kHfQOmvvXFkWTpBjYs2vE21UFKfuM75eIvEUbHJ/ymP5e+yxL2iiN93X/MwX
 FgUdk8lsl8h4CfwDM+j72j53HQFXJpFIlUULbhDUNmI9bmuZGt4t3/ioNSmvENDvix6xiiUpv9s
 V5ZkZzKrYjkzbS3PNcvrqeXGP4AzG0IX28E0n21mL1k8EKVzZxDqXzHqfVhy39ExLDUB4LTEUOy
 M0Q8OVPgdo63Tr8rVNuFO7hm9sn0m1jM5r/7dt0BEwj+wy2h5cnf1sLdEl+A7X1dB00bYhqiqqs
 dyTvJlpNjii97n7a5t82pB4PyTPggG86B96cc+0Cm4clT8iIvnUe4Xzygs1Lm/HFO26sxl7mYKT
 jMBIQ6nqbI7nL/LWfEA==
X-Proofpoint-GUID: 1qgt-gcpeYIgBvZhoHbIvEBrdp6GAuUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_092408_338972_54486465 
X-CRM114-Status: GOOD (  15.85  )
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

On Thu, Sep 17, 2026 at 12:18=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> This series implements custom wake_tx_queue operations for ath11k and
> ath12k drivers to prevent hardware ring overflow issues under heavy
> traffic.
>
> Without proper flow control, both drivers experience -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> Additionally, ath12k can hang under sustained high throughput. These
> issues are more commonly observed in VMs with PCIe passthrough but
> also occur on bare metal systems.
>
> The implementation follows the pattern used in the iwlwifi driver,
> adapted for ath11k/ath12k hardware ring architecture, checking
> hardware ring space before dequeuing packets from mac80211.
>
> Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
> and improved throughput under heavy traffic conditions.
>
> Jose Ignacio Tornos Martinez (4):
>   wifi: ath11k: use queue mapping for WCN6750 ring selection
>   wifi: ath11k/ath12k: remove skb parameter from get_ring_selector
>   wifi: ath11k: implement custom wake_tx_queue with flow control
>   wifi: ath12k: implement custom wake_tx_queue with flow control
>
> v7: No modification in patches 1 and 2
>     Address comments from Jeff Johnson:
>       Patch 3: Add the defensive pattern _bh in both spinlocks (ath11k)
>       Patch 4: Add the defensive pattern _bh in both spinlocks (ath12k)
> v6: https://lore.kernel.org/all/20260811172435.616200-1-jtornosm@redhat.c=
om/
> --
> 2.49.0
>

There is another series touching the same area: "[PATCH ath-next v4
0/9] wifi: ath11k: airtime queue limits, fairness and a driver TXQ
scheduler".
It looks like there are some conflicts between the two. Could you
please take a look?
>


--=20
- Tamizh.

