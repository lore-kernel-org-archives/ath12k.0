Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982DEC3DA49
	for <ath12k@archiver.kernel.org>; Thu, 18 Jul 2024 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O5FpF2UiLkbwb7WiFk7nvfeS7BUMqQ4dHZRhUE0Ug4=; b=XQ9eNz7Z9nZlHR9JfK35FqfhQy
	DU/F60O8FvwrkAn746jyntJiYds84fejHSI4SCHoSBNoNQ+c2Pf3SeFohTSC1fXdm4dPBvNSjCpKA
	jb2iXjqHij1M6qq4YsdY+ksrQPFzDFu+HGQJyo1EiE9iOm/Jx0fwsRiQ498kv2yu+JApn6tN65fPT
	9ZJFQDlN4M4FVxO3RLQujIbVToqyRkxokf46ASS7kManRr9NIhW36cL/c2nZStJSewp1YknxbSxSN
	hi75CYDe5cGHWu186yl+GVx2wEzTskYp78xax26Z/Bw35lBoyVOzQ3BU2RdW5K5X3KRej/GuDrXHR
	7qgBPOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTLi-0000000HUVc-1OEL
	for ath12k@archiver.kernel.org;
	Thu, 18 Jul 2024 15:47:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTLe-0000000HUTv-3JYd
	for ath12k@lists.infradead.org;
	Thu, 18 Jul 2024 15:47:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so1620719a12.1
        for <ath12k@lists.infradead.org>; Thu, 18 Jul 2024 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721317632; x=1721922432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O5FpF2UiLkbwb7WiFk7nvfeS7BUMqQ4dHZRhUE0Ug4=;
        b=kfFtAUCt7m3iiT62rxwR91W0n9yULpg3TXbsP2BYUoZRvEHEkNNZ4k6moaO9YDRWOa
         uVRGyKo6BWGFkr0+2yI6LdyYyV//mYVTCnfJePDaSZu2tDSPsCBiArKxcdXG0DSXQoK1
         kA4SX80iCxYQhdTxosZ86QGXlr/wIYUw+ipzYGJBzsgNrGwCvCEGOdOIl10Z+S4TEHoO
         HlrU3pgkAymMRfyLOpWw776mZvi1epXu1UJtQ4lJiR+uBCQHaGByfY7EeHrsRkyVbk03
         pj3OaKilDnsG3zvk13n/kKIAg/mZjNQ2x+0Ob9j6D+SzH0kf57XH1XvJzsePcO0EfViN
         GJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721317632; x=1721922432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O5FpF2UiLkbwb7WiFk7nvfeS7BUMqQ4dHZRhUE0Ug4=;
        b=cSpJQIFD3rTFtttpwAMabok8N1GjPANmekcSIvUBiPWUF7CIhdy954UOn3Gmxy/R9L
         L3PT7C55CW1645zaFo6rmiGDI+1JKsCTHLIws+JfL0OpXO2LY+gDFTSJ3dPrAozWK4S8
         Pm2MOVdVVnzpKHccrGWyXXghTexGsHixoqoD5e2twaRyteWocssaGY3STDyVN3h0Qbi+
         PD93P2TJRxHMLEu2aJE/Fa82ZK1eYzkvk//Vyg9S6PpNRKLIO/bYum3ise0ZLBHtc0Gu
         V9lqFSEqPNfrV5GcyM3TAsjZEQNEGPZpQYuEM6KMoLEyQNkiQWVx0/MMGT7nQ1yI+Rht
         j1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUi7PpU4lyA/rDUXO1CpxKr25fnf0p2KB1NcD4cDwp/hyIDjev7czSCpQYBk1458askgQiqJzw/x0ZY8cFYdQc0O63PQcJQiARbg==
X-Gm-Message-State: AOJu0YwLwAKswC/KtauYX2Oj50ZsRyiI5t14AO5IzDlANKHofLhBXDH5
	/NWCJFIZFlZmPmIG0ID9dqIu3EheXsYlxMfvYzgOUcJW2YWXBnWB5/p+WzR5bz/RsEpz4q52Fu2
	Cttcezdzel6SiV8fimYc1appgP/CDbg==
X-Google-Smtp-Source: AGHT+IGEkor275ooaElET2xkJh/wMWi5qM0YgC30wYo3hNF5WVOBm2FQ5tOFtC6x8JZXY6EiJPFxP7zqRjzBcUYOtfE=
X-Received: by 2002:a50:c308:0:b0:5a0:edfa:e5a9 with SMTP id
 4fb4d7f45d1cf-5a15617ff0amr3053656a12.12.1721317632011; Thu, 18 Jul 2024
 08:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <ZpV6o8JUJWg9lZFE@windev.fritz.box> <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>
In-Reply-To: <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 08:47:00 -0700
Message-ID: <CAF6AEGtL7gphh7sY0do6i71JC_kfFm1cNopBQfkzzwAPx=QB-Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Patrick Wildt <patrick@blueri.se>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_084714_850414_03432416 
X-CRM114-Status: GOOD (  13.67  )
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

On Thu, Jul 18, 2024 at 7:40=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
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
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom=
,ath12k-pci.yaml
> >
>
> +ath12k mailing list.
>
> Qualcomm expects, on x86 and Qualcomm-based ARM devices, that this inform=
ation
> come from ACPI.

That is fine for acpi boot.  But it never prevented adding needed
information in dt.

BR,
-R

> That support is currently under review:
> https://lore.kernel.org/all/20240717111023.78798-1-quic_lingbok@quicinc.c=
om/
>
> /jeff
>

