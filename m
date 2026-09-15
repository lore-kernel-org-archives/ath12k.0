Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF352C88E53
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRs19l52ovGuAIjGa7YqoKMg2NfGlSjJwTPL4k7vc2c=; b=nxJGXc8vnI54QK3g6z6pRya8eN
	16zQR1egJ+yuzVG3a47KY1rLixFnfsu+3GI/82IOr8o/fyOqPjXiS6Wk5oXgi3WdHGlV61PxI5iBl
	GpJIuYYwRwSGM23jTuu+S5IoMU3YEW5OGh8i82ghssp4bGkqrPDG8YKUWlq6CZ6M6hGg22MCxqaCt
	QJyIiSKi4NFsi13FGGeSgg2Uy94Ls3acnUmhGcW8I1XF/XKGllremUj7GpbZaMu0brJ+YGvagCcO3
	lmL6HlYSR3PF4eFwpZe7ufzCfkM8lnoX1vc/bp7l9edTrU+H2FgTbmlC+xYruFLUbcl7zMgyyUwtH
	nnOVQnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NsR-00000005WtQ-27oK;
	Tue, 15 Sep 2026 07:46:51 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NsK-00000005Wqp-0x7W;
	Tue, 15 Sep 2026 07:46:46 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hkYxT3qlZzySb;
	Tue, 15 Sep 2026 10:46:37 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1789458397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vRs19l52ovGuAIjGa7YqoKMg2NfGlSjJwTPL4k7vc2c=;
	b=OqNGYX7vVbvIxmsjtk2iQWRf8dbYFihlNE89E8lbUVn7GPXTxHKhx9rEZduo3om+1v6KJR
	LG07Ihot+saV2Mnj5N6DksBKYcVoX9PkMIjs5cvGfd1p6EzyFsMyjRP4d+GezG/iJIvsUY
	P118wN8WCBkY7dViRsPQbn2lhp1t5jc=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1789458397;
	b=oggymuq6kYnCD9ygbnfq5pW2izEpq/HMDNiT8xlKY8NWS088zm19ixvqM3dWW3yWQrJ2SK
	AsPM/clBPb83G8I4zNv6M8YaQ8CrY0QIEpT7u2h7bCiI6aDJA0VE5F1yIvTQgN1jLEynNQ
	YPfiB68/TscZLuN3RixRNXAJahCaELg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1789458397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vRs19l52ovGuAIjGa7YqoKMg2NfGlSjJwTPL4k7vc2c=;
	b=fax/XSqyVU8LzgedToyLxUTctI5UAwgECN+5d1KbxtWPNGFmjzQYWPHDpWCCOiGoUKUf4k
	Mmj7uPTrxtFm8X2kkh/SrOFSQT8rSJ3a0iZzbhWcrrwRGuOx4faPha9xUtLG7tUVoxkVWN
	7iqeCFgqnMB+a7sHjS1PALni7QuZNjc=
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
Subject: [PATCH v4 12/12] wifi: ath12k: bind to QRTR endpoint ID in ath12k_qmi_init_service
Date: Tue, 15 Sep 2026 10:41:35 +0300
Message-Id: <20260915074135.2567411-13-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_004644_428683_C7A0D8A9 
X-CRM114-Status: GOOD (  10.54  )
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

If possible, fetch the QRTR endpoint ID in ath12k_qmi_init_service, just
before calling qmi_handle_init, and make it available in the qmi_handle.

qmi_helpers will then automatically bind to this endpoint for us.

This finally allows using multiple ath12k-based cards with the same QRTR
node/port combination to work simultanenous (and, for that matter, at
all), including combinations of ath11k-based and ath12k-based cards.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Old-version-tested-by: Mihai Moldovan <ionic@ionic.de>
Old-version-tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 50082505c882d..3611d0eff22b3 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -9,11 +9,13 @@
 #include "qmi.h"
 #include "core.h"
 #include "debug.h"
+#include "hif.h"
 #include <linux/of.h>
 #include <linux/firmware.h>
 #include <linux/of_address.h>
 #include <linux/ioport.h>
 #include <linux/of_reserved_mem.h>
+#include <net/sock.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -4075,6 +4077,13 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ab->target_mem_mode;
+
+	ret = ath12k_hif_set_qrtr_endpoint_id(ab);
+	if (ret) {
+		ath12k_warn(ab, "failed to set QRTR endpoint ID: %d\n", ret);
+		ath12k_warn(ab, "only one device per system will be supported\n");
+	}
+
 	ret = qmi_handle_init(&ab->qmi.handle, ATH12K_QMI_RESP_LEN_MAX,
 			      &ath12k_qmi_ops, ath12k_qmi_msg_handlers);
 	if (ret < 0) {
-- 
2.34.1


