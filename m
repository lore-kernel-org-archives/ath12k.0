Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549DFC4332F
	for <ath12k@archiver.kernel.org>; Tue,  7 Nov 2023 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNtzTGK608Av/qSVqNbxm8jT2dMnpAtyVrVQ/eL0Zh4=; b=kx5dgrv8Kji8i4
	+xLIV0+rhGMLUuqFkV7ek7hKsXSUVoix4zmRLnQSn6tQeUwKoJyCmrSCdDVhRGluOLDcS+spbECEJ
	NtqSPVmeL3otmMuITDkmf3AFwcW86UTcIxuNvm+1xi6LVAB3UA+TbJMVaY+BPgZrb1WYlrBPUz8ti
	gQ4udkpYDmTPc93Qnt4XpUWu4/mDglzDg74jr5gx/LibRJbskafwQa1aftOyBF7NkPWCdfHGbbNo/
	Fm/j2Y+HwHhIbvPsM1NnwGVDEgb39koa1ScRTIfQ2vHBJ7qbpoRCh2ohsXXiDcJJMg2Dh1FZ5oWxF
	HnTawf+MClbZQlSMHBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Ktt-001Q5q-0E
	for ath12k@archiver.kernel.org;
	Tue, 07 Nov 2023 12:09:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Ktp-001Q4S-2P
	for ath12k@lists.infradead.org;
	Tue, 07 Nov 2023 12:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CEE8611F1;
	Tue,  7 Nov 2023 12:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21638C433C9;
	Tue,  7 Nov 2023 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358981;
	bh=J/0JHnVlfyIn9vBH1WXDypSlhJSwNRavtMv3DdufGm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrY6Mf20StRl9ULttqhCWfb0tm6kETVESg5D2hGCNi9gfJalUBHY4+Pmb76FJpIrX
	 zh2iGj8hcLGtdaIYHP/w8fMOlBRMd4q5KvJ4MCvE+7yGHLjhNIHJIe0cy0+bjDR2kn
	 3pn2UjPGnCtvCFooQtK+KyTesGTzGrt2r3zBK0YtUvND9SATDc3U6pzkOQ0MjRr3HC
	 5QjyCed0Z4++RDYBas1e58hi1Pdb7nGiZSQegQyzS8hWZEXb4vN4w/P1ntYyv5x4xi
	 fSTZmyM+PgjHiRZtwGoM2nNBv4aX3vzXkmLh6upJbw278BsoJK9JlUXHUUFw5OuAHM
	 RZpNsjUvgn15g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 08/30] wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()
Date: Tue,  7 Nov 2023 07:08:23 -0500
Message-ID: <20231107120922.3757126-8-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120922.3757126-1-sashal@kernel.org>
References: <20231107120922.3757126-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040941_823290_28B3F5E2 
X-CRM114-Status: GOOD (  10.93  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 1bc44a505a229bb1dd4957e11aa594edeea3690e ]

len is extracted from HTT message and could be an unexpected value in
case errors happen, so add validation before using to avoid possible
out-of-bound read in the following message iteration and parsing.

The same issue also applies to ppdu_info->ppdu_stats.common.num_users,
so validate it before using too.

These are found during code review.

Compile test only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230901015602.45112-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 5ad59f2d6bf2e..cec98d79642e7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1555,6 +1555,13 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 
 	msg = (struct ath12k_htt_ppdu_stats_msg *)skb->data;
 	len = le32_get_bits(msg->info, HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE);
+	if (len > (skb->len - struct_size(msg, data, 0))) {
+		ath12k_warn(ab,
+			    "HTT PPDU STATS event has unexpected payload size %u, should be smaller than %u\n",
+			    len, skb->len);
+		return -EINVAL;
+	}
+
 	pdev_id = le32_get_bits(msg->info, HTT_T2H_PPDU_STATS_INFO_PDEV_ID);
 	ppdu_id = le32_to_cpu(msg->ppdu_id);
 
@@ -1583,6 +1590,16 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
+	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+		spin_unlock_bh(&ar->data_lock);
+		ath12k_warn(ab,
+			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
+			    ppdu_info->ppdu_stats.common.num_users,
+			    HTT_PPDU_STATS_MAX_USERS);
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	/* back up data rate tlv for all peers */
 	if (ppdu_info->frame_type == HTT_STATS_PPDU_FTYPE_DATA &&
 	    (ppdu_info->tlv_bitmap & (1 << HTT_PPDU_STATS_TAG_USR_COMMON)) &&
-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
