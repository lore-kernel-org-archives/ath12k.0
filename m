Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5FB606A330
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUZ31iDs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dI8vWhUV;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Ve9hkycH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=; b=bUZ31iDstDah9e
	c2n0LRDT+8fG9wus6t9V5qDyK+nh0AvDxlWIxegkR7imorZocJINQzRjsIFZG/mvX+qL+KmOM0CFR
	EVqJoBibI7Zf4poj9sgREl8mUH7dKbe0iP8RL1uLt0LQPn33Mr2N/naXIdGbGGjMefEgaVwYyeuuu
	q/wW8bCGX9O0nT5RejnnSTZkIeLrxQlvYUFClswSjN9sFrZU/xnUYp1fLx9970uJvPgF1mEDJTEuX
	LzEWd8rexOx+26Mn69a1Fr7+gsVssMjCx6Ht3wmNn4R2T/qiyTZsbDWyODsFhowSEcihNa36gmL1H
	B7bTZwu0uAQP7h4M//Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3M3-00000005zlC-2p1o;
	Wed, 11 Nov 2026 08:06:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lz-00000005zgL-3rlS
	for ath12k@bombadil.infradead.org;
	Wed, 11 Nov 2026 08:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=; b=dI8vWhUVgHZ+eOuT5SDtqgoxXj
	59Yiy6ywOS/RSXJvW0x2+hl66dGsLeX23N2pz80oUff64HqT0l9GB1CEkhRyMUK/WiKLGjFCK2l2E
	xAnJ5PwVJ22FIO64P2siZe3Zzg/YSVOYiLmFfGMLXAVhfJ7LIROojcbt+tW7hJQRuWpg8/7Wn0GkW
	gIGbqS/BPwnbvtlBXnj9eYKakCjyvMPClu5hKM9cyKZSpM5lFDzka029HpZ2LteQmKuTyBJHzgPVY
	3Tm+yErPHL7U1tXugSkWiIYPdm62hxmPDWK9e4UuQZ0qWJeX6HZnZCptq4o6xynqdXMZUuERHPKF1
	2e9bFOcA==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lq-00000008t6w-1O0o
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c5059958d61so241268966b.1
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384396; x=1794989196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=Ve9hkycHBNS/nYRditaq9eQ2vCJlKWqrbyucCtlWr0lPBgEkMRzZf3zEiyuzyovjWl
         N6pgl1oKhgoppgX8Za8BrpDcEj0uSFUnWuKUkJNCrhuIImoRPd18p3Zm7svkjrHcfETs
         THGtAugGTYQUQBexsTXnbRJ54064r8r34DFxjR8mUwLKkg8K+/aJTjhll0kRRXwyIDRF
         yysOta2dD22AtWi8kSBdNCz6EHATgUuwcWcpdExMsD7yt5UqC6FDKAm6y8N3eea5F6fZ
         zxUqqQyM/MJ9EbOUceGNARDix8GWgWnUP/OELrv7zVUAFm8pRzdtSAjCnrbgr6TJLcex
         pEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384396; x=1794989196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=u14LGdWPqWiH/xY6yTr22wT9kPp4KjEZA7LlgzLzhdif1uGbvfXg5sRfWaWTEdSr9B
         uCs+kSp4p8X29eHT+djNxaMlITJzPeJXyKpHd68YVxa0PD88M32vabjY0BJZfIoPSBBT
         bE6MGTtuJ7kOs2b8JBdosAWqYk1VMEbldm0qPSBQ56vGWauIs/8LhcQiD/8jyPdwuI/S
         fA/ADIsB1AEi30HUbjKq9t5xu71euMoJOENGeEYVj+jicjc/x/lPRgDWgbd+uChcGV5H
         vgbwJFbmOmgMBkNhumCvPiy59ZsETLyNzgYpMMmZXE+n/acVWsl3IDJ903eXNnRnD6LP
         pE8w==
X-Forwarded-Encrypted: i=1; AL+hErEkCoj35lUYx10Fs1GcZ52bbdlbC1fZ8C1tRhTaDbKzdXYCiCNrZ2Bw7kIi9xo0DwH3rOzBELQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8RYAQp+R1mEpFG1bHomO6QyN8VvzTi6w/R0Hilw2xiHEpCg8Hy
	dUeC8rU75gFv3rdGPBmcpsiklr898HU9EnM4W1ay+P2GOoYjfciHutxZ0WdGNq+66g==
X-Gm-Gg: AYBFou2RNRNPEWlsTHP8qWcUFB192b2X7hJpzVXjn4Ick9pUZ50tOOs6B0oJWvW33Zm
	FRZVqgdjAhlqvJaHADHnB+ASoBYlO5HQTIVRR5Aicy+xndpnYbOzpCtLcFUSBCEjLXStbgs4yDe
	BtoC01CU/h3n6pzzAorUwM3EUycs6aT5RzZ8OOE5InLeTRgqsmoJHI+p+4cxpeuoQNGIT0v2g9K
	jNvVIXgGGm6OZYxpMlK9MoS5mt1tFqgWQR8FbzcZz6xbngmoaNOhWf2hgGWT05X4E55VVp1UhzV
	Qegl9DhXamWgpNVgiOZpt7wq+EyalIyunowKycHvWBZZlNlfrNSe0zd+ZrvxYVpniV0s1BuoOtf
	P02xMopHY5wgCbitT/847lR+EXKjI8LyoxuMwzulTCTSLgZWskbzGQwm26SqwoqgP+qFzSHOxJx
	DdGK84Yt8khZ79cy9n5O3ClfdD6wRnHCW1c0aP382j5ty0NYNlD3MGuyagi/d8IbNO50GFEGMvs
	SP9ajRzHzvVZ+vrgqlWt3r9yRtlNbdw49Dm0RlYKjOYpdVQcLgp0iNTxhiYUpQ52+IjZZ3RZ/lh
	0rOyTMc5d1aG/EzN4mePN66ZUILHT8bV/Nty/mzO5tSYhDYwNWXc6i6AqB3rO1eTgX1yq62gjsI
	o7h1+unSU2LXlL7DuK+S7PCxKm8mmq5swf7JvHHFaZzatCe7MAEAdeUYFE2ZLR8+3GNzi07vHNu
	mPhewzxal/ddQ7u8kqaZhTJHp6Ul2EmJ5/q6QF7wgAENSVOySP+00iEIk6xl7rm6IWXdyWxXC7H
	aUkKFzeDda/tYTUhKD0eJpRWbXQdVsDM/qFnjBhmGUFxxSfxubHNgjXCU2m6FU/1LK8vh2bsB9K
	EjB8YAqT09N8ITv7u8dbzP+MaXhwdGjB0XwVAxyi
X-Received: by 2002:a17:907:d311:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c5066b54812mr120674466b.18.1794384396170;
        Wed, 11 Nov 2026 00:06:36 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] wifi: ath12k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:30 +0100
Message-ID: <20261111080630.244427-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_080642_747441_B27C4F65 
X-CRM114-Status: GOOD (  11.83  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath12k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d2..ca1d8720a4830 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3994,6 +3994,10 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0


