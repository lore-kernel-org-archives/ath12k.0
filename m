Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96826C83F21
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27zoUGw+O71pRkY17Cb5b44izqDIRpoqwysQTHKG9hU=; b=kZWO604UBLIAMNygcLgT1mdHQ5
	OPMPheWAjiY8gQeWrsBrY7INesWWTS7S4z33s6dnVsqtsWde6cJ4m0fHbKcfHMruP0qL9aYIA2E6N
	EtMwnkpBp+KpCkJ5BnkrtgWI0AJPTO+hgTra+/J0mh8aan3orYnSLa/qq3dwyJFNV4MC1uIhqDIhg
	uiT1xFiM6oQAt6DTpFsVXH7IMrtN3oXmeVv5hAynwrx5XeH4GGLw+YyKtnq1YfE+wm5UCnZUpH6Yb
	c3nyoRReRNnpj8EyzNoVnF9gm+fhHvhd+RyuYTbrah00IBZ48mUWo78GRVTCGVLASXSuj4+3hH75o
	9ugToV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFw-000000034dm-1FNB;
	Mon, 14 Jul 2025 18:50:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN6T-00000002yYq-1Dtm
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 17:36:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so2384391f8f.2
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514596; x=1753119396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27zoUGw+O71pRkY17Cb5b44izqDIRpoqwysQTHKG9hU=;
        b=NoAh3BurW/fGajNqOHVdc5ZWafVlkxam1Ke1nrQqrzi99f6c8sL7OpoIqbvN8WIouq
         UTAcD63czXa5X7Z8DQDbKuoQ7Gf2UWu/80kKfoO8o4uy3TmhQTrZz7y2ECZi/rSR2NGF
         pjilc6pAoGLSgXb2dHht4QaNXFClxNTIovVbJlJQ4S7gy/IywlvjUtQDLocyqU/n4vyr
         3DA/r8WVZJI2jBsmz7chhrrpXdUewrK2tOC94BGfc/IoIzKO+X6AQHt+xdgUNgZqXZSL
         fiXB5Gwq/NSRuGj7zdF+OI68KAamTS/1y+YHfq7+lCpSwHhewp08AtVTLGbIR39C6C7y
         MRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514596; x=1753119396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27zoUGw+O71pRkY17Cb5b44izqDIRpoqwysQTHKG9hU=;
        b=lpuDNooOg1MYvAmX6wu1jRD2oM6sTqU6gXuQIQMVlKb1a6nkcb5FOOxKAELAGOhEam
         FAOAMNcKyzLudXgh96Bryy0LfJ837+qRZslwDE9IizW5X5cNURZKZqJrNur6UpAcK1ht
         WaK0pME1z0IhBEA7OAxoL4sn7Np52AireoqjkkRs1odrw+vbpWqNXe2huhdiM8z5dm9F
         CdO8Z5ObcwoUAicg3skr0Z9vIGdNGXQGK4F9coHV2JSInxuZ+j/IRHCix4fc50boVt1b
         fZWJ4a2mggwsMiyUoB992eGstkscuaUBnZBrJllvGKB6tIc09SuRiaH0bXhj2K//XnDU
         oV9g==
X-Forwarded-Encrypted: i=1; AJvYcCUlIEioEqDQjWKHJ1bVmGhRR7F9aEvW+rg1F9uO5skRVKtbpUKbsQGjOae4ormGhJj+tXhDr7o=@lists.infradead.org
X-Gm-Message-State: AOJu0YziVKSa4Evzv0+V8uxTZAHUaLBwOK9CFJ7Ty01M/RX7/A9dRuKu
	vdkk8r76DIJ9uI3ReOTYxm5jTUrBpNNP/Q5QiyzLo3rcbOTcEJuqhI7L0CHGVlqAa8I=
X-Gm-Gg: ASbGncv8O8fHHu5/LsvJFvnlmr7OiZCFwY1+d5SedDzaJQRaJlnJHvEM+vWDE15Fwy6
	jf+BqM5k7JqXWtqWsPK/m0dWCPSQKF0nN8uZ9b9fHZHLQixlA11/HXEazuZp1aYkFzd2/3sm7oJ
	DIv0rKliJN/2vnF1c6CcwaXCmXKOi3NY+/tI4U4EAYg3Tx9IdHni3LWcEzFJV0WfWS/YIzRvSTx
	iW1pSBAM/5+AUXCJCjWNNPkTc2UMxv9MePx3ov1vVMA5yRgfivNdlIz2oJPCuaV/AR1uFL0Ffny
	giIiFJ+BwlWz7s1Hqhw4H1LONWt5aHGt7afDAP7YJF8otO7E+PulOQYQRe0G0AJuDjI955hcj1Y
	4PUcWkRO91T8MVN1qfUQdSEA+PtYau1hXAmI=
X-Google-Smtp-Source: AGHT+IHgvMVpSzu1V0uiZyQXxUUB2sDhT1TXAVv0QnYeeVesufnJpndQ8w9cDsN//TZkJRwawRLG8w==
X-Received: by 2002:adf:e7d1:0:b0:3b4:4790:8415 with SMTP id ffacd0b85a97d-3b5f18d977dmr10613323f8f.48.1752514595511;
        Mon, 14 Jul 2025 10:36:35 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:35 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9 RFC] dt-bindings: wireless: ath12k: Add disable-rfkill property
Date: Mon, 14 Jul 2025 18:35:43 +0100
Message-ID: <20250714173554.14223-8-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_103637_328779_EAF89236 
X-CRM114-Status: UNSURE (   7.70  )
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

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Document the disable-rfkill property.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index 9e557cb838c7..f15b630fb034 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -48,6 +48,9 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  disable-rfkill:
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.50.1


