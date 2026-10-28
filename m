Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF2606A320
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dUAdJxac;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oIctWJLe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OPL7dEgEIRJj2QJL0rYyg1bEtLOG5PHdhYLy2JiJ/xE=; b=dUAdJxacIMXa4Q
	QoTXGyXV9UfAFTGG2nbQF0H4KauzSNAcDEEP8Kv6QNYvwDfrLqyaTd7Uust0S4FNIiusKEc7nyMum
	DDqBD+HS9T9eLbAeZHx3/6EW6FlV3Srqg4ZTqUMVjiaT7BWZaHxWM8f8YXhCCbUO9v9MZGpGtnljb
	tdpGNeHvd6F5zpHVl1gDMh4UXEJde5ulV680KBSSZDs+87bbqDN514jcUs07A+Us/3MI01xaigdjW
	ow123tOCf0fS0E/OXSc5Epmls+EnVwsp3ObPiWr6lttKdJlgSxC5JDGmd3h7qFaKp6ppZPDzavhWf
	bsPlPnomgMEPtzkiy8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyJ-00000006M6z-2cYf;
	Wed, 28 Oct 2026 05:13:11 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyG-00000006M4e-3lRk
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 05:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OP
	L7dEgEIRJj2QJL0rYyg1bEtLOG5PHdhYLy2JiJ/xE=; b=oIctWJLeGhq3ThaFst
	zqG4GKRmwxVNOX/yGDyl5/RMAdpH0Cn54VaAqdd7kXsC1/sv2AgIjIJH4CsOH45T
	drLP099oxHor5r3zTxcuio136A71A1GokTXxNMvtHt44SJAK9Tx25gqbrp5gpVHu
	YEyzp+wH1uV1dhobgsiejj5Qg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3lYhOFqTkVqDQ--.14113S6;
	Wed, 28 Oct 2026 13:13:00 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 4/5] wifi: ath12k: validate DMA buffer release fixed TLV length
Date: Wed, 28 Oct 2026 13:12:53 +0800
Message-Id: <20261028051254.147628-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
References: <20261028051254.147628-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3lYhOFqTkVqDQ--.14113S6
X-Coremail-Antispam: 1Uf129KBjvJXoWruF47tF4DtFWkJF47ZrW5KFg_yoW8JrWUpF
	45Ww1UCa4rWr4UJwn5Wa1xua4rKan7J343Kr40ya4fWr4rAr15tFWFqFyYqry5tr1rGF12
	9a1jqr1fAFn8trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGJPiUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BxLhWrhhFyb5QAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_221309_295938_6B5DA674 
X-CRM114-Status: UNSURE (   8.68  )
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

The DMA buffer release parser copies the fixed parameters from a
firmware TLV without checking that its payload contains the complete
structure.  A short TLV can therefore make the structure copy read past
the declared payload.

Add a minimum-length policy for the fixed DMA buffer release TLV.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c79..ea7771a2eea9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -209,6 +209,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
+	[WMI_TAG_DMA_BUF_RELEASE] = {
+		.min_len = sizeof(struct ath12k_wmi_dma_buf_release_fixed_params) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
-- 
2.34.1


