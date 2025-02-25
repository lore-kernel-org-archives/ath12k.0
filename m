Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58D5C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otofrhCMJrvXe4MXmMzw0/uFlwKxINjHvm8fHlxwC3Y=; b=Vpu3pBOwFpZqlJdMaSnPgA15J0
	9llm6vr7dWRVgLRXrBUyGk216G/steFqvCT6RDMfFmozSOOCZsN738rl39KuUkLCSWJwBNB5UsMIw
	SOpvoHyG+ZGCmcoM7EfKkuPsmlNDYFT/IEsmFw6GjWfv4bZRFJHHgOgjGYDYO6RZ3jU0SE2grzY5y
	RqDQlgwCMWb8vJVI6dxfvnDXN3JyFLHFg8aX8q6eid0XZ0Az3xN9AwTQOamCmPSXsHMAnVOngsc1K
	X+/lU/tYCJ1lk69k2OhH5e4MwnQnRW+8DulVPAnVa2qXR9FUTK7MaxjLBZf/UblakyanU/fTVWWNO
	xjf2R2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrpt-0000000GkgM-1in2
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 10:06:45 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrZr-0000000GgdI-1A66
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 09:50:12 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-307325f2436so52551401fa.0
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 01:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477009; x=1741081809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otofrhCMJrvXe4MXmMzw0/uFlwKxINjHvm8fHlxwC3Y=;
        b=Pmd4uFv+2d8j2ftgipP9bYB2Tnhy2YJhXd8P0kHi8igrRpRJbqLfU4ijUNnglBXeQK
         HIgPHP+Bc8xc0hJDFqY+CxsGCwypgxDaCdDJ4Lyo/p1xuNUNhXNLlMN2EB+HqCMwKYfE
         Q/Lnsz+YiUAk/a7Rl3CywEaLgnHe3rCg2PaHbBewHx/wIpyjetT7AQquhcNg7ZkQ258X
         Sy6YPGhAPGfXeCMfOx4OQz+5TbMin0nZn2wLkOVfQ9YmtnPEg1NEiFSDAcTyzBsAbrvZ
         OGqRR2r9GfV8vhZJ2IuDRz6LOmCuxyySQn+k5hGPRus0nSCNKEUmcl691zKaL+hGxceU
         6QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477009; x=1741081809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otofrhCMJrvXe4MXmMzw0/uFlwKxINjHvm8fHlxwC3Y=;
        b=khQEAaEd1X5UcXYUkFh/tGFdRhV8mTZzSonKOAXbUfOfFt1JbJbZ33lFdpmAswXd13
         KWdq6KJ82J2un3902SAAj1EowFqeEbIqE6X2MOBkQ3NSI9lDJBtM37iTx2giUosbcpNn
         r18pQGlMoCQyWcyu2t6d84AHUsWPWsSyTg4zB6dm+oodAkDanQn/cdeSPInaPM9VY4KA
         +zeztl6sf1UkVCKVqGN03DU7zGmqIyEyiCY7eqTI1czEGw+DuNy49+SQgmhDPJ6p/6rm
         dYAV6awpz5VCCNWxRbYBKC7Emqr0A7JsBdAXaJiMqzb+sbnjASDSxK0L9GjX4OnFK+1L
         TNiA==
X-Forwarded-Encrypted: i=1; AJvYcCXm3thcM/7R2uEqlEOu3LauDq1qiJyxDqUQ/Emh881JhPwD7xwhyeQBwu8jvdgBDruql8L002c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLp+gu6XjM04+PXQ3qbUEQwqBCAHbyX6T3d/23pSFX7NQs7xHG
	WqUZO2DaZhkQ9Bky2S9XdBitt6YXuUWw8A0QNznZwuCozpSKTX32kBfjlQD/VDY=
X-Gm-Gg: ASbGnct8xdswNXztd8fUhP2hFO2bSIKUwmNmzTYoARF0wtzY3ZZijEQegkhlehjOA7j
	ZQlI9q5Yt030FUyQXwCXAq4eLfzVHxzcP8irhcYOv0OSZ2rrQeL14VLFjNxagxn6f3vOTilKa3y
	at+4e8jDUwQoenhsbIx/NsEsLAyU/eJo1PwCWtcsl6hQoj8TT26qkiuzCx6IJvq9/I7WBMXQ6d4
	5ZMssE92Ulv6+Ucg9rhfFubjY5dSKiFKHMglshXNvhtaaY+pSREXU2ZpX//ifuF/Ggq/GPrJWr4
	8TyGHONOV4uPARb1UBw+frlrrdnfAiup8ot1Oaf+pnKSEibAmOPh2XAooNKooTL+zw6yid1oVq+
	95HUy8g==
X-Google-Smtp-Source: AGHT+IEtY9MXnrKuueCiRzVzb7OItS2ebjSxuUsGBPUIBg/R3EahURMlwlNSOkla7VNzEjmEglWcsg==
X-Received: by 2002:a05:651c:21c:b0:308:f3b4:ea66 with SMTP id 38308e7fff4ca-30a59987bc2mr54809491fa.28.1740477008948;
        Tue, 25 Feb 2025 01:50:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae819esm1788281fa.103.2025.02.25.01.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:50:07 -0800 (PST)
Date: Tue, 25 Feb 2025 11:50:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
Message-ID: <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_015011_323362_F34457AE 
X-CRM114-Status: GOOD (  19.01  )
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

On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
> There is no such property as qcom,ath12k-calibration-variant: neither in
> the bindings nor in the driver.  See dtbs_check:
> 
>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> 

Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
calibration variant in case it is not running on the ACPI system? I see
that it uses dmi_walk. Does it work in the non-ACPI case?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index a3d53f2ba2c3..9aff5a1f044d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -674,8 +674,6 @@ &pcie4_port0 {
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> -
> -		qcom,ath12k-calibration-variant = "LES790";
>  	};
>  };
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

