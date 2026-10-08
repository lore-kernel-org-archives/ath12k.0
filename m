Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4B8CA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=; b=g7iJ2gQok+lZx8h1dNMNo6RfCJ
	9xs0k3ooVRJ0AafDSQqvZ5zqsrTE9aYjjoC9ztteiYJWeur46YSdPC7z+x1ntf99L6mHEz9+GmUZU
	si3FEt2uJmeK+Wmk2ttGRcXTjhy7fSKGZps7eCakbEn+luqRuiFRVgVXE5bgYmyPuV4OTNhRPYkpR
	pL213dc/04NwHqpAOwW0dJ1qTzgBQprsGPFaT6YYUOQ2MJrGW2NjXjsc4A3nIh0iPxyy4fTwG4xas
	jmxUeOVs8pJqpAU1FSBVKp5o40ze8gcB/ZEKLf5XV+zDL+wYMYVUCkbHdnVK3sXjBvF7mXvazrn5J
	/zPw1b9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIN-0000000463l-0WQR;
	Thu, 08 Oct 2026 10:24:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIK-0000000462F-0LKr
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KNRM2167091
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=; b=D4pWKd4DhTVWbkI8
	XFp8wqHxyydiz/+/+f22nCxW/R+IOQA/+lQXYmWI4mKTBiGifCGwmb2kOwEqsIF2
	wC3mZgX1Ve5Dr7StMqsI0Fc/5LTDPj/rZHWfLbh/wXBFRa2SifGwrS4ktnEkB/F4
	zP/4tIw0UFKsnzdSQhVRmOdIoszUaisCeSNX05XuTjrX2rFk3S8gmgBUd7dNC0An
	HoqCzi+ljOfX91sUzbSpQTiQ7Cz7AcS5CuSUiijYs8fDioUWQwoMoWrfTBWsvEAl
	LS642/pZbKmutfRfCgKoLmLYn1TFHkDWUkogvUbGZ4RDixNHqB4XEvdHs/gpmc7z
	+B8gXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tj1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so67797365ad.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455050; x=1792059850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=;
        b=BqHsix0uHBmcmotxI+dbh+JZE6bUatMvs1A/A/8x+YTvdfhxcz0qmu0AL6NiGmchM1
         Q9HmyCplfRyBnJ5c2qvslgMDpvAXEhuTxH/xVcui2Uu8Xc9JnBSFlttP5L5gDO+Ee7+y
         oe5pAA2H7Z2agxwhApuFhQj1oATqWVQawtOhmWGqphKqWTaWTK3ORmajre/pzqLFaH1w
         KoDgmbGuRQZ2r+2+MAbISOf76QJ9McsHdpL0O7057ja9fNxVdcFt/L625Wapcmj5TbuE
         N6XNsiY4qOK4BdVkRsvvJFNIYfHFFishxU6qXxQsrLxtZ6VbR7CVSpzJbDYLKWxhQqvw
         2HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455050; x=1792059850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=;
        b=eLs+tIh1+R8Kz3H6hCTfupMSd4h2VX7SAEwPW5Xk0G/bPhFxWnS4fMKmZON04pCL8s
         5Dr3OCvJpo42ubh9WFTqdC9+kcauq/SzEx7sUuKDI5awrGQGdqJUPOuJujffo8Xwy63N
         w6N6EBj4hnOB4ei8HfSkTyUw7lkXiA5a2jNDZH2WSRvO9PuTP7b+bhiVYiB7mUyKkNIq
         F7tJQrRw/vcMGPp/CYnXtkcODC8a+JQjg8L07iBqZSFSEfV1NS9m863wsc5hd1t2qFs7
         EaHoZ04NBmx7tRu3r6gAS9rl2eDgQYldO0bpn5j4wOOC4mJ6QvLiTbECKB8kaICNtjJw
         SFRg==
X-Forwarded-Encrypted: i=1; AKwUvBx7iIZ3qSLV8bR2hzg3jyWVop6+MtvLbDF5M+Ocg9S6EQ9ezB0oGEKHTTRrYC7PdOltafU/95g=@lists.infradead.org
X-Gm-Message-State: AFq9FYJdwFlpDNIK3eO/eGDOPRIlS0roqx/Y1HSOmB6yDzCujQnaqpWa
	GBeeNlYK4+EvRmEKjK1gsoKHqUVZBl2QE/RgknKhzjjEnWtm5F140TzYwPkpWV3XK9YwjxUsdZ0
	QTZin2JGFvy7QeJKPbjngaCut3FQM0Rz2CRQwr/d/LxAstcnD9Vvf1xPRxK14qIB0dZ5QyZbT
X-Gm-Gg: AYBFou14BhBmqGzO9I1IeLdc+J5UJQRBWZmRO6XkZ9dE7ycv2w389/jSWKhgW+9S5v1
	4aEmnsn78RzdyU5vySZ7WL4Pu/uCa3PomfNkm73bLt5aoXz7zUdiA+6iC/0NfCyizDfpOkHhjW/
	uztjKignTK/ODF82pdK2uWOHiUhqlBkN8EZDVlSFLl141lBKifikp/gEyFA5TEqfZPfe8hH8f6O
	G5A76CsBo2/QU/XOxA3KjokVAtBsaNxC9L8gxCfMeYFE4EwxqGw4tbSU/M4XPaO/S3OKAx9aV40
	pE4NRH9vY1VD36bH/LRQRyuJ0tSXCCf9Kd7SAyqjQENHo0YLly0JbpI2ibvPfNfJE0ALLVH8Ne3
	vZQD8nhXSTWglubUVpHZopL7zL46Rqjls6Ne3USeLZ81FaCSkQDwgoi+sYq/xLAhi5RhQ6ZQfP5
	Iv9jjgUWWO1rmLHiuzLrpfrw==
X-Received: by 2002:a17:903:4b2f:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2e5ffc3bca4mr44992335ad.19.1791455049554;
        Thu, 08 Oct 2026 03:24:09 -0700 (PDT)
X-Received: by 2002:a17:903:4b2f:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2e5ffc3bca4mr44992085ad.19.1791455049031;
        Thu, 08 Oct 2026 03:24:09 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:08 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:53:57 +0530
Subject: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76f4a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 2BwmZRUrbBO7cJLzUlDzpfQkFmruTHUX
X-Proofpoint-ORIG-GUID: 2BwmZRUrbBO7cJLzUlDzpfQkFmruTHUX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX1n+HfzlRkO0q
 rAN0J2W1HaVkUh71Rho/aDXq6HlIIxM94ZiSP0Bpseq43bWizbju3yQs/dQ2gbyJgJ4vG8JmdBu
 /agPtbmwaJkpI42C/6XTYYjpWWFWhu4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXwtj6YaC5AIXI
 DG/3Z0knR7eBBv1X6mL0IZGooBdeT6WuKjapLHZvuJ/8+XBZX8+9/0m/eYU1aE6Ko+5oNncycMm
 CNX4Erz1BmdxijUXzK4kHqkWuK1nw25M7mouhtxW8oISE6wr3UmQw+XtSkh3/3mX5eFq2Yqw4iM
 eOShaxj3itMeApM4ncaRSWNjldWpOkd6uqSanwHkvTf/MzhPmrSyGN3IPWLaxoAfOkPysq6dvep
 AgBo3GyK2vmqREtblUL1e2RacgURhw/+ZA/4wn9co2NMLHeN/XMWSx8Lf0WOj9w/AsZ8VvQbX7k
 yPdRgRg4ta1yl6CqOyytHJDchv8K8PueE3opQik4lRR5axJGYq8twVrjJMdWBusHM9oG5nWI2ut
 yHKOP5gx3syZeMn0azpUZ5cS53jJBZnZs9enFLeFFqu1UX3cqYX/ttFsL6qzzKr9H83ZuFz2eJ4
 T1R2BnF693KSbHqf1pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_032412_266293_C25081CB 
X-CRM114-Status: GOOD (  16.35  )
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

Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
wireless device.

QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
platform device, even though the Wi-Fi hardware interfaces over PCIe.
Document the compatible string and the resources, including the Q6 remote
processor phandle, MSI interrupts, SMEM states and memory regions.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
new file mode 100644
index 000000000000..97d8885333fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies QCN6432 wireless device
+
+maintainers:
+  - Jeff Johnson <jjohnson@kernel.org>
+
+description: |
+  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
+  associated with the WCSS Q6 subsystem. The device is represented
+  as a platform device and uses MSI interrupts for its Copy Engine
+  (CE) and Data Path (DP) rings.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcn6432-wifi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Spawn acknowledge interrupt
+      - description: Stop acknowledge interrupt
+      - description: UMAC reset interrupt
+
+  interrupt-names:
+    items:
+      - const: fatal
+      - const: ready
+      - const: spawn
+      - const: stop-ack
+      - const: umac-reset
+
+  memory-region:
+    items:
+      - description: Q6 memory region
+      - description: Combined firmware data memory region
+      - description: Multi Link Operation (MLO) Global memory region
+
+  memory-region-names:
+    items:
+      - const: q6-region
+      - const: data-region
+      - const: mlo-global-mem
+
+  msi-parent:
+    description: Phandle to the MSI controller.
+    maxItems: 1
+
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
+  qcom,rproc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Qualcomm Hexagon DSP (Q6 remote processor), which is
+      utilized for offloading Wi-Fi processing tasks. This Q6 remote processor
+      operates in conjunction with Wi-Fi.
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Shutdown WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+      - description: Stop WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+      - description: Spawn WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: shutdown
+      - const: stop
+      - const: spawn
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - memory-region
+  - memory-region-names
+  - msi-parent
+  - qcom,rproc
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    wifi@21e00000 {
+        compatible = "qcom,qcn6432-wifi";
+        reg = <0x21e00000 0x200000>;
+        interrupts-extended = <&smp2p_wcss_in 16 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 17 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 20 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 19 IRQ_TYPE_NONE>,
+                              <&intc GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "fatal",
+                          "ready",
+                          "spawn",
+                          "stop-ack",
+                          "umac-reset";
+        memory-region = <&q6_region>, <&data_region>, <&mlo_mem>;
+        memory-region-names = "q6-region", "data-region", "mlo-global-mem";
+        msi-parent = <&v2m0>;
+        qcom,calibration-variant = "RDP442_1";
+        qcom,rproc = <&q6v5_wcss>;
+        qcom,smem-states = <&smp2p_wcss_out 16>,
+                           <&smp2p_wcss_out 17>,
+                           <&smp2p_wcss_out 18>;
+        qcom,smem-state-names = "shutdown",
+                                "stop",
+                                "spawn";
+    };

-- 
2.34.1


