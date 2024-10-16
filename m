Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15B8D206A2
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6kn2/jzK8IWm5/Gqj0IJsIVAqVOiO++MzBYu0SjmjI=; b=bGqvk7iaN5tV1bcZED8rSk7ZF0
	F0r+IeB/LfJjMN6ZMRqC1s1d3x/LvegWGJm1bIcFMfxATz0UDPiUXPsqCBKUiduVM3Q6JmWUFrb85
	YP4+HcSKLvPqwwONqkVKV2SONvh1sts8F36BzWFc4XdhfIV2fHht4K4Lf4H9tSvYaTNI/8fGDcRZb
	H1ZY8BQYoUaTaiVjRuFGeZw0r1H3aP45MWK+Ic7iNxaxItmRtTRGUnSdkO5czbAtLeDb6E3WDRSCD
	+ay6aZWwu5mYrJi8SGgPMOmS8wUwWd8Rsqq6dkmFUBixHYW8eoqVVZIkigdiiHw3ulohtUrxRxu+S
	IY6O1JqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y55-0000000AmhG-2Wt9
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 07:04:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y3Q-0000000Amb4-3HUm
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 07:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47139A4396A;
	Wed, 16 Oct 2024 07:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A5EC4CEC5;
	Wed, 16 Oct 2024 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729062162;
	bh=FO++GEsxPTwtTYO2+B2x5EpogYd56XYIlW753Uemkjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxALo9CoTDMhR2C6l/31YgfkBr9tvxnZJOfvbKhBqVWGgc4EZPqGeF0pKjWPPoks7
	 Ec0kI50lm8RJIQD6TyIDM3GgpB0x9kgXsBSllaCEfiqz7Sn1uoqtjDZj86S3YAnW9q
	 LaX8X6augSmPhDI8jIs5hUnjgOI3Fu4ItUYVk3EbQST584kvtNjknzr5Q2tcxxmfRo
	 1Hx+thWG40NyHbB55SQDE4DNGoejXkKx/ZgtQOf745UXDJUWh4YQgwFau6vDl/+u6t
	 HdgvtTMYRJALi2oWvTibI7mhfMxR1+9Db2U/XbbvHaFdClcmtIWnqfDdU4gZV6hmla
	 GY8PUOC6nq3Zg==
Date: Wed, 16 Oct 2024 09:02:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 01/22] dt-bindings: net: wireless: describe the ath12k
 AHB module
Message-ID: <h4xel7xh3vyljxi7jn2afqasfmbsiqjtgpvqthrviovode6cxt@ey5nnzi4dwtv>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-2-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015182637.955753-2-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_000245_024731_C31D6CE8 
X-CRM114-Status: GOOD (  17.73  )
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

On Tue, Oct 15, 2024 at 11:56:16PM +0530, Raj Kumar Bhagat wrote:
> Add device-tree bindings for the ATH12K module found in the IPQ5332
> device.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

That's a v2, what changed?

Did you ignore entire review? Limited review follows because of that (I
am not going to do the same work twice).

>  .../net/wireless/qcom,ath12k-ahb.yaml         | 293 ++++++++++++++++++
>  1 file changed, 293 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> new file mode 100644
> index 000000000000..54784e396d7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> @@ -0,0 +1,293 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-ahb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies ath12k wireless devices (AHB)
> +
> +maintainers:
> +  - Kalle Valo <kvalo@kernel.org>
> +  - Jeff Johnson <jjohnson@kernel.org>
> +
> +description:
> +  Qualcomm Technologies IEEE 802.11be AHB devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5332-wifi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO clock used for copy engine
> +
> +  clock-names:
> +    items:
> +      - const: gcc_xo_clk

Drop _clk, drop gcc_. Look how this clock is called *everywhere* else.

> +
> +  interrupts:
> +    items:
> +      - description: Ready interrupt
> +      - description: Spawn acknowledge interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: misc-pulse1 interrupt events
> +      - description: misc-latch interrupt events
> +      - description: sw exception interrupt events
> +      - description: interrupt event for ring CE0
> +      - description: interrupt event for ring CE1
> +      - description: interrupt event for ring CE2
> +      - description: interrupt event for ring CE3
> +      - description: interrupt event for ring CE4
> +      - description: interrupt event for ring CE5
> +      - description: interrupt event for ring CE6
> +      - description: interrupt event for ring CE7
> +      - description: interrupt event for ring CE8
> +      - description: interrupt event for ring CE9
> +      - description: interrupt event for ring CE10
> +      - description: interrupt event for ring CE11
> +      - description: interrupt event for ring host2wbm-desc-feed
> +      - description: interrupt event for ring host2reo-re-injection
> +      - description: interrupt event for ring host2reo-command
> +      - description: interrupt event for ring host2rxdma-monitor-ring1
> +      - description: interrupt event for ring reo2ost-exception
> +      - description: interrupt event for ring wbm2host-rx-release
> +      - description: interrupt event for ring reo2host-status
> +      - description: interrupt event for ring reo2host-destination-ring4
> +      - description: interrupt event for ring reo2host-destination-ring3
> +      - description: interrupt event for ring reo2host-destination-ring2
> +      - description: interrupt event for ring reo2host-destination-ring1
> +      - description: interrupt event for ring rxdma2host-monitor-destination-mac3
> +      - description: interrupt event for ring rxdma2host-monitor-destination-mac2
> +      - description: interrupt event for ring rxdma2host-monitor-destination-mac1
> +      - description: interrupt event for ring host2rxdma-host-buf-ring-mac3
> +      - description: interrupt event for ring host2rxdma-host-buf-ring-mac2
> +      - description: interrupt event for ring host2rxdma-host-buf-ring-mac1
> +      - description: interrupt event for ring host2tcl-input-ring4
> +      - description: interrupt event for ring host2tcl-input-ring3
> +      - description: interrupt event for ring host2tcl-input-ring2
> +      - description: interrupt event for ring host2tcl-input-ring1
> +      - description: interrupt event for ring wbm2host-tx-completions-ring4
> +      - description: interrupt event for ring wbm2host-tx-completions-ring3
> +      - description: interrupt event for ring wbm2host-tx-completions-ring2
> +      - description: interrupt event for ring wbm2host-tx-completions-ring1
> +      - description: interrupt event for ring host2tx-monitor-ring1
> +      - description: interrupt event for ring txmon2host-monitor-destination-mac3
> +      - description: interrupt event for ring txmon2host-monitor-destination-mac2
> +      - description: interrupt event for ring txmon2host-monitor-destination-mac1
> +      - description: interrupt event for umac_reset
> +
> +  interrupt-names:
> +    items:
> +      - const: ready
> +      - const: spawn
> +      - const: stop-ack
> +      - const: misc-pulse1
> +      - const: misc-latch
> +      - const: sw-exception
> +      - const: ce0
> +      - const: ce1
> +      - const: ce2
> +      - const: ce3
> +      - const: ce4
> +      - const: ce5
> +      - const: ce6
> +      - const: ce7
> +      - const: ce8
> +      - const: ce9
> +      - const: ce10
> +      - const: ce11
> +      - const: host2wbm-desc-feed
> +      - const: host2reo-re-injection
> +      - const: host2reo-command
> +      - const: host2rxdma-monitor-ring1
> +      - const: reo2ost-exception
> +      - const: wbm2host-rx-release
> +      - const: reo2host-status
> +      - const: reo2host-destination-ring4
> +      - const: reo2host-destination-ring3
> +      - const: reo2host-destination-ring2
> +      - const: reo2host-destination-ring1
> +      - const: rxdma2host-monitor-destination-mac3
> +      - const: rxdma2host-monitor-destination-mac2
> +      - const: rxdma2host-monitor-destination-mac1
> +      - const: host2rxdma-host-buf-ring-mac3
> +      - const: host2rxdma-host-buf-ring-mac2
> +      - const: host2rxdma-host-buf-ring-mac1
> +      - const: host2tcl-input-ring4
> +      - const: host2tcl-input-ring3
> +      - const: host2tcl-input-ring2
> +      - const: host2tcl-input-ring1
> +      - const: wbm2host-tx-completions-ring4
> +      - const: wbm2host-tx-completions-ring3
> +      - const: wbm2host-tx-completions-ring2
> +      - const: wbm2host-tx-completions-ring1
> +      - const: host2tx-monitor-ring1
> +      - const: txmon2host-monitor-destination-mac3
> +      - const: txmon2host-monitor-destination-mac2
> +      - const: txmon2host-monitor-destination-mac1
> +      - const: umac_reset
> +
> +  memory-region:
> +    minItems: 1

upper constraint

> +    description:
> +      phandle to a node describing reserved memory (System RAM memory)
> +      used by ath12k firmware (see bindings/reserved-memory/reserved-memory.txt)
> +
> +  qcom,rproc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      DT entry of a WCSS node. WCSS node is the child node of q6 remoteproc driver.
> +      (see bindings/remoteproc/qcom,multipd-pil.yaml)

DT nodes are not children of drivers. But other DT nodes. Explain why
this phandle is needed, what is it for.

To me it looks like you incorrectly organized your nodes.

> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the remote processor
> +    items:
> +      - description: Shutdown WCSS pd
> +      - description: Stop WCSS pd
> +      - description: Spawn WCSS pd
> +
> +  qcom,smem-state-names:
> +    description:
> +      Names of the states used by the AP to signal the remote processor
> +    items:
> +      - const: shutdown
> +      - const: stop
> +      - const: spawn
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - memory-region
> +  - qcom,rproc
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Stray blank line

Best regards,
Krzysztof


