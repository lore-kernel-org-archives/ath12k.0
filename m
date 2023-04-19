Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828B5C77B73
	for <ath12k@archiver.kernel.org>; Wed, 19 Apr 2023 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2jRXvxKheJiSVZhuN6L2NubSwKMniq1IaCyIvaas0Xc=; b=PMLp9a+3mp5sRj
	3vQ2sFh6xaAdlPfvF+iSGhuY994C4ZVKwhOrMvGzbivFFvXd8WRdsd1py8sZCs025xZ2nHEYi+wSU
	FAoJuRK/Xx/7JkcYh8yxzh4z1vjRMW2wO83U/Pxyof/tANU8khuieoiSygBFPls/QlJpiWQA5rwfL
	UneHIZpNDvmy5aKQaNqofv/prqSnGDD6982GH09ZaL/eyVyOO0V6XfphEADWFpR6VmuJQErUtPgh7
	Eu7j/AoZtP11vBygJn/PKV4WpX+7OKKXe34WZMKB3vpoZEffUYVOnPmriHWzgL7muZGoaGIiKTLzZ
	9hrVxrbYekNjte++D3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4Zr-004pjA-0R
	for ath12k@archiver.kernel.org;
	Wed, 19 Apr 2023 09:58:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4Zn-004piN-16
	for ath12k@lists.infradead.org;
	Wed, 19 Apr 2023 09:58:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J9VxnU019295;
	Wed, 19 Apr 2023 09:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=LmxlTvl/YV5EaWTKsMDxJgz9/4EIkp3h+2w4XbQFXaE=;
 b=ZY1L2yMNDLrOqGIC1yFe4mOXjnWlCe2FFqAK1HW9shUw5/5c7ifK7uk82f01E4FRt/Lo
 11lIJS8LpHbXg+lW1K3qR3s8piBI9le7u5bhzOw4u7G9c/yDw0I7j2Pyfl1ictEPTiPC
 NOYjPr2AMVYqwwga/MXqwUbwLjfFmq3vVpo+BTsPPil+h36GdaJCJCQgCd4906wbCxo8
 YxFlkmQ1wXrjP4XU6HljFDj6DScFfJjCntBbkco5bo/qL/iJ+wE0ruIrLRx5facCXTct
 h2OW2+c/1hATMpkFKLQzmTk0g9zFITmVpYINJyqei8dQomMe8RKey+1vAFC397jzPEdp rQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q234h98vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 09:58:10 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33J9vfDa016855;
	Wed, 19 Apr 2023 09:57:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3pyn0kf1nj-1;
	Wed, 19 Apr 2023 09:57:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J9vfdJ016849;
	Wed, 19 Apr 2023 09:57:41 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 33J9veXC016847;
	Wed, 19 Apr 2023 09:57:41 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id 29CE21100068; Wed, 19 Apr 2023 15:27:40 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: add wait operation for tx management packets for flush from mac80211
Date: Wed, 19 Apr 2023 15:27:38 +0530
Message-Id: <20230419095738.19859-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BdCdCeGj9UZ1NMIcTiGznxO-O56EaZVE
X-Proofpoint-ORIG-GUID: BdCdCeGj9UZ1NMIcTiGznxO-O56EaZVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_06,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_025811_497004_CF88A32C 
X-CRM114-Status: GOOD (  21.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Karthik M <quic_karm@quicinc.com>

Transmission of management packets are done in a work queue. Sometimes
the workqueue does not finish Tx immediately, then it lead after the next
step of vdev delete finished, it start to send the management packet to
firmware and lead firmware crash.

ieee80211_set_disassoc() have logic of ieee80211_flush_queues() after
it send_deauth_disassoc() to ath12k, its purpose is make sure the
deauth was actually sent, so it need to change ath12k to match the
purpose of mac80211.

To address these issues wait for Tx management as well as Tx data packets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthik M <quic_karm@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
v2:
   - Addressed Kalle's comments
      - Corrected patch format.
---
 drivers/net/wireless/ath/ath12k/core.c |  1 +
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 36 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c  |  8 +++++-
 4 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a89e66653f04..499b81cd938e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -706,6 +706,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		idr_for_each(&ar->txmgmt_idr,
 			     ath12k_mac_tx_mgmt_pending_free, ar);
 		idr_destroy(&ar->txmgmt_idr);
+		wake_up(&ar->txmgmt_empty_waitq);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index dffa687ee40e..509a9d4450b4 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -532,6 +532,7 @@ struct ath12k {
 	/* protects txmgmt_idr data */
 	spinlock_t txmgmt_idr_lock;
 	atomic_t num_pending_mgmt_tx;
+	wait_queue_head_t txmgmt_empty_waitq;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bf7e5b6977b2..0e5cc477ba56 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4316,6 +4316,21 @@ static int __ath12k_set_antenna(struct ath12k *ar, u32 tx_ant, u32 rx_ant)
 	return 0;
 }
 
+static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
+{
+	int num_mgmt;
+
+	ieee80211_free_txskb(ar->hw, skb);
+
+	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
+
+	if (num_mgmt < 0)
+		WARN_ON_ONCE(1);
+
+	if (!num_mgmt)
+		wake_up(&ar->txmgmt_empty_waitq);
+}
+
 int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 {
 	struct sk_buff *msdu = skb;
@@ -4332,7 +4347,7 @@ int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 	info = IEEE80211_SKB_CB(msdu);
 	memset(&info->status, 0, sizeof(info->status));
 
-	ieee80211_free_txskb(ar->hw, msdu);
+	ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 
 	return 0;
 }
@@ -4416,7 +4431,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
 	struct sk_buff *skb;
 
 	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL)
-		ieee80211_free_txskb(ar->hw, skb);
+		ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 }
 
 static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
@@ -4431,7 +4446,7 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		skb_cb = ATH12K_SKB_CB(skb);
 		if (!skb_cb->vif) {
 			ath12k_warn(ar->ab, "no vif found for mgmt frame\n");
-			ieee80211_free_txskb(ar->hw, skb);
+			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 			continue;
 		}
 
@@ -4442,16 +4457,14 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 			if (ret) {
 				ath12k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
 					    arvif->vdev_id, ret);
-				ieee80211_free_txskb(ar->hw, skb);
-			} else {
-				atomic_inc(&ar->num_pending_mgmt_tx);
+				ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 			}
 		} else {
 			ath12k_warn(ar->ab,
 				    "dropping mgmt frame for vdev %d, is_started %d\n",
 				    arvif->vdev_id,
 				    arvif->is_started);
-			ieee80211_free_txskb(ar->hw, skb);
+			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 		}
 	}
 }
@@ -4482,6 +4495,7 @@ static int ath12k_mac_mgmt_tx(struct ath12k *ar, struct sk_buff *skb,
 	}
 
 	skb_queue_tail(q, skb);
+	atomic_inc(&ar->num_pending_mgmt_tx);
 	ieee80211_queue_work(ar->hw, &ar->wmi_mgmt_tx_work);
 
 	return 0;
@@ -5955,6 +5969,13 @@ static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 				       ATH12K_FLUSH_TIMEOUT);
 	if (time_left == 0)
 		ath12k_warn(ar->ab, "failed to flush transmit queue %ld\n", time_left);
+
+	time_left = wait_event_timeout(ar->txmgmt_empty_waitq,
+				       (atomic_read(&ar->num_pending_mgmt_tx) == 0),
+				       ATH12K_FLUSH_TIMEOUT);
+	if (time_left == 0)
+		ath12k_warn(ar->ab, "failed to flush mgmt transmit queue %ld\n",
+			    time_left);
 }
 
 static int
@@ -6932,6 +6953,7 @@ int ath12k_mac_register(struct ath12k_base *ab)
 		if (ret)
 			goto err_cleanup;
 
+		init_waitqueue_head(&ar->txmgmt_empty_waitq);
 		idr_init(&ar->txmgmt_idr);
 		spin_lock_init(&ar->txmgmt_idr_lock);
 	}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 3e6991120e53..1d303b217758 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4637,6 +4637,7 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 	struct ath12k_skb_cb *skb_cb;
+	int num_mgmt;
 
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	msdu = idr_find(&ar->txmgmt_idr, desc_id);
@@ -4660,10 +4661,15 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
 
 	ieee80211_tx_status_irqsafe(ar->hw, msdu);
 
+	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
+
 	/* WARN when we received this event without doing any mgmt tx */
-	if (atomic_dec_if_positive(&ar->num_pending_mgmt_tx) < 0)
+	if (num_mgmt < 0)
 		WARN_ON_ONCE(1);
 
+	if (!num_mgmt)
+		wake_up(&ar->txmgmt_empty_waitq);
+
 	return 0;
 }
 
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
