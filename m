Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D95606A31E
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AnCBmM5/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQUVWDd5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u3tZOGX5uvrdqoC7dUccuRlWsX5EhE7NoULiLf5ru0A=; b=AnCBmM5/+3iNdAFnp7mmp2vN6O
	7jhoCggJ823zKmRCRBLHlb0V7W6t4PxbUWJyINEVNGh8/DfWf1csdCUOcuFgPvwctjEgoDGY28M4m
	YfPZorCnvBkGDp+ygTvIX2LPgrg2S5CzduXrlgE4ltnCBj6uXsPPgHefLTV31T+FHNKxONc5T+by4
	9pErpwqUzsH5RHMAyPuL07DXN/HRnyWO8naNCxRhrjyJ86qEQs77bIptafXIG8HN8WPjtQedE8V5z
	52RD35IO1/Z3gsJsjevWY9NDAHAyvLEmIb8Rlyp0i48c8qDkscFLerq5StufDfkBeo7ohsZdj8ELP
	hbxFsafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFZ3-00000001uPs-0vUu;
	Mon, 26 Oct 2026 07:56:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFZ1-00000001uPR-3BlQ
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 07:56:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47C09418C0;
	Mon, 26 Oct 2026 07:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AC01F01825;
	Mon, 26 Oct 2026 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793001375;
	bh=u3tZOGX5uvrdqoC7dUccuRlWsX5EhE7NoULiLf5ru0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQUVWDd59s5jjtL5p8mDbx1VUrYzprC/+uUjUstAhihGr55nocJ5j/zXgNlkf5gph
	 fw5jWPzzIzUsf4qwQ/NCVugz0wVGoIo54jtUlItn7D2Nf2KyDHYPbNBAFf4tbzNhiG
	 Fs5SUL69wN6PzRJIbtFyEgcSga75LrJvbF1K14PMVwHY85jW6LBigo1K5myaxp9afw
	 3hg1GI5fLeit4iBdO9OtWLSwagdq4dCb3463OFu3B7jDVfpoKSSPdokIQxqKq+CsWD
	 AwtGJKyj/5IJpr/qvOJ9BMXRK8Vrjn11/igaQildOkLc9w5pYOJFr2HVqFCE9twhdG
	 axU1I2Ngn0G/w==
Date: Mon, 26 Oct 2026 08:56:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next v3 01/17] dt-bindings: net: wireless: Add QCN6432
Message-ID: <20261026-sticky-bumblebee-of-beauty-2e5ff9@quoll>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
 <20261023-mpp-bringup-v3-1-19f3fcbf7b5f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-mpp-bringup-v3-1-19f3fcbf7b5f@oss.qualcomm.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 12:31:04PM +0530, Aaradhana Sahu wrote:
> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
> wireless device.
> 
> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
> platform device, even though the Wi-Fi hardware interfaces over PCIe.
> Document the compatible string and the resources, including the Q6 remote
> processor phandle, MSI interrupts, SMEM states and memory regions.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


