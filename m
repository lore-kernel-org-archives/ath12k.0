Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64B4E77181
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it7rJBKvnXgyFQtKe4Fgh5DFnx+zOuQgm2WG2XAnLmA=; b=OS8fepvujABL96u1PkXv5hDA3B
	0R5Z+VmWDWsbFrVhM74Nd8kyloyjFRpO2y9n4d6ZcW4DP8EiGAn2gNVbtH2RmYCCz9HzG41qcwYSc
	zICJTGBefJxcdHZp+cld6rFGwHJUWqpNitfeGy3TEPt5wqTVE8Z9nh1SyTteH9mZabVLlthjD+Rxg
	v1Oe4HPOut38PAkT77yvQyNiy46QELGRU7yub3ywhOOGauE1GJai6v2n62K7gfvFM7L/eU+rZXUOj
	/FMvGmR353pEuJtd5aMiR+/VSjh7qFlQczHpJ1h0BuMiJt9JpVWD64SlnIfGW+/aIhyk7s9hg/AAD
	0gjey7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKits-00000008wD5-2W9m
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitp-00000008w92-2n8P
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A7685C5FE9
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAD7C4CEDF;
	Mon,  9 Dec 2024 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770468;
	bh=R3x4fB3fgIOZ4yHe2Exvv4Idzn8sQ2bxalc4Ocqijx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rjc8vorlViuTUrCiYrny0uCTRqsH0FlwkwjMsHhHlDZelDEY5vzsE4tmQIq6LctIk
	 XU1OCsUR3KzgmJ3YHaYt/bH7cxRXEVotCKFpNilpUbuPTxcieTTB9ivNSlL0e29cZk
	 MhwnMjHo3h12r9LnkF+B87BmaGL6qVwn7XVcTg12hTkBA5GnhXrRWbsXZ1A6mRfAp8
	 P3DeJ+1j6HmfDFodod3tG35ssWK9+PYToKA3z/C6VbDZ4Rq8OxKtRe+dbJHE7E02QR
	 y+H0TRcwDYLnSwQBxWnEKonzLR+j3eFhlGHB+NUzlZtxxDKy1QoZaHQ96moGV7MRQv
	 GXLwjjV2yuM4A==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 5/9] wifi: ath12k: Refactor radio frequency information
Date: Mon,  9 Dec 2024 20:54:17 +0200
Message-Id: <20241209185421.376381-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105429_774996_29333AA5 
X-CRM114-Status: GOOD (  10.09  )
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

Currently, radio stores the low frequency and high frequency information as
separate variables. However, cfg80211 already provides a suitable data
structure struct wiphy_radio_freq_range to store this information efficiently.
Additionally, for multi radio per wiphy infrastructure, this frequency range
information is essential. In future patches using struct wiphy_radio_freq_range
makes the code simpler.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 3 +--
 drivers/net/wireless/ath/ath12k/mac.c  | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d7caa58bb262..d09ebcdde94f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -711,8 +711,7 @@ struct ath12k {
 	bool monitor_started;
 	int monitor_vdev_id;
 
-	u32 freq_low;
-	u32 freq_high;
+	struct wiphy_radio_freq_range freq_range;
 
 	bool nlo_enabled;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dc61fe761090..1bf89be1cccc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -708,8 +708,8 @@ static struct ath12k *ath12k_mac_get_ar_by_chan(struct ieee80211_hw *hw,
 		return ar;
 
 	for_each_ar(ah, ar, i) {
-		if (channel->center_freq >= ar->freq_low &&
-		    channel->center_freq <= ar->freq_high)
+		if (channel->center_freq >= KHZ_TO_MHZ(ar->freq_range.start_freq) &&
+		    channel->center_freq <= KHZ_TO_MHZ(ar->freq_range.end_freq))
 			return ar;
 	}
 	return NULL;
@@ -10203,8 +10203,8 @@ static void ath12k_mac_update_ch_list(struct ath12k *ar,
 			band->channels[i].flags |= IEEE80211_CHAN_DISABLED;
 	}
 
-	ar->freq_low = freq_low;
-	ar->freq_high = freq_high;
+	ar->freq_range.start_freq = MHZ_TO_KHZ(freq_low);
+	ar->freq_range.end_freq = MHZ_TO_KHZ(freq_high);
 }
 
 static u32 ath12k_get_phy_id(struct ath12k *ar, u32 band)
-- 
2.39.5


