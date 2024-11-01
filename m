Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41022E6F066
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B27riu2pxl3BbEXWaMcV2T0cmp1Gs7cV8ibtNmNN6s8=; b=roJIKkk4vlfNBLzMa3VoLbUuR6
	C8XZNz0SeS5qO/CMQQu37yOhhE0NdfdFMFFtqhCsufAXdhfHs3hcDbBFSuHcrS5xHiXK3MLfGdSwm
	GMxF0pmGNJBPEQexSQJuN4TUdLg1ksronTaOeJllCqPO/EqSzdtLb6QMjuEbk1ksC1j9GqVuPO7dP
	FuyFrZM88lXFbLHHbCY/LMQPK6O6zom1Miy6b510Vvw7fWmqKMEx7Lse2ZYj3UmUfXBCJSNOS3KMU
	iWYeK92BAJ7NNH6O/wTJrYo+3wRoSnD+b+8mU/LD7RniLLcMjtVKVLZZnN0/LI9W5L/okrpi0/gTH
	7S/ZuYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOi-00000007TYa-43cY
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 15:17:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOf-00000007TX4-3iSm
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 15:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61985A443CF
	for <ath12k@lists.infradead.org>; Fri,  1 Nov 2024 15:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082CFC4CED1;
	Fri,  1 Nov 2024 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730474228;
	bh=cI45HBk6KyHpqGnCdeXtWbhky1ba9wmHtnNGv1+4u5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzFD0tti8Oeu0TxjMgYZ1acIzfeffD8LYsgULjbxs+Z9YEfhP1ml3riObSv4ja+X5
	 6rHSdSuNt0EFxZK+QnWbRaWU1xFQL8Dyr7cT5jLsBBr/a8YE3DhQ+vSgR5hW+bVt0x
	 7P9MUOsm17wMsfOq4zEH5JmtKBt+jUoQozhoAdoVkObYf+EImpVw+v4k89Pj1W3ddj
	 Wdb3f175DCdaO2Ubg5PJ6Z0V2e9kTNY8t+Fxip5z1WP3cKZfKduAOEmz1aR34MDcb/
	 7lSy6GVzNszyzKHzT2/KwhPOBm3fxH81o/bORIxUFQ+J/Ijg4SHiSFgdUM01c2jlmh
	 1NUlRprb1x+NA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/8] wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
Date: Fri,  1 Nov 2024 17:16:58 +0200
Message-Id: <20241101151705.165987-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101151705.165987-1-kvalo@kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_081710_017207_DFB08EDE 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

In commit 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal
for MLO") I had accidentally left one personal TODO comment about using goto
instead of ret. Switch to use goto to be consistent with the error handling in
the function.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f5f96a8b1d61..7dd2b66d3386 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7047,8 +7047,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						       arvif->bssid);
 		if (ret)
-			/* KVALO: why not goto err? */
-			return ret;
+			goto err_vdev_del;
 
 		ar->num_peers--;
 	}
-- 
2.39.5


