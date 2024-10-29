Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C4AD3A67A
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xoMNr+5RKeB4Zhsppi1kqysRJPtuusOykLQ1SgCZ+E=; b=R65kymIXeMSLPbseCdIwnAdnhU
	k3HplSzkIRnGEPHBYx1pnjdsI4fu4sLR8nEwT+aQolXjwhsepkKPzNaICO+8lUw+1rFt96wyfIttt
	m28tjoBQuM5eXKjdYwXpg+64mBRRAKT4nrEZQkRQvzXR/bMLXiISLQWMSRDEKAJPX6mi4LeiXU2x9
	3hU1qSCZggg94CaMMZ2NdNBdocRQ1fGoydY5RKJ0J+DtvU/NI85ww8jKil45EySRtUeaiMatdUtwi
	QzYM0VGipkgFIMlaoxHsxUuPI+Cpjsxx39sD4AuK9fbwYrQaK068wf9VPhe/L4jSsThAGYJIYX0BW
	fnWf0t6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qQK-0000000FPBb-1QWb
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:54:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q46-0000000FGZ9-3omS
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 17:31:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAaNwR013129;
	Tue, 29 Oct 2024 17:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xoMNr+5RKeB4Zhsppi1kqysRJPtuusOykLQ1SgCZ+E=; b=I813tiGJMX3PYMYc
	puZEfUPCVQ/b9bO4fizfojrrOaonvQmvvpMIw6wWQoApD89cR41LdYaVlj+QAJRL
	sZw5FVk5rgiGiBUrV7ayxgWuAXNAMUYfQBbr+VYD47pDpFQ82xIohDICATHyvr+y
	lluyxNbAJsL5z0xKgeFT7+sQoJVLPudjPIyz8Ofc9H9JtkEyY+OWLojoLXmVCHDN
	2hVeqUn5OSmpVVpVNQ/6Kuis5OWsbPMLPEBhVB55XUWJHWJJj3RQseQqleULycAb
	mL6e1c3al1rkeFp2BAnQQTQnP26svSljgytMoPnIxXN54m63n4lpkAmmgdoIotMI
	YpT57w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe614wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 17:31:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49THVTpN014851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 17:31:29 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 10:31:25 -0700
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
Subject: [RFC PATCH v2 1/5] dt-bindings: net: wireless: ath12k: describe WSI properties for QCN9274
Date: Tue, 29 Oct 2024 23:00:46 +0530
Message-ID: <20241029173050.2188150-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029173050.2188150-1-quic_rajkbhag@quicinc.com>
References: <20241029173050.2188150-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eCz9aDWFc5sfOT9-BzYLUNT-HrfRtA79
X-Proofpoint-ORIG-GUID: eCz9aDWFc5sfOT9-BzYLUNT-HrfRtA79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_103135_191789_2689DF65 
X-CRM114-Status: GOOD (  18.22  )
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

QCN9274 device has WSI support. WSI stands for WLAN Serial Interface.
It is used for the exchange of specific control information across
radios based on the doorbell mechanism. This WSI connection is
essential to exchange control information among these devices

Hence, describe WSI interface supported in QCN9274 with the following
properties:

 - qcom,wsi-group-id: It represents the identifier assigned to the WSI
   connection. All the ath12k devices connected to same WSI connection
   have the same wsi-group-id.

 - qcom,wsi-master: Indicates if this device is the WSI master.

 - ports: This is a graph ports schema that has two ports: TX (port@0)
   and RX (port@1). This represents the actual WSI connection among
   multiple devices.

Also, describe the ath12k device property
"qcom,ath12k-calibration-variant". This is a common property among
ath12k devices.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 241 +++++++++++++++++-
 1 file changed, 232 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index 1b5884015b15..42bcd73dd159 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (c) 2024 Linaro Limited
+# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
@@ -18,10 +19,17 @@ properties:
   compatible:
     enum:
       - pci17cb,1107  # WCN7850
+      - pci17cb,1109  # QCN9274
 
   reg:
     maxItems: 1
 
+  qcom,ath12k-calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      string to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
@@ -49,21 +57,100 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  wsi:
+    type: object
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
+               | pcie2 |        | pcie3 |        | pcie1 |
+               |       |        |       |        |       |
+        +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
+        |      | grp 0 |        | grp 0 |        | grp 2 |     |
+        |      +-------+        +-------+        +-------+     |
+        +------------------------------------------------------+
+
+      Diagram to represent two WSI connections (two separate WSI groups)
+      among four devices.
+
+           +-------+    +-------+          +-------+    +-------+
+           | pcie2 |    | pcie3 |          | pcie1 |    | pcie0 |
+           |       |    |       |          |       |    |       |
+       +-->|  wsi  |--->|  wsi  |--+   +-->|  wsi  |--->|  wsi  |--+
+       |   | grp 0 |    | grp 0 |  |   |   | grp 1 |    | grp 1 |  |
+       |   +-------+    +-------+  |   |   +-------+    +-------+  |
+       +---------------------------+   +---------------------------+
+
+    properties:
+      qcom,wsi-group-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          It represents the identifier assigned to the WSI connection. All
+          the ath12k devices connected to same WSI connection have the
+          same wsi-group-id.
+
+      qcom,wsi-master:
+        type: boolean
+        description:
+          Indicates if this device is the WSI master.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are used to connect multiple WSI supported devices to
+          form the WSI group.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description:
+              This is the TX port of WSI interface. It is attached to the RX
+              port of the next device in the WSI connection.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description:
+              This is the RX port of WSI interface. It is attached to the TX
+              port of the previous device in the WSI connection.
+
+    required:
+      - qcom,wsi-group-id
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - vddaon-supply
-  - vddwlcx-supply
-  - vddwlmx-supply
-  - vddrfacmn-supply
-  - vddrfa0p8-supply
-  - vddrfa1p2-supply
-  - vddrfa1p8-supply
-  - vddpcie0p9-supply
-  - vddpcie1p8-supply
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - pci17cb,1107
+    then:
+      required:
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
@@ -97,3 +184,139 @@ examples:
             };
         };
     };
+
+  - |
+    pcie1 {
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
+            wifi1@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                qcom,ath12k-calibration-variant = "RDP433_1";
+
+                wsi {
+                    qcom,wsi-group-id = <0>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+
+                            wifi1_wsi_tx: endpoint {
+                                remote-endpoint = <&wifi2_wsi_rx>;
+                            };
+                        };
+
+                        port@1 {
+                            reg = <1>;
+
+                            wifi1_wsi_rx: endpoint {
+                                remote-endpoint = <&wifi3_wsi_tx>;
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+    pcie2 {
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
+            wifi2@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                qcom,ath12k-calibration-variant = "RDP433_2";
+
+                wsi {
+                    qcom,wsi-group-id = <0>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+
+                            wifi2_wsi_tx: endpoint {
+                                remote-endpoint = <&wifi3_wsi_rx>;
+                            };
+                        };
+
+                        port@1 {
+                            reg = <1>;
+
+                            wifi2_wsi_rx: endpoint {
+                                remote-endpoint = <&wifi1_wsi_tx>;
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+    pcie3 {
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
+            wifi3@0 {
+                compatible = "pci17cb,1109";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+
+                qcom,ath12k-calibration-variant = "RDP433_3";
+
+                wsi {
+                    qcom,wsi-group-id = <0>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+
+                            wifi3_wsi_tx: endpoint {
+                                remote-endpoint = <&wifi1_wsi_rx>;
+                            };
+                        };
+
+                        port@1 {
+                            reg = <1>;
+
+                            wifi3_wsi_rx: endpoint {
+                                remote-endpoint = <&wifi2_wsi_tx>;
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1


