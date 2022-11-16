Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6EBC43219
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VueBsLed3ZONO9bOWt0NA4UeiFVS4uLwhozYHa338m0=; b=VzusOzNLSOGs6p
	YwkUE02TQuHrLHjaoY9DoRFx9BHa36CfbgaEIeWIU6bsnBCqQBny6TfH1e/5EKDGBbOtFAyZHCofe
	cenTf1TKpUhuOvL0oXLQREp9gXMrM+SlMOUm29X064S64GKP4xeemVv05/oma3SlsdACNr0Ujqo66
	twY3PgXhEuKZibcnPIaDgPUXaw+dsIXkbui1D3uArfNH4ngyXp3q5slRRZ8hVuapjT6y9td3kH6C+
	827cSvpGXOETzFmGYfI3VgfUJGhlgHRDiQzM9nwRIIkf1GrkW1pUy5J31JuOxUZPOz57DQ0KXlYN8
	AKadzPL7ipPoBMOCIRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRU-005xZa-GG
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRQ-005xNS-Sg
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0993B81DBF
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD8DC433D6;
	Wed, 16 Nov 2022 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616749;
	bh=afi8JZrLiX2wXtdlF6dXd1AGUNdqgAzSllZrAXc550s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVVBxWpPF0s5Mq62UwKwrz9yI1MJswMVQJyx0TU2uY0Fw1fnI8+9k4kOTw2rNySpE
	 aFO2N++BtEBab+lS4NV2pF7f7zTzMVTloZM+a0IxxUmw03wbELi1qp7wg+CKFtgBKk
	 D+Q40X41mjYiMtR5ZMXc5NPJYKYxi2HPznZBhEjTYeZ5MulrM3qkd4lnY2lyMFkAdd
	 mfXkiI3/w6I7EPcC3n3hboQM18yjxpG1kIdgPYGA+WibcUfJpVzpAI6KfTETKc9jJT
	 NdHEnEk+ZlzkIvni7A/cRhU0MKvFdg3AfrfJ5oe7oz2Mdu/uFj6jfGbkdsqBRgpB0q
	 Gx47gb7/n1qAQ==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 02/50] wifi: ath12k: add Makefile
Date: Wed, 16 Nov 2022 18:38:14 +0200
Message-Id: <20221116163902.24996-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_083913_094235_59CDFA28 
X-CRM114-Status: GOOD (  10.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Makefile | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
new file mode 100644
index 000000000000..62c52e733b5e
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k.o
+ath12k-y += core.o \
+	    hal.o \
+	    hal_tx.o \
+	    hal_rx.o \
+	    wmi.o \
+	    mac.o \
+	    reg.o \
+	    htc.o \
+	    qmi.o \
+	    dp.o  \
+	    dp_tx.o \
+	    dp_rx.o \
+	    debug.o \
+	    ce.o \
+	    peer.o \
+	    dbring.o \
+	    hw.o \
+	    mhi.o \
+	    pci.o \
+	    dp_mon.o
+
+ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
+
+# for tracing framework to find trace.h
+CFLAGS_trace.o := -I$(src)


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
