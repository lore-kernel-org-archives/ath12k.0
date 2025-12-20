Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB3AE668AF
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 00:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLcWbPc9uyG1U2PptAS2iTNFVqZNvYWF0/x6PXm2DoQ=; b=QbXa5OqUqI1MTpjMRH2ncIV18s
	qOlaGOE5XwDIRcf7ACxSCCcQ9Qj4DJvoNe3txbPu9280dYRa3pmGQpky8/ePeFJ0MPmzuSR067OKk
	ohCS2AI3hlTPIIGF8R5RUJwKDomYrq6M3ohWgn0uyEY0pd2iizC8ra60UBDq8OJltgfJ8jskI0UFn
	TtjtGo8ORhYu3JvjoAmZGMpCpWksmVMVe4QpOrc29X79TYmfFXdlRaXayizYeQi2TzBL3tpbxiXpZ
	UJ+LZIIIlcTxhJAcSfBSXWRDWg1g+mWE2FKY33BzkSfe+l0IH01hioIqAjlElndzEGmlbYVXu8Lqu
	3EH7pWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWkk6-0000000B7jk-14oQ;
	Sat, 20 Dec 2025 00:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWkk2-0000000B7gR-3Uhl
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 00:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82B70444E6;
	Sat, 20 Dec 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AEB1C19421;
	Sat, 20 Dec 2025 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766190157;
	bh=RMpcTlpiiJR7am5aDa0+IMieq4Gs4MKgiv3QBd2GR4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nEog9GGqvUHMkUuFtR+F15QjUg+eMjE7WIp/Gckchak9pzcSDvxfhSk1u+Cae7CQ+
	 gcEzRftJ78yyio0XXLJEnVpX/bETUp0rzfdZWe9SUWOfcZ5/FQWkCfsIyBJL2jF8mx
	 S+VhfjVABrjTWoDzt57womFIW8T/TmyAY9glkLuvR6NyGSsm1JtI/L1+hKFhr1fTO2
	 HKgL4DYOwu6adldexQoRbUermOTTH0nNr9KMee3ZVaz657czq4LQ0UzUmP0SVL2Hi0
	 sEqlu+6iTAXZz3MC4kvbWIk5Du1ULpImPnmU/rsYgqeQo5wDBCty14n2p01G7NcP86
	 ICig6gLN9nbtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0CED78797;
	Sat, 20 Dec 2025 00:22:37 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Sat, 20 Dec 2025 01:22:00 +0100
Subject: [PATCH v5 3/7] dt-bindings: wireless: ath12k: Allow disable-rfkill
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251220-surface-sp11-for-next-v5-3-16065bef8ef3@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
In-Reply-To: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
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
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766190155; l=1122;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=qxUYWgrkevDrzW7E3kqpqIBVkm0S8EYbX/8Sl2i9Gas=;
 b=HDpJFAGzTzB5pyD88o+QOrEljODlF7cCgrR9SyebLystn5VxlZgYVg3uagtZgdENepJt0kLLa
 a+F3uIzqOXxBbr1R0q7/T0VtIvb3vjw3XuxLtdJu4E5cq/heNZe6IhR
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_162238_921583_CC37EAF6 
X-CRM114-Status: UNSURE (   6.07  )
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
Reply-To: jerome.debretagne@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Reference the ieee80211.yaml schema to allow disable-rfkill to
be used for models that need to disable the rfkill feature,
otherwise the Wi-Fi radio is unusable.

This is required by the Surface Pro 11 with WCN7850.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd59988fc757e8f53e809128cb4e820d66d1..e18c87b21777bc6642e551f23feff69bfb7fb435 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -21,6 +21,8 @@ properties:
   reg:
     maxItems: 1
 
+  disable-rfkill: true
+
   firmware-name:
     maxItems: 1
     description:
@@ -69,6 +71,9 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: ieee80211.yaml#
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>

-- 
2.47.3



