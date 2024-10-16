Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43481D1AD43
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAXpBaMtfWO8UJVVjb65PyHD/dGQ0kmBoOJFKkFJy0M=; b=YALsquXbTVHZ6mFRWEGHDYRnNp
	FSbjjhPD9lPjJLu1iw1lFQe4au66TOEiT6KsXc4oqM7KMWJl4yOUp9bw7K0gad8++vpKjminkRARq
	Enp/eujNFJWGr3bzc07DJxFQQvRuu1M9eiMYRRHoSCz7dB3QNPEce411YyXgkNrwlt//S6wSM7RYc
	zPN/Tv+9xE+w2vm49u3XD3bZLknussKZECDemG179retnR3dVDZWvFS7QvUbLXs5fqAlYzPiJj6Ol
	IuoOGX2v87bBrw8jtWdU/dpdLDWERvtT76g4UXaPj1lovVhH483BcWjE263EbxSc65zUUbvSzy2ol
	nHmZvhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11V3-0000000BUmK-3a5e
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 10:43:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11Ga-0000000BRiu-1Lld
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 10:28:33 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so2808445e87.2
        for <ath12k@lists.infradead.org>; Wed, 16 Oct 2024 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729074510; x=1729679310; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAXpBaMtfWO8UJVVjb65PyHD/dGQ0kmBoOJFKkFJy0M=;
        b=shJ/2AQetch6MDcLtbaONB0+th1V2WJvp7ylx5sf/PlVnQ8C1VLvdNypAxVmRJ6P39
         6ICJUeFIMlR52UTAeYAC9xdvv+CJpt2y1ZAYUVY2XyqXLgpM1/ewhBGPq4sAb848gGRy
         pOgvKMCQ2m1mEEnUrj+OOJ1iVg84U39x3jQop5F0evw9QJYVRAOxhFZiQ8F6P+GgoIiW
         1NuK+TKwxW4xtD7DaLfFfN3QeBTrflKJ9jxrGdG6gyZUetgYflB8z3/ZZ3O3/jAnHyff
         wReq8gPVjd+NuDfToyCT1DQ9zAMkBkAvO7bDCGw+vE5fzHriFPsSVIVUqVYpn4Y0Qroy
         8q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074510; x=1729679310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAXpBaMtfWO8UJVVjb65PyHD/dGQ0kmBoOJFKkFJy0M=;
        b=DwuPGfWh976Sg8nBiCpCXFMlTVPjezf0PbXMJnPL4LsakOHLP0mbyJ1hQT/6FYAxfC
         dgxasgmbuPm7tzIDIRV1wecw6v/TiS+SVZIagtrJH9JHnu23MLKrOisrEx2JjkoOoQO/
         dgiWSBW5H6tP7nxES1wiu/0FQyB6z2SgJVcLnb8QxzmOGVvxRter4ksL/l1ARYRhAlVw
         0rryQ7m2m7eNofce4JDleB1B3uDCAr/yQIx2nEkvQsIAuot/GkiarB0mzDU+Vw+3z8uN
         LrWSrO2qSfphJ8JaZ3sXQ/D9iAYkeLKo3j9vDDEKpYkQmPPBfGb0p180Y3RMrRfycdb7
         Wy2Q==
X-Gm-Message-State: AOJu0Ywjzxss+1MxUiyHUBHQAZG3LF6jucKBYJ8SIlK/HeHy4D+OwNrq
	qhvKBem7M7tFmG2LTpXvBPh6mjKaCyPX0kw6sXhF/1/vlnpL16k4tlk/CP04pgw=
X-Google-Smtp-Source: AGHT+IGtiqjFOVGlArjjfVOfTBmXeHODhday3PR0qenIrPwNidjJwD23eHbV+vCHzblqwLmnxlmcVQ==
X-Received: by 2002:a05:6512:3c91:b0:539:f807:ada1 with SMTP id 2adb3069b0e04-53a03f97686mr2367940e87.58.1729074510575;
        Wed, 16 Oct 2024 03:28:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a0000677fsm402183e87.194.2024.10.16.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:28:30 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:28:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 01/22] dt-bindings: net: wireless: describe the ath12k
 AHB module
Message-ID: <qzjgpwemwaknwbs3dwils6kaa5c3inabfvkaryvc32kblzfhy3@6yduooj4dk63>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-2-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015182637.955753-2-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_032832_408523_3644C739 
X-CRM114-Status: UNSURE (   9.47  )
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

On Tue, Oct 15, 2024 at 11:56:16PM +0530, Raj Kumar Bhagat wrote:
> Add device-tree bindings for the ATH12K module found in the IPQ5332
> device.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  .../net/wireless/qcom,ath12k-ahb.yaml         | 293 ++++++++++++++++++
>  1 file changed, 293 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml

Generic comment, please add qcom,ath12k-calibration-variant

-- 
With best wishes
Dmitry

