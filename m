Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A5D68BC9
	for <ath12k@archiver.kernel.org>; Wed, 17 Dec 2025 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfNYp+UHyQ0V3xR7MbHz4ahd1r/mbdl1oNwjvmYikpU=; b=s+0vRHtyX52YJpAkvvvGo4MFBQ
	b1vQEy+DlSGKRrcOoMA+sOALnV8jzJSk534GsMPiyqlJXLV+Byb2EWQZZwXdtZlwNOHO3yz/YxDPK
	xfRC+iWt3VF1ZpmH0Bd2Esl+gv1814kCr/TAUwCUZZbOGbHuVgkINad9p7dYqqnaxHwRcpSOt9sMO
	ZljhFWsYdPhiPAsF7z2FS4USktctVoblvOUiSCXTFaJW/2sH+si6oUOgGAffwruKYcDBiz49Y3aL8
	2NxR2+5BUvWnEkGBqz1NSw95yu+XxLpJXZ7wJeY67nKszaHfa+xaRNOzY+GFCsz9or+6pwk5DV0sa
	ikiMSvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1O7-00000007Zi6-3egr;
	Wed, 17 Dec 2025 23:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1O6-00000007Zhf-3bpO
	for ath12k@lists.infradead.org;
	Wed, 17 Dec 2025 23:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D27256001D;
	Wed, 17 Dec 2025 23:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7582FC116C6;
	Wed, 17 Dec 2025 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766015817;
	bh=97wia3zS1qlYRADNyWZ1Dearx5E9Qhtfzmpsvc4CY1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sZ7PPPASDFFO8yLqhmWDxlKm6HjerwDesovkOoIKUtnR5jSrZEx1ZDWXM3nmP5XVA
	 aVSZhEL9zj+dbNmSVz9GpvRBltUqClg4aj/KmBi8yLg4MAVMygmtN1VkyCjNmrLB1z
	 kTZiXNwoEq36yTaaaZxYyC4dvhXYwd8UIrceKny017cHI2KbBJGMRDdOoLCBTEuAug
	 YaNX8zE8CJecCugGsM3GfyI8MS/u4SXhd51eAtju/4xqgUpFORC8TBttpiDKXbdosy
	 jKOm5zCd51p3jkLza5kr8dYnf2rXiaUmbIhWJmBpKodAqMKdIiAC97GLcNKEaCPTg6
	 YGVV+UP7c0xOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63876D68BC6;
	Wed, 17 Dec 2025 23:56:57 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 00:56:37 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
In-Reply-To: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766015816; l=1359;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=qhZGa2NeEFuwnlmtetVVgl3HuNxZv/a5Bxw1IkCiHVY=;
 b=B5FfylNnd9JStM4MWLyxTQ8KbZQ+xR+ncPAvrCe1feg7LFBArZWMSVMQP9uxrP4U+FzK0W+a5
 Mv2GLTwX9smDRgjjVOk7yG9oN6Mxks5iqDQr/vSEKvQCUvGjA1hW8sG
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
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fef0a535e114a3297a8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,14 @@ properties:
           - const: qcom,x1e78100
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - microsoft,denali-lcd
+              - microsoft,denali-oled
+          - const: microsoft,denali
+          - const: qcom,x1p64100
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,vivobook-s15

-- 
2.47.3



