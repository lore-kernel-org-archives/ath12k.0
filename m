Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8748D3A68E
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7YFTapu5MbB2+8OZOMzwkscLMrLRTsJfiYPYzEC6SY=; b=HfJPyfBAGmiifhp0gSVyJSxkKk
	sinYuIQ2mCJypWjIUKr6yyCTibRNRZlzwYGKBFxSv7+lceXougbeAsBCgf97N3yNLL7JAtYzs/Kbs
	ESkge9cFXvkaADELsEl9YAi1+sbCVJL7KgeYfERDWVv2hdmQFNlopAANeNdNH202HPgYIDRrVxuVS
	MQBTasO9kao5HAzXSOVvR3x3ADUBUnLhpRs1JbgzBkjY/6md8efVksZ8EnJLx1752lvP+wrgSrIwR
	2Oa91yE7EBIgCh0LUApQZ/PkSkK/C4C2ngGpMgZjosT6jSEaTS1n/crUW44+/Em008qPC0cIytzxt
	W2zsnR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rSI-0000000FbFC-1tXx
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 19:00:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qOa-0000000FO8b-0giV
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 17:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC0B6A431A3;
	Tue, 29 Oct 2024 17:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F540C4CECD;
	Tue, 29 Oct 2024 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730224362;
	bh=JFFzzl4Y52ZVnegDHi82oJJUqr3xGdEYAQL4WOBiKC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iS6g92jRiZ2sdckjC6a0TGhUadZSgLSncPGUraVTUoGyigoxlqcwGRdosGj0Pk66d
	 Z7JEpb514VEus4LQOtsuuqD1OH9DKdq81bzkpOCjErHNNp1pVlXHubbqeYjTb1UDo/
	 N0NQtxRc3ws1lZSNyiQsgJBBKMi8fPINo2IxaLqLcT4LurWt9v2rwhJvKQz6mWRI5c
	 +0NGDG8D87qjZ+D8VpMWGVOYsTv1RnZFMUWIh+wN76FMFs6MwUSlzsCY+qiLmjf7zt
	 YKDto92Uykys+cOmW2cd10ld4c5CZIVuxWJ8aYeWyOV4+ycRxA8Q4o/O+AZoZdy5Yj
	 +243lUKrmyNjw==
Message-ID: <764f8f22-146d-4edc-9d46-7fe3c7d9a2f2@kernel.org>
Date: Tue, 29 Oct 2024 18:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] dt-bindings: net: wireless: ath12k: describe
 WSI properties for QCN9274
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241029173050.2188150-1-quic_rajkbhag@quicinc.com>
 <20241029173050.2188150-2-quic_rajkbhag@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241029173050.2188150-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_105244_378929_53A69B7C 
X-CRM114-Status: GOOD (  29.05  )
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

On 29/10/2024 18:30, Raj Kumar Bhagat wrote:
> QCN9274 device has WSI support. WSI stands for WLAN Serial Interface.
> It is used for the exchange of specific control information across
> radios based on the doorbell mechanism. This WSI connection is
> essential to exchange control information among these devices
> 
> Hence, describe WSI interface supported in QCN9274 with the following
> properties:
> 
>  - qcom,wsi-group-id: It represents the identifier assigned to the WSI
>    connection. All the ath12k devices connected to same WSI connection
>    have the same wsi-group-id.
> 
>  - qcom,wsi-master: Indicates if this device is the WSI master.
> 
>  - ports: This is a graph ports schema that has two ports: TX (port@0)
>    and RX (port@1). This represents the actual WSI connection among
>    multiple devices.

Describe the hardware, not the contents of the patch/binding. We see it
easily, but what we do not see is the hardware.

> 
> Also, describe the ath12k device property
> "qcom,ath12k-calibration-variant". This is a common property among
> ath12k devices.

Why do you describe it? What you do is easily visible. We do not see why.

> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  .../bindings/net/wireless/qcom,ath12k.yaml    | 241 +++++++++++++++++-
>  1 file changed, 232 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> index 1b5884015b15..42bcd73dd159 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  # Copyright (c) 2024 Linaro Limited
> +# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
> @@ -18,10 +19,17 @@ properties:
>    compatible:
>      enum:
>        - pci17cb,1107  # WCN7850
> +      - pci17cb,1109  # QCN9274

I asked for separate binding because it is quite a different device.
Unless it is not... but then commit msg is quite not precise here.

>  
>    reg:
>      maxItems: 1
>  
> +  qcom,ath12k-calibration-variant:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      string to uniquely identify variant of the calibration data for designs
> +      with colliding bus and device ids
> +
>    vddaon-supply:
>      description: VDD_AON supply regulator handle
>  
> @@ -49,21 +57,100 @@ properties:
>    vddpcie1p8-supply:
>      description: VDD_PCIE_1P8 supply regulator handle
>  
> +  wsi:

Not much improved here. I asked to drop the node.

> +    type: object
> +    description: |
> +      The ath12k devices (QCN9274) feature WSI support. WSI stands for
> +      WLAN Serial Interface. It is used for the exchange of specific
> +      control information across radios based on the doorbell mechanism.
> +      This WSI connection is essential to exchange control information
> +      among these devices.
> +
> +      Diagram to represent one WSI connection (one WSI group) among
> +      three devices.
> +
> +               +-------+        +-------+        +-------+
> +               | pcie2 |        | pcie3 |        | pcie1 |
> +               |       |        |       |        |       |
> +        +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
> +        |      | grp 0 |        | grp 0 |        | grp 2 |     |
> +        |      +-------+        +-------+        +-------+     |
> +        +------------------------------------------------------+
> +
> +      Diagram to represent two WSI connections (two separate WSI groups)
> +      among four devices.
> +
> +           +-------+    +-------+          +-------+    +-------+
> +           | pcie2 |    | pcie3 |          | pcie1 |    | pcie0 |
> +           |       |    |       |          |       |    |       |
> +       +-->|  wsi  |--->|  wsi  |--+   +-->|  wsi  |--->|  wsi  |--+
> +       |   | grp 0 |    | grp 0 |  |   |   | grp 1 |    | grp 1 |  |
> +       |   +-------+    +-------+  |   |   +-------+    +-------+  |
> +       +---------------------------+   +---------------------------+
> +
> +    properties:
> +      qcom,wsi-group-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          It represents the identifier assigned to the WSI connection. All
> +          the ath12k devices connected to same WSI connection have the
> +          same wsi-group-id.

That's not needed according to description. Entire group is defined by
graph.

> +
> +      qcom,wsi-master:
> +        type: boolean
> +        description:
> +          Indicates if this device is the WSI master.
> +

This copies property name. Why being master is important?

Also, use some different name: see preferred names in kernel coding style.

> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are used to connect multiple WSI supported devices to
> +          form the WSI group.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              This is the TX port of WSI interface. It is attached to the RX
> +              port of the next device in the WSI connection.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              This is the RX port of WSI interface. It is attached to the TX
> +              port of the previous device in the WSI connection.
> +
> +    required:
> +      - qcom,wsi-group-id
> +      - ports
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - vddaon-supply
> -  - vddwlcx-supply
> -  - vddwlmx-supply
> -  - vddrfacmn-supply
> -  - vddrfa0p8-supply
> -  - vddrfa1p2-supply
> -  - vddrfa1p8-supply
> -  - vddpcie0p9-supply
> -  - vddpcie1p8-supply
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - pci17cb,1107
> +    then:
> +      required:
> +        - vddaon-supply
> +        - vddwlcx-supply
> +        - vddwlmx-supply
> +        - vddrfacmn-supply
> +        - vddrfa0p8-supply
> +        - vddrfa1p2-supply
> +        - vddrfa1p8-supply
> +        - vddpcie0p9-supply
> +        - vddpcie1p8-supply

Commit says WSI applies only to new variant, so properties should be
disallowed... or just follow my feedback last time: separate binding.

> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -97,3 +184,139 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    pcie1 {

pcie {
and keep all nodes here

> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        pcie@0 {
> +            device_type = "pci";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            wifi1@0 {

wifi@

Same in other places.

> +                compatible = "pci17cb,1109";
> +                reg = <0x0 0x0 0x0 0x0 0x0>;
> +
> +                qcom,ath12k-calibration-variant = "RDP433_1";
> +
> +                wsi {

No resources here? Not a bus? You already got comment about it.


Best regards,
Krzysztof


