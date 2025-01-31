Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4417C02193
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpbVpsXB8TOq24FKhW+a5mN/CUm6Am7sSgRqJjP3wuA=; b=lpdCyQTVb3f1xdVrhaecRMXm2w
	fFIkfT88Wwj5PtSunDNxaJtGsQJ9VJwymhC+zYdWjr7lAaXnXZVZT5JsaOzhZoaHQG1SPfzyyQ4Mf
	2JWhOcG6b9Og28Rp4SQsS7m278pdlox1RJlqhCJ+gbEqPz4eCZJbMSJy05yR66Pja2KAeaBEZ0Ir7
	P7AsTZaPvPNyZPA/R8SPD9oIotaMW7QpZUvX+sGknpQh45vGRVg0lob8FDZ1MKyuN3gdJGTYuGLXE
	pT1VIPQYaR4xJ5tEYDATCAjkMlUZaWoE4soxiF0C1ePKvgTWob7OyzlE7SVN3uYoIzZUzXWpaKgd1
	X5dcKcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwpj-0000000BIp6-1kc2
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 19:37:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwpg-0000000BIo4-3vjR
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 19:37:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDKnnT016160
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SpbVpsXB8TO
	q24FKhW+a5mN/CUm6Am7sSgRqJjP3wuA=; b=GYkeVL/ccwMpBaXb9oFmjPUFzXQ
	cBDRQ2QKgYWx8pwSJp9c7iIULMwBOela0HA+o0Bu6Xhq5yoH9H1Kydt+aD8xIa5W
	f+dIauLhrUWsO2vhpf6mBXhDX2ykhJACYUJpNrZBWhPKufbSJWCKv8ODrCIbRXca
	ZrR5OMQQY4ujKLie3gZSWHRVsn/rCZ6LaUebekSj1tuMDYb35w/2KR/T6LDt0hcJ
	P0G4EXoWUw7P6+xpLlH7/UQOGQ6a0weGxa8P332ie+Ok4KWsBkQpXl53VsDwZ9OE
	7xa9cNnFzuuHvYAN+x9SHpFR02Sy7chtqWvwPkdLqpLewGKKl4P3+JshfZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyau8u8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:37:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2efc3292021so6513785a91.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 11:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738352258; x=1738957058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpbVpsXB8TOq24FKhW+a5mN/CUm6Am7sSgRqJjP3wuA=;
        b=lEJyHL7NFTID3EmutAQnfUktZssvoNwKqRNXoz2qEESLXbxc43Yy0MxCfj4KHPiwuV
         /aypS1rBFh9KmUxgLr4BJlMCl7t0ehDsdd+99nyHqiHyEwCj9my8nEvTNsxepQVuoFKy
         W2k7Y+SBatinQbzFRhcz2a6b6hDJc+1q1rWUAHERRS31s5jVrI4hVBAarj4zu5jcmBPi
         zSwB6uWkyqLCPbH2FAfHn3BhyV5RxQzGDCeQYoEr+9OnIf79hJUFk6Gq+w27bYfEVhTE
         yGTKBnpdRG9fJEy6ZxVXnvB06vHLYdz1V1ioB6qPVWnz2erhoh2InVlxkJiV1m4lc0rp
         A/LQ==
X-Gm-Message-State: AOJu0YyqcmgHXMG0/rcOSKsaG+MXy1yPNS/1w4lbhO9LeapP1hffTs6e
	7qjlbwu7nTQ7GpHrvaPIyyRN2tfur1OlpMh6vLq7MByhdefLhFqIn38OQsUXc7Te1en9JAFPeu0
	8TEyF1V5NwJ5Mfp+QHYcewmeY97sxnq5OFhtHDK5jVtI0dLB377/FXrCUfF3kC9T49w5e
X-Gm-Gg: ASbGnctm5HPajH5Mljm0EhQ+VIUglmJ27Xfbc7P6Nw6C4jjKcQspV36p2O6/T1HiR+W
	VjsYOr5NAkYJ+ej/6uZ77JaDlBtAscD6wv02RGlfAjHXLS0XUIb42kdj0UsPpwA2TQyL5BGftJO
	DQjPTyfFV1C0FBrKY2W4whhSoXN9nPdfU19HWqegCtErkIlzxFDCYhwuXn12BO3bbobz2/lSyhD
	dJ9jLZrzaJbDhePH3cfsyAmOQ8StIdR8+KvPR9sCxTDi2NnfxL+ElZ4iYCmsgAGUabWjw7iCeMS
	94V1M8ugGyDw1qp8O7tK+4Q+O1KLuiqyY33GhpBUIyRHaZl1h6N03NOwh3MqkmixhpSxw/InIZF
	jpHM7vvCdeO5ZMzdLucF+8uiddz3EJFiokA==
X-Received: by 2002:a17:90b:520d:b0:2f6:f107:fae4 with SMTP id 98e67ed59e1d1-2f83abd7cdamr17661804a91.8.1738352258202;
        Fri, 31 Jan 2025 11:37:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1gAf3nGiaYHSzKRRnmoNnhiXuveZTDh6AGcYwigm+N7UGX9POdGruLeFIxgFxSIAabcgzbA==
X-Received: by 2002:a17:90b:520d:b0:2f6:f107:fae4 with SMTP id 98e67ed59e1d1-2f83abd7cdamr17661770a91.8.1738352257588;
        Fri, 31 Jan 2025 11:37:37 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acac43sm4019271a91.40.2025.01.31.11.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:37:37 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH v2 1/2] wifi: ath12k: move firmware stats out of debugfs
Date: Sat,  1 Feb 2025 01:07:25 +0530
Message-Id: <20250131193726.3568086-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131193726.3568086-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250131193726.3568086-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hZZUex9-EJK_qYhS_C1cUZjLfydFYBBY
X-Proofpoint-ORIG-GUID: hZZUex9-EJK_qYhS_C1cUZjLfydFYBBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_113741_099468_C40063ED 
X-CRM114-Status: GOOD (  23.58  )
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

From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Currently, firmware stats, comprising pdev, vdev and beacon stats are
part of debugfs. In firmware pdev stats, firmware reports the final
Tx power used to transmit each packet. If driver wants to know the
final Tx power being used at firmware level, it can leverage from
firmware pdev stats.

Move firmware stats out of debugfs context in order to leverage
the final Tx power reported in it even when debugfs is disabled.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |  53 ++++++++++
 drivers/net/wireless/ath/ath12k/core.h    |   4 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 112 +---------------------
 drivers/net/wireless/ath/ath12k/debugfs.h |   5 -
 drivers/net/wireless/ath/ath12k/mac.c     |  50 ++++++++--
 drivers/net/wireless/ath/ath12k/mac.h     |   1 +
 drivers/net/wireless/ath/ath12k/wmi.c     |  99 +++++++++++++++----
 7 files changed, 181 insertions(+), 143 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 60c077b016b4..8dba67e6f462 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1054,6 +1054,59 @@ bool ath12k_core_hw_group_start_ready(struct ath12k_hw_group *ag)
 	return (ag->num_started == ag->num_devices);
 }
 
+static void ath12k_fw_stats_pdevs_free(struct list_head *head)
+{
+	struct ath12k_fw_stats_pdev *i, *tmp;
+
+	list_for_each_entry_safe(i, tmp, head, list) {
+		list_del(&i->list);
+		kfree(i);
+	}
+}
+
+void ath12k_fw_stats_bcn_free(struct list_head *head)
+{
+	struct ath12k_fw_stats_bcn *i, *tmp;
+
+	list_for_each_entry_safe(i, tmp, head, list) {
+		list_del(&i->list);
+		kfree(i);
+	}
+}
+
+static void ath12k_fw_stats_vdevs_free(struct list_head *head)
+{
+	struct ath12k_fw_stats_vdev *i, *tmp;
+
+	list_for_each_entry_safe(i, tmp, head, list) {
+		list_del(&i->list);
+		kfree(i);
+	}
+}
+
+void ath12k_fw_stats_init(struct ath12k *ar)
+{
+	INIT_LIST_HEAD(&ar->fw_stats.vdevs);
+	INIT_LIST_HEAD(&ar->fw_stats.pdevs);
+	INIT_LIST_HEAD(&ar->fw_stats.bcn);
+	init_completion(&ar->fw_stats_complete);
+}
+
+void ath12k_fw_stats_free(struct ath12k_fw_stats *stats)
+{
+	ath12k_fw_stats_pdevs_free(&stats->pdevs);
+	ath12k_fw_stats_vdevs_free(&stats->vdevs);
+	ath12k_fw_stats_bcn_free(&stats->bcn);
+}
+
+void ath12k_fw_stats_reset(struct ath12k *ar)
+{
+	spin_lock_bh(&ar->data_lock);
+	ar->fw_stats.fw_stats_done = false;
+	ath12k_fw_stats_free(&ar->fw_stats);
+	spin_unlock_bh(&ar->data_lock);
+}
+
 static void ath12k_core_trigger_partner(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 28db100cfac0..373e7baf379b 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1198,6 +1198,10 @@ u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab);
 u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab);
 
 void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag);
+void ath12k_fw_stats_init(struct ath12k *ar);
+void ath12k_fw_stats_bcn_free(struct list_head *head);
+void ath12k_fw_stats_free(struct ath12k_fw_stats *stats);
+void ath12k_fw_stats_reset(struct ath12k *ar);
 
 static inline const char *ath12k_scan_state_str(enum ath12k_scan_state state)
 {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 6d6708486d14..9c3cd668026b 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -69,102 +69,6 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
 	 */
 }
 
-static void ath12k_fw_stats_pdevs_free(struct list_head *head)
-{
-	struct ath12k_fw_stats_pdev *i, *tmp;
-
-	list_for_each_entry_safe(i, tmp, head, list) {
-		list_del(&i->list);
-		kfree(i);
-	}
-}
-
-static void ath12k_fw_stats_bcn_free(struct list_head *head)
-{
-	struct ath12k_fw_stats_bcn *i, *tmp;
-
-	list_for_each_entry_safe(i, tmp, head, list) {
-		list_del(&i->list);
-		kfree(i);
-	}
-}
-
-static void ath12k_fw_stats_vdevs_free(struct list_head *head)
-{
-	struct ath12k_fw_stats_vdev *i, *tmp;
-
-	list_for_each_entry_safe(i, tmp, head, list) {
-		list_del(&i->list);
-		kfree(i);
-	}
-}
-
-void ath12k_debugfs_fw_stats_reset(struct ath12k *ar)
-{
-	spin_lock_bh(&ar->data_lock);
-	ar->fw_stats.fw_stats_done = false;
-	ath12k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
-	ath12k_fw_stats_bcn_free(&ar->fw_stats.bcn);
-	ath12k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
-	spin_unlock_bh(&ar->data_lock);
-}
-
-static int ath12k_debugfs_fw_stats_request(struct ath12k *ar,
-					   struct ath12k_fw_stats_req_params *param)
-{
-	struct ath12k_base *ab = ar->ab;
-	unsigned long timeout, time_left;
-	int ret;
-
-	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
-
-	/* FW stats can get split when exceeding the stats data buffer limit.
-	 * In that case, since there is no end marking for the back-to-back
-	 * received 'update stats' event, we keep a 3 seconds timeout in case,
-	 * fw_stats_done is not marked yet
-	 */
-	timeout = jiffies + msecs_to_jiffies(3 * 1000);
-
-	ath12k_debugfs_fw_stats_reset(ar);
-
-	reinit_completion(&ar->fw_stats_complete);
-
-	ret = ath12k_wmi_send_stats_request_cmd(ar, param->stats_id,
-						param->vdev_id, param->pdev_id);
-
-	if (ret) {
-		ath12k_warn(ab, "could not request fw stats (%d)\n",
-			    ret);
-		return ret;
-	}
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete,
-						1 * HZ);
-	/* If the wait timed out, return -ETIMEDOUT */
-	if (!time_left)
-		return -ETIMEDOUT;
-
-	/* Firmware sends WMI_UPDATE_STATS_EVENTID back-to-back
-	 * when stats data buffer limit is reached. fw_stats_complete
-	 * is completed once host receives first event from firmware, but
-	 * still end might not be marked in the TLV.
-	 * Below loop is to confirm that firmware completed sending all the event
-	 * and fw_stats_done is marked true when end is marked in the TLV
-	 */
-	for (;;) {
-		if (time_after(jiffies, timeout))
-			break;
-
-		spin_lock_bh(&ar->data_lock);
-		if (ar->fw_stats.fw_stats_done) {
-			spin_unlock_bh(&ar->data_lock);
-			break;
-		}
-		spin_unlock_bh(&ar->data_lock);
-	}
-	return 0;
-}
-
 void
 ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 				struct ath12k_fw_stats *stats)
@@ -221,10 +125,6 @@ ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 			num_bcn = 0;
 		}
 	}
-	if (stats->stats_id == WMI_REQUEST_PDEV_STAT) {
-		list_splice_tail_init(&stats->pdevs, &ar->fw_stats.pdevs);
-		ar->fw_stats.fw_stats_done = true;
-	}
 }
 
 static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
@@ -251,7 +151,7 @@ static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
 	param.vdev_id = 0;
 	param.stats_id = WMI_REQUEST_VDEV_STAT;
 
-	ret = ath12k_debugfs_fw_stats_request(ar, &param);
+	ret = ath12k_mac_get_fw_stats(ar, &param);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to request fw vdev stats: %d\n", ret);
 		return ret;
@@ -316,7 +216,7 @@ static int ath12k_open_bcn_stats(struct inode *inode, struct file *file)
 			continue;
 
 		param.vdev_id = arvif->vdev_id;
-		ret = ath12k_debugfs_fw_stats_request(ar, &param);
+		ret = ath12k_mac_get_fw_stats(ar, &param);
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to request fw bcn stats: %d\n", ret);
 			return ret;
@@ -383,7 +283,7 @@ static int ath12k_open_pdev_stats(struct inode *inode, struct file *file)
 	param.vdev_id = 0;
 	param.stats_id = WMI_REQUEST_PDEV_STAT;
 
-	ret = ath12k_debugfs_fw_stats_request(ar, &param);
+	ret = ath12k_mac_get_fw_stats(ar, &param);
 	if (ret) {
 		ath12k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
 		return ret;
@@ -438,11 +338,7 @@ void ath12k_debugfs_fw_stats_register(struct ath12k *ar)
 	debugfs_create_file("pdev_stats", 0600, fwstats_dir, ar,
 			    &fops_pdev_stats);
 
-	INIT_LIST_HEAD(&ar->fw_stats.vdevs);
-	INIT_LIST_HEAD(&ar->fw_stats.bcn);
-	INIT_LIST_HEAD(&ar->fw_stats.pdevs);
-
-	init_completion(&ar->fw_stats_complete);
+	ath12k_fw_stats_init(ar);
 }
 
 void ath12k_debugfs_register(struct ath12k *ar)
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
index 1c30745ee415..c69614f1d2d9 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs.h
@@ -14,7 +14,6 @@ void ath12k_debugfs_register(struct ath12k *ar);
 void ath12k_debugfs_unregister(struct ath12k *ar);
 void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 				     struct ath12k_fw_stats *stats);
-void ath12k_debugfs_fw_stats_reset(struct ath12k *ar);
 #else
 static inline void ath12k_debugfs_soc_create(struct ath12k_base *ab)
 {
@@ -36,10 +35,6 @@ static inline void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 						   struct ath12k_fw_stats *stats)
 {
 }
-
-static inline void ath12k_debugfs_fw_stats_reset(struct ath12k *ar)
-{
-}
 #endif /* CONFIG_ATH12K_DEBUGFS */
 
 #endif /* _ATH12K_DEBUGFS_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4fb7e235be66..8cd33ea75590 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10109,12 +10109,12 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	return 0;
 }
 
-static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
-				   u32 vdev_id, u32 stats_id)
+int ath12k_mac_get_fw_stats(struct ath12k *ar,
+			    struct ath12k_fw_stats_req_params *param)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
-	unsigned long time_left;
+	unsigned long timeout, time_left;
 	int ret;
 
 	guard(mutex)(&ah->hw_mutex);
@@ -10122,9 +10122,18 @@ static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
 	if (ah->state != ATH12K_HW_STATE_ON)
 		return -ENETDOWN;
 
+	/* FW stats can get split when exceeding the stats data buffer limit.
+	 * In that case, since there is no end marking for the back-to-back
+	 * received 'update stats' event, we keep a 3 seconds timeout in case,
+	 * fw_stats_done is not marked yet
+	 */
+	timeout = jiffies + msecs_to_jiffies(3 * 1000);
+	ath12k_fw_stats_reset(ar);
+
 	reinit_completion(&ar->fw_stats_complete);
 
-	ret = ath12k_wmi_send_stats_request_cmd(ar, stats_id, vdev_id, pdev_id);
+	ret = ath12k_wmi_send_stats_request_cmd(ar, param->stats_id,
+						param->vdev_id, param->pdev_id);
 
 	if (ret) {
 		ath12k_warn(ab, "failed to request fw stats: %d\n", ret);
@@ -10133,14 +10142,33 @@ static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
 
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
 		   "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
-		   pdev_id, vdev_id, stats_id);
+		   param->pdev_id, param->vdev_id, param->stats_id);
 
 	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
 
-	if (!time_left)
+	if (!time_left) {
 		ath12k_warn(ab, "time out while waiting for get fw stats\n");
+		return -ETIMEDOUT;
+	}
 
-	return ret;
+	/* Firmware sends WMI_UPDATE_STATS_EVENTID back-to-back
+	 * when stats data buffer limit is reached. fw_stats_complete
+	 * is completed once host receives first event from firmware, but
+	 * still end might not be marked in the TLV.
+	 * Below loop is to confirm that firmware completed sending all the event
+	 * and fw_stats_done is marked true when end is marked in the TLV.
+	 */
+	for (;;) {
+		if (time_after(jiffies, timeout))
+			break;
+		spin_lock_bh(&ar->data_lock);
+		if (ar->fw_stats.fw_stats_done) {
+			spin_unlock_bh(&ar->data_lock);
+			break;
+		}
+		spin_unlock_bh(&ar->data_lock);
+	}
+	return 0;
 }
 
 static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
@@ -10149,6 +10177,7 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct station_info *sinfo)
 {
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	struct ath12k_fw_stats_req_params params = {};
 	struct ath12k_link_sta *arsta;
 	struct ath12k *ar;
 	s8 signal;
@@ -10191,10 +10220,13 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	/* TODO: Use real NF instead of default one. */
 	signal = arsta->rssi_comb;
 
+	params.pdev_id = ar->pdev->pdev_id;
+	params.vdev_id = 0;
+	params.stats_id = WMI_REQUEST_VDEV_STAT;
+
 	if (!signal &&
 	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-	    !(ath12k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
-				      WMI_REQUEST_VDEV_STAT)))
+	    !(ath12k_mac_get_fw_stats(ar, &params)))
 		signal = arsta->rssi_beacon;
 
 	if (signal) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 1acaf3f68292..a0de0ddf175e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -111,5 +111,6 @@ void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 u16 ath12k_mac_he_convert_tones_to_ru_tones(u16 tones);
 enum nl80211_eht_ru_alloc ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(u16 ru_tones);
 enum nl80211_eht_gi ath12k_mac_eht_gi_to_nl80211_eht_gi(u8 sgi);
+int ath12k_mac_get_fw_stats(struct ath12k *ar, struct ath12k_fw_stats_req_params *param);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 61aa5f509338..fa12aceb140a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -29,6 +29,7 @@ struct ath12k_wmi_svc_ready_parse {
 
 struct wmi_tlv_fw_stats_parse {
 	const struct wmi_stats_event *ev;
+	struct ath12k_fw_stats *stats;
 };
 
 struct ath12k_wmi_dma_ring_caps_parse {
@@ -7195,7 +7196,7 @@ void ath12k_wmi_fw_stats_dump(struct ath12k *ar,
 	else
 		buf[len] = 0;
 
-	ath12k_debugfs_fw_stats_reset(ar);
+	ath12k_fw_stats_reset(ar);
 }
 
 static void
@@ -7314,7 +7315,7 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 					      u16 len)
 {
 	const struct wmi_stats_event *ev = parse->ev;
-	struct ath12k_fw_stats stats = {0};
+	struct ath12k_fw_stats *stats = parse->stats;
 	struct ath12k *ar;
 	struct ath12k_link_vif *arvif;
 	struct ieee80211_sta *sta;
@@ -7323,18 +7324,18 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 	int i, ret = 0;
 	const void *data = ptr;
 
-	INIT_LIST_HEAD(&stats.vdevs);
-	INIT_LIST_HEAD(&stats.bcn);
-	INIT_LIST_HEAD(&stats.pdevs);
-
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch update stats ev");
 		return -EPROTO;
 	}
 
+	if (!stats)
+		return -EINVAL;
+
 	rcu_read_lock();
 
-	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
+	stats->pdev_id = le32_to_cpu(ev->pdev_id);
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, stats->pdev_id);
 	if (!ar) {
 		ath12k_warn(ab, "invalid pdev id %d in update stats event\n",
 			    le32_to_cpu(ev->pdev_id));
@@ -7377,8 +7378,8 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 		if (!dst)
 			continue;
 		ath12k_wmi_pull_vdev_stats(src, dst);
-		stats.stats_id = WMI_REQUEST_VDEV_STAT;
-		list_add_tail(&dst->list, &stats.vdevs);
+		stats->stats_id = WMI_REQUEST_VDEV_STAT;
+		list_add_tail(&dst->list, &stats->vdevs);
 	}
 	for (i = 0; i < le32_to_cpu(ev->num_bcn_stats); i++) {
 		const struct ath12k_wmi_bcn_stats_params *src;
@@ -7396,8 +7397,8 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 		if (!dst)
 			continue;
 		ath12k_wmi_pull_bcn_stats(src, dst);
-		stats.stats_id = WMI_REQUEST_BCN_STAT;
-		list_add_tail(&dst->list, &stats.bcn);
+		stats->stats_id = WMI_REQUEST_BCN_STAT;
+		list_add_tail(&dst->list, &stats->bcn);
 	}
 	for (i = 0; i < le32_to_cpu(ev->num_pdev_stats); i++) {
 		const struct ath12k_wmi_pdev_stats_params *src;
@@ -7409,7 +7410,7 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 			goto exit;
 		}
 
-		stats.stats_id = WMI_REQUEST_PDEV_STAT;
+		stats->stats_id = WMI_REQUEST_PDEV_STAT;
 
 		data += sizeof(*src);
 		len -= sizeof(*src);
@@ -7421,11 +7422,9 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 		ath12k_wmi_pull_pdev_stats_base(&src->base, dst);
 		ath12k_wmi_pull_pdev_stats_tx(&src->tx, dst);
 		ath12k_wmi_pull_pdev_stats_rx(&src->rx, dst);
-		list_add_tail(&dst->list, &stats.pdevs);
+		list_add_tail(&dst->list, &stats->pdevs);
 	}
 
-	complete(&ar->fw_stats_complete);
-	ath12k_debugfs_fw_stats_process(ar, &stats);
 exit:
 	rcu_read_unlock();
 	return ret;
@@ -7451,16 +7450,74 @@ static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
 	return ret;
 }
 
+static int ath12k_wmi_pull_fw_stats(struct ath12k_base *ab, struct sk_buff *skb,
+				    struct ath12k_fw_stats *stats)
+{
+	struct wmi_tlv_fw_stats_parse parse = {};
+
+	stats->stats_id = 0;
+	parse.stats = stats;
+
+	return ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
+				   ath12k_wmi_tlv_fw_stats_parse,
+				   &parse);
+}
+
 static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
+	struct ath12k_fw_stats stats = {};
+	struct ath12k *ar;
 	int ret;
-	struct wmi_tlv_fw_stats_parse parse = {};
 
-	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
-				  ath12k_wmi_tlv_fw_stats_parse,
-				  &parse);
-	if (ret)
-		ath12k_warn(ab, "failed to parse fw stats %d\n", ret);
+	INIT_LIST_HEAD(&stats.pdevs);
+	INIT_LIST_HEAD(&stats.vdevs);
+	INIT_LIST_HEAD(&stats.bcn);
+
+	ret = ath12k_wmi_pull_fw_stats(ab, skb, &stats);
+	if (ret) {
+		ath12k_warn(ab, "failed to pull fw stats: %d\n", ret);
+		goto free;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI, "event update stats");
+
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, stats.pdev_id);
+	if (!ar) {
+		rcu_read_unlock();
+		ath12k_warn(ab, "failed to get ar for pdev_id %d: %d\n",
+			    stats.pdev_id, ret);
+		goto free;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+
+	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
+	 * debugfs fw stats. Therefore, processing it separately.
+	 */
+	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
+		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
+		ar->fw_stats.fw_stats_done = true;
+		goto complete;
+	}
+
+	/* WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT are currently requested only
+	 * via debugfs fw stats. Hence, processing these in debugfs context.
+	 */
+	ath12k_debugfs_fw_stats_process(ar, &stats);
+
+complete:
+	complete(&ar->fw_stats_complete);
+	spin_unlock_bh(&ar->data_lock);
+	rcu_read_unlock();
+
+	/* Since the stats's pdev, vdev and beacon list are spliced and reinitialised
+	 * at this point, no need to free the individual list.
+	 */
+	return;
+
+free:
+	ath12k_fw_stats_free(&stats);
 }
 
 /* PDEV_CTL_FAILSAFE_CHECK_EVENT is received from FW when the frequency scanned
-- 
2.34.1


