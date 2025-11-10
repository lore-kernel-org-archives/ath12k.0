Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C0CCF9E3
	for <ath12k@archiver.kernel.org>; Mon, 10 Nov 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGIVKCtkd5+TgO2EOjyLvoZSKjjlSH4n+OgZIdUeauY=; b=TCpl9zkRl+y+apY1TjiYght++0
	rMAnGUsebjGjFidUDUQBgLtux3LVtnYym8HCdrxNhMUptVtL8gyaW6TkcfE3TsBDQ/qG9tjwxpFUt
	bANh8rme/BbKdvmO/Cex+Ruw1uKllsdQub+Y90TzNEttHkeBibh+8PeUDZ3lFRbqomOBEWdxyrcgE
	Hyp8VQXJxOJDSTAixEhg0hqUz7YshRuxbA/m2TaB/Zu+ix0te3pDtQVFzEjd5VIvnlSpjaNTPPEwD
	HRTlfpHkfRN+SIVflLjV3o+wSpQ02Gl7Q9SwNDoVeWgr331ItqbeHA+Yl8ON1ypa6WYasiDajMvKS
	ZIVs6CAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPX1-00000005FWl-0sXn;
	Mon, 10 Nov 2025 10:53:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPWy-00000005FWD-41Xy
	for ath12k@lists.infradead.org;
	Mon, 10 Nov 2025 10:53:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA6SJIv2407314
	for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGIVKCtkd5+TgO2EOjyLvoZSKjjlSH4n+OgZIdUeauY=; b=AKNEoOtAx5N8ZnBA
	pYinSGfmGLnXzzNgX+o+tbFs7CcVhYIsixXsaf0tSU+cKcpiIPh42FQLFxAK9czB
	2j7s0/3AbprdlF4O/2THSZJA5+g5CSwYG85cdBvBXebVf3iDFbC/3PmEgT102oFE
	DdyiF6qas/shx+8l3+NAbFtLcaPF05LPkBxmWmRGDbv0Fs84s8JX2Gs9kDvlGNO3
	G9L7HusOvJwpqGOMq3h+Q/bMbmuQ11kzKD3xN8cnQcLut6YUAmR9GpANy3AbZiKX
	lyA1vRLgBq7KlWOvq5c/1IphD+LcvcNBuNRpOcXA+CNVKcptZgn9xq8PW+8KI/yV
	n4dgPw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd8u47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 10:53:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ceeea4addso2674317a12.1
        for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 02:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762772031; x=1763376831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGIVKCtkd5+TgO2EOjyLvoZSKjjlSH4n+OgZIdUeauY=;
        b=QMXbgs77/zx3upSKfF7ymPwzf8ezpNXPHbs3O9ZJJE7bSCHkpgOEvv26v5Eet7pDXB
         xBWXPqGPoP0QogbFEj0p5D3Iw8vYAjT7/fS5UqWV95mYMwVqBu+kDbVPziA9/WQqHwnm
         fY14+PmyQP+PLVMI+6yzce3Z+k7XXAAXHOO/38bn203awoOCh7ROFoa5V5YfuizGl2WT
         107F6RuUN+0TKLKR8t1nNDZdnf7FLUZbXnDZMInZYVkIB/4sCAx1tWiOAGd9NDkXbWxb
         osPp98Rr9oq/YNy38IObaxM9Kuy0sJa07oHVZ4hGAi0+/ZVaxTwCAvQpapvjeUPBfK6M
         IbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772031; x=1763376831;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGIVKCtkd5+TgO2EOjyLvoZSKjjlSH4n+OgZIdUeauY=;
        b=loIj/vUqEw93oPN1ly7Rcz1+KDS6lc+MB1beMqEP54haDt8Nik3O9XNLsDkV9qF272
         Lu4sEa5BCeAkY3WQeCbCbNITCwQDSdsOXKhXRyGDXGNMudBCbd/BvPwsMd4cHAUYTXPN
         jM+myLHH6DJEiSxW39hPceXLL5R0gxWdeEoMwC4OoxXo6tjYpDPl5WTasl47xfocAw/Z
         ySq/zuLUiRGVLZaFWNgWaQYQ/ApOXejJg/qM75O1+Kj0kvTaBLjQ3PmWd5/rMltw9dEz
         RT5FDhd8o57jI1Wryk57u8ngciDMVwxAWxRNbBVG3r0PZ2JSvC5LrK9IttPaeXOcwa64
         xrdw==
X-Forwarded-Encrypted: i=1; AJvYcCXOZ+Jf3J1gl9vyPk8ATLBtyEUe/AwXYr+v7OyW+aMIxFngIP3k+l/3W26vnszr/ai+bGG5SVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuGzMoxN9O52sH57/t1b0HmxdMQdyqL2VOrZhsCOpvSNTvZ0px
	mJW748j1Jsuiw9CPqMwPyugn4B7Vyh5j069yWiX4TDP3OTXtbwYex6vbWUHlw0nAQ03S+Ri/m3j
	yF7WnWDrenL3DfpvBbA2BKodqf71c52xTpMPl22Shi/J0Fwf2WNafdPoFO12zqLKU
X-Gm-Gg: ASbGncvah6/TDjR24hpc2EIBiAn3Ex9+Rq8PXblX3zdjlczfi0LcEvvPZGa/ayolhgI
	TeG0vyW9gdzFqjLpDavIdUEwWv9DD7h8FzugG9JLQEu5JGDjsbNT+Kppr7JrO8wM/aP0ohBjyko
	AuJF6XTN6SmueTFExlwN61Zb9J2AQ+P9H0Lgw+kyQq/d6pNWmgfLuZ4OkinzYYc+FAWKS7CXi6H
	I9Y51cF3aoiuXBtzp0GRVcUR7jHVotcguubGB70DD4JwhcsAU4oQRyXTs1sBzr05yOisfRTLl9h
	pAh6sKoAF8q7/+j4s46Gwq66c/3v3wG0EwvwKIhOco6Af0b3C/BHnXFu/HWY04u3c8mgJ+ShCe7
	vpajwX5DRZ9tcScmjb69NDUQ0P/4o7gPXQbuaF9E7tcRk0grbm5F/x/2UdIhaUL5I+OmhC13n
X-Received: by 2002:a05:6a20:e212:b0:348:9a99:6253 with SMTP id adf61e73a8af0-353a4889417mr11462892637.57.1762772031276;
        Mon, 10 Nov 2025 02:53:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa2+pH+Rh26j1XxO3SdWrVYTIgR1EIaeW3dBI7YcjikfVT8b3au1DzplTC0IVSxKeysCmVJA==
X-Received: by 2002:a05:6a20:e212:b0:348:9a99:6253 with SMTP id adf61e73a8af0-353a4889417mr11462865637.57.1762772030805;
        Mon, 10 Nov 2025 02:53:50 -0800 (PST)
Received: from [10.133.33.216] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8d7ee8bsm12229893a12.8.2025.11.10.02.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:53:50 -0800 (PST)
Message-ID: <300a2ebf-21e1-4b34-9ddb-bbf1f8e288e7@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:53:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/12] wifi: ath12k: Remove the Wi-Fi 7 header
 inclusions in common code
To: Alok Singh <quic_aloksing@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wgTtBJ4fLFbPndYfmIkLFr_UOPUCT5Zn
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6911c43f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rApeeKJKgo9SdP4gWbgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: wgTtBJ4fLFbPndYfmIkLFr_UOPUCT5Zn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5NSBTYWx0ZWRfX8b6zP5wTx4MD
 qtEkRLKsYKmbkXf5rcnWWLk1udfQfgT1ZaJY66Wa+bia51mBJk9GaLnpyy2f6CITXrdUsKtaBW+
 IO58mU2+5fM87peGsORg/fvWLgvIuPv4Btn6K2jSRxygErCilbhY5irQyaNZ5J79aEG7ibWfAyA
 orzORS9Aa9/no1XLf9jb+cjIKWDEqXUoXCBqDRi7ALqiqZ/9+wU5bANrBDRbzALch/yDBdUvQOb
 S+ebQNlLvMefd+eKsgppx4MVVhRUjVvY3NjVjHaXUnc5BYJ6IDmTOn9gCGv4IsQ2cb+MhGaeCGi
 DZNKwLN4bON/DIkVh1HmfoKUt/bjfnC93UzswlDu8sRgcTxzzooK/BaFKkdVU1LMuiUUd1sfx+5
 uP6/L+W8nCKKutiiTh4h5SGsEsEppA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_025353_004781_4C6D40D6 
X-CRM114-Status: GOOD (  16.12  )
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



On 11/10/2025 6:37 PM, Alok Singh wrote:
> Idea here is to Remove the Wi-Fi 7 header inclusions in common code
> As a precursor to the movement of Wi-Fi 7 specific .c files to
> ath12k_wifi7.ko module, Remove all Wi-Fi 7 header inclusions (`wifi7/*.h`)
> from the common `drivers/net/wireless/ath/ath12k/dp_mon.c`.
> The common monitor functions now compile solely against the core
> ath12k headers and remain part of the `ath12k.ko` module.
> Move Wi-Fi 7 specific monitor implementations to a new
> `drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c`.
> This file is built into the `ath12k_wifi7.ko` module.
> 
> This patch series refactors the ath12k monitor functionalities
> into common and Wi-Fi 7 specific code.
> 
> The series includes the following changes:
> 
> - Patches 1-11 move various monitor mode processing functions from the
>   common ath12k driver to the Wi-Fi 7.
> 
> - Patch 12 removes the Wi-Fi 7 header dependencies from the main driver,
>   completing the separation of concerns.
> 
> Alok Singh (12):
>   wifi: ath12k: Move monitor ring processing to Wi-Fi 7 module
>   wifi: ath12k: Move monitor status processing to Wi-Fi 7 module
>   wifi: ath12k: Move MPDU pop functionality to Wi-Fi 7 module
>   wifi: ath12k: Move RX status TLV parsing to Wi-Fi 7 module
>   wifi: ath12k: Move TX monitor functionality to Wi-Fi 7 module
>   wifi: ath12k: Move HT/VHT SIG processing to Wi-Fi 7 module
>   wifi: ath12k: Move HE SIG processing to Wi-Fi 7 module
>   wifi: ath12k: Move EHT SIG processing to Wi-Fi 7 module
>   wifi: ath12k: Move remaining SIG TLV parsing to Wi-Fi 7 module
>   wifi: ath12k: Move MU user processing to Wi-Fi 7 module
>   wifi: ath12k: Move MSDU END TLV processing to Wi-Fi 7 module
>   wifi: ath12k: Remove Wi-Fi 7 header dependencies from common ath12k
>     module
> 
>  drivers/net/wireless/ath/ath12k/dp_mon.c      | 3474 +----------------
>  drivers/net/wireless/ath/ath12k/dp_mon.h      |   62 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |    9 +
>  drivers/net/wireless/ath/ath12k/hal.c         |    2 +
>  drivers/net/wireless/ath/ath12k/hal.h         |   33 +
>  .../net/wireless/ath/ath12k/wifi7/Makefile    |    1 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c    |   16 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.h    |    1 +
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 3354 ++++++++++++++++
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.h    |   23 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |   19 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   11 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_desc.h  |   19 -
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   15 -
>  14 files changed, 3570 insertions(+), 3469 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.h
> 
> 
> base-commit: f87034a7576f918f2e60a14f17185b492e91580d

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

