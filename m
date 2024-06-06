Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE1CC25B75
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aFKFQYWMNSH63Mji2drQyhKhB1JmDFytStDv3VmMCE=; b=sim7617+B1CbHBxBN5x4YNts7p
	Yjbsiwug576MDPr1mkrhJA9+EkrKWKEEIzbU2chNy2Nfj4gglTOVxKDca5NpjeCX1S46IzOAdmOQ0
	U9zlIZCEiH2XbzN89JwK+BptFH/z8g3zqjlaVCJBsJPTVIsSpgAK2Tu9CBVDZppFbHw7m2SuLA8nT
	XlUmea8cX8J6KtJbNxVvdPWWedE1jux7pJTxwPiSGjE9SaBJ18N5GsWEwObgYRRY+rRnLY2CcYL7e
	iluAF99zRYG3oLg6jvmxYsTTp+SVLjTtrx2J8rH1V5T/mFA15tDd4PdVe+t1oxASJy2RU5SItz6qR
	Nv+j4bMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDG1-00000009uFt-2ALD
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 13:34:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDFx-00000009uEW-2w08;
	Thu, 06 Jun 2024 13:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBFA2CE1B24;
	Thu,  6 Jun 2024 13:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6A4C2BD10;
	Thu,  6 Jun 2024 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717680855;
	bh=eL/g/oUrAWm5JIaMO5q18too/EUOHHxjbv/SpSpADl4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=d+0eQwGUhHjyuIv5Un2Kh5AgnrMQxrjp3vUm9yQhUzbUSVggC7KM2eO1isMz0+ZH4
	 h3SIDih8zMffIuN2H18ywEP4xtBpk9vTIqznukx66KVy1625U51Yeb/+DjJie3M4DG
	 wfPHlv1XcQt1cP3FMg1OVQe4NVtTq5zUhzMVt9RLxe8z0HbYQyUcUHNOPLumi8JHjh
	 TXzj0Fjhlz50HXH4a7wAnh4DKp/DHvB9YLI8Ie7xJ/HmI2g/LFK4J/2aORABAIj916
	 I3EcTwiBBVAUHnSs/HVfsKdz8TVHD/w3k/PjHtoRhqFRjgmrt2DXDPuiml9Ys53+CU
	 w+11WNBwY7kiQ==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  ath12k@lists.infradead.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 2/2] dt-bindings: net: wireless: describe the ath12k
 PCI module
References: <20240605122106.23818-1-brgl@bgdev.pl>
	<20240605122106.23818-3-brgl@bgdev.pl>
Date: Thu, 06 Jun 2024 16:34:09 +0300
In-Reply-To: <20240605122106.23818-3-brgl@bgdev.pl> (Bartosz Golaszewski's
	message of "Wed, 5 Jun 2024 14:21:05 +0200")
Message-ID: <87cyouqjou.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_063418_198184_A8CAD169 
X-CRM114-Status: GOOD (  14.73  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add device-tree bindings for the ATH12K module found in the WCN7850
> package.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../bindings/net/wireless/qcom,ath12k.yaml    | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> new file mode 100644
> index 000000000000..1b5884015b15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024 Linaro Limited
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies ath12k wireless devices (PCIe)
> +
> +maintainers:
> +  - Jeff Johnson <quic_jjohnson@quicinc.com>
> +  - Kalle Valo <kvalo@kernel.org>
> +
> +description:
> +  Qualcomm Technologies IEEE 802.11be PCIe devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci17cb,1107  # WCN7850
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddaon-supply:
> +    description: VDD_AON supply regulator handle
> +
> +  vddwlcx-supply:
> +    description: VDD_WLCX supply regulator handle
> +
> +  vddwlmx-supply:
> +    description: VDD_WLMX supply regulator handle
> +
> +  vddrfacmn-supply:
> +    description: VDD_RFA_CMN supply regulator handle
> +
> +  vddrfa0p8-supply:
> +    description: VDD_RFA_0P8 supply regulator handle
> +
> +  vddrfa1p2-supply:
> +    description: VDD_RFA_1P2 supply regulator handle
> +
> +  vddrfa1p8-supply:
> +    description: VDD_RFA_1P8 supply regulator handle
> +
> +  vddpcie0p9-supply:
> +    description: VDD_PCIE_0P9 supply regulator handle
> +
> +  vddpcie1p8-supply:
> +    description: VDD_PCIE_1P8 supply regulator handle
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddaon-supply
> +  - vddwlcx-supply
> +  - vddwlmx-supply
> +  - vddrfacmn-supply
> +  - vddrfa0p8-supply
> +  - vddrfa1p2-supply
> +  - vddrfa1p8-supply
> +  - vddpcie0p9-supply
> +  - vddpcie1p8-supply

Same comment here. To my understanding there are ath12k PCI devices
which do not need the supplies. But I guess we change this to optional
later?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

