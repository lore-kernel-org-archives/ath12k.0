Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F57C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0tAhdMCjgNxZtCb6MshbLajoLe3q2SUGqXEYZ7V7+4=; b=VyKRTr+sjjqz36iWX6Ad+VV2h5
	LlhIMZRnBQJyn+bJEy+LeqxAHAtc0Pk38JXLL9AgcN5yEdotzxwaF9Wtjl7vjz44gfJ7dCpX2rvJM
	4sFY5YrisppWI4Ft1fvFePCPRFEG4HHvTlnnx22G7kWsbkqVqwHec5O4GHBdxUmkrmKsI0TkF/kxO
	1KLS/NmHyDpjm2OjWhyLaLK6+vaikCd/h0hPxoWAKkKqWhDra9H+NatuWRccvRdim5WO0m+PrHgLB
	ejwXQEZefWK3YLHMPgJFGK+98qT/+6kINAn7S7ABMAEyh7BVflUmCvqjZfOcQ0fJS5hV7B1bfPfdE
	tq/54zww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtwD-0000000HC0e-0yet
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 12:21:25 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtNU-0000000H4xn-1w3q
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 11:45:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-546202d633dso5440982e87.2
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740483931; x=1741088731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0tAhdMCjgNxZtCb6MshbLajoLe3q2SUGqXEYZ7V7+4=;
        b=IP5pUuESebW2HVjwY3W2CUbbaVUS/XDmuKFk332s5UdH2dWJUXhvTY83dSrGqDUH4X
         RjBEyxKFxdqc6BacssYLBaU+IdTbl4SEdwyAYG7BjERx0hFy2DmUrt0jgJRU3sRMSw8v
         fhiN/LuqBDJcMafIgiBVtTb5g73PpfKbzGWtF218pE9TDh1t953BwEDkPPWIdNA0KBme
         Ca+oPK4Dxe5+pobOhi2n8Fst2AVJMSU3CRW6oAf2W2uAL4qW1d7d6fCod+Lytc3rqFO8
         g/dSzy5i+L/AkizI7T+r92+GjAO9M8kXX700Iy0uSs3WspTibM3o/gFCqR5l2NEQhJLU
         Afyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483931; x=1741088731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0tAhdMCjgNxZtCb6MshbLajoLe3q2SUGqXEYZ7V7+4=;
        b=db6WGccnmLBfdkF/LupefwCil+hcby1vncnYey5zPmSnVfsnzqA7NhnFb0Snt4l93Q
         Tck95ybPnbFuLwaHQdVnzhmXUmzEDWt1UP7JcQvMfX21DLjS8Lu0OhYCNtejXapoAVw8
         wRlPyyZILi1oPXyLZFAvzIXvRz2WxMBX4sqZetFhi8yaHPQzh7XBltcvCMBkAV/bOept
         M7LWrdFXU6Yf/1jnGjLWkQYxZtcepVg9ZCNUuxYzr7YNF3n4t9xL9vMH1VOuYaL5IuWc
         kTvQr0FrdowXCJXxRJ7PHINTmR83d9o5x0xjnFFJ0ODOo20yyvtP5pZFRTXI3UB3pU4e
         BGGw==
X-Forwarded-Encrypted: i=1; AJvYcCUtjumhIcopKyHFbkxUwucWbM57Z/oqcb2aq4BE3YJ9tvmwk8l1zKdhvwFwrvIrozV4En4Hpng=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSootEc8GYxkFU2mQXvvwXdKYkodW7AcAAtsOfLSNrzgRkBNDi
	rR10+GUhJf4K1r6pPJxoMtNnQkhNGe0PSeF+wb5hT4y9LDfGbV2FTq7nMh9y5jQ=
X-Gm-Gg: ASbGnctUXY4kJtghxsvodZFaRXGRSx5Hn38i47NsWvDnB4p0by8u1hsHO6UiwnYDKS3
	dQd7H+eREeE9txb7xdrJkULY0HF4BwCIXiR4VIY1VcAPVCMO+xPoUTONNIEOhgWW4hi7LZKMjrn
	quiddwphZPfgKfpkk0VqXiDUGNA41nJXORLJCQpgUXn9XaAhhdCXT57+6GeVF1IPTMEBqfnN+0Z
	MBeBj4T9R0ahU4QvORJdrVqu8y02A8ML1YngSnkQZkcMk6jbv4mHaCPWWdaLz1HnUyFx8c2wGlH
	Mmfi931Bpn0l2nk3jXtp7255XkAeUVhHiGGospkeMtd+AGqx1FSQtlfFOirFXfBxe+MP6dh7ZFq
	EKUJdHA==
X-Google-Smtp-Source: AGHT+IGmR+d4JyVDHMddvaufnQ8xwjoueCAW9+bbd51HI9oiQPJ9TK1XT6me9WBNmjo7RokqRJmgWg==
X-Received: by 2002:a05:6512:158c:b0:545:169b:9b51 with SMTP id 2adb3069b0e04-548510dba17mr1205685e87.24.1740483930689;
        Tue, 25 Feb 2025 03:45:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b2829sm153561e87.47.2025.02.25.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:45:30 -0800 (PST)
Date: Tue, 25 Feb 2025 13:45:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
Message-ID: <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_034532_514379_C4149109 
X-CRM114-Status: GOOD (  18.42  )
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

On Tue, Feb 25, 2025 at 11:22:25AM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2025 10:50, Dmitry Baryshkov wrote:
> > On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
> >> There is no such property as qcom,ath12k-calibration-variant: neither in
> >> the bindings nor in the driver.  See dtbs_check:
> >>
> >>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> >>
> > 
> > Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
> > calibration variant in case it is not running on the ACPI system? I see
> > that it uses dmi_walk. Does it work in the non-ACPI case?
> 
> 
> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
> git grep), so how would driver use it?

That's what I'm asking: is the property redundant or is it correct and
it is a driver that needs to be fixed?

-- 
With best wishes
Dmitry

