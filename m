Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2767AE668A7
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 00:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEDyHTiHb9cSVelzq4dEe3qqdfk8CzhcXAMCO8iyH60=; b=iHlp7W4q9wyYgOmdt1VAWn/zpI
	LpkYruX+lIAG2S9K5KsjESSEUpFlYJ7rR9FDRlf4/artFZz29v5ZXDaTKPHlKho01lKmPo8RvNxug
	GtbWXRmp0I5xom3C2W6GsWWBYAi6zhsqfyo88f2kzuio91hRnc/+cJKPiaNsq7np6i6Lp28s7Sxtn
	9j8A1U+6KQokXDdOBvtUgGoS4kYeRndhTd+G2xdjCX3Po0MVhHLJi6J7oZ6lbkteR/swkey76NzKB
	vhfB7mRJM9+2im887JTps0K+yrELBEc7YHZ8Vq+XUuGA7eFJ7mJ36sxOFW8nkzv7qaB5f81dw5Un/
	YL2dOYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWkk6-0000000B7kr-3dXb;
	Sat, 20 Dec 2025 00:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWkk4-0000000B7hh-0lta
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 00:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B22094451C;
	Sat, 20 Dec 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 592A3C2BCF4;
	Sat, 20 Dec 2025 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766190157;
	bh=y8uwgejRLp1483O4zbHXfsEQl2sOPvQtaBL89zBQ1kE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mnXWV5mRKRRUfDdw9x2ga5stBtxvwMTOuDfi/jmKjJdRi8IljK575suHkEKY1OuXN
	 h0y1f21+ieFohGoFZrSVZB48CoN0BYOaHQQnn5S2elXX7p8GV52sbmR5g7R9b5NOqS
	 ikwne+5/5E6LMO6S8Jq6yabsLTdz9QiGaT47crvJokSpfTOtJpBTkgkVZiv7RBWahl
	 JjtJXNKt0wcz1LFU1Tc2Rnq+H0hSF2BX7oETJfHG+gYhfkB7PoSuKmEm9h7BFxmRuK
	 mrnhYktOXUSiOsLl3BUZNN8zIgykWNKUkf6KNjARVKZ8QlVKILgQkif9n1IYmsCeMz
	 ymylJ00jHrrAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515B0E668A7;
	Sat, 20 Dec 2025 00:22:37 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Sat, 20 Dec 2025 01:22:04 +0100
Subject: [PATCH v5 7/7] wifi: ath12k: Add support for disabling rfkill via
 devicetree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251220-surface-sp11-for-next-v5-7-16065bef8ef3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766190155; l=1262;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=o+2ygO1zvLsftpDj/dtrdmFTDVzHA+1Wm5SG6mbwRZw=;
 b=puDEyDrH298j7z4liMYX0YwZHegBdP1BrcSrveoBtN/lv9OuK3kUHcpM/2uU2GVvU40DhCqw6
 1GNpYHPLvfhAJCNhfYU+0CILuvsG9oupHPmzIdL8kdaKQqgxheKFzbq
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_162240_273860_AB4B377D 
X-CRM114-Status: GOOD (  11.03  )
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

From: Dale Whinham <daleyo@gmail.com>

Some devices (e.g. Microsoft Surface Pro 11) indicate that the rfkill
feature should be disabled by means of an ACPI bitflag.

If ACPI is not being used (i.e. booting using a devicetree) then this
property will not be read and therefore rfkill may be enabled and
the ath12k will be hard-blocked with no way to disable it.

Add a devicetree property that allows to disable the rfkill feature.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cc352eef1939937ce902bee2fbd9737ca3ab5993..e10073bb975cfd2e9ee418edcc49d0d51cf93de1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -77,6 +77,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (of_property_read_bool(ab->dev->of_node, "disable-rfkill"))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 

-- 
2.47.3



