Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A48C3DA64
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 00:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgRnlyleV5Fih2OTwaMROUjDsd4FZofbk/oA/6JcRe8=; b=XMPN2Hp/jJ6xEjRjc4FT8QJq4B
	Vck71DCP088cXGh1wwy+ud2w+bFUr9JCt/9YjyuDkTTl7lKD/6j1l5YBjMs2UYDIgluCIER95b1AZ
	Ru6Sb0Rj3GnpG9iVa1d3s95mhLZmMHRJ7eoY9xPrXzVRY+VA7/XIF5+1WUO52Lp1U2PBARwpOa+b5
	N24QDrU/heYV7ZkaTLBaT9edXYAnK92WRtTlal1HVtmmP0yOK/chKlzMhVLrV4iNlE2gdVaQcHjgh
	rV1vm4xBO/NJcQ3u7aZ2s1niCQK3kxQiWeTHDI4WTT1JkwTPQ4uqON8976rBQta56lBTmBJUXnY5A
	wziZE+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJUq-00000002wC8-2M1d
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 00:16:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJUn-00000002wBF-1v7T
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 00:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA01CCE1870;
	Thu,  1 Aug 2024 00:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E9CC116B1;
	Thu,  1 Aug 2024 00:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471399;
	bh=xKmG+h3e/pfzKAgMRNuiHHVyFsZSiwtJDc2oAsA24Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sutiCheLBgEaKEA9PGxAUlelgLiztsg5Ge37ux+gqdM1MgCF+TI7iZujCsk63H7Tm
	 0FAHMmv67LXpTQzzpyC5orpo85NJ0XzOvEwFcyYju0To0OZ7e0cUpx50Jhrt5TjDah
	 JjPFX6FQkQ0Uh5Uk+4LcjWjtl7l1C8zK7hIiP7tlKAX+XsnlF5DJT7Uc6bj9sYqlkD
	 Q8J+faRwH3qW78a92BRSMOiBvrHM6bLw5Ydl0+sHoTA2CNlMLtYPDct9XeFQ/ydhak
	 Z0kAqrL20iolFH1N51oiE6L1u0+yBHHcs7MSdgfw/VblFzoBMrIhCuz2L2o5aoN7Lf
	 U6Yx2zYc49lJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aaradhana Sahu <quic_aarasahu@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 086/121] wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()
Date: Wed, 31 Jul 2024 20:00:24 -0400
Message-ID: <20240801000834.3930818-86-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171641_693432_6293432F 
X-CRM114-Status: UNSURE (   9.57  )
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

From: Aaradhana Sahu <quic_aarasahu@quicinc.com>

[ Upstream commit 19b77e7c656a3e125319cc3ef347b397cf042bf6 ]

Smatch throws following errors

drivers/net/wireless/ath/ath12k/mac.c:1922 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:1922 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath12k/mac.c:1924 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.

In ath12k_peer_assoc_h_he() rx_mcs_80 and rx_mcs_160 variables
remain uninitialized in the following conditions:
1. Whenever the value of mcs_80 become equal to
   IEEE80211_HE_MCS_NOT_SUPPORTED then rx_mcs_80 remains uninitialized.
2. Whenever phy capability is not supported 160 channel width and
   value of mcs_160 become equal to IEEE80211_HE_MCS_NOT_SUPPORTED
   then rx_mcs_160 remains uninitialized.

Initialize these variables during declaration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://patch.msgid.link/20240611031017.297927-3-quic_aarasahu@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 805cb084484a4..678a08ab22f03 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1881,7 +1881,9 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 {
 	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
 	int i;
-	u8 ampdu_factor, rx_mcs_80, rx_mcs_160, max_nss;
+	u8 ampdu_factor, max_nss;
+	u8 rx_mcs_80 = IEEE80211_HE_MCS_NOT_SUPPORTED;
+	u8 rx_mcs_160 = IEEE80211_HE_MCS_NOT_SUPPORTED;
 	u16 mcs_160_map, mcs_80_map;
 	bool support_160;
 	u16 v;
-- 
2.43.0


