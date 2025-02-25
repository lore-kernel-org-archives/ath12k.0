Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B15C18E7C
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajNLyEn1d1TTH7RCZcHpJ4NW4gY4KZnm0RrXGLjbeu0=; b=Lt2yDAnbOH+WLndqECrdIVQP7h
	iFZQ2BgGFIarLa7Acq7+UMWvLL7WCWxn182RwWRMitlFy3lmmXFQWhWKeJUwg6KMVUEw2xse/UXYF
	3dPJSakwhKDW9ObEqcgm2WjJQwjOo4hVnu4gnRGzYXrftgL3BeMjGHncYJ+BIocGmnDdDM+08dTWM
	gtQenpeGfpkKPXJNnORNn0uWA+cD2PLNBiTGihS/iO9ohWgnpw3iwqFi1SndTMfqcfaUQpkGGfGGt
	gwmlrDrEjY+WBd0Ir3JF3sUKFAioE5bR11NNcHnh2SOOsQ3m3kPUFwOcIn/rzYxMKPMMdlL3LvVFW
	73wLMrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyaI-00000000ao5-20cD
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 17:19:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyWz-00000000ZVZ-1ie5;
	Tue, 25 Feb 2025 17:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6A056129B;
	Tue, 25 Feb 2025 17:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F6C4CEDD;
	Tue, 25 Feb 2025 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503740;
	bh=ZF1rAhCMbOrvp76SA+oTUJgptcVWQVsV/ij4xenjie0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i28EhJ52IXq3mC5Lc3lOt22PkbrYUq4RV8yoxln8w81ZgPuc5yn9Zgwp1FTKe90XS
	 z3crKCBTuHWP1++96ZxuvzXgk9a3+/U3/mqAlhPyenGj2Rzt6wJjqTHWsgRGyJTVN9
	 G169Klzw/0lOhbX1lGAiyaFePgWfur1/vrJKhkRlBm6i+E+Lwh4oTtWDvG8t4jomR7
	 /J2BMB8mZH7jVmxyN5HHYWFKUOpSJay7b/MwGzDNJYJ4quuMjNfRsGCcyJEiKuEQUU
	 2wBv/glI9bXLWBmmtBII410ZzTgf3V2E0fF1AWbirgL7qjiVhpqyt8QBfVhDrx9MXd
	 wNqNChMAHvvYw==
Date: Tue, 25 Feb 2025 11:15:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Conor Dooley <conor+dt@kernel.org>, ath12k@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: wireless: ath12k: Strip ath12k prefix
 from calibration property
Message-ID: <174050373800.2716505.16558517329137280278.robh@kernel.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
 <20250225-b-wifi-qcom-calibration-variant-v1-3-3b2aa3f89c53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-3-3b2aa3f89c53@linaro.org>
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


On Tue, 25 Feb 2025 10:05:34 +0100, Krzysztof Kozlowski wrote:
> Devicetree properties describing exactly the same thing should be
> reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
> certain calibration data, so properties should not be prefixed with
> device family (ath12k).
> 
> Deprecate qcom,ath12k-calibration-variant and alike, so we gradually
> switch to a common property.  This will also allow moving these
> properties to common schema, if desired.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml   | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


