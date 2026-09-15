Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9993C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7bP4h3nh+VyKYPNxK0hdRhYNw+iBe49qjBNv0hFLYQ=; b=DWlL/7z4kBPg5JFs8yPmx7gbNS
	mRc+vws+yx0MceBlCHfG5Kczf5cj8ZK7jPxl/Zf2dKhxaeuGRFoipITgW0fH3TryggKyleTFbKCPI
	39q5UX6Drm8Q91T8xl/D9zkEoH9FlWif39Jk+LlqmJd6AKRYDfKOX7sqpT5/sTRkOvjWBEoLESZ5V
	HkdBrAFC1PbeY1CBWr99+FxSk8znVxvHVRTJPY7SAlprp4PnS/vRvnYAF59j4wa09lQ8LkhDS+xJf
	Vo5b2XGLa+0yI/vwA0OpRVn/tlIug3x+5AM9ody6MArLb9xsBdU3hxTVtrRvkvmai3/BVLBhS2+yC
	FzLwOKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lwh-00000005GAs-1ThD;
	Tue, 15 Sep 2026 05:43:07 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lwe-00000005G9E-287p;
	Tue, 15 Sep 2026 05:43:05 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWBn3tycz49Q7r;
	Tue, 15 Sep 2026 08:42:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789450977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7bP4h3nh+VyKYPNxK0hdRhYNw+iBe49qjBNv0hFLYQ=;
	b=sVHeiaGNP/zfL3gH363vJRvDq90DwuN9l+zVWA0twfnl93qerSbF1eBz6+TVExVqznyEwO
	wWyF/gkubG6gmuvMCGUr/OuwcJ0vz16TqyBg1Ht/QLrpfRaULmdcQEF8dpgVH+1kI3yU6X
	viH+sypet3ncVaBKbYDU2VAFiU5hiS9sgkRseB781lI8xLKF6+qyQXstpjYgPdc5ffjxVn
	vf/BkA1Itl0a4G919awMTJsZSLugoThM2C6wYtk9VaQN42SZ5TanuUWk6ZggwFzGRjKnv3
	dRjXrzI3+yjlowDxOYLPWmJ+CEiphp9fzpDPI/Sx7NeDMrqoQVxg0ZAOBM0cpA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789450977;
	b=LXOw6gM/RjmY9glHWveRDqX6ZVrXcPJ96GalVXWSS0Vr3pbVYD6wmJAcTABqVmrS/bJC1x
	IkmHSevmC62TyKYtMf8U9dCIK0nM9FZnRvh+R9jgra+JewzeDDmsDkLZlj706rYkZTvGr1
	wsLxAzernqx1Io0cszxW/1o37lMh/aWReoULEAt9VY2H9QZQaexSudh4Q+k5lR7+EXPAv8
	/pieZSsU3RnZaX1o5JGs5OSY64xnsuhJi6Pr8YpDZS0mgwUEnZqko0BSc/i80vzFEHWtNZ
	3BnPd24oWRuRXCltEiM6lK0gJFaHr86ojCQp388Qjet4QEpFumnNzt1VbfkFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789450977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7bP4h3nh+VyKYPNxK0hdRhYNw+iBe49qjBNv0hFLYQ=;
	b=KQX40qrRuWoD3Q0QRmFfJxJot+ew5iJWrrNwxOJoWcKD/YZ/wESWLcDuafqxMWmmF3oN6c
	5QYa/k1AF/KJHg83U3NsNMbA1tOhgtL/F+hy3eGr0Se/8yMg0FqLizmMmYLIRnz/xZ668T
	KzXRtUqTm+mqFqBtDXyadm2373pa3d8mK2cAlMJtNznur+fGLJdlKCmgyiDLJYzT8Lw+0y
	HkCRBF9JsELq456sFeE2QaV3c9eNhzD2aza22uwFnf8AI/p3KAFAiCFcrNIoUKE9Pbdwg2
	/ULM85nfIvi1mmenHGPZXljjLmZBaOfKhzan3Y/awyudzESnSGlWyjafrajveA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Mihai Moldovan <ionic@ionic.de>,
	Denis Kenzior <denkenz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v7 01/15] net: qrtr: ns: validate msglen before ctrl_pkt use
Date: Tue, 15 Sep 2026 08:41:53 +0300
Message-Id: <20260915054207.2513877-2-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224304_711054_7374FA1B 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Denis Kenzior <denkenz@gmail.com>

The qrtr_ctrl_pkt structure is currently accessed without checking
if the received payload is large enough to hold the structure's fields.
Add a check to ensure the payload length is sufficient.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 net/qrtr/ns.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index c5e7e01db2498..a3348e40d9275 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -668,6 +668,9 @@ static void qrtr_ns_worker(struct work_struct *work)
 			break;
 		}
 
+		if ((size_t)msglen < sizeof(*pkt))
+			break;
+
 		pkt = recv_buf;
 		cmd = le32_to_cpu(pkt->cmd);
 		if (cmd < ARRAY_SIZE(qrtr_ctrl_pkt_strings) &&
-- 
2.34.1


