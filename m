Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11368C5AD49
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 02:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aox2ROrXqDAoSfEHwCya3tW1oC1nAUm/t6u+3ncPGw=; b=gguxj6EMhO0Uyg/ikmgZF6TyvX
	pev42tKylGdFKgviCFMzayBgPsr4ky517kPWV+Td540ck2AyMFdIKhFQthOxBW1gNw9g4+//ZUHlV
	ufbAA+GCuvzncV2ZuKossgzT/MiQAp1T+zsSCt+DOx3LDuFx/pktECSP1JdLquU0vD/wjUljGrLj2
	FLPhfLEXfunMEGuUOcMFRUb6IRSe56cvLwNXBAuxGGUc739+M5FcRrTo/4qIybLCF4OFpbp7Kluy/
	FZeWMJNBfI0F8DAaREWro9vWlCrQl/a/407LO+VNMkOjcmtd1A7pZwoiz1SWuu4OUXfVNPIlUK5Hs
	KepyGTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdrY-0000000CJkj-3DnO;
	Wed, 04 Jun 2025 02:28:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcVZ-0000000C8Ba-0ESy
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 01:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6246CA4E11A;
	Wed,  4 Jun 2025 01:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E123C4CEED;
	Wed,  4 Jun 2025 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998892;
	bh=6dIKX7pi9s+rV1CG8MO/mvtQ0aEa8KrI3roiBtD+Rnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R8w9xEewhrug3iI1Rwod0rOJSPqP/LZx0qSfrAP4DdTzaUL54WdAXT7wfmhnAKyLF
	 T8wSlkIzai8kONjOQPv93Ohz9EOlJVb9WIcifs6ew2eaBxWq67yFBjfBPnW1zzlC9h
	 2M+eDnPcLHWO899ncaQMsNRwkirOe2amdBxsnRL2lzvscTiwWsHQJf0ehs+Iz38TQ8
	 hEMLP8t0jHcCl616WRKXH0XhxWRAaIDUazfHpLH88nDb+3tiLIvIwh2M3ZphNWxx+S
	 uohK6C6YoKd4xVmPgdSfXRyEJPoH49fF9H8jSdSJQEkBFZcJ6vEj72icgpTPuD10J7
	 rCpk32bTX7Tdw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sarika Sharma <quic_sarishar@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 72/93] wifi: ath12k: using msdu end descriptor to check for rx multicast packets
Date: Tue,  3 Jun 2025 20:58:58 -0400
Message-Id: <20250604005919.4191884-72-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180133_225178_BC98106B 
X-CRM114-Status: GOOD (  13.92  )
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

From: Sarika Sharma <quic_sarishar@quicinc.com>

[ Upstream commit cb7433cc5cd4d07175dbc41f5a19966e9fae48be ]

Currently, the RX multicast broadcast packet check is performed using
bit 15 from the info6 field of the MPDU start descriptor. This check
can also be done using bit 9 from the info5 field of the MSDU end
descriptor. However, in some scenarios multicast bit is not set when
fetched from MPDU start descriptor.
Therefore, checking the RX multicast broadcast packet from the MSDU
end descriptor is more reliable as it is per MSDU.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250411061523.859387-2-quic_sarishar@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

## Analysis and Recommendation **YES** - This commit should be
backported to stable kernel trees. ### Detailed Analysis: **1. Bug Fix
Nature:** The commit fixes a real bug where multicast/broadcast packet
detection is unreliable when using the MPDU start descriptor
(`RX_MPDU_START_INFO6_MCAST_BCAST` from `info6` field). The commit
message explicitly states "in some scenarios multicast bit is not set
when fetched from MPDU start descriptor." **2. Code Changes Analysis:**
The fix changes two functions in
`drivers/net/wireless/ath/ath12k/hal.c`: -
`ath12k_hw_qcn9274_rx_desc_is_da_mcbc()` -
`ath12k_hw_qcn9274_compact_rx_desc_is_da_mcbc()` Both change from
reading bit 15 of `mpdu_start.info6` to reading bit 9 of
`msdu_end.info5`, which is described as "more reliable as it is per
MSDU." **3. Impact Assessment:** - **User Impact**: Multicast/broadcast
packet misclassification can cause serious networking issues including
packet drops, incorrect routing, and potential security vulnerabilities
- **Scope**: Limited to ath12k QCN9274 hardware (a specific WiFi
chipset) - **Risk**: Very low risk - changes only the bit field being
read, using well-defined hardware descriptor fields **4. Backport
Suitability Criteria:** ✅ **Fixes important bug**: Incorrect
multicast/broadcast detection affects real user traffic ✅ **Small and
contained**: Only changes which bit field is read in two functions ✅
**No architectural changes**: Simple hardware register access change ✅
**Minimal regression risk**: Well-defined hardware fields with clear
semantics ✅ **Critical subsystem**: Network packet classification is
fundamental functionality ✅ **Clear side effects**: No complex side
effects beyond fixing the core issue **5. Comparison with Historical
Examples:** This is very similar to "Similar Commit #1" which was marked
"YES" for backporting. Both commits: - Fix incorrect multicast/broadcast
packet detection - Change which hardware descriptor field is used - Are
small, contained fixes - Have minimal regression risk **6. Technical
Justification:** The MSDU end descriptor is indeed more reliable for
per-MSDU information as stated in the commit message. The MPDU start
descriptor contains MPDU-level information which may not accurately
reflect the multicast/broadcast status of individual MSDUs within an
aggregated frame. **7. Testing and Validation:** The commit includes
"Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1"
showing it has been validated on the target hardware. This is a clear,
well-justified bug fix that meets all criteria for stable tree
backporting with minimal risk and clear benefit to users with affected
hardware.

 drivers/net/wireless/ath/ath12k/hal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index ca04bfae8bdcc..9a37e1b25aa9d 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -449,8 +449,8 @@ static u8 *ath12k_hw_qcn9274_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
 
 static bool ath12k_hw_qcn9274_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
 {
-	return __le32_to_cpu(desc->u.qcn9274.mpdu_start.info6) &
-	       RX_MPDU_START_INFO6_MCAST_BCAST;
+	return __le16_to_cpu(desc->u.qcn9274.msdu_end.info5) &
+	       RX_MSDU_END_INFO5_DA_IS_MCBC;
 }
 
 static void ath12k_hw_qcn9274_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
@@ -908,8 +908,8 @@ static u8 *ath12k_hw_qcn9274_compact_rx_desc_mpdu_start_addr2(struct hal_rx_desc
 
 static bool ath12k_hw_qcn9274_compact_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
 {
-	return __le32_to_cpu(desc->u.qcn9274_compact.mpdu_start.info6) &
-	       RX_MPDU_START_INFO6_MCAST_BCAST;
+	return __le16_to_cpu(desc->u.qcn9274_compact.msdu_end.info5) &
+	       RX_MSDU_END_INFO5_DA_IS_MCBC;
 }
 
 static void ath12k_hw_qcn9274_compact_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
-- 
2.39.5


