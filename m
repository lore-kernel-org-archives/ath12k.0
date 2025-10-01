Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EF1CAC5BB
	for <ath12k@archiver.kernel.org>; Wed,  1 Oct 2025 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq3bI3bnAI0F0KcNdtZCeKselMxl0pas0NBl//93cBU=; b=3dXVSBJuCua51ByeseTS3JA5K0
	oZJ9/fHvRGeHhA/Zin5XrZpzDfhPda8tvfQys6bTehPeYGs7xHg9TW65woGARK8rVxFdLB9es1GwL
	nc9Ob3ui9FDzUjzOdwk9YzDMNfcYvuHUkAURmCzDTUIkUG1q7+SpA662XH7J8eze5kRhRvv/M/ur2
	o45bL0PPvmyn0tHyAl8Yg9fEnqJowVDgFmOaGAMk2wWk4TCurzk+8aFJRakLBUMZTeQwnX9hLnu5r
	wL7FbnGhcUx7dECRCHPXvVN7yNKsEUNASGWm9iFUtQVq4MiZ5m4bMDx+iosaWLi8X7zcgfyJvDp60
	GZTCr/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zkn-00000008WwF-1vwq;
	Wed, 01 Oct 2025 16:32:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zkl-00000008Wvv-3KE7
	for ath12k@lists.infradead.org;
	Wed, 01 Oct 2025 16:32:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59199ZHF030612
	for <ath12k@lists.infradead.org>; Wed, 1 Oct 2025 16:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sq3bI3bnAI0F0KcNdtZCeKselMxl0pas0NBl//93cBU=; b=HlxQBG1xWoGfSarH
	c6C0yVT0cjMyIhzg3HmcGjPrN0gAMlKfnh6B3p5LsUTH5c19E+FewaYpKoLmBLZz
	ADwcnQEg12gLcXV0w7FVGA3ANDRCJMfoE5nAqI1+ytOfVC/T/pESE2NKBRkgOH5t
	SWUOLVSywweasnaFqJOo2GB3CxAks9LUCdJs9ghxiiAMlogEgabv2WytD8PcM4xM
	qxtRtimROkc+X/t7oBOlwhuDyGwvFqhcBO0UwcObNbU+JOZu5UmrOiXW/6HKYjFP
	nxLB003I0igNvFAUM2Cqg+gWb9t7JJkEZSNtvG1PXYf6VSlRFrVRQrNdfQl8nO0a
	VxDI1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdn0mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Oct 2025 16:32:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78105c10afdso102712b3a.1
        for <ath12k@lists.infradead.org>; Wed, 01 Oct 2025 09:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759336349; x=1759941149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq3bI3bnAI0F0KcNdtZCeKselMxl0pas0NBl//93cBU=;
        b=PxPVMlSNZh/xcgeo6rZCQufsOBmCrMRFmDESNOgenRWMUzdDCXOWOHJJ1KL+cUloX4
         NUut9EoxtxRp7rz9Y32a20IJ4JEnyWCUmhBsb2qME+jCNQJq+n2C6B9Z3/rJhCCzYsLz
         lOcwr673TegNIQDqjH6pPrDV2HkahJNEwSAcyWERpTdjAxDyMaEoVsQgXFHqdO/8ParK
         fNPmOH1AqTKKmhOQzAQLAfqzspiPAvdlhki+z7z8ECB0Ya9ew9sxsObvR0mhpmJn/D69
         jxhz9QuiWNYYvoOcjtPYhGgRVPeqcgcANeXklhlioxYGOqkoZVOc7kKLcYmTrUi/JZ0I
         QPuw==
X-Forwarded-Encrypted: i=1; AJvYcCXb4wRFEBB/oproMjyJGHlhWdsa50C/eHMxYkVOTaYQJVNrDYU+vrmoNURxD5mhX7Xig1w/bWY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTZtY8Jj5nNjha3uv9vIkCLWzGNXgtEX12mu5YDwbGEZvA8p79
	CoygSNwfNFO+fF26XjYR7QyUoRhhLr4mzv9NbDeue3woZKRAcgsxCNDqEzyC/nV7vbrY0U+icqw
	9SJdzvMmoLfAjJ0FdnXvvgwc5tHuY/NHEI1MAQX9suUcRb33FKdBS5dGiatsK11k0
X-Gm-Gg: ASbGncszQw5dBZfD6FN0E2Xus9RIIpqLj0qN+P6vsR5Xl7CmYFtqIJMPlat9lBKsS0z
	X499PLcTnPJiP1GKQYRgSXKcFItJdRbF8POZMm01E3JnSdvXDbhQnDkCqX9BETaPjaa4WqgyJHj
	VDYQ9OBKwzMvzW2c7N/OJQ0D4ONiLUPw1/b3XP+42N4vQDm4YHiAeVGz04kf2W7fzPa1fL/e71x
	g1mtONH/e1Ria7VlnaXbfji+nPmZHIBcKwR/EfWhZJm9q0KnTfgCrXArJ9rQJh9Y+MXEpZgrRqj
	EwtjYa/Xt5qRH2A8Rv601IH2xdzPi9Ijs8QifroUREzdfmAy4wvGSEi8dOBVdS9v1SGqTJEjqJa
	5KgN/OWfn5Rp/oY+qafMyECnKZ6HqZg==
X-Received: by 2002:a05:6a21:1645:b0:2c6:85b9:1df5 with SMTP id adf61e73a8af0-321d7f8c217mr5569344637.3.1759336349091;
        Wed, 01 Oct 2025 09:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8dj5I/wgnCHEUwIrlmavy3IBtxPahhF1d2AkF2je+VmrdEnfr7CMRxr+KnTT3Pfpg9O2pHA==
X-Received: by 2002:a05:6a21:1645:b0:2c6:85b9:1df5 with SMTP id adf61e73a8af0-321d7f8c217mr5569280637.3.1759336348563;
        Wed, 01 Oct 2025 09:32:28 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm166699b3a.13.2025.10.01.09.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 09:32:28 -0700 (PDT)
Message-ID: <b3c4ab9c-317c-4b68-b00a-d91c1d47b0d6@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 09:32:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 1/2] wifi: ath12k: Refactor data path pdev
 struct
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250930181848.3386271-1-quic_rdeuri@quicinc.com>
 <20250930181848.3386271-2-quic_rdeuri@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250930181848.3386271-2-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2TZ9fQahoVGzbuNUZYQEZoiX9e0tgpkS
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dd579e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=JQCij2u2zznS4gFo3ywA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 2TZ9fQahoVGzbuNUZYQEZoiX9e0tgpkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXxJ7Ikg/nuoqS
 Vm+N3gr7r9ufJgky5W16qgZ7uMyu6olGPBImv33o5k+OHARddITKYznzlyedjkDhObX+KkvpQpt
 tL2VgBZv1qihrNRT2FODD9Jeh/qx21KbReW0wzLWCgy2HldPAAQQmDCDrpv9+Xy/mPyNy8yC9Af
 sIZSrki7Dh54HcRlDZdauKJYaoftCu+yFgpmFBmSxnbUmyonbGXS8MW+LIdTaekEg4F7eNpUm0l
 x2Sj+YbQ0j/AV8n33nM3ihMhdJJMjPCM1P0N+lcW/SWihVWmiuDNKy2LBJKAcPFCqThZmKlA2Bd
 /n0s8s9FmsthN3djn9sgo1TbKdDZx5XOuoXNNYzjncarLg20O5bg9jDTztC3GVRrSAj0LnS7T4R
 vmy8piy8zWDlcOR9lRHdExv5YR/2cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_093231_838013_4EE650DC 
X-CRM114-Status: GOOD (  11.26  )
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

On 9/30/2025 11:18 AM, Ripan Deuri wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 1bca998117b7..98af9a17dea2 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
...> +struct ath12k *ath12k_pdev_dp_to_ar(struct ath12k_pdev_dp *dp)
> +{
> +	return container_of(dp, struct ath12k, dp);
> +}

> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index 546f73e46c41..084e0a3c1bbb 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
...> +struct ath12k *ath12k_pdev_dp_to_ar(struct ath12k_pdev_dp *dp);

is there a reason this isn't a static inline?

the implementation is trivial and this seems like an example where inlining
would always produce a "better" executable.

/jeff

