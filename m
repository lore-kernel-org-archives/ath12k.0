Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A06C106FD82
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 06:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=; b=Ywyr3xSslzQfTqxNTmJZnd0xBj
	ds1yrDQTXemZsUZJJLCFU+8bdJAH7HKMUe/vNCMGMl2qhyyWIbtIveHZct6g4YhtLYrLGxL50WcEf
	308n1qyTlLcjifD1mevC4G8L1yh8BGwmhrocpeCrnRAcKpKTCTQaovgV05B+ZWENZEBPsRItukcsh
	/+lPJ51gFfT+BWS76C5V37zCqQOWFcTIXy0XipTO8L0bR8ILtxX3ZlswFVXB27uHIq8ZBLSQDxwMn
	2xmAhkkemgahZJmV773a1RYh2/4LrG6D84Jr4oAQdonuepPr+CJnhY5piNkiRPe9zVDQPcaXloBHW
	Yk4rzEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ve6-0000000GjIg-2wRU;
	Fri, 13 Mar 2026 06:05:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ve3-0000000GjH3-3Hxe
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 06:05:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbPN070440
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 06:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zeM7gmRvWE3zPnFK+DBIUx8d
	4QuC9ACWMKfdIK3rw1I=; b=QJfMvUBqwcfY9u+taSrVQqTd80hEJj12tOwH5Q9j
	xaX9k0s8mlDbhIGsyeV7Sv2muOCdElzAqOAi1FkgvuzsypAnc9KVBF/OhZbRfuI0
	eP3/swrWAVVyoStb5e+YPt30JEOc7NG6psZJycX4CZ0mekZSKIfbVV2E1p5/Ff1p
	UXQnYl2ePnKSwUKn85QTF0fvIYjitY+MK2kohDZ7/b+AXxSNk2IYy0TqJGFJTwzA
	PuKJfdmvTc5N2rmnW1mvZXsxdjvfMVtx5kAOry1BM8k/Jy/nrsUlXLxe3dy8zJDP
	OluuQkZYpex1FDmbDCQwjYuzgihFZk+Hwmeljq/GFawn8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymqhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 06:05:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec3f67844so13251775ad.3
        for <ath12k@lists.infradead.org>; Thu, 12 Mar 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773381909; x=1773986709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=;
        b=Opf94HYG4AfdidHupW/gRFwoK+MhtuswmIqGMdBxXPUJ8qDuuhLpkUUzK7rBJkPwz+
         9ZHEECrVYhOSlLhnQbcGB+olggRDixYBdVsbyOuJ7+BAJM8RL+3TjAVP97/DzXMs165T
         jnAPbHnvaNPIjVUFQBBsOWJr0p+LOcEf1LLxuELDyxf0VMTUsuFy2Jo+HlG9HJhyUo5t
         OcoNc7XmTIT89c5C+MJrbfjKYZYIeSgn0c+MO6hWSaCIP35Jv9Sv3OUy6DkDI79c5Qtc
         WnYZ5Gsgvv2dMw1G4StrywN8NQ1ZTEz6q1XMTfJo/+1CKQCSTnFuxkMEeXrvBZ3vzjsi
         1PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773381909; x=1773986709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=;
        b=eNOVIlNNvgx64n/D5LypJJ7CrM13fihteBZsSGnIgguAiKHuP5ILl5xSy3rfCusHK1
         wi9kjLgYF36yXORw+7OkvqcpjBukVwiB6M5HTIEvtUYNGoNnn3++oo5YmfFz3eSBJ52i
         BoqXYCZOKEq9thpBnkOFMiCt9NfpHRQ4nBt0H0BDfr7/P3VAiOsw7p4EdMDMK41Lj6jQ
         vQNNr4xycdfKlMdNBYFbit+kb8MqO8G7NJ+MWp/kEGHcyedNuPaY8Nnd7owRFlF70vDu
         zWnc7LEzT41FDoiKGNy+tRc+QFLcZs6CSfSWBwPPk2tRb5ydyPsxvLO700x6ep4WDsoT
         MfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXog9AmJ5NPIq0g1E0/1Q2pXm93++9otd+OrTWVUQ3exNMpI58woKnZXech99apxut0NQQYLd0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy84vXJodFC5Eh/FFSG/x3CdZciZaPwRhmbzqawE37nL977Pi0E
	1ylfcsZ+aR9RsoRjt4e2KV3dkBRaVYzct8QS98q8ZA62tULtYodt8nx3tEh0sTpNLGfNZq9ppGe
	990WBV/3hHiDewtugaVVCiGHnEWbRKioQeWDT0vSvrzLziuUS5r/ZSFjH1yrxDUqp
X-Gm-Gg: ATEYQzyQK+Jt+mLgAJYn6rEvTBwxOjPjV2nT3ddwcjRhAV3KTWDfmb+Z2tLD0s58aJP
	q1R8pxI6O3Y4pKHZScAt2JUKhEcGX71Yx6B7C0IuWufudnngeNQQuEliC6ArLJBNk3LjPwO4QAn
	uTAQ/1W5AQfCJ7JUay4axrqp8n9axLvw+45UbHlpDeLR2rCmK48oEeyU5tryhSIvZe++lrm4eTM
	SmrzxHADflzlEwLVjnyJTbsbZSoLrS1mGMN7h7oObNhhCN5KszmPW2p9vEGed4MXiDAscANji0p
	h8C3FLbhy53neH9MLrOSc6ocpTwSq5hM2GEh+f8iZY5ozlJ+3XNS1agbqxOTc8A3a+91YZVDact
	XjKVrXvmifjNNfvtXF0jeey15PST3RCVYAwNISefWTy0yGjft
X-Received: by 2002:a17:902:e80c:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aecab1e86cmr19453395ad.26.1773381908506;
        Thu, 12 Mar 2026 23:05:08 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aecab1e86cmr19452995ad.26.1773381907930;
        Thu, 12 Mar 2026 23:05:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee5b1sm10183605ad.46.2026.03.12.23.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:05:07 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:34:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260313060451.hswg6snnnexchmzs@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-2-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312062756.694390-2-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0NyBTYWx0ZWRfX/4VPI9PE8O3l
 q+LUVE08DaW3KhsUS55oQiyTYQ81w/zEuYiviapilwPxYrD3jvtbdBBgVLV0Z/Vob7dj43+J1R9
 xybtv6JkcbO+IUZnRruxf+U83BCqbUB6enAxRsd4kd4/vOukgje1empM3UmWvoF3eFfRdFxS8gs
 R8nJycshovOoMxabmlQB5eUWZjA/jfFdOFGU3TGab1fqT5qj09zHEyIXY6VvMaFJGpjsxw6rD4A
 wlidajcua717Ja/OI+hUL+e9ytAJgZe6VJfd2PbTxw3uzEGcHkQ6dMiE/Wct6tCy/V8J6iYkpfM
 nCTchATEAfa8o46WN+5qM/8KGO8sdj8HYX5C5yOuHD+DTjPxfNnqyttWspxGPFxY3SpvT6LBpG6
 zry+ehdCWYLvo9qXqGUF+WnBPBDAUfUBWdFlUcZlFCOdyOfsyrW822qF/bIvew+hWgCP7bOs5Ss
 U2dmzTGHt8GEg7afpzg==
X-Proofpoint-ORIG-GUID: qqqqVvpogmQyzVEQZZZniJlf4GKxHEJK
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3a915 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D5leSQ3MSkE6s3ds0kQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qqqqVvpogmQyzVEQZZZniJlf4GKxHEJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230511_943073_2FBF27F2 
X-CRM114-Status: GOOD (  22.50  )
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

On Thu, Mar 12, 2026 at 11:57:42AM +0530, Sumit Garg wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 ++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 35 ++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..09a7f943190e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -139,6 +139,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb

We may need to add for couple of more variants..

>  
>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..0b3a69a0d765
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_wpss {
> +	iommus = <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};
> +
> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};


rb3gen2 has modem as well, did we test that as well ?

-- 
-Mukesh Ojha

