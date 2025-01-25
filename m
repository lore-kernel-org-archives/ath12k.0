Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CA7C02182
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 05:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjDXMY3kZHArBWhjkX+PEyLu0Hkov8vChyBsrqhGWmk=; b=wCtPKHv0XQecHl0dzScQ3BzU8Q
	zeb6ZUmCIxDkeuC+4QbUfNBTiDDNxba5g8LJojOAXaTSVl+C96KHgewq/4Hc76IyM5cieabVzfvJg
	MiwNaH9rOe4HMTgl6egoZn1uEudCy2gOXbA5gLLbHaJ2RgJ1RZVWXZNSn1qRRPUKgrqmOw5LZpFk+
	cCrmugXMSOM/f7XF8635e2R1I++6bUBoSGMw1d9ftjJW/Hrog0EwRJsiRN3/RFGAfjrzgrYeZNRsD
	bkc/Fchw6gm/V4Yd7UJT88ja5GKS8v3p5IQLF5nL+NAelFuKHv6hPAmmsQpGdDyBAFgSY4P94NjsT
	fYE2INNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYfW-0000000G1hI-1T1S
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 05:25:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYfT-0000000G1gv-3jKt
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 05:25:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P4snXR024095
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 05:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjDXMY3kZHArBWhjkX+PEyLu0Hkov8vChyBsrqhGWmk=; b=k0x661ZYt6JZ3zpR
	r4DRC6IGcNGsn2gtCqiUImJukU3oTgLEZlVY3MuaOtwq7ERG09Uq2VlUxKH51qDF
	x7Ulw8UW9kgnQ++nkSDpmjeJx3g7AfUrAr/cw3LMgAFbveEuA74RH7O/Gmc5HBWF
	M6s3XI+7hpM0g07e6E8/ELnC8DjXYkxkZyfzVvH+c34L5ZBYfiQJubtym9x5yxLp
	JTE9nLC5MusBh8qdBNrmDR+vyzWiM72ybykzjxx2L5TmhOejpyjBaf722PC91GKU
	aRRcEL7ms2hNRjzLi5EOmEjNVKSiy27l8RuvRfbXlviJc/qwyAXYQ2/2PR/ksvf+
	0Urpgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs1pr1vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 05:25:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so5682955a91.2
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 21:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737782712; x=1738387512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjDXMY3kZHArBWhjkX+PEyLu0Hkov8vChyBsrqhGWmk=;
        b=U7/Y6QgR0m5pN/DvBzw8T6PqilZmepg/qd0rpwYeO2R2R9OAg4bYOrJ58nkEkxdB93
         3HbYn5GhEOXLQ0XYDHk5gpv5O5ARAZ+aEwnQMerKZQvztFeB41xjxEPU4x8o0HsfJnpQ
         nhg5Yh6tuHiXo8ymYsh9BW3ydlXrvOb/Z0FceTAdIKcPZO9gPswDLmj0onvTy3JUGD0E
         1+ks6MuAzcl/zMQ85Htedt2jwFh12zQN8FdaNkq0vn/ifSBwiq68ICAKPDOEVr151JrZ
         BPEJzHefMfr1KBH1x8kRpG4yOot5Kin0rI3BdznRhrLJEOUFcRi9kTPI4gxMNqGPU/6u
         49oA==
X-Forwarded-Encrypted: i=1; AJvYcCVz6da3kHIgRzvg+B64jMeqlc5xVQyCrPDtiXywgMVaOSbKE9WSgjYcQuX0K1DgxQdOM94Oz9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwWICZvuD31SBOM2bP5uiUSjl+FZb5Zwp8XglNj1l4stR1R9cA
	+9e9IENcAwaJ2z7fw2IxTTdRymUa7Iizl8AS0A947JGpcFzx56jhrkOu8zuzDsMIFraPz4SKEY0
	dFohw2V/hTzeKPIDsvo5Ab8cfioKC2/fwusDFNSN4GK5UoZl/hdC1RfDIRm0u
X-Gm-Gg: ASbGncuv1BIn2ZwHAgCwXjtDAuUeCAhU2zdvV1fYemIvBnAKrMNyDooqC/Oi4iULlWc
	Xs9c9nS8X58lBkls62koF3cQIl8RntXQbhQvc2yL4aAvtTruuZ1rolvFzy3sY0/c7+pXDCLtKR8
	5HLfJaJn3nm/s+VkyKmIcsTun3wUVkJRpbbd/YD0H9NESvgOWvdwjPbzvWEIMgefQDCYmiuU7GQ
	1zPrv0Q/Jlbyh5x62csf9bhN2yBOmzJSZWrVDwuE0m/DgCN1t4tNJKmvUPaKFlyERHNCse/8eV3
	dwo8NzaIB7aJetBP/IcDHj8FDjS1G+cTI1svrBW2kg==
X-Received: by 2002:a17:90b:2c85:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2f782d30ecamr48469074a91.24.1737782712149;
        Fri, 24 Jan 2025 21:25:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIaLprj/kI67JivCpkEoWYsjtzFStjZ/jj2YInCrJPsXEHy5GT3C6WMbQE5ll2JURCdV6kFA==
X-Received: by 2002:a17:90b:2c85:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2f782d30ecamr48469052a91.24.1737782711763;
        Fri, 24 Jan 2025 21:25:11 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa67f7asm3015800a91.23.2025.01.24.21.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 21:25:11 -0800 (PST)
Message-ID: <b237b4dc-9a07-4a22-9298-e3eab22ca2b3@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 10:55:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Request beacon stats from firmware
To: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124185330.1244585-1-ramya.gnanasekar@oss.qualcomm.com>
 <20250124185330.1244585-3-ramya.gnanasekar@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250124185330.1244585-3-ramya.gnanasekar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y4FUbP_0nNhDXsuIZ9BuvKFD-L2drSu6
X-Proofpoint-ORIG-GUID: y4FUbP_0nNhDXsuIZ9BuvKFD-L2drSu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=909
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501250034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_212516_063288_6CED3AF6 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

On 1/25/25 00:23, Ramya Gnanasekar wrote:
> Add support to request and dump beacon statistics from firmware
> 
> Sample output:
> -------------
> cat /sys/kernel/debug/ath12k/pci-0000:06:00.0/mac0/fw_stats/beacon_stats
> 
>             ath12k Beacon stats (1)
>             ===================
> 
>                         VDEV ID 0
>                VDEV MAC address 00:03:7f:04:37:58
>                ================
> 
>        Num of beacon tx success 20
>       Num of beacon tx failures 0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ramya Gnanasekar<ramya.gnanasekar@oss.qualcomm.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

