Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AAFC021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4viblIfKHP8LeHKNyRKljKijxggrG/tr8IfauHTRc0=; b=BvonRpI9FiKccMKdjEmRG47pnH
	IsktqSAsVPW6cMdvEywvioI+hkSC3HlIi3d3YvZ1ZxDFoJTO2/riQG4qyPlFc3F9+n16vcKXPJQCN
	qYAiNaK0aWxbhmaDby/4JHcEW85Wao76MC1CDbyUQzKdmPxazdT08AvYccEf5AoCajIpATLbJpzzX
	T3dEs2N87Auv6fATKZbCrMli3qg0Y8VGvIaBpJ6VBiFYgStFv9gaLvmNsbBHdWIKy8mAYVAqm4Upl
	eil2CjTovE2NKIOKj5eMZgZFRlrBDkr/36/LW/8Itylq3nxxbOPY6JNHiMJnTVKwtH615pi8zYoAq
	KiX666Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqba-0000000GRwT-1j3c
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 08:47:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqbI-0000000GRss-31Sr
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 08:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F0EC5C65FC;
	Tue, 25 Feb 2025 08:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204D0C4CEE2;
	Tue, 25 Feb 2025 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740473255;
	bh=jkoutzfuhyhscH3rYrY6wsqgU+1ykH7c9nmt11/wUgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K30fuygbSJHkOo+oklTE+KOeEMMAX06jAIb81BHPEmuKxL77/5/qHIAo39C6Nhqp6
	 cf503saHuLaJwoWWnxAzpoI/uW+lk7xPdQRwvuXEC6Bi6ZjtSIY3GlOMCc/rtbI5CT
	 s55NsDpPJwUCPN4aMnx45r8NMjou5CTl6VVqHyjnhChFA8Zvrwn9p7MzoVfZOmqAo0
	 47lVtbueWpZ9Orz9mYaDJWMJc8uoG7AqdZMc73hs2GBS1iwyue+XG2FPiYwOCKRAjs
	 NIXYZjGKP05DP8M82XA7bBEIXbFXUevMq6lxrfecxV8uLHbnE5UfQWSzY3SHK86jD7
	 Ltf3op4wqQstg==
Date: Tue, 25 Feb 2025 09:47:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module for IPQ5332
Message-ID: <20250225-abstract-arcane-chimpanzee-ca7e4f@krzk-bin>
References: <20250225064834.2002499-1-quic_rajkbhag@quicinc.com>
 <20250225064834.2002499-2-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225064834.2002499-2-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_004736_813242_92A131FD 
X-CRM114-Status: UNSURE (   6.32  )
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

On Tue, Feb 25, 2025 at 12:18:22PM +0530, Raj Kumar Bhagat wrote:
> +  memory-region:
> +    description:
> +      Memory regions used by the ath12k firmware.
> +    items:
> +      - description: Q6 memory region
> +      - description: m3 dump memory region
> +      - description: Q6 caldata memory region
> +      - description: Multi Link Operation (MLO) Global memory region
> +
> +  memory-region-names:
> +    items:
> +      - const: q6-region
> +      - const: m3-dump
> +      - const: q6-caldb
> +      - const: mlo-global-mem
> +
> +  qcom,ath12k-calibration-variant:

qcom,calibration-variant

Best regards,
Krzysztof


