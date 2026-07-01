Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E87C43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 07:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mia8sxKq83EdbDucERboNXKa1jY/lp3YbI5KEzP21q0=; b=gUbIJ3yRxK7vP0MKKAKGZOrkaW
	obE5Pckv5VFQTFo/M6PhA+PzMk6oscs+iF7lztUGQJnBtfUT4lvGte3kdYSs5BisL0iyDn34U5Tvm
	4ID4ChMEHA7ZmtOYSI/MoQQtqidoBCstiLpILITgLxJ3A+1Ggi7Z4AalaeTmaBEkxge3oywOi5Vqj
	XseyjzQOUsgRhJzkHKxHskO95gg3pkloFc7dTV03DDSn7PMrcDPSJCn6plnUgQ2SGpdadwxwylHWh
	emAxYU73Tr3JbKZJfNwtW6yXUoWfb/LzDDEjfZodNQin9jlJAf2dTFlk1iRzZuymsv0f4NEOECWJl
	AwsaW/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep0a-00000000rgk-07MF;
	Wed, 01 Jul 2026 07:05:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep0Y-00000000rgb-07sM
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 07:05:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 560F241AF3;
	Wed,  1 Jul 2026 07:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0C11F00A3D;
	Wed,  1 Jul 2026 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889517;
	bh=mia8sxKq83EdbDucERboNXKa1jY/lp3YbI5KEzP21q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DVVj6YqEllZle4eLdF5SZgzJoKA8cAAV8lrQxpPrzMwXlJdu9RWxnnNvXoXLJQI+l
	 GVWmPVFpBBP33BiFrWkJYWWGycb2B9COkuGSfcUxl2reIF6EFqcnuTICdkFEGN7vJx
	 UiXp+Dk1a7xKLt88rQ+eaAS4VaNysLgWn/2ErzO49Ns/j/SYt/NMBhKLs09iC8+Qq3
	 D5emPGL3UKrC1+IiYKlmarUklxkoD92+oiZ5VjCmbZaA4qiSoA5JLCLCp9eDuo8ZU6
	 mgQNgXNrAX84MEZ5E6BsRfO3NXc5iRMXzP0FvTKejLmoTR+Sl3vQNBhmzG5IQ52CPT
	 QzASCVo+6LsZA==
Date: Wed, 1 Jul 2026 09:05:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew LaMarche <andrewjlamarche@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: wireless: ath12k: drop
 qcom,ath12k-calibration-variant
Message-ID: <20260701-objective-gay-aardwolf-fcffef@quoll>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
 <20260630133001.1426824-2-andrewjlamarche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630133001.1426824-2-andrewjlamarche@gmail.com>
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

On Tue, Jun 30, 2026 at 01:30:01PM +0000, Andrew LaMarche wrote:
> The ath12k-wsi binding documentation describes using the
> generation-specific qcom,ath12k-calibration-variant binding as well as
> the generation-agnostic qcom,calibration-variant binding to load
> board-specific calibration data from the device tree. However, the
> driver never implemented either of these.
> 
> Given that no devices currently supported use
> qcom,ath12k-calibration-variant and the previous patch implements
> qcom,calibration-variant, drop the generation-specific version from the
> binding to prevent future confusion.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml  | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


