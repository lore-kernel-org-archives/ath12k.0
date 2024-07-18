Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7FBC3DA49
	for <ath12k@archiver.kernel.org>; Thu, 18 Jul 2024 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt4qMEVwM35lFX7t2weYvu2/XW9ujOBzqearuBlFYJA=; b=HPZdSIHaktvLEgae0X+1B5Duig
	5nd9r9aVj9PfqwnZdL2jYZV1wF88TsSGRs2H5Wqevs0kzEji5cIAosMU9XhwpIPhKmgJRQkMtD3ql
	x5MMqgFvFWhEnGCIGicX2x2SUm5IBm7cYR0fZZTabccO3zSggM+DN1JN5QgZOb1NIWzJwQQg8MCVf
	X0gaV40iXQWyOvwig06ULINTmHC/3CErfCEbsFi9AnxUrd3THvYp7HWKFARRq1fIQeE5R9XK5Jo+/
	t26HDPogymQj3c/y7famrcUP6VtoIeaBCinQ6NxVgETUMjz0hHqoHtJZ2DQOKf8KbM6PTJt9UxceT
	l+q3M+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYC7-00000000cWB-2v5t
	for ath12k@archiver.kernel.org;
	Thu, 18 Jul 2024 20:57:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYC3-00000000cVK-2mng
	for ath12k@lists.infradead.org;
	Thu, 18 Jul 2024 20:57:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52e97e5a84bso1247022e87.2
        for <ath12k@lists.infradead.org>; Thu, 18 Jul 2024 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721336257; x=1721941057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt4qMEVwM35lFX7t2weYvu2/XW9ujOBzqearuBlFYJA=;
        b=Re4B2VHA4/wdC2dGZzu3pKr6STutsK3CIHirQ6OPeQVXQkmVc4tCmDgWUCLSbehLQ/
         PoT22umxmd6cRJ5OQ6fiKLDrrIFNTjhhqZNWX0KT24CZ+VxbgQJ1D7kjuFvDl15LxzAq
         SVYudAC6hYh8ev6rsRALCcPKaD/gll59uwkOoK54Dr6ZEha6xA+AiVIGiDu8XmlkuSLm
         Oan5TkUI+J6r1WRHHoq03IYbogbiy/e1hBcJPMjTsk+AhsOnd/VYq91G5IpWkJJSWtAd
         T4FSTEoo9OrxLXo4ijz95vSuTdW8Fb0BWq0K40FXQGYs/T5XJjvQlZ+GqkCpF2bi3YO2
         rN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721336257; x=1721941057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jt4qMEVwM35lFX7t2weYvu2/XW9ujOBzqearuBlFYJA=;
        b=c/GuouEzHSjbyrNj3ZirrATkqhGpqPkpjxFUs/GlYeUxxxuDxqXFDo3c1SX1RKn5bS
         DX+zhBE/K8lbDN4NSiHQI0b6IHhBAnyoxAHUzyOhmRKyb+dtCSi6ZITmW7cyJQ4PgJON
         2aZVyHfvm7PoYqiqwm+fIr3qS8e5FobL0GJv+10nA44T7KZvcBg+KgLvITgRpeVYoOHa
         TRHJ+3TQ+VF6LGYkeA2RwYxzu25IjXzkrM0AR+0Ac/IgDWDvDnyzI85jtq1LZD/zsQ+a
         JTthS+6oy/YJOYcjpNtOchagtAWxhb/tVlMp/kT2HLSN+k95GK93Z2ZVhI/lQkAy/A3f
         BhSw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+8zl1FB8NLqZOoItRITu9F6e8BdhDqYT5vpiViKWBM7CvNxcYR7BpnNgkugSF1g9f2dOCkwZC7XnAKeXH+i+QwBeDy59aRizHg==
X-Gm-Message-State: AOJu0YyF806WgJutMXjywRlodsy1CxPfDiNNffb2m7PGHTpYt3CeY0VZ
	rNlIl12jWLsSnCEVZs2weDCN/haOzX63Xj5SaaUxvNBbHWk1Ne8Vvvk1zwPTQSE=
X-Google-Smtp-Source: AGHT+IFOEhmrc8/7gP/gyY2lxQaJjz0l0DPkZEGt1Jaui5UPWhGGxU9XXD2bP5LA9cGX048zWkpoOA==
X-Received: by 2002:a05:6512:10c2:b0:52c:8342:6699 with SMTP id 2adb3069b0e04-52ee5453fd4mr6044046e87.55.1721336257180;
        Thu, 18 Jul 2024 13:57:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef07a044dsm196680e87.285.2024.07.18.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:57:36 -0700 (PDT)
Date: Thu, 18 Jul 2024 23:57:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Patrick Wildt <patrick@blueri.se>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-yoga: add wifi
 calibration variant
Message-ID: <gb5ykva2z2kkn4w4xnpbpkfthglifkygsbwplmqmd53hlxpqlg@gv7qknl3uuob>
References: <ZpV6o8JUJWg9lZFE@windev.fritz.box>
 <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_135739_732871_0834BF3A 
X-CRM114-Status: GOOD (  16.16  )
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

On Thu, Jul 18, 2024 at 07:40:13AM GMT, Jeff Johnson wrote:
> On 7/15/2024 12:38 PM, Patrick Wildt wrote:
> > This series adds the missing calibration variant devicetree property
> > which is needed to load the calibration data and use the ath12k wifi
> > on the Lenovo Yoga Slim 7x.
> > 
> > Patrick Wildt (2):
> >   dt-bindings: net: wireless: add ath12k pcie bindings
> >   arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant
> > 
> >  .../net/wireless/qcom,ath12k-pci.yaml         | 59 +++++++++++++++++++
> >  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  9 +++
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 10 ++++
> >  3 files changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-pci.yaml
> > 
> 
> +ath12k mailing list.
> 
> Qualcomm expects, on x86 and Qualcomm-based ARM devices, that this information
> come from ACPI.

Unfortunately we can not use ACPI on Qualcomm-based ARM devices. They
all are manually converted to DT. 

> 
> That support is currently under review:
> https://lore.kernel.org/all/20240717111023.78798-1-quic_lingbok@quicinc.com/
> 
> /jeff

-- 
With best wishes
Dmitry

