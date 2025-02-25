Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFED7C021B8
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAQ82yK5UpCLLGpY1gtp1DngWGZpOzlQyB3rP4mRIik=; b=IP/jOWup+ivF4u/poWo7e7i3Us
	oqGZDmz03mcrWdOHOnOxIOR3iM6wl8/u4dTeA/fxjI81A39vBxEK6dVmzJ7GuUrhrp+hSJJHcOfIn
	GKAcoXvb5Zbgqz0wM6HpvhbraRPOfEE8wfMqdAtdqIiN7Ot4/EkS15MrS+tvsUfA3L7M1UyJQbP/K
	8npwTZSYmtRjJJgXuZPzcCli/1yXLR1/gvGf8+VeuCap2vVy+aS0+c0zjhzH8C1kik0BHoSt7aJNS
	S7nLkWQrx45J93iEoUPL9/zWXiLU6MCso2QhHpr9YJiFMRGqUPghG3zVLYcrRbr0WZTbb3JfA8cI/
	gpFgmLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmza5-00000000uSu-30Hf
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 18:22:57 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyUU-00000000YxT-1857;
	Tue, 25 Feb 2025 17:13:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67FF46129B;
	Tue, 25 Feb 2025 17:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFDAC4CEDD;
	Tue, 25 Feb 2025 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503585;
	bh=BX69y1ANjPvnVIyBiB7P24k5Cj6FcQsBECZ68cv6mf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vhuyi1T7ESRLApERLkzkFWy0Yz52Ys0tSw5GRFbkhaCcoGkKO5Pw/QHqC3myPk7Kj
	 1OLVtR2mPq+xUtimvS3VUCep+s4F112qgFo4tAesCPKI9OOxh2cyLLKxyrzUTxM/Qb
	 u5mmBFRWfu7Ui975CP7ERxb/aoZP54qLgp5caxj6hbxo4GOAFuak7cpnM8zD9XptaB
	 LX7OLarJMnWEqz5JepBsho0A+VRj3mYn9G8meozrgzkjQCU621aNVHIyARDmo4J437
	 bHKqaXgebTdiKwdSD0UKMQEv6EjJ0R87NpXTRDP9wselJkbdbpNjk/gbzQleQtESw7
	 ryBtdQ0YsMFyw==
Date: Tue, 25 Feb 2025 11:13:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
	ath10k@lists.infradead.org, ath12k@lists.infradead.org,
	ath11k@lists.infradead.org, devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: wireless: ath10k: Strip ath10k prefix
 from calibration properties
Message-ID: <174050358243.2711030.9886778077090867092.robh@kernel.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
 <20250225-b-wifi-qcom-calibration-variant-v1-1-3b2aa3f89c53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-1-3b2aa3f89c53@linaro.org>
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


On Tue, 25 Feb 2025 10:05:32 +0100, Krzysztof Kozlowski wrote:
> Devicetree properties describing exactly the same thing should be
> reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
> certain calibration data, so properties should not be prefixed with
> device family (ath10k).
> 
> Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
> switch to a common property.  This will also allow moving these
> properties to common schema, if desired.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Why? Because people add qcom,ath12k-calibration-data and probably they
> will add qcom,ath13k-calibration-data, qcom,ath14k-calibration-data and
> so on.
> ---
>  .../bindings/net/wireless/qcom,ath10k.yaml         | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


