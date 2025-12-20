Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF13E668BB
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3UXPRkvxrGOEdLUdnS09Yt05F/mwEuf3Tp929qd8hw=; b=jYKY3TwLMr5H6yHFRErEVbvJA/
	ARv6KlyIeryV+0ovda2LxTA0UdsQ2hIQTVG13tIvklBWaOFTxBmANT3TuKVJr/VrtKPs4P20XKJuR
	sgEb3cyamJ9sUZRJWS7ZCrKbdA5T/pDYfaNDOcyfuk3TGvjs+Z2v+FVqthMhtdLLEwIEfWFNqXvFU
	uUjUXQ44pZDEbUmWY9adQCqN5/gYh4abZ4FsopLDrRBUEJ3QKg+pTLO7jvOyhkL8y9LA0xDMwfSZq
	HMVHCagSvARGZOWap41UzfxYVdSQGS5JuEHpnNFg71Tt6LHgTK2yOthBQMqlLt1PLkTuNd19Hhsr3
	brqnK01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWys8-0000000Bgpm-3wNI;
	Sat, 20 Dec 2025 15:27:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWys7-0000000Bgod-1AXM
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 15:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B123260149;
	Sat, 20 Dec 2025 15:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CD8DC16AAE;
	Sat, 20 Dec 2025 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766244474;
	bh=DPZHoH7vOJ/r2CeJeriCWNUsS83oy/VS5P0MpcoRIXQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=onuPDWkImOyETCS/cs/8YjX53N9v4iTewrp1zpWoitZ3uu6T1qfhrGQa5dtvGsnJF
	 zS9NhM8IFj6cySgN+Z2710Psoym3sjMATSIs/V/GKTUpXilIY4UgEEed1yMhHRhDaB
	 mYhrwYtYrzKXpH/q39OuqP8t7ePlwn0sv4gJ+4cN+kEgy75ENvaX3ptRiAozKNCZxj
	 c39wEr2myeF8TSnr+avXBlb5Gbm5VndrvYbygrSg/bHxtjNavOgpwFK++CVWqAyIVK
	 JLfPSKUr8v4nSRnhVHbHuacr+R08nzzAAD+reQNnZTe478AAEnndUkcPUkSA97mtfp
	 ZcoVqG/7exoZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0E6E668BB;
	Sat, 20 Dec 2025 15:27:53 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Subject: [PATCH v6 0/4] Microsoft Surface Pro 11 support
Date: Sat, 20 Dec 2025 16:26:28 +0100
Message-Id: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACTARmkC/43NSwrDIBSF4a0Ex7X4iBo66j5KB2quidA80FRSQ
 vZek1EolHb4H7jfXVCE4CGiS7GgAMlHP/Q55KlAttV9A9jXuREjTFBGKxyfwWkLOI6UYjcE3MM
 8YckkcKacMpyjfDsGcH7e3ds9d+vjNITX/ibxbf0lJo4JrpTQzipTc6OuTaf942yHDm1iKv9Sy
 qwoY13FLRWk1J+KOCiMfFNEVqgkUhhwFTh+VNZ1fQN9AHowRgEAAA==
X-Change-ID: 20251218-surface-sp11-for-next-626e327f7b33
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
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766244471; l=4231;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=DPZHoH7vOJ/r2CeJeriCWNUsS83oy/VS5P0MpcoRIXQ=;
 b=QKadjW+4PC8FotW4AvCCGOY4/QyN7Ug8REPTA1QxIbDM8a2bs4972VohIFWuqLsQROKZ+l/uv
 Cyl7ERHj3fdCsLltxURtkIhvNtUAObFU/92jjm1F6IXUPrRzHJFIdV8
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

This series brings support for the Qualcomm-based Microsoft Surface
Pro 11 covering both the OLED and LCD variants.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
Changes in v6:
- Remove the disable-rfkill property and patches entirely from this patchset [Bryan, Krzysztof]
- Add the R-b: tag from Krzysztof for the denali compatibles
- Link to v5: https://lore.kernel.org/r/20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com

Changes in v5:
- Move the OLED variant description to keep the logical order [Krzysztof]
- Remove a T-b: tag as not applicable for a binding [Krzysztof]
- Remove another T-b: tag already covered by authorship [Krzysztof]
- Reference disable-rfkill in qcom,ath12k.yaml to fix dtbs_check failure [Krzysztof]
- Remove erroneously copied Copyright lines [Krzysztof]
- Add the R-b: tag from Dmitry for the aggregator_registry patch
- Link to v4: https://lore.kernel.org/r/20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com

Changes in v4:
- Re-order the denali entry in the aggregator_registry acpi_match table [Dmitry]
- Improve the bindings by splitting the LCD and OLED variants into 2 entries [Konrad]
- Enable i2c4 to make it accessible through i2c-tools [Konrad]
- Document the addresses for i2c0 and i2c4 like in romulus.dtsi [Konrad]
- Fix the clock-frequency for i2c0 based on DSDT/SSDT
- Drop i2c5 which is not found in the DSDT after double-checking
- Add the R-b: tag from Konrad for the SP11 device trees
- Link to v3: https://lore.kernel.org/r/20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com

Changes in v3:
- Update the compatible strings to document both the OLED and LCD variants
- Move the disable-rfkill property into ieee80211.yaml [Rob,Krzysztof]
- Reference commit c6a7c0b09d5f and detail the disable-rfkill patch description [Rob,Krzysztof]
- Switch to the renamed hamoa.dtsi and hamoa-pmics.dtsi [Dale]
- Improve the comments describing the 2 USB Type-C port location
- Update the speaker definition to describe only 2-speakers [Konrad]
- Drop output-low from the speaker definition [Konrad]
- Enable i2c0 to make it accessible through i2c-tools [Konrad]
- Delete a non-applicable comment about removable WLAN card [Konrad]
- Re-order a few nodes and fix indentation issues [Konrad]
- Squash one of the patches as suggested [Krzysztof]
- Drop the NAKed patch patch about a dpcd link rate quirk [Dmitry]
- Include the Reviewed-by: tags
- Link to v2: https://lore.kernel.org/all/20251201011457.17422-1-daleyo@gmail.com/

Changes in v2:
  - Dropped ATNA30DW01 patch as it was merged.
  - Split device tree into x1e (OLED)/x1p (LCD) specific *.dts files and move common code into x1-microsoft-denali.dtsi (patch 4).
  - Device tree now enables higher external monitor refresh rates/resolutions (patch 4).
  - Device tree now enables partially working audio output; requires alsa-ucm-conf and audioreach-topology definitions in userspace (patch 4).
  - Replaced 'Work around bogus maximum link rate' with a quirk-based approach (patch 5).
  - Improve the commit message about the disable-rfkill property in response to feedback (patch 6).

---
Dale Whinham (3):
      firmware: qcom: scm: allow QSEECOM on Surface Pro 11
      platform/surface: aggregator_registry: Add Surface Pro 11 (QCOM)
      arm64: dts: qcom: Add support for X1-based Surface Pro 11

Jérôme de Bretagne (1):
      dt-bindings: arm: qcom: Document Microsoft Surface Pro 11

 Documentation/devicetree/bindings/arm/qcom.yaml    |   11 +
 arch/arm64/boot/dts/qcom/Makefile                  |    4 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  | 1322 ++++++++++++++++++++
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |   19 +
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   15 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 .../platform/surface/surface_aggregator_registry.c |   18 +
 7 files changed, 1390 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-surface-sp11-for-next-626e327f7b33

Best regards,
-- 
Jérôme de Bretagne <jerome.debretagne@gmail.com>



