Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E485C79FA0
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=; b=RHMwXpuk2aB80G55GSi5KYgdhg
	xNMf90HVyFXxCsYa94rvHccMvdQn6tOaQ3cLnZut1H3p8sFORfIxZoFNv2vO6HrIPqcp/VMGH5ggv
	Sb5/jPX3ofU1zbdeCZHeiBkCNiwbL+px4PgTmg9YPhJ9EeKNjNkNtYEs33cj26xh73fwkAmrZ8WWg
	K09fGaiwX2leCGXNRyU2J61LWr9MsiR8Ky8cLp/0iz9hOBlGPhuQrAd8FtuCtVl5pyaDVWOwLeZ3o
	hBuoDcifkkTgYFs9xhq7S7hqrN5XfjkLrAkcpLHat+1RA5Ip8qbsG50jjzRez3rj8dJgz0adHYQ2C
	tOIl4XIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sEZ-00000008cGB-2bzY;
	Tue, 08 Sep 2026 09:35:19 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sEW-00000008cDO-1kXC;
	Tue, 08 Sep 2026 09:35:18 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJgx3rgNz49QLK;
	Tue, 08 Sep 2026 12:35:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788860109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=;
	b=Wij3vA3qHeTLjvCPJ7WOj7KKQLl8UOkTVXcWFwM5Bj6O4Ywtv4LWYCD2O3H/jX0G34kLbs
	gPSOaYjgE51N0i1i+O6WxqisSICPOho6i5ro6Gnzp1TamGWKxgU/WGXrmPtPHv5wjSz5Rc
	AczuUtIaYDSx9A5LO30cImk1Hdu5v+qPf9PdPW58mgzii8bRAjlgb3cjVb5V97bNJFmGSR
	gLUbJf1l1Ms9XyRg7wigFto4N3uZ6b2w/cyWg9jIca6Bj0NrZk9JlgWNQdxKUmmz8oWilI
	XiWeiP9RqwlkHJGt4pQz7dVX/ZsfaMeCbeThXhZP0k44MfSBjgucKQTPYbdz5w==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788860109;
	b=tZr2OKxyO1DVcdaxUVrByxW+mf8K5jLP0VM5Ziykng45zL65zqg/2WtB0eAi5DU0d0lBCr
	PEdcGJpisWJxc0aRT9685X5i4zImTKPxPqcwJ/4jvB73d6e0ce8UwjKmZH0yskd+S1GurB
	eVJc5F8AwKlAysj4w5SSTc0ld6jbIxy3PgPwRVJ3bW3k3pDsROperWl/6Sz4odixXw/dvA
	ZCazhGHAyM2NvXyzDT8aGKncs9+o3osBiqAaGhLMQ6F44S44aL01hRQwnMdfgeDPNFu37a
	O8eA2f7sgxGPKX1kCXO2mlG/NqxHyJHo2R6nEQIwjqRDY+cZG+vBz4VnnU8U1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788860109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=;
	b=kQvZO3LWmNSU2n17qYJ1c3iFq4+3bAGHJg+jiYCW0mrfWh+jZ3dWv9ndXqs5NNMltoldaS
	vjVv8wiUMm2DqbQmKiuf0AwMZJbXpQyvfpZ2qsr69mpItxygmfzBQ0/0cyyF63ODAkKvDG
	D5msWJhgfd5EhOxRtX63Anb1dH8j8M1EOI8cLy5cF8aldcMzsXN1UgEy7kw/LCLwzPFGRt
	em0jZ7VPLy39XShfilSeNF70PB7TR1p/cA7OtNVc6Mye03YbSBq3/Ckf0JurKz7SGXqh9l
	Ep63WSwkDZiLYc32U6nX2rxv4bFpXivJc4jnnu+9qttjk2/i/CKmhhTheX0BKw==
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
Subject: [PATCH v3 10/12] wifi: ath12k: add QRTR endpoint ID hif feature
Date: Tue,  8 Sep 2026 12:34:35 +0300
Message-Id: <20260908093437.2493698-3-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908093437.2493698-1-juha-matti.tilli@iki.fi>
References: <20260908093437.2493698-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023516_609997_084DD51E 
X-CRM114-Status: UNSURE (   9.09  )
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
 drivers/net/wireless/ath/ath12k/hif.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index 4de8667690e91..4591660519efb 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -32,6 +32,7 @@ struct ath12k_hif_ops {
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	int (*panic_handler)(struct ath12k_base *ab);
 	void (*coredump_download)(struct ath12k_base *ab);
+	int (*set_qrtr_endpoint_id)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -162,4 +163,13 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline int ath12k_hif_set_qrtr_endpoint_id(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->set_qrtr_endpoint_id)
+		return -EOPNOTSUPP;
+	else
+		return ab->hif.ops->set_qrtr_endpoint_id(ab);
+}
+
 #endif /* ATH12K_HIF_H */
-- 
2.34.1


