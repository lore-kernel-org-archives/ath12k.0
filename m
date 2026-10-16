Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6802CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=; b=QZhSqgFw8TJq0UuNVySffmJ7af
	SrYHZ/bQKp9q0bhSltUu9iAdREXwEUK7QQUbAdnj7z7eoFyZtQDyWfiqqzV656SeIOAzOpnK8xT9M
	VNNFPwNAGukMHSyuqKjUlfV2o4K3U1MNFUOY//kfOP0Fixr68bqTCuVEnGBjlMSi65aO8q4QSaaen
	aEhhYzKFMBeSKr0Oo3CAs4LLCq5ttRrrrcWVLcYZYGER+z3AWXfohqCugQziZiiT2mhOZfo8Afs8y
	8MN9FvsM9HnOjAtW6odIY4nwVBYq0xBfF7AipMQQzKci85/hGzU7u/6/toeRpJ2/XIQKU+gpF0R/n
	/Z76Pg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYW6-00000001pI4-2Ry3;
	Fri, 16 Oct 2026 03:21:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYW3-00000001pGf-28rl
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:21:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1kT8A3202390
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=; b=l7S/g4JRKtxzw3Lm
	tlwbaH9ymNwBtjn+TX5+OlzR+kStZ9BOWa1AoR6Tn/GcHljRRFRen3DE/k9Bl0Sc
	rjVk65HvowuGKy8HYJ3lwR47LrmYiBOk2sf2vYcaWnc6c/ZQjpo+7yg8qa9W+J0n
	dnN/3l9LZC3Y8wBXZCCjo7/PC10RNHIbu3oYO8M8109P8Svu3amCQz2TjPY9K7A9
	h1i6NJKQUMS10bLIL4DSrmxcnSKPFbP8MW4nanb8WRBYOtYulsE/pLxWEDLXcYE9
	x8J7XHz1aTy3YtJ7/KkZYQ1tOnCeS1oSL2pDFeuaAVTqLLHN8puvbS1LEuL5gKhI
	3U9s5g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39tx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:21:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so8210166eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120914; x=1792725714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=;
        b=QxVj6sb7lljjHIJvt84InOTbwCDomadQ7gtK/U4DoP2SCLxZm96FRoQTKIiWwnzcE4
         Pq/TZCxesD86wRaPw1I5Yv8VqerRLb3Q6QMVF7KWRWejvMaf827q7JcrvXTHyLZbRYPi
         5XkLEm5rG0puayKNwQEqyiM4NXWoxkX5XuNWRaSBVyHJNrK+AGuYbP+2R/2tjbiWFlpb
         b/tXFwK93GM1kgpbIiKVsYbHRjxh2r7ur4jOYQQLZ/21IuEJaH5AFbkhkFoe/TZG+2h5
         s1mm3JKR+JNXreGSytffO+Xa5SU7kR/hVups6AGgE/of01E4jVmG0SRWgJjCk0zElBqz
         dWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120914; x=1792725714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=;
        b=ojvbrs5/+UdnkvqURDIylmekVagGWvU6GnKJenGpkqs4lfDc7sDIr/03STLI93o9IB
         wGcvRfGtljfW+GHJRXoDhrWogDpCrPBFESK+dNLdTogKNVMWp9tSVQCA/mocHh+9FdM7
         4Rr2PEKXoYcxr1VQ9pv1SwgYlNfbeG4MJLMF/hdGnCbzCt2hzo58R8wGDRJmBfzHwHZq
         rmwJAgznYhvW1jZTivbY6H3fqi/2bMc2Ac1/Qe5sWbGCPisFxMasXH85UsU+Z6uBQNOi
         cPVBjQxAQkYKFnHrjJ0FO32ssFbhWlag2bCZ6iIpSwiS7LxeHt3iJKZdHJHsQtgC+RCF
         n9oA==
X-Forwarded-Encrypted: i=1; AKwUvBwB9n3ZdMlI8/ax8gg2NHD2iOQHz+GbuQ7jgiSh5wNnXvYtAFzSVbi3odrwAnlpgTptoAEhO50=@lists.infradead.org
X-Gm-Message-State: AFq9FYKHAyUpsz8kON/B22pOKzkafB6eTjOa6ilMCW+1qGn5dgIymE9m
	7GfZ0plghVTlyh4Dbcrw732OTSlSx4c1Ao+8F0sXaWRj+JPh+crYpO+WYi3rVDUluSb0iuhRgeH
	TdjMzQ/eiJQnlA7HFdoj345p0Zcr1/V/43it2mAmyqlhVBzyOu8mQeW35BhMn0FG7
X-Gm-Gg: AYBFou2u/arsW2K3C7pr+KL73ah0YHY+yOAQDfHNA28tm1jPH+GRVpEUwCS9dagsT9w
	fdKyHTAkscXXH4Rya6Br6BW0i9LdSSD5JELQih9QJThsG46dmT3L0G/WvHjnRdGEquwhZx7mEMe
	GAXQgQQe8Wg5Je3QJt0dyE9OuAkGXg24SXMibY8bO5jX/Nnzbc9wFBznI3LZEmqeQHKKyFTbaoL
	0t5jfGKLufoxhji1nG67mKr9FuRYU0vrNLomVT6EXDvMdBOX0KO7ZSntS6sENR62Dd2iRpqb/qv
	TYa5vVysAidfg3gHeOndGL89NnCAtt7VXoVavsXBVzpvBg/CpJ7xaP5aVfuQPdyIZT3IQKjv+wU
	cFhC9AKxXq+YjjqkFyexAF2SCEJCidsrLXt05kcDPCB6+s/kdEtyx1WaeUKkFFxuOSUQlTqfUi1
	VQVuYeXKcC/0/qfLD5UKQNlg==
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr29159193eec.23.1792120914180;
        Thu, 15 Oct 2026 20:21:54 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr29159167eec.23.1792120913628;
        Thu, 15 Oct 2026 20:21:53 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:21:53 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:38 +0530
Subject: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX+SPawj/rgTI6
 zdT0QAQPjiQTErRJlEiIrv3VqaedPCgm6PO7kJQSt+jxr5WvrIr8Oo9vxj0h7En8whJj9dxQCt3
 rLPdPAM2d2MUW0hYqRbaC9jyePmu4uTLpbENJrB1B/mEj/NhF8YLnEOqlqY1VCjboVUT2p+qhfD
 +7mCXfY5+HzbsruQQRaYDMFkTg9l04BuqObuo0QFJHDVO4xPOx72zx7Fsrq3zvHfAhrebfh8HJl
 4dhVwcS/hhAZr+vI2FYQ77NXvONW8yBOa9nda1fCop4AL6p5BQTsvX3lW045pDKeq4pkZGjX5Ia
 N/6T+OHLfyw/Ag/BRCKawo3/p1dqlmSnkfSTsqD0GavhqvhdHocaFBIPsEUScXS57MKoZuhA13x
 +io9rhBqkjT45ftQErOimSpWqG/ra1CfMtZ40E2iZWgmdtiTkRulV+/yiXkBpVFRBjeJ//PXgVG
 MP2iei4Az2kF7m7vBEA==
X-Proofpoint-GUID: Zjzks3yWAvyX2grtXKcp0GOCwpQTKCTO
X-Proofpoint-ORIG-GUID: Zjzks3yWAvyX2grtXKcp0GOCwpQTKCTO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxfSqgLedilh+
 dfIaa8INhIaP49Ul5VHiTxHBlblQ8EfUBAxpWl7TjBg2ZXHYPJdIDMr+tE48f9h0pPZ9qAV17Mw
 t6VAYl4S69QExACMQxOlEFZhwPXCuKg=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad19853 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202155_567995_F07D36C3 
X-CRM114-Status: GOOD (  16.80  )
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
index 000000000000..291d96aefc2f
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
+description:
+  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
+  associated with the WCSS Q6 subsystem. The device is represented
+  as a platform device and uses MSI interrupts for its Copy Engine
+  (CE) and Data Path (DP) rings.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcn6432
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
+        compatible = "qcom,qcn6432";
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


