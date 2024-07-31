Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E407C3DA7F
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDHhBNi7TtwbggLutwKFgCK6GeU5Rnb/x5R6DO0Dn04=; b=TR/9cQK+fcENoGsIFr7VbtvPja
	hSogKAJT4reyRq08BOigBA0//CrCG4Qh4ab1bfrEObHqVMFLUoYrMd8apNSSYFZaL/GiisPpLnwFH
	oh48lBqrp7Mn/ekATdDr1Sh8AkoWAwQHfnjvOrOxQuilwv3lTAtHLs7ZC9Y/ocjBofeyclki+kwt7
	DechcP4xVW3KlBasMrwA8onfvh3dvr6ZfIcEaUP6LOKFhI7mk+tzQqEwIZdqHgUtRNA1l6cvvV8vy
	XhIJQKTPGUZ2u3N/eg+JiVWg9f8Tnv/s6zDde/Y+aCosSNyjaoMZ/OCeQnZh80bLR5LiCmog+BUdz
	0JGMAZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJR6-00000002uu9-47o4
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 00:12:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJR3-00000002usg-3dcW
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 00:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64EF7626EE;
	Thu,  1 Aug 2024 00:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F33C4AF13;
	Thu,  1 Aug 2024 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471169;
	bh=rsZOGd03V2Zh4wv7dhQc6P52afmJhEBWFzpPHt0Dohc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYlun+ExRcaQrFS7GH05kbhcNUmWadSKwXMZphJfkQmQRIEdddWRRvs5ucDhwU0l2
	 1pf11BgFmWibidh+46KXBz2uJNd3rpCVoZ75oFDDy/6Bc/L006netLCSWyllJNIMZe
	 wv6JqMtSxpYpmbQ9yjTEPjvYbfDtPsgZS9a2G+RU//asjoYZbwlTKazGTvWGc8vSFC
	 fpEUF7Ae0ZVFxrHzIKPgaAOjtX4S2wQ1Mjl7owCduFM1cyigqKPblBtMz2Muf5EJFp
	 JwbzzzfjZPPd49r05ZZWngU0gLrTt79dvhmDiosAXxlPmc6Z17D2FCzEP+IM6TXHCx
	 EHMuPkrp25vVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 040/121] wifi: ath12k: initialize 'ret' in ath12k_dp_rxdma_ring_sel_config_wcn7850()
Date: Wed, 31 Jul 2024 19:59:38 -0400
Message-ID: <20240801000834.3930818-40-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171249_972968_B4A045C2 
X-CRM114-Status: GOOD (  11.18  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

[ Upstream commit 3b9344740843d965e9e37fba30620b3b1c0afa4f ]

smatch flagged the following issue:

drivers/net/wireless/ath/ath12k/dp_rx.c:4065 ath12k_dp_rxdma_ring_sel_config_wcn7850() error: uninitialized symbol 'ret'.

In ath12k_dp_rxdma_ring_sel_config_wcn7850() if it were ever the case
that ab->hw_params->num_rxdma_per_pdev was 0 then 'ret' would be
uninitialized when it is returned. This should never be the case, but
to be safe and to quiet smatch, add an initializer to the declaration
of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-2-44d2843a2857@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 75df622f25d85..0f439d9b84fbf 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -4028,7 +4028,7 @@ int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
 	u32 ring_id;
-	int ret;
+	int ret = 0;
 	u32 hal_rx_desc_sz = ab->hal.hal_desc_sz;
 	int i;
 
-- 
2.43.0


