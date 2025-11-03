Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C169BCCFA08
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i35T6RZTO4M+TIYQXHuT63BbFFGDcKWBWkPPczYMrUc=; b=HfWlThL7MxY1gCxPETCWlkSOLv
	x32HiT00CiYfuecztGGNspvvXgzT1ZyrIt/b/BEBGlIh6K/5XT3iUew1xRwUWug3n7pU2Hw+rLuA8
	qW7qoAXVaEMtRWnR2JXn87xtUKSQKdXc00ibw0n/c6wm3VYdkgdagOLFnDCjydvqHFhoW8zMabRPi
	aoH+VMrMzCYf6qjglY5OJy+9lOLz5CbMdVmbl5wIvi/42+5HGzPVZE4quK6PWDjTkKjn3z9rfPgUY
	an1PALkomnX6EXNibouRn4LfSGMRjUYFkOQ8bQwQzfi5662g/OVo/Lgv+U+iHI1qBK80n8Km33QhC
	4F0bI/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsdD-00000009igx-2Cqq;
	Mon, 03 Nov 2025 11:21:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsdB-00000009ieZ-1UxQ
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 11:21:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3Al7wT1941385;
	Mon, 3 Nov 2025 11:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i35T6RZTO4M+TIYQXHuT63BbFFGDcKWBWkPPczYMrUc=; b=nto3qIOXNL97T8TX
	eH35/ppVK1jhllxcutLnY9SoLowlyPX0+mYRae7yWTzHCXw7OWWDAb4/Y3CeyXPf
	rivlJbLCXoYQWJtpWsg48Hnzm4Uv3dvFLh0r/XC/jDTMnaZa91jDaUQ3WJp09+Ka
	J616R3rN9l4snTUIRciEPupKOJAlQIqUkg6YyxPSa9hkZecasR84YHLz6WF733To
	CXdUxvufPwWKU1XkG6ydGsBEwD8VBvsCdU8UGTGp0lTKcpzJxn5sGXUXqhtL/lY/
	N/xHOF5JoOXKx0qAcvUF6eSkA9KFBxKi6esfihzy33j3qx9VA7B/lg9DTjl0JK0p
	WPKjqQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w99ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 11:21:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A3BLlPg017926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Nov 2025 11:21:47 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 3 Nov 2025 03:21:45 -0800
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 07/12] wifi: ath12k: Move ath12k_dp_rx_frags_cleanup API to Wi-Fi 7
Date: Mon, 3 Nov 2025 16:51:06 +0530
Message-ID: <20251103112111.2260639-8-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=6908904c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=5cgLRFdtdzdyvJiItWkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: q8a4EopY5xne_BHaDLEsq7nuXufRFWm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNCBTYWx0ZWRfX5EoBkbmsbxNi
 QIgdRpovlvPPJVQTufoQneXlx35vsIa8Iz5/NFmZDuw1xkwOTt2mmXOf5WT0BqgqpAkjbyoTuZM
 //1Z86CxRuxn05yXlVdFMNhTewr0s2wJdKZBSViqA4gcahvCEagt4YyM9oojNenNII04RCi7S8Z
 JbxmktEPbLFXOSPYS8BQCd5697SYDRD8kto+bQ0K8tnk+zIJwRIUzATKzC89oMhDJpg00wdulp1
 33g5nFXadTKg/5DwrRw32kB4ZkX2veqBneiIVzLZKf7bxeHKil3aAaRjGKEoltFlLCpTJxmINbj
 Euv+w0yyi0JR0FnMDS0n2NMdhOFJBSPCVeAdlXFjzkBN4PFSzl/2cTv4RI0ZJkyVXwVYuuvynYk
 L4QMbUG6W8VvRq9HCxnFAXi7lGsgqA==
X-Proofpoint-ORIG-GUID: q8a4EopY5xne_BHaDLEsq7nuXufRFWm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032149_517335_68A95922 
X-CRM114-Status: GOOD (  17.10  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

The API ath12k_dp_rx_frags_cleanup uses rx hw structure that is specific to
Wi-Fi 7. Hence move the API to Wi-Fi 7 and use ops infra to reach it from the
common code.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h          | 10 +++++++
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 28 ++---------------
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  2 --
 drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 30 +++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  2 ++
 6 files changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 17c919213c6a..74801055e2f0 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -408,6 +408,8 @@ struct ath12k_dp_arch_ops {
 	int (*rx_link_desc_return)(struct ath12k_base *ab,
 				   struct ath12k_buffer_addr *buf_addr_info,
 				   enum hal_wbm_rel_bm_act action);
+	void (*rx_frags_cleanup)(struct ath12k_dp_rx_tid *rx_tid,
+				 bool rel_link_desc);
 	int (*peer_rx_tid_reo_update)(struct ath12k_dp *dp,
 				      struct ath12k_dp_link_peer *peer,
 				      struct ath12k_dp_rx_tid *rx_tid,
@@ -588,6 +590,14 @@ int ath12k_dp_arch_rx_link_desc_return(struct ath12k_dp *dp,
 	return dp->ops->rx_link_desc_return(dp->ab, buf_addr_info, action);
 }
 
+static inline
+void ath12k_dp_arch_rx_frags_cleanup(struct ath12k_dp *dp,
+				     struct ath12k_dp_rx_tid *rx_tid,
+				     bool rel_link_desc)
+{
+	dp->ops->rx_frags_cleanup(rx_tid, rel_link_desc);
+}
+
 static inline int ath12k_dp_arch_peer_rx_tid_reo_update(struct ath12k_dp *dp,
 							struct ath12k_dp_link_peer *peer,
 							struct ath12k_dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 01faa76f8e06..f76d13299258 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -445,30 +445,6 @@ void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 	rx_tid->qbuf.vaddr = NULL;
 }
 
-void ath12k_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
-				bool rel_link_desc)
-{
-	enum hal_wbm_rel_bm_act act = HAL_WBM_REL_BM_ACT_PUT_IN_IDLE;
-	struct ath12k_buffer_addr *buf_addr_info;
-	struct ath12k_dp *dp = rx_tid->dp;
-
-	lockdep_assert_held(&dp->dp_lock);
-
-	if (rx_tid->dst_ring_desc) {
-		if (rel_link_desc) {
-			buf_addr_info = &rx_tid->dst_ring_desc->buf_addr_info;
-			ath12k_dp_arch_rx_link_desc_return(dp, buf_addr_info, act);
-		}
-		kfree(rx_tid->dst_ring_desc);
-		rx_tid->dst_ring_desc = NULL;
-	}
-
-	rx_tid->cur_sn = 0;
-	rx_tid->last_frag_no = 0;
-	rx_tid->rx_frag_bitmap = 0;
-	__skb_queue_purge(&rx_tid->rx_frags);
-}
-
 void ath12k_dp_rx_peer_tid_cleanup(struct ath12k *ar, struct ath12k_dp_link_peer *peer)
 {
 	struct ath12k_dp_rx_tid *rx_tid;
@@ -485,7 +461,7 @@ void ath12k_dp_rx_peer_tid_cleanup(struct ath12k *ar, struct ath12k_dp_link_peer
 		rx_tid = &peer->dp_peer->rx_tid[i];
 
 		ath12k_dp_arch_rx_peer_tid_delete(dp, peer, i);
-		ath12k_dp_rx_frags_cleanup(rx_tid, true);
+		ath12k_dp_arch_rx_frags_cleanup(dp, rx_tid, true);
 
 		spin_unlock_bh(&dp->dp_lock);
 		timer_delete_sync(&rx_tid->frag_timer);
@@ -1327,7 +1303,7 @@ static void ath12k_dp_rx_frag_timer(struct timer_list *timer)
 		spin_unlock_bh(&rx_tid->dp->dp_lock);
 		return;
 	}
-	ath12k_dp_rx_frags_cleanup(rx_tid, true);
+	ath12k_dp_arch_rx_frags_cleanup(rx_tid->dp, rx_tid, true);
 	spin_unlock_bh(&rx_tid->dp->dp_lock);
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 3c0d66855999..0dffb59c13b8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -183,8 +183,6 @@ void ath12k_dp_rx_h_sort_frags(struct ath12k_base *ab,
 			       struct sk_buff *cur_frag);
 void ath12k_dp_rx_h_undecap_frag(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
 				 enum hal_encrypt_type enctype, u32 flags);
-void ath12k_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
-				bool rel_link_desc);
 int ath12k_dp_rx_h_michael_mic(struct crypto_shash *tfm, u8 *key,
 			       struct ieee80211_hdr *hdr, u8 *data,
 			       size_t data_len, u8 *mic);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
index 1fd7738a39b5..b57e8de05c27 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -144,6 +144,7 @@ static struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
 	.rx_peer_tid_delete = ath12k_wifi7_dp_rx_peer_tid_delete,
 	.reo_cache_flush = ath12k_wifi7_dp_reo_cache_flush,
 	.rx_link_desc_return = ath12k_wifi7_dp_rx_link_desc_return,
+	.rx_frags_cleanup = ath12k_wifi7_dp_rx_frags_cleanup,
 	.peer_rx_tid_reo_update = ath12k_wifi7_peer_rx_tid_reo_update,
 	.rx_assign_reoq = ath12k_wifi7_dp_rx_assign_reoq,
 	.peer_rx_tid_qref_setup = ath12k_wifi7_peer_rx_tid_qref_setup,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 0cf8a8f7b5f6..13cd23d7c7da 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1100,6 +1100,30 @@ static int ath12k_wifi7_dp_rx_h_defrag(struct ath12k_pdev_dp *dp_pdev,
 	return 0;
 }
 
+void ath12k_wifi7_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
+				      bool rel_link_desc)
+{
+	enum hal_wbm_rel_bm_act act = HAL_WBM_REL_BM_ACT_PUT_IN_IDLE;
+	struct ath12k_buffer_addr *buf_addr_info;
+	struct ath12k_dp *dp = rx_tid->dp;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (rx_tid->dst_ring_desc) {
+		if (rel_link_desc) {
+			buf_addr_info = &rx_tid->dst_ring_desc->buf_addr_info;
+			ath12k_wifi7_dp_rx_link_desc_return(dp->ab, buf_addr_info, act);
+		}
+		kfree(rx_tid->dst_ring_desc);
+		rx_tid->dst_ring_desc = NULL;
+	}
+
+	rx_tid->cur_sn = 0;
+	rx_tid->last_frag_no = 0;
+	rx_tid->rx_frag_bitmap = 0;
+	__skb_queue_purge(&rx_tid->rx_frags);
+}
+
 static int ath12k_wifi7_dp_rx_frag_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 					  struct sk_buff *msdu,
 					  struct hal_reo_dest_ring *ring_desc,
@@ -1154,7 +1178,7 @@ static int ath12k_wifi7_dp_rx_frag_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	if ((!skb_queue_empty(&rx_tid->rx_frags) && seqno != rx_tid->cur_sn) ||
 	    skb_queue_empty(&rx_tid->rx_frags)) {
 		/* Flush stored fragments and start a new sequence */
-		ath12k_dp_rx_frags_cleanup(rx_tid, true);
+		ath12k_wifi7_dp_rx_frags_cleanup(rx_tid, true);
 		rx_tid->cur_sn = seqno;
 	}
 
@@ -1214,12 +1238,12 @@ static int ath12k_wifi7_dp_rx_frag_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	if (ath12k_wifi7_dp_rx_h_defrag_reo_reinject(dp, rx_tid, defrag_skb))
 		goto err_frags_cleanup;
 
-	ath12k_dp_rx_frags_cleanup(rx_tid, false);
+	ath12k_wifi7_dp_rx_frags_cleanup(rx_tid, false);
 	goto out_unlock;
 
 err_frags_cleanup:
 	dev_kfree_skb_any(defrag_skb);
-	ath12k_dp_rx_frags_cleanup(rx_tid, true);
+	ath12k_wifi7_dp_rx_frags_cleanup(rx_tid, true);
 out_unlock:
 	spin_unlock_bh(&dp->dp_lock);
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index cb72b75526d4..85677258b1df 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -31,6 +31,8 @@ int ath12k_wifi7_dp_rx_assign_reoq(struct ath12k_base *ab, struct ath12k_dp_peer
 int ath12k_wifi7_dp_rx_link_desc_return(struct ath12k_base *ab,
 					struct ath12k_buffer_addr *buf_addr_info,
 					enum hal_wbm_rel_bm_act action);
+void ath12k_wifi7_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
+				      bool rel_link_desc);
 void ath12k_wifi7_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id, u16 tid,
 					 dma_addr_t paddr);
 void ath12k_wifi7_dp_rx_peer_tid_delete(struct ath12k_base *ab,
-- 
2.34.1


