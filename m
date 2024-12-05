Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD942E7716E
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e1bTbhjTFtuWpEFbKoBhTRv3CFncrtzX/YC5Pf9ppk=; b=IeOa77PlSFke63w6UeJSKnpQm3
	tudlHA8dTRt5xR7PjJ+xVTDq6HMP9zVTSJnHDrzWv1zBavhBrp7lBiZwxOrIsFssCrxRq4BMctWhu
	IjVOthP2NSRXKGhzP00XHGYsU60R0XnJYvIjti8XEw/NCTuwOwTbr5W7w/e2zw57YduFZpflI7uet
	v3rwoYDdomeYpRYxmKTDzVAcXZz/4zKWJTqy12GmRh6/H1RCbZGg5wHiMd5uobDhWwwYzqq3nJNJ+
	oK10y9cofR7tukLlGfcsV5yShFIJRqrRNCoP02Yb5qbUN6okVRYBzAyUWCqn8or+ezvSxJkdWAe4f
	KfCK15lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKOq-0000000HUdw-2I6L
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 22:32:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKOo-0000000HUdT-1nej
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 22:32:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaQdd004011
	for <ath12k@lists.infradead.org>; Thu, 5 Dec 2024 22:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0e1bTbhjTFtuWpEFbKoBhTRv3CFncrtzX/YC5Pf9ppk=; b=JRR7eB5PmCwtL/0p
	23DBVlC9Fj3fmY4LKZvIxro1BRMeTz/tTwYck5BasMiruuFuEOfVgxpvbjQQ5EvG
	t8d0PXmyf1ug2cv+gcqeqP/0smuE87dE8eu/RAHXS0ZwQNZgbsTNJxSgNyeoN+m+
	eC9IzvmAeHU9s7YD8sstZVTMXJ2RcClLKjdL8qt+i5QKUI1qbyOXB0tK3i9rcEhJ
	gnoQyKGSXpq31uFdsm4KeWRlbDkYidn+RyXqlwCW1hJUuKquivzpBqfFgdP1ELDm
	UuyKIiYO70/wz39I6infcLCluSUuN/ciU5uXx/K82kBzLlCEo1WbcfD2dHhg+qTC
	9eP90w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm1jmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Dec 2024 22:32:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7259e512818so1223993b3a.0
        for <ath12k@lists.infradead.org>; Thu, 05 Dec 2024 14:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437960; x=1734042760;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e1bTbhjTFtuWpEFbKoBhTRv3CFncrtzX/YC5Pf9ppk=;
        b=kBTFq279fF8JdwOkcZ9VVxxnrGmAYtgVS736r84bcXbDBxTSNXtVAAS2ZrO76+jvmC
         EGKskqTgyzkxC7Wkj36Cw4GnsoM3F/unCH6UQg9XsroEkh9q0ReWeTprIOA5jlTga9UT
         ju9qHqu2WFT4Qq5hjU2sPz/yX3FOoLv7XUtBJbrMSBAn8SoWVcZayJsXhx4rFvW7S1n9
         RWAJza/vO62W/epJC7zdqweoYRhINMFatw4HO1kTzmuZKCfXLdPe4O3s1r8pF7YGekwW
         UTy+tOuzIANg1vhQXVibB59cKOzcs6OLW/EWptE0A8rdIY54GKvu7zJ3sN9Emg8OxPMb
         bLTg==
X-Forwarded-Encrypted: i=1; AJvYcCU2g9NECgoIHmhYa4voCO9RMj0Wdn29XVtCbkmHO3xuaumkTi6LjOCDZIHMUZstpGytPbVMU8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAK3oGwWcn8g1gjtTqJIH1p+UROvNle4moU31/klKmR2ZCin0J
	Lj/NqT7xoew5STQshtGRe+8UgjkU2pT3gVC/CE9Vxu1nSQ2W9oRqBi13+FIYIEiYGjdpHhTxifg
	CXnku78xlPvRm5ZR83AslvrKLV4/nzGu7CYCDtPc+Ztg1wkt/jXUaIWIbKhnV
X-Gm-Gg: ASbGncuWvuT+OR0qd8cx3zky+uGtJt1BGrvVlyI4zckgbm9xLYCAaS71BebNVTyNEPF
	AfocHDRZreLrQNCIWCCntVtycIjvc+viD1z/ank40MT6IKWCxxGWDxWEHJAYKOIQSS37xKDcYWq
	MS2HDY2OExnJydKmc91mdaMD79tjn/ROsEpAmXrdnklJOUAZI8E2gruO8+PeynUpsgi7CL6ZnIR
	pkFcfli4hTVthe1HmhNufod9U+DGtezblaJ5xtkrJnX1x66xtFYEMY006Pp11SHkoepmiQ5n1Ca
	/qJBrqxNv5eBDquFzDUMm/c4c8sa1qW5V3o3lcsU5Ys=
X-Received: by 2002:a17:902:dace:b0:215:a81b:c182 with SMTP id d9443c01a7336-21614d1f66fmr9072955ad.10.1733437960204;
        Thu, 05 Dec 2024 14:32:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+w9ugOjksQ0jD0qhmABqfm+EgIpCZBAlIbqh/xwne5sVCEYcKQ0/MYVNEstfHDR1DJHkB5A==
X-Received: by 2002:a17:902:dace:b0:215:a81b:c182 with SMTP id d9443c01a7336-21614d1f66fmr9072655ad.10.1733437959827;
        Thu, 05 Dec 2024 14:32:39 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21614df8dc6sm1323715ad.65.2024.12.05.14.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 14:32:39 -0800 (PST)
Message-ID: <88e0116c-778f-4861-8751-b30a09d3d2b4@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 14:32:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] wifi: ath12k: rename mlo_capable_flags to
 single_chip_mlo_supp
To: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241204163216.433795-1-kvalo@kernel.org>
 <20241204163216.433795-3-kvalo@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241204163216.433795-3-kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3IVi01AMC6xsYMu_W75hl66crLhiCeN-
X-Proofpoint-ORIG-GUID: 3IVi01AMC6xsYMu_W75hl66crLhiCeN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_143242_531251_DFAEFB4A 
X-CRM114-Status: GOOD (  15.08  )
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

On 12/4/2024 8:32 AM, Kalle Valo wrote:
> From: Aditya Kumar Singh <quic_adisi@quicinc.com>
> 
> At present, the mlo_capable_flags in ath12k_base is used to indicate whether
> the chip supports inter (QCN9274) or intra (WCN7850) chip MLO. However, it’s
> possible that the chip supports neither, especially with older firmware
> versions. Additionally, if intra chip MLO is not supported, inter chip MLO will
> also be non-functional. Therefore, having two separate flags for this is
> unnecessary.
> 
> Therefore, rename this flag to single_chip_mlo_supp. At the same time convert
> it into a bool data type. Also, get rid of the enums defined earlier.
> 
> For the QCN9274 family of chipsets, this will be set only when firmware
> advertises the support during the QMI exchange.
> 
> For the WCN7850 family of chipsets, since the event is not supported,
> assumption is made that single chip MLO is supported.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Kalle, this patch is missing your SOB.
Please reply with the tag and I'll fix in 'pending'

> ---



