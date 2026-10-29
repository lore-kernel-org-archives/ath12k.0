Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD04606A325
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HCxO5jZW;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HvoSMLF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aoUcE4jW4bQxv/LnDQVtD+YTMRbVscoTT0kJbYmugLA=; b=HCxO5jZWEZXwVK
	Oa+WI6SaRLSRLQuwHwbbTYD9B57VFcTDCn55qgzl+W3K9qcd8HbFsxVnD3rDFbZG2ZhiN4oyAj+VN
	RsBWiPqEkcH0lEK3sUYj4VB2+UPHQsezyfwKItVxuz/miG2a0AyKF5vCMh5iduoyCB2TP9S3+cfAi
	r848rL9x64XNe+8yalTL0umYpQKMiGi3c9VGnkS48D2T/tPOwu9t9REsET5LRPUOsLU4gX+7V9/Qf
	IXmmPdhqMV/nuJX6snHux0LxTF9/Ms4szuRH4hzDnm4M7xdL/xzDFzSHHLvi4urEH9cOX5W1FJU3x
	gqWvP6vEXRNZtTZMR+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHat-00000008IdA-0tcD;
	Thu, 29 Oct 2026 04:18:27 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHap-00000008Ib9-2cXD;
	Thu, 29 Oct 2026 04:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ao
	UcE4jW4bQxv/LnDQVtD+YTMRbVscoTT0kJbYmugLA=; b=HvoSMLF5H/ii/Ogrfl
	ess8utIJ11YAdLMZ6IPLfQqCo5WT0z9HA75N4RJYQ+wHj8C94KILE1A0QNjLTZYf
	r888hqCUjsk5GtChyHTRgDW88TWUTuxUXYNLNkzX1/H/XLM3s8HZl4Akmr0yP0IH
	jSRSn8vVMm4qIaH6ahVuZ0R5I=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nzIDyeJqQW5fDg--.62716S7;
	Thu, 29 Oct 2026 12:18:14 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 5/5] wifi: ath12k: validate service-ready capability TLV lengths
Date: Thu, 29 Oct 2026 12:18:11 +0800
Message-Id: <20261029041811.2379878-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029041811.2379878-1-yaojiale02@163.com>
References: <20261029041811.2379878-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nzIDyeJqQW5fDg--.62716S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Zr45Zw4fKr4rWF48Zwb_yoW8Wry7pF
	47Ww12va4kur47Jwn3Xa1xZa4Ykan5W347KFyxK3Z3Wr4fCr1FqFyY9FWYqF15tF45tF1a
	9ayqgrWfAFn8J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URrW7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wfGAWriyQfuEwAA3U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211824_025579_67FADAD9 
X-CRM114-Status: UNSURE (   7.58  )
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

The service-ready parsers consume hardware mode, DMA ring, and extended
MAC/PHY capability TLVs as complete structures without validating their
firmware-declared payload lengths.  Short TLVs can therefore cause
out-of-bounds reads while the capability arrays are parsed.

Add minimum-length policies for all three capability TLV types.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Fixes: 1476014fadb6 ("wifi: ath12k: WMI support to process EHT capabilities")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 0109f56fd429..2e72159d20f2 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -217,6 +217,12 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 	[WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA] = {
 		.min_len = sizeof(struct ath12k_wmi_dma_buf_release_meta_data_params) -
 			   TLV_HDR_SIZE },
+	[WMI_TAG_HW_MODE_CAPABILITIES] = {
+		.min_len = sizeof(struct ath12k_wmi_hw_mode_cap_params) - TLV_HDR_SIZE },
+	[WMI_TAG_DMA_RING_CAPABILITIES] = {
+		.min_len = sizeof(struct ath12k_wmi_dma_ring_caps_params) - TLV_HDR_SIZE },
+	[WMI_TAG_MAC_PHY_CAPABILITIES_EXT] = {
+		.min_len = sizeof(struct ath12k_wmi_caps_ext_params) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
-- 
2.34.1


