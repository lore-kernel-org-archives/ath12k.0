Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1782BE77183
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJQSREIbi2Sn3JnLWtNstBMDYL/GZsgvypLbagfXO4A=; b=ALMvz8BIWPqKYUTI3+NRhy+Mcb
	xrR7faAPef73X1pSMZMVrZycxaDa79XV1iw7iCXEXjJpuKR26NG5q3oBYBZuoKQeqfMwycW6f0WA5
	6clU39N1MpSrPJ/C0jYETfTlUxm3ngc82mJgOz6SmDVJOksCOSkQzVuYXHQ4GAjwuUYLgwHqOiRAW
	hOTYl/GxXltiJ/LOGi3YfmWykZ7GPjLseH83FzaipqhG+qI4ze9Y/XRqd/gjzwE+wC/rObWNQY5U8
	VurzsV5IL9voxlw1HkIZ3XcjQSQhRI66lJfOsHJOJiOzkBgMcfjsCXiNbsgkgN63p/UZOBv2p+4KC
	zzwIloQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOji-0000000FH2c-3a3F
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:34:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjf-0000000FGzr-1FqX
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42517A402F5
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC62C4CED2;
	Wed, 11 Dec 2024 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931286;
	bh=ZM8zjJkGa/qRK0XshDVNYNacIug+9Bt5JFORjs69WfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6mjK6FMSKMZXybSt4Zs22OiBDMQjrE1GgwA1U/ErLdDFx21KA5c1g11JwdmWl5d/
	 tm2i314NohBkrjYcZ6sQMS7YGqYNbQ3d7iuOWqfxYomeSolXNxYOvGu/zTHtP4ORxP
	 do/gWnr18Cx04LRzkmr/5G0z3yG13CSZSYzKrBHlHDFv4Gcb/Eypqpn1rLfOqwnybn
	 iKquvS+euEG87PWhqs1CYH1AuENSPu+cgCcT74G2DKwzJHH0F4AFm0bfoCsROY7KEa
	 UQwGUF82EmtvuC1Qm2nhZ04JTSVj16vJpJ2AQRpxzLBTyDbOeByr84z01nHuf64izJ
	 qL7AUk97DnA2A==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 8/8] wifi: ath12k: avoid redundant code in DP Rx error process
Date: Wed, 11 Dec 2024 17:34:32 +0200
Message-Id: <20241211153432.775335-9-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211153432.775335-1-kvalo@kernel.org>
References: <20241211153432.775335-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073447_407464_8A9BE6DC 
X-CRM114-Status: UNSURE (   9.25  )
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


