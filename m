Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90019C47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 19:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfEXrqtKxMon7WsYkENMMQ8oauPJRlRSH5pE4gFrtas=; b=X9Nt+hrurYDFzA/Cu8MqpVeAsY
	Qvu2S4k0qjvzQfdJJWUcIE1jWx430j4Xpwkbd87uNk8c+el9lieSATSAujCYioYwNZ0CQg7uKYld2
	Wj5iPFgpAykh7+H4uL6EGw/2Nxj4DSbRdupe5XNrcMYk69XUC4jnSkHp+At+U6QcXIIw1YzOJ3s1k
	N5s1ELTP9pDHeC5WBc4G66lZS1yzbfS1IZVAb66jYLvTt8Srbw2bUG7tZWUZEkJFPsEOBCEvgbzdD
	1M3JiY7+TB6bslLzHqT6qOr6hP7tfR8JhI/9wgb58XCQtEKwFdZaieG5/4loJt+ray5Q971UZiwlE
	JYlw6/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpMV-00DBSE-0r
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 19:44:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpMR-00DBPq-1n
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 19:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDE9A6135E;
	Tue, 16 Jan 2024 19:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91248C433C7;
	Tue, 16 Jan 2024 19:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434244;
	bh=tb2mrvvH3u8Z9i2F+DENmnetOKkp98gyTkDoeWMA9J0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUnzjKmGX5dCwsPvcx27j5uUrMdWInNCKw6+m5IwPDY96eYZ1EfZ2Td8mykdE/e0T
	 6rvH6+ByeZDcMeuKMR0iyuuXzq3CMGmrIb5okufykqMomRoMlSL0vXVg5mMjFWyW3W
	 mn0sKNwg6p7adtCJZw0b/uxhWrniRpuXfsX2BYgh1v/7/jsoeQqy4139dDctwYeJkg
	 wmdN8w6LurBtrWp2HxxGcp8k+eUHhYyjTAHGCvrGVClNoYBQ4U9VPL3SVUpLg3dpgE
	 KWQJqbRjVShV5z51iHXhWgFc5tmURdyXFFWZkzfCVdQfl9zVLCKk+JzUOsvJDhVpTr
	 BBG6K5LulNsHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kang Yang <quic_kangyang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 040/108] wifi: ath12k: fix and enable AP mode for WCN7850
Date: Tue, 16 Jan 2024 14:39:06 -0500
Message-ID: <20240116194225.250921-40-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194225.250921-1-sashal@kernel.org>
References: <20240116194225.250921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_114435_683636_0EBA60F4 
X-CRM114-Status: GOOD (  11.63  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

[ Upstream commit ed7e818a7b501012038d6bc6fedadaf7375a380a ]

For AP mode, the peer is created earlier in ath12k_mac_op_add_interface() but
ath12k_mac_op_assign_vif_chanctx() will try to create peer again.  Then an
error will return which makes AP mode startup fail.

Kernel log:

[ 5017.665006] ath12k_pci 0000:04:00.0: failed to create peer after vdev start delay: -22

wpa_supplicant log:

Failed to set beacon parameters
Interface initialization failed
wls1: interface state UNINITIALIZED->DISABLED
wls1: AP-DISABLED
wls1: Unable to setup interface.
Failed to initialize AP interface
wls1: interface state DISABLED->DISABLED
wls1: AP-DISABLED

So fix this check and enable AP mode for WCN7850, as now AP mode works normally.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20231121022459.17209-1-quic_kangyang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hw.c  | 3 ++-
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 2245fb510ba2..b55cf33e37bd 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -949,7 +949,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.rx_mac_buf_ring = true,
 		.vdev_start_delay = true,
 
-		.interface_modes = BIT(NL80211_IFTYPE_STATION),
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP),
 		.supports_monitor = false,
 
 		.idle_ps = true,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fc0d14ea328e..b698e55a5b7b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6380,8 +6380,8 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	}
 
 	if (ab->hw_params->vdev_start_delay &&
-	    (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
-	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)) {
+	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
+	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {
 		param.vdev_id = arvif->vdev_id;
 		param.peer_type = WMI_PEER_TYPE_DEFAULT;
 		param.peer_addr = ar->mac_addr;
-- 
2.43.0


