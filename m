Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD0606A320
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAwANcRx;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gr8qnu41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TIS1eakvHI8+nc46GSQLddSxCI4HVRv7Ah/8EnxGvVs=; b=hAwANcRxDnYh8x
	N2kPYBydDM+fAmdDJGrbEXlfg2Amc4GXNuWZH/3CRDs6uwgXICsEriDodzCDmgCQeFft++udRZJ9b
	zPpdy7L+gn/75aHkvknwIwRR5jXqIKzuF19mlbnqymQzQkdHSU+4ro9sK5N/O9bh3KofOrKK/Ll6K
	73Cof2YAhbnfn7YQott7UKhxxrir+8O+a5eEmb3ixjFPBvKib+IbDA34YMSIvVE5DtwHh4QCjQkIR
	lXvPylRYxc1rHtNxKtmEwEhSy+3DuT2l/N/tUl/+knqdxgr+3TCgLnjc8JKV+Yemfp3k6AXfZZR+o
	nRyX11KraJjGlJpS10NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHau-00000008IeY-1dDA;
	Thu, 29 Oct 2026 04:18:28 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHaq-00000008Ib6-1c6e;
	Thu, 29 Oct 2026 04:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=TI
	S1eakvHI8+nc46GSQLddSxCI4HVRv7Ah/8EnxGvVs=; b=Gr8qnu41zMvgzCQFL4
	CMliPrLiR9VssdJgAtch18G6V8SSXQz4d85j/89Sa3H/kGQBlxpwB437j8M11C+T
	AB+OAXh9qf6VQCnGQnoEZS1aOvfYxaKwRLKUo3MNPISN9m83kL+pznqBq6Q9GQXp
	olUEJUbqaZNHeOqVBGzAfsveg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nzIDyeJqQW5fDg--.62716S4;
	Thu, 29 Oct 2026 12:18:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 2/5] wifi: ath11k: validate hardware mode capability TLVs
Date: Thu, 29 Oct 2026 12:18:08 +0800
Message-Id: <20261029041811.2379878-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029041811.2379878-1-yaojiale02@163.com>
References: <20261029041811.2379878-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nzIDyeJqQW5fDg--.62716S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7JF4xJFy3JF4xKrW7tFyDAwb_yoW8JrWDpF
	4xGw1UA348Jw47Jw4fAa1xZa45Kan5K34agFW7t34fWF18CF1rXFyYqFWYqFyrtF4UGFya
	qF4qqrW5AF98t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDL05UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wXGAWriyQXt7wAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211824_791088_B6F6957E 
X-CRM114-Status: UNSURE (   8.71  )
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

The service-ready parser indexes hardware mode capability TLVs using the
full structure stride and reads their PHY maps without validating the
firmware-declared payload length.  A short TLV can therefore cause an
out-of-bounds read.

Add a minimum-length policy for hardware mode capability TLVs.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index ef2c2c300854..047ae8f5bb60 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -167,6 +167,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_dma_buf_release_entry) - TLV_HDR_SIZE },
 	[WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA] = {
 		.min_len = sizeof(struct wmi_dma_buf_release_meta_data) - TLV_HDR_SIZE },
+	[WMI_TAG_HW_MODE_CAPABILITIES] = {
+		.min_len = sizeof(struct wmi_hw_mode_capabilities) - TLV_HDR_SIZE },
 };
 
 #define PRIMAP(_hw_mode_) \
-- 
2.34.1


