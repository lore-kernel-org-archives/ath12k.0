Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2188C61CE5
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSr80GIKhTAaEQv4h43bDNCEM+XLOvMlqnT4p4RDJI4=; b=AI6+fZMo7Re2KMHzL4nssAgyTC
	X4nXW9IDnUmmy9yMbiEmdUxDMAfAjiaunVV40I4VokIv6VgLhd15LayoTVJkOzd0GmR0Z31TeC3Zi
	TSIdE9QvDFholvs0Vkh+ApoTCfIY0XwOsRl/ZB8uuhwXzA4O2PBKdHw9Yg7gEE+gxQwKVSqOiob3/
	zf4wFZV+9WEowxerZGmI+tk7AxHiG5jJmz7DBnbq6UX90SzWxTsntndhZqhxNY+doPLmp/E/JMexA
	dEDCCMxW62N4060Bn6bx921riZ+tGyzfa2lIgkU1vwTbIEDoH9TmZskuu0aFtyQasgoZv/+5Uzu9r
	I81gfTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdPr-0000000CGIp-2w4Y;
	Wed, 04 Jun 2025 01:59:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcSi-0000000C7f4-13kk
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 00:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FF90A4FE57;
	Wed,  4 Jun 2025 00:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033EFC4CEED;
	Wed,  4 Jun 2025 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998715;
	bh=rllyiizw4Vl1rE7sKb0gX1RRxUDN/4o5xHqC7anyD5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKu8VFieOBn7VQSKWWJ2BKe3gd/+jLEOt+xk+EQc8MoPn+IGWOfU7JRyHojJ7HB5v
	 iZmb7bpLulxqyTmpwQtjrwzo8EK01jnpPCRppQd5kngHdo+VOyRaJIlemnix2fQ9Tu
	 Q5QAggFSkeH1chaZ2TXr1oFgwqkkccgiVZQ4rkbWEM68vbMvi0/PcixReDKlXy6+mG
	 zV1BFeAvMYXvprylhc5pKLWtfUrC0fpyRMNOt50eZwVUkdGGwmhuMEecLSHP386MQm
	 hwGSPxZkL27+xL6fYPu0zpzzLqXh8w/uVdvncbgcmZjSHgeSXtRqJ/DtCU9uJM8MgM
	 7dpzK9j/QvTvQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 089/108] wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
Date: Tue,  3 Jun 2025 20:55:12 -0400
Message-Id: <20250604005531.4178547-89-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175836_434659_D23C0FA8 
X-CRM114-Status: GOOD (  17.70  )
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

From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

[ Upstream commit dce7aec6b1f74b0a46b901ab8de1f7bd0515f733 ]

With hardware grouping, during reboot, whenever a device is removed, it
powers down itself and all its partner devices in the same group. Now this
is done by all devices and hence there is multiple power down for devices
and hence the following error messages can be seen:

ath12k_pci 0002:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0002:01:00.0: failed to set mhi state: POWER_OFF(3)
ath12k_pci 0002:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
ath12k_pci 0002:01:00.0: failed to set mhi state: DEINIT(1)
ath12k_pci 0003:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0003:01:00.0: failed to set mhi state: POWER_OFF(3)
ath12k_pci 0003:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
ath12k_pci 0003:01:00.0: failed to set mhi state: DEINIT(1)
ath12k_pci 0004:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0004:01:00.0: failed to set mhi state: POWER_OFF(3)

To prevent this, check if the ATH12K_PCI_FLAG_INIT_DONE flag is already
set before powering down. If it is set, it indicates that another partner
device has already performed the power down, and this device can skip this
step.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250408-fix_reboot_issues_with_hw_grouping-v4-3-95e7bf048595@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the surrounding kernel code, here
is my assessment: **YES** This commit should be backported to stable
kernel trees. ## Detailed Analysis **The Bug Being Fixed:** The commit
addresses a specific issue with hardware grouping in ath12k WiFi devices
where multiple power-down operations during reboot cause MHI (Modem Host
Interface) state transition errors. The error messages show failed
attempts to set MHI state to POWER_OFF(3) and DEINIT(1) when the current
state is already 0x0, indicating the device has already been powered
down. **Code Changes Analysis:** The fix is extremely minimal and
surgical - it adds only 3 lines of code: ```c if
(!test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags)) return; ``` This
check is added at the beginning of `ath12k_pci_power_down()` function at
line 1491-1492. The logic is sound: 1. **ATH12K_PCI_FLAG_INIT_DONE**
flag is set in `ath12k_pci_start()` (line 1170) when the device is
properly initialized 2. **The flag is cleared** in
`ath12k_pci_power_down()` (line 1500) after successful power down 3.
**The new check** prevents redundant power-down operations by returning
early if the flag is already cleared (meaning device was already powered
down) **Why This Qualifies for Backporting:** 1. **Clear Bug Fix**: The
commit directly addresses user-visible error messages during system
reboot - a clear operational issue affecting stability. 2. **Minimal
Risk**: The change is extremely contained (3 lines) and only affects the
power-down path. It doesn't introduce new functionality or architectural
changes. 3. **Hardware-Specific Issue**: This affects specific WiFi
hardware (QCN9274, WCN7850) that users may have in stable kernel
configurations. 4. **Similar Pattern**: Looking at the similar commits,
commit #2 (ath11k IRQ affinity fix) and commit #4 (MHI PCI shutdown
callback) were both marked as YES for backporting. They share similar
characteristics: - Small, targeted fixes - Address shutdown/reboot
issues - Minimal code changes - Clear problem resolution 5. **Race
Condition Fix**: This addresses a race condition where multiple devices
in a hardware group try to power down simultaneously, which is a classic
stability issue suitable for stable trees. 6. **Low Regression Risk**:
The change only adds an early return condition based on an existing flag
that's already used throughout the codebase for the same purpose -
tracking initialization state. **Supporting Evidence from Code:** - The
`ATH12K_PCI_FLAG_INIT_DONE` flag is already used consistently throughout
the driver to track device state - The MHI error handling code shows
these are expected error paths that should be avoided (lines 529, 607 in
mhi.c) - The commit includes proper testing on multiple hardware
variants This is a textbook example of a stable-tree appropriate fix:
small, targeted, fixes a clear user-impacting bug, with minimal
regression risk.

 drivers/net/wireless/ath/ath12k/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 895b2314d1d58..98bd9039d8d43 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1491,6 +1491,9 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
+	if (!test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags))
+		return;
+
 	/* restore aspm in case firmware bootup fails */
 	ath12k_pci_aspm_restore(ab_pci);
 
-- 
2.39.5


