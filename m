Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5A7C5AE59
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 01:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPOI+cdS9xMlRmzJ7o8EeC/KgiP+ezOyISILgNsUPIA=; b=NhXKFox1i/Escv8gti7aLQ7b9M
	vKNSK+N2WVQ/42oBIz++R1I9B392A/0Ru8JAuGVLf1Wy3PRe8XDccuVAITRBC5o9BHUFq8J/oc+fS
	tFE7d+ErQTE28+lLXvqI9WLdSioMpdnM1P1P8wDwgwBqcZEtPneoMRuJ2hdjbw7xrI6TBcZcLsQxO
	JfW90vfz1dvsDfI7GsragD+nsS1ZMGQGsfCVnzUgU+XmNb1RO33CQDt0r17XBw59KirtHMdPPLcIm
	I9u2glyAcyyTqjHhT4yAw0DZLgilOjrLRqPskR/YlREZPm6tUqvQzi8zOUwXT9Ue/MRInFNCDYi+K
	2Eoe8ekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcth-0000000CByC-1rMZ;
	Wed, 04 Jun 2025 01:26:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcOi-0000000C6rz-2Ji6
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 00:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E197A61127;
	Wed,  4 Jun 2025 00:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92094C4CEED;
	Wed,  4 Jun 2025 00:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998467;
	bh=3J8L0Q40gmipmisNs5hullFuYFpPyGB12ZhWNN3xADM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0eXpDJgMeTnmEMHXK0NAIsYf0HPf7A3zp3hleOmHu0COzWJ6UZw0Hga/BTYzsor9
	 IQrqY3tsfvbworElCxRwGMmjGzQ8x86Te8pIZy//2PODEZ35pvVuBe2YaEv41xW7vW
	 PxTXLzGA2LtLU0NA6YoRCHQFfLf5RMepS7SeQNrRKIZeO1iKHGKkiW5Y2rziZ5jJre
	 DLjMZspDow3el7nB8JOihfOaUt5uS/jSX3Syiex0XSjPBSSWd7RDhPpeBjxbv+GGOq
	 A2unzmnaZit487eEp+dSlClFzPiqlWlz286Gmn8jS22Qqd/O3nEVHf4SXfdDjg84aF
	 j3Cef84mOBlBg==
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
Subject: [PATCH AUTOSEL 6.15 091/118] wifi: ath12k: using msdu end descriptor to check for rx multicast packets
Date: Tue,  3 Jun 2025 20:50:22 -0400
Message-Id: <20250604005049.4147522-91-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
index cd59ff8e6c7b0..42dd4cab7f258 100644
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


