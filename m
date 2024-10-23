Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB1D2E016
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsiY7yt8JQwkr/CGYzfeuyrwP4Vfcc8zvfnje5HZERo=; b=zlWSuY7y59PRpbWGhW229LYH3u
	Bfnr3SIs5i0R6YTp5AVRgghpTRFy5YO+bw/Cap3UKG9Khejt/zOmLNqfIH/WKP6Pe3xhN9WQoMdlZ
	OgQtxbi2Z5Fa+qhcOr3O0y2CNlVrQJz9qBe4q0Khwya/UzqtC2z8U6P7HIl/+EDMRd0ULICw1Q6pj
	FZ2imre2tpDnIxMF8LFhxW3nC0caC7AeXrK0p40EzY/dRm4YblAceHbFB3QlHCIqY2kKurDANN0eN
	bC7+/CydvjE10+uBfGaM05JYTA44lUbzwj5VkCGTQqZB23DDoVEWXJFmm2emXcP2KMqFF/BB7OVvr
	iqLNA4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UUD-0000000D8RK-3Tq3
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 06:04:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UUB-0000000D8QF-2BRK
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 06:04:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa3g0025438;
	Wed, 23 Oct 2024 06:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsiY7yt8JQwkr/CGYzfeuyrwP4Vfcc8zvfnje5HZERo=; b=Ngm3FG0tISNV7E8W
	QeYJG+gD9SATa0CZOpF5Z6+qs9/8b4/eImhv4fFdgVWAyEju0RA7g1sPw5NxsGoA
	I4FZff3X1PFlDm971la/64Ime9qT/2gWEb1R/Q9YHMEoGs4LcICAX38ocHy9/4ty
	HCpF80kLewszCbYx6lR9PeMvIAJyNIogxERFAupE7k+qtu9wflb/J+Orx/tP1Evi
	qXHKxGXFs6Rxgrrvt8by4hS/OjCQpWJYPVf2gQC66kMm4Etja6C2Yn7TZHS3ev6V
	qigx2wdFTtq0woiWDd7/mAKnrbC8im9aY5XsY+96HImCqnPejsQ1Xko+EeHd0OE5
	FiryRA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em4091ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N64iH3018169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:44 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:04:40 -0700
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
Subject: [RFC PATCH 6/6] arm64: dts: qcom: ipq9574: Add WiFi nodes for RDP433
Date: Wed, 23 Oct 2024 11:33:52 +0530
Message-ID: <20241023060352.605019-7-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9PUw3ig0SLfGvau46ldcCLW5RnzmvIWJ
X-Proofpoint-GUID: 9PUw3ig0SLfGvau46ldcCLW5RnzmvIWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=754
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_230447_695409_EF404517 
X-CRM114-Status: GOOD (  13.27  )
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
   |      | idx 0 |        | idx 1 |        | idx 2 |     |
   |      +-------+        +-------+        +-------+     |
   +------------------------------------------------------+

Based on the above, the WSI properties for QCN9274 at pcie2 are:
 qcom,wsi-group-id = 0
 qcom,wsi-index = 0
 qcom,wsi-num-devices = 3;

Hence, add WiFi nodes with WSI properties for all three QCN9274
devices connected to RDP433.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 62 ++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 165ebbb59511..2241e20ad42a 100644
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
@@ -27,6 +27,26 @@ &pcie1 {
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
+			status = "okay";
+
+			wsi {
+				qcom,wsi-group-id = <0>;
+				qcom,wsi-index = <2>;
+				qcom,wsi-num-devices = <3>;
+			};
+		};
+	};
 };
 
 &pcie2_phy {
@@ -40,6 +60,26 @@ &pcie2 {
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
+			status = "okay";
+
+			wsi {
+				qcom,wsi-group-id = <0>;
+				qcom,wsi-index = <0>;
+				qcom,wsi-num-devices = <3>;
+			};
+		};
+	};
 };
 
 &pcie3_phy {
@@ -53,6 +93,26 @@ &pcie3 {
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
+			status = "okay";
+
+			wsi {
+				qcom,wsi-group-id = <0>;
+				qcom,wsi-index = <1>;
+				qcom,wsi-num-devices = <3>;
+			};
+		};
+	};
 };
 
 &sdhc_1 {
-- 
2.34.1


