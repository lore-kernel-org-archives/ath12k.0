Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A07D1D88D
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIgfKJGb1rjIuoKAHtR3Wo3Bypq3RSRUod6aMugVMX8=; b=2H4A/1My8zn33D7mQ72EWAl4RV
	HViIsYPoCUYnGCZpDC9kQTLR31EuPKQqJdGfpMdx6w6jA+cKJOYTu+BxPd0S61HvD2IbW/lB6qzWh
	vPRZnYgzYpdJz4MSgY9Y9BX78HeVUUH5zLZYKE1wenosWArpW5yDiWo47yxpahL5zi47fg9EGoEtN
	6Ic28LetYXA26rTof24T38mRCJCo9ZvNQVUA40aetiVIlV4bkuOMgXOgvfzZFK/Q/hRDTTVQQeCZp
	UxJTWgWZxmZGtDbwplzEskKGGJr86DYsD7qoZte2v8D3wp89+rXNWnZVo2CEK6rWPmAOfVrttsTpu
	Z7wiBoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7w-00000008zpH-0zX4
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7r-00000008zli-1QPP
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9CB41A42608
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18C0C4CEC6;
	Tue, 15 Oct 2024 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012466;
	bh=BHtY7wCSHiNlcx+39qfdNwbOfBdEgUSezAm+ogDOqJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FWGjloBBkeA0sO1Y2RDSnXai63n+fbyYsEbdORkxGyV3cwtEVFrc+cxOz7hTl78F8
	 ZxulDvGRDYAUJwaOhWTzu4Q1PHcY5sgiafk6G+gA60cP1DKRVPFnWFy6M63qM1Q69T
	 Xz3nsly3nw11Nt5ZQaC4/lJquWsc053ojqnFC+R8PF6eD5nERSH5pchtXEJE2oItUJ
	 keS25FcH7MX9qPT13sahjpaBmpNtmAxiSeqitcCytB1/CFdu2r/itZiwHloFN3lGD+
	 G/BvrxwEWQLb+zJoo84u06sew/stKcnGCgiHzYV4qLvYS9GFzkYV54+PufPvgN0M0N
	 1PfA5XOuRyDZQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 06/11] wifi: ath12k: modify ath12k_get_arvif_iter() for MLO
Date: Tue, 15 Oct 2024 20:14:11 +0300
Message-Id: <20241015171416.518022-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101427_541786_2A396857 
X-CRM114-Status: GOOD (  10.26  )
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

Currently ath12k_get_arvif_iter() takes input ahvif's deflink to check if it
matches with given radio (ar) but in case MLO there could be multiple links
affiliated with ahvif, hence iterate through the links of the ahvif and find
the right arvif that belongs to the given radio.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a0869ed1cb57..fb4b800435f8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -547,11 +547,22 @@ static void ath12k_get_arvif_iter(void *data, u8 *mac,
 {
 	struct ath12k_vif_iter *arvif_iter = data;
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif = &ahvif->deflink;
+	unsigned long links_map = ahvif->links_map;
+	struct ath12k_link_vif *arvif;
+	u8 link_id;
 
-	if (arvif->vdev_id == arvif_iter->vdev_id &&
-	    arvif->ar == arvif_iter->ar)
-		arvif_iter->arvif = arvif;
+	for_each_set_bit(link_id, &links_map, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = rcu_dereference(ahvif->link[link_id]);
+
+		if (WARN_ON(!arvif))
+			continue;
+
+		if (arvif->vdev_id == arvif_iter->vdev_id &&
+		    arvif->ar == arvif_iter->ar) {
+			arvif_iter->arvif = arvif;
+			break;
+		}
+	}
 }
 
 struct ath12k_link_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id)
-- 
2.39.5


