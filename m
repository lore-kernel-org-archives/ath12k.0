Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50080D6E2B7
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVUM1fO+9wEZHYLiSaEE/UVMBFNIUEsGatgLgjU1FuI=; b=Rq/TnRYJif9sbeedt+Vb9izxCA
	mZglEcZZvx1xZ+/CZVKMmz5y21cj7Yn7B+ijc903Df4icJsZrrPtTrZN1/QSdEiTt3mT82cRp3A65
	FKpgdiIcL+jdy8kc2hxHHB425KTVZxynxP38DAKgX7cX/7GoXRmK7c2ig3mHRajHmDANwuxbnG7MP
	hsauj5UWoFejbftomlw1c2JFYHWlXEWIQL6REM0Or3ujlS+8NdADwbHUTGAFo+UzoEBcnbuJQZCSJ
	cy4eFUcrSyXHY4FLz2lrmrl/0+L2gSWApN/BOWALuldBFblqDtJ8hDeZ1aByjL3PulR24BcRHaT+H
	WlQCecCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMO0-00000009G0w-0JCr;
	Thu, 18 Dec 2025 22:22:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMNz-00000009Fzk-04uq
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 22:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21B1B60053;
	Thu, 18 Dec 2025 22:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE3CBC113D0;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766096533;
	bh=XhLZIJ1aGNsOa6zR/7FJFBDE32GVcpBkjhLN7XTCseA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NNGmKXMvkK97gBmx6jjXbDK/gHvSeNyOk1vzCaOv6KgA6Mfb3SKvbvgFI5qiOYMIu
	 bFBzsOnE7DPNKwGZ/G0jeE/6/6OtplaPHC8SoOEG4oOxVZd6xFhn/uto+gOsiXSRhY
	 hgiUMbysQXpFAnboY96/1MzdACYgZVRb+TBR1zQCKU07ekFIY8mC7796eVHcJNrOA6
	 LZdfpL7qs/yxcN+liN9jOfUslencR0hm/zVSrtL/tjgscheV9CTORTmDLQZX9piEtf
	 b7f/lVvvU2nl+lwu9eDhiwMu98VUh2GyFc9nSjD1xLZwlEXflQAu+E/5j/4wCSoEoR
	 0g3rfvUerc8Dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D91CD6E2AE;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 23:22:07 +0100
Subject: [PATCH v4 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-surface-sp11-for-next-v4-1-7bcf83c1504a@gmail.com>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
In-Reply-To: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org, 
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766096532; l=1443;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=ODLaLlEkMG2kK+0djUMjgpeCyxYtB1rpe7QmWVeQ38w=;
 b=eapOBwWELgT98JYZhKAFUjAKdIgtUMS8sccAXttnQQdPnFEJhY7bwjbBpP1t0DnYlJLBkb5mt
 89OUwlWY6lLDb0zxIoJUrrX6sG3qYmmn9OgQTwsON0kwgm/HN5nvwIl
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
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
Reply-To: jerome.debretagne@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
using its Denali codename.

The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).

Due to the difference in how the built-in panel is being handled
between the OLED variant and LCD one, it is required to have two
separate DTBs, so document the compatible string for both variants.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010508a8225b9549d8c634efa06531..3685330344c0bf621125fc3d2f9c04082d6de144 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,17 @@ properties:
           - const: qcom,x1e78100
           - const: qcom,x1e80100
 
+      - items:
+          - const: microsoft,denali-lcd
+          - const: microsoft,denali
+          - const: qcom,x1p64100
+          - const: qcom,x1e80100
+
+      - items:
+          - const: microsoft,denali-oled
+          - const: microsoft,denali
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,vivobook-s15

-- 
2.47.3



