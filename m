Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE02E83057
	for <ath12k@archiver.kernel.org>; Tue,  3 Feb 2026 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtU0/hpdAIr+5h98ci3yTrohfWUAYAgRPyNrKyEhN+4=; b=SHJOefcCyfV3ymGq9hzhUli8LJ
	gYkOjJ8a94X5oYnbcNDPvYIiV5wKzJop5lzYrYEUIe2q7UetYNNXRITDQMOsXD72USOV2eLgyCLEK
	ErK5ZR/cPKVvUiRpOuFPp58H8WJiFrk2s9WZ/QSj4OlvdRPL482b+r6TOARKBMrRv2lvQjLO2UzSZ
	aAGLMLSLuaws4QmA7VoB1pccBEPggz5zfA4ur7OVI/8yF4DB3A+NtR0bM7S+yEyJld+i+S/Rdw2lo
	bSKs1akqeB22fvBmpRsi1VA1WLIAOMIB4n+b8Bb9hUrfJehUUA9TYCuzhY3wWAcUeTRzu4EhknHTB
	2+g1Yj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9aV-00000006ALL-2Cba;
	Tue, 03 Feb 2026 06:08:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9aS-00000006AKy-2mWs
	for ath12k@lists.infradead.org;
	Tue, 03 Feb 2026 06:08:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612LGhn32884370
	for <ath12k@lists.infradead.org>; Tue, 3 Feb 2026 06:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtU0/hpdAIr+5h98ci3yTrohfWUAYAgRPyNrKyEhN+4=; b=LWJWqfEBUonRqOoB
	8bH319KfLWL1MlRAZhGcaLoW/qkZI7XRaLcaDj3lRQe5I7LHX57YZzdrUn4pNui4
	g9CXt4L6AgNXt6g+pIaTrZnP/LtQSXKORcLFJkGv8bgo+OgdOf8zQfyVapiA9s/i
	55EAsHQYv275LVyAzPXCwr3tV+iAcJmP/zshw5e5o+FX3jM/KGTbZPQnLbC4EEz3
	iBfbhZoJx/yGHQLpXUBrrSPYFpuiAFeq5hll3OLso3p30jy8EJKdzQUmAf0WMVK2
	xNBieaon/0FKUz1tkEy/tp0oDe0TdcP8hqWF7h0x/2wGU3llXV3KNbp1Ed3scZ/s
	xQ/mMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3jwu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Feb 2026 06:08:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso44158575ad.1
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 22:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098911; x=1770703711; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtU0/hpdAIr+5h98ci3yTrohfWUAYAgRPyNrKyEhN+4=;
        b=blLZ4PLr+UdfGd82ADmYIYmoaCmTgIb/0y0kQuGmqOC+43TCleWfAYnuHhITbGnxw7
         r+CfEbltpr5HlPfCVCnSu3FzhkC0s0yXGaBThNs6OYSbDnFcM3Za9bdZUjMvQcafnPx0
         rBO+3Hj8/15gHSJ3pY+8xRBguVlxukRC3KbBDRvKVy9fNFpwB7OXfc5Rds9yxNCakMAW
         Y7n2HHbHdxjLFolSRjORU00rIkBuFjTcoOd1d8QhcukAqfmRS7gQfix3TLHCR9OtCD9R
         MqOoqMphVyZcgYsUMeWIVv4J3JGX+x2eozVb4d+8Kxa0QZQZXy3jdL2WbDmvitHO2tb7
         2r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098911; x=1770703711;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtU0/hpdAIr+5h98ci3yTrohfWUAYAgRPyNrKyEhN+4=;
        b=IDPyPI5xyOs86XBdJeWWu8juz2gSZWlKE9KswmDdYanNNlBq04hnN7tt8NtY/Yvi8Y
         diyApBDg+qjVP8wMdmN1dBaX2atrfEcsP6UJ+wrkD66QEKDTM6iA/Hkik34MPdV/h15a
         a+g+cK6neIxTWVOJXEtdlU4W/ZXj8Lkr5J3XHzNIrYU4e84YjicMstCoKxcUCs/hExe4
         kqarm4+fyjf5mgT7N91kBq9kdzjakZnwEc6Q70FFwbBBQRpCPTgAfB4/U+bJVFqYoehz
         duaRbDsuUAMEqkAidB8yekqnHKDs3Y1qPWRayBXn9+hW0X33FS3/9SVi1HccfWUkMRrh
         P6tw==
X-Forwarded-Encrypted: i=1; AJvYcCUIqh7Q8J7XW1VZ7IplmETXZ7Y85jaX0NVv0hrbypWb3jBR/6bjrne80OmnGinxiC3sKHD1KII=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkn4kli6Ndcdfe8GI9IDhknmwENpZ28kSI2JuAQ0qQrRfRzzXV
	GVawvDBtlO8J0dIwoxpLWkWgq0pcTwBXmLhlAQblwq88WY/9nRGI+ZA4LgLtCrQXdkxt9T0t1su
	V8z25ZWAl+E0B0PGZSjHmgI89GRJXLqvdXR+wr+mTnLgoG0MpmrcYoaApBtuvs5MU
X-Gm-Gg: AZuq6aIGE9iUG7lDKbpLN+vN0ZwmOrxKIra+bW4SuEAEceLuYbZhSzzN5uNFYE6WMB9
	t8CSOo9lhxUwkRHE0K/7IvhEbw4HE0keWXN7ezcdm88NPcYxCBZ5KIXKpgTAfG7jwn8gpS04jWT
	lTt3epFID8uM45TGBwVuzoMELf6jgwnighzQKxHbvjsXNDi/aJhLCDJMXUysc0x+/yCR1Rw9UW1
	tk0kBhX3P0RUD34GCiXPLjejz2Dc82b4Gy4JazX2jMgegNaSxR0ooRLAD12LZfojsOfII2gtZ/f
	+LfTEJBbxHQ9DHjo2Kq1F/evceRBa9HK+p74slPkyGfgxVPqIo9Am+OKWU/KiSF6tH11KciCbDz
	G8IVIYiMdmzB60dq3X7WOVQfeHjQc7+hT/jvpHhzw67W4moDcKZ5w4Pcf97LRp+x6MagG/eHFpS
	N90o8blA==
X-Received: by 2002:a05:6a20:a122:b0:38b:e944:3e98 with SMTP id adf61e73a8af0-392e0000568mr13670088637.5.1770098911301;
        Mon, 02 Feb 2026 22:08:31 -0800 (PST)
X-Received: by 2002:a05:6a20:a122:b0:38b:e944:3e98 with SMTP id adf61e73a8af0-392e0000568mr13670071637.5.1770098910836;
        Mon, 02 Feb 2026 22:08:30 -0800 (PST)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3359f4sm15788615a12.22.2026.02.02.22.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:08:30 -0800 (PST)
Message-ID: <547a2c5c-fa11-4110-ae6f-17c12d6809f2@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:08:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix CMA error and MHI state mismatch during
 resume
To: Jayasaikiran Banigallapati <bjsaikiran@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org,
        kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260202151720.49904-1-bjsaikiran@gmail.com>
 <125f0ecb-79a5-4806-aa93-aecaf937885e@oss.qualcomm.com>
 <399d4ea0-5f70-4678-b0d6-9a80c3399ceb@gmail.com>
 <eda602b5-6d6c-4ef1-b07a-53af4b226549@oss.qualcomm.com>
 <aa252da5-a9fc-4c86-ae78-1de1f7c34bb2@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aa252da5-a9fc-4c86-ae78-1de1f7c34bb2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XLkqnb4TrCj1t4YmLiw_YRQgkI6CNorz
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=698190e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2ZLfKyb1yGKDWJBy5BIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XLkqnb4TrCj1t4YmLiw_YRQgkI6CNorz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX+vk1UN6aStkj
 7uHTj4nZCchWtbEsenC5RfW3gKNjIwEihD0YmZQalVxyCSASAP8h28enAnvyl2+6nHoEwI9UZfe
 jWdeLM1nQ6EiFoN2/uvII6iJVrn7D0ixwUPU6rXZK91GpzLnXXz/knRkSNBlKug88oZ1nuNOG5w
 2EAQgQ9I5K8AcDgdkHDzXu/gEaQxhVp+NCTVHV8ieNygf5iqw/h6LUVkQSTYUFe5tqU593mm3sR
 bqQZ/pvIB4LhGwQHU6PaYmRH2LXJv5frUiEqqqVxaVMI5GvZgabWK75hDuCc+ktdDyraCkBfScW
 nHWrUo1Hlxo6rtEUTficIXGZRaCsazgvIGojLnoC07thHMEPbacSonI4N4GCjwgPIoFjA7Wh/6H
 4cAlaubSjZ8H1z6kzqpQkensMjQGZNUUWos33nnKIctt3p233EXNYemSBsFP2c+RR4dCiM3KYB+
 EuCVcdndty/nqx1h07Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_220832_736876_B2317720 
X-CRM114-Status: GOOD (  30.08  )
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



On 2/3/2026 1:51 PM, Jayasaikiran Banigallapati wrote:
> 
> On 2/3/26 11:00, Baochen Qiang wrote:
>>
>> On 2/3/2026 1:02 PM, Jayasaikiran Banigallapati wrote:
>>> On 2/3/26 08:21, Baochen Qiang wrote:
>>>> On 2/2/2026 11:17 PM, Saikiran wrote:
>>>>> Commit 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") introduced
>>>>> system suspend/resume support but caused a critical regression where
>>>>> CMA pages are corrupted during resume.
>>>>>
>>>>> 1. CMA page corruption:
>>>>>      Calling mhi_unprepare_after_power_down() during suspend (via
>>>>>      ATH12K_MHI_DEINIT) prematurely frees the fbc_image and rddm_image
>>>>>      DMA buffers. When these pages are accessed during resume, the kernel
>>>>>      detects corruption (Bad page state).
>>>> How, FBC image and RDDM image get re-allocated at resume, no?
>>>>
>>>> To clarify, the BUG: Bad page state crash actually occurs during the suspend phase,
>>>> specifically when ath12k_mhi_stop() calls mhi_unprepare_after_power_down().
>>>>
>>>> The stack trace shows the panic happens inside mhi_free_bhie_table() while trying to
>>>> free the pages:
>>>>
>>>>   mhi_free_bhie_table+0x50/0xa0 [mhi]
>>>>   mhi_unprepare_after_power_down+0x30/0x70 [mhi]
>>>>   ath12k_mhi_stop+0xf8/0x210 [ath12k]
>>>>   ath12k_core_suspend_late+0x94/0xc0 [ath12k]
>>>>
>>>> The kernel reports nonzero _refcount when attempting to free the CMA pages (fbc_image/
>>>> rddm_image). This suggests that something is still holding a reference to these pages
>>>> when DEINIT attempts to free them, causing the kernel to panic before we reach the
>>>> resume stage.
>> this seems like a bug either in MHI stack or in kernel DMA/MM subsystems, rather than in
>> ath12k
>>
>>>> Since the pages cannot be safely freed during suspend, skipping DEINIT (and using
>>>> MHI_POWER_OFF_KEEP_DEV) avoids this invalid free operation. This also aligns with the
>>>> existing comment in ath12k_mhi_stop which suggests using mhi_power_down_keep_dev() for
>>>> suspend.
>> first of all, this is a workaround rather than fix. Ideally we should try to root cause
>> the issue and fix it in the right way.
> 
> 
> The original comment in existing code:
> 
> 
> /* During suspend we need to use mhi_power_down_keep_dev()
>  * workaround, otherwise ath12k_core_resume() will timeout
>  * during resume.
>  */
> 
> This patch aligns the code with this existing intent. The driver was previously
> 
> calling DEINIT (and freeing resources) despite the comment advising to use keep_dev.
> 
> If the intention of the driver authors was to use keep_dev for suspend,
> 
> then my understanding is DEINIT is incorrect here (Correct me if I am wrong)
> 
> regardless of the underlying MM behavior.

keep_dev means not to destroy the mhi_device instance while going to suspend. The purpose
is to get rid of the PROBE_DEFER problem in MHI during resume. You may want to check the
upstream discussion to learn about the history.

> 
>>
>> Secondly the workaround here seems problematic: you skip INIT druing resume. However note
>> several hardware registers need to be re-programmed during this stage, how could the
>> target work if its power is cutoff during suspend and the register context is not restored
>> during resume?
> 
> 
> In my testing, WiFi functionality was fully restored after resume.
> 
> The device associates and passes traffic immediately.

I can imagine two reasons: either WLAN target's power is not cutoff during suspend, or you
did not get into the issue scenario. For the latter, I mean you may need to trigger a
firmware crash to see if RDDM works normally, since you skip RDDM register context restore
during resume.

> 
> My understanding is that:
> 
> ATH12K_MHI_INIT primarily handles host memory allocation (which we preserved by skipping
> DEINIT).

In addition to memory allocation, there is also register programming. See
mhi_prepare_for_power_up() and mhi_rddm_prepare().

> 
> ATH12K_MHI_POWER_ON calls mhi_sync_power_up(). This function triggers the MHI state machine,
> 
> which handles the necessary BHI/BHIE programming and firmware download (SBL) sequence.
> 
> Since mhi_sync_power_up() is still called during resume, the target is correctly re-
> initialized and
> 
> registers are programmed, even if we skip the redundant host memory allocation step (INIT).
> 
> Thanks & Regards,
> Saikiran
> 


