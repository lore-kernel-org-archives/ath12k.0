Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C4C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3VRt++PNXgAYze1wuBL06koGD/kVHXK+2ZFMicsw94=; b=LLIaGg8KddBBUEIr2EZFTAaTCk
	KEoIqHjH6kXQImx/TPUEKvLztJVTpjRhV6ytHcAsn1eBZN6f+R+TYl8U5JbBSoeDONnhyFW2KzgqQ
	JtetyNIwNBld0/Hy012yBdwcSlDttStCkJ7W/Rz4JV5bW0FNgfZNKlElPE2zk5xRWIevaapKgLDDa
	6gMWXWRMHHJHLuIMb2lRjh8ZviDlPO+o3OWYz6MvD4NbtM/KHNeGMtyICRFdKzcrCNlofSjPeAxl8
	0eVu3a5Q+ny4qNqtjdXzU/ioqdi2MagIWx3Ab6H5e8zFqeSDw0XRt6wTo1snI8SmHQdrQK3bjfD6w
	xArZjlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZi-00000000aJV-3x04
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 17:18:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyTX-00000000YdH-1EI1
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 17:12:08 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-548878c6a5aso816577e87.3
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740503525; x=1741108325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3VRt++PNXgAYze1wuBL06koGD/kVHXK+2ZFMicsw94=;
        b=E6X2o9j8H1OjhVTUkCBJnULB1J4L4mVeq1H43T33Az79HFM4eSRX9bV5NTwjjmnqb2
         yhJ59YjIciMEOFnfsl9K0GnA4OiXnWTknAWUuG0V5j2AkmdYHforXBzLmB5dIPwQlfOT
         xVUmgJ/zO6GmoE7Jv5XR+A0eAZzalpNA+MGvWAfgLLmvkd9zKmJIxmWyP+ldaWyhUoxP
         D55uqYQ2Z2FrmRSg05DJ+LoAL2PJqTp4QBqIeKcbw658V4eMpPXOfX9pKa+xZUTumlnc
         Ez46G5Ps3prtoEnYT1V+AkKsR3j3FTZEwwknvsj7Rg0et4U/0rvygV7kaEzY7DXMWGJU
         IFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503525; x=1741108325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3VRt++PNXgAYze1wuBL06koGD/kVHXK+2ZFMicsw94=;
        b=wVX6LT9M5F2p6ZqslKkj9xZGnhkii4zXldtWP/3Mru19s7oI6zuMtgKMUihoDjWgbm
         ShVYkNfYIVlj8vHuPjfLc8HDRDj5V/Fnlvt04nqM7XjAtKCf5hrOuTK1Qu+3+FhWsOeq
         ZF1RSLWcLoXWPC35KX31u/HkLtav1++peezKk9STTKXyXSyTtsmDXwCePsGrRfhYjUuE
         AEK/wKJ5rlpt/CmmUYNKb+G5wRuZOtUrXh2KbhCs4JWw0m9H8RRXXyKRFBICPlWl/uKR
         3T9spkHlxoITaZRVWL9huyb0GFSz8E3bQP/pB5wREKcr6kNMNoUi2RkjWPtX9vlWGPOs
         3ktA==
X-Forwarded-Encrypted: i=1; AJvYcCXIk/91kam6H9OEMQhYmjZBT/GnJiKuOGZIxM0xn83TLiuYHdEY0BtySAG3PMFM1w6komz7C3w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6atgbJFDfDfPDo5hA+2uvt8WE3v3OuPduGulGQk4oA24frot0
	GLKadFlk+kSZ0h7EPyzUZxryIo/jLPmEqQcjcgGwEBzsfBFYLM8V/U76w7VGNM4=
X-Gm-Gg: ASbGncsFqQG6/Y0mIoA10jO+IGoslcDHvCmUc8O3lafW7zhd9sZZlgJ0JFq6QdhcRrD
	mTvjLscxpLiWdTy2chZ3xptBUDqErk8KGewCqBHsDnu3axs2QRki2V8VMpvZdekfukCrURUxju0
	YTEZAXvgDDibxsN1Pj0bLCDsfh3JQKx21fwlYeEoPBJkpUkqdBbrGh75y20pIjgWgPRrlZMAVZ0
	QuOCVo69kMF1gFOR9+9XKqBl6kTtQBv9PLpu0iKkZNl50NByI1nE1Ci+2LKMaKUAWuLptvRdy+w
	A/xfX4hvULtVTI9A9k2Ext1a5zd4RruHhJEtdNnI6V4xSTGfGozLNUw/V0DTSjVbSh4PoX0W0tL
	nyduC6g==
X-Google-Smtp-Source: AGHT+IE6btY7yaSP+3y3DG+F1MNX01iR19BAywx69SlKvGbptKvY2IMq2suxBQapk7jTaUAQROgZ+Q==
X-Received: by 2002:a05:6512:1309:b0:545:aa5:d455 with SMTP id 2adb3069b0e04-5483913f943mr8455012e87.15.1740503524979;
        Tue, 25 Feb 2025 09:12:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f4c98sm221415e87.185.2025.02.25.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:12:03 -0800 (PST)
Date: Tue, 25 Feb 2025 19:12:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
Message-ID: <ymjjzpzmlmpjv4biipfnpojybk7ifrbey26vutlnufixakcfh3@kyinst3ku5ap>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
 <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
 <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
 <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_091207_345011_969F6D65 
X-CRM114-Status: GOOD (  25.58  )
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

On Tue, Feb 25, 2025 at 08:44:57AM -0800, Jeff Johnson wrote:
> On 2/25/2025 4:14 AM, Krzysztof Kozlowski wrote:
> > On 25/02/2025 12:45, Dmitry Baryshkov wrote:
> >> On Tue, Feb 25, 2025 at 11:22:25AM +0100, Krzysztof Kozlowski wrote:
> >>> On 25/02/2025 10:50, Dmitry Baryshkov wrote:
> >>>> On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
> >>>>> There is no such property as qcom,ath12k-calibration-variant: neither in
> >>>>> the bindings nor in the driver.  See dtbs_check:
> >>>>>
> >>>>>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> >>>>>
> >>>>
> >>>> Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
> >>>> calibration variant in case it is not running on the ACPI system? I see
> >>>> that it uses dmi_walk. Does it work in the non-ACPI case?
> >>>
> >>>
> >>> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
> >>> git grep), so how would driver use it?
> >>
> >> That's what I'm asking: is the property redundant or is it correct and
> >> it is a driver that needs to be fixed?
> > 
> > I assume driver will need something like that property, but that's not a
> > reason to accept incorrect one in DTS. One cannot add properties to DTS
> > without bindings, so bypassing bindings review, and then claim "but my
> > driver needs them". Send proper patches for driver first which will get
> > a review.
> 
> We definitely need a calibration variant entry.
> I've pinged the development team to get the driver patch.

I think we need a confirmation from sobody using Slim7x if the driver
can read info from DMI or if it can not. In the end, DMI != ACPI.

> 
> I'm also verifying internally that there are no issues with your renaming
> proposal: qcom,ath1*k-calibration-variant => qcom,calibration-variant
> https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org
> 
> /jeff

-- 
With best wishes
Dmitry

