Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADD6E83052
	for <ath12k@archiver.kernel.org>; Tue,  3 Feb 2026 05:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dl8cFanWWi/ieSsGUqpoQ78qPinKwYMKkeP8w58AS80=; b=c4g8nBvmlYpTAJRCwl+Cq4BWNd
	dQYiN7yp46UPSxAG7+VIQ+O9Ib5HEg7bSCnW15r7bK3nU8coLytIX5gNSURm63LRQ5odVEKKoGzzz
	6CwY6Ea2SCbIpfh8+K32KfGHw1b1L5/CsZjP+1JrViMfl7XGaBmsfVysp3iqU4v6M2emPfdLshpTY
	GX4834QEzxlY6tvySj0mN7roR2I+G1s+f3/Mq1jX+lri3CnXf9hN1nFE0UeUTjwZ9/q+Im7RdWbtJ
	OemJHYT4XCl2d7RdwcNKiSipdDKiXKdkbo7931aAi1FbNZX94cMGX+kiHHncW2sTfxWUn9ICeLzpP
	fBjf/HpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KO-000000068Nv-3HWn;
	Tue, 03 Feb 2026 05:51:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KM-000000068Mm-31Q3
	for ath12k@lists.infradead.org;
	Tue, 03 Feb 2026 05:51:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a9296b3926so1126375ad.1
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 21:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770097913; x=1770702713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dl8cFanWWi/ieSsGUqpoQ78qPinKwYMKkeP8w58AS80=;
        b=RKRcwCoOIHPUsoUs7Lm2T3iqIpctBY93vS5rVJvpuvZ7sdaj9UVvHO70BPYFejvvOS
         1axpo82xZHhbVJ16ga9qWjue9++sSby8tRO0/bnRkOkxEwnwquLCtrt27iyj9CCYzbjX
         8npy3JSttH5ac1RSnV0iWQDz5W9nUYtcxG84zoiwvkUMw5JGzAvqanNQmbu6FEOEV+z6
         jB3ByYa3wSIgNMKpDKl0pdydHZttbQkau1+DLQNwGvNtUg7fx82SoYMTL/m2Q/ueyd1R
         oR3qoGETHBaD+2N7lO1mYNDEg4kNzuPiaFvsuX7KrIrMwuE/xnLhhORgJPo/GYJ9OWfJ
         MXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097913; x=1770702713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl8cFanWWi/ieSsGUqpoQ78qPinKwYMKkeP8w58AS80=;
        b=B4bUnJOJOwJFCWKu9PoWbM6RxrF6YkaddlEO70hU0FjU3CltlLNuP6dTYwbez2VdGI
         Ilyw2Oc5059Xl+yN+AzDdGxHc+L0OaDOLyilgvSmCya9Qe9K3dKFU18VexQhQmOYS4zB
         SQyuR1HPh9E7DJXSXLG4P6OmyrfGxE6bhkMlMqkdAMeGIH9RdirTgelbkd0kMVv6Vwh+
         PGYhLtnIXRJS7ZoQHL9LvdqsB4llag0H/x1oB9q66W0kQgbKmXnmN+5uEzmoc8yEARxB
         5N7F1OLJgvFRbeQ9xXYunjVDkIVjjqOrCBv4htWYyzdcrUeJ68rM+4wDUXx5TQHoHGuN
         FPdg==
X-Forwarded-Encrypted: i=1; AJvYcCW9TUjv0s9EcXwqxm3Jqe0zJb+iNWnFFDxdnXtrTR9CV5OWrGzGVHQ+9S8acU/S4/YABEP03fk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxtU4X5LSgKTffG6Nr07bf+cb/lWYi9fnXQ1rwIcb+hKDR5lRI
	GaF78lufJYws9HJjxAT5auOGyMgI/Mb2mHjx37iXAAgP/m0omyj7ceTX3tfglg==
X-Gm-Gg: AZuq6aKu7d072cXsCOnEhDwxSRv/ATRDINJTbnpQkaC0cxOONnKbtESSTco+wvAkhnd
	QWtlprW4iXqEXXVRYBW9OpDrdiYJ305Rf00euLW8XniQA6xRhLe79SvIwMogRrqrVC00R/JM0rZ
	bnWdf7O/moApxfqm8sbLxeVSFcoPBa1g/nQAxmHREJ/fkVUXLJF68g5RRNzfs3qcSnd/QQfntYK
	exE3In2M6x5Lur6+H69lGiq2WMxHwotTSqKUYFgGQwQVPHBBViv9nWj7PMhEh+KzuA7mqYT/qrv
	M7/Knt9oH5sKgVLPwtRFA50vGaxZAiMrk7kZK1LESi43NsyDDTaU+/TeMcgVs2cfgwqeys2actc
	TNP8i8004QLeCSbfICUzr9zOOrZT4nSxhtRMPmO481KJJuIUYUN24yGSHcuxPZAWdx1In+ZbTLb
	r4eQv/WKODDbVtMwI+SdKBDu9GF+7FUTyXpkoi4lts/6WyfjQ0qqWI2wmQIq7R
X-Received: by 2002:a17:903:41d2:b0:2a0:ccef:a5d3 with SMTP id d9443c01a7336-2a8d7eb531amr148064685ad.3.1770097913351;
        Mon, 02 Feb 2026 21:51:53 -0800 (PST)
Received: from ?IPV6:2402:e280:3d17:646:6c0c:5f7b:2f06:7cb1? ([2402:e280:3d17:646:6c0c:5f7b:2f06:7cb1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3db4sm170016365ad.50.2026.02.02.21.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 21:51:53 -0800 (PST)
Message-ID: <aa252da5-a9fc-4c86-ae78-1de1f7c34bb2@gmail.com>
Date: Tue, 3 Feb 2026 11:21:49 +0530
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
 <399d4ea0-5f70-4678-b0d6-9a80c3399ceb@gmail.com>
 <eda602b5-6d6c-4ef1-b07a-53af4b226549@oss.qualcomm.com>
Content-Language: en-US
From: Jayasaikiran Banigallapati <bjsaikiran@gmail.com>
In-Reply-To: <eda602b5-6d6c-4ef1-b07a-53af4b226549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215154_776576_A5158C5F 
X-CRM114-Status: GOOD (  17.51  )
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


On 2/3/26 11:00, Baochen Qiang wrote:
>
> On 2/3/2026 1:02 PM, Jayasaikiran Banigallapati wrote:
>> On 2/3/26 08:21, Baochen Qiang wrote:
>>> On 2/2/2026 11:17 PM, Saikiran wrote:
>>>> Commit 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") introduced
>>>> system suspend/resume support but caused a critical regression where
>>>> CMA pages are corrupted during resume.
>>>>
>>>> 1. CMA page corruption:
>>>>      Calling mhi_unprepare_after_power_down() during suspend (via
>>>>      ATH12K_MHI_DEINIT) prematurely frees the fbc_image and rddm_image
>>>>      DMA buffers. When these pages are accessed during resume, the kernel
>>>>      detects corruption (Bad page state).
>>> How, FBC image and RDDM image get re-allocated at resume, no?
>>>
>>> To clarify, the BUG: Bad page state crash actually occurs during the suspend phase,
>>> specifically when ath12k_mhi_stop() calls mhi_unprepare_after_power_down().
>>>
>>> The stack trace shows the panic happens inside mhi_free_bhie_table() while trying to
>>> free the pages:
>>>
>>>   mhi_free_bhie_table+0x50/0xa0 [mhi]
>>>   mhi_unprepare_after_power_down+0x30/0x70 [mhi]
>>>   ath12k_mhi_stop+0xf8/0x210 [ath12k]
>>>   ath12k_core_suspend_late+0x94/0xc0 [ath12k]
>>>
>>> The kernel reports nonzero _refcount when attempting to free the CMA pages (fbc_image/
>>> rddm_image). This suggests that something is still holding a reference to these pages
>>> when DEINIT attempts to free them, causing the kernel to panic before we reach the
>>> resume stage.
> this seems like a bug either in MHI stack or in kernel DMA/MM subsystems, rather than in
> ath12k
>
>>> Since the pages cannot be safely freed during suspend, skipping DEINIT (and using
>>> MHI_POWER_OFF_KEEP_DEV) avoids this invalid free operation. This also aligns with the
>>> existing comment in ath12k_mhi_stop which suggests using mhi_power_down_keep_dev() for
>>> suspend.
> first of all, this is a workaround rather than fix. Ideally we should try to root cause
> the issue and fix it in the right way.


The original comment in existing code:


/* During suspend we need to use mhi_power_down_keep_dev()
  * workaround, otherwise ath12k_core_resume() will timeout
  * during resume.
  */

This patch aligns the code with this existing intent. The driver was 
previously

calling DEINIT (and freeing resources) despite the comment advising to 
use keep_dev.

If the intention of the driver authors was to use keep_dev for suspend,

then my understanding is DEINIT is incorrect here (Correct me if I am 
wrong)

regardless of the underlying MM behavior.

>
> Secondly the workaround here seems problematic: you skip INIT druing resume. However note
> several hardware registers need to be re-programmed during this stage, how could the
> target work if its power is cutoff during suspend and the register context is not restored
> during resume?


In my testing, WiFi functionality was fully restored after resume.

The device associates and passes traffic immediately.

My understanding is that:

ATH12K_MHI_INIT primarily handles host memory allocation (which we 
preserved by skipping DEINIT).

ATH12K_MHI_POWER_ON calls mhi_sync_power_up(). This function triggers 
the MHI state machine,

which handles the necessary BHI/BHIE programming and firmware download 
(SBL) sequence.

Since mhi_sync_power_up() is still called during resume, the target is 
correctly re-initialized and

registers are programmed, even if we skip the redundant host memory 
allocation step (INIT).

Thanks & Regards,
Saikiran


