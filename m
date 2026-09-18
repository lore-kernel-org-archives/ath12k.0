Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE51C982D7
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9HmFE8M8FVmfoRuMAoaSF0csxpiXa3WmozdtYcL+zs=; b=RRqc+o4I25PqEA1bs1jeQLFOh9
	fytiZTby6EhgO1h77BiUf3dmuE5zDMlfAqzlwpLF4XQt7Kv4TuiFPI7UcTkN8vAaO1AwG2C/zqBnZ
	l+eFZ+RptKAJEwokW6uroAuUfZwxeUXT0miANmSC4E9ZTxJmPkevRN9tF4bxaQFh7jHLZxtl/bZMR
	RnfwYvOl805ckH7+qtQfzz6yqhAvfDE8/KIAHxNxqwK61jURy4WVV34MWQOUUmGvMZB2C0MD05nN3
	kBuW2fFvhqM6yyiC1EcaIXcqzoR/zbdHgUzOqIZrqf0fRRs9mC9GoQl/VsDEpwkyccmStWolM90mR
	o7S69wNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bRm-0000000F1aB-0bjK;
	Fri, 18 Sep 2026 16:28:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bRi-0000000F1Xl-39r5;
	Fri, 18 Sep 2026 16:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2709B44543;
	Fri, 18 Sep 2026 16:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAF86C2BCFA;
	Fri, 18 Sep 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789748897;
	bh=dANEiTIv6WX9Ahf5Kk+KOtXwhtRjgal+FWoz9aBW1fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fonPAfuvAgIi4VeFMRXeaKlB6BMFGa7mzclKgKceCK03Ab2WzHNlbVzqYzpaYFZSi
	 oahdUs5zEdCToOwOsOQQRTWm+9zkMvIxJVkAOQniw6Hsm0BYYbsRJw+jI1P+EGq/js
	 fGsSTdqiy72mVrCP+2LFJepCidL/6KjhR/Bx7ozMuNw/R66HwSrWusJcseJl9Pnu4Z
	 zOd/BLOFxnFaKGjbu8QDLiz7hKWGmL7iKoDVVqVWXP1ETncPfwbzh7QtsGNcYPdbYO
	 0SNwMKBQ7d/Su58gZA/AR8cPNRNp3/XYXSNrtJxbaecR4lUWn2rhCw02a+3MIjSsL0
	 TxfUrxzAhmRkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4E3C982DA;
	Fri, 18 Sep 2026 16:28:17 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Fri, 18 Sep 2026 18:28:14 +0200
Subject: [PATCH 2/4] net: qrtr: Assign unique node id for MHI endpoints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qrtr-multi-ep-v1-2-8a06caa368d3@oss.qualcomm.com>
References: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
In-Reply-To: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=uOYu1U8wIC2RDVexAi1abQkUbN13SL1t/kCkWYPYdoU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqrWaeF6Y6uwvyLe36Rr5ay4I2MYWQOIJL3dVs1
 jNepmU7vnOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaq1mngAKCRBVnxHm/pHO
 9V4QB/9kPI0g4gGHMb3I5Vi2hxhCo0kEQntSmTve/Ue2kyHg9KUVLEW0zCa8hVLz6PnxAVHjAVA
 ylXCIxMiSZ1zKUtacpBbNWVX/s9aOZ4ssYRRpL1mestEhvCm7DeyUj2J8BaHtmoUOg/+4MiVgIx
 rtW29lzRhqyQ/KjmlziBLmWQCeO4qiHisKkHMfv8slVhRLBF17FYKFeBcXs1QnpMkzwM+0hDFKh
 ng90uQj02fm/GCTwNSgv5ajUHuZ5wzD+PJpivaSQrx/vtdIzZ/bo6lqEQi8k7rx8+l6bxSXFz4X
 jh/fhii/LHuvp7URaJdAmNt4Na3pqqrg+XH77+DLNk2iv2PX
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Now that the QRTR driver allows using the unique node id for each device,
which is different from the node id received from the remote node, compute
a unique node id using a new API, qrtr_host_node_id().

This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE,
whose value is outside of the node id range used by the remote nodes (0 to
0xffff).

Finally, call the new API from MHI endpoint driver by passing the MHI
controller index as the parameter. The MHI controller index is unique for
each controller, thereby for each MHI endpoint device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS        |  1 +
 include/net/qrtr.h | 21 +++++++++++++++++++++
 net/qrtr/mhi.c     |  4 +++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..bc1af0cd8a8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22504,6 +22504,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	include/net/qrtr.h
 F:	include/trace/events/qrtr.h
 F:	include/uapi/linux/qrtr.h
 F:	net/qrtr/
diff --git a/include/net/qrtr.h b/include/net/qrtr.h
new file mode 100644
index 000000000000..745d51b4a6ba
--- /dev/null
+++ b/include/net/qrtr.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _NET_QRTR_H
+#define _NET_QRTR_H
+
+#include <linux/types.h>
+
+/* The offset is chosen carefully to not collide with the node ids allocated by
+ * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
+ */
+#define QRTR_NODE_HOST_BASE 0x10000u
+
+/* Compute host node id from a per-device index. The index must be unique
+ * among the host assigned endpoints and smaller than QRTR_NODE_HOST_BASE.
+ */
+static inline unsigned int qrtr_host_node_id(unsigned int index)
+{
+	return QRTR_NODE_HOST_BASE + index;
+}
+
+#endif /* _NET_QRTR_H */
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 3990da1a65dc..c920ab61f848 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -6,6 +6,7 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/skbuff.h>
+#include <net/qrtr.h>
 #include <net/sock.h>
 
 #include "qrtr.h"
@@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		return rc;
 
-	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
+	rc = qrtr_endpoint_register(&qdev->ep,
+				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));
 	if (rc)
 		goto err_unprepare;
 

-- 
2.43.0



