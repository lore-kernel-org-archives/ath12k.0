Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED80E77181
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXTI2v/RG82Qbx9T2zjZV1N+kh2yb/cQz8XlpUq2DZw=; b=nax7OHKH6ulJf4Ekea+CB7vysD
	aFSRLFhDkHWtvJeZKjuCi7SkGb9jXXHyM/QUnBSgpDcNjRPVZJk2bVHgVc9xFiazHHta5ypfbbPbo
	vjDkGGaADW3FG6l0LeYbHfkg5h59Fixd2A9WuJmJ22sp3XXCFzINV3W/Of2Ninv9KmKwDzhXntOQ8
	DDKVE7N+8e0c3pPzqAvaOmu6IDRdSdn4PUegxrk9P3wBxowKxlhuIG89t0YuldgBZulMOG7rF2rkw
	OS5CuWlz0HxJZcOfEc9XG/rKNOx4vkTyQEYUMZ6vIHNC64g/9fXBEZUcubSr2mumYqkyuXrFxJDu1
	Sh091k8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfic-00000008OOo-0LMb
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 15:30:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfiZ-00000008ONk-2S1R
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 15:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A0335C548D
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 15:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EE7C4CED1;
	Mon,  9 Dec 2024 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733758238;
	bh=e9WSZvVMzILRMJOu0NThf7D3Et045XEjYOPkTYEM8Ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RqLVJWdjEk0YslqvYuvOX/PVho3/hhjj8+cb5D4nyX96+Ioay+tapZzFVGfJgYGlH
	 xXeEn29seneZUtRYcTkNnfehFLzLfHQBxJPmbBpmDjtGyO3AUHTkEpOkbGpmnTL2g4
	 +liXS9zgOJYN9EnhJVTup+UClkT9q/1SorcPxbtFNGTjq6wF/uImGEkc4u/JtEcpfi
	 T7jO8GVQmE0cajlDMIo3STjkNhtKZWEYp4UWKPOgW+eM3Vg0c2+gNWmiVYtYT/1/pG
	 7W0NMDNt5W2eRjtASUCM8U+KgJDWa3YbjsHg/l7qSa3ax5PnBJWl1yy0daET+79y6W
	 sJ+BFT7DiA5Zw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
Date: Mon,  9 Dec 2024 17:30:27 +0200
Message-Id: <20241209153034.50558-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209153034.50558-1-kvalo@kernel.org>
References: <20241209153034.50558-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_073039_746760_67B5BC14 
X-CRM114-Status: GOOD (  15.94  )
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

From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
to exchange specific control information across radios using a doorbell
mechanism. This WSI connection is essential for exchanging control
information among these devices. The WSI interface in the QCN9274 includes
TX and RX ports, which are used to connect multiple WSI-supported devices
together, forming a WSI group.

Describe QCN9274 PCI wifi device with WSI interface.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 .../net/wireless/qcom,ath12k-wsi.yaml         | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
new file mode 100644
index 000000000000..7fec15e10a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -0,0 +1,205 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies ath12k wireless devices (PCIe) with WSI interface
+
+maintainers:
+  - Jeff Johnson <jjohnson@kernel.org>
+  - Kalle Valo <kvalo@kernel.org>
+
+description:
+  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+
+properties:
+  compatible:
+    enum:
+      - pci17cb,1109  # QCN9274
+
+  reg:
+    maxItems: 1
+
+  qcom,ath12k-calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
+  qcom,wsi-controller:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The WSI controller device in the WSI group aids (is capable) to
+      synchronize the Timing Synchronization Function (TSF) clock across
+      all devices in the WSI group.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      The ath12k devices (QCN9274) feature WSI support. WSI stands for
+      WLAN Serial Interface. It is used for the exchange of specific
+      control information across radios based on the doorbell mechanism.
+      This WSI connection is essential to exchange control information
+      among these devices.
+
+      Diagram to represent one WSI connection (one WSI group) among
+      three devices.
+
+               +-------+        +-------+        +-------+
+               | pcie1 |        | pcie2 |        | pcie3 |
+               |       |        |       |        |       |
+        +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
+        |      | grp 0 |        | grp 0 |        | grp 0 |     |
+        |      +-------+        +-------+        +-------+     |
+        +------------------------------------------------------+
+
+      Diagram to represent two WSI connections (two separate WSI groups)
+      among four devices.
+
+           +-------+    +-------+          +-------+    +-------+
+           | pcie0 |    | pcie1 |          | pcie2 |    | pcie3 |
+           |       |    |       |          |       |    |       |
+       +-->|  wsi  |--->|  wsi  |--+   +-->|  wsi  |--->|  wsi  |--+
+       |   | grp 0 |    | grp 0 |  |   |   | grp 1 |    | grp 1 |  |
+       |   +-------+    +-------+  |   |   +-------+    +-------+  |
+       +---------------------------+   +---------------------------+
+
+      These ports are used to connect multiple WSI supported devices to
+      form a WSI group.
+
+      properties:
+        port@0:
+          $ref: /schemas/graph.yaml#/properties/port
+          description:
+            This is the TX port of WSI interface. It is attached to the RX
+            port of the next device in the WSI connection.
+
+        port@1:
+          $ref: /schemas/graph.yaml#/properties/port
+          description:
+            This is the RX port of WSI interface. It is attached to the TX
+            port of the previous device in the WSI connection.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
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
+            wifi@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                qcom,ath12k-calibration-variant = "RDP433_1";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        wifi1_wsi_tx: endpoint {
+                            remote-endpoint = <&wifi2_wsi_rx>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        wifi1_wsi_rx: endpoint {
+                            remote-endpoint = <&wifi3_wsi_tx>;
+                        };
+                    };
+                };
+            };
+        };
+
+        pcie@1 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x1 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            wifi@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                qcom,ath12k-calibration-variant = "RDP433_2";
+                qcom,wsi-controller;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        wifi2_wsi_tx: endpoint {
+                            remote-endpoint = <&wifi3_wsi_rx>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        wifi2_wsi_rx: endpoint {
+                            remote-endpoint = <&wifi1_wsi_tx>;
+                        };
+                    };
+                };
+            };
+        };
+
+        pcie@2 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x2 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            wifi@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                qcom,ath12k-calibration-variant = "RDP433_3";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        wifi3_wsi_tx: endpoint {
+                            remote-endpoint = <&wifi1_wsi_rx>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        wifi3_wsi_rx: endpoint {
+                            remote-endpoint = <&wifi2_wsi_tx>;
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.39.5


