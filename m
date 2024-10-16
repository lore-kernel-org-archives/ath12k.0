Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F89D206A0
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URoL4kc75JBiMYaV9D7L8FDVRkzXGlbv6y20+QpwBfQ=; b=sRMbt0eLd2Ty+DAkoFhrlCHhBi
	kFZAv1O7a/D8Rnk+b9axl2F7vML5GCKdnYCYxrev88tF7SQzDBiZOI9/Re5CyHMZHEbZmUBBub+PX
	ER+ljFLEGOyr29xp/ZeYeiXds+OjzwtlnnnvIBFHOds1L7/mbL/s3EeSuBuGqW1jl8BSdIHN2HfoL
	vBED5kC7neYVT6UGcs7VCFXuXuvnWcmnnRWCZsT/43V6XwFjrm6s9sTbKyhSX9+S+UrR7AsJWSrsr
	2jw/lYq3oTDfzzn6S/PnSHgwWLpapcosdr1OYfIp8sGBBW0BarwIb5/5QP/PXA+D1x/w+Wzniw7Ts
	ux9co5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y1r-0000000Algb-1yvx
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 07:01:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xyO-0000000Akgv-0OK7
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 06:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0484E5C313E;
	Wed, 16 Oct 2024 06:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5067EC4CEC5;
	Wed, 16 Oct 2024 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729061851;
	bh=nueV4zW9DYaKNQYqepHGVVpmRCUZwWuMQ6ahTdofusk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCnTvzidshFBNh5H2Dwnz5y11dT8NyAFjt5jPCgNdiPfN432LHzDuivAILLKq/LVl
	 uQIn6u5fQ7SLcYtOIv6XsuIjCymgNBgbDQEStSiDpn1zqVtFqRf4vmFXAZwYMPGzxs
	 2uaf2M2saJOrZpdXlYl5cFhDoqgPG46UN19TYAXNBB0WHYN7SBk/1PWhATsxOeNFhI
	 NKSqhXLJPmb8ryrZn1Hmq1vzq+N3eTBlyv2gKau7czgPt9DTbkZGP6e/ycbfxws+MG
	 0XAqujvHS0UCrU/H58qO/oYZsufioCZlhNnnWERReb3anQuGTAUP4cEISvfylGuGX6
	 8/ZrhRDDlHyFA==
Date: Wed, 16 Oct 2024 08:57:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/22] wifi: ath12k: add Ath12k AHB driver support for
 IPQ5332
Message-ID: <ou5kgedz5aga4dtda6k23uhybcjy7mfwie74p6q3qyn5bdajz7@ftejp7lqrise>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235732_205334_25AB1072 
X-CRM114-Status: GOOD (  11.18  )
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

On Tue, Oct 15, 2024 at 11:56:15PM +0530, Raj Kumar Bhagat wrote:
> Currently, Ath12k driver only supports WiFi devices that are based on
> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
> Ath12k AHB support for IPQ5332.
> 
> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
> device:
> - Add hardware parameters for IPQ5332.
> - CE and CMEM register address space in IPQ5332 is separate from WCSS
>   register space. Hence, add logic to remap CE and CMEM register
>   address.
> - Add support for fixed QMI firmware memory for IPQ5332.
> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>   AHB support.
> 
> Depends-On: [PATCH V7 0/5] remove unnecessary q6 clocks
> Depends-On: [PATCH V2 0/4] Add new driver for WCSS secure PIL loading
> Link: https://lore.kernel.org/all/20240820055618.267554-1-quic_gokulsri@quicinc.com/
> Link: https://lore.kernel.org/all/20240829134021.1452711-1-quic_gokulsri@quicinc.com/


These are series targetting other subsystems. I do not understand why
you created such dependency. It does not look needed and for sure is not
good: nothing here can be tested, nothing can be applied.

Best regards,
Krzysztof


