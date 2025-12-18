Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFE9D711CC
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YQO6+aZi9OsiufExDuwOFgJBDhi3Ve0J/eYf7nyhmA=; b=HxPs4ix8j1KETXJzfiVtqa2VwU
	vf4NzrBVo4dLTYc0IEZA0QZdORw4T4//jlRKh5pMl0vHJ1vqj0ygcaBuQA9hjAXSXgzmH41l7lGZ6
	XwDJFBo2lTRHCe5YMyHBMf94k/8RXIA7YeBtYW7OeHnc/yBWX4UOv/sgSk84xjf18BlgQmdhRp3Gx
	foZ+17RQxl6NJ/Qsa/AIQpwFwVpqYFXsfNuj40hFlkUhI2RfNKO878e0X3vK98G6yW1Bntp1lgWsN
	LGsk1Z5xTQn7eKL2aDVQzJhnq6+bwCVClOnmxLd1WPQEqqG+IfTDY2QdTr5UqLrtrQN4aPW86cjAd
	AtnQ8xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMO3-00000009G3l-3o70;
	Thu, 18 Dec 2025 22:22:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMNz-00000009Fzm-1DRI
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 22:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33C1144585;
	Thu, 18 Dec 2025 22:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3FB1C19424;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766096533;
	bh=ecT55mQ5jQmLe4fJOJS5l3F4aXRDMocOV0oybZ4c0f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vHkAvMRnQEcFvHLz+s/EFtzHw7xknpnY6wxYZdL+VRDfmSAIdjK8pCwdBi8KPE4Nj
	 9G8q8+vv9SE2YZH6uGpwDN3tc/ijj9nhLjnK914KhtSFmtSRAWC0WL+mNmMkDhWFno
	 BKGp0TKZueSrYFCgOrBRhguyVAeSQEKVwd3TLrQkHYLZ1WQRJsSImldZIJ0I4GYGX6
	 pTxIO2UFW/MVgO9JAvd84ACwCEQY9PYxFNcZ2euetqELNqwALCgDp5Y5mOZl2f3N5C
	 PfHIDZ3gaGaF7fiLsKNCbuf2zaXWO7d5uSMZhFSud6ugFh7VlIKFu4w3XXKkTlIrFE
	 Z00ygPjqeQC2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8D5D711CC;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 23:22:10 +0100
Subject: [PATCH v4 4/6] platform/surface: aggregator_registry: Add Surface
 Pro 11 (QCOM)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-surface-sp11-for-next-v4-4-7bcf83c1504a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766096532; l=1960;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=FteUVMAtphVq5N5dkiQ2DoFR0a2YpxFiVZJ5hRoKyAA=;
 b=oIkktteIQegddQqC+po2fGnJ5mS9LHU3QtetinS9rUK5SIBxwWC96p69L0TcV2FhqNvRyAF84
 9yL2elYAD4oCqFoAG84AyGYVFVuwSFkCbmdFfehmvGLV7guITNju975
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_142215_368484_62DF4B88 
X-CRM114-Status: UNSURE (   8.19  )
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

From: Dale Whinham <daleyo@gmail.com>

This enables support for the Qualcomm-based Surface Pro 11.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 78ac3a8fbb736384f7e50f1888a71297a892a7c3..0599d5adf02e61583cf3e1fc11000070f51f7be3 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group_sp9_5g[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro 11 (ARM/QCOM) */
+static const struct software_node *ssam_node_group_sp11[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_sensors,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_kip_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	&ssam_node_hid_sam_sensors,
+	&ssam_node_kip_tablet_switch,
+	NULL,
+};
+
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
 static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
@@ -482,6 +498,8 @@ MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
 static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	/* Surface Pro 9 5G (ARM/QCOM) */
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
+	/* Surface Pro 11 (ARM/QCOM) */
+	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },

-- 
2.47.3



