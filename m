Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E69C88E73
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=; b=x9j3C3+Be3NLWLUPp3D92JaZ+L
	nebjAFwd54DrGIndBmSGyCxJH/ztil47gdQ3vkZjdsO6INxqwu9impDKCiu2K5dpwzypA7SqLg99z
	HkpxOBW5CQ7q87FRjvl98QHcwm2RN74rXmDjXPsS9fG5rmTAQC7aApxc3OnZrPkwJv1cKsdONAKyF
	J66t3eNIKD1Q2IsP5dniCmF3wRyB2z54Nhg2231w17ZZQpnAZZf02kJAzIhF9Nz1SsswHqm+k6dZe
	xkXiTJfWoV61r4I+/yhFovlJie01xqao45+Rpb7pnC6Ap2SgrqbDHM+xm/30Y7CNpjOW4UXXGW+6r
	SJDIuncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Npr-00000005VaC-1Skd;
	Tue, 15 Sep 2026 07:44:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Npq-00000005VZ8-0g5M;
	Tue, 15 Sep 2026 07:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=; b=VfiH4vhi1q+vAXy7q5625oeRnB
	R9CwPvHpELhvqHbb+9o6cK8u3g5l487IujgEDruf0ORhIafNgMfVhe2EXxMQikcWpkphd7gVYIvEl
	0P9zlm7vCvl+unJPeBj8QnL9vRhxPsTxR+BX0tO0h9ZeHQcAYeaIqnyaE0VOcYsPSpPr1I4hQuSvH
	td4XbgG06dXKrSuGe3wHruDRDmRSg1U629QwauQrjSpA3nu7tGs/NG7/O+lqPngWWow3UnFC1DBDp
	O5lT/kteOC6dfKOom0ypnDb0pY0yehO7C5Ryxk2xWo1EtiHzFBgjXLEwaejuW6HLrISifpE2tI3WB
	AZPU/StQ==;
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Npl-00000006NzI-0DMq;
	Tue, 15 Sep 2026 07:44:09 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkYtR32ZhzySb;
	Tue, 15 Sep 2026 10:43:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789458239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=;
	b=pUFqNekweAdzIq4YSdBxeOrQYwOYPxD0TYoIHnqbn0ic2Xd8R66/xvWu4FIQdu5bnQiTxZ
	uXO9Euq6n5lJxSXameNOZEH1vL9dkGTAQ6OdmeiGeM2UzN5HvZEXJVRrlFraVVxDKIiKxb
	HCtL9P4aM5yyUiJhJIf3kMJOvP+cuf0=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789458239;
	b=k1P6w3mJu//26d+8AgghmkqRaZg+tHLoO/fh55XKuCTRSDeiz2YuMls7FL/ikVj6Y7+M0G
	/rcf2oX9LMbKeV53/kRVhyJkoKHTcO7hLRnDGJsBKHDPPhojiPvgSilyCcfp0TEAReu40O
	upAXe3oy3oeZEloKPpmod/OXOqSu0M0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789458239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+g3+5hKe1GDXl2AMiPOwBq2BGyQhQR5x73/iaY9V3w=;
	b=YkghHMm6nd43qa8lgOwAbme70nsTz9pJVxwjgoX7Yo04P2i3gtMvqAg/vpGzgGbzHrLODN
	HPW33Io6jo6913AJrhQGSBSPh5boPMYKGzY3kgk26CEcgezHVBTezIMsrzwLBlkxzz+bQL
	pF2rfIzQJLwhwW72CBsgQgPJA2nWrz0=
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
Subject: [PATCH v4 06/12] wifi: ath11k: add QRTR endpoint ID hif feature
Date: Tue, 15 Sep 2026 10:41:29 +0300
Message-Id: <20260915074135.2567411-7-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084407_258569_845B6702 
X-CRM114-Status: UNSURE (   8.82  )
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


