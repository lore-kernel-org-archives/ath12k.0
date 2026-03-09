Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EAEEF3706
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/315rKYU6KJr5wWQOj0m4lEQlIClN3GL8VW27AkKEw=; b=UmdBjdPPiigNfySJXQ8PjrtG8Z
	2a0s+Mp4D5Q/ffmA8Fc8H4lGqZmuZGYRMbPTRYG4n/7lLwBGnAuPfQIkega95iW4M70qMGVOgkEK8
	keL9W3u6WKXq59qo6re0/9S1HgyRhTJ2Y7Ckh3dCgcZNK++4dG7sL0jJ9LfR2CqnIVmc0hXoMmud2
	bAOmzU5DYGYQujAiA93vTkvpjctjV3xYGZnIg/Y+lbFESAEW5wm0xOhhIlBseEZQ9VCLoMbcGjYEu
	41gvV3STL7/kUSuNn0DxY27YgE7lnJKsRib2bRorBl+DUy2KYjpY1ydapB2s4GbRNgOPlKIdq8qtM
	hgQ5swwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVge-00000006rkB-24Jz;
	Mon, 09 Mar 2026 08:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVgc-00000006rk3-2NlS
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 08:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0CD6600AD;
	Mon,  9 Mar 2026 08:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4ADC4CEF7;
	Mon,  9 Mar 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043797;
	bh=32FowEX4GYXUvlI6q5fHoPOHKDUD+8ybU58sR9odc3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyIOucgKAfmefa18DFYskVEvdTUmMUUmT8HnBszC9g+/3mu1ac4DRo0flCYJxEj76
	 p271mDlGTOPyxk4+0+GHdecUdSQAZOM+L8gTNBNBGZwQHPKV8vC1thWGJZPeZBX8pr
	 3X16t3RsqMIU6jLyG1xNhwWvWI5MieFe0lPzQJVGZ4F14tpOazzwn0lmuYQV9/WBGI
	 HbVW0WlB742mIaR5ZW5z1fUpVHoaFEKrkIJaxV8wBnVjVXySu/7AfHLJAFTi3Qe+Mc
	 W8hZg9dDIi4OWOFOSpENXZiP4Xr06c8ndff9g0yDDNCYcEa/Ggxfoc0bZVbfvGxE79
	 J4OdC2YwDMUEQ==
Date: Mon, 9 Mar 2026 13:39:38 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 01/14] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <aa6AQtR4oEfomWPj@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-2-sumit.garg@kernel.org>
 <20260309080049.si3vzro4z6qn7ewz@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309080049.si3vzro4z6qn7ewz@hu-mojha-hyd.qualcomm.com>
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

On Mon, Mar 09, 2026 at 01:30:49PM +0530, Mukesh Ojha wrote:
> On Fri, Mar 06, 2026 at 04:20:14PM +0530, Sumit Garg wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > All the existing variants Kodiak boards are using Gunyah hypervisor
> > which means that, so far, Linux-based OS could only boot in EL1 on those
> > devices.  However, it is possible for us to boot Linux at EL2 on these
> > devices [1].
> > 
> > When running under Gunyah, the remote processor firmware IOMMU
> > streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> > managed by the consumer of this DeviceTree. Therefore, describe the
> > firmware streams for each remote processor.
> > 
> > Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> > devices to create -el2.dtb for each of them alongside "normal" dtb.
> > 
> > [1]
> > https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > [SG: watchdog fixup]
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Thanks for posting, I was about to add kodiak to the already existing
> list monaco, talos here
> https://lore.kernel.org/lkml/20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com/
> 
> but did you really miss linux-kernel@vger.kernel.org or is it
> intentional ?

Ah I see, I missed that list. Will add in v2. BTW, this patch in the
series can be applied independently since it will work with existing
SCM interfaces provided by QTEE.

-Sumit

> 
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |  2 ++
> >  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 35 ++++++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index f80b5d9cf1e8..09a7f943190e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -139,6 +139,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> > +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
> >  
> >  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> >  qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > new file mode 100644
> > index 000000000000..0b3a69a0d765
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > @@ -0,0 +1,35 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Kodiak specific modifications required to boot in EL2.
> > + */
> > +
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&gpu_zap_shader {
> > +	status = "disabled";
> > +};
> > +
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x1800 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	iommus = <&apps_smmu 0x11a0 0x0400>;
> > +};
> > +
> > +&remoteproc_wpss {
> > +	iommus = <&apps_smmu 0x1c03 0x1>,
> > +		 <&apps_smmu 0x1c83 0x1>;
> > +};
> > +
> > +&venus {
> > +	status = "disabled";
> > +};
> > +
> > +&watchdog {
> > +	status = "okay";
> > +};
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha
> 

