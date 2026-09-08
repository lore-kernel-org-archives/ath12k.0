Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD47C79F82
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=; b=K7E/qq3jkvGA+5Ecyg3turR8QL
	tBWm6H7urwQWiJfW6+mvxb61diu/4GFfUpqBZra4b872p/iX/BOEXell8Z5I+Ttdnk40VQ8JNPEFH
	1NX2Frh9lIcAmKzutBrZDNTbK/PdFURn085zwhH+J0vcvGxcSap80/1pdIWkZSu27E7y2rUmUeP4s
	kT5h8zbUIFt2d+wjURQCbR1glMrBvXtZgl64kPjWFp41ybWxRZbQSeZ2cA8xWlJAWXkKi3yIlkaIO
	gUYP1Volr3KX4YPqSmCIJ2vJLeAOdNo+RzZ6HybkrPE4U26JftRHV25IvenqgiXxB/gTDYrtqYICH
	lOH7QJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sCR-00000008b63-0Gd6;
	Tue, 08 Sep 2026 09:33:07 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sCN-00000008azu-1aZM;
	Tue, 08 Sep 2026 09:33:05 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJdN2ysyz49QLK;
	Tue, 08 Sep 2026 12:32:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788859976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=;
	b=TxRK/zqrn0zOt/gYgpWk+C56V0b5l4GI5RMZQ3gzAuMIIc1kPO7Zef7B2/BTyhfSXDLZ1/
	+cgRjhZ9oI9i1vWNsNXI2/MovLQukFPCFh9o8O5nePguEV13TfxqvKyGBm4XO+hXfeR/ra
	4+h9P0pE0HV7uarfgSGY/DpoWP/anp3yvdkK2J1m9pvh6vckNq2BkE6vUYFW6vVVUyMJsK
	WufzJr45QPX4RIJofZFWUtR0LhwC7Uu+Yc5pjLMy7cFbj8eXtqyI0VuDsAUUTL0B/ca/2Y
	4q17vQ3cT48pssDa+3qmYXzsz7ybjxzaF96Bkl3X2Sg3TV2Vxubd7K25sEuEFQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788859976;
	b=qK2ohW4UcoOmYfde+v6ybKYPYHamoy+Gsrje9eW0dMIZpvbJ5cRI8Q9sAhHagLfMIxzBgb
	7pitTtUOwysYfUjdYT+KVmwLTcnK3LVURtHt6PrYgwCDklZvTPX04gAIVGPlGmL4MWmPkA
	csF9e4SPpUD0OMExceMmR+giR2I/QMKbciua6sW7Qp5HLMe3c1oETWK92KA63c0dwcDGj9
	VqCgabGja46F6bYR68QLfRogzqsqaMwUuzXOsJYPmivG4LZf4EjalPnQncjAYbtpTNO3Cu
	DRDkZV2kis477qySDP50pUOVUG4Rm+lQATHuFKsEruD0t6qamlRYcqTv71ZDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788859976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=;
	b=HSECU6D8Xz/4TS2C85Redu9WOUmB34fXnfz34FaZo+Ab0k1xpK7/stKdniranTKHsDuXDL
	rJt9S8k4mOJeA69VbvwGe2gwC+qeoMQo+GGQ26W3LGFqCvXUulRM6y9bXzNIBWRyhzsQLG
	2d4Fa63Evr1tTSb+IECKIj27QfkYO/Xwp4c9y5eYCDsGt4ufifktFHMa6IsAbGt7lqg/Rq
	BdqUVP/UV5QAXKxXbyFe5x3lvW6gmkBB/UhtDyWYb2I8A8cb/p8UaLIBYX0ygW/a7lcJLb
	R8G8zGLBfoiTLutfIeRZAEGUOUZocPGkl4OV6RJK+08q/D5eLBP7QfmhHl2KqA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
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
	Mihai Moldovan <ionic@ionic.de>,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/12] wifi: ath11k: add QRTR endpoint ID hif feature
Date: Tue,  8 Sep 2026 12:31:39 +0300
Message-Id: <20260908093145.2492666-7-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023304_401778_DD54D495 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Mihai Moldovan <ionic@ionic.de>

This will allow fetching the QRTR endpoint ID via hardware-specific
means.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 drivers/net/wireless/ath/ath11k/hif.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index 017fed1b4bd15..2f1634bb9b181 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -32,6 +32,7 @@ struct ath11k_hif_ops {
 	void (*ce_irq_disable)(struct ath11k_base *ab);
 	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath11k_base *ab);
+	int (*set_qrtr_endpoint_id)(struct ath11k_base *ab);
 };
 
 static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
@@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
 		ab->hif.ops->coredump_download(ab);
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
2.34.1


