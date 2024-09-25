Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6857C369D5
	for <ath12k@archiver.kernel.org>; Wed, 25 Sep 2024 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko/5MVhQnZGM3+E+VFbuJbue8JFJ3Imnrd6jQlvYYFI=; b=AQ0tQugV4sPQ+tD7nJu43WhUku
	hXGEasNB4Igb82/O55qccP7SxEJ336w2QNku74rjKs1BqgY+lKiJ5LkvYE5UUSA84qiAVFOIqmW/l
	13r9DJCeVB+X0vnNo7Y/hBmp4Nbd2J4JE8UqP//hTmGyFOhpqPLabZufLYHZvLzCkDjHJ7UMoMMFb
	xCVD4VC/nl8WJjTXaPEdJqAjheLKAW/nQEAnszU/bo0TNQ256RurM6iu/HRMKYOG3AgxyZ/U/ZCrJ
	OMZu6q0cFx1gx/b4x9tofkbI3eC3Fq8mk0oaebFoadAp2iIsn5KP0RgjWBR0UJJdmdRjgGPfzNzfp
	/3d1Jcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQgV-00000004zi7-2UpT
	for ath12k@archiver.kernel.org;
	Wed, 25 Sep 2024 11:59:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQg9-00000004zZn-2sCw
	for ath12k@lists.infradead.org;
	Wed, 25 Sep 2024 11:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA137A440C8;
	Wed, 25 Sep 2024 11:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D55C4CECF;
	Wed, 25 Sep 2024 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265572;
	bh=jFr7uu1TQUwZVhdUqJfZcFkq8Z+1od8tbXbQq+2lMHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IuyzjiGVb5cHsiM6AiOn0Ahu4Xbq8shwKM9/rHHPde38kCzuwRGm8r/BNy92o8nT2
	 AivqCrwlAZRkv6aYGcjct9T5TXAXkKsFOfSr2i+EOAKoKofDp0p02SZoAUxJH1okb5
	 sPcKUp0Mns2/NeBia+PDYL6o981zf1x7Z1mg4sdtY8uXwPb9+SNWAd4lSrAxUphJys
	 3nKYllsoR9nWv2hYC8vwdzOo3M+XPks/nRAUOsnPR2okcP+qxzBJJN4Qq5O9Wji+qs
	 Vh5ocamQoVMQt5LtgF6QetDtbuFi/LeWRkOkwh2nb01JLNT2TziuZQpp7nb8qpZD/F
	 ULV2/g8tmJvMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 029/197] wifi: ath12k: fix array out-of-bound access in SoC stats
Date: Wed, 25 Sep 2024 07:50:48 -0400
Message-ID: <20240925115823.1303019-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_045934_021491_2523C50A 
X-CRM114-Status: GOOD (  10.71  )
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

[ Upstream commit e106b7ad13c1d246adaa57df73edb8f8b8acb240 ]

Currently, the ath12k_soc_dp_stats::hal_reo_error array is defined with a
maximum size of DP_REO_DST_RING_MAX. However, the ath12k_dp_rx_process()
function access ath12k_soc_dp_stats::hal_reo_error using the REO
destination SRNG ring ID, which is incorrect. SRNG ring ID differ from
normal ring ID, and this usage leads to out-of-bounds array access. To
fix this issue, modify ath12k_dp_rx_process() to use the normal ring ID
directly instead of the SRNG ring ID to avoid out-of-bounds array access.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://patch.msgid.link/20240704070811.4186543-2-quic_periyasa@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 3cdc4c51d6dfe..f8767496fa543 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2702,7 +2702,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 		if (push_reason !=
 		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
 			dev_kfree_skb_any(msdu);
-			ab->soc_stats.hal_reo_error[dp->reo_dst_ring[ring_id].ring_id]++;
+			ab->soc_stats.hal_reo_error[ring_id]++;
 			continue;
 		}
 
-- 
2.43.0


