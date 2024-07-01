Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47130C2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 16:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eQ7CJM5zbGaQpNFWF5LW8nZ4UhDUNvxA1Ry30P+GM3U=; b=M6sX9G1BJNVxuaR5bI1xn8kVf8
	zKt4Z6zG/Ka+xHaKtQLcSyxlW1f9fVgM3egoTgXoxpS+jtxogXkCKYveJWpqrBvzQ6ViYybJeh9A1
	grv+FEV7bqbh7F0fZjbrLy7/kMzqHq3sPGr0g8RavqlUqF6kuLl0ZM7t/69iFObPJMzwMMylavfjD
	Cykw8rA8XEqqfM71IJiDGnVk7jIZSUmCefD8JpHFRzUL2hyb1UJK8ehlS6dKummc1sN56HvlTITag
	CM3Lhy0s0Pdklt00XF279miRh9dxey9o/IZqUheRCv0pEIo9UYMj420/nDO22jnUsbekb8d4sKW9I
	hGJ8W8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJrY-000000046sc-3QCX
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 16:26:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJrV-000000046rg-1ZH7
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 16:26:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461ALxaB023190;
	Mon, 1 Jul 2024 16:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eQ7CJM5zbGaQpNFWF5LW8nZ4UhDUNvxA1Ry
	30P+GM3U=; b=GpdNDv28DtG/iLmM8HIyfKNzwZRurXK8FvYE6KzMDF4XBC7sGyM
	49SCh2sjYYMRV1fnsE2FsIgYjA5bvlWb0p9fgS3PkWXL2NeVYcDMEbttL0esIsXr
	4uXpNnhjNpFwH9jSXoyQluy8ZfBjB6bxWSDZDsPdX9+kxWQM6UWvmNw/yuc8lWTO
	2QZd/fecFVRhuEalgpM5ZVLAHaqxqD3Rxy4D9/3Ji4g96G9tpOpuWb22TeYf6GUg
	czi1F9qDhzlI8viCVP4Hud6qn3mf6pWz9f69Lbppm0EhxVquDuHNyZNzr9Qt+Imq
	ejmO+sJFVL/QvHeb0yXcI4Qb1/pQ+a6ClTQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027yf51y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 16:26:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 461GQZuD021451;
	Mon, 1 Jul 2024 16:26:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 402bbkrk9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 16:26:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 461GQZsb021445;
	Mon, 1 Jul 2024 16:26:35 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 461GQZ1j021444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 16:26:35 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 5764041147; Mon,  1 Jul 2024 21:56:34 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rajat Soni <quic_rajson@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: Add WMI control path stats infra
Date: Mon,  1 Jul 2024 21:56:16 +0530
Message-Id: <20240701162616.2762256-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dfa7Jjcd09pUXQEwjlFCvvdrM2kZdzsH
X-Proofpoint-ORIG-GUID: Dfa7Jjcd09pUXQEwjlFCvvdrM2kZdzsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_16,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_092641_529959_8B159157 
X-CRM114-Status: GOOD (  22.91  )
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

From: Rajat Soni <quic_rajson@quicinc.com>

Currently, firmware stats is requested by host through HTT interface.
Since HTT interface is already overloaded for data path stats,
leveraging control path to request other stats through WMI interface.

Add debugfs to request the stats and dump the stats forwarded by firmware.

ath12k
`-- pci-0000:06:00.0
    |-- mac0
        `-- wmi_ctrl_stats

This patch also adds support to request PDEV Tx stats, parse and dump
the data sent from firmware.

Usage:
echo <stats id> <action> > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats

Sample:
echo 1 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
WMI_CTRL_PATH_PDEV_TX_STATS:
fw_tx_mgmt_subtype =  0:0, 1:2, 2:0, 3:0, 4:0, 5:37, 6:0, 7:0, 8:908, 9:0, 10:0, 11:18, 12:2, 13:3, 14:0, 15:0,
fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0,
scan_fail_dfs_violation_time_ms = 0
nol_chk_fail_last_chan_freq = 0
nol_chk_fail_time_stamp_ms = 0
tot_peer_create_cnt = 7
tot_peer_del_cnt = 7
tot_peer_del_resp_cnt = 7
vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
v2
  - Rebased on ToT. Not tagged "Acked-by" due to below changes.
  - Added mutex_lock in ath12k_write_wmi_ctrl_path_stats() as subsequent
    called ath12k_mac_get_target_pdev_id() has locking correctness
    validator.
  - Handled NULL case of ar in ath12k_wmi_ctrl_path_stats_event()
---

 drivers/net/wireless/ath/ath12k/core.h    |   7 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 157 +++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c     | 319 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  86 ++++++
 4 files changed, 569 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 9de3df924a1c..b3891f07d145 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -484,6 +484,13 @@ struct ath12k_fw_stats {
 struct ath12k_debug {
 	struct dentry *debugfs_pdev;
 	struct dentry *debugfs_pdev_symlink;
+	struct ath12k_wmi_ctrl_path_stats_list wmi_ctrl_path_stats;
+	enum wmi_tlv_tag wmi_ctrl_path_stats_tagid;
+	struct completion wmi_ctrl_path_stats_rcvd;
+	u8 wmi_ctrl_path_stats_reqid;
+	/* To protect wmi_list manipulation */
+	spinlock_t  wmi_ctrl_path_stats_lock;
+	bool wmi_ctrl_path_stats_more_enabled;
 };
 
 struct ath12k_per_peer_tx_stats {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 751a9b04386a..4667ee2f6c51 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -5,6 +5,7 @@
  */
 
 #include "core.h"
+#include "debug.h"
 #include "debugfs.h"
 
 static ssize_t ath12k_write_simulate_radar(struct file *file,
@@ -67,6 +68,158 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
 	 */
 }
 
+static ssize_t ath12k_write_wmi_ctrl_path_stats(struct file *file,
+						const char __user *ubuf,
+						size_t count, loff_t *ppos)
+{
+	struct ath12k *ar = file->private_data;
+	struct wmi_ctrl_path_stats_arg arg = {};
+	u8 buf[128] = {0};
+	int ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+
+	ret = sscanf(buf, "%u %u", &arg.stats_id, &arg.action);
+	if (ret != 2)
+		return -EINVAL;
+
+	if (!arg.action || arg.action > WMI_REQUEST_CTRL_PATH_STAT_RESET)
+		return -EINVAL;
+
+	mutex_lock(&ar->conf_mutex);
+	ret = ath12k_wmi_send_wmi_ctrl_stats_cmd(ar, &arg);
+	if (ret && ret != -ETIMEDOUT) {
+		ath12k_info(ar->ab, "failed to send ctrl path stats request %d\n",
+			    ret);
+		goto unlock;
+	}
+	ret = count;
+
+unlock:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static int wmi_ctrl_path_pdev_stat(struct ath12k *ar, char __user *ubuf,
+				   size_t count, loff_t *ppos)
+{
+	char fw_tx_mgmt_subtype[WMI_MAX_STRING_LEN] = {0};
+	char fw_rx_mgmt_subtype[WMI_MAX_STRING_LEN] = {0};
+	struct wmi_ctrl_path_pdev_stats *stats, *tmp;
+	u16 index_tx, index_rx;
+	const int size = 2048;
+	u8 i;
+	int len = 0;
+
+	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	LIST_HEAD(wmi_stats_list);
+
+	spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+	list_splice_tail_init(&ar->debug.wmi_ctrl_path_stats.pdev_stats, &wmi_stats_list);
+	spin_unlock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+
+	list_for_each_entry_safe(stats, tmp, &wmi_stats_list, list) {
+		if (!stats)
+			break;
+
+		index_tx = 0;
+		index_rx = 0;
+
+		for (i = 0; i < IEEE80211_MGMT_FRAME_SUBTYPE_MAX; i++) {
+			index_tx += scnprintf(&fw_tx_mgmt_subtype[index_tx],
+					     WMI_MAX_STRING_LEN - index_tx,
+					     " %u:%u,", i,
+					    stats->tx_mgmt_subtype[i]);
+			index_rx += scnprintf(&fw_rx_mgmt_subtype[index_rx],
+					     WMI_MAX_STRING_LEN - index_rx,
+					     " %u:%u,", i,
+					     stats->rx_mgmt_subtype[i]);
+		}
+
+		len += scnprintf(buf + len, size - len,
+				 "WMI_CTRL_PATH_PDEV_TX_STATS:\n");
+		len += scnprintf(buf + len, size - len,
+				 "fw_tx_mgmt_subtype = %s\n",
+				 fw_tx_mgmt_subtype);
+		len += scnprintf(buf + len, size - len,
+				 "fw_rx_mgmt_subtype = %s\n",
+				 fw_rx_mgmt_subtype);
+		len += scnprintf(buf + len, size - len,
+				 "scan_fail_dfs_violation_time_ms = %u\n",
+				 stats->scan_fail_dfs_viol_time_ms);
+		len += scnprintf(buf + len, size - len,
+				 "nol_chk_fail_last_chan_freq = %u\n",
+				 stats->nol_chk_fail_last_chan_freq);
+		len += scnprintf(buf + len, size - len,
+				 "nol_chk_fail_time_stamp_ms = %u\n",
+				 stats->nol_chk_fail_time_stamp_ms);
+		len += scnprintf(buf + len, size - len,
+				 "tot_peer_create_cnt = %u\n",
+				 stats->tot_peer_create_cnt);
+		len += scnprintf(buf + len, size - len,
+				 "tot_peer_del_cnt = %u\n",
+				 stats->tot_peer_del_cnt);
+		len += scnprintf(buf + len, size - len,
+				 "tot_peer_del_resp_cnt = %u\n",
+				 stats->tot_peer_del_resp_cnt);
+		len += scnprintf(buf + len, size - len,
+				 "vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = %u\n",
+				 stats->sched_algo_fifo_full_cnt);
+		list_del(&stats->list);
+		kfree(stats);
+	}
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static ssize_t ath12k_read_wmi_ctrl_path_stats(struct file *file,
+					       char __user *ubuf,
+					       size_t count, loff_t *ppos)
+{
+	struct ath12k *ar = file->private_data;
+	int ret;
+	enum wmi_tlv_tag tagid;
+
+	tagid = ar->debug.wmi_ctrl_path_stats_tagid;
+
+	switch (tagid) {
+	case WMI_TAG_CTRL_PATH_PDEV_STATS:
+		ret = wmi_ctrl_path_pdev_stat(ar, ubuf, count, ppos);
+		break;
+	default:
+		/* Unsupported tag */
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations ath12k_fops_wmi_ctrl_stats = {
+	.write = ath12k_write_wmi_ctrl_path_stats,
+	.open = simple_open,
+	.read = ath12k_read_wmi_ctrl_path_stats,
+};
+
+static void ath12k_debugfs_wmi_ctrl_stats_register(struct ath12k *ar)
+{
+	debugfs_create_file("wmi_ctrl_stats", 0600,
+			    ar->debug.debugfs_pdev,
+			    ar,
+			    &ath12k_fops_wmi_ctrl_stats);
+	INIT_LIST_HEAD(&ar->debug.wmi_ctrl_path_stats.pdev_stats);
+	spin_lock_init(&ar->debug.wmi_ctrl_path_stats_lock);
+	init_completion(&ar->debug.wmi_ctrl_path_stats_rcvd);
+	ar->debug.wmi_ctrl_path_stats_more_enabled = false;
+}
+
 void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -89,6 +242,10 @@ void ath12k_debugfs_register(struct ath12k *ar)
 				    ar->debug.debugfs_pdev, ar,
 				    &fops_simulate_radar);
 	}
+
+	if (test_bit(WMI_TLV_SERVICE_CTRL_PATH_STATS_REQUEST,
+		     ar->ab->wmi_ab.svc_map))
+		ath12k_debugfs_wmi_ctrl_stats_register(ar);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 9f6be557365e..4964b2954c5a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include "core.h"
 #include "debug.h"
+#include "debugfs.h"
 #include "mac.h"
 #include "hw.h"
 #include "peer.h"
@@ -7143,6 +7144,234 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	kfree(tb);
 }
 
+#ifdef CONFIG_ATH12K_DEBUGFS
+static void
+ath12k_wmi_ctrl_path_pdev_stats_list_free(struct list_head *head)
+{
+	struct wmi_ctrl_path_pdev_stats *stats_list, *tmp;
+
+	list_for_each_entry_safe(stats_list, tmp, head, list) {
+		list_del(&stats_list->list);
+		kfree(stats_list);
+	}
+}
+
+static void
+ath12k_wmi_ctrl_path_stats_list_free(struct ath12k_wmi_ctrl_path_stats_list *param)
+{
+	ath12k_wmi_ctrl_path_pdev_stats_list_free(&param->pdev_stats);
+}
+
+static int wmi_pull_ctrl_path_pdev_tx_stats_tlv(struct ath12k_base *ab, u16 len,
+						const void *ptr, void *data)
+{
+	struct ath12k_wmi_ctrl_path_stats_list *stats_buff = data;
+	const struct wmi_ctrl_path_pdev_stats_params *stats = ptr;
+	struct ath12k_wmi_ctrl_path_stats_list *stats_list;
+	struct wmi_ctrl_path_pdev_stats *pdev_stats =
+		kzalloc(sizeof(*pdev_stats), GFP_ATOMIC);
+	struct ath12k *ar;
+	u32 pdev_id;
+	int i;
+
+	if (!pdev_stats)
+		return -ENOMEM;
+
+	for (i = 0; i < IEEE80211_MGMT_FRAME_SUBTYPE_MAX; i++) {
+		pdev_stats->tx_mgmt_subtype[i] =
+			__le32_to_cpu(stats->tx_mgmt_subtype[i]);
+		pdev_stats->rx_mgmt_subtype[i] =
+			__le32_to_cpu(stats->rx_mgmt_subtype[i]);
+	}
+	pdev_stats->scan_fail_dfs_viol_time_ms =
+		__le32_to_cpu(stats->scan_fail_dfs_viol_time_ms);
+	pdev_stats->nol_chk_fail_last_chan_freq =
+		__le32_to_cpu(stats->nol_chk_fail_last_chan_freq);
+	pdev_stats->nol_chk_fail_time_stamp_ms =
+		__le32_to_cpu(stats->nol_chk_fail_time_stamp_ms);
+	pdev_stats->tot_peer_create_cnt =
+		__le32_to_cpu(stats->tot_peer_create_cnt);
+	pdev_stats->tot_peer_del_cnt =
+		__le32_to_cpu(stats->tot_peer_del_cnt);
+	pdev_stats->tot_peer_del_resp_cnt =
+		__le32_to_cpu(stats->tot_peer_del_resp_cnt);
+	pdev_stats->sched_algo_fifo_full_cnt =
+		__le32_to_cpu(stats->sched_algo_fifo_full_cnt);
+
+	list_add_tail(&pdev_stats->list, &stats_buff->pdev_stats);
+	pdev_id = le32_to_cpu(stats->pdev_id);
+
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id + 1);
+	if (!ar) {
+		rcu_read_unlock();
+		ath12k_warn(ab, "Failed to get ar for wmi ctrl stats\n");
+		ath12k_wmi_ctrl_path_pdev_stats_list_free(&stats_buff->pdev_stats);
+		return -EINVAL;
+	}
+
+	spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+	stats_list = &ar->debug.wmi_ctrl_path_stats;
+	ath12k_wmi_ctrl_path_pdev_stats_list_free(&stats_list->pdev_stats);
+	spin_unlock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+	ar->debug.wmi_ctrl_path_stats_tagid = WMI_TAG_CTRL_PATH_PDEV_STATS;
+	stats_buff->ar = ar;
+	rcu_read_unlock();
+	return 0;
+}
+
+static int ath12k_wmi_ctrl_stats_subtlv_parser(struct ath12k_base *ab,
+					       u16 tag, u16 len,
+					       const void *ptr, void *data)
+{
+	int ret;
+
+	switch (tag) {
+	case WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM:
+		break;
+	case WMI_TAG_CTRL_PATH_PDEV_STATS:
+		ret = wmi_pull_ctrl_path_pdev_tx_stats_tlv(ab, len, ptr, data);
+		break;
+		/* Add case for newly wmi ctrl path added stats here */
+	default:
+		ath12k_warn(ab,
+			    "Received invalid tag for wmi ctrl path stats in subtlvs, tag : 0x%x\n",
+			    tag);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int ath12k_wmi_ctrl_stats_event_parser(struct ath12k_base *ab,
+					      u16 tag, u16 len,
+					      const void *ptr, void *data)
+{
+	int ret;
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI, "wmi ctrl path stats tag 0x%x of len %d rcvd\n",
+		   tag, len);
+
+	switch (tag) {
+	case WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM:
+		/* Fixed param is already processed*/
+		ret = 0;
+		break;
+	case WMI_TAG_ARRAY_STRUCT:
+		/* len 0 is expected for array of struct when there
+		 * is no content of that type to pack inside that tlv
+		 */
+		if (len == 0)
+			return 0;
+
+		ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+					  ath12k_wmi_ctrl_stats_subtlv_parser,
+					  data);
+		break;
+	default:
+		ath12k_warn(ab, "Received invalid tag for wmi ctrl path stats\n");
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static void ath12k_wmi_ctrl_path_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
+{
+	struct wmi_ctrl_path_stats_event *fixed_param;
+	struct ath12k_wmi_ctrl_path_stats_list param = {0};
+	struct ath12k_wmi_ctrl_path_stats_list *stats;
+	const struct wmi_tlv *tlv;
+	struct list_head *src, *dst;
+	struct ath12k *ar;
+	void *ptr = skb->data;
+	u16 tlv_tag, tag_id;
+	u32 more;
+	int ret;
+
+	if (!skb->data) {
+		ath12k_warn(ab, "No data present in wmi ctrl stats event\n");
+		return;
+	}
+
+	if (skb->len < (sizeof(*fixed_param) + TLV_HDR_SIZE)) {
+		ath12k_warn(ab, "wmi ctrl stats event size invalid\n");
+		return;
+	}
+
+	param.ar = NULL;
+
+	tlv = ptr;
+	tlv_tag = le32_get_bits(tlv->header, WMI_TLV_TAG);
+	ptr += sizeof(*tlv);
+
+	if (tlv_tag != WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM) {
+		ath12k_warn(ab, "wmi ctrl stats without fixed param tlv at start\n");
+		return;
+	}
+
+	INIT_LIST_HEAD(&param.pdev_stats);
+
+	fixed_param = ptr;
+	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath12k_wmi_ctrl_stats_event_parser,
+				  &param);
+	if (ret) {
+		ath12k_warn(ab, "failed to parse wmi_ctrl_path_stats tlv: %d\n", ret);
+		if (!param.ar)
+			return;
+		goto free;
+	}
+
+	ar = param.ar;
+	if (!ar)
+		return;
+
+	tag_id = ar->debug.wmi_ctrl_path_stats_tagid;
+	stats = &ar->debug.wmi_ctrl_path_stats;
+	more = __le32_to_cpu(fixed_param->more);
+
+	switch (tag_id) {
+	case WMI_TAG_CTRL_PATH_PDEV_STATS:
+		src = &param.pdev_stats;
+		dst = &stats->pdev_stats;
+		break;
+	default:
+		goto free;
+	}
+
+	spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+	if (!more) {
+		if (!ar->debug.wmi_ctrl_path_stats_more_enabled)
+			ath12k_wmi_ctrl_path_stats_list_free(stats);
+		else
+			ar->debug.wmi_ctrl_path_stats_more_enabled = false;
+
+		list_splice_tail_init(src, dst);
+		complete(&ar->debug.wmi_ctrl_path_stats_rcvd);
+	} else {
+		if (!ar->debug.wmi_ctrl_path_stats_more_enabled) {
+			ath12k_wmi_ctrl_path_stats_list_free(stats);
+			ar->debug.wmi_ctrl_path_stats_more_enabled = true;
+		}
+		list_splice_tail_init(src, dst);
+	}
+	spin_unlock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+	return;
+free:
+	spin_lock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+	ath12k_wmi_ctrl_path_stats_list_free(&param);
+	spin_unlock_bh(&ar->debug.wmi_ctrl_path_stats_lock);
+}
+#else
+static void ath12k_wmi_ctrl_path_stats_event(struct ath12k_base *ab,
+					     struct sk_buff *skb)
+{
+}
+#endif /* CONFIG_ATH12K_DEBUGFS */
+
 static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -7269,6 +7498,10 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
 		ath12k_wmi_gtk_offload_status_event(ab, skb);
 		break;
+	case WMI_CTRL_PATH_STATS_EVENTID:
+		ath12k_wmi_ctrl_path_stats_event(ab, skb);
+		break;
+
 	/* TODO: Add remaining events */
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
@@ -7404,6 +7637,92 @@ int ath12k_wmi_simulate_radar(struct ath12k *ar)
 	return ath12k_wmi_send_unit_test_cmd(ar, wmi_ut, dfs_args);
 }
 
+#ifdef CONFIG_ATH12K_DEBUGFS
+int
+ath12k_wmi_send_wmi_ctrl_stats_cmd(struct ath12k *ar,
+				   struct wmi_ctrl_path_stats_arg *arg)
+{
+	struct wmi_ctrl_path_stats_cmd *cmd;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct ath12k_base *ab = wmi->wmi_ab->ab;
+	struct ath12k_debug *debug = &ar->debug;
+	__le32 pdev_id;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	int len, ret;
+	void *ptr;
+	u32 stats_id;
+
+	pdev_id = cpu_to_le32(ath12k_mac_get_target_pdev_id(ar));
+	stats_id = (1 << arg->stats_id);
+
+	len = sizeof(*cmd) +
+		TLV_HDR_SIZE + sizeof(u32) +
+		TLV_HDR_SIZE + TLV_HDR_SIZE;
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (void *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_CTRL_PATH_STATS_CMD_FIXED_PARAM,
+						 sizeof(*cmd));
+	cmd->stats_id = cpu_to_le32(stats_id);
+	cmd->req_id = cpu_to_le32(arg->req_id);
+	cmd->action = cpu_to_le32(arg->action);
+
+	ptr = skb->data + sizeof(*cmd);
+
+	/* The below TLV arrays optionally follow this fixed param TLV structure
+	 * 1. ARRAY_UINT32 pdev_ids[]
+	 *	If this array is present and non-zero length, stats should only
+	 *	be provided from the pdevs identified in the array.
+	 * 2. ARRAY_UNIT32 vdev_ids[]
+	 *	If this array is present and non-zero length, stats should only
+	 *	be provided from the vdevs identified in the array.
+	 * 3. ath12k_wmi_mac_addr_params peer_macaddr[];
+	 *	If this array is present and non-zero length, stats should only
+	 *	be provided from the peers with the MAC addresses specified
+	 *	in the array
+	 */
+
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, sizeof(u32));
+	ptr += TLV_HDR_SIZE;
+	memcpy(ptr, &pdev_id, sizeof(u32));
+	ptr += sizeof(u32);
+
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, 0);
+	ptr += TLV_HDR_SIZE;
+
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_FIXED_STRUCT, 0);
+	ptr += TLV_HDR_SIZE;
+
+	if (arg->action == WMI_REQUEST_CTRL_PATH_STAT_GET)
+		reinit_completion(&ar->debug.wmi_ctrl_path_stats_rcvd);
+
+	ret = ath12k_wmi_cmd_send(wmi, skb,
+				  WMI_REQUEST_CTRL_PATH_STATS_CMDID);
+	if (ret) {
+		dev_kfree_skb(skb);
+		ath12k_warn(ab, "Failed to send WMI_REQUEST_CTRL_PATH_STATS_CMDID: %d",
+			    ret);
+	} else {
+		if (arg->action == WMI_REQUEST_CTRL_PATH_STAT_GET) {
+			if (!wait_for_completion_timeout(&debug->wmi_ctrl_path_stats_rcvd,
+							 WMI_CTRL_STATS_READY_TIMEOUT)) {
+				ath12k_warn(ab, "wmi ctrl path stats timed out\n");
+				ret = -ETIMEDOUT;
+			}
+		}
+	}
+
+	return ret;
+}
+#endif
+
 int ath12k_wmi_connect(struct ath12k_base *ab)
 {
 	u32 i;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f1f52175a52b..926e0631dffe 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -515,6 +515,8 @@ enum wmi_tlv_cmd_id {
 	WMI_REQUEST_RCPI_CMDID,
 	WMI_REQUEST_PEER_STATS_INFO_CMDID,
 	WMI_REQUEST_RADIO_CHAN_STATS_CMDID,
+	WMI_REQUEST_WLM_STATS_CMDID,
+	WMI_REQUEST_CTRL_PATH_STATS_CMDID,
 	WMI_SET_ARP_NS_OFFLOAD_CMDID = WMI_TLV_CMD(WMI_GRP_ARP_NS_OFL),
 	WMI_ADD_PROACTIVE_ARP_RSP_PATTERN_CMDID,
 	WMI_DEL_PROACTIVE_ARP_RSP_PATTERN_CMDID,
@@ -777,6 +779,8 @@ enum wmi_tlv_event_id {
 	WMI_UPDATE_RCPI_EVENTID,
 	WMI_PEER_STATS_INFO_EVENTID,
 	WMI_RADIO_CHAN_STATS_EVENTID,
+	WMI_WLM_STATS_EVENTID,
+	WMI_CTRL_PATH_STATS_EVENTID,
 	WMI_NLO_MATCH_EVENTID = WMI_TLV_CMD(WMI_GRP_NLO_OFL),
 	WMI_NLO_SCAN_COMPLETE_EVENTID,
 	WMI_APFIND_EVENTID,
@@ -1926,6 +1930,9 @@ enum wmi_tlv_tag {
 	WMI_TAG_SERVICE_READY_EXT2_EVENT = 0x334,
 	WMI_TAG_FILS_DISCOVERY_TMPL_CMD = 0x344,
 	WMI_TAG_MAC_PHY_CAPABILITIES_EXT = 0x36F,
+	WMI_TAG_CTRL_PATH_STATS_CMD_FIXED_PARAM = 0x388,
+	WMI_TAG_CTRL_PATH_STATS_EV_FIXED_PARAM,
+	WMI_TAG_CTRL_PATH_PDEV_STATS,
 	WMI_TAG_REGULATORY_RULE_EXT_STRUCT = 0x3A9,
 	WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT,
 	WMI_TAG_EHT_RATE_SET = 0x3C4,
@@ -2155,6 +2162,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET = 213,
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
+	WMI_TLV_SERVICE_CTRL_PATH_STATS_REQUEST = 250,
 	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
 
 	WMI_MAX_EXT_SERVICE = 256,
@@ -5460,6 +5468,82 @@ enum wmi_sta_keepalive_method {
 #define WMI_STA_KEEPALIVE_INTERVAL_DEFAULT	30
 #define WMI_STA_KEEPALIVE_INTERVAL_DISABLE	0
 
+#define WMI_CTRL_STATS_READY_TIMEOUT           (1 * HZ)
+
+enum  wmi_ctrl_path_stats_id {
+	/* bit 0 is currently unused / reserved */
+	WMI_REQ_CTRL_PATH_PDEV_TX_STAT          = 1,
+};
+
+enum wmi_ctrl_path_stats_action {
+	WMI_REQUEST_CTRL_PATH_STAT_GET          = 1,
+	WMI_REQUEST_CTRL_PATH_STAT_RESET        = 2,
+	WMI_REQUEST_CTRL_PATH_STAT_START        = 3,
+	WMI_REQUEST_CTRL_PATH_STAT_STOP         = 4,
+};
+
+struct  wmi_ctrl_path_stats_cmd {
+	__le32 tlv_header;
+	__le32 stats_id;
+	__le32 req_id;
+	/* get/reset/start/stop based on stats id is defined as
+	 * a part of wmi_ctrl_path_stats_action
+	 */
+	__le32 action;
+} __packed;
+
+struct wmi_ctrl_path_stats_arg {
+	u32 stats_id;
+	u32 req_id;
+	u32 action;
+};
+
+struct wmi_ctrl_path_stats_event {
+	__le32 req_id;
+	/* more flag
+	 * 1 - More events sent after this event.
+	 * 0 - no more events after this event.
+	 */
+	__le32 more;
+};
+
+/* WMI arrays of length WMI_MGMT_FRAME_SUBTYPE_MAX use the
+ * IEEE802.11 standard's enumeration of mgmt frame subtypes:
+ */
+#define IEEE80211_MGMT_FRAME_SUBTYPE_MAX       16
+#define WMI_MAX_STRING_LEN                     256
+
+struct wmi_ctrl_path_pdev_stats_params {
+	__le32 pdev_id;
+	__le32 tx_mgmt_subtype[IEEE80211_MGMT_FRAME_SUBTYPE_MAX];
+	__le32 rx_mgmt_subtype[IEEE80211_MGMT_FRAME_SUBTYPE_MAX];
+	__le32 scan_fail_dfs_viol_time_ms;
+	__le32 nol_chk_fail_last_chan_freq;
+	__le32 nol_chk_fail_time_stamp_ms;
+	__le32 tot_peer_create_cnt;
+	__le32 tot_peer_del_cnt;
+	__le32 tot_peer_del_resp_cnt;
+	__le32 sched_algo_fifo_full_cnt;
+} __packed;
+
+struct ath12k_wmi_ctrl_path_stats_list {
+	struct list_head pdev_stats;
+	struct ath12k *ar;
+};
+
+struct wmi_ctrl_path_pdev_stats {
+	struct list_head list;
+	u32 tx_mgmt_subtype[IEEE80211_MGMT_FRAME_SUBTYPE_MAX];
+	u32 rx_mgmt_subtype[IEEE80211_MGMT_FRAME_SUBTYPE_MAX];
+	u32 scan_fail_dfs_viol_time_ms;
+	u32 nol_chk_fail_last_chan_freq;
+	u32 nol_chk_fail_time_stamp_ms;
+	u32 tot_peer_create_cnt;
+	u32 tot_peer_del_cnt;
+	u32 tot_peer_del_resp_cnt;
+	u32 sched_algo_fifo_full_cnt;
+};
+
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config);
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,
@@ -5585,6 +5669,8 @@ int ath12k_wmi_set_bios_cmd(struct ath12k_base *ab, u32 param_id,
 			    const u8 *buf, size_t buf_len);
 int ath12k_wmi_set_bios_sar_cmd(struct ath12k_base *ab, const u8 *psar_table);
 int ath12k_wmi_set_bios_geo_cmd(struct ath12k_base *ab, const u8 *pgeo_table);
+int ath12k_wmi_send_wmi_ctrl_stats_cmd(struct ath12k *ar,
+				       struct wmi_ctrl_path_stats_arg *arg);
 
 static inline u32
 ath12k_wmi_caps_ext_get_pdev_id(const struct ath12k_wmi_caps_ext_params *param)

base-commit: 625229220a4f64c9a8a9444905b74dc594e607ac
-- 
2.34.1


