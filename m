Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE078E77170
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtIemqL1velGChJr42Sed+s4RX8kPSrcpuQlElJ+L8s=; b=efdUicwdPUElAV7DCGrwqkl53U
	uAcpE/oVJN57wpqs961IgBe9LuYwyue+EHfdWXfi4sUfk6TT63dKQQJ5ZwjtNTJQKPgpgpUBPU4Wk
	T3EuQKXXU76qTousvvzGKDRWVjFYpCQ1I++LddGxgBfo3cw3GbhE1A2P5kx4ZB1Skc+mTzdMw9bmL
	qhowhLJEt/+basj3boYcWQFHHvEubBjy/XOSaX3YgdKldnpNB07oKQKVYacrCT3QwnHDfke0h7r0z
	FXAKEDlox4Vw9jvfUiEtLpupZTENWnr3CKvdK0sxJYAYqhLfytSOf0FpBCGhWKestqp0JI1Lv6idO
	o3qEuIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUu-0000000HJP8-2Enn
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 20:30:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUs-0000000HJOE-1JbY
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 20:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 593DCA418C7
	for <ath12k@lists.infradead.org>; Thu,  5 Dec 2024 20:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232C2C4CED1;
	Thu,  5 Dec 2024 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733430649;
	bh=NEXretkiG3OoM6zGcJIb9KW/trestT8vabejUksCaQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4NqmSY1Q84RlFlLbqwekZD25+BeodrgkGvMWYrtpnv2WVAFSQ7sYfGnLMxWPoAsu
	 yyCGVk48NvNBdrPoLGLiUnFQ82mvRO4B98OLrDLzr+Yn1S0GIAa8kQ46CVMgyFD3c6
	 p2gaAjfgoxmkPi88oa+PCBMz0Zm8PdC89wC/GM6VIQPdepUI5Tv2XGRlIf3B15DcGs
	 sVCUkukkVGUjRyH0xPfsbJ3SrY2tKCWnnZrYL0ZdeBs9r0nZluGfvADNGEJ1KB+r+4
	 +DiId+g8WUhm3rp8jr5iFzm0R19orqy4WPo7QE+c5EhacYlpKRnRU88KT1P65V9fIh
	 99VmV3j1Hk6cQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
Date: Thu,  5 Dec 2024 22:30:37 +0200
Message-Id: <20241205203044.589499-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205203044.589499-1-kvalo@kernel.org>
References: <20241205203044.589499-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123050_485195_68BB81D1 
X-CRM114-Status: GOOD (  15.79  )
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
index 000000000000..d812897915ec
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
+    type: boolean
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


