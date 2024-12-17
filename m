Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D13E77188
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 20:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3c7sSxpf97s+PQjJ5c3t3ZIh0SN8P9jTV+G/wZbflw=; b=cBwFVS+4OP8r+G6LTkW/u4XEWK
	J9LHgTpKs48+2tVqAf8IK1y8rPPVKxBKgMS9X3WIc8nOM5mM/C7v50YeZFxsZtw7raP8LC5S/SYE8
	VxgEPPx6JfKKzO9k2WYs3/+Msn1jhoMB9jW+UKCP7OE00n8TU7DJQDBnXvYrSh1l8LfOVHS0Vu7X6
	yveof9wM+OTqhpWB43C2o+fr/9/+k5ZvSd4NemJzNzimS3oV/1I69qxGR9lVfKnsNiZmfrVPwyiMW
	iTV9ZioSjq4o0g8ctBZ9fGUlp4752Xrdtc8miYSodRuF60xSdgQfgEsw+Ehwro5w1mCLqi0LoWMaW
	J38E9wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9D-0000000EkHe-2MCO
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 20:26:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9B-0000000EkEx-0Cac
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 20:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0FE45C5956
	for <ath12k@lists.infradead.org>; Tue, 17 Dec 2024 20:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08203C4CED3;
	Tue, 17 Dec 2024 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734467184;
	bh=F/8ASNPPjOaxz0JijoyrX+VIjLjW8UFlW6ev+Y8FGTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1f67aaRc2+G2cWv7Q17OgeduFtKjphATL9FgXJQonasr3bN6IylUu+JOOZKsy5hg
	 XCx+ESMXTIAvMERTz4IjKNHlkmK7hNPoINqKNbQl7vVsHcgK3CEXIjs+zVrVm91mUI
	 c1pdh1dOVGT88OGUnnvx1O1Ksh3KECJKuKvEWeFFUGXJcgyqYh6PRx/lGpuL6EnZ6s
	 Nzt5rHvJNMONSsdLWxoCGoPpdOGAzoigOIl5zKOpIlw5AVMAAjeTWkvaLbDZftVUDe
	 ye8t8RfJZAQYKEOoTiaI3ZpbOnj9sL91xgWow1uoF3N8/RmqVESW8oAW9J58rH4Hdh
	 pmauThGAi5rNw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/4] wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage
Date: Tue, 17 Dec 2024 22:26:18 +0200
Message-Id: <20241217202618.1329312-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217202618.1329312-1-kvalo@kernel.org>
References: <20241217202618.1329312-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_122625_146130_DEBF4DE5 
X-CRM114-Status: GOOD (  11.84  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

Building the ath12k driver with llvm-18.1.7-x86_64 produces the warning:

drivers/net/wireless/ath/ath12k/mac.c:5606:12: warning: stack frame size (1176) exceeds limit (1024) in 'ath12k_mac_op_sta_state' [-Wframe-larger-than]

ath12k_mac_op_sta_state() itself does not consume much stack, but it
calls ath12k_mac_handle_link_sta_state() which in turn calls
ath12k_mac_station_add(). Since those are both static functions with
only one caller, it is suspected that these both get inlined, and
their stack usage is reported for ath12k_mac_op_sta_state().

A major contributor to the ath12k_mac_station_assoc() stack usage is:

	struct ath12k_wmi_peer_assoc_arg peer_arg;

Avoid the excess stack usage by dynamically allocating peer_arg
instead of declaring it on the stack.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 10293e9c1d49..6f10813d9378 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4834,7 +4834,6 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 {
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
-	struct ath12k_wmi_peer_assoc_arg peer_arg;
 	struct ieee80211_link_sta *link_sta;
 	int ret;
 	struct cfg80211_chan_def def;
@@ -4854,14 +4853,19 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 	band = def.chan->band;
 	mask = &arvif->bitrate_mask;
 
-	ath12k_peer_assoc_prepare(ar, arvif, arsta, &peer_arg, reassoc);
+	struct ath12k_wmi_peer_assoc_arg *peer_arg __free(kfree) =
+		kzalloc(sizeof(*peer_arg), GFP_KERNEL);
+	if (!peer_arg)
+		return -ENOMEM;
 
-	if (peer_arg.peer_nss < 1) {
+	ath12k_peer_assoc_prepare(ar, arvif, arsta, peer_arg, reassoc);
+
+	if (peer_arg->peer_nss < 1) {
 		ath12k_warn(ar->ab,
-			    "invalid peer NSS %d\n", peer_arg.peer_nss);
+			    "invalid peer NSS %d\n", peer_arg->peer_nss);
 		return -EINVAL;
 	}
-	ret = ath12k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
+	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
 			    arsta->addr, arvif->vdev_id, ret);
-- 
2.39.5


