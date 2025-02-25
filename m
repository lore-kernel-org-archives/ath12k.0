Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBD7C021BE
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo1pjQ68yeCzhbkpB7J7V47zeMnYxLOEDsgL4uzRgNQ=; b=wXND/pMNGdJPXkrr66VAunrHF2
	8bqkEHh+2RlcSCuK/1yo5pzZSGWBzlTwBQtu1fQl3qHlGPOjrdhXhjN21eWOzz7cJB9B59e/22SuV
	RiUDqfXS9TIc8JiJrQ20fg9XslIxPBAkIJZKIQrK9F+ixCwovebSHQ6bSVRnqk9yj29WbIfUzsd7J
	iswr4ukevD+N91cYhzUxPSbpRX121t8MRZekTQupLb9eFemx87Ge/jZ9Vv/zmeDjTv4MTJiVlNebE
	Rd5XRNIbK28WHdd/Nq81wVEXixUbw2X+74L7VLEe8bhoig1XtZ78ZFdm9WTtOcBnfpr8meUHJzJk0
	r6n5zOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNk-0000000GcLc-1Yef
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 09:37:40 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsr-0000000GVeZ-30O0
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7d8953b48so85575766b.2
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474344; x=1741079144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zo1pjQ68yeCzhbkpB7J7V47zeMnYxLOEDsgL4uzRgNQ=;
        b=NzmozdT0jRyVT8NkS+vsc4jqa3VLS0+omwk4AxYrhEZepXtkVu6UGUzuN75RzbHgXS
         XBbGeq68UpQ99GtQN2+DLkgA4bL04n/0K0TeCeoM7qGZ6fLvmfIPeWfhNqMeW+Zmm/Ee
         Ch/GOvqSwwWw9AvgViO/ZEh/MmLIcj11WPGW4kO2xn+dKN8nIzfjVaJxea7GkHDv6cuv
         YptMeLDMmI5fHSiV50GZZtOkaPwi1qi+BAgU7dvl0wpLtz49xCmLpTDKFBoDFOGVlNco
         a6MQsSfwD5xRC7ybKGtvJzvJ6RzU8gKKYxKVl4GvHnw0giv4+TIcH8M3zulGEoHhK+k+
         xLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474344; x=1741079144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo1pjQ68yeCzhbkpB7J7V47zeMnYxLOEDsgL4uzRgNQ=;
        b=p4FQQitTSWpJhScaQ5JKJ8xL3gXugybx9JeUgZ4XAcEDp/Htjbuk9gWA/xQDdZpkpi
         WyvU+kOZAPJGj9HUI9tLdK1TgZ0Zppw9oz/bQPXbgKMY7CABEBJUNf46p4P3grxgSGWE
         aUlPF2u3As4jSv6RhNTyAsTLHkixBKC63kcvAWbEOItelVWfr9qDPX1odncVAhFsJtlm
         5CXJylsoN+YtYXTbXaCF01oVnx6F7SFTcS6ijYlsRnbv7Pkf/DDZdQYc9ApGyqvP55Ie
         0PHsORIkohWKUKiSzfEk37mfiSl422aN3/ac9atNwyd96WXE0fIbihll7EXoTw9j4prS
         G0QA==
X-Forwarded-Encrypted: i=1; AJvYcCUZnio3cJpjrzaxGklN4EB2+JCv5bZ519R1Schz4VuJx/OGsXlJqMa5QLKWAc/iBepRx0ANg6E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwxh7JoRqwudw7ge1HVVntlushgI3GqW3RBf0JGj7Oi22hhxlU
	KKwxvzzoRCq+wMfjyzNII8LWy5HbEa0QIDIFVvBT1eMDet167WdjzwJdFbM0Xso=
X-Gm-Gg: ASbGncuFr2Ttn6ohq4LwqXxbDcFwQ7E68FFW5lRLnKZrh+qtbghth3Mm+O8IHgfpIs3
	Yh1b33lNubl5yUI3zw0zRtD9Dn7X14lo3filhG7ASwQGYTXXTwiNYJIGZ+3S9sRyA9lFvFb7V+/
	/27fCGYwIlPUldawwtun8DP4r9EMpiz2hp3gWkHHPuXYmay2o5s1WikVszoxr5aYzXNg1XAx/EB
	+T4VevCKbn9I7fQlQUb58yMKk57GnmR66iChKffc/9qrt/ZWH5NMozFwNASeAOHbf/Gk4RuP46p
	9WvrcrCKqJ8ftIzDCx7ggsAJI1WQG4o3Ag3aL7dwFT6+jSAjvb7M8PlV2pMCSiGM8N1jnyg3xMN
	O
X-Google-Smtp-Source: AGHT+IFfZNdXDJRzlMISFU49LCOakhBuM69LkIjmx8fbF/w1knTVG5tWk4V0qemTNqYROdbFXsCH5A==
X-Received: by 2002:a17:907:9814:b0:ab7:cd83:98b7 with SMTP id a640c23a62f3a-abc09e5bf1fmr582403866b.11.1740474344247;
        Tue, 25 Feb 2025 01:05:44 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:32 +0100
Subject: [PATCH 1/5] dt-bindings: wireless: ath10k: Strip ath10k prefix
 from calibration properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-1-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VbFmmIDF/8jKLhSs1wa1TXVWPdXSYsgH25cB1B+83/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfgQSbcaZwR2tq3fhOVEdWBllORf8viADQmn
 Wu6612ZHpeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H4AAKCRDBN2bmhouD
 17M6EACV7hPG3YBlQRRjYC7EqbUoc5wWOSqUvEuuy6qx6Dkd22qcQJXm7ZEr5U3XQFvCuAcZ7nX
 ACotRz7PjoieH49a1VCo4LhSjbYT3qRDxskFF9VVdvWraUtphgnj55kdkw0d6KEoM9Y2prvbFGx
 LwZ6AFFEZj3eKiuVZlSkvEQ70viWCjCYqiZR2QFMRKlvZZuHWJhiULlNBkIIaXtkQ0/hhqz8sCi
 jbkmRLbYo8CG5ub9/uOxn7ZNwZUB+Y7UjpCC4egJne/B0v6mgaqxMIsCiFDkTZlyH89+homyqmK
 M2sLBHzdCnG/X+RK4yEu8W1sfdlS1U/ZFu0zm+q1CpYqT/RaDgNjVJu+8s5yP4XbdgVFoYDWtfU
 +fHcN+LTSeqxR5wOQ8rXc2jpyjWbN5UX+jM5Co6DALIbxv1i79LgBgg4sm4XyiwAcNuhpHi2RA1
 HZ3HNsftjAVMCnFi7erV1zzJdAugML21xyV1TkfKM50rWs8a1XGQXKWl/+w/KVfyrdKlQvSwV8G
 MluzY10xipB+fslPuWy0qRzM/tZriEjVywT9W6Yf3JCkPYTDyukCrpLYGMbEWARCXC5MyvhPDbz
 fWqno2SzFzSuwr+j5l7N5hKlf2zdeQawJ1uscMWElYBbziUO7ghhwFAu8gg7avuY/BFH6Qzbz0/
 Aoh6IGtBcs3DYZw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010545_797002_F818D310 
X-CRM114-Status: UNSURE (   9.89  )
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

Devicetree properties describing exactly the same thing should be
reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
certain calibration data, so properties should not be prefixed with
device family (ath10k).

Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
switch to a common property.  This will also allow moving these
properties to common schema, if desired.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Why? Because people add qcom,ath12k-calibration-data and probably they
will add qcom,ath13k-calibration-data, qcom,ath14k-calibration-data and
so on.
---
 .../bindings/net/wireless/qcom,ath10k.yaml         | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index aace072e2d52a6830b98dd3f52d61380105c8aa1..f2440d39b7ebcda77db592de85573bec902fb334 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,20 +92,41 @@ properties:
 
   ieee80211-freq-limit: true
 
-  qcom,ath10k-calibration-data:
+  qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
       Calibration data + board-specific data as a byte array. The length
       can vary between hardware versions.
 
-  qcom,ath10k-calibration-variant:
+  qcom,ath10k-calibration-data:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    deprecated: true
+    description:
+      Calibration data + board-specific data as a byte array. The length
+      can vary between hardware versions.
+
+  qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
     description:
       Unique variant identifier of the calibration data in board-2.bin
       for designs with colliding bus and device specific ids
 
+  qcom,ath10k-calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+    description:
+      Unique variant identifier of the calibration data in board-2.bin
+      for designs with colliding bus and device specific ids
+
+  qcom,pre-calibration-data:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Pre-calibration data as a byte array. The length can vary between
+      hardware versions.
+
   qcom,ath10k-pre-calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
+    deprecated: true
     description:
       Pre-calibration data as a byte array. The length can vary between
       hardware versions.

-- 
2.43.0


