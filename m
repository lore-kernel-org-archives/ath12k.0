Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84CEC25B7C
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/rfODploHDKXzqF5uZDj5HypMDi8GHx8C3gU75cfUM=; b=CvDlEknbZ+mPSCwUT+1GlxOP4a
	y7LlJj8HYmLBrsSyukeu8EQnP/OIefj9SVnRCJa2wZteaRuOFnm34hMh4jtLm59qgN83c9jj/32+0
	BtFbGH3mtm7X5kdTsOGL/6z74ffDNdS+BM4hY08p2lFoa2sWqYwzfu8vvSPQDWrk/suE7fbVIDFZv
	H0tRDrWm3p03fM1tgmFZMFh4bpn4DExbGT8GhvjpOUJq2luLWbQFZtF22TO2LCda0WaPrkfHLuIJ1
	0HE/aCUHoOxoNpZdoVOLmI62ZsYHqm1khZCEAiWwrLHndQNqNc8AVKXXabD/rA1iJwnsPGiKwU1Mc
	bIvAKSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC275-00000001jjE-1nZB
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:03:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC26y-00000001jc0-08dC
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:03:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-420180b58c5so10130965e9.3
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923029; x=1717527829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/rfODploHDKXzqF5uZDj5HypMDi8GHx8C3gU75cfUM=;
        b=Po64SRsl+ibzB42UZY1GsuUu/7CxIiAY+IiVrUIYIIAkcSdfnq9Q7csA+zuuYxvB0j
         R1qB6OHkHBmse+3eDcril8ewK643+LB+ECUeAOWCo6SlzjGwpoeLOIYVQN+G+lBa7jkI
         7qY9z8fLrrTSGFP+Y5woIBlXvViVV+mqMZnBcbdF/KO+KlEKvRm5lgijP1WovJOXoBJe
         4kkSK3jTH16fLkxcIbt7tzC7L5UplSIjo2dQdRG0jlmY2on5QpPUh/6XDjJuEo4JavbV
         p2Fp26pbprm9S87Lckxf/+5Ve9+0eTniGuIIdQc0ZN5/4tPWqcY82tyJcXmoVI1wfxD4
         wVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923029; x=1717527829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/rfODploHDKXzqF5uZDj5HypMDi8GHx8C3gU75cfUM=;
        b=nhl8bS8Q1NiNfnxOFiQ4o2aDUgHBNCYjo601Cxg2SLe3BRLP5cq5cw2hsSssUGeJDM
         Sh9r1D1QuglGT6tH9DL3ludrmQkHFTwNCa9DhHe2T8AS9h5u1QXbPFO6/Bmds5X/weGy
         bWnMlNkUqXAKp74Kari9t5uqocKzNlkKNNRrYSYxnE1kR2nSSA7bVv8ghDkQ/ks/F4Wf
         8GKfpz9nP96f5BcSUnB3cdsFOSTGza1DJUQmd8pTDgBwM1qsCo7S0iy0/Vx4oM7rZp8t
         TkzViu/I0QneLmaXWBQXVHeA8mfs+jFVHm5n0C++sQ5ohqYVUAQsuVKx/e5Btd8EkZ5P
         0J/w==
X-Forwarded-Encrypted: i=1; AJvYcCXkcxnfehJ+sy52ixzm8jyqudqBnIWCrhwPUdGsbbDIvkQUmvMdtMNNkeNuKPfxV12QGW1uRnz+ZX9dY5Pix4Dh3OVOjjf+sqgxjg==
X-Gm-Message-State: AOJu0YxdS95ksMbS4FO58Z9edtF/04KVF+nUphl7Y4gYLIMTEMrAm33z
	XsN0f3ExQ50UlVoRiH8IO1GdrONknELeiebchiBgJRiMOVCVUt+9MlEPlPQlmuk=
X-Google-Smtp-Source: AGHT+IEZz3DaP8vDUiO7UYMRhD5/zIn2+KNYNHhCT2WPx1urmnhscLCNQt/r21FNScSTSxiCZ5ikxw==
X-Received: by 2002:a05:600c:224e:b0:420:fb99:ed02 with SMTP id 5b1f17b1804b1-421089b2283mr120556495e9.6.1716923028845;
        Tue, 28 May 2024 12:03:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:03:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:09 +0200
Subject: [PATCH v8 01/17] regulator: dt-bindings: describe the PMU module
 of the QCA6390 package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-1-d354d52b763c@linaro.org>
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5018;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Qkeb9YORIDfkvwkp+GlKEgMos9lOvfcfa7/lVVyOAJo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqMCQ/7vIZDzBIYID6EF7Nm5cHxYRr8KSj2h
 LnquCFgGt+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjAAKCRARpy6gFHHX
 cihkD/0SSyWXBlx16ygZBVfA5mClNZjjlHCSb0a0oKurV28LhpE8Ywi7P/dafyU5VNjvLPsTGzW
 VzdDWjnAljTr21lVO2sU7RjDsL20cya9kwiFh9bWd8SKR3n9Wf9ZAkQQ2B3mEYrQB4HF8Jta66D
 orpfmCzzOusEyyX+NGHq+Bxwm0md4ba7VNzouizzBCZ1D9JIjQsXURxxKh99R/Mivhusckdlx9j
 sdsWzoHFCbb3rCRp2Jl9n9p5U0g5lN/cnoGZ0rVA8Jdz4/CY1Est956oKIYiIAV8Rp6Vv6a+UmT
 uw+oBs1iLjxTog/r4er2YKzTknHe/xlWf4/FCdAVac1Yno7ApdLLXtxP0YoCR89XeHC2VzErg2X
 ICz7ZGhPdo+47loMVwrA2XhI2GEmJkUjBmgCgXYHIc9KfrIl7bq5jGxD7f+q2eq14wQ52TLdaND
 +gf9RlbC7Y5f70cnBNG8JpWPPAVLIjgBCHRzAvenDd/TC8irL457L0WS1hGSo2tuY8u8XpbqO0n
 /QAJvHhTDNEDHUVs5vRIt1nugKXfzoay9uQ7jG4BpZODjQX46RbAfXtKpNYhw6XhojPhgfzVNeB
 3cG9Is1qrCw00o788jXSrT/CU8jTcynrBXEUa5fwLPOx3rd68LzGtTLTVGVs9GNN5HTYxkGaolj
 cjFiCfxfmEZHUQw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120352_251775_C772EE89 
X-CRM114-Status: GOOD (  11.81  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The QCA6390 package contains discreet modules for WLAN and Bluetooth. They
are powered by the Power Management Unit (PMU) that takes inputs from the
host and provides LDO outputs. This document describes this module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/regulator/qcom,qca6390-pmu.yaml       | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
new file mode 100644
index 000000000000..9d39ff9a75fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. QCA6390 PMU Regulators
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  The QCA6390 package contains discreet modules for WLAN and Bluetooth. They
+  are powered by the Power Management Unit (PMU) that takes inputs from the
+  host and provides LDO outputs. This document describes this module.
+
+properties:
+  compatible:
+    const: qcom,qca6390-pmu
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddpmu-supply:
+    description: VDD_PMU supply regulator handle
+
+  vddrfa0p95-supply:
+    description: VDD_RFA_0P95 supply regulator handle
+
+  vddrfa1p3-supply:
+    description: VDD_RFA_1P3 supply regulator handle
+
+  vddrfa1p9-supply:
+    description: VDD_RFA_1P9 supply regulator handle
+
+  vddpcie1p3-supply:
+    description: VDD_PCIE_1P3 supply regulator handle<S-Del>
+
+  vddpcie1p9-supply:
+    description: VDD_PCIE_1P9 supply regulator handle
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  wlan-enable-gpios:
+    maxItems: 1
+    description: GPIO line enabling the ATH11K WLAN module supplied by the PMU
+
+  bt-enable-gpios:
+    maxItems: 1
+    description: GPIO line enabling the ATH11K Bluetooth module supplied by the PMU
+
+  regulators:
+    type: object
+    description:
+      LDO outputs of the PMU
+
+    patternProperties:
+      "^ldo[0-9]$":
+        $ref: regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - regulators
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qca6390-pmu
+    then:
+      required:
+        - vddaon-supply
+        - vddpmu-supply
+        - vddrfa0p95-supply
+        - vddrfa1p3-supply
+        - vddrfa1p9-supply
+        - vddpcie1p3-supply
+        - vddpcie1p9-supply
+        - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    pmu {
+        compatible = "qcom,qca6390-pmu";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+        vddaon-supply = <&vreg_s6a_0p95>;
+        vddpmu-supply = <&vreg_s2f_0p95>;
+        vddrfa0p95-supply = <&vreg_s2f_0p95>;
+        vddrfa1p3-supply = <&vreg_s8c_1p3>;
+        vddrfa1p9-supply = <&vreg_s5a_1p9>;
+        vddpcie1p3-supply = <&vreg_s8c_1p3>;
+        vddpcie1p9-supply = <&vreg_s5a_1p9>;
+        vddio-supply = <&vreg_s4a_1p8>;
+
+        wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+        bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+        regulators {
+            vreg_pmu_rfa_cmn: ldo0 {
+                regulator-name = "vreg_pmu_rfa_cmn";
+            };
+
+            vreg_pmu_aon_0p59: ldo1 {
+                regulator-name = "vreg_pmu_aon_0p59";
+            };
+
+            vreg_pmu_wlcx_0p8: ldo2 {
+                regulator-name = "vreg_pmu_wlcx_0p8";
+            };
+
+            vreg_pmu_wlmx_0p85: ldo3 {
+                regulator-name = "vreg_pmu_wlmx_0p85";
+            };
+
+            vreg_pmu_btcmx_0p85: ldo4 {
+                regulator-name = "vreg_pmu_btcmx_0p85";
+            };
+
+            vreg_pmu_rfa_0p8: ldo5 {
+                regulator-name = "vreg_pmu_rfa_0p8";
+            };
+
+            vreg_pmu_rfa_1p2: ldo6 {
+                regulator-name = "vreg_pmu_rfa_1p2";
+            };
+
+            vreg_pmu_rfa_1p7: ldo7 {
+                regulator-name = "vreg_pmu_rfa_1p7";
+            };
+
+            vreg_pmu_pcie_0p9: ldo8 {
+                regulator-name = "vreg_pmu_pcie_0p9";
+            };
+
+            vreg_pmu_pcie_1p8: ldo9 {
+                regulator-name = "vreg_pmu_pcie_1p8";
+            };
+        };
+    };

-- 
2.43.0


