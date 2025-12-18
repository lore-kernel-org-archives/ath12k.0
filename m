Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60104D711C8
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSmMDvHbggP5/YyR6AXIlUTQdUf6+554AMwlY+BogLA=; b=TNu6wjpsTMJobXE2m4zTx/lWw0
	goy7tS9WRp1yrjcwpAtd9X/hI4rQ6zh/LSCxnrv9SFU24E+x3WrcCEAF9u9idtwnYMYZV2Ix0tGIg
	i6Q/dKQy4rSf8uzIbGj+xKqHmWX6Pdd9p/gil9gwl/QUrj6Pp0PZqej05D3J4fTM9VYr5hfvftVPL
	gbxu+bwGu6Td65NmK3xh2fiVH5PnF3Xzku2123lYjBaTCldwHZzCzIpeTL7gC3ARlzl8FOWSNZ6hY
	VQy/lsSirkhA9963qNWZXNH54Nn02DKZe6itNLXEEI2IQZ2cdJnmLF6AMUCHEGEluetaHjWejJitM
	+oqNY5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMNz-00000009G0n-3FGm;
	Thu, 18 Dec 2025 22:22:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMNz-00000009Fzj-04uH
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 22:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 058B260008;
	Thu, 18 Dec 2025 22:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0D96C4CEFB;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766096533;
	bh=+nZ/RachHicljKBPQvfPhRbpQ1Keo1pBWg9oFhJ+I6k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OT59e+CWQ355G20qB8xy9EP9tqNJ5i6Dwpruo/LGX/1VnFMlY1d2Nn4xYBw94JQYu
	 oL2J8UTT6YW53Y4p5ztUksht1GdQ8JKZDaIX/znGn+MWifXtug15GNS6L31zNPUjTY
	 s/jUlUDck0mzuiQiTVKdOc2vX93zeXIk/blbO5wH/FKq1Fi9nFVdXnsAlKaqdZHV1b
	 mmkjMeZ2hVq5ZqxyaFT/ZWn5VuKsF/uZ/0naqAaogr23DiDcYuN42PoYqhQXA51q5i
	 SIg7iLGkatGTHhNDB7+NTzYg/xJr5Af9KAi0KIo+H/K70DAaxytdxV+HCnN8IyG/0+
	 RLZoFmDmjeSVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC9CD6E2B7;
	Thu, 18 Dec 2025 22:22:13 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Subject: [PATCH v4 0/6] Microsoft Surface Pro 11 support
Date: Thu, 18 Dec 2025 23:22:06 +0100
Message-Id: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI9+RGkC/4WNQQ6CMBBFr0Jm7RjaCiWuvIdhUcoUJhFKWmwwh
 LtbuYDL95L//g6RAlOEe7FDoMSR/ZzhdinAjmYeCLnPDLKUlZCiwfgOzljCuAiBzgecaVuxljU
 pqZ3ulIK8XQI53s7us808clx9+Jw3Sf3sv2JSWGKjK+Os7nrV6ccwGX5drZ+gPY7jC6au+WO6A
 AAA
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
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766096532; l=3671;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=+nZ/RachHicljKBPQvfPhRbpQ1Keo1pBWg9oFhJ+I6k=;
 b=Ts8DMmqKv+jQy8DyxyYinIrcMYNaz8nT0TpG0iLgYoj+NlrG2OsZVKdbeyO0oAvzARhBH3bRr
 WsqU3KjfNncDLsT9kNq3mEM7vUF6RRr5U3n+Nrc/icdyvNneV1AX1MC
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
Dale Whinham (4):
      firmware: qcom: scm: allow QSEECOM on Surface Pro 11
      platform/surface: aggregator_registry: Add Surface Pro 11 (QCOM)
      arm64: dts: qcom: Add support for Surface Pro 11
      wifi: ath12k: Add support for disabling rfkill via devicetree

Jérôme de Bretagne (2):
      dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
      dt-bindings: wireless: ieee80211: Add disable-rfkill property

 Documentation/devicetree/bindings/arm/qcom.yaml    |   11 +
 .../bindings/net/wireless/ieee80211.yaml           |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |    4 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  | 1324 ++++++++++++++++++++
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |   20 +
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/net/wireless/ath/ath12k/core.c             |    3 +
 .../platform/surface/surface_aggregator_registry.c |   18 +
 9 files changed, 1403 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-surface-sp11-for-next-626e327f7b33

Best regards,
-- 
Jérôme de Bretagne <jerome.debretagne@gmail.com>



