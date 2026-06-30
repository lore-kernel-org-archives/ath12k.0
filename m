Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1C3C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+0Tx25hFjaHzRNkLyNtbTDFfSp/eulHhiy7NQz4/zY=; b=Fnd5i+mZmrTNsf5Y/63lNv+RJO
	xvGYzpjSb5wA2TTZZNklxHZuT6i2VdgUB3ojT/eURWloith3KcipL9J53XsWkWM1hhO3u99cMvFB9
	7jfmUXnztivQmECLEBmerNp0bda2pUQqbCch2F11HCFTm8jDfSPuwyEVHgXjVETBT6sBQWw4LjP7e
	9yFmzD2KOGcg6LpXDiY4nHl1uCyTlLj/YIyOq7WwO+VMf/imJy9HSduajpYkg1NLbZRtRGhtDeEBl
	eriScLzXuaZU8L7Vpyjkbop1w9TCEpzCc63PT69Km/XygVb+VTavpyxRg4K8NAT7jhJQwwgwW5XIO
	QDYego4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXkG-0000000H0dg-1KpF;
	Tue, 30 Jun 2026 12:39:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXkD-0000000H0dJ-3QTu
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:39:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mt6S1602688
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+0Tx25hFjaHzRNkLyNtbTDFfSp/eulHhiy7NQz4/zY=; b=AhXU0K1Nf3o7hIe+
	5inixK4SQz3a7GOF0doOZ3d6lGTX1peoFk/Aw/reVBsilnEOhcwnvUjGsNKN6LVW
	9/lg2AKYC/dxUOAWlYYde2OXi/nx8t2gZTtwdSPUjxTdf1ss+aoz1+zTdS9KFAVl
	15opLDPFxXbGqx5SoxixFqiXBaDN9ybNSUZRGvAhhYGwA1A6bnDz3ZIaH87H52s+
	iRBjEBUyl4nR5vfV1EvLwnokHifuTBtoeCohE+9HHBHXRBfy/KlvGBbUUkv2co+h
	madwEOSh2PZidgsAnJFI3cjXgtH9DhRdrOUy2IDykIFTaePdIf21edNObcStvN3E
	mAYgmA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprwvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:39:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7392d893428so165858137.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823156; x=1783427956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+0Tx25hFjaHzRNkLyNtbTDFfSp/eulHhiy7NQz4/zY=;
        b=f2XuJAxsQq3ayyULYBGsMYTuGvrVo+oPmKNwzgaLp8qnbpfZ/sUv5otmLlL19723r+
         INrlrl5hTe9z7XZQ7hxh0pUNicidEg7lQCMcIKPipdmZ53IR8O5pKh6eteSlpZRT9dgG
         ctEtacSwhLwSTC0S2ISm9xbxbEShoYUXgjdQbTV2RpM2uTAE25NADJVY9goqCvVSDNxa
         GwiKla0T5TKvsi57KwXdL0JNerTHc8uVHsnfZAwq6MKP280K4o3IIfwnWZIu0mxnPccZ
         +VRLqbdJb13/BP3H7SBkeY+fiYtkxbnkpLNjPVNuAEevK6O3HfqqlyxNtaom3KoDlEkF
         NqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823156; x=1783427956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+0Tx25hFjaHzRNkLyNtbTDFfSp/eulHhiy7NQz4/zY=;
        b=cJoWfLW+kuM3ep0EFRlTSUeS9yTHyDMmdyJEgyjpfdeZ7YYKAFvDBfvcJsnwFlcDlA
         uS7LPrCJk9grf27RaqniBMGZ641WndtPzL0LS2vGoNMR7CZR4drMqOS1AIMnqZG7cYWh
         isPNUghCw9M+dR3ogOY8e4+ond0GVsOEVTUzXPbXWhSA4alodvo6QQdcxNHJPCcQadjj
         4xMDJYz6kpyWWV9VP11edX2gnXI8Mu62c0PVePlSEJgDrND4NBqp+OAwSgRYfZ9/xsZd
         Ll3wkyZ2YQNisy9sNDRzFMrghxQIggCDuTFyC5O2EFDxaixBOv1xFDu4Zev82murHp20
         8nsw==
X-Forwarded-Encrypted: i=1; AHgh+RpscetDr0nrQ5YdYdH1YF8jeYAanTdJxP3dvzjYGuEXjpLE6L85CUSgz9TC/5bMLeuHNmOdM+Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgRWvzyvzrBkk+EopgY7SGKxECPhhsm+MI1Gh1zsw0IOFK/OJD
	1oH41MKHbwHRK96zVWTP7IhI6oIJvsh/k/Y5q/HVX++EbUh6ia8B7/Aa8ZcGcQ97MWpUQbLALaJ
	fQpcVfbDLJRDZ73HcA8klO16qiu4dUqOraDNgUjR2uN/L8Vkvr6BeiDTk4RpUIpbi
X-Gm-Gg: AfdE7clxaKbrmc2RjaW6cFK8WJIllMkl4vRciRO9OtTrEUzuZXIjLIDX4tU9hKmCoyI
	/QldB2PDYaegnWbIcCpkaYrJhyc1pQkZA1x+SllpMZgCDI75HMfHh+X70Kk2vg2gsueOuTdcv1V
	lhJ4vVneceUU/r4XJzzLTkgnUtNffVjDPBeYuN6VhERPMDqaRwRSXyadMW9w8YGUdcaJPlXcjj+
	5SGvv9TNB4CfPOHofRKVSD+SBSpQHsqazgbRtJGlbCmoQxP0oQsKaA5aK2LegVJUbAgPfzclozz
	sNZP1xgzRiLGkBAX8qwUpEEelrWO8dq2s2iU8+J5Atp/x27cjARboOG3+0zpJM6Pox9VK4COa3V
	LJ8kCQ/IVekLFyj1n0WZNBbvDMbgueHXfWVg=
X-Received: by 2002:a05:6102:6886:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-73a333ba5c0mr489618137.0.1782823155807;
        Tue, 30 Jun 2026 05:39:15 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-73a333ba5c0mr489583137.0.1782823155407;
        Tue, 30 Jun 2026 05:39:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3bc5sm1155708a12.5.2026.06.30.05.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:39:14 -0700 (PDT)
Message-ID: <f849f648-6891-4e51-89e6-dc803d07ee16@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/14] drm/msm: Switch to generic PAS TZ APIs
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-9-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-9-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VBHKgi64bY1Hv_84ETTmrVKL6c7s8TPp
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43b8f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=E6O5LMYzsyQa2pg2XTQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXyOuVQ1i5FGl8
 +nDG7eZPOOBXcvXU332DoH47cFxa/4J2O1t//549Wm50e7c3Nionc2PYzNnfRwUVIdjqWwZ837m
 4gIV1a5rS4y3BTXhwAqOzuKIyeLuIF5ZhUvqLr9dlZJCOXI6cxm82nUrN2e6K8Z8ywKcA8jwI5Z
 6BfleLtqd8L9oM1Jfy+Y2LlwVkGqBQjfRGit4ipB8ZRCgWv49ud+viZyfshFGQ4r5AKl4fiO9hw
 7JataFqS0/7HoUolQhyhy8Q2hrO3i8vn87cs2Kokc32fLKtidZ2jsdEEi5lAwDPWHHeG+GVBH6G
 e++imyvGSROeSEQ7PBv0yXlK4EbaYTxs7O4wqiiEjl2dTDTxhtrODt9D94MhCI5vFwfbi6sYqDq
 02mvSs0NCCbSV6u3Kt1H/BLTNyUVnQgRFN6ZrqCHUH4T63rJywXzij6ayabWpOz58+Gyqsq+kNY
 tzNcyqflKRpUIcZjjDQ==
X-Proofpoint-ORIG-GUID: VBHKgi64bY1Hv_84ETTmrVKL6c7s8TPp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX1czeeR0onxd4
 U1uMC4Vj4kqLF2LxxepKtoqIqLpmzOz4dcJo9B75tvsKVQT2k5vIf2uZB2MG1QYD+givcoBxKVu
 My39QhaPkbmsPNagew4yg7jH82H8CtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053917_979320_420ACA55 
X-CRM114-Status: GOOD (  17.31  )
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
> Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig             |  1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 250246f81ea9..09469d56513b 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -21,6 +21,7 @@ config DRM_MSM
>  	select SHMEM
>  	select TMPFS
>  	select QCOM_SCM
> +	select QCOM_PAS

NOP change

[...]

> -	/* We need SCM to be able to load the firmware */
> -	if (!qcom_scm_is_available()) {
> -		DRM_DEV_ERROR(&pdev->dev, "SCM is not available\n");
> +	/* We need PAS to be able to load the firmware */
> +	if (!qcom_pas_is_available()) {
> +		DRM_DEV_ERROR(&pdev->dev, "Qcom PAS is not available\n");

Just "PAS", drop the "Qcom"

Konrad

