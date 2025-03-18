Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F27C282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S8PB0YodJg5Wli563O1SQMXwTT57T9BZM427fm0JCk=; b=IDczMTqQdmWZEpfzafK8qzSyJ3
	jMJmFFOGVdGSWSkFGjiaEMc6OdczKeb+lIpWu9ZhnmMK5wYs4H+bT8nmU3eWKLpxRpyhaAWhCyG0f
	iaZQpq+IJYx7OcWWyH+83qTMIMZvRtg7xzviSgM+iqMiXyTqzNDKbW6ZQ0OGuzMDUqZVTH8lQUIfN
	xjLaPpKYiV3IuBLIJIL0kuwEdEd3uuv1F7sm28oDMZuZyLsAOVj5INUc+X2ok984vs0sTRd2uSvf+
	G/QhRxkf/F0GsQrxEfJsNTDTFqYVSiME8N/3fgkSWEQ52ot70+MP44BHTFsU9Dvi0A7hZp50HLBjo
	DZULccTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua5J-00000006aS2-0GeS
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 16:46:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZuO-00000006YNR-3EIa
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 16:35:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IFtXNK003307
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 16:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S8PB0YodJg5Wli563O1SQMXwTT57T9BZM427fm0JCk=; b=Cm8wQ5cUSKHVmqPN
	KIzw/os6kT5H6GUA/4uYhMGTX8mhdipTjERm4idtdVmfZQf2Cz+daXh0mmncXpqn
	Ph+P4q+lN4rFgoWJNDqKJtgcv6pT95H3zWLeaE5K4Jz9tu3B94ByCNoBIAgkRJG+
	uYkVAAEXE8lpResBT9fy9ljEhB3NEB6l5+jvRY/20z3rmW4I41ZSzrvCMJ01yfwK
	7A917H7TS3YMtEDwATCZGv2Q2HtEGuSpl1JIRsH3oIpcp97XgA5c/D0x2OOeXE+6
	BVg3UeGC9nmaaQaJ1UvZmZgDIxwXOqIoa4vrqBHtcHdAVYHsFd1O6BhXrCmCPqvm
	27yKaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x8100y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 16:35:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so5387383a91.2
        for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 09:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315714; x=1742920514;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8S8PB0YodJg5Wli563O1SQMXwTT57T9BZM427fm0JCk=;
        b=mQZ3VETVdmqhxsRDNQ+whPUTOWffY6ZWs13pArNy6A3hfNz9tOQkna49tDpiGC/k7s
         UKvn9YhqYSi2M+2DVhWhvoLY8tw53b90llLt11VWp1059uO91tGwnLw+CzZ3Kek+GF8Z
         ak8H4VkId88qbg3rA6UbXnJL6aC3KxSIsMqqitx1E3/NvG/JauY482jGd76C+pZz9bF5
         bHwU70ppYzlfhNEVns1fVoQZ1eAC/0FEAUJvRUNWI+sGk78k5Z9gF/qbs0uJC/oz7Q6T
         V4xbgE2WBMthslMjWa2meBhtMwpRGFcMX4bBKiQ8cmeRRCg2wT71djT/bcQAEnnJVrdF
         3rdA==
X-Forwarded-Encrypted: i=1; AJvYcCWAl2wCFWSMU0zbmHKP0it4Aru6sywynUFnjrmUYANPHWITUsn/No7gfN9NzJs5npP0zpqU5vU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrg91ZhQU4gshnHlW9/4jBbGpOctcRksqUHu6h2UkERNRFYdJS
	pbrKI9L1vTj58LJIWsCyMYqisH3LVxqTh+zasE5WqEGMYMJ/h7Q/4Ds1hdKLej9XGaUooLsY0B/
	ldyQW6m4CmfUH0RkOdlJO9S4y+MSiX3Vveh3Ipot4DbpZ5XUKj4Md91gevw4b
X-Gm-Gg: ASbGncvHK+kwvt3rUv5vU7n2f9XCDFDe4dhi9w1kMNjj2y0E3o2eQcBP7QgzP0RBqfv
	rG2Ykp7vsi+xP0rOWktHnQ0JDDSxoYRb3LdzovJRoadPorkbYRyoggi7r8oTmXVyOq8AqN8Yz5A
	a0QdcfQG+8fkmv8ZFZVKdIAPtbZiUCSLZ0Uc/wEBXQVOSpeRrXlEIR9NC2E4/V2h0aVdt8RUmIc
	Jmg1V2/tB6YwxqbTtpQLeUUheeYJqa51L46jVQDvb9dndVFgkOTjrfKg1rYpJWQLl/+KhVFPRaD
	TYtqi/sQAqXYBy2k7P2AOxDGE+LmlbNAYUltcO6uTZrugzkdKVvtK7s9l7MM6ozJzIowQ3U=
X-Received: by 2002:a17:90b:1d45:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-301a5b12641mr4557428a91.8.1742315714185;
        Tue, 18 Mar 2025 09:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNgty9LS3gmI4YtjORFBIqUOxTJsgXkfdaoeeC3oMmoDUzn0KGFmczchekklPmOqjoT0aY4A==
X-Received: by 2002:a17:90b:1d45:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-301a5b12641mr4557384a91.8.1742315713745;
        Tue, 18 Mar 2025 09:35:13 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539d3f4bsm8443754a91.5.2025.03.18.09.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:35:13 -0700 (PDT)
Message-ID: <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 09:35:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FHbdrhXJaUDG5pNtnvIcEoL9rmJeobUc
X-Proofpoint-ORIG-GUID: FHbdrhXJaUDG5pNtnvIcEoL9rmJeobUc
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d9a0c3 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=QwuQnTktFLmdFS3CTrkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_093516_946254_F2DA60F4 
X-CRM114-Status: GOOD (  19.52  )
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

On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
> the line:
> 	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> was incorrectly updated to:
> 	ab->single_chip_mlo_supp = false;
> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> 
> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> crashes on driver initialization with:
>  ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
>  ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>  ath12k_pci 0000:01:00.0: ignore reset dev flags 0x200
>  ath12k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
>  ath12k_pci 0000:01:00.0: failed to start core: -110
>  failed to send QMI message
>  ath12k_pci 0000:01:00.0: qmi failed to send mode request, mode: 4, err = -5
>  ath12k_pci 0000:01:00.0: qmi failed to send wlan mode off
> 
> With ab->single_chip_mlo_supp set to True, firmware loads nominally.
> 
> Fixes: 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Bisect log for reference:
> The bisect leaded to:
> git bisect start 'v6.14-rc4' 'v6.12'
> git bisect good 5757b31666277e2b177b406e48878dc48d587a46
> git bisect bad d78794d4f4dbeac0a39e15d2fbc8e917741b5b7c
> git bisect bad cf33d96f50903214226b379b3f10d1f262dae018
> git bisect good 12e070eb6964b341b41677fd260af5a305316a1f
> git bisect bad 6917d207b469ee81e6dc7f8ccca29c234a16916d
> git bisect good 4fefbc66dfb356145633e571475be2459d73ce16
> git bisect bad a6ac667467b642c94928c24ac2eb40d20110983c
> git bisect bad b05d30c2b6df7e2172b18bf1baee9b202f9c6b53
> git bisect good 56dcbf0b520796e26b2bbe5686bdd305ad924954
> git bisect bad d302ac65ac938516487f57ae20f11e9cf6327606
> git bisect good 8c2143702d0719a0357600bca0236900781ffc78
> git bisect good a5686ae820fa7ab03226a3b0ff529720b7bac599
> git bisect bad 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
> git bisect bad 46d16f7e1d1413ad7ff99c1334d8874623717745
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0606116d6b9c491b6ede401b2e1aedfb619339a8..33aba5fceec946fad5a47a11a4d86b7be96e682e 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1927,7 +1927,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	ab->dev = dev;
>  	ab->hif.bus = bus;
>  	ab->qmi.num_radios = U8_MAX;
> -	ab->single_chip_mlo_supp = false;
> +	ab->single_chip_mlo_supp = true;
>  
>  	/* Device index used to identify the devices in a group.
>  	 *
> 
> ---
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
> 
> Best regards,

NAK since this will break QCN
There is a series under internal review to address MLO issues for WCN chipsets


