Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA0C88E73
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=; b=bA1EW3p9dM7rCvUdfCqeXfuQmj
	CFxf2iDvkxJQjc3oXRqSSR9dHhTMyUlFsjP3HTpsg+fxy5phEmb+JXWDeRXOVYdz+mqzGfoqj8qej
	o+2yT/cNrgtB0tI/6uWnJqRUxOh7VNtrw8o9ASSE6NNNl72+nqUjkaW+hX6UC/vaqJGDcIJmtF8W1
	rhq+osVV1an09Rq74Jwh8ekZ1h2r1aXPyH7Oyfwlaudo5n0LlxIlLTCfJ8nJRmf1/T6NKV9jpi+fq
	J6VRXbm5hoNNMI9o8yjNYGIKuZFOvgRoE6luWG7tOjqoKzeb+BZYZEuy2M2lmv+jvK0XMxutdfAMa
	8W4z0Jrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NqF-00000005Vn8-0vCk;
	Tue, 15 Sep 2026 07:44:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NqD-00000005Vm1-0WPk;
	Tue, 15 Sep 2026 07:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=; b=n010qjVUNLxn70aRhLhT+YKhDC
	gYlyyih3my299SDOEFZOrQVKeTJov2gI0bGTMuJ7NQp1S7iemJ5F7tzr3Qx6+9OqvIOAZUDzNAAhO
	cbBU3qW75WkliNfHsw7gjZiMWfaCV3FvReHUMJAOW6wUvVv8gc4q4at7UWfIj1f+aqOyqb3AfNFtv
	4M0F50LxcGoc3rWzVVXSFoxTiO2yekH2Vtf3G183XM09rKmcQ22A3+sqlV/9IeJESDF4QXE5eWzY6
	GsAY2qBpkspuJeEB0eHVtkl5by08RDskAfz/5AgOfpXdilQQgzSWWxWDkbowHgYv9hUhKzHPEIdAz
	65vjNFqA==;
Received: from meesny.iki.fi ([195.140.195.201])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Nq2-00000006O2z-2UlC;
	Tue, 15 Sep 2026 07:44:28 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkYtm1MG7zySb;
	Tue, 15 Sep 2026 10:44:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789458256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=;
	b=mx9ZOQq6/28oaPH57sk3CDTqlpa0h5SOKNq7X4s1LhPXQNf88X7s2EsHBNe9sOJA6pn+ZJ
	no/v4mZqCUEdxqM0xIZ5l4lFlItw1hKa//TqjVitdBZ1Gzp/9FHgwAhtH+qSua1k2RJi2e
	PmHrGDGDF+XZ1c0h67xiaXnyIdRpKFE=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789458256;
	b=GG+oXz5+E9gLaBV0zJ15mKV4vkHL2sbX9j8RL9e4mBnSuE5am3UQffI8CP0U0C/ROvAIFj
	vqHcCThi1EwAs2Nu7+ihqnytPK1lgMDNBvaDcyFz+8FQQiAr+Bwdd+7FQi6vjM3hI13a0W
	F8aV4G+2Lb3T0evQYux9vmCb5v/cvYA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789458256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=;
	b=ezuEBHqEi4sUifa1XjGIyNKO+3ckhBSfZSj2o28KOsiRxzyHcQAenUOy4nFpVeU46TzL1g
	U0aQR9r2EFZUtToheuSgZ26LwDtKet3S7IXwvs+AImgKY4KsVpDqL5MfS/VZDDpYBMDn9d
	loYnvYRw/PkRxtKdBuD64izBXF7JA5w=
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
Subject: [PATCH v4 07/12] wifi: ath11k: stub QRTR endpoint ID fetching
Date: Tue, 15 Sep 2026 10:41:30 +0300
Message-Id: <20260915074135.2567411-8-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084423_146824_7C5FD013 
X-CRM114-Status: UNSURE (   8.01  )
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

QRTR endpoint ID fetching will currently not be available for AHB.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9c..1cd81d2ac1201 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -798,6 +798,11 @@ static int ath11k_ahb_hif_resume(struct ath11k_base *ab)
 	return 0;
 }
 
+static int ath11k_ahb_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct ath11k_hif_ops ath11k_ahb_hif_ops_ipq8074 = {
 	.start = ath11k_ahb_start,
 	.stop = ath11k_ahb_stop,
@@ -811,6 +816,7 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_ipq8074 = {
 	.power_up = ath11k_ahb_power_up,
 	.ce_irq_enable = ath11k_ahb_ce_irqs_enable,
 	.ce_irq_disable = ath11k_ahb_ce_irq_disable_sync,
+	.set_qrtr_endpoint_id = ath11k_ahb_set_qrtr_endpoint_id,
 };
 
 static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
@@ -830,6 +836,7 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
 	.resume = ath11k_ahb_hif_resume,
 	.ce_irq_enable = ath11k_pci_enable_ce_irqs_except_wake_irq,
 	.ce_irq_disable = ath11k_pci_disable_ce_irqs_except_wake_irq,
+	.set_qrtr_endpoint_id = ath11k_ahb_set_qrtr_endpoint_id,
 };
 
 static int ath11k_core_get_rproc(struct ath11k_base *ab)
-- 
2.34.1


