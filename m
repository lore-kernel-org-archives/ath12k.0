Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE6606A326
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1CX1y5wx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emGD02vN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RBmIUHu80SKW/VRZZOQILzfNjSh0opGCQpCY4Xr/Iro=; b=1CX1y5wxTQODb2uGXiWxwFePVg
	DtIDz5sAbZtDyGs/4w3mkEihqJFc7RnBOzA/JsD0/1KhW9b9ISBYtiPtPnasjE2K544Jpi1CpAoHJ
	fyNOnPGmuO3MPD8WHeJ7DKJgKWG73aZCkZfX1miMsVfaSmqghB/CurUQpCgUZDMmJSjSfC5IMikh2
	pC4hfFmJWurGS33dG3UVMDr9s3DqBw2e+8WlFXXnteocc1QANcbK99zwn0loIdrX6j9BMlEx4gaA7
	MWEaPAGSN5MfxpuSD2fZ2T0AkZ/6nUVDVQtZIdckQniANfVf8AxZR4B0Nd+UGfrcdyNGrR8ea1i9R
	rLrHjimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1xc-0000000A5iW-1SUs;
	Thu, 05 Nov 2026 18:13:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wp-0000000A5Ov-1d0Y;
	Thu, 05 Nov 2026 18:12:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 884866015B;
	Thu,  5 Nov 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902346;
	b=kpIdHWFLN3BaiGkRhCD0ULSGc4ACkhLVLRmOP7nHivfUTm1SZfNzDjmW4zJx4AG71+Wx
	 cIF+BbxaxhxOxMTWPlMTuufLAZRacOyw1t9vONxLxg4Av9GIpFXtSaVEdKalGc5Z5jYQf
	 u4ZhGWDqoHx+foc0syKuCPhfSlwfoT+O78YWDaYZFAk+TD+AzPE6N/gSmvI43JeAwsa4v
	 y5f6rXx2KlhxFrq8v9UM1osDwLKivAMiFj8GoItFqsLr3XGCMwqS/j0vcXBZnxNJUpZCo
	 L03epXk+SR15pbvAVbITmRXRMAPBRlAJTQMqBUwz8eA27TMJAIYGntmBYtu+ASSIBmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902346;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RBmIUHu80SKW/VRZZOQILzfNjSh0opGCQpCY4Xr/Iro=;
	b=Gq+hJZgu6kmk6ZrcmXnHJXSdK4sw5AAaDcBJpv2YBOV9WdGIQXrSjV143Au689YRH2qf
	 h0ZsbMJ3Aflm3SSgLBBvEUJnIZa+3uauO4IPZWBoWXETiZLsNy1+Ey4xsX8ZOVPVwpv8v
	 Hpg6ERrnq4o8trcUloazOAgpD2sk7noexK9wRu/K5dpucNIk8fLLOJ7g3p13hZ3A8TmKP
	 lN9ML2Ckbc4Lh0ZX1Qyq2wKvGEmPRdNd+E2XU7xgtnRAtGomVtsBwCUTfAtDFxleGlrZN
	 gykovnEM05ZxADLAk54x4E0Abw3E8eAedrvn66WIGjK2zeXAg9/73qrk5pLTfTPvnfQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5596F1F00A02;
	Thu,  5 Nov 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902346;
	bh=RBmIUHu80SKW/VRZZOQILzfNjSh0opGCQpCY4Xr/Iro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=emGD02vNyJCJzMnOiHyU/utHrxC8U1zW81e6NyQwwo707uthChZ7oN7HOReNfOEMQ
	 qox7ko5uygsPSWunmnseSvz+Yp7znq+HLqVY30PR0kZzmfz6CUi7KjUYL+KvwzT7so
	 wmU3MO1uOCN9FvALHbeiWxDU2/2byoJI8DxLugS8DJvmIX27Lg3z02jg2JX/pEa/24
	 MmhSK7AJCQaugefeNBfRk6RIDyf+lRe7RG2nOC0nHgbUZ5LVDXE/v6O3hGCxw6UbKJ
	 /5Gt62GYfBCTZPGoB/nzxl/yTORFVmxKiS6Vazu9zCmOcCU5MoRuJ++MHZCP6fOoow
	 T8S5yuIeUboHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DDFA4473C8;
	Thu,  5 Nov 2026 18:12:24 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 12:12:23 -0600
Subject: [PATCH 2/2] wifi: ath12k: don't leave a monitor link started when
 its stop fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath-monitor-unassign-v1-2-277f0fbadb91@gmail.com>
References: <20261105-ath-monitor-unassign-v1-0-277f0fbadb91@gmail.com>
In-Reply-To: <20261105-ath-monitor-unassign-v1-0-277f0fbadb91@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 P Praneesh <quic_ppranees@quicinc.com>, 
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, 
 Wen Gong <quic_wgong@quicinc.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 ath12k@lists.infradead.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902344; l=1783;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=yJliLnA52UPk6OOcZziqgLXylvHUHFJud+o6Dahzovo=;
 b=RtI+6f08VIMKSgrwalriN0ZtZkc2Iu2Qe8TRHTrgj/6k40N7JIbH5s21SSzcD4HAbUzPEHa4p
 VaHljDdHCQgAdHgfZS9xoqenVGZJOZd07I55M5njTRLZWP7jChamzqJ
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath12k_mac_op_unassign_vif_chanctx() returns early, with
arvif->is_started still set, when ath12k_mac_monitor_stop() fails.
mac80211 can't fail an unassignment and considers the channel context
released, so the link's next assignment hits WARN_ON(arvif->is_started)
in ath12k_mac_op_assign_vif_chanctx() and fails with -EBUSY. A firmware
crash during a monitor channel change is enough: the vdev stop times
out.

ath11k has the same flow and shows the warning that way on a QCN9074.

Fall through to the common path, which clears is_started.
ath12k_mac_monitor_stop() already warns on failure.

Compile-tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fd3841f71b71..7d04f16f99e37 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12422,13 +12422,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	WARN_ON(!arvif->is_started);
 
-	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
-		ret = ath12k_mac_monitor_stop(ar);
-		if (ret)
-			return;
-
-		arvif->is_started = false;
-	}
+	/* mac80211 can't fail an unassignment, so the link counts as stopped
+	 * below even if the monitor stop fails (that warns on its own).
+	 */
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
+		ath12k_mac_monitor_stop(ar);
 
 	if (ahvif->vdev_type != WMI_VDEV_TYPE_STA &&
 	    ahvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {

-- 
2.43.0



