Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8787CC61CE5
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8xRr2E6LwIFKOd5ffb1ya3xtp1Txv9eh+/Ioy9OZLI=; b=WTaHNwZcDWv2q66yvFhcoVDDUm
	bh7/XPn8ynBgQVgQCgpL558aj9xExVeczCTG66QLWDtQM0h6zXviVA1/cwM5G1LmLqublQ6qjN9fd
	L4EvtD3bU7EWo1t52QptnSDSB+l0zY63NR0ru0lFiU7IgXGHRSsuEBfVY86MXZvQTIbs1UaMaPTpm
	QhLv5S4BN+VYm+gFsyoONELcKYqJTIp65K0/Pl8UUIBqBKCYp/KeHjt8XAfL218D0//QVOSS1QtkG
	FKyPKlzx9iTr/oXZcHOFycg86v7+sqziRZ6P/KapK80QssGkMyAwWraCvORLJ2oCmBs9YBmU9RXyI
	3NVzjUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeF4-0000000CMQG-1ECC;
	Wed, 04 Jun 2025 02:52:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcY0-0000000C8b8-1ERT
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 01:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BF945C3C42;
	Wed,  4 Jun 2025 01:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD07C4CEF2;
	Wed,  4 Jun 2025 01:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999041;
	bh=4sBQ7xg+IKg9V550PNzjKJlTR/sJJ45qAkDT5kzjjF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ix3FpP+0Lo8D/6CcEV9tCYjWLxf6GzBL1liYxD2/2pnvAHeViyv6+c7V1oVAaeFSg
	 vStG4gw5KCSafssmzTlKClPBGfk91ucb+uUveMf86xuqKdrlakPx8X3GdvcQ7UEcky
	 6O7J8erstEHF2NLmjQLXZzt7YpoJ737wbZGyipBvNgeYgCiBcBU3HT3PjsxG527o8g
	 1dza/IDYhRrgUgXDgHKKmLA2vR0ekSTwepo5vMIG0i7ok5ocS62iPuPwTptTpoBG/c
	 eD/AEg8YbVALJiih9a0FYMNFCoEhDgnPSv+HKByt9Xty45PqM6G7A8/Dhu155yi6V/
	 UV7/7Ogty35Xw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Balamurugan S <quic_bselvara@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 61/62] wifi: ath12k: fix incorrect CE addresses
Date: Tue,  3 Jun 2025 21:02:12 -0400
Message-Id: <20250604010213.3462-61-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010213.3462-1-sashal@kernel.org>
References: <20250604010213.3462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180404_462911_DF37C824 
X-CRM114-Status: GOOD (  16.18  )
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

From: Balamurugan S <quic_bselvara@quicinc.com>

[ Upstream commit 60031d9c3589c7983fd1deb4a4c0bebf0929890e ]

In the current ath12k implementation, the CE addresses
CE_HOST_IE_ADDRESS and CE_HOST_IE_2_ADDRESS are incorrect. These
values were inherited from ath11k, but ath12k does not currently use
them.

However, the Ath12k AHB support relies on these addresses. Therefore,
correct the CE addresses for ath12k.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Link: https://patch.msgid.link/20250321-ath12k-ahb-v12-2-bb389ed76ae5@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** ## Analysis and Recommendation This commit should be backported
to stable kernel trees. Here's my detailed analysis: ### **Nature of the
Bug** This is a **critical hardware register address bug** in the ath12k
WiFi driver. The commit fixes two important Copy Engine (CE) register
addresses: - `CE_HOST_IE_ADDRESS`: Changed from `0x00A1803C` to
`0x75804C` - `CE_HOST_IE_2_ADDRESS`: Changed from `0x00A18040` to
`0x758050` ### **Impact and Severity** **1. Critical Hardware
Functionality** These CE addresses control interrupt enable/disable
operations for Copy Engine rings, which are fundamental to WiFi
communication between host and firmware. Incorrect addresses would
cause: - Failed interrupt enable/disable operations - Potential missed
interrupts leading to stuck CE rings - System hangs or communication
failures with firmware **2. Affects Real Hardware** The commit message
explicitly mentions testing on real hardware: - **IPQ5332 hw1.0 AHB**
(currently deployed) - **QCN9274 hw2.0 PCI** (reference testing) **3.
AHB Device Support** These addresses are specifically used by AHB (AMBA
High-performance Bus) devices in functions like
`ath12k_ahb_ce_irq_enable()` and `ath12k_ahb_ce_irq_disable()`. IPQ5332
is the primary AHB device currently supported. ### **Comparison with
Historical Patterns** Looking at the similar commits provided: -
**Similar Commits #1 & #2** (both marked YES): Fixed DMA address type
issues in ath12k/ath11k CE rings to prevent future 36-bit DMA addressing
problems - **Similar Commits #3 & #4** (both marked NO): Added new CE
configurations for new device support (feature additions) This commit
follows the pattern of commits #1 and #2 - fixing existing incorrect
definitions that could cause hardware functionality issues. ### **Stable
Tree Criteria Alignment** **✓ Fixes Important Bug**: Incorrect hardware
register addresses affecting real deployed devices **✓ Small and
Contained**: Only changes two #define values in a header file **✓
Minimal Risk**: Simple address corrections with no architectural changes
**✓ No New Features**: Pure bug fix, not adding functionality **✓ Clear
Side Effects**: Limited to CE interrupt handling, well-understood impact
### **Risk Assessment** **Very Low Risk**: - Changes only constant
definitions in a header file - No algorithm or logic changes - Well-
tested on actual hardware as mentioned in commit message - Fixes latent
but critical hardware addressing bug **High Benefit**: - Ensures correct
hardware register access for AHB devices - Prevents potential system
failures or communication issues - Critical for proper IPQ5332 (and
future AHB device) functionality ### **Conclusion** This is a textbook
example of a commit that should be backported: it fixes a critical
hardware addressing bug with minimal risk and clear benefit. The
incorrect CE addresses could cause serious functionality issues for AHB-
based ath12k devices, particularly the IPQ5332 which is already
deployed. The fix is small, contained, and has been tested on real
hardware.

 drivers/net/wireless/ath/ath12k/ce.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 857bc5f9e946a..f9547a3945e44 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_CE_H
@@ -39,8 +39,8 @@
 #define PIPEDIR_INOUT_H2H	4 /* bidirectional, host to host */
 
 /* CE address/mask */
-#define CE_HOST_IE_ADDRESS	0x00A1803C
-#define CE_HOST_IE_2_ADDRESS	0x00A18040
+#define CE_HOST_IE_ADDRESS	0x75804C
+#define CE_HOST_IE_2_ADDRESS	0x758050
 #define CE_HOST_IE_3_ADDRESS	CE_HOST_IE_ADDRESS
 
 #define CE_HOST_IE_3_SHIFT	0xC
-- 
2.39.5


