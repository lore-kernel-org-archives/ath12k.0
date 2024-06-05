Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860EBC27C5E
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtrY9AQ1HMviMtXqdGs5v4k8JWTeW8ioeVqyYswS7I4=; b=09nqpCMD/ZjCXfRMM/0WXyB/k0
	6/9bc73rgvSCLXHLrMJ/QM3PAUeGS12brzI7Fc7hAEaEQg+PGWRasYxEQ8wHfCzzy42RiWzvn7UEu
	mBjcaSCsl0o+7aURVhSMnQ3ZgWxufRfF7Zp+wLgiNQJLNVZnqikLIkTgP+z/fpFNqBvelomiWH8tS
	VRshzj41EREyrgDt7yIA/PSTLNhD8bd+Q6KYWI7PpIj8C8s6lvR/KGwvjUputHKt8BmUToQV+Zru3
	TPIUHV3eo4teIHHnQxBqs+joh8sMqtXuHeV2K/eU4IVSmvOOhzDOT+1iQ9r7SFOqoQrjSmGe+m7s5
	FY6b3j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpe0-00000005xcJ-0wqY
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 12:21:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpdv-00000005xWH-49kW
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 12:21:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4213870aafdso35034125e9.2
        for <ath12k@lists.infradead.org>; Wed, 05 Jun 2024 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590079; x=1718194879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtrY9AQ1HMviMtXqdGs5v4k8JWTeW8ioeVqyYswS7I4=;
        b=3UvkypQRRGKDqkUeyzpPHY1YLqa3xQcSc6ID34ZGONX80cffRPd+i5Y5UyIypt3FN6
         9oJSETBCsE9HQIEAw9uNRoqAYd8NWBiBmFFs1z4AGpe1TdL8IEeYQBFmLN/Rjo1WYs6R
         8kMzkd7LTYEgQXbLliYtcaG2N9dV5DGXmvf6ik7OiGgS1fZA0NeuiRxVPTMi2FNsXbYU
         xIt7B6zcS2AjEIsq72nIscvlcgVCkNaSGObdz0bKK/8vS8rik7HN9svHVuvXh3xhZO6x
         zwEh6NkXc8fX0+nnGLVYIWAyd0fssf9CgsydxOKsWcvpO+LQRYJkPVbURbGvJFOuf5VE
         d4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590079; x=1718194879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtrY9AQ1HMviMtXqdGs5v4k8JWTeW8ioeVqyYswS7I4=;
        b=f7gJFrYBuDqLghszWN2cbbGQ6oKpNx3/snNZRPPr3EX3Fod0wCYr1vF85W7udHiV3e
         la4JqiGU7wMKX64IdWpIwiSU7JqbRbCRBdt8P0yBw4zoK21i2rCGwNLmchVIgwjQOu0i
         yGwap/+c4C1CcSAJUmvas8IYtnjGt5+FswdGgUCvJUksbb0jv6pftQRh0G4AaPiYhjYt
         0K0kFDHDqlba2hg9uek6fYi3VfG19+3SMumbYsjalagaAj7JIuOcu6gsBoBd+PBPIxt/
         S6ste6fCCmQBiGHq+EtRe/2A4qvKuA9OdkXlo2cWvQms+As5YT+5LG9K6zp6FCHGgNT8
         SnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF3zwm0m2JS8LwgHdJj0SHYsG9g41nKixMBBb5noBjoUjnsajGHWJQRFPzYjwkY6WJYUgQ6f1lr1Or94TIijnDa7+vlp+n8oz2yw==
X-Gm-Message-State: AOJu0YxjwQZkj8RIowT+x7JMdBwIl1IQR4LUlU8Vh8gSVIsk/p6/TQrh
	XlJ0qM39XQbQeCwbIBomkcIWysdDyGc1NSLPLqnpnPo/Fq6MDbGWfXCaOIv8sFQ=
X-Google-Smtp-Source: AGHT+IHX0hwMEdRN5Wsfn67SdyNgnl9018bU7fki5GYdi8OUdKMJ4OUu2nbQIpjUAkYySA+jeO1imQ==
X-Received: by 2002:a05:600c:1e02:b0:421:2abe:54e3 with SMTP id 5b1f17b1804b1-421562cf532mr18320735e9.2.1717590079340;
        Wed, 05 Jun 2024 05:21:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215813ce64sm19634485e9.44.2024.06.05.05.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:21:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe the ath11k on QCA6390
Date: Wed,  5 Jun 2024 14:21:04 +0200
Message-ID: <20240605122106.23818-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605122106.23818-1-brgl@bgdev.pl>
References: <20240605122106.23818-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_052128_246219_7CA718C7 
X-CRM114-Status: UNSURE (   8.12  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a PCI compatible for the ATH11K module on QCA6390 and describe the
power inputs from the PMU that it consumes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/wireless/qcom,ath11k-pci.yaml         | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 41d023797d7d..8675d7d0215c 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - pci17cb,1101  # QCA6390
       - pci17cb,1103  # WCN6855
 
   reg:
@@ -28,10 +29,55 @@ properties:
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddwlcx-supply:
+    description: VDD_WL_CX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WL_MX supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p7-supply:
+    description: VDD_RFA_1P7 supply regulator handle
+
+  vddpcie0p9-supply:
+    description: VDD_PCIE_0P9 supply regulator handle
+
+  vddpcie1p8-supply:
+    description: VDD_PCIE_1P8 supply regulator handle
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: pci17cb,1101
+    then:
+      required:
+        - vddrfacmn-supply
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p7-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
+
 additionalProperties: false
 
 examples:
-- 
2.40.1


