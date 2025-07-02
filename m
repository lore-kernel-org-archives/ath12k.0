Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DC5C7EE30
	for <ath12k@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=um54tsybIQGov1so14z99eeBcqw/L/Ty7QQVOkcxLcU=; b=iyudjQaQr9rtmulXmQ679Ocq2D
	u4DnPGhZXGt+RJM3VOum/1447lGw+UQ9AvIZJRRxMZT8gwK/vNqQIHUgPHddSZGNCzK3X4x8LnyD3
	uoIPLzHbkK5w0WQwpQZP9x7g8VWm+nuVvCJ+ndOz2TgK9qYnwg3rTvmEFn/0w+taA+GKpVoTTauQX
	y8tECuzWBdmjuV14HT9WiliSV9x/yqdVvnr0ZSV3wBxf7e/Mibgv6N3bxdj11wO/606qcV1zoNLcK
	+2/viXlYJonYyXXKnNljXMOBBBM+Br0lvK3byHvYF9Ths1zXM18FNGOpvQo1bGMgawWgEA6YO75UI
	y19CNo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFQ-00000007Xzn-2vrX;
	Wed, 02 Jul 2025 07:51:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpr7-00000007GiY-42Mu
	for ath12k@lists.infradead.org;
	Wed, 02 Jul 2025 05:18:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-acb5ec407b1so712068766b.1
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 22:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751433480; x=1752038280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=um54tsybIQGov1so14z99eeBcqw/L/Ty7QQVOkcxLcU=;
        b=EQen5taxp8A9/sttKhTIiYUVHuz13CWBeOOhmTuoldrP0oSy5lYZruM/3Jfcno3jzQ
         aqbboapSPaSnVlT5RquU1u/FyoLBUf1/hfESAHpZTGfEyiII4L2BmXNN9/EVvJX6Fc6K
         UeIeBMzH6GT3qFWtvAC1fAPHzUITPuQP5Mir5gBM94emytX8MDJ3tjd75j52Ann2SebT
         KLWMfkXOt+lhMCL29oEvfX+D7Ja2NuTzLsgvYRQYYjMpPwlDEhTnTMuB1yn4YBoTFjRU
         XZINJBDJWJX4iZFw/lLH8qZu/7j+65HxaDz6lma0TiqorofRRnT5oo9NRbRo4EFi0A68
         mWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433480; x=1752038280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=um54tsybIQGov1so14z99eeBcqw/L/Ty7QQVOkcxLcU=;
        b=p+pJew7tzsiEyuulY/uicIrHupcm/TWJlU+vWCvKQfxWHrvMOzipZZPWPk+7V7y43J
         Bm1XiF6XVb5kDw8bSluDLMdAb8D4QbVfBTPxj3tyGX0Qb5M20PtmZNL4tEXwWJAjWrhe
         ZC5zHwwggyftiYTMyvr8mbyZOWIoqQgCRdLjqBqJiMuy04g6oepu5vQRD49MdWakkvOx
         3S771NTDQra9h1NTHiMx1UsMqeSdSQGFk+Nw+wDj1zKtOdSusdrbIiKHpF6GQmq+j8eX
         RmhbLfV8gneHn23nALrxx6dedQifNeAMS8X73Z5BCIb3r0jkV3dZrbCe5QBhDizP7q4C
         15Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXAyKa8y++ObWEjX4+2RgbF5iiHtHIWK5+LiAhHY/eT8qKG3HkT+ZracpdTYC4zfkdCXu/rzE4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3md7sX7OgZZ6Dr1fsGnI6rXjns8/fof08uWc8/TOLzdF9HXa
	WO/anPP6zQFdcizvVFNVQK2zKjMRCAModgqjfXj6PJsFyIAC6Uivxj7YsBmJcOG2P4Op1+oyXH1
	oLNMPkZQYz0eQJFutBHgk/HIsX8n4dJg=
X-Gm-Gg: ASbGncu/uisyuvQSdUiM104v/Q1/IH5M4vNjQGk2u8fzhmpgpvsRV/SjCDCG0Lk33oo
	67TQ4gCb8Ss/RBZCNsWxX4gIlzUuC7VJVKwrgYV9uD0D0YF9sJMeQX87OY7qjQDT6jVDPLwaSe+
	MzCg/ZpIU40gDgs4iaW4ThoNo5WcrsJjEvLzSRRFRk7McCt8I0Hnb7C3CFJ8liGI95B9IU3k08w
	Q==
X-Google-Smtp-Source: AGHT+IEMkmdwzlSGJeAQ8PPaXllLIAjtkJJZeH3b5OICmbQtX7VsVL5Q9yjPcEMmQTvGVa8fRMj8QxumFogFy9cFkSg=
X-Received: by 2002:a17:907:1ca3:b0:ad8:8529:4f8f with SMTP id
 a640c23a62f3a-ae3c2da9cdfmr117080666b.45.1751433479523; Tue, 01 Jul 2025
 22:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com> <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com>
In-Reply-To: <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com>
From: Matt Mower <mowerm@gmail.com>
Date: Tue, 1 Jul 2025 22:17:48 -0700
X-Gm-Features: Ac12FXwNkOaqmG2BtbfIHH58QXlArNNvzinDBRJOE7pKkFaCFWQUgB-Rk0U9dvU
Message-ID: <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, will@kernel.org, joro@8bytes.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	1107521@bugs.debian.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221802_000016_75088764 
X-CRM114-Status: GOOD (  13.47  )
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

> A couple more things I'd try on the ath12k side: firstly, boot with
> "iommu.strict=1" and see if that makes the faults any more
> frequent/reproducible;

The issue is easy enough to reproduce in 6.12.27 onward and I may be
mistaken about the rarity in 6.12.22; I reproduced it relatively
quickly in .22 today, so if this was the primary purpose for setting
iommu.strict=1, then testing with or without strict works. FWIW, I did
test iommu.strict=1 with 6.15.3 and still have not reproduced this
issue there.

> if a fault is fairly easily reproducible, then
> use the DMA API and/or IOMMU API tracepoints to compare the fault
> address to prior DMA mapping activity - that can usually reveal the
> nature of the bug enough to then know what to go looking for.

This is unfamiliar territory for me, so I hope the following is at
least close to what you requested. If not, happy to provide more test
results based on a set of instructions. Here's what I did:

1. Set CONFIG_DMA_API_DEBUG=y
2. Set kernel command line to: iommu.strict=1 log_buf_len=100M
dma_debug_driver=ath12k_pci trace_event=dma:*,iommu:*
3. Booted and waited for page fault, then cat'd
/sys/kernel/tracing/trace to a file.

Additionally, though I'm pretty sure this is irrelevant now, I added
logging after each dma_map_single() in the ath12k driver to print the
function name and resultant address to the kernel log.

Comparing the addresses of several io_page_fault lines in the trace
and in the kernel log, they line up. So, I'm hopeful this is on the
right track.

DMA/IOMMU trace: https://cmphys.com/ath12k/iommu_dma_trace-20250701.log
Kernel log with additional logging:
https://cmphys.com/ath12k/dmesg-6.12.35-20250701.log
Diff showing extra logging added to v6.12.35:
https://cmphys.com/ath12k/ath12k-extra-logging-6.12.35-20250701.diff

Thanks,
Matt

