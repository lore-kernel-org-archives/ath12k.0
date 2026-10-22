Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F6606A327
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LK/kPRZA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5IPy2ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H8oFF1LtZaOpfb2WufcD/7OuNnm3fLLdYsc5GK5937w=; b=LK/kPRZA50gTxZzjpY4VOQS21e
	oKPPMZoexZcft9AhqZdqHVqMqJEj5FMJihu+dvwfxOT32hrLh8RQM7X9rQfnliCeJBMq8ubXCD1HU
	KlqPqvHdIGGXPHlfMcctENeX1D4A5yjWExbOMphqR3D3JjUL/W5i3WoFnGVEZPlCWpaH1spqoRKha
	9+ds8DsQftu6ZuUTZPmUp1wl9gcrBnHU08H474wG4uvOOZIderMT8lKe/LME64U4uqRljir+wgnBV
	VMi0xTslH2k3g2asyM7+qcG3R3xeeglVd28ASfANiyueP01z3EvGaNEqi8uHrSwlSHeZn6Du72i3X
	5ag1UERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwp2-0000000Ebu9-3eCn;
	Thu, 22 Oct 2026 17:43:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwp1-0000000Ebq6-01aB;
	Thu, 22 Oct 2026 17:43:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D275460252;
	Thu, 22 Oct 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792691000;
	b=fnWv8kI3Hg3yLMgKpB1Cn+/wUkG8M1OkC9Shq0xBm/IqcmZulBubglDXVlIpB6NCBEvx
	 cTyeVJZNBu/24vq3srPAAA+q4IvnJqB7m/1t7M0jugUz6CKcN4WrUFVowCcw5rWGB1XJg
	 XDxemaWMIXRiAwD44uJLXDA6FmJK+OmR99ZIBsIlYX/UjxPlUdEX52KFeoNnq5iPjV617
	 7tsNsM3PkQeSCo+X07BiDe3CVFfVD2nt2T3YdATloE4h7OLJmpuxNFtIBtIvY2B1BzAD8
	 QjqNL7X0Hvts8rJfFk2HEDBlJ3n9yQ/lvn4VthRyWawMefeWXgAgDJuwe/40m1I9/pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792691000;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H8oFF1LtZaOpfb2WufcD/7OuNnm3fLLdYsc5GK5937w=;
	b=0bHHcG07wG+PPDwmme8sM0CFIGY6YxNBj/vDUa1YHpiKAtD4IksVEWxqpfIRvDMAtKoQ
	 VV6FZEKdcWGG+EEfRFpKCG5Kk+di9wFrtffjoz5kn9Ls0bvFJ5A3LgjRVVy28DdDYy/Ho
	 kT9o/ms8a+qrfNAj6Yxm0V+FgF+0m8gQPwARhFwT982s0BwX3GY6vVkXBQUrEiKREuSq1
	 OiiH8T54oKEFdTx6S/3pwlyBi19p2WP/aHrl2WwKSt9JbeU4B1vPoLk/Anb8LDiEcl7xa
	 CGh+aSm/5kU1OP4vyGEaI9eWS2pQZl8r+4G4wLYym60TlCp3Ph4QcJGJG2UwGT014+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 667D01F01828;
	Thu, 22 Oct 2026 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691000;
	bh=H8oFF1LtZaOpfb2WufcD/7OuNnm3fLLdYsc5GK5937w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F5IPy2ngQWVgkdIKnq9Yt++HJIdzU2OTboyyGKBFer+RoBv1JucCPZzeYoqDx//x8
	 Ffd/g3cERIJS+0Z+WsTtoXA8HscQoOD0816YF5SHF6+oURBL2mxg6IobOPmb8QQpmj
	 bfi0fEinSFmqvpzFtnrxRpJFTGID1HKz2sBLLofPmrS6BnQHujLAZ7LMep1ph5Pb/7
	 CmghI3fubgt18Qrq43knZlMz/XH0WsbQbK3gs8t+EmKTUHcv8vE4x/0NrvGkx3Ly6y
	 HS+1omrF/I9MNCnYk8mUu4zSB65YY7ZqcCC+8elmQi3m7xXeEwD4ZoPjx1GeQterbJ
	 HGIdcJ3EMGOCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CDA1141E95;
	Thu, 22 Oct 2026 17:43:18 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 22 Oct 2026 19:43:08 +0200
Subject: [PATCH v4 2/4] net: qrtr: Assign unique node id for MHI endpoints
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-qrtr-multi-ep-v4-2-c6fdb75fcd3e@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
In-Reply-To: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=YoEVGfn6pJagg3BMv8pSYGkO4MTCJESp0TWcBZdgqL0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq2ks0vhlFnClGHeItG3ycQMIpF0sxPskgHG9yp
 YQtb7wH+nWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatpLNAAKCRBVnxHm/pHO
 9c4KB/9BZ9UB5TqxY/WW3iYzlOOZUCzvatQQhXhbp+QAChdrkob/igzvFhLyekAks633VNEj1Hf
 e20Rkxm+ULE91vXMArBuufXbhVQo3YR7+VyHo8MDnWakpRhqLzs2Qfc8+hDRHSiz31VXq9twS3R
 p5ZASCejKGRZArBkvOhTSgucHQZWhgeKEkz6APCu8wKEGHF0vWwVy1QiynRJyxy+E8UlIgFrt+y
 bQGfX67qxYJHUMJFX3maunIlerSFW7/Q7IXScREBSP0J+O7qpGCtFt2Br/gz4zDwzE0mdkErdSj
 dlxjUnR8hRjBjcT1CjVRnR7n9Odp0ptO42fTOkOQQyDHbUxd
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Now that the QRTR driver allows using the unique node id for each device,
which is different from the node id received from the remote node, compute
a unique node id using a new API, qrtr_host_node_id().

This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
The base is chosen well above the node ids in use by the remote nodes, so
that the host assigned ids never collide with the pre-existing ones.

Since the ids at and above the base now belong to the host, reject any
packet carrying one as the source node id or as the node id of an
announced server in qrtr_endpoint_post().

Finally, call the new API from MHI endpoint driver by passing the MHI
controller index as the parameter. The MHI controller index is unique for
each controller, thereby for each MHI endpoint device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS        |  1 +
 include/net/qrtr.h | 22 ++++++++++++++++++++++
 net/qrtr/af_qrtr.c |  9 +++++++++
 net/qrtr/mhi.c     |  4 +++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index df8ab9b82402..9c8bb086be28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	include/net/qrtr.h
 F:	include/trace/events/qrtr.h
 F:	include/uapi/linux/qrtr.h
 F:	net/qrtr/
diff --git a/include/net/qrtr.h b/include/net/qrtr.h
new file mode 100644
index 000000000000..6beefe89943b
--- /dev/null
+++ b/include/net/qrtr.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _NET_QRTR_H
+#define _NET_QRTR_H
+
+#include <linux/types.h>
+
+/* Node ids at and above this base are reserved for the host and are never
+ * accepted from an endpoint. The base is well above the ids used by the
+ * remote nodes, so that pre-existing node ids stay untouched.
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
diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index efa70b95f8a7..7a59ccf15490 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -11,6 +11,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+#include <net/qrtr.h>
 #include <net/sock.h>
 
 #include "qrtr.h"
@@ -590,6 +591,12 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	    cb->type != QRTR_TYPE_RESUME_TX)
 		goto err;
 
+	/* Host assigned node ids are not supposed to overlap with
+	 * remote node ids
+	 */
+	if (cb->src_node >= QRTR_NODE_HOST_BASE)
+		goto err;
+
 	skb_put_data(skb, data + hdrlen, size);
 
 	nid = cb->src_node;
@@ -615,6 +622,8 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
 
 		nid = le32_to_cpu(pkt->server.node);
+		if (nid >= QRTR_NODE_HOST_BASE)
+			goto err;
 
 		if (nid != READ_ONCE(node->ep_nid)) {
 			rc = qrtr_node_assign(node, nid);
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



