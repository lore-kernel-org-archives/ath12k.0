Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DE4C5478C
	for <ath12k@archiver.kernel.org>; Tue,  5 Mar 2024 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2klNA+6HuLnelVwHd/hZlMG6axojhHck2M9xbp1Yk8s=; b=LBM9QyjdXYhhsBYI/aA69IGvTj
	FOI+vAU8Gd9Ttxhaz6ZArOWu3L6MEI5HCn3FHrSwx89dPFQDpKm0ECCFbIWIKr/RwvJEL+LGph/NU
	nZipmKuEvrqppIlivxCPnVLBMbvnT4HhLlzXYf2rRw+Nl56T01lNbc85X5FlPYxBgeQRgzPGq9aPk
	63SelhXon+KCQmDs+jByYadC8gCNQ8pZUIPYKENB55hNl/1gbz2O6+nWsPytP8g9UaT1fRBUL6eMA
	WQpx5DjN2jPTfTaZDLS64hpowH9ofgm4R/5FNNTQJsfI93+RDjJTIOg94Cd2gryyljmIGi2q0Y/tV
	MV+/C2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhOrK-0000000CGi2-2C8q
	for ath12k@archiver.kernel.org;
	Tue, 05 Mar 2024 07:05:06 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhOrH-0000000CGgz-0hLz
	for ath12k@lists.infradead.org;
	Tue, 05 Mar 2024 07:05:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a450615d1c4so381718066b.0
        for <ath12k@lists.infradead.org>; Mon, 04 Mar 2024 23:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709622300; x=1710227100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2klNA+6HuLnelVwHd/hZlMG6axojhHck2M9xbp1Yk8s=;
        b=lfgMVyxJjm/4iMNiVXcfJTg02OfvAQkSakRW9rsiwkn38MvLXOM75SUr2ggvrZAMIY
         0+nC/jFLfz76U8SqS8/KQtelI/2lh42aJDI7GlfvhC6lllNDZA8KOxDvnfnrMEYLwI1U
         qWQwOzSzbfh2E86hX/VdCfEX3u++WizC8qFJ70RVKrRUsN+ifVsVK/vxwaykYs8+4wyR
         7DMhBJPXPXj7AbthU7cLraC2vqDcQn5rZ0PKxGYGimK8iq3KX7GNjMyFb32QgBREt4Kd
         ETkXguXYheRkSORY6Vrpaziq490yXrO2l89FQZ8yTcG+2fyLFhfl0Soo2s2SeEYUOJkr
         Qvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709622300; x=1710227100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2klNA+6HuLnelVwHd/hZlMG6axojhHck2M9xbp1Yk8s=;
        b=nTbL2sAPWqez66gZoWD7U0wpHEYZPcV0FKZ6PgKKXQ1ZU2HamS0HuIafZh4btSSTkC
         4nQd1xQlKUCLfEtxN2hBv8d1jTXL3R8t8ywOo5KMRO6nnlYRTyT7m3TB5gL7ydRDrsQg
         Nx/VS9YzvQDopBndXNNKlpB+r9q7PoyDB0fV/Nds/9Eu+9nXZoJ/pTUSZeogt5HE3cNl
         C3ymO6fOsbHzuSqClml06CdmWBw+Q2MxHnEeRLOP0AR+3xyrlWDqMwVqhHa1xT7K5TPD
         h6WzcHHijtMDilAEPX8qU4z7/kLGGCMuajfvCaKdjIBYZNFQ6qTuPvgvZBvM215Ks9zK
         s1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG/nxuYqHGEv9vlajfbZE1urL7MHp4pcRGdm4QyqXndJFvgNYzoVEjsoE+odqWUswyIrz3voEaJFlx8hSMt0cr2UUXapQWUmcAUg==
X-Gm-Message-State: AOJu0YxJUTYIupDxtLWDqdalIvm3ufq+bckhkeS9RVdkRKWBOfYIkXCF
	DWqdyimoMXJQpiw8CmIQ8bV5gjhXCL7oRUZmczvbHIZ6g5+vRzVcUYled9kYYYw=
X-Google-Smtp-Source: AGHT+IHykJXFdxa0ufKnr7SX2KdXakqLJaJBGEg6y0UVS/JVEwPwDx64f3vuGcfAf79RDyfILrpubw==
X-Received: by 2002:a17:906:3648:b0:a45:96ab:28af with SMTP id r8-20020a170906364800b00a4596ab28afmr1883345ejb.10.1709622300408;
        Mon, 04 Mar 2024 23:05:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709064a0900b00a44f0d99d58sm3266126eju.208.2024.03.04.23.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:04:59 -0800 (PST)
Message-ID: <17f958e0-b5f3-46b3-8522-a26fd65eaf79@linaro.org>
Date: Tue, 5 Mar 2024 08:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: build ath12k as a module
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20240219084610.11007-1-brgl@bgdev.pl>
 <CAMRc=Md0H4=UZWNOoZR3-b50BrF-ch=34aPdqm2JhOXQzNi-mQ@mail.gmail.com>
 <228772c6-034e-4727-b410-391316d8f340@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <228772c6-034e-4727-b410-391316d8f340@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_230503_257202_2649DCC7 
X-CRM114-Status: UNSURE (   8.27  )
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

On 04/03/2024 22:46, Jeff Johnson wrote:
> On 3/3/2024 2:34 AM, Bartosz Golaszewski wrote:
>> On Mon, Feb 19, 2024 at 9:46 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Qualcomm sm8550-qrd and sm8650-qrd boards have ath12k modules as part of
>>> their on-board WCN7850 WLAN/BT packages. Enable the relevant driver in
>>> defconfig.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Would have been nice to cc the ath12k and linux-wireless lists (done
> now). Just happened to stumble across this.

This is arm64 change, not wireless.

Best regards,
Krzysztof


