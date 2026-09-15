Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9A1C88E73
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=; b=K5CM1c6Kr6+jqPma4l6oMZuViH
	+1PsWRp1RfkFvrU5oYtLfLyo2GmjOE0uykCtOD24H+zGQ1i8bQXxqg9Bx/JI7yhY0K20la3yaAaEx
	wtHCapW0wufahX4+ef8KDzOcUkFYjuxg1Qltn7Pyfbejad0fkzERcoQFOFtLrb9cf3PdIgu4bJhvH
	zp7u9UeheQkULSqsDUdKmCpkpc3GM5jTs0qraRLmGAt6B6jNpdNTM5SG+xwnmjkkPV9iSXLGEUq62
	Krbo4zclJw6isGCAf6ZOT2LyKoyi3TnCoHn2UJAiTVwgZkgGedeQtGk+2sRKevx0ozk7s5h6MZpip
	14lWAl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NrO-00000005WJa-1aVt;
	Tue, 15 Sep 2026 07:45:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NrK-00000005WHu-0LbX;
	Tue, 15 Sep 2026 07:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=; b=ENmsi4xMojaqMwNMUVKPE5fEwa
	OMWmYvCxnACugmGqWTfyCqnq3g5AprpKwuS1/jn1coW0VfDH8Fx6PoGe0a9NZGFRSG4GSr+YiX2i8
	6pZBikTzQuSh8TbxRCktetr1yaukIxVBdq/ikJl/tv3uu8DNDQ21JreHgvTh5bOD08e463moC1LC6
	zoq86q3NJdZLZNXRHv+Z2d/G9sku0Wxl/d5Itw88P68t0pq9Dkszi6tZK2Mf2Eu6atE4aF3EOpucr
	uHRid9pkWbCjPbOpQhLOq2KMPaLy12yUrT2sIB84wiKoRX+DLTlbpb0bbREXheVgYVwZLsB/HP5hP
	yJd01b9w==;
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NrG-00000006OIi-1vRw;
	Tue, 15 Sep 2026 07:45:40 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkYwD17PFz49Q6x;
	Tue, 15 Sep 2026 10:45:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789458332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=;
	b=GFI9TFNcwhRqA62Hr5qFGhZk+U388b3j0kbMGyCuLGxBhTr/19T/9e+nPa8iNhBawQp2Sc
	MnpEev0653GuSc82GOh5Weg9S4hkbWTxWjNs43k4p7hgFV7+ZC7QiISEFMQey/ShYczJ/G
	maKE7x960QmIF/IPuC5HsbosnokbEvO05AjG3lHSSZ8KWz/XvbuOHKwZb98ltl65R6WdSN
	CVKfmkjxXODe2l6oQ/Q9NjrqZBPcW5R69jn4iztYHuJTGyZvP/ELwjaqLpWzBaChK/pVkC
	juSvSjuv3YE1RPVDTHW3d7yoMXiDshBUUK7woKTUZTaJq42pmNAmdUdcj2tBhg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789458332;
	b=vGV1q9uOCXnIAbiq6g+n8Fh4+pyPnn4ZVSgSZyj5krs4bh/LxhPnoGuq1nEM8YtU1hydhb
	qzxPR2BJFtWVCxcATV2gWHt34RMIrJYPyosamsMUUfcVuXg7+p51oFFnB0fsMm88IH1xfl
	jTdyl8GrbG5uQy+yq2obKhMMR+NGm2um1A/SImm8dpAVUP+ldxTQpjitxdmTtJGrGD2ce6
	gbhSTzXd5cWgvztLl+Y1FT4H0dKz14TFInNaiRpZQ/KXzRbFHFmcbOM8WF5xDcilhCrEY6
	7hxN5LDLtExhI3SvqoZJ36qyULPaApZ6LSDhU+DpzM7V9l51M5mYIgz+BTDv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789458332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLt+l40Q3PpFquTJGHV0pr4yqekDZGuuw51X1SrFTE8=;
	b=HYZo5SK+l0RWK0daZpPhBvo5TCKGKM4SkrIV0W+0vIzM7GSQa7kTwt2jfIWVmLgwUvhTXL
	r2bu/np+f2G2T1YE+HNIF6dnajxYmmGnq6C3xwC/70SWHCVX7ynzXJWQ9u5bd79NCXaqud
	mbVnlSAxR/PrSYuEloCgyaCl0xtTHXRp6uxLf2R457uZTs0IiOPLfcXMLJl8pLp9xT4SC/
	V9sMx2ptlaqATniV27GwpY+UgefB3P6Sm0FDdsOQMrlYTIvVT03zM2A5MG/AQW3Tp6IhHO
	U81xEUTLiP896fOJy9p8VcjHad2iI9CN1UVJFizweYGPkQIOxpgQvyvNTb+Gcw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Mihai Moldovan <ionic@ionic.de>,
	Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH v4 10/12] wifi: ath12k: add QRTR endpoint ID hif feature
Date: Tue, 15 Sep 2026 10:41:33 +0300
Message-Id: <20260915074135.2567411-11-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084538_886383_1C35822A 
X-CRM114-Status: UNSURE (   9.02  )
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


