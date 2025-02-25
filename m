Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA830C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy+0APQiRYBidt6TGL+wUHVYtFCZn9mwlvKkPx69zrk=; b=q57JZs+9OIQU6Q5NDdulCT5q8G
	PUVYXwnlLfwi0rp0xteAb/h9i532PoN78gPprjyEnWf6bYT6c+3Q/Oedvp/u3gwB2+diRqFW20HqL
	h3B/gr7uhqy+eD3Ui2M7mgwUHIYOVJYGiMswOx9xPgRIgHgWk0uRfdm3BqRFOPKZcwuAT1TU++NdL
	sfiURmzFevxpXOjDTxXNn6ugQrz6ksOOR0AqClTF+KzTsUeQ21hhCEpkElUYCjO5eR53CWio5275E
	8kFY+eiPTSN5R/u46eS1PLhzjrSQv3AUxc2tE3jj8bmy5Oer2AruFGjNd4FQMP5CcUlGUWNbMh6fc
	wffQLbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyaG-00000000akp-1lLx
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 17:19:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyWi-00000000ZTn-07Xf;
	Tue, 25 Feb 2025 17:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AAAB6129B;
	Tue, 25 Feb 2025 17:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00476C4CEDD;
	Tue, 25 Feb 2025 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503723;
	bh=7KeqBFol8pGLRVvFbeuC+puSXOYFlCJdGV7zPxksw7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/GPGZXeAlGWSiKVMN9ABMI1yaVWrR4V2oHRRwyBLXzcOuX9hCCjYJwcq1Fb0XZ9Y
	 MjqnURj4wK5tFnqZfYta9/djn513hXYNQm3d8f+2joPI/Z058C4v04Li2/eZOvbUSn
	 7A9v12Jj0k3zH68ZKxsZtTErDRqvJZ9vj/A7agSVQgu29nyuFNWaTeEuab747g7rCw
	 HKBbsgEZFQcEAXD7OWNS2yn2JyLpWwo6hp0EtVbQnad1lvWwVIHJ06jpU4KtDsIFZL
	 Tl9V1QFJiCsPLa52hVSQ0C79t3Pw2Nvsbyt6pPR81f2Lpns12SogMGwZ59znC/2T1X
	 3a3hjT1YO/H0w==
Date: Tue, 25 Feb 2025 11:15:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: wireless: ath11k: Strip ath11k prefix
 from calibration property
Message-ID: <174050372078.2716032.16014648484871048536.robh@kernel.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
 <20250225-b-wifi-qcom-calibration-variant-v1-2-3b2aa3f89c53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-2-3b2aa3f89c53@linaro.org>
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


On Tue, 25 Feb 2025 10:05:33 +0100, Krzysztof Kozlowski wrote:
> Devicetree properties describing exactly the same thing should be
> reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
> certain calibration data, so properties should not be prefixed with
> device family (ath11k).
> 
> Deprecate qcom,ath11k-calibration-variant and alike, so we gradually
> switch to a common property.  This will also allow moving these
> properties to common schema, if desired.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 9 ++++++++-
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml  | 7 +++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


