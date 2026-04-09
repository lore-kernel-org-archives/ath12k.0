Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E9EA3C4F
	for <ath12k@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdMoz4hsQMm7TuH0erJhR4F5yshOZcv6Maouf1TQ3UE=; b=A+JB0jVPtsxtC5MfJS1j0U4qbt
	lcF1RNapyb+T2HEraVkuKCfTgq3/T2eOUPA264HfhOrDS0fFYd3hUUJcsEkXAT0zy7WDmWmTftKfS
	mvYJ5pRG1QvBbxoWyHehVGYqJf9q29MTOVA0Ht92/v2YWByxpd+9JXpGWNhjOjxZVLg9dQOHxnrNR
	OLfJmM1ae0C8fxm/ocX8A/H7383WkjsjaRpNGCezinYUGU71vCo8x1C/SejxbmhDsRPZ/dd139Nyk
	LhOHGfwztBqyoQIgcoKljp2NgV9ouTYFT5qPKnR5pZy9Pe7fTerkXPklLb5kYGHRL2Sh4xtsIudsi
	AZEGtjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmig-0000000AAUp-3wDb;
	Thu, 09 Apr 2026 10:34:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmie-0000000AATL-3AuR
	for ath12k@lists.infradead.org;
	Thu, 09 Apr 2026 10:34:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397NQaD2845134
	for <ath12k@lists.infradead.org>; Thu, 9 Apr 2026 10:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdMoz4hsQMm7TuH0erJhR4F5yshOZcv6Maouf1TQ3UE=; b=p6ArpAUKkNVRDQ3C
	skuvy2timXCI/IP5rMS9B2OnrAj92Vc+ivEE+M+n/Lul9aJYQ4zilrxDtCbOYVxk
	ZLd8O6vH9c5zHG4NSw5eu/S9syKD158CcZXNz0FARUunt0oXBRvmKRDBI7+8pfRY
	1PkT6vLJ9N547MRywcqTwz5xcefj2gDCXFM6aDXeO2EQPS+axYPl8w+CRd6aktHK
	ZrUmX9ZJEtwHaBeFadqzqw1GapTE++ARLUZu9LCG1O3xil9h/OdmFeB/XS63cVLh
	VE80vdnl2UWtTCMHCcsV7Q4vZ7yKjEPae2RCQkkMPbXvQOuZOwqbdDqKsmyLXK2T
	nx/j0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hkmpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 10:34:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c7a84a43eso1081357b3a.0
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775730878; x=1776335678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdMoz4hsQMm7TuH0erJhR4F5yshOZcv6Maouf1TQ3UE=;
        b=hUL+Q58saa1xnhi99IvzXkCKQSauWvC1XYSMYDZ5VkPUe728nX9ClHY+smcgj/8t0u
         8yblRmYe2PnrkonAkLU7kX9wNDK0191v+oSk7WILCZdPoo35SI1lJpL6oiVaRNnn6+Zq
         38GeeZH1uCIICu3z0PCQX+rCFt9myRgDilX8jIsIE+ziMetfUvhRjMp1MW125tYjEp/8
         rqgr5meLDvBObvo04FeDQ3vzUExir1AdAykgP4Gt0RXDv3jaF4RMSmYAwWFa3caL5fHD
         HE9f7vTh29on8pX88YkeyGfqYGijTdQZE+QQoemClCQwY4rYxJzZkvQVyd1/96K8xutw
         D0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775730878; x=1776335678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdMoz4hsQMm7TuH0erJhR4F5yshOZcv6Maouf1TQ3UE=;
        b=IEjr6sBQKGRpkLIrPLF+e+SNS3E6WQPuKacbl/r+x46qp4QUsEuZX+wuUvtlF/f3Zc
         jcK0Yk3+4IpP8iDiuXhQFDcvPDibT0TwxDnN7hMLsySeVzK8tsZl4Zk9GYg3Oan7nR4s
         L+8DOJiu87kgAjVALyaBf/M11ufD9EwQrKw18thR6QSy3rzc6sF0DB4PjghklwUjFTzZ
         QVtCl+4tWx3//BBwdNRib7eP0/9hJr37l5I97VlnYuxlpj40hLKuXOhfkLDOCapMggg+
         FlXBdU3ZUdQbplwnb3tlFvIEw67VdO3tCa4TpPlgO3akqqRS3DEyUiXwZAydlBG0yNH0
         C/1w==
X-Forwarded-Encrypted: i=1; AJvYcCV+HyBdgPFEDjhZ4YdsqJZE/4MJplGPymhVieHav+x9sTfOhWXjIYsdrqu79Lc+GRZfxc0psWE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBY5X6SmIGRuJ9IlMWubc2iZZyrCg28tQsjNrd6ivu4bik50kt
	uD3kBMNczqo6QD54dsb/z40RTg5VMSt1jLKnlgt/NrU7KYZLXEusc+m6td0H2S4fi6HaAEwinjD
	kRIC3vM3Y4N/8AysOaSv9wKFgGUSDOYd4UgxxZWJdSZtT3//wJF1ZGL6y4HGrE5dV
X-Gm-Gg: AeBDiesWoRJi8d+/fBKA6eoLlpPbdBEhHXdd0Ck+JRlo9ONyBslGmT4GsGG9xyco5qB
	EZTEltGPoGvbBkA/jPQx4NY8rRhASboF07M1AHlxohddzJrojQkS4tT+qMoYJaKVx02HdBiZHDr
	ysn2ybqRFd2VoDALKcOjslmrp05VC8dji5dSmaR9NMZOAT5+O4qiEdr2GrLRJV2z6DnbzTgxcKP
	y5TM1/Nc2nvJOzRD50CV2CaecyoiOhlJytF0ScoArK0a1E30hVmhSbWSg9O3OOmoXnd4BRY3k3y
	ttPrdDZTZQbW493hRFyJx40PhrMHavNFuc5ChWUjJMHFTVJSbtE7DAvvvYsqxc55xbaBNKeGjlq
	CVLZr1IP1gzq7i4BI7w1cZ2/qa3AYy4kLVa0TiJm4cNhNO3JTgVmmRCmRwAbGzA==
X-Received: by 2002:a05:6a00:3902:b0:824:a01f:6335 with SMTP id d2e1a72fcca58-82d0daa3ce1mr25079152b3a.22.1775730878369;
        Thu, 09 Apr 2026 03:34:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3902:b0:824:a01f:6335 with SMTP id d2e1a72fcca58-82d0daa3ce1mr25079126b3a.22.1775730877757;
        Thu, 09 Apr 2026 03:34:37 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm24951395b3a.38.2026.04.09.03.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 03:34:37 -0700 (PDT)
Message-ID: <8009d39c-5033-4f87-a697-985297869e9a@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 16:04:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/5] wifi: ath12k: thermal throttling and cooling
 device support
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d780bf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=H-Wgj3y7uwXhWPCsC4wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jHqsJsdLUWGa-r03cROWBD5NRK9GVL5U
X-Proofpoint-GUID: jHqsJsdLUWGa-r03cROWBD5NRK9GVL5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA5NCBTYWx0ZWRfX1LYoBSyMiG+7
 3Ce2TUSnGrFLaUwXxLfSdprJ0prlNTBb35xeXJB5yoFhNtpw5C8eiinRMFLFLhMQfOZQvuh08ck
 jh1PWpm8BYgV8y27l1wo39jDCBf4pdB7ORUtphH8FTzAC4ZGG24V0aYrLjP8mlULBShHidZd1fD
 51QFWKp0FdF1b5sY8YG6IdJGxIfTNqlVi6RNe9Bx9JzsF35V5XhsYZXTDDelhCu4O1/zqDTxupw
 63M/nTVxycSiOYlPUQQ7DgFkatxSlHd3+MTqlFu58MW1j8z3P5HZ12L7JniyrpADkcGJtc4PeKy
 g3qn8qyzJfMv+XfQbvAYspP/+XPRvmBmq1XCb9wcxZPCd2brO9RB6Wsi+E+dhoPW+DQ2YJu/RU3
 yDujBeSid4sKyx4FitNLOqd004Bv1EJ/3csvvUdvQFFCzLxC+5IkA1OUv1xCwTm/qFVDbN/21vy
 S1UFbm3V94wdbpz3+kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_033440_915048_504A8F0E 
X-CRM114-Status: GOOD (  13.62  )
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



On 3/31/2026 7:54 PM, Maharaja Kennadyrajan wrote:
> Patch 1 handles the firmware stats event so we can track the current
> temperature and throttle level per pdev without spamming logs.
> 
> Patch 2 enables thermal throttling at bring-up and programs default level
> tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
> IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
> levels as advertised, and only fills optional fields (pout reduction,
> tx chain mask) when the corresponding WMI service bits are present.
> 
> Patch 3 refactors per-radio thermal hwmon cleanup to reduce code duplication and
> ensure consistent cleanup across thermal register and unregister paths.
> 
> Patch 4 reorders the group teardown logic symmetric for safe thermal sysfs cleanup.
> 
> Patch 5 exposes a thermal cooling device per radio so the kernel thermal
> framework or userspace can set the TX duty-cycle off percentage; writes
> are validated against the throttling state range and host state is kept in
> sync with successful firmware updates.
> 
> Examples:
> echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_stat
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_state
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/max_state
> 
> Maharaja Kennadyrajan (5):
>    wifi: ath12k: handle thermal throttle stats WMI event
>    wifi: ath12k: configure firmware thermal throttling via WMI
>    wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
>    wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
>    wifi: ath12k: add thermal cooling device support
> 
>   drivers/net/wireless/ath/ath12k/core.c    |  50 +++--
>   drivers/net/wireless/ath/ath12k/mac.c     |   9 +
>   drivers/net/wireless/ath/ath12k/thermal.c | 252 ++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/thermal.h |  35 +++
>   drivers/net/wireless/ath/ath12k/wmi.c     | 107 +++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h     |  50 +++++
>   6 files changed, 446 insertions(+), 57 deletions(-)
> 
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

