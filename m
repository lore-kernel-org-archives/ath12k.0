Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0FEC001DC
	for <ath12k@archiver.kernel.org>; Sun,  9 Jul 2023 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DedRI/OEqPJFo2AgVobl1Gbi9xbOYGQGrslVYy/49es=; b=HhL8dn/gpd+EXy
	FJdCgJV11jdNJXUU9mFoLmsRioybJ6fCk4zRshrAsNRcBwjxrWKBSgIRD29GVxVMzUJgYM6iXiMB7
	POeCeyaiBbssdqnP0B6BCgkFRx8qT/XXlBDrbfIZgKg7f69USxBoCFbv6ZZFrLhErHUvkFjnkvfq+
	AzGoIF4BuBktIJmsxMUNxUQ9jgM7eJ3tr9nXgIevDkVCpQ9e0mbF6lio82oyGf236p5J90GCnHD1l
	tc5PbfZyF6jx4oRR2Ro7T1bv2df54K7c+QNO87Uu0ZGCDoc+9eu41VQlK07EYJAYqDAOsoc0BCr/N
	/CrVBbF3hhmYadW9od4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW7B-009JKE-03
	for ath12k@archiver.kernel.org;
	Sun, 09 Jul 2023 15:14:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW78-009JJD-2c
	for ath12k@lists.infradead.org;
	Sun, 09 Jul 2023 15:14:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 877F060BCC;
	Sun,  9 Jul 2023 15:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAE5C433C8;
	Sun,  9 Jul 2023 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688915657;
	bh=/rno5ne+sKJjosGqkgyrU/dv8tH/5zQ/xDXZ8DfHoG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zl9I92LLgMIJjG/NJgCaeLwq9ABxATqiJhAzd5smam6mJ+i/G1INegNbR0trqoy5M
	 KhYiZO75p6dGhDjMbMFAeMNzAmcBP+I8UJ7sRVnB3+rz82+iEgYSzQZxf5RussCGyV
	 P40RIbZLqS0e6nV0FCpDHUAM4vLg5kKahI/rzLgL+jXrzX9R2kiEuv+8/pr2Bfgfjk
	 v9lgWog1jg1D7S8E50XCC2Bbpasrt+0Ax80ZOc3puLi7LYUOApRT8RwEqBGsBU/AZ5
	 +7UFeZiB9Xb4z4qU9QOONKJEzsifjoMzL8XkWfw2rX74dHnIP23gckNzFA1LpvEkEY
	 f6dJzhBC90qyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Balamurugan S <quic_bselvara@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 12/22] wifi: ath12k: Avoid NULL pointer access during management transmit cleanup
Date: Sun,  9 Jul 2023 11:13:46 -0400
Message-Id: <20230709151356.513279-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709151356.513279-1-sashal@kernel.org>
References: <20230709151356.513279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_081418_888317_A28A690F 
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
index bf7e5b6977b27..ff9f9c84129bc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4366,6 +4366,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_vif *arvif,
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
