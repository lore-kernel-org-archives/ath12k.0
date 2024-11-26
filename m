Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74D4D65533
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY4yLmykNyO21QCZ+RvnSCdkKzK6dKokz/WK/vqNq+8=; b=nr5F26n2AvyBJSyNgwbFjHPJcQ
	0ZVO4k/bbtkFBqQq4dedQC0E7/Itzb18cpTNovr/w2qZSClLKgOz7WkHsRbzzybpaje733ZwHMaZE
	fSipjMgQwebY/v7ZAo8/Y0jvJ7/64e3lunQ+XS8ALaga4nWrRc5awvVBmKRaX9yjVZd2Uax3hAUjA
	/xvCDPi+rENsnl+yw0Cq1gGnS3DdExeslpYtY5Gsg4MAZWYknyrol8M/PsEXLl4HNQZ5xUFk3lcLB
	9w6PDs6hxt3RaVCJ9zIOe90H+JYNC4h2mgonmDI2F1fdUOfGDj3CBgx9snvTRaLvWRazNiHFQ/lp+
	7TbKP1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6Q-0000000BGIG-2PSL
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6K-0000000BGDj-1Uex
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B9695C5C76
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111ECC4CECF;
	Tue, 26 Nov 2024 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641107;
	bh=VRIrU/lTFBp/KOyFr4YVshRzUtBzVvX3JA79bvSZD0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czZgD15gDwNMBIF+7EdNqhnE+1JD8Qk9+SPPfWqFnFfj3EioGZ62fOTNp25yGrWND
	 7jaEJuGSeO9dfOd1u5GpRzscSr+JBg7e82bUekZOWi1ngj5Hg9qHYIq0fKxQrRC0i+
	 vzcKQaPkZ/NGmAH7G7mLcbFuVbuE07e1J8TXPzyn3K1BQ/uLCcXosdYI9Slqbdmuk8
	 +iQJuQAqjq0NRotzOmnoHtJQXGviXaA7Ow/0PlfE9X7yaAGvZRySbEIo3VOd3IivhG
	 PN/cCvFPn5TYIMh5rJLnXEtpRYM52a9l3raPpJwskqMAc+hw5beXqg8HLSpi/FAF6u
	 hDFY0IXSMcKQw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 05/10] wifi: ath12k: ath12k_mac_station_add(): fix potential rx_stats leak
Date: Tue, 26 Nov 2024 19:11:34 +0200
Message-Id: <20241126171139.2350704-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091148_435579_EB619F55 
X-CRM114-Status: UNSURE (   7.48  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

If peer creation fails ar->rx_stats needs to be freed in error handling.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 428415237831..8287c2e6b765 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5308,6 +5308,8 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 
 free_peer:
 	ath12k_peer_delete(ar, arvif->vdev_id, arsta->addr);
+	kfree(arsta->rx_stats);
+	arsta->rx_stats = NULL;
 dec_num_station:
 	ath12k_mac_dec_num_stations(arvif, arsta);
 exit:
-- 
2.39.5


