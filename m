Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D143D43352
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSPWmvzriU7n4zt5eFjV3QM91IvIEi4Is4DeNEfxm2U=; b=LdU3LUIX+CvUmECZkooeEI3Ifz
	l/3nJTtI18h5csUM5KTAf+sdHoWwBop1C1Y0djl2ZDzODttfkJXcughmmzx4chJ3iPV6ftJmQB0B1
	EmlsK0QxhC67/252aVsImCkVNf5EKFkzNe/AxeoDeqDl2dhHRWkLnowR94jcPTCU0eN9iIGZBXbN6
	wKIPIZpAVWNceq651tH9nX0bBjAxopobCCSRS7WXaDLSXKllEFupPgnrR6bYbh1HLhOfr/7aSOaya
	BiaCbThw922YRq2Jig7tlr9UXeoktRRCNfB6FPF+1wyE4rojXFurBFweNUGBx4r0Ebju/DJ5wVR2H
	R8+pvnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Qd-00000006tL6-3HpH
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 12:15:59 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91FC-00000006rGw-1KiZ
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 12:04:12 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6e34339d41bso6846027b3.0
        for <ath12k@lists.infradead.org>; Thu, 07 Nov 2024 04:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730981049; x=1731585849; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NSPWmvzriU7n4zt5eFjV3QM91IvIEi4Is4DeNEfxm2U=;
        b=rmngekQ3A2JmoZQJsHm4vZ4s62uB+TA0BdLPrCclzPYRmJ5nHelBgWNiCW3tm5jLXD
         xD5UTU4Q++iotsLHyRm3xUgTW6vlOWdY7Vg/eAGxvONUKBTfe9tmu0UHmLTyWuI7lX+P
         JeylFYAiaaAkPETO6OiWghIx/KVSS+Aqhu3ixeC5mM9qnYFFUoE/vWkgkxxyCuMQKF65
         lUiDoa271JaY2qa7Ohgw/esFPrv1tozGS0vKCbAlVAteOKbAniTvukGH3K2aMqkuqbkr
         tWBSG09k97/28A2W1vN1hzKYbH3M9bKawUDW7ndLA/HODNcIaybZFRUzdf2NdOqNAPIz
         uc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730981049; x=1731585849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSPWmvzriU7n4zt5eFjV3QM91IvIEi4Is4DeNEfxm2U=;
        b=Azn1uDbX9cBlpcqQ/Bj4Mo/6vitp1Wx7Cza4z+4ITXCmlNdwwwIAK4Y5x5YiZD5Sxu
         8kxTKRIxg+P0ErTkTV08cJWNcjd77qPb+Al7Je5g233EuyTJ5qVaE9rdn+3cu3ylJkj3
         os3sRhOC+218T/Ml87Iz6yE/2jphNFXjJo6DbEkw2TOHCLtRGIH3zXo+jOu3dNU3wGYR
         HLxy0Vx8T4O+xzifThvk8ZtnBQXc7FRqH+3NoD895kLb/GTP7XseS65LZP92Rc5TMN8b
         KOzuD5+hxXS/28cMaeYhdY1x8mnRbZnh+EekFijLRTImSKh6boLwS4/lIcDK90L/wHWq
         U/7A==
X-Forwarded-Encrypted: i=1; AJvYcCUFix/Sn9qb8XTSz8Q2XNZG6Zx+qwiJNpX9m3dz8rbqX6ZJGbnltW89zyHxb89D6OmpDAnlr3o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuNHH4Bwd9vyOhDoQ4QWnSM0ROO1s+KUvXSbUCbOYHSeG0gM+n
	8ANmw58SLutiOLIqwbhDhgjlV4YtMMPG6eq/bpQTlcr/Kc1MKzoF7VOETdcObkL6shgRUdMNst2
	afvA4EpGUCirYel2O2x4qcTIjSafXwgRjJ3Z3Fw==
X-Google-Smtp-Source: AGHT+IHv9mgUbimlGT5mX5UyhqitGAJmHvxVkXQPT0TuyKjaYEJSoXqczA0NpCvvlC2PQwJhFcmZoanLH7+Ypxxf7Kc=
X-Received: by 2002:a05:690c:b98:b0:6ea:7015:99c2 with SMTP id
 00721157ae682-6ea70159addmr188580517b3.40.1730981049268; Thu, 07 Nov 2024
 04:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org> <cmvfpctliqggra33u6ituguoxh3jxcuxiyjpbtcjbcgpu6lhoi@4zdthfkc2ed3>
 <692503b8-cf39-4d6b-b70e-910fcc710d69@kernel.org>
In-Reply-To: <692503b8-cf39-4d6b-b70e-910fcc710d69@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Nov 2024 12:03:57 +0000
Message-ID: <CAA8EJpqMCbyK0dodMNyfs8dNjV2QoB2nyWm233eOS9xo8BaFJg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] wifi: ath12k: Add wifi device node with WSI
 for QCN9274 in RDP433
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_040410_383834_CBD2AC97 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, 7 Nov 2024 at 11:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/11/2024 12:06, Dmitry Baryshkov wrote:
> > On Thu, Nov 07, 2024 at 11:23:20AM +0100, Krzysztof Kozlowski wrote:
> >> On 05/11/2024 19:04, Raj Kumar Bhagat wrote:
> >>> The RDP433 is a Qualcomm Reference Design Platform based on the
> >>> IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
> >>> PCIe2, and PCIe3. These devices are also interconnected via a WLAN
> >>> Serial Interface (WSI) connection. This WSI connection is essential
> >>> for exchanging control information among these devices.
> >>>
> >>> This patch series describes the WSI interface found in QCN9274 in
> >>> device tree and uses this device tree node in the Ath12k driver to get the
> >>> details of WSI connection for Multi Link Operation (MLO) among multiple
> >>> QCN9274 devices.
> >>>
> >>> NOTES:
> >>> 1. As ath12k MLO patches are not ready yet, this patchset does not apply
> >>>    to the ath.git ath-next branch and that's why the patchset is marked
> >>>    as RFC. These are the work-in-progress patches we have at the moment.
> >>>    The full set of MLO patches is available at:
> >>>    https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274
> >>>
> >>> 2. The dependency marked below applies only to the DTS patch. The
> >>>    dt-bindings patches do not have this dependency.
> >>>
> >>> Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
> >>> Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/
> >>>
> >>> v3:
> >>> - Created a separate binding "qcom,ath12k-wsi.yaml" to describe ath12k PCI
> >>>   devices with WSI interface.
> >>
> >> Thanks for the changes. When you finish with testing/RFC, please send
> >> proper version for review (just remember to keep numbering, next one is
> >> v4 regardless whether this is RFC or not).
> >
> > Isn't the 'RFC' being an invitation for review per the nature of the tag
> > itself?
>
> No, RFC means patch is not ready, might change. This was brought on the
> lists multiple times and some maintainers clearly ignore RFC. Including me.

Thanks, point noted. I'll stop marking my patches with RFC tag.

-- 
With best wishes
Dmitry

