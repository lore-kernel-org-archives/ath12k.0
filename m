Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C27C3601B
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr0omvjdG+oPlQSQU7fM0fqBAv9Xiw6y+w6lg0B7xF8=; b=vtKNFyCr4Yre0enKfQ3AwfidQY
	Q0r2WJ7MdMnEOMoLyvfuyZbLhn84ENqkxj7+rXihdF1gF2SBtsV72C9IpeHBFFpdopqbj63pRI+jp
	OH1XfkGsL2cBfclVV821wbPc9552QTWU06jv2bwRN1ZGfSn8ub19C6Gz1y/r19ah4bPz2QqN7Nh8j
	NmfiLgtWJIQGFZoFe21I2Qy1HM4/p3rtXugHvYajX8g9e6RbX8H89Kr82ss8i/m7RwGEfvI3xO6gL
	062qxB7FAw3eMgB/ascXTL0urJIS+BFwmsEPbWXa8CVQIDWC/isKjzWPWXySE7hcBW6AyzdjWCzTT
	6JZqiKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Erm-000000085B5-3ahk
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 07:19:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Erj-00000008590-0xzq;
	Thu, 03 Apr 2025 07:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 578C05C5607;
	Thu,  3 Apr 2025 07:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CC4C4CEE9;
	Thu,  3 Apr 2025 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743664794;
	bh=T0uXIGLNl7BuW49vYLPY28xQSdne7A2PEmLs6GteNXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NP+sATvXwIKNjNGEG/WhaEmBFBhk07+r1H+YsvHuyhyYRudd+XG903734l4iTSAnS
	 Nvv3BGxykrOtw/rTPsjEHrfAfCi3QcuUmNSIEVN9Rg962+JrhdmmL4oiX5TDC92R1H
	 JHUIrSwfe9S5jhhg7i8TIG1ezAUIMebhJifXzvZ0p85NS/3XwEXkIUpUrn0j6h24Uo
	 VJP8URVZhZwazxNKruuVYJmAc9ck8aN9p87CYXqN9QyYErigQ20s4DYes8j0MI/lFH
	 3kTILynmNz6SxQdcFYVDLpYX1/w/YLxTyvGHenRloSIm3XcJlwpUilYZcvLg0cdBZz
	 0GMxb+6cHrQcw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0Erl-000000003yS-3BJw;
	Thu, 03 Apr 2025 09:19:58 +0200
Date: Thu, 3 Apr 2025 09:19:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jonas Gorski <jonas.gorski@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig
 symbols
Message-ID: <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
References: <20250402132634.18065-1-johan+linaro@kernel.org>
 <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_001955_322012_35F702D5 
X-CRM114-Status: GOOD (  14.24  )
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

On Thu, Apr 03, 2025 at 09:11:07AM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 2, 2025 at 3:27 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The PCI pwrctrl framework was renamed after being merged, but the
> > Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> >
> > This leads to people not knowing how to refer to the framework in
> > writing, inconsistencies in module naming, etc.
> >
> > Let's rename also the Kconfig symbols before this gets any worse.
> >
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> I'm re-adding the tag here as otherwise b4 will only pick it up for
> patch 4/4 on v2 of the series.

I had already added it to the first three patches so it was only
missing on the last one.

Johan

