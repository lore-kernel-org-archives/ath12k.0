Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD836C2A09B
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUYB3yAyXq4csu5GlgZwOub/CvpJeprZIhLCVh66gKI=; b=bRu25haxQexGtqHNLUQWNtcU/L
	bhPJuAdhP2deHBRV5AOjuE8dnejuxjlJRaWuavsKnqlDLOzOuxdtVisa9N9LQqAGavHAyo2g/1Gx4
	pITlcQWCy6zrN32yZwuuzmFKaYp2psngoQa41HyeUcOT80ZzwDuAt9Ar3HZlZSWM8JJailpqLpHZi
	dfb3XGzp/vOyqBRoIDxhPpIrNHmQ8D0Z5t6IuASarfrosK6fZn8flevmoJZiOQALBzivZVkq+GBP9
	NXbcovE/bJeRXJ+ZpOoJfHw+bPtCcT+9W8WCxj7smml4CBhEvU4CKqJ0801v2BMubX07oUP5rllqM
	mGirmEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMoS-00000008NGh-1V0h;
	Fri, 07 Aug 2026 15:48:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMoP-00000008NFx-2LDz
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 15:48:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FRMVX2532512
	for <ath12k@lists.infradead.org>; Fri, 7 Aug 2026 15:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUYB3yAyXq4csu5GlgZwOub/CvpJeprZIhLCVh66gKI=; b=DklM7x5KpBN1Z2ru
	5YtAAT8aluNm9CGvscVuKFNGGQamby7b2vW59jbO9adDZTZC4LaUCdnxSbSoNwYz
	U+8eBF9I4G/qXd1qDWyah0n08bZnAL4p1QaQiu08USsNNerYmSr5kSH/PvQe4rTj
	9lgjpIUtA42pfKBgYxrThJjoKHTRmyTBQ16sKqzVQHdemf8KA79mfRKt2hfJrfmr
	aUql0LPvYpPXFvZgrJPmlJSSA8AUBIbYGb6rmlKoyTCrz8xqv0yUwN2pXkITrqW7
	CvQD608U6CoSFaQGFqTve3rGBsv+kfA02NI7Yk1HO9lCYhht8KGeEJ+3NI9GpnVK
	av8HMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwhpy85vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Aug 2026 15:48:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso4405595a91.2
        for <ath12k@lists.infradead.org>; Fri, 07 Aug 2026 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786117724; x=1786722524; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUYB3yAyXq4csu5GlgZwOub/CvpJeprZIhLCVh66gKI=;
        b=PHMv0+dZngTXbX54q743BjO3l//799CYYJypIEzJpMuqCW9l5+QxBKQ58+uXiTSBy6
         0muB1SbtcNSh0TWta1aEw6Mi+FRUd4IHBYD4dXfjusE6q/xCi/VI0LdmxJscW/6jGpVV
         fwU/nnlby6LXvkSgoF3O4tHUCJ9EO040qv7CYx2sZ0tunET5G/87zAsznbSBFHiyAWRV
         1vupUs20wsb0sLfwsa0NDXZGLtvDJWDB2y5RWxeDpMUovVmvI9iunexSdQK1l4uf3jXf
         4R6CkW/NgrHfY/mEAdu9P1KEVfQORpWoaL+dHpiQGlbDkhZM0CtQrdnRXaFUS0wYjG1V
         0EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117724; x=1786722524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUYB3yAyXq4csu5GlgZwOub/CvpJeprZIhLCVh66gKI=;
        b=f5LSnWpucG68x2EoZcI8BdfvACYPa/wQdpmq/Qxc7Hd4LRtACRyAqC8wKxLsXWy2DJ
         yStCWRbNocO+BV/6KE01ybhe6mfb1OfRDrCAGyL93NVoFb+d1cufP3zyMFiBr3d9U61M
         4vlKlDkbvlwHkISaiTXCTaKtvU5elacCcLfqThTqyaUI805LMwVgJzF1kKgFq2G7lWgA
         35/eLaJzoYm8q8JEwqjLP8xp5Dkp4ORCtUfMDObYbH7WsD2VytILK+nu5DY+QEu9bZnw
         YxR4QnIToXFtwdBxrMCHzOXFP7G+PJLFAvWiaBymj6+5DRIxB51TP3ujHHh0aeuZoSbd
         HuLw==
X-Forwarded-Encrypted: i=1; AHgh+RodpvrmBhngMWRGvaWa9Spd55+LEXP5vjlx8Oda9FnTidM+09+DPv+gnPInV+UBbgQyxHqSHo0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9AuV5Y+txo7u+QF2UTbmM4ndr2njGdIG1SEJB0OL6XiuhkJyq
	LlV0AYZkcSGnAzWJ0TRSyFyK7WRmD1BYF/A/MxYuh4ime3WDUIXkYW6nzhOjwq2Q2QWc47OYmDv
	ecD7mfMR5Pr1EUcAQXK+bZfnF8MRK7fiZmZvFRWnLBzU03d8m58sFysH5HyeenIT+
X-Gm-Gg: AR+sD13zBOi0g8j60mg/DmkXN8tpGy8O9NQXwcrhPQEgBJbzk3F+1If/xfBTk/1UEwr
	vgpxiKfvBt10VtJckdzjs6h64P/hVdpMgRloQrmHW1AKJHEXmvl9m/oCZEFejHRqlE5kRrmDoaD
	LWy6g3az0rSAAca6aZhjNu48Xz7YPLqW9umo3aTvqKkq4WMpRFoOLpgCNr0VyBvNSUNCQ67NRve
	1QdgAz/LJ7FGq41vZECvIrzal45b3qp/7rWOJXPXhOJ4M6plKB27Ab9i+4V9ASceZA2j+HzFZJz
	OammYcG7Wpbx+tKvzrgHy9VhRVClc0LZ8quYrfSLw7wGpBwsOKQq88nuatMzAHlYL6e23qZGcLE
	XqIIcjKKMsP2rFahbNJxj9uXgcR65X2cq+/gWPPKb1UpNijN3ZE49R/hdQ6P+
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr20591007a91.0.1786117723987;
        Fri, 07 Aug 2026 08:48:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr20590968a91.0.1786117723530;
        Fri, 07 Aug 2026 08:48:43 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a6809sm8940612eec.10.2026.08.07.08.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 08:48:43 -0700 (PDT)
Message-ID: <c25b473b-4863-42b5-9a1d-f6349c7553e1@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 08:48:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <6a9196e8-2e2f-43f8-9665-6ebb82b95951@oss.qualcomm.com>
 <20260807025628.1893831-1-gonglinkai@kylinos.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260807025628.1893831-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Cb44Irrl c=1 sm=1 tr=0 ts=6a75fe5c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=_dKMptamaeDBI9ONEHwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: AMg_vpB00or2zNtelyKS9Tbbon08kAd1
X-Proofpoint-ORIG-GUID: AMg_vpB00or2zNtelyKS9Tbbon08kAd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyMyBTYWx0ZWRfX1k+nCRHT2Mj+
 YWLwl2uYp0nAn+O+RDwDwktIsVdBpsCGETeImFIa0UYSF7PHxjgc0tFQztgcBQ64r147xUZ7DaG
 M7wzUhztl5mPGPDOb+fvW9PqT0IOl6/xKz93YSxuHEThTEzVw2SWuntg3bmBOFtCMFbAd8h1bqh
 EV6SYm0gsedsUeNBuG6ZrqzLbqGYF+zKaG2vkJXCltLQ+YCkpVi1zagKwbU6QFfClTT+T/wEfjM
 e3QxQXtABLog47s6JPTrodm5Pzb9kx1YubFDMGGgvkc3d+ts7GfK35h2bkaqxnZS2rsRHyGyH9V
 sPfXD+i8K3TqMLoZlRP6XgBFzoJd1zWUOrXHKlOmpwzetQOsdr0XbFWPn4hb4WFDyuRzbOwQ3s5
 vVVMBewEUGSlnGY9/rJHvqmfC0ShaT5XEIMuROWkvl2JEiiNssC92Euxqa+4ZivQmlc0h7g1yTo
 YlQrrDYhe9fB5GtK15g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyMyBTYWx0ZWRfXySUfVfP7bQB6
 Gmc069+aToLp5DvQC6PITUEakblGBygseHaArRlGVf6OXz8xHgroUdFVs8l4VX4jOErdTiHTijC
 Onq2uY3EKQsFmMBC2TF77vQ+NyeK8U0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084845_602623_AA899B5E 
X-CRM114-Status: GOOD (  18.96  )
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

On 8/6/2026 7:56 PM, Linkai Gong wrote:
> On Thu, Aug 06, 2026 at 18:47:38 -0700, Jeff Johnson wrote:
>> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag
>> Tested-on: tag missing. How was this tested?
> 
> Thanks for the review.
> 
> This issue was found by code review of the error paths in
> ath12k_mac_setup_channels_rates(). I do not have QCN9274/WCN7850
> hardware, so I could not provide a Tested-on tag or reproduce the
> ENOMEM double-free on a device.
> 
> The bug is: after kfree() of sbands[].channels on failure, the
> pointer is left non-NULL (or the wrong band is cleared), and
> ath12k_mac_cleanup_unregister() frees it again.
> 
> I understand Tested-on is required for ath12k. I will follow up
> with a v2 including Tested-on once I can test on QCN9274/WCN7850
> hardware. Meanwhile, any Tested-by from someone with the hardware
> would be appreciated.
It is OK to specify the patch was compiled tested only. I just need that as
part of the commit text so that the level of testing is documented.

The ath10k documentation was clear about this:
For trivial patches it’s ok to skip Tested-on tag but then it should say
“Compile tested only”.

Not sure why that was dropped as part of the ath11k and ath12k documentation
(that predates me becoming a maintainer).

/jeff

