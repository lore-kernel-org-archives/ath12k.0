Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC91606A323
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZLOUt25L;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PM2jtbVB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IUSnrfCaWJwxjkS74oOIrmmdaMLt7r4a4zA1tolg5lU=; b=ZLOUt25LwHvZja
	PMhIpkR0cGCdHjziTtkdZ2KJ1l2hN6V5Y6BxCA3aIbT+RBlUECgmVouJNrq0tBu3n33FGpF83ofU5
	DZiH21RQ82xcjNvv2CLtLJBDxDIC/dbbsFRlgCdk5MWio1wOfNkKWJ1CS9l2xWILoJz+WRFR44EP1
	ekX0hsg/H9vLpt1bgeXXoZ+0DYt4v3ziyB1K0B3dK3lescWGq60xAnfu6NDJbjsBMRrC0nfIVII31
	pV6Zb0aVc28y8JhmurWs7iFeSK4YxNYvmfedS0Z6d2+3WChSvqd5LcMx2rfcobblbn6IzXZxaZMPl
	s3hfkhKrDpaqbeqakCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHau-00000008If9-2fzM;
	Thu, 29 Oct 2026 04:18:28 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHap-00000008Ib7-49aR;
	Thu, 29 Oct 2026 04:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IU
	SnrfCaWJwxjkS74oOIrmmdaMLt7r4a4zA1tolg5lU=; b=PM2jtbVBMhoCCKO5c+
	xd6Wia5b25nA7LnyX17UiIU3vw0qwT3nE0A61IyN04zMfIsFfbYaOvhO+lESYII1
	uHckNBpViJXmVjw9u/Oo00wrDWY5rNtuKEGAL3kMZKL+hvJ/sJZKnt+C8ktikHzK
	9g4OJibmdTwUNGuKCEhA3BvmI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nzIDyeJqQW5fDg--.62716S3;
	Thu, 29 Oct 2026 12:18:12 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 1/5] wifi: ath11k: validate DMA buffer release TLV lengths
Date: Thu, 29 Oct 2026 12:18:07 +0800
Message-Id: <20261029041811.2379878-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029041811.2379878-1-yaojiale02@163.com>
References: <20261029041811.2379878-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nzIDyeJqQW5fDg--.62716S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4UJr47Wr4xur1UWF17Wrg_yoW8Xr4DpF
	48WwnrCw1xXrs7Gwn3ua1fZayYkanag3y3KFW0y34fuF48CF15JFWYqFWYvFyrtr18tFyS
	vF4jgr15Ar1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMUDAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgTGAWriyQT-OgAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211824_440036_21ACCE4C 
X-CRM114-Status: UNSURE (   8.56  )
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

The DMA buffer release parser counts nested entry and metadata TLVs, but
does not ensure their payloads cover the structures later indexed by
the direct buffer ring handler.  Short firmware TLVs can therefore lead
to out-of-bounds reads when the arrays are consumed.

Add minimum-length policies for both nested TLV types.

Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..ef2c2c300854 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -161,6 +161,12 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct wmi_pdev_csa_switch_ev) },
+	[WMI_TAG_DMA_BUF_RELEASE] = {
+		.min_len = sizeof(struct ath11k_wmi_dma_buf_release_fixed_param) },
+	[WMI_TAG_DMA_BUF_RELEASE_ENTRY] = {
+		.min_len = sizeof(struct wmi_dma_buf_release_entry) - TLV_HDR_SIZE },
+	[WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA] = {
+		.min_len = sizeof(struct wmi_dma_buf_release_meta_data) - TLV_HDR_SIZE },
 };
 
 #define PRIMAP(_hw_mode_) \
-- 
2.34.1


