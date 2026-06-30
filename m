Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664B5C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OYUFv598H0zTgYaTxiad7MP70D3IXkLu00sHk72TbM=; b=Df5ZY+dNnyd/kP5A2chxLdI8RD
	EKyY4fvNnHx7xGBfWzuGoQQiFL0s7USzCcaT9Iwl8KWWrjE5Pz5lluOT31xmrCyDs3Dw0kFD5jJX6
	7Xt0j96j3bYd8AbWvX0TXF1aDPdzqxFriDFlgFjtqj8lHYcQvcwR7GtudJYnn+OU9NbGRWLwR+bFs
	ypUHB31LP3H/ctLbBPHn6hFL0XYzlZ17vnScx+ueOGgZ7Cn0CU6lDlMPy9XlIY72mXDvkrZacts4Y
	12hj+9DsZU4q8Uz9VvKHjdBv/Um66Pvn7ki4FBC2KMkCRV9XqL5KEqCUZ/O8NlsZSiGikpABnz1Xf
	pWgas8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXj8-0000000H0VD-0iP0;
	Tue, 30 Jun 2026 12:38:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXj6-0000000H0Ug-0mbS
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:38:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDcK1590654
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OYUFv598H0zTgYaTxiad7MP70D3IXkLu00sHk72TbM=; b=FsbzbzUeTWSQxnA9
	kJPqCIMJUFmj4GvpwwryZIJKRcy5rbWo34809alM0V531WTuqJpuNEpnV2QoFW8p
	0cF8pj2AeiEaEq0bMOuvc6VHejiI/+nZ+nE5Xj/bi/gQvlxtt6iyZ+FdHPQDKaUc
	RfvDKEiDFS12tBKAjqsnhorkqSGubivxTg+9+TBr7Wae3oGxa/xngntKkAo78ND9
	P0nyRJYj9WlaMliHyYpbcOefCh8tgTvvLL30PONEzLfFPSXWKzI+9r67TDc3MnTD
	i6SRoiuQ71TIJGrJMbITeyjrvRBh6cj2hRCq6NOq/XEx9ENPbhxUJm8QEF/Tx6EV
	nI/wFw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3j3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:38:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693da3efd7so108782241.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823086; x=1783427886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OYUFv598H0zTgYaTxiad7MP70D3IXkLu00sHk72TbM=;
        b=AWaEs35Jm7LQIHmmPyYWsl/jc9wd5uev+YA7iWDHBykj0PwDZemRFyzgja0mJ9AEXC
         3qp57F917cT52arHpyG7Uj65WJUtCGtMXCHcNaqGpwKVvshJxp5fI9xXTRoqKqY/mIKT
         F+fuqCeBfn3Nq6tsjTysvYUU026DHhy8z3VGJH4eWxgviXDq5HDx5gmE3TIWzsMwtAeD
         2eWWfx2nhcpTgprjYeNY7Vj2Pey3eB9Fu7PuGQWzYhB9Ydh78qFJHUZ1AlTQL+O2UuNs
         fvS1nt0yr1Tp3TmRi7BkKAsuSZtrbdpX8da3jbzlJAbbr1GzQrSZOV9Xa4tlWLzS2C6B
         oEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823086; x=1783427886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OYUFv598H0zTgYaTxiad7MP70D3IXkLu00sHk72TbM=;
        b=mQkiZ89m5HoBaRMGPmT0p3cNS1Z9PkQo836Yo5fxbfxszhYal8IHAUx/9Nvf2neSr+
         PDwP6J1K/Qx+Q2UCcsa5LE4f428hAOft3IKyGZJniIzIsbG8v4/bF8KWP2PN6bTQdw8L
         jHH/RyxWwg6N3pSmXGkvxSoH6TcXXcgfbDY7UMs0+HnvKpoECNB/2yRVVJ58HQbnIrsk
         wCKzTWNHLQW+uFv/zEaKqoU7YxqUj14WU6epY5jxUyxyHp68NdDSx0Z4NHkAV7ey0eM/
         Kk5+/KgMiqAihlE3r5032Fsi8F/t6kW93b1Ttmemge17VqtuDD9srPtkiG5CC1+dRtiQ
         5aRA==
X-Forwarded-Encrypted: i=1; AHgh+RpIcC1loKBT6/sfZoZ3RlOs8DgTNhs1Em5OggRGEss3vUdxEhygSIHAj1IKnKE9lyVOBhreVnQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YySPDhTRAaoZs7D12o32OPP9qbVLHGuxGYiaodVAY3lEy/am58Q
	HD8XERcAXle4n6ov5DlbL5UzhIt+2uzidIyUuwV4Bh0u8LAncgnw3qJ3zdyjvdCkzt34PenHjJp
	0HmIqL09FqWjO52j7Yx5G3143My5j2vpk7INM+C1U9by6jndDy8u+QbPdPdTOd4Rt
X-Gm-Gg: AfdE7cml83EN6Fg/GP8y0I5l2n6bTPtAHtxx1uJCr8NJazwXS4RVtkA/UiG2BXD341T
	27Mzc7fWlIfnfXVUQbt6HNhzj78M0dV1cxKS8/C02TjejbUjYitwIOS0y5rKa26RNpKkkyW6aOY
	QhFEVQHckw6tZUgc1ucILOyJY09QcHUoTfITsBgZAlCk/e1/NYQguWS4hUrGBQe4R+eH0xGiRD6
	ehHZG3sEriHmfaKyfPO9ORUTKQMam7uIs7F4r0/++FJG7Ca2wsU5cV9YAVYKLzzfBFLlyhRGTW5
	b0OQjD/C6C24RBxn1L5SPzOV6CUcr5Nj0jx4Lpw7dNBHhOE+J9eGgN4r51kWFlkSVDEIlnfwUyS
	AR3o5iVlGda2ETvncSImjgzDxXsoWTE/Vtec=
X-Received: by 2002:a05:6102:5804:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73a3912c265mr460476137.7.1782823086348;
        Tue, 30 Jun 2026 05:38:06 -0700 (PDT)
X-Received: by 2002:a05:6102:5804:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73a3912c265mr460459137.7.1782823085760;
        Tue, 30 Jun 2026 05:38:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c95003bsm1081611a12.21.2026.06.30.05.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:38:05 -0700 (PDT)
Message-ID: <64e425ab-dddc-4221-81d3-3283e2961bea@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/14] remoteproc: qcom: Select QCOM_PAS generic
 service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-8-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-8-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX4DjQqPFFTsDg
 BWsf1t/TX87lkMTEeoRMHqXr0BE8wsGZSTespjShtSidex0fJ6lxYm0qsVUL2mKNUILf6B6lpCl
 na5XjNOG/DKFWQcILBYfb8BiQBDWZKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXzpOPr4rwZ60z
 py6fIA3vQ4Y0Gn6/1FHcpdTU1pu1G7IiXI6iSACrnWdf1f1thVAYeSeYS3tUdwFaQDBmQf2DZgn
 JU5m90uU/9S5/wLMI2Bbs0cWu8vPPI5Lv/ykktcUaL9LV1rzOJY+3h35Wxu6jrDP4ppOFUyO1hU
 0Wv/pDruEY7RuIeSpD1GaMhF4F/acWav2ewGDt0kPuB2ujyPr1EMlfn2LbvxWq9T17V83UyXFYV
 DSnbmKUs/c6PjZiuhM8wdqa2tQeXIkS4pYeA/2qtOBeyLX8iP9rYGAy6Of40H4dz4aPOiuxT8Q/
 peZJrfTOFVVEd6yDI4LPDszTMsphxFkukCccshy+CgSPryljACWnRypQMm/h+FZevrYiT/DoRf7
 ExdR1oUUf7gq20CFkoX8T2M54EvmFbkw1Fiiw5kLemwjnHtSo/tFZ6QLKC7fJbWIBFN6Atet7Qx
 yZ0l/sgvhzmcOVGzlXw==
X-Proofpoint-ORIG-GUID: cnp4a3A5mK2SmV13kMACNlqLsvsjfkOx
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b8af cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9LJ1SYc1tAtFajrMtPYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: cnp4a3A5mK2SmV13kMACNlqLsvsjfkOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053808_347342_40A2C80C 
X-CRM114-Status: GOOD (  15.12  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Select PAS generic service driver to enable support for multiple PAS
> backends like OP-TEE in addition to SCM.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c521c744e7db..65befdbfa5f7 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -210,6 +210,7 @@ config QCOM_Q6V5_MSS
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> +	select QCOM_PAS

This is a NOP, SCM already requires QCOM_PAS

>  	help
>  	  Say y here to support the Qualcomm self-authenticating modem
>  	  subsystem based on Hexagon V5. The TrustZone based system is
> @@ -230,6 +231,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> +	select QCOM_PAS

Likewise

>  	help
>  	  Say y here to support the TrustZone based Peripheral Image Loader for
>  	  the Qualcomm remote processors. This is commonly used to control
> @@ -282,7 +284,7 @@ config QCOM_WCNSS_PIL
>  	select QCOM_MDT_LOADER
>  	select QCOM_PIL_INFO
>  	select QCOM_RPROC_COMMON
> -	select QCOM_SCM
> +	select QCOM_PAS

This is OK

_however_

It leads to a situation where no back-ends can be enabled

Konrad

