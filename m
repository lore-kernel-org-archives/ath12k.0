Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF9606A321
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E5Xyi25T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COvsspfp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uq1Gorfc4ciPJpLem2ymwbvMgrQlRjuouNWvatl3268=; b=E5Xyi25Tfi3H3ivI/bCB0x5pKu
	n6ryS1iH8QUdaQbu0u2QzBspnARh3vxB60pMnliHv/Rfly+Ccirk+zVyZ4n+iTN7O5SS6Og7ao7tJ
	b0YhTL0GdmBVsP8V1ryjBBfNj7W5bRgTZ5AarFpNbWrTHqcn86D+BOHV90ULajpPZX2z+gwHnK8nr
	H76WUfSNMd19S5Y41k2BBppWCRXcD/gcWud6yWmPTXuh74THTmcdF++gf2A9LmqY8MoPU8Mc3xBWa
	GUmzbmUcpNhiTg352AgD+jD5LYuYn9jxLZnlaAZiL9w2XJVoBtfUp8hetOzlhHQ6QwFGyAgU1d67R
	3N+7yZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCWH-00000007LUt-41sf;
	Wed, 11 Nov 2026 17:54:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCWG-00000007LUR-0p8I
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 17:54:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC7A444F65;
	Wed, 11 Nov 2026 17:53:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794419639;
	b=Iwn6WMUlbCPXhWY4pwRsOSxo+27vLktt7Y6Li19WhZylcQxR/DqAY4y2esFtq4oavF4V
	 QvXlOhrF8Kt7Da3yQ8tjnf0wDJAxF4B6lsTSg2Q8TyMofbYlZA5oy5UXGc0PMccQ+UsCQ
	 3QLu9tKlMvqT6sTPdXFwkXOZFCFz9wLRqNqsdg1/nkXtu6rUOSPqv2RpbKTz1OWaIykt1
	 LrdrsoNcotvvUA8jlspNIRNfXjyNOXEyUICT7VQQlIhsAJFDoiHvIzAI+5QzUFIYBxPxD
	 PVLdt2/V5MC669mmnkhu7hCiyYUIwtBRRqKsteRfUE5hi3dBWqx3JaJNOEEVRFJEdlQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794419639;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uq1Gorfc4ciPJpLem2ymwbvMgrQlRjuouNWvatl3268=;
	b=MDUpoGNuc7avlKzDVqZuWd/jZpDC0FnxOpvskrvJ+WMKx5iyttlOcwW2cRkc+IgykXaD
	 mAdhMqodrJ+aJO33jAUDyw78/aAM3ZRR5xP1ihGfNib4NrmMcIvcOKgC+ayrdJR/HCB5A
	 nL2RD43V1eat9h0jUhM81vlE3lcUS/6fwnnV2a1jsnmisyNevdWVSMaPFhsAz3azgTkBR
	 IHjF0wNnSd9h8K4lprfF35RcYnx/Ri2IpPes6Wd54CGiocpsemmag0tF+2Dt3+FVrpXRN
	 5Aruw6BVYOqeslpRVo73BVfbqWvNBYcerrqZxUF4430aR20hAiq1l59QkqRDxNeUCCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E25A31F00A05;
	Wed, 11 Nov 2026 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419639;
	bh=uq1Gorfc4ciPJpLem2ymwbvMgrQlRjuouNWvatl3268=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=COvsspfpZ5mNOFlFi96trZQGWQJvTV/iSE9P2kLr8em7UlrIrxsLvdpnWCuxBUpZ8
	 J92sZ3AGQLSSbNzM4/fCKRsBoe2iPGdUYm4vqiCnc7k/OmmJO1DJeKd9Cv3WKzm88M
	 KBCZzkMFxgNcWRKC3RmFusUx0IIP9CKeOZa91cU1vBf4we1UEHB4CHLisbmDdPjwxi
	 gJ0Nijq0gg+MwnUkLUiLlvlr7zODkLrcP3k1J6OIxXqbulGbaubPI0MEvMnNtdYK+v
	 /IRXcMS5lemNq+ZedT0ycx5iX6CleHDTBXgYOH/QoMCSN/sY/PgsMUt1gSQ37sPyAv
	 VluRik+4mERPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 39FC04901D;
	Wed, 11 Nov 2026 17:53:58 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 11:53:58 -0600
Subject: [PATCH ath-next] wifi: ath12k: stop a running station vdev before
 starting it again
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-ath12k-sta-vdev-start-once-v1-1-a01ed78d5460@gmail.com>
X-B4-Tracking: v=1; b=H4sIALWr9GoC/yWMwQqDMBBEf0X23IUkNCL9ldJDGjd1W4gl2QZB/
 PeuOqd5DPNWqFSYKty6FQo1rjxnBXvpIE4hvwh5VAZnXG81GGSy7oNVAraR2l6K4Jwjoe8Hk4x
 P/jokUMG3UOLlkN9Bf5hpEXicS/093xRld8O2/QFG75JjiAAAAA==
X-Change-ID: 20261111-ath12k-sta-vdev-start-once-5680f05f548f
To: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Kang Yang <kang.yang@oss.qualcomm.com>, Birk Skyum <birk.skyum@pm.me>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419637; l=7666;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=l2LS9+T8qV8NYnA/lIgTTemFYDi2ceLGxFaTVuPBUcw=;
 b=cFc035yZthsCIT/0FQxznEnY8NvaWI3Ocs7j2puvt6/R4RtIzJkmvrW8Xa8hR3hRPX7ZsFqqm
 YJHjdu0cUBQCdIdjOvNL4BBUeVUaRvap6lFS0+y91iQPCKEt6WT18Q9
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

A station vdev is not stopped when mac80211 unassigns its channel
context. Since commit c9e4e41e71ff ("wifi: ath12k: move peer delete
after vdev stop of station for WCN7850") it is stopped when the BSS
peer is removed instead, so that firmware gets the vdev stop before
the peer delete. ath12k_mac_op_unassign_vif_chanctx() still clears
is_started for it, and nothing else records that the vdev is running
in firmware.

mac80211 can move a station to another channel context while the BSS
peer exists. It does so between authentication and association when
it associates with a narrower width than it authenticated with, for
example when a station with EHT disabled (wpa_supplicant disable_eht=1)
connects to an AP operating EHT at 320 MHz: authentication runs on a
320 MHz channel context, association on a 160 MHz one. The vdev was
started for the first context (by ath12k_mac_op_assign_vif_chanctx(),
or when the peer was created on hardware with vdev_start_delay), and
ath12k_mac_op_assign_vif_chanctx() starts it again for the second one.
Firmware gets a second vdev start with no stop in between, and
ar->num_started_vdevs counts the vdev twice. The stop on disconnect
takes only one of the two back.

Since commit 18ae7d0cdd76 ("wifi: ath12k: Avoid CPU busy-wait by
handling VDEV_STAT and BCN_STAT"), ath12k_wmi_fw_stats_process()
completes a WMI_REQUEST_VDEV_STAT request only after one stats event
for each started vdev. With the count too high that never happens:
from then on every station statistics request that needs the beacon
RSSI waits the full 3 seconds in ath12k_mac_get_fw_stats() with the
wiphy lock held, logs "time out while waiting for fw stats done" and
reports no signal, until the driver is reloaded.

Record in each link vif whether its vdev is running in firmware.
ath12k_mac_vdev_start() now stops a vdev that is still running before
it starts it, as ath12k_mac_update_vif_chan() already does for a vdev
that is not up, and ath12k_mac_vdev_stop() takes a vdev out of
num_started_vdevs only if it was running. Firmware then sees start,
stop and start for such a connection, and the vdev is counted once.
AP vdevs are still stopped on unassign, so in practice only station
vdevs take the new stop.

This was found by tracing ath12k_mac_vdev_start_restart(),
ath12k_mac_vdev_stop() and the mac80211 channel context and station
state trace events on a WCN7850 station: the first HE connection
(disable_eht=1) to an EHT 320 MHz AP after the driver was loaded
started the vdev twice, and the timeouts began right after it.

The change and this message were written with Claude, an AI coding
assistant.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: c9e4e41e71ff ("wifi: ath12k: move peer delete after vdev stop of station for WCN7850")
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
There are two ways ar->num_started_vdevs ends up too high. The other
one, counting a vdev restart as a start, is the one Baochen diagnosed
in Mike Garuccio's report [1] and that Birk Skyum's pending patch [2]
fixes. This patch fixes only the station case described above and does
not touch the line [2] changes, so it applies to ath-next with or
without [2].

How it was tested. The station was a Quectel NCM865 (WCN7850) on
Ubuntu's 7.3.0-1004-oem kernel, with ath12k built from that kernel's
source, connecting on 6 GHz to a RUCKUS R670 that runs EHT at 320 MHz.
Without the change, the first connection with disable_eht=1 started
the timeouts, one every 3 seconds, until the module was reloaded. With
the change, six cycles of EHT, HE and EHT connections (13 in all) and
20 more EHT reconnects gave no timeout, and every station query
returned a signal value in about 10 ms. Tracing showed start, stop and
start for each HE connection, one start for each EHT connection, and
one stop for each disconnect.

The build tested on hardware was one change for both cases: this
station part, written slightly differently, plus a restart part with
the same effect as [2]. With [2] and this patch applied, the code
behaves the same way. On ath-next this exact patch is compile-tested
only (x86_64, W=1, with and without [2]).

[1] https://lore.kernel.org/all/f9d0a06d-b7b0-4e51-8173-c53104c2a096@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261020213505.31624-1-birk.skyum@pm.me/

The change and this message were written, and the tests run, with
Claude, an AI coding assistant.
---
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b033599..1c0cdf75a22bb 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -330,6 +330,8 @@ struct ath12k_link_vif {
 
 	bool is_created;
 	bool is_started;
+	/* vdev is running in firmware and counted in ar->num_started_vdevs */
+	bool vdev_started;
 	bool is_up;
 	u8 bssid[ETH_ALEN];
 	struct cfg80211_bitrate_mask bitrate_mask;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3be..65486383ea9f1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1565,9 +1565,12 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif)
 		goto err;
 	}
 
-	WARN_ON(ar->num_started_vdevs == 0);
+	if (arvif->vdev_started) {
+		arvif->vdev_started = false;
+		WARN_ON(ar->num_started_vdevs == 0);
+		ar->num_started_vdevs--;
+	}
 
-	ar->num_started_vdevs--;
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "vdev %pM stopped, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
 
@@ -10722,6 +10725,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 err:
 	arvif->is_created = false;
+	arvif->vdev_started = false;
 	arvif->ar = NULL;
 	return ret;
 }
@@ -11032,6 +11036,7 @@ static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arv
 
 	/* TODO: recal traffic pause state based on the available vdevs */
 	arvif->is_created = false;
+	arvif->vdev_started = false;
 	arvif->ar = NULL;
 
 	return ret;
@@ -11544,7 +11549,30 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 static int ath12k_mac_vdev_start(struct ath12k_link_vif *arvif,
 				 struct ieee80211_chanctx_conf *ctx)
 {
-	return ath12k_mac_vdev_start_restart(arvif, ctx, false);
+	int ret;
+
+	/* A station vdev is stopped when its BSS peer is removed, not when
+	 * its channel context is unassigned. If mac80211 moves the station
+	 * to another channel context while the peer exists, the vdev is
+	 * still running here: stop it before starting it again, so that
+	 * firmware does not get a second start and the vdev is counted once.
+	 */
+	if (arvif->vdev_started) {
+		ath12k_dbg(arvif->ar->ab, ATH12K_DBG_MAC,
+			   "vdev %d still running, stopping it before start\n",
+			   arvif->vdev_id);
+		ret = ath12k_mac_vdev_stop(arvif);
+		if (ret)
+			return ret;
+	}
+
+	ret = ath12k_mac_vdev_start_restart(arvif, ctx, false);
+	if (ret)
+		return ret;
+
+	arvif->vdev_started = true;
+
+	return 0;
 }
 
 static int ath12k_mac_vdev_restart(struct ath12k_link_vif *arvif,

---
base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
change-id: 20261111-ath12k-sta-vdev-start-once-5680f05f548f

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



