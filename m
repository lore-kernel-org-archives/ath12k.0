Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ACAC47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4m8Mn7xe/5TJvxvC5oysyRvKCy76YiC8UvfQwEWIOc=; b=XRI1NAevnWYkR894FZGToCoYyS
	ZGYMUZyNpLyF9G3ZPBuqRFu33LCpYaVimee2RGDofpEx9ke+BprF32HuTE8JD2XMEVECT3yYyppai
	uRtT2DMEd8p1D6LfCVkD5ZwTv7qUHckijlL8mpL9FSCSL8txS3QtBfVBTI25It9h+oXumugDIqK78
	+gA9SycsXUi6W+Jl8say+SnVlFQA5TNVAeGo3ylX2TonDhySQi6X3/QVQC6ulb6IOEkq9djScrmPF
	CMxQxNpRhJ7JepRptDWzPBgLevoMFPy2efbpLgQAUtR6AJVHNPYlJDyvzGqV60/suOb/rZKJ0bRuz
	lkS+JpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpTH-00DF2I-2E
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 19:51:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpTE-00DF0K-1o
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 19:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0787861363;
	Tue, 16 Jan 2024 19:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56C7C433C7;
	Tue, 16 Jan 2024 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434695;
	bh=0crYvB0Mjou5nQIcJQGMG/46HLt1l6lK92oFyprBTxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hI68yLYr7axKpg+Sic7Vl3ruUeCWpRYzfZRJxsWegdiS7ZMLJxYU12yBJHBNcQ1xU
	 JrWE09TR2jbFEcTqY33NDPeXI81yHMKURKB6FmmuWExxr4yTM5a5w2XxAMPzRuj7GU
	 s4Uh1FJy0XMdXAuEGGASf8lT64mFHoxw9+XGR4lhGlxXRQhcpIseJ7tOoqqOeUg4hQ
	 BPksAXaujAABmZhxOXqCvAZosiM2Ly4Zjf/M6FyUpDCFSH7D4WhxzaFco1WOD2PNjZ
	 ebmZaZ7n3q0Z017PQoZy548C6r7qip5ChDRJqH31R85rWh8m52aJOMIfL33VZrgKjt
	 ORjYgsKoBUqBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lingbo Kong <quic_lingbok@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 053/104] wifi: ath12k: fix the issue that the multicast/broadcast indicator is not read correctly for WCN7850
Date: Tue, 16 Jan 2024 14:46:19 -0500
Message-ID: <20240116194908.253437-53-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194908.253437-1-sashal@kernel.org>
References: <20240116194908.253437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.12
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_115136_641148_18B2C559 
X-CRM114-Status: GOOD (  10.52  )
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

From: Lingbo Kong <quic_lingbok@quicinc.com>

[ Upstream commit 7133b072dfbfac8763ffb017642c9c894894c50d ]

We observe some packets are discarded in ieee80211_rx_handlers_result
function for WCN7850. This is because the way to get multicast/broadcast
indicator with RX_MSDU_END_INFO5_DA_IS_MCBC & info5 is incorrect. It should
use RX_MSDU_END_INFO13_MCAST_BCAST & info13 to get multicast/broadcast
indicator.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20231206141759.5430-1-quic_lingbok@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index e7a150e7158e..b49a4add8828 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -889,8 +889,8 @@ static u8 *ath12k_hw_wcn7850_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
 
 static bool ath12k_hw_wcn7850_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
 {
-	return __le16_to_cpu(desc->u.wcn7850.msdu_end.info5) &
-	       RX_MSDU_END_INFO5_DA_IS_MCBC;
+	return __le32_to_cpu(desc->u.wcn7850.msdu_end.info13) &
+	       RX_MSDU_END_INFO13_MCAST_BCAST;
 }
 
 static void ath12k_hw_wcn7850_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
-- 
2.43.0


