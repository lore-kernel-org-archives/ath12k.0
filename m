Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E02C282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m408jspcWRScStVbc+r3/7ynFtoCTBNszEweR1AIbec=; b=grQ5RmlJpHSWmRE55OYdKQY4gJ
	bqrjHf32AasP+/oEaIbW6jRrDvfL6exqsIUcY4jplrKeE1OU+YDjuKtrBEaD3I0KTpreI8j/BCzgp
	o8H5Nc9kNSNyMREC/9nnSleBWq5pWOUNOnNMncGA7ys3BW8NkjkCGYrAIwGfVDTD5I//E+dMaX0lz
	Hn4KrYPJsZhvNbpn9CEWXWN3UfUJ+wk3qQAwBioaldunPVlGVqnai3Yzi8+ce6bOd4650dOcaknZu
	iTTENTFPphNsaB5CWleFTB6mlQwYWAFpZL+nV/sFK61n9FI6nEr1ntbOdX0RI35iHWjQjRfNi9oRH
	vysgiTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRyf-000000055n0-2x0N
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 08:07:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRs9-000000054M9-1rMH
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 08:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6AB15C5464;
	Tue, 18 Mar 2025 07:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD686C4CEE9;
	Tue, 18 Mar 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284824;
	bh=q0iAie+/ac8TF5bdE35fwcBMcem45zb0jJnV1wd8xi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbL8ixVCaLmi0JhXDNy7BmPTWxoFvHxUXC2b4VUE0DbnT0l/ZgkzsNGozV+WdM3FN
	 Vj0Kt1acewQ71BM9re0gsKaqQiRUbGoShdF3B7i8qznckuOOF6af0CZfo9nOXZ39TO
	 rLovjZvjmDwFpjV53d6zqobyS3S8kWvzMwRsLlV8c9oKoEAMQlbXtSQpSMk37yYsNW
	 5i/l6RycOh+66MuaYqNnH0WcKgva6oQTPud7fWijAXjMGPBuAQCuOgexfkk5jlFOSI
	 B5TNhAVhy4EMiOQiO2exhSBYBokUehhBMGFLCjPA4/fxofyuSENb5orO3MysFaItvi
	 yub9cagFWkRYg==
Date: Tue, 18 Mar 2025 09:00:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next v11 00/13] wifi: ath12k: add Ath12k AHB driver
 support for IPQ5332
Message-ID: <20250318-splendid-sceptical-gazelle-8abbef@krzk-bin>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_010025_527038_A6A54233 
X-CRM114-Status: GOOD (  14.25  )
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

On Tue, Mar 18, 2025 at 02:16:26AM +0530, Raj Kumar Bhagat wrote:
> Currently, Ath12k driver only supports WiFi devices that are based on
> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
> Ath12k AHB support for IPQ5332.
> 
> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
> device:
> - Add hardware parameters for IPQ5332.
> - CE register address space in IPQ5332 is separate from WCSS register
>   space. Hence, add logic to remap CE register address.
> - Add support for fixed QMI firmware memory for IPQ5332.
> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>   AHB support.
> 
> NOTE:
> The working upstream DTS changes for this series have been posted as a
> separate series.
> [PATCH v2] arm64: dts: qcom: add wifi node for IPQ5332 based RDP441
> 
> v11:
> - Updated Kconfig for ATH12k AHB.
> - Replaced the API devm_ioremap_wc() with devm_memremap to fix ath12k-check
>   warning: "warning: cast removes address space '__iomem' of expression"
> - Rebased on latest ToT.
> - Removed tag "Reviewed-by: Vasanthakumar Thiagarajan", in the updated
>   patch [11/13] wifi: ath12k: Power up userPD


This is v11 and still sent in a way it messes with toolset:

  b4 diff -C 20250317204639.1864742-2-quic_rajkbhag@quicinc.com
  Grabbing thread from lore.kernel.org/all/20250317204639.1864742-2-quic_rajkbhag@quicinc.com/t.mbox.gz
  Checking for older revisions
    Added from v10: 14 patches
  ---
  Analyzing 135 messages in the thread
  Preparing fake-am for v11: dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332
  ERROR: Could not fake-am version v11
  ---
  Could not create fake-am range for upper series v11

Can you fix your process so the tools will be happy? Please read
carefully your internal guideline go/upstream before posting next
version.

Best regards,
Krzysztof


