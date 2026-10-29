Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB6606A324
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=isPllqD3;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m/tFNfMJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9eDZ1tyXFZupu+NBPF56Dz9t7vnEPEkY79v4CEYA78k=; b=isPllqD3v6HwzL
	0La3MX9nYVN+o/fg+KruVZtUBOgb7Nr4AVTfwV7BP+ZPOhfhsXdzue7ZJpk2kGg9xp3jZhXJFig5+
	Y2JI4g5/rG1YhKO+to0wFfgJMtbSEvobY+xpi7R+4QTlUNxVRSdI1VpOSsi2GWrwx74whhZVKkKJ2
	S8IIPQ5yeivjnO8DVCE5xbHXTNh9V5+5ZqiNC3KjOtLFdMHl0IxZYHuC7HlIHA7FbY2VKKPLLETdG
	GbuV1kv9Sx9H4pxgahRmZMRtPwAO/ipXZd4Th/woddByxUUzJxDLj/9j1288qbXrMQVu2f1N3FY7f
	zAQSX6+faj9bIhuPyBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHat-00000008Idp-3syK;
	Thu, 29 Oct 2026 04:18:28 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHap-00000008Ib5-2lKU;
	Thu, 29 Oct 2026 04:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9e
	DZ1tyXFZupu+NBPF56Dz9t7vnEPEkY79v4CEYA78k=; b=m/tFNfMJMY54Tccop+
	gTW1MusOgvZuQw8toDZ0F5peh2VCPg5TLbX2Ejn2ob4jDJ/OJX3OW3LFx+U9qhiK
	QnnN2m8Tyav4qp2G+vVUriPpdYhyAivPrsDRoIW+i0gkHAM1CHCE0faF1wr8EafF
	pBYtk68V5cGqps+SxttIE/lak=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nzIDyeJqQW5fDg--.62716S6;
	Thu, 29 Oct 2026 12:18:14 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 4/5] wifi: ath12k: validate DMA buffer release TLV lengths
Date: Thu, 29 Oct 2026 12:18:10 +0800
Message-Id: <20261029041811.2379878-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029041811.2379878-1-yaojiale02@163.com>
References: <20261029041811.2379878-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nzIDyeJqQW5fDg--.62716S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW3uFW5WF1DArW7Gr45Jrb_yoW8WrW3pF
	4fWw12k348CrsrWwn3Zw4xZa4Ykan3W347KFWxt34fua1rCr15tFyYgFWYvFyYyr1rtr12
	9a1jgr4fArn8trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UROJOUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wbGAWriyQbuDAAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211824_074027_9E2CD064 
X-CRM114-Status: UNSURE (   8.33  )
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

The DMA buffer release parser copies fixed parameters and counts nested
entry and metadata TLVs. It does not ensure that their payloads cover
the complete structures later read by the parser and direct buffer ring
handler. Short firmware TLVs can therefore lead to out-of-bounds reads.

Add minimum-length policies for the fixed TLV and both nested TLV types.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c79..0109f56fd429 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -209,6 +209,14 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
+	[WMI_TAG_DMA_BUF_RELEASE] = {
+		.min_len = sizeof(struct ath12k_wmi_dma_buf_release_fixed_params) },
+	[WMI_TAG_DMA_BUF_RELEASE_ENTRY] = {
+		.min_len = sizeof(struct ath12k_wmi_dma_buf_release_entry_params) -
+			   TLV_HDR_SIZE },
+	[WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA] = {
+		.min_len = sizeof(struct ath12k_wmi_dma_buf_release_meta_data_params) -
+			   TLV_HDR_SIZE },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
-- 
2.34.1


