Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B6BE77182
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIV9Xay+sygf+LG4yrGFzcjCUymbAEddv/wLbSPItxE=; b=YdSpo7PVpYkqZVX7+jIAE56bmH
	Iduyh8Gvjt/bdmDuIGNhKrESTj9rc94IzwIsfXn35gh2yINP1bgCHecnQcN1ZH5Fp0W+1WXnzG/Jq
	ckV4y+HxK83ZNh5t+41q7r1d2T1Sobv0bIAZPr+XwU5DHf4WvnH2+DB48nqorH+3hmaYxIXCwCco0
	xTA7T9DMx8JdUlTH/rTwwYajjQm9+gy2Vy44pWrwA85Grk7nxsEObkLVHp97IfLRbUxwv50RJLe3d
	G45NIaE6SicHNtLZLX/Yg/4mXTcyW2SG0xDEEKpkPWcp6T5JxDprNXDWxdVHnO28hv9175+AnWj1B
	+gDGpXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjY-0000000FGsW-2Kbe
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:34:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjW-0000000FGrB-1BSc
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E377A402A1
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C17C4CED4;
	Wed, 11 Dec 2024 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931277;
	bh=gD+erWKg1WYx/d4VCqYCo1hgx/4qc9+Utl+HoeSnyT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hyeNf2pPhxf8OrXPynw3ZOnsQRAiKq2XlKgysFLHjNEeondWlJi1qYzAJqvr3nyTw
	 mz3Yah9fUlONwnwrXY7bURsih52xrL+tlzo6lDb80FE5fdDQ4fyFzI7gVc86Ixlf2p
	 WNWGCFUq3OqYxiOvszzEAhhX8fBooyknPPE/Nq52hrip5c9etxr8so0xgEqh4c1NZa
	 doh9hnTTIfg2em46LXr64ffSLauOZX2rWcsHViU2xFvnVAQhBpOUKg2PEPm6VJMjjl
	 pMGMALN8PqTgZI/WFZE3lpvbAtjMP2mpzKf1JJgFI20yVOtYvPop9bOclD38FA47Wi
	 ca2yi+7iUZbow==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/8] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
Date: Wed, 11 Dec 2024 17:34:25 +0200
Message-Id: <20241211153432.775335-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211153432.775335-1-kvalo@kernel.org>
References: <20241211153432.775335-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073438_447285_9E3476DC 
X-CRM114-Status: GOOD (  15.21  )
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
 .../net/wireless/qcom,ath12k-wsi.yaml         | 204 ++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
new file mode 100644
index 000000000000..cbfb559f6b69
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -0,0 +1,204 @@
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
+description: |
+  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+
+  The ath12k devices (QCN9274) feature WSI support. WSI stands for
+  WLAN Serial Interface. It is used for the exchange of specific
+  control information across radios based on the doorbell mechanism.
+  This WSI connection is essential to exchange control information
+  among these devices.
+
+  The WSI interface includes TX and RX ports, which are used to connect
+  multiple WSI-supported devices together, forming a WSI group.
+
+  Diagram to represent one WSI connection (one WSI group) among
+  three devices.
+
+           +-------+        +-------+        +-------+
+           | pcie1 |        | pcie2 |        | pcie3 |
+           |       |        |       |        |       |
+    +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
+    |      | grp 0 |        | grp 0 |        | grp 0 |     |
+    |      +-------+        +-------+        +-------+     |
+    +------------------------------------------------------+
+
+  Diagram to represent two WSI connections (two separate WSI groups)
+  among four devices.
+
+       +-------+    +-------+          +-------+    +-------+
+       | pcie0 |    | pcie1 |          | pcie2 |    | pcie3 |
+       |       |    |       |          |       |    |       |
+   +-->|  wsi  |--->|  wsi  |--+   +-->|  wsi  |--->|  wsi  |--+
+   |   | grp 0 |    | grp 0 |  |   |   | grp 1 |    | grp 1 |  |
+   |   +-------+    +-------+  |   |   +-------+    +-------+  |
+   +---------------------------+   +---------------------------+
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
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          This is the TX port of WSI interface. It is attached to the RX
+          port of the next device in the WSI connection.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          This is the RX port of WSI interface. It is attached to the TX
+          port of the previous device in the WSI connection.
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


