Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65911D3B7D3
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 03:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCC57gc3tCM8D1Z95kGGCnDUeyD9ECQbOaOK++FHeZE=; b=Ka9KEEIsMBgZ2LOMD3lD2wpaMk
	r6Rn/kUKDaTx8IIRho/Z0oFkU4d2TH0wiTxDyXIxAgr6DtOeLzxezpCT+VDt0xBc6T6/52fzzLajs
	LWB0rl/kipICXuzCBwWx/WiAIaRNtDNEUXAgETVeGvKC1o88g+kDbAvrdkuMoaeaZpjSszAb3BLD1
	1ZY7GhpWeHI5bOTHN5vP4R3oXIoNWcZ2xsnlnD0g8MRfNiWXGd9tSXi9RuZGegTBf1VtZxNRUT0qr
	AwoMPWIuoS4MBcZKgk3LR5u24SHCY+MA2ZXeolIqF1GBIxPFpu4zUVqkDXTSvB6e2iC0RyaDKPU71
	+vmDoCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8s-00000006zMs-0cQ0
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 03:52:06 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8h-00000006z84-3AGW;
	Mon, 25 Nov 2024 03:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506709; bh=B0CUVB3BiReU1INqg0ftqJTFKqCT/0KKba8biA8OdJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGXpzYAFlJabh352FD9ZEGRCrkJnoaPntThsMRA/hR3WriXXhcAOIeNPHj26jj7xi
	 bplzQfOik2+bnP1z4McwoxGhnHbQQBrH9c4kJzf848nSUQx5hrZ77UBRN376Zd3iyK
	 EWkUUvnuYOnIvnUcmFn6Ge9KmyW6/nB8y/jQ260M=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 382F9148870B;
	Mon, 25 Nov 2024 04:51:49 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC] [PATCH v2 07/13] wifi: ath11k: add QRTR endpoint ID hif feature
Date: Mon, 25 Nov 2024 04:50:22 +0100
Message-ID: <9cebc829e915888bce0190e3791f425a9a54a02f.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195155_956298_82A3DC08 
X-CRM114-Status: UNSURE (   7.96  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

This will allow fetching the QRTR endpoint ID via hardware-specific
means.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath11k/hif.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index 674ff772b181..07ba45c9924a 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -31,6 +31,7 @@ struct ath11k_hif_ops {
 	void (*ce_irq_enable)(struct ath11k_base *ab);
 	void (*ce_irq_disable)(struct ath11k_base *ab);
 	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
+	int (*set_qrtr_endpoint_id)(struct ath11k_base *ab);
 };
 
 static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
@@ -146,4 +147,12 @@ static inline void ath11k_get_ce_msi_idx(struct ath11k_base *ab, u32 ce_id,
 		*msi_data_idx = ce_id;
 }
 
+static inline int ath11k_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	if (!ab->hif.ops->set_qrtr_endpoint_id)
+		return -EOPNOTSUPP;
+	else
+		return ab->hif.ops->set_qrtr_endpoint_id(ab);
+}
+
 #endif /* _HIF_H_ */
-- 
2.45.2


