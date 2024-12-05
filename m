Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808FFE77173
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJQSREIbi2Sn3JnLWtNstBMDYL/GZsgvypLbagfXO4A=; b=p0IEjCIhNYQmBYh1fK1tb1Akjj
	5YSLCPh6PUo8DUWwo1klx8AiPeVW6xAM/EHIIjxqFTwdChWulrJzmn16ZAIn/fmElEi2/qcgZNyBe
	07G0QVX5W/VXklWkvJz/C6gWvEp9PTgEMS8JfiTUeA84fprwpJRmjf/6x74caz8ORNyQsLIDp+Lib
	e+KhptkhEK74axFRPVyC6oLDkg0GSlYgytk+vGtx8Zjzz+zWshnoBciOtaF0QZQkualr3RxNdkHzx
	sk4mKK40s0rBKe1uZo1KHETpVTZJJuHsYG1kzpAd9GxOQgCNKSZDsjJpb7a02YyFQwynkYNyDWg7y
	slpU9FuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIV3-0000000HJV3-0qDL
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 20:31:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIV0-0000000HJSs-3Rog
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 20:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10A305C5A89
	for <ath12k@lists.infradead.org>; Thu,  5 Dec 2024 20:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD5AC4CED1;
	Thu,  5 Dec 2024 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733430657;
	bh=ZM8zjJkGa/qRK0XshDVNYNacIug+9Bt5JFORjs69WfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sGRqz3ySDoEV2GM/Qt4WdcJP39s3fzt1XzMcXp+vk6xbyUFJyOypzjZ58AwsEGyN0
	 i0a+savx4tURdAIcBOnmQObAgMaz3CiErLpO5Mg0WK90uNaxfNi2sR6hbIitPYaDtt
	 6Jsi3OZ/17bPZYYP6/dAgGViftYI5W+t9BaZQdq5zciDz9yE8krKAzQ/Dvj9j/NPHJ
	 RaV3TWottPbqTTCsxrzi6QoEwFQy8RGfCt0tFSnWA0hdICbVU2j2nKzuuFEZqTGjY1
	 RDuXmiNbs+U448V0iyq2+D8T8ICV8165Q8woIskZnpjrE60hiC+GxEYZnahC6LteRP
	 tFKMOUVAs1Z3w==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 8/8] wifi: ath12k: avoid redundant code in DP Rx error process
Date: Thu,  5 Dec 2024 22:30:44 +0200
Message-Id: <20241205203044.589499-9-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205203044.589499-1-kvalo@kernel.org>
References: <20241205203044.589499-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123059_001001_E7F920AE 
X-CRM114-Status: UNSURE (   9.27  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, in DP rx error processing, the MAC id is fetched redundantly from
the same descriptor for each MSDU. To avoid this redundancy, move the fetch
handling before the iteration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index b24d1de4aabb..2c919503ddef 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3516,6 +3516,13 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 				    ret);
 			continue;
 		}
+
+		mac_id = le32_get_bits(reo_desc->info0,
+				       HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+
+		pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, mac_id);
+		ar = ab->pdevs[pdev_id].ar;
+
 		link_desc_va = link_desc_banks[desc_bank].vaddr +
 			       (paddr - link_desc_banks[desc_bank].paddr);
 		ath12k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus, msdu_cookies,
@@ -3544,12 +3551,6 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 		}
 
 		for (i = 0; i < num_msdus; i++) {
-			mac_id = le32_get_bits(reo_desc->info0,
-					       HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-
-			pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, mac_id);
-			ar = ab->pdevs[pdev_id].ar;
-
 			if (!ath12k_dp_process_rx_err_buf(ar, reo_desc,
 							  &rx_desc_used_list,
 							  drop,
-- 
2.39.5


