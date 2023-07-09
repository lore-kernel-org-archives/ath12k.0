Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744F4EB64DC
	for <ath12k@archiver.kernel.org>; Sun,  9 Jul 2023 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POCxPnhGL+vqBmJHyz7mSJryVd1GjOx8/e7rf0Z/LYM=; b=dNiaQi7SrWXcYU
	Uw8Q8XEbn9K801HTk2Hf7IpMZiEh4RbpN6f2ZWBXq1rwed6PyVwz/2v0Rt+gM6Ox84ueF+DNH4gcj
	6KiFWA0X2DT8GC+661wfCvMPCoC/vKit+spSgkbMm93nAyHrJMFY6LPbdhza0WNhJjXqcdOlQFVx1
	C5pqxlbJUgHmukZS0hBEFTEEeBZyg9RwyLnBrEVs20fUbpGIR5lGbrzOgITWhwgEoI383GxkHlRfa
	UzhzUbI/BFKg1hYfwYiOciJ7S4t/35dxnDH9yY4GCc29scIYt63zJP4SmE1AP6yk+97n5klId5Q1L
	hR4J+CuFucdBNmrmJ/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW6H-009J3y-0H
	for ath12k@archiver.kernel.org;
	Sun, 09 Jul 2023 15:13:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW6E-009J2d-1c
	for ath12k@lists.infradead.org;
	Sun, 09 Jul 2023 15:13:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 079EF60BFB;
	Sun,  9 Jul 2023 15:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2727C433CB;
	Sun,  9 Jul 2023 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688915601;
	bh=hCkuT5beDrZIJ2wWaJoikeQdkijfyUCkg38TlOIYmcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hyu5bWPWWVLc0a0WEwIDRW7/TxThstcwjoAbUiBWPsUveXh3wNWeiKTNS49bCfJ9v
	 vXj448JP4x99D2GpueaJ4d5vfJHt+j8WX+i0r/5ChB1Ubrhp/INWwSFZwI9GgG7znk
	 s7OTW9fzhtBirIhW99zvb0U8byxCPTTqweFgJgU8mDy3ynSJrg5BDjYFNprfe5fKmp
	 KvvvvYx/3TEQE28h8WHXg/KnO0d7KJiaqm/sJCVtflGir9amXfo3fNI/cNWM25uEg0
	 V0RXym/jb4hkmVb5qDytkt1FUtwp3cTVbnHdryoFBGaD5ZgruD+bmU44PXFSczs0++
	 OYU+e2tfp7Aqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Balamurugan S <quic_bselvara@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 15/26] wifi: ath12k: Avoid NULL pointer access during management transmit cleanup
Date: Sun,  9 Jul 2023 11:12:44 -0400
Message-Id: <20230709151255.512931-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709151255.512931-1-sashal@kernel.org>
References: <20230709151255.512931-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_081322_577407_3D8BCE6D 
X-CRM114-Status: UNSURE (   8.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Balamurugan S <quic_bselvara@quicinc.com>

[ Upstream commit 054b5580a36e435692c203c19abdcb9f7734320e ]

Currently 'ar' reference is not added in skb_cb.
Though this is generally not used during transmit completion
callbacks, on interface removal the remaining idr cleanup callback
uses the ar pointer from skb_cb from management txmgmt_idr. Hence fill them
during transmit call for proper usage to avoid NULL pointer dereference.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230518071046.14337-1-quic_bselvara@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ee792822b4113..58acfe8fdf8c0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4425,6 +4425,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_vif *arvif,
 	int buf_id;
 	int ret;
 
+	ATH12K_SKB_CB(skb)->ar = ar;
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH12K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
-- 
2.39.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
