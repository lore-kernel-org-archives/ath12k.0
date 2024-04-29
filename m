Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16BFC04FFE
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCo3tvxK4jTrK2oSLSABD3d0B/4nHLnJGpsKjLfn4xI=; b=Ca8MkLOH3WY03snAvPywx/i/yL
	OSEuAA9MNORy3AoQiGoxvyYHhwWTUSP/YKkpkZOL8c96fdYlQFNpvaRMxQMCk9BJQR7//1YEIY1I2
	on5h+v0byJXbSH8SpOUPJTg+eU3s5UIc5jPVWtVHnRHdEe4AHzBTRP9qqLLzab0yf7UkR196SAYRO
	+s+v28sidetZUdXupuE1uO9Jerg/oNVHRFU1yKp5PzDrJShsfRlgvk9Mzp6ZoRudFi7JpzCpwkWIM
	k6F6/yJGB22tvYkpTqz2wceUx4bGF/jWlyuo6YvPboyLP5VvHIXFJYxhyT8dx9j14H2MiYnc46TvA
	Pz6b1Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1UxZ-00000003klX-2KpC
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 17:38:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1UxW-00000003kjc-1Bj5
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 17:38:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T8xcVc026977;
	Mon, 29 Apr 2024 17:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=sCo3tvx
	K4jTrK2oSLSABD3d0B/4nHLnJGpsKjLfn4xI=; b=OQhmhumW1t2ETJWch8z9HV9
	DMU/lbFca5QOeJv85oSi3l5gdNCgSvSbVBZQCBvU200d4GN3hQ0TkE8/T7vzwEKv
	VENF1XnH/etm+p98yFxc/s442Z1fXFPX3591YXNztUhV+Ru9mytkgTyt9AxGvXBL
	70NCzviweAG16VKEbe10fwsWAY0lbT4cL7kLIDR6KnmsREpPDixE5Itcjvq0hERR
	G21IfSw9OKLw69viQ2G6iSa6BL9iwIR5fZiUz4oUucftt6m6MT0REJaCDhTK0vPa
	6nJ8hG0fyxbY10DEfIfJI15irKcXUoxoo2CKruYkqCBhh7QFPnmhA8qvL2pQvhw=
	=
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt85sak9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 17:38:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 43THZNK4029372;
	Mon, 29 Apr 2024 17:38:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3xrtekh4y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 17:38:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43THcRLl032196;
	Mon, 29 Apr 2024 17:38:27 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 43THcRFo032185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 17:38:27 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 4B2E4410F1; Mon, 29 Apr 2024 23:08:26 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH 1/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Date: Mon, 29 Apr 2024 23:08:22 +0530
Message-Id: <20240429173825.2369355-2-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429173825.2369355-1-quic_rgnanase@quicinc.com>
References: <20240429173825.2369355-1-quic_rgnanase@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q_KD9ho-aie5rSGi82VDjgfYthby1mJR
X-Proofpoint-ORIG-GUID: Q_KD9ho-aie5rSGi82VDjgfYthby1mJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_103834_495308_C5350120 
X-CRM114-Status: GOOD (  20.68  )
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

From: Dinesh Karthikeyan <quic_dinek@quicinc.com>

Create debugfs_htt_stats file when ath12k debugfs support is enabled.
Add basic ath12k_debugfs_htt_stats_init and handle htt_stats_type
file operations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Makefile      |  2 +-
 drivers/net/wireless/ath/ath12k/core.h        |  9 +++
 drivers/net/wireless/ath/ath12k/debugfs.c     |  3 +
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 74 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 20 +++++
 5 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index d42480db7463..3491b8b8a1e2 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -23,7 +23,7 @@ ath12k-y += core.o \
 	    fw.o \
 	    p2p.o
 
-ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o
+ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o
 ath12k-$(CONFIG_ACPI) += acpi.o
 ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 47dde4401210..b7aa2d69aed3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -27,6 +27,7 @@
 #include "dbring.h"
 #include "fw.h"
 #include "acpi.h"
+#include "debugfs_htt_stats.h"
 
 #define SM(_v, _f) (((_v) << _f##_LSB) & _f##_MASK)
 
@@ -477,8 +478,16 @@ struct ath12k_fw_stats {
 	struct list_head bcn;
 };
 
+struct ath12k_dbg_htt_stats {
+	enum ath12k_dbg_htt_ext_stats_type type;
+	u32 cfg_param[4];
+	/* protects shared stats req buffer */
+	spinlock_t lock;
+};
+
 struct ath12k_debug {
 	struct dentry *debugfs_pdev;
+	struct ath12k_dbg_htt_stats htt_stats;
 };
 
 struct ath12k_per_peer_tx_stats {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 8d8ba951093b..30a80f04d824 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -6,6 +6,7 @@
 
 #include "core.h"
 #include "debugfs.h"
+#include "debugfs_htt_stats.h"
 
 static ssize_t ath12k_write_simulate_radar(struct file *file,
 					   const char __user *user_buf,
@@ -87,4 +88,6 @@ void ath12k_debugfs_register(struct ath12k *ar)
 				    ar->debug.debugfs_pdev, ar,
 				    &fops_simulate_radar);
 	}
+
+	ath12k_debugfs_htt_stats_init(ar);
 }
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
new file mode 100644
index 000000000000..4a58362bdaea
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/vmalloc.h>
+#include "core.h"
+#include "debug.h"
+#include "debugfs_htt_stats.h"
+
+static ssize_t ath12k_read_htt_stats_type(struct file *file,
+					  char __user *user_buf,
+					  size_t count, loff_t *ppos)
+{
+	struct ath12k *ar = file->private_data;
+	char buf[32];
+	size_t len;
+
+	len = scnprintf(buf, sizeof(buf), "%u\n", ar->debug.htt_stats.type);
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static ssize_t ath12k_write_htt_stats_type(struct file *file,
+					   const char __user *user_buf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath12k *ar = file->private_data;
+	enum ath12k_dbg_htt_ext_stats_type type;
+	unsigned int cfg_param[4] = {0};
+	int num_args;
+
+	char *buf __free(kfree) = kzalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	num_args = sscanf(buf, "%u %u %u %u %u\n", &type, &cfg_param[0],
+			  &cfg_param[1], &cfg_param[2], &cfg_param[3]);
+	if (!num_args || num_args > 5)
+		return -EINVAL;
+
+	if (type >= ATH12K_DBG_HTT_NUM_EXT_STATS)
+		return -E2BIG;
+
+	if (type == ATH12K_DBG_HTT_EXT_STATS_RESET)
+		return -EPERM;
+
+	ar->debug.htt_stats.type = type;
+	ar->debug.htt_stats.cfg_param[0] = cfg_param[0];
+	ar->debug.htt_stats.cfg_param[1] = cfg_param[1];
+	ar->debug.htt_stats.cfg_param[2] = cfg_param[2];
+	ar->debug.htt_stats.cfg_param[3] = cfg_param[3];
+
+	return count;
+}
+
+static const struct file_operations fops_htt_stats_type = {
+	.read = ath12k_read_htt_stats_type,
+	.write = ath12k_write_htt_stats_type,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+void ath12k_debugfs_htt_stats_init(struct ath12k *ar)
+{
+	spin_lock_init(&ar->debug.htt_stats.lock);
+	debugfs_create_file("htt_stats_type", 0600, ar->debug.debugfs_pdev,
+			    ar, &fops_htt_stats_type);
+}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
new file mode 100644
index 000000000000..6bd34d72b407
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef DEBUG_HTT_STATS_H
+#define DEBUG_HTT_STATS_H
+
+void ath12k_debugfs_htt_stats_init(struct ath12k *ar);
+
+/* htt_dbg_ext_stats_type */
+enum ath12k_dbg_htt_ext_stats_type {
+	ATH12K_DBG_HTT_EXT_STATS_RESET,
+
+	/* keep this last */
+	ATH12K_DBG_HTT_NUM_EXT_STATS,
+};
+
+#endif
-- 
2.34.1


