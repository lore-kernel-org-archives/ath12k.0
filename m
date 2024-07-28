Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81328C3DA61
	for <ath12k@archiver.kernel.org>; Sun, 28 Jul 2024 00:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpwPvhyBtDnP1kIvVqvjtOxHF5ogsJxp5aXBVrXziPk=; b=VEBGzS2D5P2EX/yV1G7+D/Zswc
	2n2bJyZUCzeQYymFK/a9Stsa/yaGPh2BET6PLnUr3gAVKjFatWvQGmu/LEXCiphW65WM7vXb26EZ8
	cMchylDHeiX7GF73r6v1ULMiv443PKu0pzGhb3YpW3okraTGIToYuEHkVy2NurjKSsOZDQ55SvEH8
	q2YfAStUWiNUXyMt1c9BAsP8ytTr0DooisvI4f5LwnH9GTPcVMPU15MVpQZYz7EzRMtI9HB0+Epsq
	OOWCfD6DF1eP4DFjst/aaMzuXVXgv1rGwTqCm38Td1WAVm1nZG9cmzqMc5ZdbD0jsKS1zGTXviatm
	cIjSJKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXsBb-00000007axR-0vKF
	for ath12k@archiver.kernel.org;
	Sun, 28 Jul 2024 00:54:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXsBY-00000007aw4-2zQD
	for ath12k@lists.infradead.org;
	Sun, 28 Jul 2024 00:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE067CE0921;
	Sun, 28 Jul 2024 00:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17F4C4AF0E;
	Sun, 28 Jul 2024 00:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722128089;
	bh=UFjFLGyWMrNDUcEKM4QvLGE1aXNITIWrX5TYMzsTATw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBufl0blouI9ulLRK6WumMOCzyhapaB5MDpVlDJkzfKzofYHbbfF17DaaQON7sXMj
	 w42ddZlL6vXU8e9kMZo5LJrbhNEItVJTCnnhFSMOP/ec5bap9I5utUfJrD4Vke4naS
	 tIGzAeJYd7i3y1P8vahfeKMwqSPaCiwzxGQ1400xxYF6j12yHTHx3F9rkUUFpCFIq3
	 Gcvmwa6IWIO4RrVKYHheu2/hhZYSd9x3NhGve4qez5FLMbTDiYedRzDEYviBItBpjo
	 IGmCwmmYXAWLw6+qU6B7eOtXBTiewTO4JXHUTPm65GFJuNy4utgH5OBNirEwRsY4zT
	 j4RKp+zwyzZxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 03/15] wifi: ath12k: fix memory leak in ath12k_dp_rx_peer_frag_setup()
Date: Sat, 27 Jul 2024 20:54:24 -0400
Message-ID: <20240728005442.1729384-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728005442.1729384-1-sashal@kernel.org>
References: <20240728005442.1729384-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_175452_998306_2568FCE5 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 3d60041543189438cd1b03a1fa40ff6681c77970 ]

Currently the resource allocated by crypto_alloc_shash() is not
freed in case ath12k_peer_find() fails, resulting in memory leak.

Add crypto_free_shash() to fix it.

This is found during code review, compile tested only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240526124226.24661-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index dbcbe7e0cd2a7..a5b6e2e078d33 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2756,6 +2756,7 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 	peer = ath12k_peer_find(ab, vdev_id, peer_mac);
 	if (!peer) {
 		spin_unlock_bh(&ab->base_lock);
+		crypto_free_shash(tfm);
 		ath12k_warn(ab, "failed to find the peer to set up fragment info\n");
 		return -ENOENT;
 	}
-- 
2.43.0


