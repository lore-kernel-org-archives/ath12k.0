Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3B60A382F
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mWZmEEKD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6Pg3Mau;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKGXjk+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=; b=mWZmEEKDWLyFYc
	V6f681R5YVF6u1eEU7LhEonfnNCXg6RnXfOPni7Oo/RhaXqXM0fUXcK5hwa295quRq68uvsLZl5Xg
	Bgw+HvPQ98Yk1jDFMpHua3hebydsE9mv4DLo2mJHshKsfVk8J4v/sJS/LviMXJ/sJAPy31sRAmqhl
	ensS3UYe/IPCUVL7xiJhW8mWTp8LyP/8f+bHw/AGQfKCCYqnjDGKSIUiAHDbJmASFm/CKqBKTS2OJ
	qRteFpPKT7NK52lAJKGQpcTq49PukqjsAxy17nP6MvZhVG9b8eRtBcROjrNzixAQblc7DEGWsVHPo
	Uf6mvggE5Kqu8SOp/cRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HP-0000000FfsY-0tU3;
	Fri, 23 Oct 2026 07:01:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HF-0000000FfoE-2PkP
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9lW1792135
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=; b=C6Pg3MauuJR9m3Rg
	nM7VfMaqEJnktOK9ECURmTXmZwy1qnTPK/9EPKAV1PD13LVVc/Phq8BW8a6P1z79
	1uqInJF79LacbA+H0OqSa1r2RlRE34e0ZYyUPNcvnE4cIBo/Rpmu4urJhiu+eHBV
	Uw2GQvx5DdasfZmtwgDWEOI53T1yOO5b/nE656qItGg45sfQsCu+JDIsRg8h0pnP
	qe00nF7XqO9EM1Q7LmpO2QAYnpoaJRYIKuFbb+rpD4Xf+iBLEvi+TbNXobD2hv5K
	74Bh78hlIxnofyin7/AUFPbRX1GzPBTGTR/PCrM/81eIFsRV18TSbC7rpVRasjHc
	j9bxpg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jwda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso1117347a91.1
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738879; x=1793343679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
        b=WRKGXjk+fivQ/n1TAUPoExNKla0bKD8xxyO+E90+BA783uqdfztLwgHx8pJk3pFrC6
         4Ss1cuYs0UEx8hHw/s35DcB/NNeAcNM6TlAyVZw0ZhFZs45XojN3omPTnrjT6ROOGyUM
         ls4NrfJlKxINFriJ35OzZQdqt5LPSQerPDfMBbzdGdnjdXDDXHS9uJFpuxkaAG2oXJ2d
         cwfeASbX43ecq4lenWYr/w9Hk/0rs0yR0qIUAS25+KgPfq2EG5EPTXDF6wlThsWPvbLf
         LUdT5rXz04wjbBay6hgZwrYEA152peXtooDkr0lTMAUuyr2RkehVK/cq/abOqFCrr4uq
         trhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738879; x=1793343679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
        b=r2wFE8Uwev+3KQOf+XrzFETj/d2AUeZGF2v8CpTyBamOk5vTpMz0ULyn9wQpEXs4aG
         uwJanfXeDq4KP9BBtb7jcrCfgO5Wtbq8TOU3nt4IY395GyhIPkR+sIcyJbTVmYUP33T7
         IyqXrjW9Lx+uFbwDvqfter2O2rEUOH8G5+5hSdI3sG+WFtLLMcNOJ7a352e/q8UG6HdC
         Jllr7DX3SGcZwZLsqkO7ZHPeD6iHAA4+3L5ouYmJJ49z7ZfG3w9WXtxdrC9eIpvtK6QL
         BtTqI2V9/y/SWHpO5tPIzNt7sQmVUWG/eY7bZYilSBQCwuQcVjpD+Ig/jya2v08ijAgz
         /Uvg==
X-Forwarded-Encrypted: i=1; AKwUvByNLRHVcBKbhRUF4ZG2I4cMVrkwbmtmeAuKHtgrlKUxE97zU8q9Z8At3OWgzcIXJCZPyZI2t/4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKPEE3lEQ+QRO09Dtyfw1KUbcUQWGyzbGd2XvuYeU+tAZ78aO16
	NF2nbDE+z8/kV6e4RbrMJCiVTwe+S5qdHC2/9mMXm9CyJ4zWUuBq1tDIL5JmaXO/7+GOjmK5CZP
	6YuvRByvL4LFMi6w9wx950pkFel3g7nDmNz7PfwDiCc4NTTjWzMkhHnIsQrDWCloX
X-Gm-Gg: AYBFou0TalRPZYZO17X5k+tB1s57c8c/qs2wW5cWJhEsdxp9kGytSPHM29fpRl3sAvQ
	c9xOynxv3Ak9CDiNlIRpMVXqTnKoH6JwE28Gth4WaiMILRGDSeVHba1hjmNRZgATztAsRWDIj/K
	HnEGuCo0ZMVq9Xn3lO4iHrFpg4G94A3IB0188Dnnk6XJvu6100Ty/gBBqpREWx0vcJMA4/Dt6iZ
	CuwU8CsbrWfcSK6Zu8Stb+UnKg4EI39p1Z6kR9NttABVQca/JTh1wdOiOnRs2xevmH6eOnILgLK
	CnoGaOuKs4dovjzsGqGtMg7EQFar2mTA70vqVZAKPDEyDxazi8Zqr/roOZRwgS9wZedY38KnnY0
	qmNkXTOGgEzYpE01Wtz46BHJS6iMZlrwI55YD4TuV30nDAVezCZco7LTfAGzMO67pQKpK1Tg643
	mKo1rnMhf/UM+fimKGvowDTw==
X-Received: by 2002:a17:90b:17c5:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3adce0cfd32mr1195277a91.63.1792738879039;
        Fri, 23 Oct 2026 00:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3adce0cfd32mr1195233a91.63.1792738878394;
        Fri, 23 Oct 2026 00:01:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:04 +0530
Subject: [PATCH ath-next v3 01/17] dt-bindings: net: wireless: Add QCN6432
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-1-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: S3hJGhbPzy14ziotPVG0JsiIrSONqFiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX0piI1e/Ufni6
 2DI7h3rWrsAxRXh71ddNmdrSxvXAbM1IxXR2hQTEzvlCHE2tnKodSBNagm8T5Y1uYdUfHXhF/cG
 L7/VsDPd3PVCafPXv4pOVf4iuOgqOJSCSCV0YkG8iGPpPfDPNWJLFZnyE6EkdEOTfZtI4mIMpGA
 OZXbbx3hfFq2e55+2GWlgvE4IfH/u4AhiUtt2A7uyxgjM1Kp4bAtRMmG+7CYokZRrigqHiNukBQ
 NHTDEbtHBfF5lo4g7VR2VWQjYdSBGBmqe1+gv1tBPEQQtWwXAM18Tmr1DW6MCCaFY1ppvYHRm4+
 mV6+oo+kUpLMtqv1+SLlgLfj2FAmVJjXWQGmyCnSYninb9lID+lz66f3LsoCCKSg5IHgya+jFY1
 twOfwoKMPBqZO0UACH1sU2wgcqa8U9mL6DN1PYD+FlrPyi2Qx/E3zjYaHzs1avVutZov3AkyvVo
 VA8yM05tIPJto/mHAYw==
X-Proofpoint-GUID: S3hJGhbPzy14ziotPVG0JsiIrSONqFiA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3HypkggwaKhR
 vhMxEPDz1FIWgun070PmZQB4kn7PiT/IGFvu3+iPgnU1ooVY0V4tZZqQQcledi2geuQaSY/4/L/
 0o1bWtYp/nmE+FVT+xO/yspgR6E/vjI=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb0640 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000121_778646_D69FD2EF 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
wireless device.

QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
platform device, even though the Wi-Fi hardware interfaces over PCIe.
Document the compatible string and the resources, including the Q6 remote
processor phandle, MSI interrupts, SMEM states and memory regions.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
new file mode 100644
index 000000000000..96e164620574
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432.yaml#
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


