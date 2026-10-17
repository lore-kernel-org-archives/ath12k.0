Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF3FCCF2C4
	for <ath12k@archiver.kernel.org>; Sat, 17 Oct 2026 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbnWqV/aiXz31EkDcm+H/Bo/C7Kw7PfSJHeX/JxezG4=; b=zcu9ZObsX/XJFQqWdOoRzeRpTW
	X2N9cwOdeGjdsGOHKL7bllW+QqU16S9TmHPS+pTIA/AEUHLTPkKPC01iTOl7C0B46akVX8Mcj8fnj
	W+4wtz/MuXPxuJiJ+t/nFRSO0L2AnOGbLtl5e/aRW+vT/pa8MVeMCwpL2GFxoc1lZntheICc3CKl2
	I37OUpXBETea924R73X/QjkMk9EF977ThfCoh+eHUKr2uFOH16+UVPz5u2azhAF8HmXQ3UoJZOUrv
	daNJrbG8QK6VBAgXZpInwuddA8Aw1wDfBP/Po7Q1devswwPARxR64LzhGDZF65uKYvAb3S8FmUECL
	9h+kromA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7lr-00000004yDu-4607;
	Sat, 17 Oct 2026 17:00:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7lr-00000004yDo-1dRI
	for ath12k@lists.infradead.org;
	Sat, 17 Oct 2026 17:00:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CCA560AA1;
	Sat, 17 Oct 2026 17:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9FB1F000C4;
	Sat, 17 Oct 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256434;
	bh=YbnWqV/aiXz31EkDcm+H/Bo/C7Kw7PfSJHeX/JxezG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHl8fu12MEq0ZiRcm8ewBLNR6wUle1ev1Br/rpaZ9WxMTl2UdqdTcPtYsdailFWcf
	 xGepDOTzbHztmstTDezxwyWHKCejEr6haUE+1gDAc/NzpralHcSyIwl4MIGV7jmlQB
	 r1RAdSLjHCHB0cPuxuoHq0nHFn9AQ1zYpTKdk0tk/l5MqUrTJ1qvAerQ1VAyiyvFje
	 Qp63tZQIZsUR7lUmBXCe+FZNVmaJ2CeQR97fCkrdtThPryDxxFNP0BbY5+FYQ4H2Zi
	 u3LenPURx78+aG+UnDvMdbYXOa/unq9L2QkL035ecQfCb4XgaiotoE7EWqNsqlA4ct
	 5x1ITTNkbWR4Q==
Date: Sat, 17 Oct 2026 19:00:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add
 QCN6432 device tree binding documentation
Message-ID: <20261017-little-fanatic-bulldog-e84f9d@quoll>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
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

On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
> wireless device.
> 
> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
> platform device, even though the Wi-Fi hardware interfaces over PCIe.
> Document the compatible string and the resources, including the Q6 remote
> processor phandle, MSI interrupts, SMEM states and memory regions.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

I missed during previous review - you almost hit combo. If you added
YAML or schema it would be the most redundant information ever. Well,
pity, no combo.

A nit, subject: drop second/last, redundant "device tree binding documentation". The
"dt-bindings" prefix is already stating these.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

With subject fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


