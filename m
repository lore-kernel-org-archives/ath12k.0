Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2DBCA0EF3
	for <ath12k@archiver.kernel.org>; Thu, 14 Sep 2023 04:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FaoKDgFuzGMOpHYr8O5ZzLSwrR/xVZbjiXSz+xeBQ1c=; b=l+ZOh5TJ8qcd8x
	LAMpCfTkbyPvpB3kE2X5NCs7qXhr2UF7K9xXoamiaCHSZyNxLv9ETwWUYZj4J5IL0vaHxjdMBcZfm
	bYf++HPWdJuH51MxuValkupda5I4QexNtuRTyt5nDc1zZALrg+Q+ZWLWiuBR9u1PWneuxLKR7RJGe
	3FzEmxBJ90N2ACizaFzjnhav/TjfaDNuCirsGrIBaJmpelfkeDXntR1u4+orzYN+2fwatnMCqcEo0
	LrHwGB0knxjQDELw7ILk4Hq+XV8dvU8nS+JKLlRLkUiR3+VjWu7Sv+bF/P1SqV58HQaHTcxZGJ4GV
	5ygtJMnQtejyZFM1uN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdbf-007Jiw-2T
	for ath12k@archiver.kernel.org;
	Thu, 14 Sep 2023 04:05:31 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdbd-007Jh6-1B
	for ath12k@lists.infradead.org;
	Thu, 14 Sep 2023 04:05:30 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 62715606080E2;
	Thu, 14 Sep 2023 12:05:26 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Wu Yunchuan <yunchuan@nfschina.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Wu Yunchuan <yunchuan@nfschina.com>
Subject: [PATCH wireless-next 7/9] wifi: ath12k: Remove unnecessary (void*) conversions
Date: Thu, 14 Sep 2023 12:05:25 +0800
Message-Id: <20230914040525.1170102-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_210529_578807_2ADEB7CD 
X-CRM114-Status: UNSURE (   7.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

No need cast (void*) to (struct hal_rx_ppdu_end_user_stats *),
(struct ath12k_rx_desc_info *) or (struct hal_tx_msdu_ext_desc *).

Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 6 ++----
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f1e57e98bdc6..41cfe7bd865f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -13,8 +13,7 @@
 static void ath12k_dp_mon_rx_handle_ofdma_info(void *rx_tlv,
 					       struct hal_rx_user_status *rx_user_status)
 {
-	struct hal_rx_ppdu_end_user_stats *ppdu_end_user =
-				(struct hal_rx_ppdu_end_user_stats *)rx_tlv;
+	struct hal_rx_ppdu_end_user_stats *ppdu_end_user = rx_tlv;
 
 	rx_user_status->ul_ofdma_user_v0_word0 =
 		__le32_to_cpu(ppdu_end_user->usr_resp_ref);
@@ -26,8 +25,7 @@ static void
 ath12k_dp_mon_rx_populate_byte_count(void *rx_tlv, void *ppduinfo,
 				     struct hal_rx_user_status *rx_user_status)
 {
-	struct hal_rx_ppdu_end_user_stats *ppdu_end_user =
-		(struct hal_rx_ppdu_end_user_stats *)rx_tlv;
+	struct hal_rx_ppdu_end_user_stats *ppdu_end_user = rx_tlv;
 	u32 mpdu_ok_byte_count = __le32_to_cpu(ppdu_end_user->mpdu_ok_cnt);
 	u32 mpdu_err_byte_count = __le32_to_cpu(ppdu_end_user->mpdu_err_cnt);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e6e64d437c47..ff5f66ca7783 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3730,7 +3730,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 			continue;
 		}
 
-		desc_info = (struct ath12k_rx_desc_info *)err_info.rx_desc;
+		desc_info = err_info.rx_desc;
 
 		/* retry manual desc retrieval if hw cc is not done */
 		if (!desc_info) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 8874c815d7fa..98ddf46b3bb9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -109,7 +109,7 @@ static struct ath12k_tx_desc_info *ath12k_dp_tx_assign_buffer(struct ath12k_dp *
 static void ath12k_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab, void *cmd,
 					     struct hal_tx_info *ti)
 {
-	struct hal_tx_msdu_ext_desc *tcl_ext_cmd = (struct hal_tx_msdu_ext_desc *)cmd;
+	struct hal_tx_msdu_ext_desc *tcl_ext_cmd = cmd;
 
 	tcl_ext_cmd->info0 = le32_encode_bits(ti->paddr,
 					      HAL_TX_MSDU_EXT_INFO0_BUF_PTR_LO);
-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
