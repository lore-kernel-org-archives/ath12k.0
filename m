Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E7C282DE
	for <ath12k@archiver.kernel.org>; Fri, 14 Mar 2025 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rxV0cUwI7tUT4iN/+BoAqbkfW6S2hEbm1jFGV0H1G8=; b=JqaScMYBE/fMSHkS4ZK37h9xKy
	5awjeqTNE8pv/14ZphQfVjvAwhm6SXnv7G40Jy/3OA2ILcBOfRIBO3VhD/cs6jzQBmDvquEd38x6S
	Zq81eJaZZPwKmYQhYMWMnbkk0CTe3LVlOS9rV7mQXEj3FkeE6Y9xggmgERKDub581pEWUlOLF5BtP
	VrnX8WOc0Fgj3DBwgF2qEbhkCXvImMOZUoV6ZeqE8HJlrUWyddYLiEZ+EqYJHcP5EafgR+mCR1cuS
	nbUjp++2gKYkJntEdqKAgOj3ivcuUDSzXpmT9hHBadyfhD3z3ga5bfHMm13BBnmrHFKXqayoSqICz
	BExdbZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tssTA-0000000CmEw-3Tax
	for ath12k@archiver.kernel.org;
	Fri, 14 Mar 2025 00:00:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tssT8-0000000CmDt-22tV
	for ath12k@lists.infradead.org;
	Fri, 14 Mar 2025 00:00:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DMkfRj019188
	for <ath12k@lists.infradead.org>; Fri, 14 Mar 2025 00:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rxV0cUwI7tUT4iN/+BoAqbkfW6S2hEbm1jFGV0H1G8=; b=R0Gn5KLtOFZtRQO6
	JN84i2Y7t3UR4y76BU3GoEt4IDZ2yYdPUc2xoWpiIo4iODDDf+9Cb9FCgFgrpm0v
	g6nUErt3WXiNh2TtEQW4UsLSCzP0ie66e03i9l3X2MN9mDpB35f8ccMr3c8g4jMa
	Su4t/VltrvQ2xSgrTAEn/XAXUNs+APnUCt7H6T8wORErUFVhn8oAKrvXlKgQz1aI
	gBItk1ZjRWkOsgKCPMfspwioheLm03n/XrJxVrOIg9VM39w+bsHn0l6Czl4So6vD
	EsvXR9Pg4iHHg3TrFcVagQ7F5FMkObU/3hKcX9pUJatXyFuZ/XrF8Vhs8Lqu9dnz
	HUT8Sg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nyhv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Mar 2025 00:00:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2233b764fc8so26686775ad.3
        for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 17:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741910399; x=1742515199;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rxV0cUwI7tUT4iN/+BoAqbkfW6S2hEbm1jFGV0H1G8=;
        b=l1DtJ8FAPm5LInwsEf9pr+C5pXiFV0NDknHjQ9mVn5eqec1MzQ+frPKL/gjmsYxuAC
         L0X5U8Aun1k/Bkao+rIG8SCOihENQMmlh8YxEz5uy6gBW7Q97zs/JMyU20pbxesPsZYV
         9J5CtP8h2OH+Yf4MthqbHSajjrRzlbhuWyGnqMCtd3Pvi3rC1ruMA/DScV3NX63fBOzF
         Gppo4i12pA2ZUL/dkoIhzlOhMv2FCHShtAoihtX20H7M/lcaRMsIZAGXJjw3+NKsOceY
         gkHl+OrJImavbZdHUk+MNbrqz2Y6pLkR+WVkcJHEpfKJXL1gyQ/DxW5l1fQWj/Ng53SX
         ERkA==
X-Forwarded-Encrypted: i=1; AJvYcCXu4eMZkHqe7HKURlXcjDsOfwfnN0h9M9TJT5HAUpoZRpBdmmDb0BiY47QfSNn8ZSiMR35m5hQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUHvWBwOvLQddazELJ90MLeEQ6peUJ8twuJeDi+gEXs1zD6i/Y
	ubeyU1XzGnP1Ft0Qv7iUmgLKedKysLQkC3Qz9gHugTMLaMkng37QZ0Q7W/Gjk0brrAdgR6+yipB
	I9JwMi2LbBR8/x7jOXXS4lZAZwVnyaps8uM/1/3FQ5tFS9kexxFMjzdIega8C
X-Gm-Gg: ASbGncsnplwnt3x+8KSBRtBPXxNH4+zLR8hDUri3yrQBD+Z37a80alh+0fyDPhFYy2z
	ft5KaQVUTqkSkX1Z3KXCS+fbWyByHImeaqJzhDqOsNN+gmlKI8/MG7OE1SIoPdMxBjnToVmEUzT
	uoHvrZNtcAo70077JWWe6HdgiZFujgXbuNnmx91Bu5QVN3luGGPsHMWutOITit8zxXvqZ5xQBYB
	RZdcxdK6MqfHMFJMRkPDA9mkw5drjoM56qnkABATRi1XJED9jLRNoS/Qg59T+zXd33euPZO4Xdz
	MdZmCMNX7hACcw6ZiBi9m9+lqtT2zyXGKaThyxU4hYLcXKFQZeB43IUkWAi41EXFfgeFLIkIEzu
	Nu5e00iV0
X-Received: by 2002:a17:902:c949:b0:223:5945:ffd5 with SMTP id d9443c01a7336-225e0af042bmr5385815ad.32.1741910399423;
        Thu, 13 Mar 2025 16:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd5eusBp3XBT8vjASGqycG29XNPxwKAB6RDbi/shunpuWjDgRorClqQWRNNcSZI3+K1imp2g==
X-Received: by 2002:a17:902:c949:b0:223:5945:ffd5 with SMTP id d9443c01a7336-225e0af042bmr5385505ad.32.1741910398936;
        Thu, 13 Mar 2025 16:59:58 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a4219sm19483005ad.57.2025.03.13.16.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:59:58 -0700 (PDT)
Message-ID: <17e98c93-77a4-4caa-9378-bfa22b077f3a@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 16:59:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v9 13/13] wifi: ath12k: enable ath12k AHB support
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250305185501.2400888-1-quic_rajkbhag@quicinc.com>
 <20250305185501.2400888-14-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250305185501.2400888-14-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CdvMCbfoZeS-klD1__RBSi5ww6s5qa1F
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d37180 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EFA6Gn_6DS6O034KAtkA:9 a=QEXdDO2ut3YA:10
 a=McEyGMjRs-CLr1QD_1hQ:22 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CdvMCbfoZeS-klD1__RBSi5ww6s5qa1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_170006_662193_F28A13FA 
X-CRM114-Status: GOOD (  17.96  )
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

On 3/5/2025 10:55 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Currently only PCI devices are supported in Ath12k driver. Refactor
> Ath12k module_init and module_exit to include Ath12k AHB support.
> 
> Add Ath12k AHB support in Kconfig with dependency on Remoteproc
> driver. Ath12k AHB support relies on remoteproc driver for firmware
> download, power up/down etc.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig  |  6 ++++
>  drivers/net/wireless/ath/ath12k/Makefile |  1 +
>  drivers/net/wireless/ath/ath12k/ahb.h    | 11 ++++++++
>  drivers/net/wireless/ath/ath12k/core.c   | 35 ++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/pci.c    | 10 ++-----
>  drivers/net/wireless/ath/ath12k/pci.h    |  4 ++-
>  6 files changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 52a1bb19e3da..b2bfcaca00b3 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -15,6 +15,12 @@ config ATH12K
>  
>  	  If you choose to build a module, it'll be called ath12k.
>  
> +config ATH12K_AHB
> +	bool "QTI ath12k AHB support"
> +	depends on ATH12K && REMOTEPROC && QCOM_Q6V5_WCSS_SEC

Just to state publicly what I said to you privately, I cannot accept this
series since I cannot enable the feature, even to do a sanity build, since the
patchset that introduces QCOM_Q6V5_WCSS_SEC is not yet accepted.

So moving this to deferred in patchwork. Let me know when QCOM_Q6V5_WCSS_SEC
is accepted.

/jeff

