Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E4606A322
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t//RdT9u;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=POlenbVm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p/LgAKhcWxgZW2ssGetKgp6sVR7mrLPRnCM5cql8m8w=; b=t//RdT9uL+vVAm
	ri1M+fmYe8U+tlKrcFi2NB6tXjLd8SXsZyKouXfcHuKxsTasFlr9ZfzHqEfAHfmagWDLrryOd55PZ
	WY4kTrBNfY3GEOJuXJHC/ny2k3YdzinaHpkaUwl6PxrYVr7D2Y9hwGFya7HaezDen082L4DmD+coi
	qfQWkknDyOUDWyClEJ7SX9WkA2KVVOPLZSVu4fQfvLe8XJJTfq6o9G70oSYMPMUs6PGQAAewKw3kj
	gPksiHCrj1vC3WZV66frO/xC+3DxKG1Az8tLCDNrzV591firgP0SXzsHn9wsr1gN/DiQvnm3XEtYy
	UB7FhLkIsMmxd3Qvje3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyK-00000006M7a-2usE;
	Wed, 28 Oct 2026 05:13:12 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyG-00000006M4c-3or7
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 05:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=p/
	LgAKhcWxgZW2ssGetKgp6sVR7mrLPRnCM5cql8m8w=; b=POlenbVmpa3p0oio+s
	IZBTJ0OQ0XNZKsNoSrBCgAfdods4q3AYwLIrtkswvYkLdb/1AyltRuD2Gny2uSVR
	PC0R0q1kk9qDbmjBJjq3IDMYy5MzTEjknCRYjnEZbOAvEosV1gWw691f9jCdGSTL
	hGES0AUp05Wwshq5qTO5JSiOY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3lYhOFqTkVqDQ--.14113S7;
	Wed, 28 Oct 2026 13:13:01 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 5/5] wifi: ath12k: validate service-ready capability TLV lengths
Date: Wed, 28 Oct 2026 13:12:54 +0800
Message-Id: <20261028051254.147628-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
References: <20261028051254.147628-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3lYhOFqTkVqDQ--.14113S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Zr45Zw4fKr4rWF48Zwb_yoW8WrWDpF
	4UW3W2yayrGr43Jwn3Wa1xZa4Fkan5W347KFWxKa4fWF4fAF15tFWY9FWYvF15tF45KF1a
	9a1qgrWfAFn8J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGJPiUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7x1LhWrhhF0RKgAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_221309_335308_3CCD7802 
X-CRM114-Status: UNSURE (   7.39  )
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
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
index ea7771a2eea9..730dde686626 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -211,6 +211,12 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
 	[WMI_TAG_DMA_BUF_RELEASE] = {
 		.min_len = sizeof(struct ath12k_wmi_dma_buf_release_fixed_params) },
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


