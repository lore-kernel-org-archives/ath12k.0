Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419F3CC6B33
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlGf1T13Z+dYbNgaE76AaMl6XNAcJozRNF/jbJktorc=; b=iK4fbsX08Rrztkl0sbKwMsJa1G
	KbYsSFlxhY4nQxOMFrUrexrzM18TUDcm9BpiKpdKXLsMx7AkYGBKP3QedF2R6Y7QTKdujMlwyJpRF
	GJxk25BPGUhV0ti32ZmbB+RD0i4hMNVvHjsi4iTXdQMPxy1+1ntdQtWxXrglo1gs5IpWgdwuoTwQi
	8dnG5/9Y6Lt6P7hv+vRAAdYphmBRZhzVDFjriyWBrfZwi3WqCV96ZSHdtALhipVqexlkydNzwj35X
	oR0FPO/2INo7Jh0ouknTHYgQsa7kSBqeLE2wbjgfd8SeFNdYCBMedipY/vJPGuuDrtwVdBaaAArjW
	uxbQtW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLQ5-00000000Ezq-42zx;
	Thu, 15 Oct 2026 13:22:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLQ2-00000000Ez3-1Npq
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 13:22:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F92444E6
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 13:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D831F000C6
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070569;
	bh=vlGf1T13Z+dYbNgaE76AaMl6XNAcJozRNF/jbJktorc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dBRqmuWK2zLSWCkxNYW4OJpTwQKNTpkvCo/jQ6lhgNv16UISJugG6g32QJlrd5pDg
	 Kwh5BEcx/Yrkl/ijOrJZWHJp1BvPWy03JD1CB3fRjV3oITasnByLO4Dkv/p9BqWJ7W
	 YBg87zl7utcTaj47KB0Zvr1dD6GZJBc2mbUp0kBvwwgsRByrJchFu09zzjsLogM46G
	 1A+ZiCP64ZT6DdgUU4KZe6wqWqafdrjpYtJPYzgeFB3RZ9dHRKYnyKT+O8eMe4kHrm
	 PyiL0LQErfqQmH0g+6iIop1zb0MtNLx/2wp+POz8N6/nIqgVSQ4N62zYl9cooV3l54
	 2Glt1U9KKXKSg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so39779801fa.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 06:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8ggEXtSsF9WJVUQT6QNh2qxwTcRhm5aA3CXfsO9a29XuTbnsTSw5XrR1sVvXU5RftApo+lyc=@lists.infradead.org
X-Gm-Message-State: AFq9FYKwyztOVNEOfh5iA7PIeSHvJbq5tsJfF1O2nuekDZ0gj8qxgVyp
	FOjt937viPiD7ti9oEbiOxCuoxWRhyBcYcIoDQnDkOzqDP1kHdflTcbqNGRYNizYO9n7SuwSre4
	A7GaW1aofrvssGZs/QIt9XsJ8MN1a8gOTyTJZs4Zhww==
X-Received: by 2002:a2e:bc23:0:b0:3a5:af50:bc99 with SMTP id
 38308e7fff4ca-3a9c5354501mr44082971fa.13.1792070567993; Thu, 15 Oct 2026
 06:22:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:22:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:22:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
MIME-Version: 1.0
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 06:22:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeDZZjDzCOwqyK5cKOuTz3zOScNS20NS+D8j2bEk=B6MQ@mail.gmail.com>
X-Gm-Features: AclHuK8xL2vil4lfhLkzbT6CatB4Oy4PBPKqe80Zw3U5zHMs29jaaQ8CTSEyqXY
Message-ID: <CAMRc=MeDZZjDzCOwqyK5cKOuTz3zOScNS20NS+D8j2bEk=B6MQ@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC
 addresses from a UEFI variable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 14 Oct 2026 15:02:43 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> said:
> Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
> carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
> (bytes 6-11), both MSB first. The variable is looked up by name, so no
> vendor GUID needs to be hardcoded.
>
> Wire the bd-address cell to the Bluetooth controller and the mac-address
> cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
> binding. Until the variable is provisioned the cells read as zeroes and
> the controllers keep using their default addresses.
>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

