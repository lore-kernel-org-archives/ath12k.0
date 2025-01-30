Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8D4C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 05:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUezyGs2RdjGHsOnD/58OC7wQng7WD1B+BzO1yxfB0E=; b=b03PgGfTeSYI8rs+BReLuBBXj6
	+CybqQa+XYAJx7N4IDlOae7XU7CJLZ5UxEWcNYZnclRPeCBIh5Fcw3CDe8njFqrw1UVrL893COBBD
	Si9aSDvpCrANGuqNnOEYmPBt0KOXs8O0ObBpp9NVBnoTXprizc/For45Apg3gLK5Fgm8+lywcbhDp
	6Fwh0POhbnemlenFddZsQahtRd9WzSQIAKJY+53htD+hbdMKY5g3xBHDvsK8lL5AoOSTg0pG5e7x2
	1tQ9Zjug6xfaikGMrj5LjKbj0CTHRsnIX2TkbDmYuZ7qMCK2KgOSS0zHvjWGzn6yiy1m1cZeHHebe
	OS+4+kUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMxq-00000008Es5-0lC5
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 05:19:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdMxn-00000008Eqt-1T9t
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 05:19:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TMki2X012279;
	Thu, 30 Jan 2025 05:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUezyGs2RdjGHsOnD/58OC7wQng7WD1B+BzO1yxfB0E=; b=lzaSlCz1BYbxJRn/
	4PyeP6AM/MC7vzW+HvvqROHGGYNGuum+/JA1jmanIhCTB/HA1fWF76jjNOEaCVbr
	ZDlAv8GPUBotplUBB0l2GVH9heTplxIhf3hvDDG+CfJvYRfOlhE5B37lTPP7sQbG
	nnN0UH+ziRECwmqsaNJ/XibHPDaZq/sJC/5bMZVK6qUXIpIbANMF8g9Dhkzvq0iz
	jc9j746oSipsr0FiHv3hePRAD8WToTHeBhNwyAVdvg114GU7Ky0nrG/DSGatdqkb
	u8tC46UNQuv+uRcx9qJ3LY8lzTnjTEq2jDsvtvZWuz+3Ogha2d2HQG3u/ViqucCZ
	W3lYkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fwe28jn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 05:19:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50U5JZxh019373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 05:19:35 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 Jan 2025 21:19:31 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Raj Kumar
 Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH 1/5] dt-bindings: net: wireless: describe the ath12k wifi device IPQ5424
Date: Thu, 30 Jan 2025 10:48:34 +0530
Message-ID: <20250130051838.1924079-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
References: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kGZxBXSwX__DbgiYGtOfsRZH4Kz86cmH
X-Proofpoint-GUID: kGZxBXSwX__DbgiYGtOfsRZH4Kz86cmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_211939_506863_BFB2F49B 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Describe and add the device-tree bindings for the ATH12K AHB wifi device
IPQ5424.

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 .../net/wireless/qcom,ath12k-ahb.yaml         | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
index bd953a028dc3..1d24389a0ab3 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1
@@ -317,3 +318,121 @@ examples:
                                 "stop",
                                 "spawn";
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    wifi1: wifi@c000000 {
+        compatible = "qcom,ipq5424-wifi";
+        reg = <0x0c000000 0x1000000>;
+        clocks = <&gcc GCC_XO_CLK_SRC>;
+        clock-names = "xo";
+        interrupts-extended = <&wcss_smp2p_in 8 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 9 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 12 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 11 IRQ_TYPE_NONE>,
+                              <&intc GIC_SPI 559 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 560 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 561 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 519 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 520 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 521 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 522 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 523 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 526 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 527 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 528 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 529 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 574 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 576 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 627 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 540 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 549 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 580 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 537 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 536 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 535 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 534 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 571 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 571 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 567 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 637 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 637 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 632 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 590 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 583 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 582 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 581 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 533 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 532 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 531 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 530 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 626 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 569 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 569 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 502 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "fatal",
+                          "ready",
+                          "spawn",
+                          "stop-ack",
+                          "misc-pulse1",
+                          "misc-latch",
+                          "sw-exception",
+                          "ce0",
+                          "ce1",
+                          "ce2",
+                          "ce3",
+                          "ce4",
+                          "ce5",
+                          "ce6",
+                          "ce7",
+                          "ce8",
+                          "ce9",
+                          "ce10",
+                          "ce11",
+                          "host2wbm-desc-feed",
+                          "host2reo-re-injection",
+                          "host2reo-command",
+                          "host2rxdma-monitor-ring1",
+                          "reo2ost-exception",
+                          "wbm2host-rx-release",
+                          "reo2host-status",
+                          "reo2host-destination-ring4",
+                          "reo2host-destination-ring3",
+                          "reo2host-destination-ring2",
+                          "reo2host-destination-ring1",
+                          "rxdma2host-monitor-destination-mac3",
+                          "rxdma2host-monitor-destination-mac2",
+                          "rxdma2host-monitor-destination-mac1",
+                          "host2rxdma-host-buf-ring-mac3",
+                          "host2rxdma-host-buf-ring-mac2",
+                          "host2rxdma-host-buf-ring-mac1",
+                          "host2tcl-input-ring4",
+                          "host2tcl-input-ring3",
+                          "host2tcl-input-ring2",
+                          "host2tcl-input-ring1",
+                          "wbm2host-tx-completions-ring4",
+                          "wbm2host-tx-completions-ring3",
+                          "wbm2host-tx-completions-ring2",
+                          "wbm2host-tx-completions-ring1",
+                          "host2tx-monitor-ring1",
+                          "txmon2host-monitor-destination-mac3",
+                          "txmon2host-monitor-destination-mac2",
+                          "txmon2host-monitor-destination-mac1",
+                          "umac-reset";
+
+        memory-region = <&q6_region>, <&m3_dump>, <&q6_caldb>, <&mlo_mem>;
+        memory-region-names = "q6-region", "m3-dump", "q6-caldb", "mlo-global-mem";
+        qcom,ath12k-calibration-variant = "RDP466_1";
+        qcom,rproc = <&q6v5_wcss>;
+        qcom,smem-states = <&wcss_smp2p_out 8>,
+                           <&wcss_smp2p_out 9>,
+                           <&wcss_smp2p_out 10>;
+        qcom,smem-state-names = "shutdown",
+                                "stop",
+                                "spawn";
+    };
-- 
2.34.1


