Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D81C282EC
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CA6mC5bKdwdr/VQMDUxpR1xhhqiM6CdeIBBDzmCjxs=; b=NnEstE45+vddRV98RkYwuzmfjI
	Jqz5YnKKonfTCuG9mtZlW6zSzgO+JrsfScVqBQaLVAU1MeUxb9zP/Zk9AclaAyoYPJ2AAJMusYWxt
	6hh08JdRmGonziRZtw+gCX2m9lnn+giFELRow3rWt0i9vuPcq9UiaT+k0li8mduQGBf2cjb7i44o9
	NarTTqx6c9SyzbSgPqHCJZPYy3tUZTc+u8H6OYeEZb9PcZnQaDfHuiXN0lPi9igTO2bDTOytuYr9T
	ni44B/APtuJiyZ/midJsZ6tZXAJkUn/xxAE7qiSodVpApXFNT0qzdQlRfu75m/O9Mc7xTTjelCWY5
	N7BGCgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9UC-0000000AnLH-2YQo
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 11:33:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8NS-0000000Adii-3Jhv
	for ath12k@bombadil.infradead.org;
	Thu, 06 Mar 2025 10:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3CA6mC5bKdwdr/VQMDUxpR1xhhqiM6CdeIBBDzmCjxs=; b=IfQxRMo+b0SXRf4C1pfx5MG8/W
	ihbc+qpcC5A//9pDfCHae4fiVPD1+wGTXZQrSZ4PCiPVwuRKLuCIh1YrPkjk06qCYZcZ6Wecajlz8
	7Xq5vxeXwLtz2IERbdqGpaL41lO0jDqjWXhCkGBb3tFkJ+aF9SKY8mkT35AriHG1rf7gr8VU2IetP
	zmSs3ueGcFpr530tnDt4795q9ZhXk3Jr28pO1dx9efrhEATKvz10U+5SzNd4vTFK3u/JqRjVEjAkL
	v7jL/EltHVuIGxFlNJ+2zzipEwheVIM5cTiiflcKzsy0CLl3S5tnRIxFXvACH/DfM9q42p09wfkgU
	XTLSJJEQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8NP-0000000114g-33uo
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 10:22:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mBwO005350
	for <ath12k@lists.infradead.org>; Thu, 6 Mar 2025 10:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3CA6mC5bKdw
	dr/VQMDUxpR1xhhqiM6CdeIBBDzmCjxs=; b=Kd4YnXGHq1Lq/vn9T40r21HSMbW
	0uFQ7a1jbAAmAcbBI6kWMXoY/7Ne4KiGnR3rL7it0LCJWCC184nNZik5h153YSg+
	+rN2OljiZ3VYSYsARTY3sNB/y2+uM4p8dHswxMKbvfmrhRv85Ul3ja0Pn1WTJ8N9
	uVFApF6eIqiRE4Rnc2HVme4A047estboETvp77fI/5SPX6a5PaWV2k+bckYAodIW
	Jwa+qOpK6fm0qojGA2NnN7ElzPULYpV4gEmbaXoey7AnYt+Ycka1v2BhENOfqK8g
	5foT3dhseNnjBcYqBavCA5Vkm4KtI6KCXVUMiq0pq5Xgn+gh4pekLE/df0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx8ejd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 10:22:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a7aceeaso9997505ad.0
        for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 02:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256551; x=1741861351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CA6mC5bKdwdr/VQMDUxpR1xhhqiM6CdeIBBDzmCjxs=;
        b=ST3e5JogtelO8Go6NmoDtIJcHeo3UZ4TdXAdj7i0pVcME4I0HkqOMPzOqOqcnK0oxY
         9w+UtSr3gIHZNhlSbw8aIkdLNXqtz4pQJ2aHK+Z7RcZ17gxa7f5P2lwIzANktez6FIWF
         8NqqPJyz1ttMLCKScobwsUvKQBGSY27KD3wIYYPYKi72McmpgRBRVzCrCBRXvwcgN615
         eJ0g++J8mXxvXJy+HJCD13KGKNbNlTHTJOWTh0hBo8rs9+EMbVlt3+nqxBPYcmoLpkHC
         5M9AXJ61fnK/MLPoelHBIolOHtI9t6M2AS408xBME+YZFicdX13OCePsFiXFf4ejEs9q
         Zo9g==
X-Gm-Message-State: AOJu0Yx7+uUTB+GlJQyB2XFQQfXyWOhmT00XJsHc//Twe6wedyTYWX9y
	kxvGjkwSsfgWxAWodA8tlPorWRUkBKj6sqGzlNSU/wkXZUu+m3TTFYcgrNzYqp7KhX0JxaD+UJ7
	M55K6+/dS9CPJCKm6/V6whPdaq8gOyULmgJmQq36WmHLxmmhKGkaQQtAtvo1b13SMNMKq
X-Gm-Gg: ASbGnctg3RZhfTk8gqJp//C5xLWMP2U3+Cc3mu0GUmV3wpDjG/RkTIr3IGT33W3rDP4
	dboQDkA43c83/RjIvrFkh586ulh52SXWx7jEhAud8nphXVgTyBPgR98CKAxaGJIF5T41/XtDYvc
	KWs8JVpIERmWWXGd0/sWPO+eeOBwdTED461TjY5EJ2nBmUbxRdp0bngdRi6b4nh07F1+nWB+BaM
	T3YltQx1WPJcWVuovF5BnxsX5aGtTtuE4BUNv3/PVE4lMKBqydxP/HPqMhLjgt+C2xtUtK4Ws6W
	r2oB/9kCrnySANZ28xikoLSQ679raaz/wyCE6BXqZp7O0xi9zkT3yfJ6SWEa3MY8P1Arz/GgUEU
	mz/BXQ6aIqYRiU3fGJLOVpIiWeZDjRn+3yVOsVMyffien
X-Received: by 2002:a17:902:cec7:b0:21f:3e2d:7d42 with SMTP id d9443c01a7336-223f1c98c24mr100309855ad.23.1741256551022;
        Thu, 06 Mar 2025 02:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw2yX5IcwO7w2N5FAklVwB7UTNW+1NpsnkdXYzFXG236c4OGuy4LgYFReF2nhfK/gJk86tHQ==
X-Received: by 2002:a17:902:cec7:b0:21f:3e2d:7d42 with SMTP id d9443c01a7336-223f1c98c24mr100309395ad.23.1741256550406;
        Thu, 06 Mar 2025 02:22:30 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfa6sm8814785ad.33.2025.03.06.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:22:30 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>
Subject: [PATCH ath-next v3 1/2] wifi: ath12k: move firmware stats out of debugfs
Date: Thu,  6 Mar 2025 15:52:14 +0530
Message-Id: <20250306102215.1300522-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ALap_Pxi53slIkr2z-qHYp9p3CP8LcVl
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c9777a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=xiekz6xF0MoIKGnkd0EA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ALap_Pxi53slIkr2z-qHYp9p3CP8LcVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_102252_098202_ECDEAA99 
X-CRM114-Status: GOOD (  21.94  )
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
Reviewed-by: Mahendran P <quic_mahep@quicinc.com>
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
index 0b2dec081c6e..301dea381841 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1084,6 +1084,59 @@ bool ath12k_core_hw_group_start_ready(struct ath12k_hw_group *ag)
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
index 3fac4f00d383..d07b55a4dd4a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1215,6 +1215,10 @@ u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab);
 u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab);
 
 void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag);
+void ath12k_fw_stats_init(struct ath12k *ar);
+void ath12k_fw_stats_bcn_free(struct list_head *head);
+void ath12k_fw_stats_free(struct ath12k_fw_stats *stats);
+void ath12k_fw_stats_reset(struct ath12k *ar);
 
 static inline const char *ath12k_scan_state_str(enum ath12k_scan_state state)
 {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 57002215ddf1..44322db70c85 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -870,102 +870,6 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
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
@@ -1022,10 +926,6 @@ ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 			num_bcn = 0;
 		}
 	}
-	if (stats->stats_id == WMI_REQUEST_PDEV_STAT) {
-		list_splice_tail_init(&stats->pdevs, &ar->fw_stats.pdevs);
-		ar->fw_stats.fw_stats_done = true;
-	}
 }
 
 static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
@@ -1052,7 +952,7 @@ static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
 	param.vdev_id = 0;
 	param.stats_id = WMI_REQUEST_VDEV_STAT;
 
-	ret = ath12k_debugfs_fw_stats_request(ar, &param);
+	ret = ath12k_mac_get_fw_stats(ar, &param);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to request fw vdev stats: %d\n", ret);
 		return ret;
@@ -1117,7 +1017,7 @@ static int ath12k_open_bcn_stats(struct inode *inode, struct file *file)
 			continue;
 
 		param.vdev_id = arvif->vdev_id;
-		ret = ath12k_debugfs_fw_stats_request(ar, &param);
+		ret = ath12k_mac_get_fw_stats(ar, &param);
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to request fw bcn stats: %d\n", ret);
 			return ret;
@@ -1184,7 +1084,7 @@ static int ath12k_open_pdev_stats(struct inode *inode, struct file *file)
 	param.vdev_id = 0;
 	param.stats_id = WMI_REQUEST_PDEV_STAT;
 
-	ret = ath12k_debugfs_fw_stats_request(ar, &param);
+	ret = ath12k_mac_get_fw_stats(ar, &param);
 	if (ret) {
 		ath12k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
 		return ret;
@@ -1239,11 +1139,7 @@ void ath12k_debugfs_fw_stats_register(struct ath12k *ar)
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
index d7041297d5d8..4cbcfbb7fa07 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs.h
@@ -14,7 +14,6 @@ void ath12k_debugfs_register(struct ath12k *ar);
 void ath12k_debugfs_unregister(struct ath12k *ar);
 void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 				     struct ath12k_fw_stats *stats);
-void ath12k_debugfs_fw_stats_reset(struct ath12k *ar);
 
 static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
 {
@@ -129,10 +128,6 @@ static inline void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 {
 }
 
-static inline void ath12k_debugfs_fw_stats_reset(struct ath12k *ar)
-{
-}
-
 static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
 {
 	return false;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfa05f0ee6c9..edd440ced9d8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10267,12 +10267,12 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
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
@@ -10280,9 +10280,18 @@ static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
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
@@ -10291,14 +10300,33 @@ static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
 
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
@@ -10307,6 +10335,7 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct station_info *sinfo)
 {
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	struct ath12k_fw_stats_req_params params = {};
 	struct ath12k_link_sta *arsta;
 	struct ath12k *ar;
 	s8 signal;
@@ -10348,10 +10377,13 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
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
index ae35b73312bf..5e88b511ff8a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -115,4 +115,5 @@ struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *
 struct ath12k *ath12k_get_ar_by_vif(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    u8 link_id);
+int ath12k_mac_get_fw_stats(struct ath12k *ar, struct ath12k_fw_stats_req_params *param);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 6d1ea5f3a791..148e943fd6c2 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -29,6 +29,7 @@ struct ath12k_wmi_svc_ready_parse {
 
 struct wmi_tlv_fw_stats_parse {
 	const struct wmi_stats_event *ev;
+	struct ath12k_fw_stats *stats;
 };
 
 struct ath12k_wmi_dma_ring_caps_parse {
@@ -7216,7 +7217,7 @@ void ath12k_wmi_fw_stats_dump(struct ath12k *ar,
 	else
 		buf[len] = 0;
 
-	ath12k_debugfs_fw_stats_reset(ar);
+	ath12k_fw_stats_reset(ar);
 }
 
 static void
@@ -7335,7 +7336,7 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 					      u16 len)
 {
 	const struct wmi_stats_event *ev = parse->ev;
-	struct ath12k_fw_stats stats = {0};
+	struct ath12k_fw_stats *stats = parse->stats;
 	struct ath12k *ar;
 	struct ath12k_link_vif *arvif;
 	struct ieee80211_sta *sta;
@@ -7344,18 +7345,18 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
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
@@ -7398,8 +7399,8 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
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
@@ -7417,8 +7418,8 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
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
@@ -7430,7 +7431,7 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 			goto exit;
 		}
 
-		stats.stats_id = WMI_REQUEST_PDEV_STAT;
+		stats->stats_id = WMI_REQUEST_PDEV_STAT;
 
 		data += sizeof(*src);
 		len -= sizeof(*src);
@@ -7442,11 +7443,9 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
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
@@ -7472,16 +7471,74 @@ static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
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


