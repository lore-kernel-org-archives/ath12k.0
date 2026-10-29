Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC82D606A31F
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LC3q7nvy;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aNV352Zy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QGAW60ly4dJn3r9jBzjnajf80vcBLeMOp3uPKg7LNrQ=; b=LC3q7nvyBZ2Xjt
	/lOY5S7WdOmWyPomAOyiKEojXK86/LBcNNWr5ebuk5WkdxOUQ05omqwprXpmtxv9LCWTYkH3OXmYf
	AHtQOlTPEmgPQz4IuauVhv1ZkUtGHGJQEriVlTiXuCo2Kz/xYCcnbBDvabwIQhmjDXj92S3StR/tn
	l81fUVLL53zdCziZH5VvziYx2OnqSLt1+CQ0Y+Uf1+ufm8JY68xYu2uoow/O5kTaNv9IvgnXuwvmr
	MXiiwOQXGD539Mqi1VFmkGMZewU8D0AKSt7/qQqjnr6gKc+ZLf6FgFK5OETDY1hzrdn9LzB5nxLgW
	vejVmtM0WDSATaim6CxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHau-00000008IfQ-3qcQ;
	Thu, 29 Oct 2026 04:18:28 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHap-00000008IbA-3bwe;
	Thu, 29 Oct 2026 04:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QG
	AW60ly4dJn3r9jBzjnajf80vcBLeMOp3uPKg7LNrQ=; b=aNV352Zya6qwmFZMoA
	Fqec2fClT87pXiZ8EckPOTGu1NKQecYVkrkgoR4MxDQ55pLkrs+gWOrVZ5AIQ15f
	9U8wDuDtJLoLNFcZM0tjb9oIdrpsdzB5x3VGIW6LXUux3MzqzC04w+8mlNpZlwnl
	MnAiTXMZegXuswsXyuC4FGR+I=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nzIDyeJqQW5fDg--.62716S5;
	Thu, 29 Oct 2026 12:18:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 3/5] wifi: ath11k: validate DMA ring capability TLVs
Date: Thu, 29 Oct 2026 12:18:09 +0800
Message-Id: <20261029041811.2379878-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029041811.2379878-1-yaojiale02@163.com>
References: <20261029041811.2379878-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nzIDyeJqQW5fDg--.62716S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7XFyUWFyDWw15WFyDAFWDurg_yoW8Jr43pF
	4Ig3W7C34rXr47Jw1fJa1xZa45K3Z5t3yakFWUJ34fWa1kCF1rJFyYqFWYvFyrJF4UGFya
	qFWqgrW3AF98t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTxRDUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wXGAWriyQXt+QAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211824_288469_7142D548 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The service-ready parser counts DMA ring capability TLVs and later
indexes the firmware array using the full structure stride.  It does not
validate that each TLV payload covers that structure, so a short element
can cause out-of-bounds reads.

Add a minimum-length policy for DMA ring capability TLVs.

Fixes: bd6478559e27 ("ath11k: Add direct buffer ring support")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 047ae8f5bb60..4cf5f57a93e1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -169,6 +169,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_dma_buf_release_meta_data) - TLV_HDR_SIZE },
 	[WMI_TAG_HW_MODE_CAPABILITIES] = {
 		.min_len = sizeof(struct wmi_hw_mode_capabilities) - TLV_HDR_SIZE },
+	[WMI_TAG_DMA_RING_CAPABILITIES] = {
+		.min_len = sizeof(struct wmi_dma_ring_capabilities) - TLV_HDR_SIZE },
 };
 
 #define PRIMAP(_hw_mode_) \
-- 
2.34.1


