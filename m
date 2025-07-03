Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94681C77B7C
	for <ath12k@archiver.kernel.org>; Thu,  3 Jul 2025 05:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP+HlsEPFU6TIdf3XDKmfsXJvNv/Rh2JlketkdKIzzE=; b=cUsUmcriP54dkB15zuAC+Gqhdo
	8JCu3kCvX8x8MdrgUNelcTghmkK5R+pbRSS/CAFHRLFc98eDl2yiSb6kU7d7a7nx90ivvSbRRPgyq
	qZ1kBn3FCUw7AuntLhPqx+JMTkbbl5pATGFDhq4k01nh6oY4U8OUaXQWSQmNrLLPBiitefrdbKE9n
	Lvs+wMaLmSoOpo69djXmXNZ2xUqIYobkwLiMp3BjB+E/E9y+6R7rPEtR34Nf96eRTzr07D3c1bjmX
	cuNj8n5ox8cwBvsZGrWJlXib1Mv0xhYPlvi2ggvHGkfucoMwcAw0E1B5ADh/935duXJEN6H+W+XA/
	m/RTU3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXCBH-0000000AFYr-1Qnf;
	Thu, 03 Jul 2025 05:08:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXCBE-0000000AFYT-3lIG
	for ath12k@lists.infradead.org;
	Thu, 03 Jul 2025 05:08:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so1245593866b.2
        for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 22:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751519295; x=1752124095; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FP+HlsEPFU6TIdf3XDKmfsXJvNv/Rh2JlketkdKIzzE=;
        b=BW2ZZ9FH0AfH/Ut5TRpkD7H1gSQsX9e6tZpe+TKGVMGQOOs1P7vUBjbanNphUwpLIi
         WNJSUxIm2k6i03itq2zcCGngfr6+juXXGvJ7S5ItLIgcp3UHCVed/KqNnvJZ2Fuxyd6P
         xNmVRWJgfzZtJ1NmYKcyb0PoIxc3Hg8GMz8WYKKTLtpSbWpKTlt50va7wWnhCOmNLJ2+
         8GzG/WDZWUf10pA4BCUZdoaQ3sfJNqatmBB0VZAg3g//Mtiso7wzLdgx7dtsXO3cl5G0
         v6ABJ7NYJhZLZQt8J7HdDOvJlDJok80xYlAoBn2/mCYRsvu2EgcF8EYkvMB2MpsvstRB
         1euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751519295; x=1752124095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP+HlsEPFU6TIdf3XDKmfsXJvNv/Rh2JlketkdKIzzE=;
        b=XjUXKZ9oiboAWHtWB1AALxxI15TmCOUVZb3ogUf18JM7b9aLhCIalMWSpwh/5YDcSR
         VUYa56kOA/+D+yfeQB7SnQo80I4HZv0O/EyhHYspWEEVPDm+/gd0x3kz1A6RnpTwEbdW
         13E3Ctoff6co3BWgqOKaDMkAeh+4N3oT3s2x1gpKRpcUNoqcHbIUUXmnal9hArLQqn7B
         xM2F3SXogUL260RAbAhheoYrZymxQzEGaviR9MhcKyx7hXUFHtZMJQqSz+Z8s0UY6hEr
         fAw7PWHM8+TLeaDoRTfq6NsGzqcxd9La4KFQZdO5SXUWlNPJstWctHaWnU4RrGP36Cdj
         v3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJevtnPP8dlWh6qUpipycnF3ge9X8dfuItTqkOTWuA9yJsSX+4WGnRjqHZXGOjD4cExU/r6SI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3GPY6BbICyc+fNaRKkAvBKKzRVD6f/NQlXL3BbkvZZWTtZc4D
	RSTtk6hm7zVOynSxGZ+UzaenF8l035WmNNu7ED8fjd0tYCx6YpN4069OW12YswoqQoPzJIBKQ/n
	JUM1KTmOvhL1qawA6D/4nwtSvlYGGmiU=
X-Gm-Gg: ASbGncu6jCcchBAxARSKoy0Ii+4WBUPbJ1Gfp8bqIxskZ09vojuJnYPHwFl/Tla71c9
	/ZtcKnOxcg7ECyKKP31yV1l1fgmRxfbR5t2py3ZNYTYlnjXMXVINaqQYIgyjR37R/mi+Nhc2KYW
	KErw0eZdtY+F2iiUKLFuhZKeCXQxSsf/lTMYyZER5F61s2otL27VtjZyXkAfaRq7ODRff8vb9nQ
	A==
X-Google-Smtp-Source: AGHT+IHFCdTi82wSUFoZbKhu3bgAxXeueg1CfXdZvxduIvqNncAFIUlZiFD2Q1YAOOrKv5LJWEyUWu4NAZfOJM0teAU=
X-Received: by 2002:a17:907:7e5c:b0:ae0:bd4d:4d66 with SMTP id
 a640c23a62f3a-ae3d8b75196mr153106666b.27.1751519294947; Wed, 02 Jul 2025
 22:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com> <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com> <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
 <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com> <CAPDiVH-xPDmx-KQx7YJY=7+kwJNbGY-rEu-w+cz18p=kjnKFsw@mail.gmail.com>
 <979be2a9-9d0b-4382-8519-2f6fbcac5375@oss.qualcomm.com>
In-Reply-To: <979be2a9-9d0b-4382-8519-2f6fbcac5375@oss.qualcomm.com>
From: Matt Mower <mowerm@gmail.com>
Date: Wed, 2 Jul 2025 22:08:02 -0700
X-Gm-Features: Ac12FXy02ncWee8Jpm5jJeudHeKd8QR02xkANsyNNiyukI5Beylq8Po2B-owL64
Message-ID: <CAPDiVH9Fi3Rw4K4npHMAEcOPMj=iFMEJOyhn5cRaq3+9kBYNZA@mail.gmail.com>
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, will@kernel.org, joro@8bytes.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	1107521@bugs.debian.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_220816_939043_7550FFB9 
X-CRM114-Status: UNSURE (   7.28  )
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

> in the meanwhile, Matt, could you help do some
> more work to narrow down the problematic change?

I went the opposite direction and started cherry picking changes from
6.15.y, starting where ath12k diverged from 6.12.y in Sep 2024. I
found stability pretty quick and was able to bisect down to a single
commit where stability started. See branch
https://github.com/mdmower/linux/commits/mdm-6.12.35-ath12k-1/ for the
cherry pick history on top of v6.12.35. The commit where stability
started is:
  wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/net/wireless/ath/ath12k?h=linux-6.15.y&id=afbab6e4e88da68cca94cabfc1604d71db161d42

I know this isn't exactly what you needed (especially since the commit
is part of a patch series, not standalone), but maybe it'll help?

Logs with ath12k debugging enabled:

1. Last broken revision in my branch:
   wifi: ath12k: modify ath12k_get_arvif_iter() for MLO
   https://github.com/mdmower/linux/commit/841b7f4af08f9d80e6db862218d341402dfc9acf
   https://cmphys.com/ath12k/dmesg-6.12.35-cherrypicks-841b7f4af08f-ath12kdebug.log
2. First fixed revision in my branch:
   wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
   https://github.com/mdmower/linux/commit/931abb9e838e376a53a82c0f638fb63a9d31e737
   https://cmphys.com/ath12k/dmesg-6.12.35-cherrypicks-931abb9e838e-ath12kdebug.log

I'll continue to test this branch to make sure it's not a false
positive, but so far it's looking good.

