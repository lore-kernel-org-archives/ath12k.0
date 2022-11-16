Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FDAC43219
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKPBtmx+O+99zmhvftZMr0IXTAq+Z7Iun4q+lATjg4Q=; b=j1f4CaiPuMkk1Z
	b8Y1GtdigmwN25JeidK5jL1XpCSvyT1dBxjvkZ5J82RCCNxh4kohWL7kcCJ/bBi6fCFwIcrv01Rbd
	IhwWVKsSwpQRmeCueq6JY8DDTwHLG+hOd+60/HQeiPSxG5KpugT0WgS/nwGWWrGdmnKLXKuXNJzZc
	iDhDa+9XHLjnnUpWio2GNgJC92IwWj5MqkHzv+Cwfoe82Mn3ftO03oBvhG2AAGB5XybvFFgY0e7ik
	kzbdsdoKLBk6GHmO6mmpC04VA/dvqM2MJmYCDJwvNccFctpTTgAYEG0+zwb8RfTxhOfYVxFawoxF0
	+jNUS3KyzTt2sydI48CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMU5-006blt-Uw
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRc-005xe0-UP
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=amqCQ4ltc+qB5mUcJvFBw0zGaQ/LDfWFymUgiaXsxRw=; b=NIiukeMr1Mn7SQoL9gmUCWzGjg
	4dep7FZ2pSB5P+7iqHfDnxJEfSm6rmxK4pc2G2FLh3DPHjY1VSobrxEneIOUrBBfgSfsz//pC/kNv
	mz+7ztzWcviauBR6X2VLFVS50EXBjgguXeb7B/5FZFZXR45V3awRImTSi7C4cAmZRlzYySgdH6Rmh
	eGHfxmp0bv0iQxAzy8MvlKUvf3IA8f+6esQk76+beQ5dPlZZW+snQBuzwPNs8aTDEfrctBfFVSfeX
	4N7LfUWUWh4OaTiWx3dgNjsTJ6Ec6+J7YV4LKYjajXjUhXRkIZpmixKKMIx2vSHy1N3tdo3WK7KPK
	TyzM57rw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRX-001Op8-E2
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 617AC61EF1
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850D0C433D6;
	Wed, 16 Nov 2022 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616757;
	bh=MDwsYTPrGo9CNwWMSoHQAhvjhFDCQLCa7ws1qSRRgNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OeD+yrbd9l7T8Y8f444Z3iogIq4FqxK5+n0ZzLY7ElIOzaWCT3ZWuVlUuW3RaCxLK
	 VxCAd2w1RypHz2TaJ1lsjs4r790X+PKaEuYNv4PN4CR4EGDJbiUbUlddlvIoIqhENM
	 IP3o+xTrEYGEuY9UDrpimYd1unjwxPpfy3hNduaOn8dxGlrM/Exhe8++UewMbgfyaa
	 J3oMWozQRJ6WF/umuBcT0oJsdQ8rtsWMz8pTAcVHwn2Aw4tAeb2P36xWR0tYqfI1wP
	 1cM9EzXDc20RYKW5Zu1raLsdFl0Ac58hfVpNRXczJqgodeAek5W0FCMJC9elDwAfY1
	 eq2Z0qSVC0txg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 09/50] wifi: ath12k: add debug.c
Date: Wed, 16 Nov 2022 18:38:21 +0200
Message-Id: <20221116163902.24996-10-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163919_866412_BBA0597D 
X-CRM114-Status: GOOD (  15.12  )
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
 drivers/net/wireless/ath/ath12k/debug.c | 102 ++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
new file mode 100644
index 000000000000..67893923e010
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/vmalloc.h>
+#include "core.h"
+#include "debug.h"
+
+void ath12k_info(struct ath12k_base *ab, const char *fmt, ...)
+{
+	struct va_format vaf = {
+		.fmt = fmt,
+	};
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.va = &args;
+	dev_info(ab->dev, "%pV", &vaf);
+	/* TODO: Trace the log */
+	va_end(args);
+}
+
+void ath12k_err(struct ath12k_base *ab, const char *fmt, ...)
+{
+	struct va_format vaf = {
+		.fmt = fmt,
+	};
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.va = &args;
+	dev_err(ab->dev, "%pV", &vaf);
+	/* TODO: Trace the log */
+	va_end(args);
+}
+
+void ath12k_warn(struct ath12k_base *ab, const char *fmt, ...)
+{
+	struct va_format vaf = {
+		.fmt = fmt,
+	};
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.va = &args;
+	dev_warn_ratelimited(ab->dev, "%pV", &vaf);
+	/* TODO: Trace the log */
+	va_end(args);
+}
+
+#ifdef CONFIG_ATH12K_DEBUG
+
+void __ath12k_dbg(struct ath12k_base *ab, enum ath12k_debug_mask mask,
+		  const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	if (ath12k_debug_mask & mask)
+		dev_dbg(ab->dev, "%pV", &vaf);
+
+	/* TODO: trace log */
+
+	va_end(args);
+}
+
+void ath12k_dbg_dump(struct ath12k_base *ab,
+		     enum ath12k_debug_mask mask,
+		     const char *msg, const char *prefix,
+		     const void *buf, size_t len)
+{
+	char linebuf[256];
+	size_t linebuflen;
+	const void *ptr;
+
+	if (ath12k_debug_mask & mask) {
+		if (msg)
+			__ath12k_dbg(ab, mask, "%s\n", msg);
+
+		for (ptr = buf; (ptr - buf) < len; ptr += 16) {
+			linebuflen = 0;
+			linebuflen += scnprintf(linebuf + linebuflen,
+						sizeof(linebuf) - linebuflen,
+						"%s%08x: ",
+						(prefix ? prefix : ""),
+						(unsigned int)(ptr - buf));
+			hex_dump_to_buffer(ptr, len - (ptr - buf), 16, 1,
+					   linebuf + linebuflen,
+					   sizeof(linebuf) - linebuflen, true);
+			dev_dbg(ab->dev, "%s\n", linebuf);
+		}
+	}
+}
+
+#endif /* CONFIG_ATH12K_DEBUG */


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
