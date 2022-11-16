Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E919CC4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlC2hAgNQ7ksjmS4SPAGsNTlga5akfSCNky6o/zqdIA=; b=vUBOcK7gCS4SPI
	xpph3l8Rq8Tgci/rLYwUrlb5IijMnzf0cc4HfkfdcaOJISJ8dkEP0Mpg74kUkuqwniRJGJjzxnyPo
	IQ6R+tZuk5utaC0YzJ88LqOSqEzSReTqEIcraQw/8VkYZLTAwV9klsdnRz1NbW1BYDDtXrIu2q3ZP
	pYnNuWoOYQYPTm7he2Qf7SL15Bl4UPocaB2lhZR6wuOE123jc9FoqBiKMvDSeAdNaSnvwSGNmket7
	KqTXMBUXxU/Ff2d42pbByEZoDZgsF8IciY8Ioop0FjLZXz+/hHGuJ0MEbCrEDjjvLBy1whCnCrAv8
	KWk2pSRyxO6G57FdR8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRd-005xkt-Bd
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRb-005xgh-R7
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XL7G9pl8D5CIALUIkxDQH8BamfPkvGzLiINpXOzm/Fg=; b=PX0LUKjo7PXPoGeTBNljnZwWef
	KCFQZNkPYJ5A9P2SB4GxMA2Ar7RJg2qE8aBsMHtUTad0124Pa83fnCkEGcFo4eUigROTxn3u+dWbP
	z4elLV7kpKvoXd0N/6B/TqrLVEO93ki6+gvWJdPOWYf5saZjHbcNxOOYcmeEP253jGraVXMV3AlvS
	F9FsavvTgmiHXgeIS6skV8hdF3b22zLOWktI6DX1t3ArFhgBEyUyiTfFWIRFX5X85PKVkPh9pOVnF
	+gaSPbihIfEb7AMDeUZ8dWzg24vm/dS8ffwJyuFVyS/EV9w+Rso67RouUz9GSTuUjRYMa/6hp4y+z
	YU+lWY0A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRX-001OpC-E2
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 616FA61EEA
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A5AC433B5;
	Wed, 16 Nov 2022 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616756;
	bh=Zcjc5OROfk0wE9GIbJku0cp3SYGaeZZXtW8eXHfJB3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cd8iiJ20R2ZQtz8h2fuOYkMhQGGDVLWHaiCBvISnamkbx5aBbPkKYkvB6NAOiRl5+
	 ON3/mIu1tloizGHqM+HlVkCqHj4IfRiH1N0AkKMG6QsZGo9e2wONzueKa6vCFy8NH+
	 nhx1P/IjGqRvPKM1/ChgFvBiEnedpmE9WrqfxUdCnzSSzpG0zPnswYY+SC9yOsDbGc
	 UgJkj9z5V+DGB1VNi32+W8D5M+oZ8Hn145c+OawedtL3m8wJPL2jX8H+LcEQ05JGsN
	 l62b8cfHlBxErjzj7wT3ZG50pajYbbtwv4BgL4W+0Yx3mu0+UVuW2ek9WqQQdYBN1T
	 kuS8mQeFgDDxA==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 08/50] wifi: ath12k: add dbring.h
Date: Wed, 16 Nov 2022 18:38:20 +0200
Message-Id: <20221116163902.24996-9-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_163919_853198_6DF15E24 
X-CRM114-Status: GOOD (  13.11  )
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
 drivers/net/wireless/ath/ath12k/dbring.h | 80 ++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dbring.h b/drivers/net/wireless/ath/ath12k/dbring.h
new file mode 100644
index 000000000000..e1c0eba774ec
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/dbring.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef ATH12K_DBRING_H
+#define ATH12K_DBRING_H
+
+#include <linux/types.h>
+#include <linux/idr.h>
+#include <linux/spinlock.h>
+#include "dp.h"
+
+struct ath12k_dbring_element {
+	dma_addr_t paddr;
+	u8 payload[];
+};
+
+struct ath12k_dbring_data {
+	void *data;
+	u32 data_sz;
+	struct ath12k_wmi_dma_buf_release_meta_data_params meta;
+};
+
+struct ath12k_dbring_buf_release_event {
+	struct ath12k_wmi_dma_buf_release_fixed_params fixed;
+	const struct ath12k_wmi_dma_buf_release_entry_params *buf_entry;
+	const struct ath12k_wmi_dma_buf_release_meta_data_params *meta_data;
+	u32 num_buf_entry;
+	u32 num_meta;
+};
+
+struct ath12k_dbring_cap {
+	u32 pdev_id;
+	enum wmi_direct_buffer_module id;
+	u32 min_elem;
+	u32 min_buf_sz;
+	u32 min_buf_align;
+};
+
+struct ath12k_dbring {
+	struct dp_srng refill_srng;
+	struct idr bufs_idr;
+	/* Protects bufs_idr */
+	spinlock_t idr_lock;
+	dma_addr_t tp_addr;
+	dma_addr_t hp_addr;
+	int bufs_max;
+	u32 pdev_id;
+	u32 buf_sz;
+	u32 buf_align;
+	u32 num_resp_per_event;
+	u32 event_timeout_ms;
+	int (*handler)(struct ath12k *ar, struct ath12k_dbring_data *data);
+};
+
+int ath12k_dbring_set_cfg(struct ath12k *ar,
+			  struct ath12k_dbring *ring,
+			  u32 num_resp_per_event,
+			  u32 event_timeout_ms,
+			  int (*handler)(struct ath12k *,
+					 struct ath12k_dbring_data *));
+int ath12k_dbring_wmi_cfg_setup(struct ath12k *ar,
+				struct ath12k_dbring *ring,
+				enum wmi_direct_buffer_module id);
+int ath12k_dbring_buf_setup(struct ath12k *ar,
+			    struct ath12k_dbring *ring,
+			    struct ath12k_dbring_cap *db_cap);
+int ath12k_dbring_srng_setup(struct ath12k *ar, struct ath12k_dbring *ring,
+			     int ring_num, int num_entries);
+int ath12k_dbring_buffer_release_event(struct ath12k_base *ab,
+				       struct ath12k_dbring_buf_release_event *ev);
+int ath12k_dbring_get_cap(struct ath12k_base *ab,
+			  u8 pdev_idx,
+			  enum wmi_direct_buffer_module id,
+			  struct ath12k_dbring_cap *db_cap);
+void ath12k_dbring_srng_cleanup(struct ath12k *ar, struct ath12k_dbring *ring);
+void ath12k_dbring_buf_cleanup(struct ath12k *ar, struct ath12k_dbring *ring);
+#endif /* ATH12K_DBRING_H */


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
