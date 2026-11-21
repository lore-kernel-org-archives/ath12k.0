Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD2606A331
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7qrlYoR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnADEjRu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bn8fYVdCnsxzaxXf/0e+OavoSH4Fq5m3TkgWBOG16mo=; b=y7qrlYoRLhJDMwf5S1PxBWsdn3
	F/p6eMiQikL0ZbNh3blbMPtmxS5KrCwOPfMTs/Pmmdp2qTIv24sT6VQO+3f+K/sbUfY3gmh3hLo3O
	fxjEGFhdDN/NO1KDL/HeQOM25QNGasPpMVVJ6rnufew0ESHMycmQzwu84mTc1kOn5oyDu0ZesgJl1
	YHCuKO5Hr4xrd1QdSJgRd2bufBrucilqnQW/NnyZy6TBYOVmkvAR4+G0eRqDJVTwt9fDDPTRx2lHu
	FKnC6hDqkhIfI7IiV+3rxM9O7qUpYntv6bMdi6hXFS4B2t24dI64e1ubczaUILVAg37wSGKq/YAMi
	vrac5v7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkL5-0000000HBSq-0Rh0;
	Sat, 21 Nov 2026 12:37:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkL4-0000000HBSj-292T
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 12:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FF6542AE1;
	Sat, 21 Nov 2026 12:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1317E1F000CF;
	Sat, 21 Nov 2026 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264626;
	bh=Bn8fYVdCnsxzaxXf/0e+OavoSH4Fq5m3TkgWBOG16mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RnADEjRuJ1PyJwBoW8/yT7wcTg6Aaq/v5dbP7Z4QZIY+KpAvkZvYGotnFbK/yrCgy
	 rZP5H1HwCJKnx8dZ0MfJ8nJlUo3k+8Sui8eJQt9fU76Zqn0eCze8RAUAOdFjlFIgVt
	 QpUXyhlaUypPCrxxItQWzopcGxYnZe/8GBJWKa9XizqtC4LEbMSzal+kIzVrbuAn24
	 wfFtnkaOuCpNhdFuIKjyMlrQwKMYOGb7FqXvmbhVajYCtRIpyVrWZYmyM5CWCo75xw
	 6ULSB4Kcvnmg3OWi3werzIPimx+BNwsCY04fKnI3rolgYjpgVBx3CUOM41pDWYDk6u
	 ALsZWOjFk8gXg==
Date: Sat, 21 Nov 2026 13:37:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
Message-ID: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
> -  WLAN Serial Interface. It is used for the exchange of specific
> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
> +  for WLAN Serial Interface. It is used for the exchange of specific
>    control information across radios based on the doorbell mechanism.
>    This WSI connection is essential to exchange control information
>    among these devices.
> @@ -48,6 +48,7 @@ properties:
>    compatible:
>      enum:
>        - pci17cb,1109  # QCN9274
> +      - pci17cb,1113  # QCN9575

I do not see any user of this (see submitting patches in DT directory
for explanation).

Best regards,
Krzysztof


