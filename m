Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E572BC5AE59
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 01:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJJWMLhBtdWmB9s0x1vubV7ToOFl2/0s3DbdV/yufIc=; b=Dbr7QvvejwrBV0453i5SJCoNoy
	b2RiXWZC5MtHRbCbgMA0E9XUzpivR4BRcyqM2uD8ferzuFeva1QYwT/Nd27VPXT2I9327F7Xs9sU1
	VMLutOY/d0w5A5Xfs7DKUPB0BptzU13LFL/Ti15NeQM4pqJf73ToPZEN6OP0UIKpLrslhezIAIOmV
	QH3eWKcuQdScxaz0kUEvoCoJms+jicaIrNQOpAfjJNotyXbhhLq2gZBN1zLsW+eTBFEcL8LwlMKDA
	fSpIc6Uf7bTJGdV4NsLiRP/GCWpu9v58yPllKu7tA9je7vmoxGGPCOTwLFDgc/uT6q+NV2BpXURuq
	tHhyocbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcgr-0000000C9zK-2jEa;
	Wed, 04 Jun 2025 01:13:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcMF-0000000C6R3-3L1M
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 00:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E40E61120;
	Wed,  4 Jun 2025 00:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3188C4CEEF;
	Wed,  4 Jun 2025 00:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998314;
	bh=BY/A9ozJ7BX+EZdswgcU06eCQ0oVz7x68wZ0s+Cavt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFRhzALC4hPTW14YGZ+yxxYttf+nBmssr6Q4dyiASbYthc9SZW4a9JFnHGlRMwAZf
	 rCcXZalSM3m5W2u+JpX/QYwc2Wr8LiEkpsbtU6bZWzXu9ZiYu+kpozwHjO8O1gAqyj
	 zzYrvzPuPQ/+3i8xeXBwL3Hp3a1Y+xfq/o58xFu937ezHt990BZGvDfIIV84u8gCd1
	 CZmOCfEj8WwHq90SdD+TiFwW+nFL4a1zA6dqyQf9X7tW8XtIQ8u+LK/cmsyXD/b9nK
	 hHyEVZ+TUq2u3/GE4+auWLoK1D4zkAzXrc8XD6tpqPsN9h9GE3ePMy5Iyd45cdg4Ac
	 qMI5LTk814jNA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 030/118] wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
Date: Tue,  3 Jun 2025 20:49:21 -0400
Message-Id: <20250604005049.4147522-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Kang Yang <kang.yang@oss.qualcomm.com>

[ Upstream commit a69bbf89d751ba2d6da21d773c4e29c91c5e53c4 ]

Currently, HAL_RX_MSDU_PKT_LENGTH_GET uses u32_get_bits to obtain the
MSDU length from the MSDU description.

This is not right. Because all halphy descriptions are little endian.

So use le32_get_bits for HAL_RX_MSDU_PKT_LENGTH_GET.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250421023444.1778-9-kang.yang@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees as it
fixes a critical endianness bug that can cause data corruption and
system crashes. ## Analysis ### Nature of the Bug This is a **critical
endianness bug fix**, not a feature enhancement. The commit changes
`HAL_RX_MSDU_PKT_LENGTH_GET` from using `u32_get_bits` to
`le32_get_bits`. The issue is that the underlying data structure
`rx_msdu_desc` has `info0` declared as `__le32` (little-endian), but the
macro was treating it as native-endian. ### Critical Impact Areas **1.
Memory Safety & Data Corruption:** - The macro extracts MSDU (MAC
Service Data Unit) packet lengths from hardware descriptors - On big-
endian systems, `u32_get_bits` vs `le32_get_bits` would extract
completely wrong values - These incorrect lengths are used for buffer
bounds checking and memory allocation operations - This could lead to
buffer overflows, memory corruption, or kernel crashes **2. Cross-
Architecture Compatibility:** - This bug would manifest on big-endian
architectures (ARM BE, MIPS BE, PowerPC) - x86/x86_64 systems wouldn't
notice the bug due to little-endian architecture - The ath12k driver
supports multiple hardware variants that require correct endian handling
**3. Hardware Descriptor Consistency:** - Analysis shows the ath12k
driver predominantly uses `le32_get_bits` (287 instances vs 242
`u32_get_bits`) - All hardware-specific MSDU length extraction
consistently uses little-endian operations - The `struct rx_msdu_desc`
explicitly marks `info0` as `__le32`, confirming hardware uses little-
endian format ### Comparison with Similar Commits All the reference
commits marked "NO" were either: - Feature additions (A-MSDU indication
improvements) - Structural definition updates - Hardware descriptor
format corrections This commit differs fundamentally - it's fixing
actual data corruption that could cause crashes. ### Backporting
Justification - **Fixes user-affecting bug**: System crashes and data
corruption on big-endian systems - **Small and contained**: Single line
change with clear, targeted fix - **No architectural changes**: Only
corrects endianness handling - **Minimal regression risk**: Aligns code
with actual hardware behavior - **Critical subsystem**: Network packet
processing is core functionality This endianness bug represents exactly
the type of critical, low-risk fix that stable trees are designed to
address.

 drivers/net/wireless/ath/ath12k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 3e8983b85de86..3cef1e4cd163d 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -707,7 +707,7 @@ enum hal_rx_msdu_desc_reo_dest_ind {
 #define RX_MSDU_DESC_INFO0_DECAP_FORMAT		GENMASK(30, 29)
 
 #define HAL_RX_MSDU_PKT_LENGTH_GET(val)		\
-	(u32_get_bits((val), RX_MSDU_DESC_INFO0_MSDU_LENGTH))
+	(le32_get_bits((val), RX_MSDU_DESC_INFO0_MSDU_LENGTH))
 
 struct rx_msdu_desc {
 	__le32 info0;
-- 
2.39.5


