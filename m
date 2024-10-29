Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7A0D3A678
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65yvnD26sz+F+JIFKjIUO91u2nGvJ/8frS1l3kchIwU=; b=epO/6LpHUX0P5uI7Ad+KOUAPlU
	7bi9fczguvuW7kJWoMO40sHJLCVpT+n3sgnYFHcP7MxPBP6aBCmv0UEDUrk/syaciwR5Usx3qEbu8
	hjbESyg0xLzNLQOVSr03S8b/nNSsEJVnF+4P+QPLrPNr6ZLpT7SItPBsb69G4OrSHlursvHZ1lBx1
	aEzY7zexoJSAfbon4Zr1AOGuRntPAG8MryvKlFzDFMo/3pAjdnoYJB5JZzyqs/rjCU984IR947gB9
	TdSihrXwj/kkLAVbcgEBeu+ayMuctPxdCfrj5O8laCQUHKdHvLKfTENdb0ZBBq31HfUpwT6hwv1Wy
	w8KsZyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qQV-0000000FPMZ-18b4
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:54:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q4O-0000000FGdf-116o
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 17:31:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAUtQN017942;
	Tue, 29 Oct 2024 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65yvnD26sz+F+JIFKjIUO91u2nGvJ/8frS1l3kchIwU=; b=NPpSiuJIaa0s8R31
	WeDTmNKsXxH8vtKQeiXg1Kqjo2fBQCaEYyN8FoVPTdtMkfnNW5M6lPqjt4bYjfR2
	V+GEakN/Cp0bSYzxKhSg1Nhxz+jm+jlzbD99lHZ23TQbiAnpknYAn6vApW9o9/SD
	9pNU65HMX3BYjq/55thO/PDt6138PMNMywQX0I368nlCoEI2+JmJIcAFy1vai0TF
	Pwxoc/BOkCOCCHU0J3XHRBXcsyOEZm3jlRgUM3ld8U4b/ITBsQAiIlNTLSWgTNaj
	1OjBhrq9p5apT/NcA2q1JINrDKe22zuhVAvfRFq2DHWXFbinLj2IFE/onqaLE+ny
	wiJJMw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgs47g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 17:31:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49THVliD023944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 17:31:47 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 10:31:43 -0700
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
Subject: [RFC PATCH v2 5/5] arm64: dts: qcom: ipq9574: Add WiFi nodes for RDP433
Date: Tue, 29 Oct 2024 23:00:50 +0530
Message-ID: <20241029173050.2188150-6-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6S_ot7rnr18gQr2EpBfn24eFsvZuwvnN
X-Proofpoint-GUID: 6S_ot7rnr18gQr2EpBfn24eFsvZuwvnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=733 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_103152_419556_E1CF83E4 
X-CRM114-Status: GOOD (  12.78  )
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

The RDP433 is a Qualcomm Reference Design Platform based on the
IPQ9574. It has three QCN9274 WiFi devices connected to PCIe1, PCIe2,
and PCIe3. These devices are also connected among themselves via
WSI connection. This WSI connection is essential to exchange control
information among these devices

The WSI connection in RDP433 is represented below:

          +-------+        +-------+        +-------+
          | pcie2 |        | pcie3 |        | pcie1 |
          |       |        |       |        |       |
   +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
   |      | grp 0 |        | grp 0 |        | grp 0 |     |
   |      +-------+        +-------+        +-------+     |
   +------------------------------------------------------+

Based on the above, the WSI properties for QCN9274 at pcie2 are
(considering QCN9274 at pcie2 is WSI master):

 qcom,wsi-group-id = 0
 qcom,wsi-master
 ports:
    tx-port (port@0): endpoint at pcie3 RX port.
    rx-port (port@1): endpoint at pcie1 TX port.

Hence, add WiFi nodes with WSI properties for all three QCN9274
devices connected to RDP433.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 116 +++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 165ebbb59511..d0ecaefe5b41 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -3,7 +3,7 @@
  * IPQ9574 RDP433 board device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 /dts-v1/;
@@ -27,6 +27,44 @@ &pcie1 {
 	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	pcie@0 {
+		device_type = "pci";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi1@0 {
+			compatible = "pci17cb,1109";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+
+			wsi {
+				qcom,wsi-group-id = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						wifi1_wsi_tx: endpoint {
+							remote-endpoint = <&wifi2_wsi_rx>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						wifi1_wsi_rx: endpoint {
+							remote-endpoint = <&wifi3_wsi_tx>;
+						};
+					};
+				};
+			};
+		};
+	};
 };
 
 &pcie2_phy {
@@ -40,6 +78,45 @@ &pcie2 {
 	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	pcie@0 {
+		device_type = "pci";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi2@0 {
+			compatible = "pci17cb,1109";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+
+			wsi {
+				qcom,wsi-group-id = <0>;
+				qcom,wsi-master;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						wifi2_wsi_tx: endpoint {
+							remote-endpoint = <&wifi3_wsi_rx>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						wifi2_wsi_rx: endpoint {
+							remote-endpoint = <&wifi1_wsi_tx>;
+						};
+					};
+				};
+			};
+		};
+	};
 };
 
 &pcie3_phy {
@@ -53,6 +130,43 @@ &pcie3 {
 	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	pcie@0 {
+		device_type = "pci";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi3@0 {
+			compatible = "pci17cb,1109";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+
+			wsi {
+				qcom,wsi-group-id = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						wifi3_wsi_tx: endpoint {
+							remote-endpoint = <&wifi1_wsi_rx>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						wifi3_wsi_rx: endpoint {
+							remote-endpoint = <&wifi2_wsi_tx>;
+						};
+					};
+				};
+			};
+		};
+	};
 };
 
 &sdhc_1 {
-- 
2.34.1


