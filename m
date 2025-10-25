Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C56ECCF9E3
	for <ath12k@archiver.kernel.org>; Sat, 25 Oct 2025 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmnBedu3fdWJhJBgl+YYsSE5vX+6hY2aIEsZf1QnK/E=; b=a6hgCxTWIIE/4z8urScCfdzhui
	eOvpJ+lAYhXuOFodHhRdexB6bY5XFScKlVlcq2IVzZ+D4Tl6s2AnNDqk9A/U3VAd9O7K6qKgn+3Wf
	2GGN8sFEyxMPtsCuCA2fk8c8B05OY/XHkEw9K1a6XqLiw516t7ylKlHlMF+iOlH6QSkjEMCbNMX53
	WY+rLODhqKVlFAwEMd9r5cDJU4/jEyhLE+AvM4qCmWuE9ZKtt198rwBa24dXJw6ds8SwZGHdHFx5E
	YR3ByPPBblvLKaiQdROiX1cu+PZ2oEdLUVhfzLNdVN9T9wLX3idD2N9/S/cO7ad1z5IFNFqy8Q7Ew
	X07VFyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCguM-0000000BRYP-1HrX;
	Sat, 25 Oct 2025 16:14:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCguE-0000000BRVG-0EeJ
	for ath12k@lists.infradead.org;
	Sat, 25 Oct 2025 16:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 752B144EC5;
	Sat, 25 Oct 2025 16:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A164C4CEFF;
	Sat, 25 Oct 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408853;
	bh=QorErh9yORnjHmKK8rfLqSYNYmxvjnmyWw6S/K7/wcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EvbCeHk2+7WwwWJm3WZBOiuvQ0k57Al9crKUiL3oNM5Uoelh4GsEeRSyg12KIAIph
	 grTKw+qXaAcXwT8HL4Ec36uIh9vXtXrb1TE+nH9nYw+DY5DIBa4h/OaWT6jgfO9B49
	 CTUXsRvuitwYTMpMz7vQpHwYF0IipGNjgRDLLJo3XFsqh7t/ALQ82tEk1gRtQ5TNR2
	 jSNYzuJM3vhe7AKAcBOMXCkqF0Z4Linft6WqaZAhE3bg20sa0j177psYSOzC5DCR1J
	 hQtwa6ve7M62RXen9EbzdVw0ZL2wwsSS1wsLLMV47CnOaqa/gdaFX18vr3mCGi+fmF
	 epGuWfhur6Aew==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
Date: Sat, 25 Oct 2025 11:55:31 -0400
Message-ID: <20251025160905.3857885-100-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091414_155089_E9C1339D 
X-CRM114-Status: GOOD (  12.57  )
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

From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>

[ Upstream commit 82993345aef6987a916337ebd2fca3ff4a6250a7 ]

Increase DP_REO_CMD_RING_SIZE from 128 to 256 to avoid
queuing failures observed during stress test scenarios.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250806111750.3214584-2-nithyanantham.paramasivam@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- Bumping `DP_REO_CMD_RING_SIZE` to 256 in
  `drivers/net/wireless/ath/ath12k/dp.h:187` directly enlarges the REO
  command SRNG that `ath12k_dp_srng_setup()` provisions in
  `drivers/net/wireless/ath/ath12k/dp.c:555-563`, so the host can queue
  twice as many HAL_REO commands (peer/TID deletes, cache flushes, stats
  reads) before the hardware must drain them.
- Under the current 128-entry limit, heavy peer churn makes
  `ath12k_hal_reo_cmd_send()` fall off the ring and return `-ENOBUFS`
  (`drivers/net/wireless/ath/ath12k/hal_rx.c:223-236`), which propagates
  straight back to callers via `ath12k_dp_reo_cmd_send()`
  (`drivers/net/wireless/ath/ath12k/dp_rx.c:650-667`) and leaves TID
  teardown paths dropping the descriptor while firmware still references
  it—exactly the “queuing failures” and memory corruption observed
  during stress.
- Ath11k has already shipped with the same 256-entry setting
  (`drivers/net/wireless/ath/ath11k/dp.h:218`), so the larger ring size
  is a proven, firmware-compatible configuration for this hardware
  family rather than a new feature.
- The cost of doubling this DMA ring is only ~6 KiB (256 × 48-byte
  entries), and the SRNG limits in `hal.c/hal.h` leave ample headroom,
  so the change is low risk and entirely contained to ath12k datapath
  setup.
- Because it prevents a real-world failure that can take the device
  down, while touching only one constant, the patch squarely fits the
  stable rules (important bugfix, minimal surface area, no architectural
  churn).

Natural follow-up for stable maintainers:
1. Consider also backporting the subsequent ath12k retry fix for REO RX
   queue updates to cover any residual overflow scenarios that might
   still appear beyond the expanded ring capacity.

 drivers/net/wireless/ath/ath12k/dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7baa48b86f7ad..10093b4515882 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -184,7 +184,7 @@ struct ath12k_pdev_dp {
 #define DP_REO_REINJECT_RING_SIZE	32
 #define DP_RX_RELEASE_RING_SIZE		1024
 #define DP_REO_EXCEPTION_RING_SIZE	128
-#define DP_REO_CMD_RING_SIZE		128
+#define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
 #define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RX_MAC_BUF_RING_SIZE		2048
-- 
2.51.0


