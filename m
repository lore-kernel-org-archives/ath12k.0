Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54320C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARukf9GYdWwhp4gmhZ7LfQBE2SXe7vwdt7HbV+J/3YA=; b=eY1b6hqCUgTSH9pc/IT9y/HCzx
	j6OC0TmQP6ANdyxCxC2Ya3fb8qSEkKe+rqWa2iCBMWh5KBgAgMa4QW3WOzxhC7RwgDCf3ahF0cEpA
	10v4clu022tdW1mWeayOQdTjPoe/al9sbBqXaVdwBwGi+cmtUr9wj2vvqOp706fFAXapiKh5N+kSP
	/U93T47/ITulgr11mojS8/EtlpExtvwVlJ9coSVim+4BRf3UN01eEyhDXY6zIuk/VMMtfJFWAXikm
	RLy5Z4Bh/X995Iko06hrXrM7vFwSEuFDBCsId0P5sLjA+fcUi0p438XY9zqgvpjmdWRrkaFwYHG67
	cB/xE5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27M-00000001jxx-29S5
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:04:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC273-00000001jf8-1KW2
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:03:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-35a264cb831so963625f8f.2
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923034; x=1717527834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARukf9GYdWwhp4gmhZ7LfQBE2SXe7vwdt7HbV+J/3YA=;
        b=yrWb/J2kp9AgE6zJbeNWBJE3sEIPuciT54TdHgQRdBptlm7V4aH2Z0FQoJ2v8mG/+e
         39fQJXlDWpDGE5Y0LJtdOPXrU4j1sQv3PzReui9/QfkB//laDAoY1kzCFIRfZO3jJDa4
         x6rWnJROsoln+AviWYBX9ionLJTyfW7f1jdH2iBkI/0SkN9RZWRKLIDSwFGwjoZ1sKqQ
         qd925lj7ISSJz/khyKPzZkWarq/eNCuBGGk8WtkwvHVQx5CHbOKNFBeDSDMAxeoqT27v
         vGVz88jThx3NWH+H+sULh9Qb6PnYjcaptJLp9KaL/7y1YoQx/CtdlVLSl+TOe84N9yBa
         rKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923034; x=1717527834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARukf9GYdWwhp4gmhZ7LfQBE2SXe7vwdt7HbV+J/3YA=;
        b=GpF3wpVXi26kmurKtTvdWgheYVuzaYyXtAtdODAzrRUKPQ/tnLdIVVOlcuc/lxZrEQ
         j8j0RqgTDY/PSC8cniLbbkk82ooOWl8x/r1i34FTkgJPCULL/971f8WxdBdb7NIlhTMk
         fTFw1zYXU/cx1zEkWce36VfRrqEy9q+cJyV/ut3mMdzxEG2ZlQaWF55AvUTV4BIO+cfp
         4DQQ8WvQJa2YpTjHC3lThl/O9AFcA9q9hKK4F0XMFeRqkRHSsbWSa5x/n8/780vNIwFM
         uQ2wre+uR5oL20FRp9jlQ7yv6mqTqM2rk53hNB1ZLFolrCLzAzrFkajKbnatO9Vci8kH
         IK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmzINIJ12Dh0KFzShmjfnhAUYvcYZ2pHJH3QwwhAXen1Qx/lUkVPWUTFhPOJ63vFhbvyOmIxGRpVYTS7jgqI8uJax8oqTr4s4PmA==
X-Gm-Message-State: AOJu0Yy2YFikjstC6WIIYJPO2ebOKYcHJUfYP8X4m5NuLuOPpRCPJRND
	OQMAqc9jZK0Yz6y4VPPVgUWysaZpy7VtzBtqK6JcFDOH+HQYSXdDfnVXhMYNE7g=
X-Google-Smtp-Source: AGHT+IEAkjwH/NK3O6U5emPpYqfTemgtvoInaezOh9aGiKYT3aTB9vJVz1gN9oNBPFAqocFQQCD03Q==
X-Received: by 2002:a5d:4ec3:0:b0:351:ce05:7a30 with SMTP id ffacd0b85a97d-3552fdf23aemr9553489f8f.52.1716923034440;
        Tue, 28 May 2024 12:03:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:03:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:13 +0200
Subject: [PATCH v8 05/17] dt-bindings: net: wireless: describe the ath12k
 PCI module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-5-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tZHnqdJlDyCPsZfIWq38ZYfksNziOf582cWrfkALzlY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqNDFaR71/0ob5YGHxnuMESYLlibocsNBAnz
 W1cPnFAbMWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjQAKCRARpy6gFHHX
 cnbuEACEzuQHw1lAFZBJuv8eQ94F2cid2ocs2SKvk4pscUFcmPb1a0OGPXsyq+QnlFm/cZYgWs5
 WyFAqy6UNQf1PIunzufvfdj2JTYonmpwk20C4C8smtqpjoTqjECeatk3JYCOwZSDau8l965dZ2Q
 sv8uGdFyOHUWrNp1n+3UkxZcJsD+rzRuI/BGAufafD/j688u9RoRhwAmELE42DG+NHmuZDgawH8
 jvbtppwHavVwS4kv+Bo5WTBGcFnXeqyQTRXf6ABjOCsM0djk6BDfwlNBb1RdJ2OqWQQ8QXKsh0B
 uQyGSqVpf1OYGj/Hr5bUbFH943wOJcmNSriDMWmadoQeZOeCz0GpqsnAWZ9sCPK/Zvt2UURh5hY
 Grm2kUfj2y/svdNprXYeZgm5YAlG3rLvz8RdqcyzjXbTrrKRI9l1ZjwKDJTxG/bUXjBc0Z3UZMB
 gWzgZUElhPrEs9dPlc4nVjPuJvmEw0B1oets0J5MMxtq1ia/q6gXiXAbx04DR9QBOgr//4z9am4
 lCadBjr75amBTpsnthAVDMGVB3Mckb1+9dt0cQ+xxrXaIC+0FiHrXWscNaxa78/O94NoxlxSAQQ
 G07XA6GbBefaR/gONcFxJBlrvJ/gtGkTDt1sq/myj1lZcmRVkA45nECDxHif7SpPmGx1ANwxYfw
 amjhhySJcc91Rdg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120357_494037_F0BDBF84 
X-CRM114-Status: GOOD (  11.31  )
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

Add device-tree bindings for the ATH12K module found in the WCN7850
package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/wireless/qcom,ath12k.yaml         | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
new file mode 100644
index 000000000000..1b5884015b15
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 Linaro Limited
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies ath12k wireless devices (PCIe)
+
+maintainers:
+  - Jeff Johnson <quic_jjohnson@quicinc.com>
+  - Kalle Valo <kvalo@kernel.org>
+
+description:
+  Qualcomm Technologies IEEE 802.11be PCIe devices.
+
+properties:
+  compatible:
+    enum:
+      - pci17cb,1107  # WCN7850
+
+  reg:
+    maxItems: 1
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddwlcx-supply:
+    description: VDD_WLCX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WLMX supply regulator handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
+  vddpcie0p9-supply:
+    description: VDD_PCIE_0P9 supply regulator handle
+
+  vddpcie1p8-supply:
+    description: VDD_PCIE_1P8 supply regulator handle
+
+required:
+  - compatible
+  - reg
+  - vddaon-supply
+  - vddwlcx-supply
+  - vddwlmx-supply
+  - vddrfacmn-supply
+  - vddrfa0p8-supply
+  - vddrfa1p2-supply
+  - vddrfa1p8-supply
+  - vddpcie0p9-supply
+  - vddpcie1p8-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    pcie {
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
+            bus-range = <0x01 0xff>;
+
+            wifi@0 {
+                compatible = "pci17cb,1107";
+                reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+                vddaon-supply = <&vreg_pmu_aon_0p59>;
+                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+                vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+            };
+        };
+    };

-- 
2.43.0


