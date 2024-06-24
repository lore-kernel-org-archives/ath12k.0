Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C053C2BD09
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 04:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaEjmIoARqaYixjAkQvQhatsU2aTHiDF+pYGC7CM0Ws=; b=RSC2l/uPA1cKqUWPT9HtR1eT9N
	mfEEBjy/LE0iaoS4N5ylCqfYnzBFLQFj+woH0Px2tHU0KOo6pcSm6qEjculRbgERogWo8o8SRijra
	XnM+VcRCWzJ9GZ7w3uPjm8q4TiumHrYul3KcBsmQeTiOs65r+mPtHBFhSH0aM5ZdBui9hIKH9PsXC
	ELvD+XFBebVwjNRCkkEd5qn7EbW4kwmdinyBiZEfk5aBhmdgPEpaesDssrHZtGH6ZwcqHkVuq1rJB
	y5yfkz+EK3Ou1IJfGzWloZYwlbNI6SIW11kSoJ8M2hKluxTG7vEIEBtnwq7q9bhhLpsmAYFU+Qncw
	oqUwcNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLbTp-0000000FW6Z-0FCi
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 04:39:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLbTj-0000000FW3I-1C5w
	for ath12k@lists.infradead.org;
	Mon, 24 Jun 2024 04:38:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NKaQXP020835;
	Mon, 24 Jun 2024 04:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZaEjmIoARqa
	YixjAkQvQhatsU2aTHiDF+pYGC7CM0Ws=; b=f5c5PGmqCUNN7BOoIPSkRyopMzD
	hSUnPqz+YojZ15FHeWtUoFuUOTLpi06Y1pOndfdkj2zromFnIu+wYN6gipraX7vP
	krRw6xQuxdD+5pQPRmmcUQY2Xug9P4ChYPFRoXNVkR18Auu/kVJv7hWgjls8bHvM
	K3h3lvIB7RiJ9YZZZYlmEtmfA59KcKabyk/18qT4kqPCD8b+IK2c0XYadnFcfSPp
	rvLe8ei6xlbVbBtz6nPECcHpvNYGEm/S4rWBY+jd07TRG4JDlBn/Px3T6SBT1g6Y
	wkwxVESKpv48J0ZENWPcgaifeyQ+HZ6hpWyHhoHgbw1fMAns/Icjp/+oOYw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywq072jqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:38:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45O4cnF1000582;
	Mon, 24 Jun 2024 04:38:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpkq178-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:38:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45O4boBJ032080;
	Mon, 24 Jun 2024 04:38:49 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45O4cnDY000433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:38:49 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id BE51741122; Mon, 24 Jun 2024 10:08:48 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH v6 1/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Date: Mon, 24 Jun 2024 10:08:42 +0530
Message-Id: <20240624043845.3502520-2-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624043845.3502520-1-quic_rgnanase@quicinc.com>
References: <20240624043845.3502520-1-quic_rgnanase@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kcNhwtbjormf69di6o6wMW24uOl4bi_A
X-Proofpoint-GUID: kcNhwtbjormf69di6o6wMW24uOl4bi_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_213855_529313_395FED28 
X-CRM114-Status: GOOD (  20.37  )
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
Add basic ath12k_debugfs_htt_stats_register and handle htt_stats_type
file operations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Makefile      |  2 +-
 drivers/net/wireless/ath/ath12k/core.h        |  7 ++
 drivers/net/wireless/ath/ath12k/debugfs.c     |  3 +
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 81 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 20 +++++
 5 files changed, 112 insertions(+), 1 deletion(-)
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
index d7a3e8fddb20..73264513faf0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -28,6 +28,7 @@
 #include "dbring.h"
 #include "fw.h"
 #include "acpi.h"
+#include "debugfs_htt_stats.h"
 
 #define SM(_v, _f) (((_v) << _f##_LSB) & _f##_MASK)
 
@@ -472,9 +473,15 @@ struct ath12k_fw_stats {
 	struct list_head bcn;
 };
 
+struct ath12k_dbg_htt_stats {
+	enum ath12k_dbg_htt_ext_stats_type type;
+	u32 cfg_param[4];
+};
+
 struct ath12k_debug {
 	struct dentry *debugfs_pdev;
 	struct dentry *debugfs_pdev_symlink;
+	struct ath12k_dbg_htt_stats htt_stats;
 };
 
 struct ath12k_per_peer_tx_stats {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 751a9b04386a..2a977c36af00 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -6,6 +6,7 @@
 
 #include "core.h"
 #include "debugfs.h"
+#include "debugfs_htt_stats.h"
 
 static ssize_t ath12k_write_simulate_radar(struct file *file,
 					   const char __user *user_buf,
@@ -89,6 +90,8 @@ void ath12k_debugfs_register(struct ath12k *ar)
 				    ar->debug.debugfs_pdev, ar,
 				    &fops_simulate_radar);
 	}
+
+	ath12k_debugfs_htt_stats_register(ar);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
new file mode 100644
index 000000000000..d1d469ae6d2b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -0,0 +1,81 @@
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
+	enum ath12k_dbg_htt_ext_stats_type type;
+	char buf[32];
+	size_t len;
+
+	mutex_lock(&ar->conf_mutex);
+	type = ar->debug.htt_stats.type;
+	mutex_unlock(&ar->conf_mutex);
+
+	len = scnprintf(buf, sizeof(buf), "%u\n", type);
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
+	const int size = 32;
+	int num_args;
+
+	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	num_args = sscanf(buf, "%u %u %u %u %u\n", &type, &cfg_param[0],
+			  &cfg_param[1], &cfg_param[2], &cfg_param[3]);
+	if (!num_args)
+		return -EINVAL;
+
+	if (type == ATH12K_DBG_HTT_EXT_STATS_RESET ||
+	    type >= ATH12K_DBG_HTT_NUM_EXT_STATS)
+		return -EINVAL;
+
+	mutex_lock(&ar->conf_mutex);
+
+	ar->debug.htt_stats.type = type;
+	ar->debug.htt_stats.cfg_param[0] = cfg_param[0];
+	ar->debug.htt_stats.cfg_param[1] = cfg_param[1];
+	ar->debug.htt_stats.cfg_param[2] = cfg_param[2];
+	ar->debug.htt_stats.cfg_param[3] = cfg_param[3];
+
+	mutex_unlock(&ar->conf_mutex);
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
+void ath12k_debugfs_htt_stats_register(struct ath12k *ar)
+{
+	debugfs_create_file("htt_stats_type", 0600, ar->debug.debugfs_pdev,
+			    ar, &fops_htt_stats_type);
+}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
new file mode 100644
index 000000000000..8610db89289a
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
+void ath12k_debugfs_htt_stats_register(struct ath12k *ar);
+
+/* htt_dbg_ext_stats_type */
+enum ath12k_dbg_htt_ext_stats_type {
+	ATH12K_DBG_HTT_EXT_STATS_RESET		= 0,
+
+	/* keep this last */
+	ATH12K_DBG_HTT_NUM_EXT_STATS,
+};
+
+#endif
-- 
2.34.1


