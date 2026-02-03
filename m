Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDD3E83050
	for <ath12k@archiver.kernel.org>; Tue,  3 Feb 2026 05:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxSEjdF3GcjRCJJjZuZzgfiWY7Eb+I3otWHzu60Ku0E=; b=lSec6DpaB7q7Zi3loCudofCZHD
	1HVI227NWJUPmJVcvrVAiEr7V8PQAC9t6oPJJTewVDwzSj2LIZ3K3GlWBmv0EuTJrsFP0CmuFwy/r
	jfxZ0NKjQ5oUK8TPBKadtVVYxb/GBlgHX9lOkvV8u9L7V5rXhaKjgNtPMJUaa5dV1u336XBuyfVNW
	HVeE83EpP76S85MRC2hlAtTmKS454idiGm/6rIt4q61LKBxY52mDGR3M13EWbdexEfpwE+8ehNMgE
	yVZAGKrv/C10jpaJfHkmc7247sJBLOzpUy3TvFeDGSeQ3k/Ee74/pWSAvuqGBhpuVBce6OAKKd1MC
	H8485AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8YH-000000064QE-39b5;
	Tue, 03 Feb 2026 05:02:13 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8YF-000000064Pr-2en9
	for ath12k@lists.infradead.org;
	Tue, 03 Feb 2026 05:02:12 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-823210d1d8eso2656787b3a.1
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 21:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770094930; x=1770699730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxSEjdF3GcjRCJJjZuZzgfiWY7Eb+I3otWHzu60Ku0E=;
        b=faHNN9mZUprQJ/Bt2KaGPrbGzWybw+rvPSrFAnkXhbsaC/+sXxfMzUEhq2z9Xs+i40
         b6te0e2ZBs6VGSpTwOhTDabbfqmDRRLgELkrt/o5t1HwTJFuCKdp2ue6iOK0OEnyxtwC
         lBzTH6YCRE9LgT7M/K6O3+IKvXTs8jjwd3KkfZlffOvcBoTUh2hMjK6kHct/TOWXn+m/
         eivMaqKzUtdz7RHjV16J3LZvcXkTeJfsTwBGG2RmG649yIuhk7VO4phwuT2dwUn82JAR
         MG7VTzEcvKHTLw79d8tkt2He1xnKDB17owIoklV51xRCoFbqax5ItjT8xTZ28+eNoB2b
         uE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770094930; x=1770699730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxSEjdF3GcjRCJJjZuZzgfiWY7Eb+I3otWHzu60Ku0E=;
        b=VKkypr3/rttAdE6CrVC8YeI9xhDZxQstf8PwxN077g7yHZQoayt67Yv9aVK5ZHToxk
         g1xBLlhVHe1HdMn1ixdeGBGrkTQIS7Y8JX54nNW01RlkV6MAkYdMzQkhNj7KwlVv2N3l
         XWTbN2HMy63DWL3PLQHHj9NOfNaK2hKl9minRktr+d49I6yyaHPgaCBE4KmMRGITKGgj
         mp1nJ02h2cDa8lJs0wa3L9ejXdwwIESGGY7qKxuawRu8/sMaM6rQZ4wV9/4Gp+dBkTi/
         ZKGdYmtLJ8MORiFn9hoW67AllHC/zI6136o9xMU6G85xTksAZnazypn2+ZKZgQcmiJHu
         jIYA==
X-Forwarded-Encrypted: i=1; AJvYcCUNgr8J1AWm3wKebspaMJA9wjAFuhArLvjsMur1Kraz7vF6J3eb+L0zneZ7EzDnbmOE+8gb4nU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1z41wXRanaoQdai6ACoI+2314bzKwK05NJQz3ubjI6NeD/2tl
	NYNP3SJf5eE9COSFteBY0t+U/6OvNKaI2DwU3JhQl9EPE6dCoFgh4bUu
X-Gm-Gg: AZuq6aJ22b7sQ4Qz1uMzjSa9UIHTBmFIViz4UN6p7abaSsks3TEqveUKMtfAh1DeWTd
	jsCeLN9HbnDj9Ztdm+E+XGlgEOkxsubNivtZOvsAViH1B8HmxCQP0tnEM6IhC3EeOCHOYEnbaJ0
	Ag/h2exziuyDHVKaOtDdCB1o7hss/uWIsbMdkc8gtl8Y3u50X9cMAAiWLuOR8LmnizYOdtPtdgy
	NsPAT9ZIPgxSwKyKVNB4sMWuIHf594soE3rIUT4+JjvxvEWsEVFUliRAae5PulZIopxjnCple4r
	OS7Tpbn1ZsNi6zb+ceIBR/2wT+ImgD0eRtRqi8Ytorlwrzie9JChpPe9+bFEckO3/hSnSZls5eq
	tSWRsYmQQhS/wrdCS3MpgZd/9RgUBY9kirEpoM1jBAYAQAdT1zk5f3YwADF4VUBsVmD6GuYWsIb
	9JPE10eQIoWmZIbkahHZy+FhZW3bYtsyDMUOHltWxoRHTHml9jqSMZ6KCst2P+
X-Received: by 2002:a05:6a00:21d3:b0:81e:a228:f0d8 with SMTP id d2e1a72fcca58-823aa6ee9a5mr14141035b3a.34.1770094930127;
        Mon, 02 Feb 2026 21:02:10 -0800 (PST)
Received: from ?IPV6:2402:e280:3d17:646:b60a:307f:3199:d66f? ([2402:e280:3d17:646:b60a:307f:3199:d66f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b65068sm19821711b3a.27.2026.02.02.21.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 21:02:09 -0800 (PST)
Message-ID: <399d4ea0-5f70-4678-b0d6-9a80c3399ceb@gmail.com>
Date: Tue, 3 Feb 2026 10:32:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] wifi: ath12k: fix CMA error and MHI state mismatch during
 resume
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org,
 kvalo@kernel.org
Cc: quic_bqiang@quicinc.com, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260202151720.49904-1-bjsaikiran@gmail.com>
 <125f0ecb-79a5-4806-aa93-aecaf937885e@oss.qualcomm.com>
Content-Language: en-US
From: Jayasaikiran Banigallapati <bjsaikiran@gmail.com>
In-Reply-To: <125f0ecb-79a5-4806-aa93-aecaf937885e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_210211_698389_8CDF4845 
X-CRM114-Status: GOOD (  13.11  )
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


On 2/3/26 08:21, Baochen Qiang wrote:
>
> On 2/2/2026 11:17 PM, Saikiran wrote:
>> Commit 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") introduced
>> system suspend/resume support but caused a critical regression where
>> CMA pages are corrupted during resume.
>>
>> 1. CMA page corruption:
>>     Calling mhi_unprepare_after_power_down() during suspend (via
>>     ATH12K_MHI_DEINIT) prematurely frees the fbc_image and rddm_image
>>     DMA buffers. When these pages are accessed during resume, the kernel
>>     detects corruption (Bad page state).
> How, FBC image and RDDM image get re-allocated at resume, no?
>
> To clarify, the BUG: Bad page state crash actually occurs during the 
> suspend phase, specifically when ath12k_mhi_stop() calls 
> mhi_unprepare_after_power_down().
>
> The stack trace shows the panic happens inside mhi_free_bhie_table() 
> while trying to free the pages:
>
>  mhi_free_bhie_table+0x50/0xa0 [mhi]
>  mhi_unprepare_after_power_down+0x30/0x70 [mhi]
>  ath12k_mhi_stop+0xf8/0x210 [ath12k]
>  ath12k_core_suspend_late+0x94/0xc0 [ath12k]
>
> The kernel reports nonzero _refcount when attempting to free the CMA 
> pages (fbc_image/rddm_image). This suggests that something is still 
> holding a reference to these pages when DEINIT attempts to free them, 
> causing the kernel to panic before we reach the resume stage.
>
> Since the pages cannot be safely freed during suspend, skipping DEINIT 
> (and using MHI_POWER_OFF_KEEP_DEV) avoids this invalid free operation. 
> This also aligns with the existing comment in ath12k_mhi_stop which 
> suggests using mhi_power_down_keep_dev() for suspend.
>
> Thanks & Regards,
> Saikiran

