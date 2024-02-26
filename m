Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033FC5478C
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 18:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DkfM8YJiwCUTjGvtRDzBKZLOUgMUOvcH6h8MDkX+IO4=; b=iqStRlGZEwGgZo19pwVhyRleFv
	yU6ehP2e1TjVO7QFLzLBt0bt6sRvt+p4FgxxQYskTW8qiKRxrdDmHAY7wIEpAcQ2JD51taJr56mQM
	Q023WC9cnIbsyeFCdsADuI19nlyfod1vZqLeQ1rlMa+MkSm6lw7SvEhZrLvOT4G9f/PQaGMggT5Vf
	K3lO82/SmHZYq7eEsOLftIML2TnMedaOeJQ3iSBXJySZwkZKFjGVq0mxSwKNSIqFtMdZ5ZaIzd2H0
	+64N1q4JNLSJTMNtsXNYsbIH+BxoZ6mjuKQvSem6rw/QOYnXm2WO4nA6GZ9tVFytAHCVB+4s7ejww
	tvxEpwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refOM-00000002888-226o
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 18:07:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refOJ-0000000287R-0rB3
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 18:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63952CE17AF
	for <ath12k@lists.infradead.org>; Mon, 26 Feb 2024 18:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F821C433F1;
	Mon, 26 Feb 2024 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708970868;
	bh=J/7FZyfKcyHUYIOf/R68OJOh8BSS70qpjReTtInbquY=;
	h=From:To:Cc:Subject:Date:From;
	b=XtIGL0KknF0Ze2PxwrbJr06EMgkPNH17mjCaqWqOOVPAzKRPfQR4WE20sf8x3CuF+
	 TBYzLCl/wFHUC4c5Ru1SL2RCvO1EsJ03q0mZvftD6aPN03td47BMa2hOaUwCqqSoou
	 yGgJEjrDItau36GLI7gJDFxnCVGnFEdFFT5cNKpVIah1XI7/cpa9paitOUT5PPW4v/
	 pNvbN9q+zCm+j3ab7NdcLMOVzA0bbcBTssWCQAAfhMEdO1IsgyrhBfxBOXMM7qydse
	 vYQy7+Eh5NdN6JOL64ai8eBspv0fRxvEhJ1L7dmE9k3yg+jvLZ/x60Lq3J/RGIBNOG
	 fjs0ZQpx1oM4Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix license in p2p.c and p2p.h
Date: Mon, 26 Feb 2024 20:07:45 +0200
Message-Id: <20240226180745.3195805-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_100752_061495_030B5A97 
X-CRM114-Status: UNSURE (   9.27  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

ath12k uses BSD-3-Clause-Clear, not ISC.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/p2p.c | 2 +-
 drivers/net/wireless/ath/ath12k/p2p.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index 61e919b23b16..d334df720032 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+// SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
diff --git a/drivers/net/wireless/ath/ath12k/p2p.h b/drivers/net/wireless/ath/ath12k/p2p.h
index b6f177fe4ff4..5768139a7844 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.h
+++ b/drivers/net/wireless/ath/ath12k/p2p.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: ISC */
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved..
  */

base-commit: c39a5cfa0448f3afbee78373f16d87815a674f11
-- 
2.39.2


