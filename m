Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E513FD3177B
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 18:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJMkysXG1sw3cZXUMNxQVgW7AvPuKqOOCj5Rogvrix4=; b=fPesODfHTDL+DRFnNBu8YI6CDv
	6qJSnfOCXBHGskCzbRbkUyF/+KRlh9urZAxPUNkYtDFqQiSie4XaPVYArMdVehfQU1/ylyPzvB9br
	BJC4T5bU18IydLKItXHJWCllz7jBrmYjts6K83t0GYpeVIpvAEwMeLPpvTbST7zOQKCmuXF+SIKHQ
	/VqgkezBi65QwWq3YBrjplMpF4i20pLeSoh5Cxp2ak6DC9jw1xiqkCOnWd+w69+OgD2YoIdzAvOAv
	HlAmYa40zJlphERGDkaCGgpqB5u3sfcjl9kgH9W8PpfPPlp06uMX2iTrGxlvU32m7SQ6no1sKxYiT
	uUeuf4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nw8-00000000Jeh-2IB5
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 18:05:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nvn-00000000JaT-0k5i
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 18:05:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59V4Ai000927;
	Tue, 5 Nov 2024 18:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJMkysXG1sw3cZXUMNxQVgW7AvPuKqOOCj5Rogvrix4=; b=ZZlrhFBaB2suNopm
	WdMEM9D1922YEyglU0wDUeAEoARrlRp90rDPJ/KrOD3sYImULlq+TH0U+WHScqJQ
	Ur+nkgv4Uh3zLw6CN+eyIs3c8vSeYZXkhn++AoA4JtWtfF+HWKjQGu1fQ3tfyADO
	qV+t9ZjHQ32Xw6VSMRWUsRKzLo9ce1snYezArlpCPvanTGbFgTfBSb4aBRwGAhpQ
	mO9yzZGUp5DxBmGR6lHzF8PcC/xJxUI8YT12t6oDUmJ892Wtajoa45SQR3CkSeTp
	tiZL086A76vi1bvau8m8eXQzo6M/vazFdNeWX44H4wwi//YyCp2OflggBdvweNvf
	SKVnYw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s8kxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 18:05:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5I5QJO008999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 18:05:26 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 10:05:22 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
Date: Tue, 5 Nov 2024 23:34:40 +0530
Message-ID: <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: df5ehJ7zl2GDMUhy1gwBVq_34pup-RIw
X-Proofpoint-GUID: df5ehJ7zl2GDMUhy1gwBVq_34pup-RIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100531_387599_59922CEA 
X-CRM114-Status: GOOD (  18.67  )
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

The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
to exchange specific control information across radios using a doorbell
mechanism. This WSI connection is essential for exchanging control
information among these devices. The WSI interface in the QCN9274 includes
TX and RX ports, which are used to connect multiple WSI-supported devices
together, forming a WSI group.

Describe QCN9274 PCI wifi device with WSI interface.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 .../net/wireless/qcom,ath12k-wsi.yaml         | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
new file mode 100644
index 000000000000..1e2822a33895
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
+  - Jeff Johnson <quic_jjohnson@quicinc.com>
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
2.34.1


