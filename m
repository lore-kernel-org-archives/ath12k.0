Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FEAC47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVnhuqNk4Nnv/OamgtWZmlOlHcu0S4PmRfHsLYlxNJQ=; b=o5JxMcs69S3p0s1uQ8nfNShHrl
	7qtefCGZ6SprswBT1pXJjJbJFi8EGRBhWZUXfjI8yFzMCHg/jNpel2/zfGKcIb8f5NaW5sZEO5Pe6
	LuO52NVyTiiWcfPfvSGFYOsESdFwCfB8cPRoCzT6uiWvoVR1ip1a8k3LetOQ2IGqdK1Ayng8Pq6mL
	/lBbTNRfkYIDiQBzJIlN7B+zV4/gP1uF8vmtrx8pp3QivQomzCeAdIQ6HWDW0bR3PaxPFzHHB13oA
	TjpFzmzdhExVw4RcbJeT56Ybi3GtIO65aJnizUcT4ExihAl30VZ+e2lG0s+tY7DL/xVvc2vtjl8R1
	JQCTzQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpSN-00DEc5-2m
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 19:50:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpSK-00DEZ1-2F
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 19:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13A1BCE1B2F;
	Tue, 16 Jan 2024 19:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5CBC433C7;
	Tue, 16 Jan 2024 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434638;
	bh=4L2Yg17nT3lf/kfB50S/iKIEs1fFgB85bWpYDUqTJls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UdUZBdD67hr3jwwdgUB/5vscJB/LHWVAFlEgsnfdDkxt59CHvXF9x+eSaQ3XHAnnm
	 fo1Awug+pVsh7liOWB7eHbT+XtaSy4kEju7Up6KQudwRiHuZcp9KwqFYqGHTgpUgYY
	 GzP5VGARVRFli57H2JMdPuVtyqx9JlQ/z7VKEYQrKBoyhAarqdx7LzRRMh+gLT0eHi
	 6GsG2B/gusa1OQLnE2i9LvDK46Wlg1pTIVlfsqtxQhwOPwfMRGQhd4HZ0zNhH823X+
	 iFb5ce3qkV6WIZrYTpXaC4RkwRik41JUAg8iqK7AB8aEyk9p3ficEb2ALW7eQYTEzJ
	 u0cq5wOmsMztA==
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
Subject: [PATCH AUTOSEL 6.6 039/104] wifi: ath12k: fix and enable AP mode for WCN7850
Date: Tue, 16 Jan 2024 14:46:05 -0500
Message-ID: <20240116194908.253437-39-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194908.253437-1-sashal@kernel.org>
References: <20240116194908.253437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.12
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_115041_090613_8AA7A3CD 
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
index 5991cc91cd00..c1dcdd849f9d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -942,7 +942,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.rx_mac_buf_ring = true,
 		.vdev_start_delay = true,
 
-		.interface_modes = BIT(NL80211_IFTYPE_STATION),
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP),
 		.supports_monitor = false,
 
 		.idle_ps = true,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88346e66bb75..5434883eaf96 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6196,8 +6196,8 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
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


