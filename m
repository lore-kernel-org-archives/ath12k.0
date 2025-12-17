Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9234D65C7F
	for <ath12k@archiver.kernel.org>; Wed, 17 Dec 2025 23:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QXaQ+YeNCSZ9diNB4X9iPboxvA9N/DwqVSLlHISys0=; b=nLbVouMpqLr9Mp35jdsLn9Qi+l
	XtKm5yIOn6rK2Csr7rmArWabx2T/7gWuxKB4WXqZIUTTmkQ6pOwpVGJvn2vMWhoc7T0RZGeBZWXhl
	bNYGjiptmFhwN4N7E+VOLmXO6zihhxtHV0XIA/mPirbMqvKsociLsvdPqk6Zhcufax/5yHJZ1eGbg
	ecKi4ackkKy9LDGnZSUz/jCO4tQdFBPgT0TfOruNYNsXM99w8jnz0dKBEA6uCmZRJPX87D8KWrqjA
	9PusS24qXa7PRCLRtTQZsjDP5/Qx5cdAin9Jsfml0vdER+mlKJmmiGr5b7ARg0oa90/OrZoPI4pDh
	iV4aPCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1OE-00000007Zla-1mzk;
	Wed, 17 Dec 2025 23:57:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1OC-00000007Zha-1GYO
	for ath12k@lists.infradead.org;
	Wed, 17 Dec 2025 23:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5A1544577;
	Wed, 17 Dec 2025 23:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83561C4AF09;
	Wed, 17 Dec 2025 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766015817;
	bh=vYWy4tIF0oImarVkvgA+J57CDTRRyXKFwzAaZ9x3bZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KVe6bKBpTyt87/LKfAwyJ4lLg4FTuB2VhdYJn4JEsVeVuCF5sH6uiNHOSepqNAl+J
	 BlE9K1oOF6RUbJpTS5FEYD61KWJc0XcrOugMwUwCB3moi51gc0cDOgf8tHIKW7kum8
	 kfzVsoUn4Wi2xysPdDqjLi10Q++S3nE3PDoC+asKpAglWiz1sbGshyhO1MWWCJXseZ
	 sccGMfAj+Wn3YDtKcTGphW00hrU+MeFl6oCy5yjvwrP5GNkkorbNbXloi4yEsH/BD/
	 qEKvAGe5UXwphSWRnc94O2MulTMaIwojQlzHVSFiNXJF3yxlZVk90oSsVcwbDK+X6g
	 MO7a5Tz86WzzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7484ED68BC4;
	Wed, 17 Dec 2025 23:56:57 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 00:56:38 +0100
Subject: [PATCH v3 2/6] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-surface-sp11-for-next-v3-2-875afc7bd3b7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766015816; l=1478;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=B9SXON9447NJlyUwxvW/LOflPUSy2K70Poc9F3eFNw8=;
 b=lfYTLElkmqTEh/CmzNAY2sL4elUcnq30On0LHA/2KpqAGgkgieJvcRNYvEaSxTLsda3lQGjGI
 yDkaIb+j6OIBNLu5oADBLWdkHKsTmoEUWsodYfbEtLqOEbPFpXeo61o
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_155704_389173_C445E794 
X-CRM114-Status: UNSURE (   7.83  )
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

For some devices, Wi-Fi is entirely hard blocked by default making
the Wi-Fi radio unusable, except if rfkill is disabled as expected
on those models.

Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
disabling specific features based on ACPI bitflag") added a way to
support features set via ACPI, including the DISABLE_RFKILL bit.

Add a disable-rfkill property to expose the DISABLE_RFKILL bit
equivalent for devices described by a Devicetree instead of ACPI.

Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
--- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
@@ -29,6 +29,12 @@ properties:
       different 5 GHz subbands. Using them incorrectly could not work or
       decrease performance noticeably
 
+  disable-rfkill:
+    type: boolean
+    description:
+      Disable rfkill for some devices on which Wi-Fi would be entirely hard
+      blocked by default otherwise
+
 additionalProperties: true
 
 examples:

-- 
2.47.3



