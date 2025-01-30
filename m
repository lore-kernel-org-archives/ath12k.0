Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C75AC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6+vVzYW/zCDGCQTeNqSKkJckzOwSjU3G6CVvE+8/I4=; b=xVRh1bCdojVQJA+/69ZwVnDcVh
	Id0GxBOhIcNGeQ9P/w2qjN6N+xJQ/u/9AuYLfe72gGqfvnAbeJ25wqVF4T5w8DwEnA5VaGD/FZzl5
	oJu6Zt7710/2CW+Ncuwwq2DPLR18oTWs1DRT8VQrsUD0GWSWpzhMnEBaN6FOqDxZMLi2207RJ+he2
	at9jkIRgRoka6fHmd6EYcGxNVpX2aKvKWZPW5/vrT42Qiar5/AQpmZOFGyI989z7yfrTk6yTrk1Fs
	5GNEFKl2aEwCa72qAm6/60Sz4EBBLJRb6YXrFnkhpWJxGLQ4hQF7esuEmhP7zXiJTDNNd+xApnnPN
	ZDBFYTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdPuS-00000008Plq-0IyW
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 08:28:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdPuP-00000008PlW-2gMn
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 08:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFC93A41BEE;
	Thu, 30 Jan 2025 08:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA33C4CED2;
	Thu, 30 Jan 2025 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738225700;
	bh=IsoMpdDBx+byAmxT3k6y9t2ZP5/v4grlO+yHnBpVvPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kdk4+Os46KBumfKAnPZcx06v/7laVPm7Ge95CDXpTUgnuTWp372r65aJyWcEhbows
	 NsUcxjnO8eRtcuF4+ULfgP1pAkMyJXf5IgP0XWtm8XXRzqCF/KBMLcmfUSk6GsSbtd
	 Ui1W1XeOZJiuPqtufGkjxVnT2cgV87CJ4ekZJgGyJkfzuuEoIDMXt4EynOqDbmOUmc
	 vh7wkjbs+7UKA3bdCO5EbG91YgPLCEqnDLfW4hmz6MxmikVPBu5mP0hLujCFwqvQbb
	 PNezRr0uVV6BTOxaP/66Ga6yWtyiYlhXQ8JBi5dWVVCPHB8O3C2GyOG20FJbz4Mdj8
	 b2diw9O+Z1aGw==
Date: Thu, 30 Jan 2025 09:28:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module
Message-ID: <20250130-cunning-quail-of-opportunity-76d0ad@krzk-bin>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_002821_827710_37972A13 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Jan 30, 2025 at 10:04:56AM +0530, Raj Kumar Bhagat wrote:
> Add device-tree bindings for the ATH12K module found in the IPQ5332
> device.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  .../net/wireless/qcom,ath12k-ahb.yaml         | 319 ++++++++++++++++++
>  1 file changed, 319 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> new file mode 100644
> index 000000000000..bd953a028dc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml

Filename should match compatible. This binding does not look like
supporting more devices, so there is no much benefit calling it by generic name.


> @@ -0,0 +1,319 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
> +      - const: xo
> +
> +  interrupts:
> +    items:
> +      - description: Fatal interrupt
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
> +      - description: interrupt event for umac-reset
> +
> +  interrupt-names:
> +    items:
> +      - const: fatal
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
> +      - const: umac-reset
> +
> +  memory-region:
> +    description:
> +      phandle to a node describing reserved memory (System RAM memory)
> +      used by ath12k firmware (see bindings/reserved-memory/reserved-memory.txt)

Do not say what DT syntax is, so "phandle to a node" is redundant,
reserved-memory.txt is redundant. The only useful part here is "used by
ath12k firmware", so based on this none of below are used by the driver
and driver just passes them to the firmware?

> +    items:
> +      - description: Q6 memory region
> +      - description: m3 dump memory region
> +      - description: Q6 caldata memory region
> +      - description: Multi Link Operation (MLO) Global memory region
> +
> +  memory-region-names:
> +    description:
> +      Name of the reserved memory region used by ath12k firmware

Drop description.

> +    items:
> +      - const: q6-region
> +      - const: m3-dump
> +      - const: q6-caldb
> +      - const: mlo-global-mem
> +
> +  qcom,ath12k-calibration-variant:
> +    $ref: /schemas/types.yaml#/definitions/string

Why this is named after ath12k? Why this is just not
"qcom,calibration-variant"? None of the other properties have ath12k in
their names, so why this one in the WSI schema was named like that?

> +    description:
> +      String to uniquely identify variant of the calibration data for designs
> +      with colliding bus and device ids

I don't think this property is here possible. How could you have on the
same SoC different devices?

Best regards,
Krzysztof


