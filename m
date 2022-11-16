Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4057AC4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HipbdFdm2Bo+N44lP9WruMmvuhAd5FO9JJiJmqisoA=; b=0XXvkhA+efpFHi
	MN74DFyzBN3dryYT+FIIJQ1Y8jh9qmeGhIOYlfeOEuDZnLAlehpB/ZoMePeQSJw40y4qSTaDiDZKy
	jLT5Ifs+hdAyb9zOfSNNx5Raro8cQXgw9ze/DB0rLL5Nh87S1fm2Ot9KKcHl2RYS68clzsZd6rzvI
	gzKdUjZbUfF1VX3bAveTlBtdkewTnKlDsGptT9o3LZQGElBqZB+8FkTAHb4uEmXybPXLhHf0eFYue
	z2SRWc69JfX1PPnLQSQoMk8sGJeLodozSUuGLYcmfNrtLkgrm0Hf4r0Ddy0i51OuSwya4fFqvDLYj
	jmRFKU3c+2qTCJuAh6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMUJ-006bzS-LL
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSC-005yX5-AD
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GNbpHWpVMrnuBrHGHn3VB5LVaeNRK3g9BVacM/V8We0=; b=duRn6krs5tLQSTvXxyoKdoS6xN
	rilDyJ7ob8pXIUBHLHE1NA5DZn0hH0oiz9ULD50INJr3tyVbOCrp+czPogoUKhk9oGNU3r+yEKOqJ
	sx+1heYzcoXv+Kwr5BTGu3pybaRxPzZ/fCJ4Rsxhy4PTbwvNVI3kWPWldp/6okMG2gttqmo3CaeqL
	CEqpUtwGq+XddMsFSBiBScuzbQS8ul/8JqM5y2qkOhAvs2QGs73iJ2NWOEhURgZ47q8hCYTMGoySi
	dp0TZvnHoV0StRhhyLoOU7+KG750gj+54a3KKP3KM0gczSNPTlZUB5F1vGHwbvKWmoLkC/4skOkj0
	upC432GA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS9-001P4K-1E
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A37F6CE1BDC
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C14AC43146;
	Wed, 16 Nov 2022 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616794;
	bh=GNbpHWpVMrnuBrHGHn3VB5LVaeNRK3g9BVacM/V8We0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUMHZY7/YNApC9LIL2pW+4wfutGkUJPvRO8hP9P6co4EpMaY4qXkPjzP9KgVadZ3B
	 DggZ7GNOulO7keXf8Db5b2ymhpvaA5ReM/z6b1KGXnX+0w744DwV/yHewBk610Cu5W
	 MwLCd1TQuHE2kiGWDhtF2Ml/a3SjcU45t8ac+5Teq4VYOztvndqVdw6md0R5Xv4LCu
	 EwAR7nm+3kB0Umr+Vp+7eM+Z+PYWZm/rIUdkDLgmCptmY2j9XI2PrxUyxrIMJeJWoC
	 U0ZUaIuZOwSw6y+SLW8bUIBvbdp9qBCu+uNTiWW2xsZpB/kcVYvPTSd+NIsmlG/PWX
	 othgB+0qk1bhw==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 44/50] wifi: ath12k: add trace.c
Date: Wed, 16 Nov 2022 18:38:56 +0200
Message-Id: <20221116163902.24996-45-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163957_275078_DE785456 
X-CRM114-Status: GOOD (  11.16  )
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
 drivers/net/wireless/ath/ath12k/trace.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/trace.c b/drivers/net/wireless/ath/ath12k/trace.c
new file mode 100644
index 000000000000..0d0edf4204b7
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/trace.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
