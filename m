Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443F606A33B
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ycv+HEaN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XA0zLuT6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wjg/hmR2F1mQvKNh7DvhNzVPRNABdhbsmvxGWJAb9g8=; b=Ycv+HEaNEqUwa8mwtxim4wAOKv
	wVQns9TfwM2Fy5X+HA7oTkR58DT9Y7t62AOykp/0IjYPqGIXIg1lZLgCKaD4GiGl9JEIsLIhZy85E
	mnTDlVKsVGGxO/PIJEiZUJF3/LWq1IHVWlnWSGEOcwfJ/i0pGDJhSKtcULxFPNJ6kGUzmjZ+Iu8Tt
	aEnQkMW0m7c6uYFjkbdabhGZlzUXXiCBkSIBc2AwUiLAjMx3zbkp6/xL41OO4x9Yjk3fyKpP5vHiA
	glRNAPA3q9krrIVBytLD5QEvX2bzLTWToNsEegiQ1zWFQagkuOY8+q9Uewx1686Ot4nxxirfNrbGR
	yjsaUjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEi1-0000000GFpe-2bpm;
	Sat, 14 Nov 2026 14:26:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEi0-0000000GFop-3zRU;
	Sat, 14 Nov 2026 14:26:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FCA545928;
	Sat, 14 Nov 2026 14:26:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794666384;
	b=L/wfocZYPOblzkG2V1BHW0SbINcl3DdBndNjtVIbsFP7+QtyUZBWdViyAIjcNktSWP+W
	 byqElod0sui0AJOZA0pjYdjBgQ5cBUaEWld/p1+eol/rRdRfBurq/lSAZoQ/t70PbFyll
	 5YXZ3kgfLolctvc1xhwaO8I7NFbuje1VM6uBPqAS3Yd5LKoLwQ0hvaxRgze+KgssdApv9
	 v+wFopASA6vqTNwAhkAT96OhJs3+hl3mWKBvEL3YNVl5dNnXG/fdIdz75voSHs9kIGZSn
	 t8ADJgbkBroNcp+li/IRU3x/viPwznAIGXpARhR1MqvAK5q3cmFcDjVZz/H4q3g4iyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666384;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wjg/hmR2F1mQvKNh7DvhNzVPRNABdhbsmvxGWJAb9g8=;
	b=E2PT82NGAdnWAxwHA8EneiFyZaIM0S3o6j6YYLAuhYQ3CsPZA24uPNaqvSBrWF8quxlN
	 rg+it5jT0sFM/mCnYNVQVNtc7KkUmPmZJBfRGLxmIt2Wyl+D8I6925EdZzW2K7anACFQe
	 4q2dszws1NzLw3BzbMs0hWF9lJMx96g2yYHI7aCFRBIoUekdT3XwJi73PFs6no9o3VWGj
	 x4FXXrUVNkrOfGOB3s+dqYhkFHmz32LV5aUoHYPFV9dBcG6yILFj6wGdldf0B4x2e2iYn
	 FBSjwi1/fT/ZqN2X+F/uQkbbc0R19cNSroNrXVew0yZRonRZUJL2gWQEzilEodXmJnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03E241F000C6;
	Sat, 14 Nov 2026 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666384;
	bh=Wjg/hmR2F1mQvKNh7DvhNzVPRNABdhbsmvxGWJAb9g8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XA0zLuT6tf7GC82CZjCVaVQOT9dxN+FR/ZOqWSO+3zv0TwE6IRHbTrU/4FTLG4inp
	 Y4bWjktMTT1TI1V52Es8mUuy7rFpDCkV+Io1/XAxPpHjU+B81X0sd+3Nhr/BhEY5tO
	 LqolbQqK6ywUn6u9cU9XyCgijJ8K6zhFh264BPd3VRcZlDuUrbI42UHqTK2L/+d5vx
	 6qMiJvCQYrdIs3HfoSmLsBVMX8lo0THyq3JunY9OZ4YdfI03L1Y1wjrtZYG8wycxzr
	 Yptj9KNHzBDU0z4JveLh4FaBl4g/umkaoUm/gAYuGYu/zxTUJ6HeCDGq35F/Wx8bxX
	 v1xSvnHEANvrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8216C49E0F;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Sat, 14 Nov 2026 06:26:14 -0800
Subject: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for MHI
 endpoints
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3283;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=/mk4KdzpVcWWvNuNI4IR+JOBKyEh5ixXNDCmghcPA1w=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+G+Lh1Yq2gHtGGj+kgVuJakXYCcwOfivdyhI6
 PSJIar0jdGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavhviwAKCRBVnxHm/pHO
 9VUAB/9IzaGbMTpsXnd2PGz8c3gcqZy+Z+jxOiamRn/UjfTo06hrOYU1fkCp+YemMD12Oe2ymlA
 2hpgWJ6qfcSNmWm7QP212nafX4Lc5oyHEMB7W3Ir6lJqtSzNsCDe+BGVjgmmN6015Yhe4sYrTkg
 gHsZDn75WBS6NAYOqbskC0/QzAz0w9/j2xoaih8eNdwDGxEwUHHcrMfXrhXonk2nGK62Ao1EyMD
 7fB+4+NX4XCtn/0mzlP90JAz5snM/9h0ivmzv5+o6LBgFslxqA+ML64Ru7BZtwrdgR6A7NGhA8O
 4uc76PuzAFjH5V44iL5Qqc/CDtgAdqHEnyjkaL5CGZU0G1HE
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
The index comes from an allocator, so the host assigned ids are unique
among themselves. The base is chosen just above the 16-bit range a v2
header can express, so an endpoint using v2 can never claim an id in the
host range. An endpoint using v1 can claim any 32-bit id, so a collision
is possible, but unlikely as the firmware assigned node ids are either
smaller than this base or in the range of 0x08e5ff85. Such a collision is
caught when the id is added to the node lookup table.

Finally, call the new API from MHI endpoint driver by passing the MHI
controller index as the parameter. The MHI controller index is unique for
each controller, thereby for each MHI endpoint device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS        |  1 +
 include/net/qrtr.h | 27 +++++++++++++++++++++++++++
 net/qrtr/mhi.c     |  4 +++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..dfec5181c6e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23139,6 +23139,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	include/net/qrtr.h
 F:	include/trace/events/qrtr.h
 F:	include/uapi/linux/qrtr.h
 F:	net/qrtr/
diff --git a/include/net/qrtr.h b/include/net/qrtr.h
new file mode 100644
index 000000000000..e2a8d93564b5
--- /dev/null
+++ b/include/net/qrtr.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _NET_QRTR_H
+#define _NET_QRTR_H
+
+#include <linux/types.h>
+
+/*
+ * Base for the node ids the host assigns to endpoints. It sits just above the
+ * 16-bit range a v2 header can express, so a v2 endpoint can never claim an id
+ * in it. A v1 endpoint can claim any 32-bit id, so a collision is possible,
+ * but unlikely as the firmware assigned node ids are either smaller than this
+ * base or in the range of 0x08e5ff85. A collision is caught when the id is
+ * added to the node lookup table.
+ */
+#define QRTR_NODE_HOST_BASE 0x10000u
+
+/*
+ * Compute host node id from a per-device index. The index must be unique among
+ * the host assigned endpoints.
+ */
+static inline unsigned int qrtr_host_node_id(unsigned int index)
+{
+	return QRTR_NODE_HOST_BASE + index;
+}
+
+#endif /* _NET_QRTR_H */
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 1040c3c8cfd6..e9377f818b4d 100644
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



