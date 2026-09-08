Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B3C79F82
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=; b=3c98bmgZNIrH3/bsKQjTrWzBUp
	2KNF3eLYyyz1PQe+Wd4QgAVdp6SzYVV/LEeUrJ5EaqO7pCGtQe/yZ/Ej/cr3Py0JJ2PW604dTRWls
	aoy8j7j1kQVwaW1EZf6DjdAJUSjYw7Mh0xSmhNTgc6z96HM7drbEpieoSegW55BcvnxcWX5IcdG7G
	v/+mIows4kRlWQQLwMK1TEUZuwczHpNdPNRwHU8T3SVmGPvqRg93pfjkn679JWgqr67gbHRzbtYO9
	n3Ez5g32g5CroNcV4bSnQNAYX/fEVfcoKh6phh1J0hv71b+2UyE6yKjtBoE6tSqYIN2eKV/9yuQak
	GSsAAAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sCY-00000008bHO-32bb;
	Tue, 08 Sep 2026 09:33:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sCW-00000008bEI-30va;
	Tue, 08 Sep 2026 09:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=; b=QodCeDeeGe1hVZy2RU2S3iV7e8
	M58SNrZL65zHBLaJPuywXBVBI3PwjGIdbiLmnlIa1go8XD1q45nWEdh8NQylzaFlhH4wCaWyE5Q/K
	sgQ2L/TQ7XZUJxwVCkjwTawJRkrKqvgMGQFn4zEi9O2xERM1OaTa15Tl7UUJtXzJgwfGgz5RxocCu
	TuRqvCaSFdDKVGGoey2sEoO2sG053d11zYNZUwS5U2CR5lUFQxZjckzOxZ/12n5W5SgfUWwSumorr
	IeR91WnEwqKk8V0ovi5xKtSUE4/8uAx3ifWH6WZr+LG0iGhvNl39ycsB18xLilk0OL+A7N4/KTrOJ
	+u3Kg0bA==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sCS-0000000HCfM-1tka;
	Tue, 08 Sep 2026 09:33:11 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJdV69cMz49Q5T;
	Tue, 08 Sep 2026 12:33:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788859982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=;
	b=vW7tD3wIIVgCQQrTmPaMwzUOGCYk77EF3NVVkeyl+PtT59V0f4nxvf1vfTyBJ4yhHjs8sn
	CvJPMjO3KG6jRdtcNK9GFQp0QLeR0NqSjh+fUgRZf7vhwPoScc7jtjMIrbUECN38glbMZ0
	jgRS55tIuKJCdKbYeMUcv4Tyr7v9qHmvTteYTrm9eJCgQuucfbO41kId4FtqaMTnkJoSAR
	NOSQkIkdPpPHlT4MgbxP3DROiOFaaPLPYLuk6NvlnWOJy/A0uJFkJFNej2dHAhjj8H69u9
	ZXl+nf7hrLHzCjsx2G4VypEsxXFEC5bhklk5GIGCMvNiEuEdN+28RDwWKStkzw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788859982;
	b=J5Pfce0uqTTKFI3fcHbJfSLnSLf34lImwqmRun5dFCu6SmX4L6JbZQ4srrJJhv53LDm4Sj
	x3awGT5tsuyEXHn1DYR8da39YisJ497i4GgH8aQvvzjr+9FXO0iHfiKwmeUKWOVIAPtpcj
	xX6LprZnfOuOEa1k+DGrFyMG+3AYWclkff+/pLcRtr+d0LeFwrREsxNJ4kVao6PsdPJdle
	ediNSg1zfR4doXUdLwtsjYsXMjmrmyZ308Kkb6nP4b5E8WAKzeLh7A2cYcqXyMo+RyZGp9
	jHuQo+EhyLiRyBkFNKwh0b7OZ5ZhQpdINePNZAk3x03D8Fn0zQ1NCyDGWmEeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788859982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5udMw/D8l5XFimn7AbO4dlFXaCD2w5J+n7KjzzUgXYM=;
	b=ti+olMMG7KD8wtFkqqj1n6zEHfsKA3VDlBeI7rBdrAnMw0ufwND4lgEagunynsCIMJJpdR
	tjCjc02j1fpKVqqiMib8k910eWjCYQEXn8tCeRDq6Te59dRKcJnRM2m23Z/A7QPepmDyjH
	q0B9588D4uav37g/KGSm1gCxNZKCT0ZAZJrhRLuXxmgx+xjZlcTBRB0GkU2/Hi8fLSzuSg
	5rh+7buJ9gns5W2nuJ8CiYoX/KEe+b9a74MEjQOW//IOetrDj2pYq79Zo476jfyCBcRTI6
	EzIHq93wUnes4VmrePKcjhdQtAlOYyKgJHKUyM2xuXCeT65CV0M2u14QN4oDZA==
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
Subject: [PATCH v3 07/12] wifi: ath11k: stub QRTR endpoint ID fetching
Date: Tue,  8 Sep 2026 12:31:40 +0300
Message-Id: <20260908093145.2492666-8-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_103308_654670_EB93D9A8 
X-CRM114-Status: UNSURE (   8.10  )
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


