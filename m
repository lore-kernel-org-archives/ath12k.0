Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1303E668AE
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W97REAjdfCsTrSAPcoOJOzRmdk1C32nfeLQFWG2ulOE=; b=mR+fS3r3UM4PktveSxxz2CA2zA
	kK74xsknMHBe5EcTJFHKxd7qV/CiJBb0OBp0H35RZr4LZcPDUwpNH7b01tT9uqDATxI6eLD1LqmJm
	Mku6Q00ttEvhoLEbgYA6nZ4QMHMBblJ4oS0nmm5SRm9zsuQ9Q4hgEVu/SYvQtwMhKJ1TL/xUtDyPV
	/K+w69L2st427T5S9hRKInc4H06+jin/jsq/OfB1f0wxq6NzJRPX37/IWN318NF8QjW2AU5Uyz7o9
	Nt7J10auVzapopXYtwWeXxOGCxFd787tQXgSt+mtTxaWKM5VjPI40820TqvMczg+tJnAMZBRgt/e5
	nU6BAFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWt1K-0000000BSNs-1d0c;
	Sat, 20 Dec 2025 09:13:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWt1H-0000000BSMm-33sN
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 09:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11EC644295;
	Sat, 20 Dec 2025 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F302C4CEF5;
	Sat, 20 Dec 2025 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766221978;
	bh=P4qYNNBS+jFWt7ktTI5eDbZe8+DLAV563TzTkaM5xGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nd7yPfd6hOpB8pZReM+Due51lWaPtyx78AALvWinABwxP5VQGk2ylRs045NX9cOKa
	 OUa5K9hLLtsFQ8ezoom3KiD+CzVBDfkpCaVs99vtsyJv2hTPd1RyAp9pNWci0HS6KG
	 lmdCVQKDQuQT98pq5vjaL0WGGoQ9xKER0RYo5owxR+kULJ/VpM0wr90eHZprghDUTy
	 Dt9UVs6T3+/zwWBoMLw27td98RDnbxbZl9NnKxBEIy6nB7BHA0ToL54w+4TidHrDEb
	 ut8e3613kJR0GHcGZfqBxOIS/PcuCOE69jAIwXdvAp/Ov3+GauCpNSosXBqwHhaG4L
	 ViIO+X9MuK9OQ==
Date: Sat, 20 Dec 2025 10:12:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: arm: qcom: Document Microsoft
 Surface Pro 11
Message-ID: <20251220-dainty-successful-quail-69cbef@quoll>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <20251220-surface-sp11-for-next-v5-1-16065bef8ef3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251220-surface-sp11-for-next-v5-1-16065bef8ef3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_011259_784068_2A163045 
X-CRM114-Status: UNSURE (   8.40  )
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

On Sat, Dec 20, 2025 at 01:21:58AM +0100, J=C3=A9r=C3=B4me de Bretagne wrot=
e:
> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> using its Denali codename.
>=20
> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
>=20
> Due to the difference in how the built-in panel is being handled
> between the OLED variant and LCD one, it is required to have two
> separate DTBs, so document the compatible string for both variants.
>=20
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


