Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F05CC6B3A
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KR4i4KxOGzdvwjOBg3czI4/01caQ5A7Fc1JHBGRwQTE=; b=snkHVpMcAdIyVUyPnn1c4w4pif
	weG0vKArQ+Vq+pPTUt1JvKg9jDlITYaCY/NuNzwdjhAy+LQK7aCQQlXAWYMnvVXZ1JUYnXcqhz0Ne
	vMPnAYYUIGoIyNygfokxYasIvzwKx1jOJfr/rDrRm1iw9eFyOBqQwYNQP9t+DrBxXPu826OnSsIWY
	mc5hrKbdXktw6x1w0/L5ed+PNHxoDa7XtTf9TkeeCWF3Wj2y+GxkMAfuKrx8siu7H3ob3SFBCPpE7
	/TWIC6IMBf4aabeKGbxuZvTKMlwkNVUvWqjVL2PYcWFvf81chMKQiVEbAa7R0HTQSieexX3r4I8UU
	0QHU0tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOJJ-00000000q00-07nd;
	Thu, 15 Oct 2026 16:28:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOJG-00000000pyz-1HnK
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 16:28:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df54150dfso598642f8f.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792081680; x=1792686480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KR4i4KxOGzdvwjOBg3czI4/01caQ5A7Fc1JHBGRwQTE=;
        b=w4kHfd3nwnHUXnWHLEk2ZokJsFKTR/+9IShZKPcAvVsckwtoIIoEpmVBslDCto5B+M
         zE6wpQhpoT93i9Do67YidCBj9DMm1hMB7SVWJCfwiho0mK70PlZx1mHaIpe76uQhe7Kd
         1TAAbV8I8ulzdOgyQS9W28Yxwg64nb5XWdZWqx5jiTb5z0RnnZIpPv7zbG7LEKINsWq+
         NlUbBZot8Cukh5imhNqfethQrRKiz43CQmCBv44ReN9fW6d7SASVPEnlDaNcYYOLt9G6
         FlcMA+x6PaEXaDSDExikqmMZMjlAcj9iZc5TnMWT37uoThYKAR5wypYUCdGtnL+9gwUY
         XB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081680; x=1792686480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KR4i4KxOGzdvwjOBg3czI4/01caQ5A7Fc1JHBGRwQTE=;
        b=ecfm7UbPELa18WDqOmA1slqSZMjT1C+AE59sEWFzNbZwuqAzkxFz0GMyiqJz1Irnp7
         72KVBPwzSP2INNkbRHS/K3pxYoq7q4ojPDEqkDiGGkVLNokihRGsMog/9XAgW1Pl68ds
         fjCz0XiV4sTlq/dTQKrcXVwAGuQ6++g9Hnw1MzpLQGtUzr+Y1TSv7eYqQzlC1eLzmpn0
         xVmhGBcLKOMHvkkF/9WQEZujVO+NfY6yrXNLMr462gbnn/sBCvWXMRAigCHcK4nEWLFd
         i7RxobYaLvw6zCkVIoCnD4L5k9dtMD7+ReknusCIMlYRvp22NB2YR4deGvfDjnszX3As
         0CIg==
X-Forwarded-Encrypted: i=1; AKwUvBzBstm218D27n0bNoMS+xKGbJ90I6W+qiBVxR8Lc3WPTYwM0/phOg0/0eP4O46puE3j9/nSKeE=@lists.infradead.org
X-Gm-Message-State: AFq9FYLKg0Gt9FZKZo1YbLmu2cV03Rmj8rQviNbd/BI9/XFn8oVn6M+y
	19PRGNRJcTdGoA+M2dQbGFgox7YkGQ0VuGwcu+hGz0sWbQ68QfhyiZu8hY3HRQAHRLs=
X-Gm-Gg: AYBFou208AslttDonSG6IVdJn3lUif1PDYLFoZAO3vh0BhWlo7sOXxvUp6cz5/+X3iN
	/KF1v/aImC66zjcKYOQMaBYRxBJfsC1AcykvvISJFuS+vN9Mg8X9j4pbbW8/Thi8/IuTC0vS2st
	FZOqDAMnCdH6cyZD/AOYn1tXRjdylLpGOGr4iNpRyhG1dYCgTn9+PHAuHp8yTuncDztTRYBWIQg
	pup3O/OdmbGQaPfgMRifax5N1YTZTH9uz2C5Y0djTowPxRApxX2zYSy+aUjxfpQeIpD683Q1AdD
	faVaw5MUr5y9GG1XRCG/8EKgJJCPy0MLi4OHnH5KDYvksxMkOvBuMtdMwHX1K63xZmjvTAkoefV
	LKbrVuAH4rYOgXeipkkpM9JEEuNjwUgIQzwWVfF0iMFY8bzN/ubOKkMoCTA82NAFXYzRcHciycR
	Ze+sNM3k1bdlDTAAlCtCRyi6PxJtswik5WbJYzp1ayDnLQaNXXhkzl7MfbEpR2JoSoP0A23hrT/
	GDqaq5QUAry1TUokNax1A==
X-Received: by 2002:adf:f341:0:b0:487:197a:5c1f with SMTP id ffacd0b85a97d-48dbaae84e0mr31568707f8f.49.1792081678765;
        Thu, 15 Oct 2026 09:27:58 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:7bdc:6c2a:a8d2:6ad3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm19545964f8f.20.2026.10.15.09.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:27:58 -0700 (PDT)
Date: Thu, 15 Oct 2026 18:27:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
Message-ID: <atD_AjZKaF5UtSUB@linaro.org>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_092802_377823_8EA22E83 
X-CRM114-Status: GOOD (  28.07  )
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

On Wed, Oct 14, 2026 at 04:02:38PM +0300, Abel Vesa wrote:
> This is an RFC: I do not expect it to be merged as-is, it is sent to get
> feedback on the approach.
> 
> Some values a platform needs (for example the WLAN and Bluetooth MAC
> addresses on the Qualcomm laptops) are not always available to the kernel
> in a convenient form. They may live in firmware-owned SPI-NOR storage
> (e.g. a DPP partition) for which there is no straightforward, universally
> working way to read them from the non-secure world.
> 
> As an alternative, this series allows such values to be provisioned once
> into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
> provider that exposes the contents of a UEFI variable as an NVMEM device,
> so the data can be consumed through the standard nvmem-cells bindings.
> MAC addresses are just the motivating use case; the provider itself is
> generic.
> 
> The first two patches are the actual proposal:
> 
>   - dt-bindings: nvmem: Add UEFI variable NVMEM provider
>   - nvmem: Add UEFI variable NVMEM provider
> 
> The remaining three patches are included only to illustrate how a
> consumer would use the provider; they are not meant for merging as part
> of this series:
> 
>   - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
>   - wifi: ath12k: consume a "mac-address" cell
>   - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable
> 
> glymur-crd is used here only as a convenient example for the consumer
> patches.
> 
> Feedback on the provider, and on whether sourcing such values from a UEFI
> variable is a reasonable approach when they cannot be read from the
> SPI-NOR directly, is very welcome.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

In general, I think the idea to take NVMEM information from a UEFI
variable is reasonable. However, at the end the usability of this
approach depends on vendors actually provisioning the UEFI variable.

Is that the case for your "MacAddresses" example on Glymur laptops?
Is any of these laptops shipping with this UEFI variable provisioned?

I can't really imagine end users manually provisioning this variable.
We have too much manual setup required already to be able to use these
laptops with Linux. Ideally, we should take the information from
wherever Windows is taking it and make it work out of the box.

For existing Qualcomm laptops with the DPP partition on SPI-NOR, there
is prior work that could be extended. I would expect you only need:

 1. SCM SPI-NOR storage support from
    https://lore.kernel.org/linux-arm-msm/20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com/
 2. GPT partition parser (not sure if that exists for MTD but the format
    is certainly well documented and supported already in Linux for
    normal block devices)
 3. DPP parser from
    https://github.com/TravMurav/dtbloader/blob/main/src/qcom.c
 4. Some way to hook it up in the device tree

See discussion in
https://lore.kernel.org/linux-arm-msm/de081bdc-4b10-4cbe-9b09-4652b63bc4b9@packett.cool/

The universal approach implemented here would obviously be cleaner, but
in my opinion it depends on vendors provisioning this variable before
shipping devices to customers.

Thanks,
Stephan

