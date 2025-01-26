Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173C5C02181
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j6GPQ3YUmzMlqXRTy40/TX7dtgrYjGbUI6aZtCqAcjo=; b=w6hTv33N8+HQe91eL5d+s9dWx+
	Fxaj/ppDsfED4R0g/5W5Z3VIe7PS6WL9A7cWB/hjC2dKhcRLQw+R25F1ud8f2+qxIJVxiLfCVsGXx
	Uc44tgHrV0YorxOTXcACyEU52U19rJQYijSeKlRuhNeel61iX60+299CZQumIaU/RpWy6cg8iGaXP
	06flEWzMxoCj5Mk9d2opSaLg+cteI32P67A0rd91ZWWa/6ZgF2Dc8CauSOO4/rcvGMWXRJvAnP+Eu
	ZWZPP/euF6nYtxF+/LnN6BS6j/wO20fv2RGCr0mdRzI9RsSQYRTjpsxSOsBFo0nS62nuhT7rprfXr
	wXpSDWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc47n-0000000HX1g-3XC4
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 15:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc47k-0000000HX0a-49cq
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 15:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EEC85C3268;
	Sun, 26 Jan 2025 14:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0722FC4CED3;
	Sun, 26 Jan 2025 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903632;
	bh=t7P4ntRV5agOZOjYh4DrQCUYqk7wEUB/mA7lieVWKFE=;
	h=From:To:Cc:Subject:Date:From;
	b=ErmQaUOpIK0RlY9EmMhOvK4dEfAE0gjmNOgVukwGez8Qd2owDq3zu5IRjEUYUPHle
	 qcrfvU+zuKr0sM9TOUfIxxV/A0C7QkU3XEvpui535VO+4mSilhL5u0wYGKn7E5+EwD
	 GhfPuEr5JRkBujSw6/JL1C0VovruAKobwo/wPsU/q7TE+xWtMOmiiCmG4Tqqqj4SOk
	 kdyI6tAhbhkFSkf8wflj6zuUBtjDDtla+bGj08w/+YnU12pKGpzfNp1Rri5yBv/tPc
	 vZVjhCGNYbko6UblJZY9LPRc7L4wbLnCnOciLReyJxwUoKg2jkx/rH6wjgy2z9uvPl
	 hbjmwbatQfR3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karol Przybylski <karprzy7@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 01/35] wifi: ath12k: Fix for out-of bound access error
Date: Sun, 26 Jan 2025 09:59:55 -0500
Message-Id: <20250126150029.953021-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_070033_071158_65487A38 
X-CRM114-Status: UNSURE (   7.63  )
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

From: Karol Przybylski <karprzy7@gmail.com>

[ Upstream commit eb8c0534713865d190856f10bfc97cf0b88475b1 ]

Selfgen stats are placed in a buffer using print_array_to_buf_index() function.
Array length parameter passed to the function is too big, resulting in possible
out-of bound memory error.
Decreasing buffer size by one fixes faulty upper bound of passed array.

Discovered in coverity scan, CID 1600742 and CID 1600758

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
Acked-by: Kalle Valo <kvalo@kernel.org>
Link: https://patch.msgid.link/20241105101132.374372-1-karprzy7@gmail.com
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index c9980c0193d1d..43ea87e981f42 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -1562,7 +1562,8 @@ ath12k_htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, u16 tag_len,
 			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndp));
 	len += print_array_to_buf_index(buf, len, "ac_mu_mimo_brpollX_tried = ", 1,
 					htt_stats_buf->ac_mu_mimo_brpoll,
-					ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS, "\n\n");
+					ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS - 1,
+					"\n\n");
 
 	stats_req->buf_len = len;
 }
@@ -1590,7 +1591,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
 			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
 	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
 					htt_stats_buf->ax_mu_mimo_brpoll,
-					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
+					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS - 1, "\n");
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
 			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_total_trigger = %u\n",
-- 
2.39.5


