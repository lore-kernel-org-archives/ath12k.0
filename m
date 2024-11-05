Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FD4D31778
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kd2JiE9B9EjKM0emvf0bQJLJXrq0QujoPl0mNkoNW3A=; b=pDgCYYOYKiF0CtD8maveSdvxKG
	7N/Q7WVoEAWw3c3j/pj2dzENYxczRQP3uAqX0GJqGJfDPhGvuP2+/O3AmH5oFhDx7P02kG1JhNL5k
	vdmGdjewrBsfQPwIMab4m7JvMcLltFJu0hij85zEoTqbQrhJscQggJbJ0Hy4Lb4s3+hDsVeGghP1b
	DTHUJ+R9NH39mdEheoVRuaI7vsZf2IbuPnTsRf2HP+4mPgLO0AaBwrXWw6X3uvZo44KJyv9Ul+o2T
	VIWRbkaLeub+1IU+24Iiupq9cFNmuqt9Ukdm8p+GWOqNzai8DHBjV6nA5WVtyqGUXYQ0m8CJNQV9t
	zeoe9IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NwB-00000000JgO-2oWm
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 18:05:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nw3-00000000Jd7-3zL9
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 18:05:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59YWRh028840;
	Tue, 5 Nov 2024 18:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kd2JiE9B9EjKM0emvf0bQJLJXrq0QujoPl0mNkoNW3A=; b=mr5gwgJ4ciToyIal
	+S98m9hlzJksbmue7SZ9sZa2tp6ri5sVXWpnwvTnGgHUsZwFLvFaPdLyj4h7wyOa
	uii/gvCwUSdeplExZ4TWHSFp+2Qka7tOu7VUkKqBErtJvxg+38WE+KO+8gvDIlyq
	5CrX3avffipyledrzrRayGFPAYuLUeC43nMqy6qdBW5lBAchgppxHfdIj5FQz+VM
	pW2UZ3Juzpe7JNQQ4vdwTAKugZWQx7eTXItH7WOGb7RLT+72SJgjgeLaXOWI7LZ3
	fDT1Hj5tQuJJai91CEJWKK7lU7ZHx5GuBPrbj9G2QsWxRllY/kNTJ/bJBmNcsPmU
	V8W2nQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd288p2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 18:05:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5I5h2T016738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 18:05:43 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 10:05:39 -0800
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
Subject: [RFC PATCH v3 5/5] arm64: dts: qcom: ipq9574: Add WiFi nodes for RDP433
Date: Tue, 5 Nov 2024 23:34:44 +0530
Message-ID: <20241105180444.770951-6-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-ORIG-GUID: XLpjE65kjhiAo07QS_xZBZRRNoqQCuED
X-Proofpoint-GUID: XLpjE65kjhiAo07QS_xZBZRRNoqQCuED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=696
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100548_159317_A1DA9BD8 
X-CRM114-Status: GOOD (  12.86  )
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
          | pcie1 |        | pcie2 |        | pcie3 |
          |       |        |       |        |       |
   +----->|  wsi  |------->|  wsi  |------->|  wsi  |-----+
   |      | grp 0 |        | grp 0 |        | grp 0 |     |
   |      +-------+        +-------+        +-------+     |
   +------------------------------------------------------+

Based on the above, the wifi node properties for QCN9274 at pcie2 are
(considering QCN9274 at pcie2 is WSI controller):

 - qcom,wsi-controller
 - ports:
    tx-port (port@0): endpoint at pcie3 RX port.
    rx-port (port@1): endpoint at pcie1 TX port.

Hence, add WiFi nodes with WSI properties for all three QCN9274
devices connected to RDP433.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 105 +++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 165ebbb59511..a490a0d51fbb 100644
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
@@ -27,6 +27,40 @@ &pcie1 {
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
+		wifi@0 {
+			compatible = "pci17cb,1109";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					wifi1_wsi_tx: endpoint {
+						remote-endpoint = <&wifi2_wsi_rx>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					wifi1_wsi_rx: endpoint {
+						remote-endpoint = <&wifi3_wsi_tx>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &pcie2_phy {
@@ -40,6 +74,42 @@ &pcie2 {
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
+		wifi@0 {
+			compatible = "pci17cb,1109";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+
+			qcom,wsi-controller;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					wifi2_wsi_tx: endpoint {
+						remote-endpoint = <&wifi3_wsi_rx>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					wifi2_wsi_rx: endpoint {
+						remote-endpoint = <&wifi1_wsi_tx>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &pcie3_phy {
@@ -53,6 +123,39 @@ &pcie3 {
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
+		wifi@0 {
+			compatible = "pci17cb,1109";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					wifi3_wsi_tx: endpoint {
+						remote-endpoint = <&wifi1_wsi_rx>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					wifi3_wsi_rx: endpoint {
+						remote-endpoint = <&wifi2_wsi_tx>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &sdhc_1 {
-- 
2.34.1


