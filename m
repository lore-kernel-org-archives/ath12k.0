Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2123BC25B76
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucQO5tSR+UUnqX3BARACo1yN9MzAT61u2WtozQUoIJg=; b=NliOo14lYTd6nl25yXaeOFTm2J
	SfKH63chF0So3cnu+J1ZGdVGjFRlJpoJwt3+3+N7pYk/SfWff73P6lDZB7ied16Cm7gRr7dymLI0U
	nWiUxW5DBIRcpxVgxfegquJy9M8PA4MXGNTQy1OnYpiwclyzSIgrxkx0KlRq4398VmaIT7pSQxzgR
	fH4eXrKrfSCHLFrHGhBNLSPLx++jEn2TJcr2bxJeuXZ/cR1JSqvvUOp8VD/SgMofg+RMRZlUA05fv
	7rQjmcZVhZAAoBBA0/4qPvTXAAhEkOKZ4UHLzbWxIydANkq5cF7lP+ZdIaAcuK4VVk0Ax0MIWLbpQ
	PsgHR+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpe1-00000005xdc-2dgZ
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 12:21:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpdz-00000005xWq-0TiU
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 12:21:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so21172135e9.0
        for <ath12k@lists.infradead.org>; Wed, 05 Jun 2024 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590081; x=1718194881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucQO5tSR+UUnqX3BARACo1yN9MzAT61u2WtozQUoIJg=;
        b=LJiCy0JAovA6LNGeMEYd49Ij3EFsJBFG/ICxSsIbGGQ8EbNXIOkq8xubhvccFOFbo4
         lV6p03peGi2nSWfS3AasMGNO3YQ+D8ZrnYN0blwdaWLKVAs1/5FMGhXTULHZu01zqPmR
         A85BRhrOQ8oqeiMBbqVLB4z8LIDn4sgWCSFEPO1H4qHna6f+eHv+RCEokzvoHJTsUcQ5
         9b6WzaQjlM3asit7BxTcK4tPf6SqhTrvw+XsM6YlKj4P7wA6GVH1HuDre33O+uR6PqCW
         uKRcmyCloN4IzDG3cs8hUbdxLcC0oRudvlNr1X9gS2LCGUJLw/NhLpKlwjZaSteRDOCd
         g0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590081; x=1718194881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucQO5tSR+UUnqX3BARACo1yN9MzAT61u2WtozQUoIJg=;
        b=duhW7YrqclYqrney83ueMy2grTedrlHdcfayMZA7I1or7aHgoPlmTW/GgElTl4vQh3
         EySHNPY2iVJHBZUYOBWKwMnXzlVS+2JQBF6LKy3+kXmGSqyCUixrKoJlnDGiJn6wGMvE
         1FfNh+03CIGpPFA2vJqevR+KsR+8+ZirldNf+klzTrfpG7rAXhdMNyV73H9sojUZnFCR
         OIx3fovLyZGF4bEGiaXpvPCZDPfy5NO111UrNewyfmyj7Z7gSZ8jEifFZHteR5IFP608
         COy2qn7nCqkSBgxuxFWR8TBpFV4cSvY6swZZ8EW4FFMnpPqNguB6As9mELN7ICfcslNW
         BqJA==
X-Forwarded-Encrypted: i=1; AJvYcCWZADkC2qWGtf/0zck46E/qZC3x9QzDAMWRLC94N1YRAw2DST2/VPsCDuyL0rwGgsPyBdGOq8ghyM212qOZJ5napouHJFZfV9PO5w==
X-Gm-Message-State: AOJu0Yzv0KptnYa38w4wkfpThNHAVMUTysylcdZtsuHVOk4Pvm1UnsbP
	0zYci4GaFK5Ss+/H9GVDKeLysC0gRukXA+ujCO95hL4WGEufnpgn61BhdjeCSO8=
X-Google-Smtp-Source: AGHT+IEzV4+qPAdbvBIVSDh25Kg43lXFdrbrVxygpt/spQBQn6auoyHk/Hs/OfBTW0kfE6X67LA+9A==
X-Received: by 2002:a05:600c:46c4:b0:41f:b0e7:f299 with SMTP id 5b1f17b1804b1-421562cc205mr18573495e9.9.1717590081264;
        Wed, 05 Jun 2024 05:21:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215813ce64sm19634485e9.44.2024.06.05.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:21:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 2/2] dt-bindings: net: wireless: describe the ath12k PCI module
Date: Wed,  5 Jun 2024 14:21:05 +0200
Message-ID: <20240605122106.23818-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605122106.23818-1-brgl@bgdev.pl>
References: <20240605122106.23818-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_052131_189333_28B3C057 
X-CRM114-Status: GOOD (  10.69  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add device-tree bindings for the ATH12K module found in the WCN7850
package.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
new file mode 100644
index 000000000000..1b5884015b15
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 Linaro Limited
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies ath12k wireless devices (PCIe)
+
+maintainers:
+  - Jeff Johnson <quic_jjohnson@quicinc.com>
+  - Kalle Valo <kvalo@kernel.org>
+
+description:
+  Qualcomm Technologies IEEE 802.11be PCIe devices.
+
+properties:
+  compatible:
+    enum:
+      - pci17cb,1107  # WCN7850
+
+  reg:
+    maxItems: 1
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddwlcx-supply:
+    description: VDD_WLCX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WLMX supply regulator handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
+  vddpcie0p9-supply:
+    description: VDD_PCIE_0P9 supply regulator handle
+
+  vddpcie1p8-supply:
+    description: VDD_PCIE_1P8 supply regulator handle
+
+required:
+  - compatible
+  - reg
+  - vddaon-supply
+  - vddwlcx-supply
+  - vddwlmx-supply
+  - vddrfacmn-supply
+  - vddrfa0p8-supply
+  - vddrfa1p2-supply
+  - vddrfa1p8-supply
+  - vddpcie0p9-supply
+  - vddpcie1p8-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            bus-range = <0x01 0xff>;
+
+            wifi@0 {
+                compatible = "pci17cb,1107";
+                reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+                vddaon-supply = <&vreg_pmu_aon_0p59>;
+                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+                vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+            };
+        };
+    };
-- 
2.40.1


