Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567D9C02180
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 00:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHaEVCu+3HHhE2W6C5rbU7x6fz74XS1o5EJDqqpOKxE=; b=3EUF8lmi6WVwGkOY5fo+Cm18gf
	p+n4LUcfMRTg92dqDbd+E6FUND03XaPW9t7LOE58mGiGOHQme0blSZdO0yyucIdFulNtQlQyI70QQ
	4y7Zw+B2CguG5e0/dLWd2740vxJ1PZaA/x7CkHZQfOrzdDO4TAptRIHAnTHwB+dDxzzfczD7kMca6
	HfQr+/NHkhauK2S1kCu1shcijtPIZttiCpcDpp59UUlSv5SyIzbVv4ONg6yUoT6Dlmspu4Hm0+Bf8
	yX3IUN2z2sq5MnI6DzQoeYZKYo7/SyQ6E/EpLxPpc5AsX2qzMMe1G4pwo0Tghz0dYkSGb91lUuJwW
	NxxX1Msw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXURz-000000070WW-04Os
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 00:06:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXURw-000000070Vo-2Ru7
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 00:06:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFSC1Y023351
	for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 00:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHaEVCu+3HHhE2W6C5rbU7x6fz74XS1o5EJDqqpOKxE=; b=kbTWHQNfkFtIkPD6
	bYDRJXbvC1Ewp1EU1/63tmxmHwAsBsyr3G/zCdRMIwJr8btshWlJQUu5R6VXD3bb
	YEIFypcWYH4NzFLmDhZhsO00rGcpsV2BEvEhPxYGe4DnUNCrx1XxFzcgOmQiSsZx
	0dNf2V1aqZb7e1TYJ67444fyFxkruUs6aNdASaWuqfz5oKnwpR9/jSXFJk+YnvfO
	A8Mq4CRcVxL4dpftGoMroP/Afed8re/goi0nG5HwRcLi52opxY//xuKgX5eeR8bi
	1jP8gdbm/vccjqqVJmXgxwaOQqARfshXh+dWwFCi5X6b1qEhWAeNS08y+4JdZfO6
	X643XQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4455gfs3h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 00:06:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2165433e229so93447285ad.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 16:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736813187; x=1737417987;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHaEVCu+3HHhE2W6C5rbU7x6fz74XS1o5EJDqqpOKxE=;
        b=XvHIJmmLAycwHhmYAOuOZjj8SqxCYetaZBBSsd1LgR0PaSdNLvl59mZRbKtiabnEIt
         8hVJXb23pTpSG+U1fi+jz3srmOmc00KSLHk1iPLMTvgoOXgsj/gLp12p8sq1yYVKBhYn
         o5fcSVbxyDwZ48ttLSE816fX19xteGS7/Hnmh0Wk+i843ICHxsGjjvx31Bcb+/ATT1wX
         oOJ68CZ8nZZaMqmKlPzXTFcqGqLTwbf8bBoAl5R9RY2dvWtyjMRna1z1tGvSpyckS2wd
         9pOfzC6fhRSiUb2ixxMfuRrrdRF0JzJm3syEDQAyR5CadrDez1EwIO/23mxxseCxlogW
         ebZA==
X-Forwarded-Encrypted: i=1; AJvYcCWA7W17gZi0mqJAhEMXXnZqXFBMbe9nJfDRZ+6tWJ36rmm8yaCtYk/EY6cCwY29zP8mF/7pn1o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkGGrqtLeZWKS841lNF8isZoMZIo03q5cIj32C8wVi2KVsCAeC
	eHSW3Vj97YDSD/ZxyeI8G0lYRUK00fQVUywUzvUKB7v/sCI5w8ukLYA2aMtXoeUutT3p6YFm+Or
	bTlGO7K+0k61uOrzdiOMBMZCO5DNjhZPZBq7ZeP7IKezNDwQ/mVksln7mUTpy
X-Gm-Gg: ASbGncsPyY+AkK/KFn70nOSN1C3ty1ZKHf64gOvlqvH/0dslyzIVF3sDLVFPZHf29CO
	kd0oTMsRgdy/GXhh2NwrQErBqKIyGEuwg8gTS+qh4CwryJDuOz/WDfFpolHoCwxKRAJnJDywTvZ
	I11Oi4dnkOUqVDVRnlL7jxQNuQip3jwG3cCn81DDLbhOBdBE4IeMab/zuBN1RlPZtXMya3d8yw+
	XP9dIe5hvX7YbsNFPwhqlirMM5CSlh+UEarcI250oW9kJ4z7Pnl8NsujC6mpCUy5IR6MzdTygi9
	nJ/bQ5CqY/mOFBq3GPOq/c7KnGYs1/qqoagNaCH/fuH06zYKyA==
X-Received: by 2002:a17:902:d2c6:b0:216:2426:767f with SMTP id d9443c01a7336-21a83ffc1f1mr362870535ad.49.1736813185620;
        Mon, 13 Jan 2025 16:06:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFOJq7QCju1bWdgGa50MldRyGj9kA62UD2hyG+Sdq9KUeBR7F8PwyNHHgpukfp2QRN18L3Iw==
X-Received: by 2002:a17:902:d2c6:b0:216:2426:767f with SMTP id d9443c01a7336-21a83ffc1f1mr362870195ad.49.1736813185226;
        Mon, 13 Jan 2025 16:06:25 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21bbddsm58060835ad.130.2025.01.13.16.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 16:06:24 -0800 (PST)
Message-ID: <dad05b94-05f7-4aa9-8271-d74dd743a748@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 16:06:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] wifi: ath12k: Factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250110111845.2920741-1-quic_aarasahu@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250110111845.2920741-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: asMbZIRlyPiicL9ciIrsKcl2jveAordv
X-Proofpoint-GUID: asMbZIRlyPiicL9ciIrsKcl2jveAordv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_160628_641303_0A3A02ED 
X-CRM114-Status: GOOD (  16.02  )
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

On 1/10/2025 3:18 AM, Aaradhana Sahu wrote:
> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
> 
> Also added changes related to correct pdev id access for
> fw test cmd.
> 
> Aaradhana Sahu (5):
>   wifi: ath: create common testmode_i.h file for ath drivers
>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>   wifi: ath12k: add factory test mode support
>   wifi: ath12k: Fill pdev id for fw test cmd
>   wifi: ath12k: Disable MLO in Factory Test Mode
> 
> ---
> v8:
>   -Included change for assigning seg_hdr.pdev_id.
>   -Moved if block to start of ath12k_core_hw_group_set_mlo_capable()
> v7:
>   -Updated copyright
>   -Moved ath12k_ftm_check in ath12k_core_hw_group_set_mlo_capable()
> v6:
>   -Rebased on ToT
>   -Updated copyright
>   -Added patch[5/5]
> v5:
>   -Updated copyright
>   -Fixed line length within 90 char
> v4:
>   -Rebased on latest ToT
> v3:
>   -Rebased on latest ToT
>   -Updated Tested-on Tag
>   -Removed second parameter of ath12k_core_start()
>   -Updated copyright
> v2:
>   -Rebased on latest ath ToT
> ---
> 
>  drivers/net/wireless/ath/ath11k/testmode.c    |  80 ++--
>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>  drivers/net/wireless/ath/ath12k/core.c        |  30 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  13 +-
>  drivers/net/wireless/ath/ath12k/debug.h       |   3 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |   5 +-
>  drivers/net/wireless/ath/ath12k/mac.c         |  17 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
>  drivers/net/wireless/ath/ath12k/testmode.c    | 395 ++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>  drivers/net/wireless/ath/ath12k/wmi.c         |  41 +-
>  drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
>  drivers/net/wireless/ath/ath12k/wow.c         |   3 +-
>  .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>  14 files changed, 623 insertions(+), 85 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
> 
> base-commit: dbe50a7420e22954c747e79e72df2750d795ea77

I wanted to pull this into the pending branch, but it conflicts with a patch
already there. Can you rebase against ath/master-pending?


