Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DFCC52D7F
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKavBaDcPj7JhkM+a18blQtPcZ2QvjLpQO08eGh6CRo=; b=GAIx1RBJzLGZ2DoO3MUPeEwoLU
	aySvqtojV4I3GrQ640Kbhb8z7FrmsYMrVws/6XDeNQ6B9FPP33tfLjMP0WJsXp1oh5v2wWOoopteS
	vs1LUokMNmrxbhRbBD19IUNAOd4DKhw+/FDb2738jm/s1vl9VSsabBjNiyUEidvfIFxy/U04ZzD5q
	iZdziHI+2aWHhxBQFTfbbNlpUshs5p2u0p+0A89vBOXlHo0ZNfcui7VRwjPQ7E64t90YTDs5BZVOO
	+83HKYb3g2sZaHAZrX8KQktlFCxD2Zpf0PXB8lG2qMqhIQeOAo4hvcZOqfCmoNgbFfGjnPN2IRwUM
	35uhx36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYO-00000006RTk-1rdi
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 09:44:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYL-00000006RSP-0oO8
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 09:44:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNAS8R009039;
	Wed, 14 Aug 2024 09:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TKavBaDcPj7JhkM+a18blQtPcZ2QvjLpQO08eGh6CRo=; b=g244kx51RpyiAKur
	Uj8coiPb4l0GmtzyfgYEqY4FnnCyqPxNPFf9E0ScLHIArn5UqDV0KPlmerTnIRHV
	hPm7pOsJ/lP3dbT3n1uAUs+Li9zFG7LeBydYPaWPOgg4iwv8YOhWvRglY8mEBX+J
	+XntSwpref4FBpWVEQ9yJJIYMWwgTQwiLty9u6BAilnMcYX/nUYoGQJfiynGg444
	FrbqxwcySc+gil/8QhpYUTlF/q6rLonutq1g9FbpHacMgmiinR8QnladC7xZzMCM
	YGo6lmybnijiePnstqXa/TklseN1EOblACN2s8wrG17zeZr5bZ3jKTB87Qv75k6H
	G3/guw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4108bc2vrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E9iMbJ010332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:22 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 02:44:21 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH 02/18] arm64: dts: qcom: add wifi node for IPQ5332 based RDP441
Date: Wed, 14 Aug 2024 15:13:07 +0530
Message-ID: <20240814094323.3927603-3-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
References: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DLWwpEPricXFNP3GPuGRxM-hwIiP16rQ
X-Proofpoint-GUID: DLWwpEPricXFNP3GPuGRxM-hwIiP16rQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=1 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_024425_608805_CEB4EB93 
X-CRM114-Status: GOOD (  15.35  )
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

RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
device.

Describe and add WiFi node for RDP441. Also, reserve the memory
required by IPQ5332 firmware.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts |  56 ++++++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 131 +++++++++++++++++++-
 2 files changed, 184 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
index 9aaa3d802178..0168d3a11416 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 AP-MI01.2 board device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 /dts-v1/;
@@ -12,6 +12,51 @@
 / {
 	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.2";
 	compatible = "qcom,ipq5332-ap-mi01.2", "qcom,ipq5332";
+
+	/*                 Default Profile
+	 * +============+==============+=====================+
+	 * |            |              |                     |
+	 * | Region     | Start Offset |       Size          |
+	 * |            |              |                     |
+	 * +------------+--------------+---------------------+
+	 * |            |              |                     |
+	 * |            |              |                     |
+	 * |            |              |                     |
+	 * | WLAN Q6    |  0x4A900000  |       35MB          |
+	 * |            |              |                     |
+	 * |            |              |                     |
+	 * +------------+--------------+---------------------+
+	 * | M3 Dump    |  0x4CC00000  |       1MB           |
+	 * +============+==============+=====================+
+	 * |                                                 |
+	 * |                                                 |
+	 * |                                                 |
+	 * |            Rest of memory for Linux             |
+	 * |                                                 |
+	 * |                                                 |
+	 * |                                                 |
+	 * +=================================================+
+	 */
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		q6_region: wcnss@4a900000 {
+			no-map;
+			reg = <0x0 0x4a900000 0x0 0x02300000>;
+		};
+
+		m3_dump: m3_dump@4cc00000 {
+			no-map;
+			reg = <0x0 0x4CC00000 0x0 0x100000>;
+		};
+
+		/* mlo_global_mem0: The MLO global memory is not
+		 * enabled yet.
+		 */
+	};
 };
 
 &blsp1_i2c1 {
@@ -22,7 +67,7 @@ &blsp1_i2c1 {
 };
 
 &q6v5_wcss {
-	pd-1 {
+	q6_wcss_pd1: pd-1 {
 		firmware-name = "ath11k/IPQ5332/hw1.0/q6_fw1.mdt";
 		interrupts-extended = <&wcss_smp2p_in 8 IRQ_TYPE_NONE>,
 				      <&wcss_smp2p_in 9 IRQ_TYPE_NONE>,
@@ -42,6 +87,13 @@ pd-1 {
 	};
 };
 
+&wifi0 {
+	memory-region = <&q6_region>;
+	qcom,board_id = <0x12>;
+	qcom,rproc = <&q6_wcss_pd1>;
+	status = "okay";
+};
+
 &sdhc {
 	bus-width = <4>;
 	max-frequency = <192000000>;
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 1c4e5e0104ca..eb9a1ce7e2e2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -511,6 +511,135 @@ glink-edge {
 				mboxes = <&apcs_glb 8>;
 			};
 		};
+
+		wifi0: wifi@c0000000 {
+			compatible = "qcom,ipq5332-wifi";
+			reg = <0xc000000 0x1000000>;
+			clocks = <&gcc GCC_XO_CLK>,
+				<&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "gcc_xo_clk",
+				"gcc_im_sleep_clk";
+			interrupts = <GIC_SPI 559 IRQ_TYPE_EDGE_RISING>, // misc-pulse1
+				<GIC_SPI 560 IRQ_TYPE_EDGE_RISING>, // misc-latch
+				<GIC_SPI 561 IRQ_TYPE_EDGE_RISING>, // sw-exception
+				<GIC_SPI 422 IRQ_TYPE_EDGE_RISING>, // ce0
+				<GIC_SPI 423 IRQ_TYPE_EDGE_RISING>, // ce1
+				<GIC_SPI 424 IRQ_TYPE_EDGE_RISING>, // ce2
+				<GIC_SPI 425 IRQ_TYPE_EDGE_RISING>, // ce3
+				<GIC_SPI 426 IRQ_TYPE_EDGE_RISING>, // ce4
+				<GIC_SPI 427 IRQ_TYPE_EDGE_RISING>, // ce5
+				<GIC_SPI 428 IRQ_TYPE_EDGE_RISING>, // ce6
+				<GIC_SPI 429 IRQ_TYPE_EDGE_RISING>, // ce7
+				<GIC_SPI 430 IRQ_TYPE_EDGE_RISING>, // ce8
+				<GIC_SPI 431 IRQ_TYPE_EDGE_RISING>, // ce9
+				<GIC_SPI 432 IRQ_TYPE_EDGE_RISING>, // ce10
+				<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>, // ce11
+				<GIC_SPI 491 IRQ_TYPE_EDGE_RISING>, // host2wbm-desc-feed
+				<GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				// host2reo-re-injection
+				<GIC_SPI 493 IRQ_TYPE_EDGE_RISING>, // host2reo-command
+				<GIC_SPI 544 IRQ_TYPE_EDGE_RISING>,
+				// host2rxdma-monitor-ring1
+				<GIC_SPI 457 IRQ_TYPE_EDGE_RISING>, // reo2ost-exception
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				// wbm2host-rx-release
+				<GIC_SPI 497 IRQ_TYPE_EDGE_RISING>, // reo2host-status
+				<GIC_SPI 454 IRQ_TYPE_EDGE_RISING>,
+				// reo2host-destination-ring4
+				<GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
+				// reo2host-destination-ring3
+				<GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
+				// reo2host-destination-ring2
+				<GIC_SPI 451 IRQ_TYPE_EDGE_RISING>,
+				// reo2host-destination-ring1
+				<GIC_SPI 488 IRQ_TYPE_EDGE_RISING>,
+				// rxdma2host-monitor-destination-mac3
+				<GIC_SPI 488 IRQ_TYPE_EDGE_RISING>,
+				// rxdma2host-monitor-destination-mac2
+				<GIC_SPI 484 IRQ_TYPE_EDGE_RISING>,
+				// rxdma2host-monitor-destination-mac1
+				<GIC_SPI 554 IRQ_TYPE_EDGE_RISING>,
+				// host2rxdma-host-buf-ring-mac3
+				<GIC_SPI 554 IRQ_TYPE_EDGE_RISING>,
+				// host2rxdma-host-buf-ring-mac2
+				<GIC_SPI 549 IRQ_TYPE_EDGE_RISING>,
+				// host2rxdma-host-buf-ring-mac1
+				<GIC_SPI 507 IRQ_TYPE_EDGE_RISING>,
+				// host2tcl-input-ring4
+				<GIC_SPI 500 IRQ_TYPE_EDGE_RISING>,
+				// host2tcl-input-ring3
+				<GIC_SPI 499 IRQ_TYPE_EDGE_RISING>,
+				// host2tcl-input-ring2
+				<GIC_SPI 498 IRQ_TYPE_EDGE_RISING>,
+				// host2tcl-input-ring1
+				<GIC_SPI 450 IRQ_TYPE_EDGE_RISING>,
+				// wbm2host-tx-completions-ring4
+				<GIC_SPI 449 IRQ_TYPE_EDGE_RISING>,
+				// wbm2host-tx-completions-ring3
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				// wbm2host-tx-completions-ring2
+				<GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
+				// wbm2host-tx-completions-ring1
+				<GIC_SPI 543 IRQ_TYPE_EDGE_RISING>,
+				// host2tx-monitor-ring1
+				<GIC_SPI 486 IRQ_TYPE_EDGE_RISING>,
+				// txmon2host-monitor-destination-mac3
+				<GIC_SPI 486 IRQ_TYPE_EDGE_RISING>,
+				// txmon2host-monitor-destination-mac2
+				<GIC_SPI 482 IRQ_TYPE_EDGE_RISING>,
+				// txmon2host-monitor-destination-mac1
+				<GIC_SPI 419 IRQ_TYPE_EDGE_RISING>; // umac_reset
+
+			interrupt-names = "misc-pulse1",
+				"misc-latch",
+				"sw-exception",
+				"ce0",
+				"ce1",
+				"ce2",
+				"ce3",
+				"ce4",
+				"ce5",
+				"ce6",
+				"ce7",
+				"ce8",
+				"ce9",
+				"ce10",
+				"ce11",
+				"host2wbm-desc-feed",
+				"host2reo-re-injection",
+				"host2reo-command",
+				"host2rxdma-monitor-ring1",
+				"reo2ost-exception",
+				"wbm2host-rx-release",
+				"reo2host-status",
+				"reo2host-destination-ring4",
+				"reo2host-destination-ring3",
+				"reo2host-destination-ring2",
+				"reo2host-destination-ring1",
+				"rxdma2host-monitor-destination-mac3",
+				"rxdma2host-monitor-destination-mac2",
+				"rxdma2host-monitor-destination-mac1",
+				"host2rxdma-host-buf-ring-mac3",
+				"host2rxdma-host-buf-ring-mac2",
+				"host2rxdma-host-buf-ring-mac1",
+				"host2tcl-input-ring4",
+				"host2tcl-input-ring3",
+				"host2tcl-input-ring2",
+				"host2tcl-input-ring1",
+				"wbm2host-tx-completions-ring4",
+				"wbm2host-tx-completions-ring3",
+				"wbm2host-tx-completions-ring2",
+				"wbm2host-tx-completions-ring1",
+				"host2tx-monitor-ring1",
+				"txmon2host-monitor-destination-mac3",
+				"txmon2host-monitor-destination-mac2",
+				"txmon2host-monitor-destination-mac1",
+				"umac_reset";
+
+			qcom,bdf-addr = <0x4B500000>;
+			status = "disabled";
+		};
+
 	};
 
 	timer {
-- 
2.34.1


