Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ECD66BBB
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=; b=V3GgiOIw/Vx8eMZUFL6ujOrbEg
	hY8brcyqCVGq5gzoqR18AhQ67zIybp2Lh2k2C9A7GdVf70R6xmaip10Xvhg7ZRM26RvJYmwD+L1yW
	T5Z/hBFMHmwrw9hgTb/HZBQh02UgU2eVIPm0kLTilKphEOllJd+s1HdTyNEpNCJH/IYPLwVFkDZL6
	jucH0p4DVlrRvvNFmn4vE/sqoXUzesXXscpUwS+WRRjmvDTFaNLd3bfusvbvwgeM83TQHrIqL0ndF
	sJMkWWf/6k+5jw3Kob6Yj1IlPaJUxOvYKpDffD7YMpcS9Ll82ajGc85yZKXrcsL0aTcbJnpazko7a
	54SouCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1Y4-00000007b3I-3CaA;
	Thu, 18 Dec 2025 00:07:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1Y2-00000007b2h-0p7D
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 00:07:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJBmjd020286
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 00:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=; b=XnhpDrrhKEMqop6K
	ZJxFdaUizCFjoYmS6Rm2/mPPWnuGlZYv2J9PnMpWNmwAf2HgWh8m642pU56Mfacd
	AHH0PdEGeZLU+7lun5fMhLro4ANvHO4McJst2HoGPpiAwos0qsEqqXv76EZiUDuu
	Zj0eFh4AQjjqYWOP8X6ISk+7UUNajlZZGZ3GWK7238Pi5ultBuKCgsy9ea8UpmX+
	oHlAwwB4ZQQNIGLKR61LztS2qWcWi2TBcQWxwXPokWxSL8Yi4UrULot63nwox0zY
	vBR/05yeaJnLdq2hXVu6qTL16Na3RUy8BCnU7LfreSbZsn0HFPpPGZUtIWUPfbcX
	aneM+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v78y8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 00:07:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so24852261cf.0
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 16:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766016432; x=1766621232; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=;
        b=BKPBWr4chU41xDqYO8cCM690/Gb/VbNyoiSKUfI3WQ8JLGwg2H/fXRwICpyN1H/l8d
         rZQKIHifzJ0orUdsvlXL2CROLOAvIl18nbswRrbXieoidwCEWupuXUCRqp/vimkEjUSe
         Ph1OYrnT2FWTYfGrr0N9yX4w4oxATmCCzJn+mDIopBf0BZ9CbDvRFge86DYHxRxycis/
         xzSvPDJQvzaty9PgtgUT9SUhdFOxdPArDmY/wt2I6drkrj7tQDN17OrrK6/KW/UKFNx8
         vJOR6sMwThl9DJ0pejkCxS/LdqGBmQsgTM4l13WSUEk7T+2lZybJ1rvMHHMJTcHXgJLy
         9Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766016432; x=1766621232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=;
        b=aF/lAEGRQIcvkgA5wpBdfy2B6KyKJHpE13Gyw0lpMjSNQaCnXRuBvDkrAq9gh/9XJI
         gU0PVUrmFskpmc3hxTj/ocKOBaylXg79YMrSQrozqgiplOU1DveJdwMkM5PUZm3XEaJ6
         01Lwx1EpIIa9EVq2i4JlH27hdJPqAQXjNHkj/xohsfENjbIPSRasqhWy4y5puRJQeGLQ
         7QVmsHeKC3afk9ePpLnIHE+16ibfYAjklKrtuVdU2lmSpsHYnQCRiWJhPRtgbqSooiA4
         YBYAA2kmyzUkrHmqk6/aySRqcmhgnw4q9vNjl0l5wwXlDw8xXHGBqp+pFMW7WSf1pPDN
         oJMw==
X-Forwarded-Encrypted: i=1; AJvYcCWidrXLCwCtMCFP3oc/L3y1CPceRwg0RvHL49PEaciklXuGqFrwDjGmiWWojP+qCwZcyMmYEg4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcsNC+7XGRIOT5SPUfV+EqBF/5v9dcOsVk6pDLaVPoOUw5t4rG
	L1g1LOXlc1h8ulFdwslD7Kjp/Lt0cIyrsia1rTdzr1D1kQC2q8tN79SDyXkmnLSzLhxoV1FNOi2
	ySkPbmo6jA9rKxjThFXIxNr28qSSUvjhj0Ei7ysFOebib9iA1+t/YcupxqMK/Yqja
X-Gm-Gg: AY/fxX4OAdijFzPbDBMNLkMPM/WJSoFJ73xPNje/WRcfrg8W0tVkqsoGIfb5J+yDCVj
	pveUIYHTbTOxTTm3u8rtBuWAg/FgRFJmPTsZBF++VLuDyQ36337TROnn61aj2RU6tklxhDAx3ND
	mFKfCHrHoZ56a5gaXOGi6krFcy4UKu7v4iYbaaSlyaQUYJ7bD/vHzBwirV1Rzvrj3cX7PSizxxm
	9pUgo3WY+oOEl5Pj2Q93UsWq293NlW3wlLY4+WAdcCm2RZ1eTTbbYVmEA1XMP5ybeh9gp3dOTV/
	5VUqnTgfSi1IZ2Kz0GrQfKzkv5fzvv736VCxMDwAyqyqAUVkgJyGhm+x+IA4JY3xJY43AeG1+Ox
	UUujeJkMiKh9ZzUIJaK3xf9bQrVVVcJsTlxxjq30tM1wCV/OqtGpCz5A8zvRD8GpZyy1FgkYjfP
	yFDtHdMWVl2PqfmpEW0gKla1U=
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr22024501cf.21.1766016432072;
        Wed, 17 Dec 2025 16:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7r9ikBXTn9EQK+HDVKOPnuyMaSvuztty6xD+BwyGt1UHdgEs/NzHIQGQgsKy4i7SuFf+65A==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr22023971cf.21.1766016431146;
        Wed, 17 Dec 2025 16:07:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132cb5f7sm321357e87.4.2025.12.17.16.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:07:09 -0800 (PST)
Date: Thu, 18 Dec 2025 02:07:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v3 4/6] platform/surface: aggregator_registry: Add
 Surface Pro 11
Message-ID: <s45ki2ckgw7fu25h5wd6mb3mc4kzs6qq5eitv56asqf2suxh6l@s5tbqce7gz3f>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com>
X-Proofpoint-ORIG-GUID: MxR-jmkg1ZJCwaK_Ho-9Zw1c50Lm-DBv
X-Proofpoint-GUID: MxR-jmkg1ZJCwaK_Ho-9Zw1c50Lm-DBv
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=694345b0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=27tkrN_41n3i1SKUIiEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE5NCBTYWx0ZWRfX3FNk9oGM8R6Y
 2Pl5baLAf8tPAceIRVhJ6RVaDWlWS1aR1UFPCr4SQTuyfr4LA6T70DQ9p/yTYeiok5lJmfDivaG
 gHzH0HIdRzXdYKwsSsSVlcatWd6GEv+rBF6mZR/FqU0rpt8okkPcY5A6rn5FSbz0mueup8oQRwv
 j696KBlBstTTdA3QeA2rXgfF1XftOQKPLqgEifzM86IOOveCNxJ5XrBY3/wAMb5bVRUDX0uJ4E3
 u065h5HLMqxwxN+EifndXUeB71pFC7I/a/+hCkRfyG4lE13K6Y3BOwC73eZ8TVURFnnCdtPiG87
 6IYSaiX6IGfsTvRg3OorbTZMxwkD0Nn2nTG+TD48W9TmXb/yU68PeLyASu5kKptuNEntIzoBrsC
 GAADJ5029ENMMYrw1AhnFeV15Zwe7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_160714_367494_9BB996FE 
X-CRM114-Status: GOOD (  18.66  )
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

On Thu, Dec 18, 2025 at 12:56:40AM +0100, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> This enables support for the X1-based Surface Pro 11.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 78ac3a8fbb736384f7e50f1888a71297a892a7c3..c18d991afc8b0a0bbb26966351b75b8ea01097a4 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group_sp9_5g[] = {
>  	NULL,
>  };
>  
> +/* Devices for Surface Pro 11 (ARM/QCOM) */
> +static const struct software_node *ssam_node_group_sp11[] = {
> +	&ssam_node_root,
> +	&ssam_node_hub_kip,
> +	&ssam_node_bat_ac,
> +	&ssam_node_bat_main,
> +	&ssam_node_tmp_sensors,
> +	&ssam_node_hid_kip_keyboard,
> +	&ssam_node_hid_kip_penstash,
> +	&ssam_node_hid_kip_touchpad,
> +	&ssam_node_hid_kip_fwupd,
> +	&ssam_node_hid_sam_sensors,
> +	&ssam_node_kip_tablet_switch,
> +	NULL,
> +};
> +
>  /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
>  
>  static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
> @@ -485,6 +501,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
>  	/* Surface Laptop 7 */
>  	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
>  	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
> +	/* Surface Pro 11 */
> +	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },

Please keep it sorted. arcata < denali < romulus

>  	{ },
>  };
>  
> 
> -- 
> 2.47.3
> 
> 

-- 
With best wishes
Dmitry

