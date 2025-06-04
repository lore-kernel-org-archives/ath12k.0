Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46514C5B559
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 02:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPm2o1HFRN9LunraDjFx4FxYIEJ+aS6cGLPdC4moFy8=; b=0/dNKkru0oUGHpxqIBDIKIOCvf
	gAHdhko1HgD+3ROlvyNLJjV5e66RllfTlEDWJ7fUaeffQ44mnGp1aaXeFcaP8D9J/YdRN1fjUu+jf
	EYsAO/PfvEJqsM47DVKAAdXxbUb4dzZ98LiHMEh8IHhjOIv/+RHkXTqV3wbGcMfYKe+B5oaFI57cn
	fQU2Yfl5BJDEIxtNAkDt47mJ9g9q/4IsiTo22Y7MQtO6Qyp8lMKaUcrt5xHiGt9QBT/QxGZukbJ9F
	Zh+pEEvtc+hFKQfw5FQUAGodFTvcywofE9/NnpyTmWz+yxU+pTPqdeSnIHlR1Q21WaXVTBThD+ipp
	EPHdV/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdRx-0000000CGaP-4BxV;
	Wed, 04 Jun 2025 02:01:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcT6-0000000C7iV-36dE
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 00:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E612437E6;
	Wed,  4 Jun 2025 00:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4235AC4CEF3;
	Wed,  4 Jun 2025 00:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998740;
	bh=zemsLguPAb7fCtLEDOcp1Rg6535WxhNw5HNB5S54dKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMwPVVxRFDSXJMEl4mFJW6sKP0nd+YCDJzhce8rIIceKuNyMLzUvH/SftHg/+zopo
	 fOyVDemwQXjgRvU0rdvT2JFTzft74SaVAcwP2AdvwK5WvGpGEIFu4bn9P+IIFRZ+1a
	 o46ALuWlZNKT982MXT7iEctxLdmey3V2+ojYIEkABF0ny6wtJzCuYBLBraEKO76zNa
	 /fXQUCtPiATE0Bo6cMSQxjVinfqt1TeyOn03tT+zP8vussgtQOWReNb1Row0a8+GqG
	 h628B8vgukyDXv+GRTkLmnpnAJ3YGWYxq2/wA6jY0OX6OeML7zICxNBmmK+SZ3jLWI
	 oEMX//HNpaozQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>,
	Muna Sinada <muna.sinada@oss.qualcomm.com>,
	Mahendran P <quic_mahep@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 103/108] wifi: ath12k: Fix memory leak due to multiple rx_stats allocation
Date: Tue,  3 Jun 2025 20:55:26 -0400
Message-Id: <20250604005531.4178547-103-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175900_822121_71B148DF 
X-CRM114-Status: GOOD (  18.81  )
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

From: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>

[ Upstream commit c426497fa2055c8005196922e7d29c41d7e0948a ]

rx_stats for each arsta is allocated when adding a station.
arsta->rx_stats will be freed when a station is removed.

Redundant allocations are occurring when the same station is added
multiple times. This causes ath12k_mac_station_add() to be called
multiple times, and rx_stats is allocated each time. As a result there
is memory leaks.

Prevent multiple allocations of rx_stats when ath12k_mac_station_add()
is called repeatedly by checking if rx_stats is already allocated
before allocating again. Allocate arsta->rx_stats if arsta->rx_stats
is NULL respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
Reviewed-by: Mahendran P <quic_mahep@quicinc.com>
Link: https://patch.msgid.link/20250326213538.2214194-1-muna.sinada@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Analysis of the Commit ### 1. Nature of the
Bug Fix This commit fixes a **memory leak** in the ath12k WiFi driver.
The specific issue is that `rx_stats` memory is allocated every time
`ath12k_mac_station_add()` is called, but when the same station is added
multiple times, it creates redundant allocations without freeing the
previous allocation, leading to memory leaks. ### 2. Code Changes
Analysis The fix is **minimal and surgical**: **Before the fix:** ```c
arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL); if
(!arsta->rx_stats) { ret = -ENOMEM; goto dec_num_station; } ``` **After
the fix:** ```c if (!arsta->rx_stats) { arsta->rx_stats =
kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL); if (!arsta->rx_stats) {
ret = -ENOMEM; goto dec_num_station; } } ``` The change simply adds a
NULL check before allocation, ensuring memory is only allocated if
`arsta->rx_stats` is NULL. ### 3. Risk Assessment - **Low Risk**: The
change is a simple conditional check that prevents redundant allocations
- **No Architectural Changes**: The fix doesn't alter any fundamental
driver behavior or data structures - **Contained**: The change is
localized to a single function and doesn't affect other subsystems -
**No New Features**: This is purely a bugfix with no new functionality
### 4. Comparison with Similar Commits Looking at the provided similar
commits, this follows the exact same pattern as **approved backport
candidates**: - **Similar Commit #2 (YES)**: "Fix memory leak in rx_desc
and tx_desc" - Similar memory leak fix - **Similar Commit #3 (YES)**:
"fix tx_stats memory leak" - Identical pattern fixing stats memory leak
in ath10k - **Similar Commit #4 (YES)**: "fix memory leak in WMI
firmware stats" - Memory leak fix in ath11k - **Similar Commit #5
(YES)**: "fix memory leak in ath12k_dp_rx_peer_frag_setup()" - Memory
leak fix in ath12k All these approved commits share the same
characteristics: - Fix memory leaks in wireless drivers - Make minimal,
surgical changes - Have low regression risk - Address real user-
affecting bugs ### 5. User Impact Memory leaks can cause: - System
memory exhaustion over time - Degraded system performance - Potential
system instability in resource-constrained environments - Affects users
with ath12k hardware (QCN9274, WCN7850 as mentioned in testing) ### 6.
Testing Evidence The commit includes comprehensive testing on real
hardware: - QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
- WCN7850 hw2.0 PCI
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 ### 7. Stable Tree
Compliance This commit perfectly fits stable tree criteria: - ✅ Fixes an
important bug (memory leak) - ✅ No new features introduced - ✅ No
architectural changes - ✅ Minimal risk of regression - ✅ Confined to a
specific driver subsystem - ✅ Clear, well-documented fix ### 8. Code
Context Verification From examining the kernel tree, I confirmed: - The
function `ath12k_mac_station_add()` can indeed be called multiple times
(from state transitions and link assignment) - Proper error handling
exists with `kfree(arsta->rx_stats)` in the cleanup paths - The fix
addresses a real scenario where station addition can happen multiple
times This is a textbook example of a commit that should be backported:
it fixes a real memory leak bug with a minimal, low-risk change that
follows established patterns for successful backports in the wireless
subsystem.

 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b06836525e2c4..cb807061fe11f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5457,10 +5457,13 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 			    ar->max_num_stations);
 		goto exit;
 	}
-	arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
+
 	if (!arsta->rx_stats) {
-		ret = -ENOMEM;
-		goto dec_num_station;
+		arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
+		if (!arsta->rx_stats) {
+			ret = -ENOMEM;
+			goto dec_num_station;
+		}
 	}
 
 	peer_param.vdev_id = arvif->vdev_id;
-- 
2.39.5


