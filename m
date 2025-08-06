Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BEEC87FD1
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOMsl6jT7rkoyahXCKAukm9qtoPnbV3yJfbpBKFhuSg=; b=lzpC2iwgikL+CaLWQQeewOIA3D
	8zeyPkQUsvxIm8tJqO3iSiltEdnH0rURsOULUIh+BXugfr74gYIqmI+2TSPVRZ1L0e8c3ePQcU34Q
	9Mfnzosk7pP84VFJFKHG+hFURpjo0RqKzSiobP8r7y2BfQ2NAZ3p+PDTbrgcCBz0x/Gl3iqfDllue
	cT+rE22azoVfIrxtV2RQgb63M2pApOmqgeYAHwq2nwRuQNfni28cHvh0N2OFdpNeyTdJUSQQmY/HZ
	vah6nB0bH66s5BdoM+tZnRgg7qCNjU/VtuyYitjtxNUO8Ru/5E15j473Uuja8jd53u6bVxzLELDxn
	hVTgYwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9r-0000000Ezkj-1J4R;
	Wed, 06 Aug 2025 11:18:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9p-0000000Ezix-0y25
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AN4xs018164
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOMsl6jT7rkoyahXCKAukm9qtoPnbV3yJfbpBKFhuSg=; b=NSgNX3TcujLhl+Sj
	dVZhrtKspO2SanSARNV+8u0ZnoOykYhCN6C87ILvE8vL0Q4Aklm8jMC3eUzkT3j+
	jmytBiQKF3dufhDgqB3F/E2+3Gw2kbDrnDyNLDZ9Yom/0elCGubNoISEBwE8vZFC
	pVIKzzUFkglZvt9FumdZRh8f/pTaPg6NDj1gKZ+FLFo+exxyUWd5z1Ozlxvxy781
	ixGs9QFb1yS5977GowLWyTzRV3Rzb17I5H3yl74k+/yUjy1gD9epy6/+67p2cOOX
	0vEtodBYjBDuFoyO1qwpI6wf6d0OxKT3BRgyOqvqOJ/IVrNy46aTbQ9yanXQvGGU
	rGBngA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586840x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f71e509d6so9210896a12.0
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479087; x=1755083887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOMsl6jT7rkoyahXCKAukm9qtoPnbV3yJfbpBKFhuSg=;
        b=VzbD6Sy+HVQq01Vg4qQYlqLOPSvZPQU9XWUaKZs8uD0RpKKCm4LZaNaLgZ8n7tGqsB
         USfi6ek0+LHO1K6f219xSsGOFU9tLUQg9TalgXkZnDmvp5oUV/sIxVELJCoSxqxX7cpR
         SpgHHYyM7uiXKfnYqzt8C1AOXx1MsKMGEceYFjKoD6Tp/H+CWQ/UVB/an9QcWt4HcHSG
         MTk5vK+2ytgJ+/7i3LINOhcFPxCTY2yb97FyrNYrD3q67qsvyQdJsNTlnmgITCoWcCAz
         ZEy9ZzG1SIF4/Fh06hmTtPssV+Ovhvq8lnPyrZH8Kz32DvOp7keMzGuFkWBJFfL1g2Ey
         Jn9A==
X-Gm-Message-State: AOJu0YzH13lNauQ1qfEF+T43w7yL/N5zQMwmuBJiMZk8ra0JF+yv+iBO
	RYHXubWFJURnmF1NYXQnVtDvuab2Y6D8y+oc9b4vkWgSCDTJipcd6WLWeQhLuTl/wBr4Jyf6WHe
	M05Ae6Gm01+nQ+QtmxA5gvNwK+0Pv/on7YxzCJ6DauBbK5wjUW1Q/UhmBOoTNadyOR0XXxwPM
X-Gm-Gg: ASbGncudd9XvryGr9gtb7fhMDtGIjReGKOz9mIlRx676YIInYjdIBaOa7X72N+A3yEU
	kGy9z9zTzOTk0nJLRkMqALayNzHeFdpbZu/AbmHbcQ4S16MV5KZQsjRP1g97EiIToB64Rknmvjk
	BmZp3xsc2nBkpeKSX8ie4d72oi0pcSEawKvC7vXaeeci9uomQY9mCGbCKS4fri8USAht1H0g6aq
	hyGoWv5ozJYgToaQPUmc0G4MuEdUeI2e+DiHQh6koEeB1tnNo8ETDvb7cMx+G54P3dwHh53vXCN
	ebbANrGcuAqb+Nh2C1z80RPwyCQ4dAzAOPCKWmov/DDM/+uJLm0tzBvpHWdJynDtS87+reE4MYb
	llTcchyzC9uzLVaDtWM6TcrCOSajoAPwJInB1uRrtEgiM+iB+XMoQnYGwPgAu/kOKZCDzE6wcSA
	==
X-Received: by 2002:a05:6a21:32a1:b0:232:7628:9968 with SMTP id adf61e73a8af0-24031203937mr3742401637.1.1754479086589;
        Wed, 06 Aug 2025 04:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcK9ZWhZjDTWiOKh8SKRjgnlUUexbYnkmCB4iulX6pKzscfNhEIDLK5/0FLu3hHeAlth8Zdw==
X-Received: by 2002:a05:6a21:32a1:b0:232:7628:9968 with SMTP id adf61e73a8af0-24031203937mr3742358637.1.1754479086046;
        Wed, 06 Aug 2025 04:18:06 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:18:05 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 5/7] wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures
Date: Wed,  6 Aug 2025 16:47:48 +0530
Message-Id: <20250806111750.3214584-6-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yYlkQbMsGwNlx7mcmnA9JD4KTZCp9ckC
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=689339f0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hy-VHpZSMFNzY5TzzOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yYlkQbMsGwNlx7mcmnA9JD4KTZCp9ckC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX8jq+uPCo8noj
 wysCoN6eomuCdLiyeeQVnHt/PJ6XbGYePwofMUw2BYLWJQGPKVSCqxdW/T32KJKnkMW417yAFTM
 6SgOXASlplD0O/JxWyYejHOHY3fg1J/fWTUMOpUj/1/TSgYkDjNmfnrV2uTJiMWCUN7y+oRFjKd
 pDzO+JbMsZ7ZO7czWjUNYc9R28P5gVszWm3xLB2ER9E3ZPJ2d0H9ZF6GK6EQ8Spbz+V2Z7mZlPR
 ZBszSOepDG+2/sfSe6LnX9eQjJYoMW17zZU86A2TvzEwtulyC2C32ZFIWmwXVcVvMkZR9DAZvJL
 LJKJ2cWQ8wBTR8QJZENtlYawGOwquVyFBbBV8CmVeLg8iHOEafK5y8wnz7uODj0Z+7fReehEMDR
 fgf4eeLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041809_394972_FD9792C8 
X-CRM114-Status: GOOD (  26.40  )
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

From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>

During stress test scenarios, when the REO command ring becomes full,
the RX queue update command issued during peer deletion fails due to
insufficient space. In response, the host performs a dma_unmap and
frees the associated memory. However, the hardware still retains a
reference to the same memory address. If the kernel later reallocates
this address, unaware that the hardware is still using it, it can
lead to memory corruption-since the host might access or modify
memory that is still actively referenced by the hardware.

Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
command during TID deletion to prevent memory corruption. Introduce
a new list, reo_cmd_update_rx_queue_list, in the struct ath12k_dp to
track pending RX queue updates. Protect this list with
reo_rxq_flush_lock, which also ensures synchronized access to
reo_cmd_cache_flush_list. Defer memory release until hardware
confirms the virtual address is no longer in use, avoiding immediate
deallocation on command failure. Release memory for pending RX queue
updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
if hardware confirmation is not received.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Co-developed-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    |   2 +
 drivers/net/wireless/ath/ath12k/dp.h    |  10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 190 +++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/dp_rx.h |   8 +
 4 files changed, 150 insertions(+), 60 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index f893fce6d9bd..4a54b8c35311 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1745,7 +1745,9 @@ int ath12k_dp_alloc(struct ath12k_base *ab)
 
 	INIT_LIST_HEAD(&dp->reo_cmd_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
+	INIT_LIST_HEAD(&dp->reo_cmd_update_rx_queue_list);
 	spin_lock_init(&dp->reo_cmd_lock);
+	spin_lock_init(&dp->reo_rxq_flush_lock);
 
 	dp->reo_cmd_cache_flush_count = 0;
 	dp->idle_link_rbm = ath12k_dp_get_idle_link_rbm(ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 10093b451588..4ffec6ad7d8d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -389,15 +389,19 @@ struct ath12k_dp {
 	struct dp_srng reo_dst_ring[DP_REO_DST_RING_MAX];
 	struct dp_tx_ring tx_ring[DP_TCL_NUM_RING_MAX];
 	struct hal_wbm_idle_scatter_list scatter_list[DP_IDLE_SCATTER_BUFS_MAX];
-	struct list_head reo_cmd_list;
+	struct list_head reo_cmd_update_rx_queue_list;
 	struct list_head reo_cmd_cache_flush_list;
 	u32 reo_cmd_cache_flush_count;
-
 	/* protects access to below fields,
-	 * - reo_cmd_list
+	 * - reo_cmd_update_rx_queue_list
 	 * - reo_cmd_cache_flush_list
 	 * - reo_cmd_cache_flush_count
 	 */
+	spinlock_t reo_rxq_flush_lock;
+	struct list_head reo_cmd_list;
+	/* protects access to below fields,
+	 * - reo_cmd_list
+	 */
 	spinlock_t reo_cmd_lock;
 	struct ath12k_hp_update_timer reo_cmd_timer;
 	struct ath12k_hp_update_timer tx_ring_timer[DP_TCL_NUM_RING_MAX];
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index fbebc79024cf..9a62ef52cd6d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -608,14 +608,15 @@ void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	struct ath12k_dp_rx_reo_cmd *cmd, *tmp;
 	struct ath12k_dp_rx_reo_cache_flush_elem *cmd_cache, *tmp_cache;
+	struct dp_reo_update_rx_queue_elem *cmd_queue, *tmp_queue;
 
-	spin_lock_bh(&dp->reo_cmd_lock);
-	list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
-		list_del(&cmd->list);
-		ath12k_dp_rx_tid_cleanup(ab, &cmd->data.qbuf);
-		kfree(cmd);
+	spin_lock_bh(&dp->reo_rxq_flush_lock);
+	list_for_each_entry_safe(cmd_queue, tmp_queue, &dp->reo_cmd_update_rx_queue_list,
+				 list) {
+		list_del(&cmd_queue->list);
+		ath12k_dp_rx_tid_cleanup(ab, &cmd_queue->rx_tid.qbuf);
+		kfree(cmd_queue);
 	}
-
 	list_for_each_entry_safe(cmd_cache, tmp_cache,
 				 &dp->reo_cmd_cache_flush_list, list) {
 		list_del(&cmd_cache->list);
@@ -623,6 +624,14 @@ void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab)
 		ath12k_dp_rx_tid_cleanup(ab, &cmd_cache->data.qbuf);
 		kfree(cmd_cache);
 	}
+	spin_unlock_bh(&dp->reo_rxq_flush_lock);
+
+	spin_lock_bh(&dp->reo_cmd_lock);
+	list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
+		list_del(&cmd->list);
+		ath12k_dp_rx_tid_cleanup(ab, &cmd->data.qbuf);
+		kfree(cmd);
+	}
 	spin_unlock_bh(&dp->reo_cmd_lock);
 }
 
@@ -724,6 +733,61 @@ static void ath12k_dp_reo_cache_flush(struct ath12k_base *ab,
 	}
 }
 
+static void ath12k_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id, u16 tid)
+{
+	struct ath12k_reo_queue_ref *qref;
+	struct ath12k_dp *dp = &ab->dp;
+	bool ml_peer = false;
+
+	if (!ab->hw_params->reoq_lut_support)
+		return;
+
+	if (peer_id & ATH12K_PEER_ML_ID_VALID) {
+		peer_id &= ~ATH12K_PEER_ML_ID_VALID;
+		ml_peer = true;
+	}
+
+	if (ml_peer)
+		qref = (struct ath12k_reo_queue_ref *)dp->ml_reoq_lut.vaddr +
+				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
+	else
+		qref = (struct ath12k_reo_queue_ref *)dp->reoq_lut.vaddr +
+				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
+
+	qref->info0 = u32_encode_bits(0, BUFFER_ADDR_INFO0_ADDR);
+	qref->info1 = u32_encode_bits(0, BUFFER_ADDR_INFO1_ADDR) |
+		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+}
+
+static void ath12k_dp_rx_process_reo_cmd_update_rx_queue_list(struct ath12k_dp *dp)
+{
+	struct ath12k_base *ab = dp->ab;
+	struct dp_reo_update_rx_queue_elem *elem, *tmp;
+
+	spin_lock_bh(&dp->reo_rxq_flush_lock);
+
+	list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_update_rx_queue_list, list) {
+		if (elem->rx_tid.active)
+			continue;
+
+		if (ath12k_dp_rx_tid_delete_handler(ab, &elem->rx_tid))
+			break;
+
+		ath12k_peer_rx_tid_qref_reset(ab,
+					      elem->is_ml_peer ? elem->ml_peer_id :
+					      elem->peer_id,
+					      elem->rx_tid.tid);
+
+		if (ab->hw_params->reoq_lut_support)
+			ath12k_hal_reo_shared_qaddr_cache_clear(ab);
+
+		list_del(&elem->list);
+		kfree(elem);
+	}
+
+	spin_unlock_bh(&dp->reo_rxq_flush_lock);
+}
+
 static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 				      enum hal_reo_cmd_status status)
 {
@@ -740,6 +804,13 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 		return;
 	}
 
+	/* Retry the HAL_REO_CMD_UPDATE_RX_QUEUE command for entries
+	 * in the pending queue list marked TID as inactive
+	 */
+	spin_lock_bh(&dp->ab->base_lock);
+	ath12k_dp_rx_process_reo_cmd_update_rx_queue_list(dp);
+	spin_unlock_bh(&dp->ab->base_lock);
+
 	elem = kzalloc(sizeof(*elem), GFP_ATOMIC);
 	if (!elem)
 		goto free_desc;
@@ -747,7 +818,7 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 	elem->ts = jiffies;
 	memcpy(&elem->data, rx_tid, sizeof(*rx_tid));
 
-	spin_lock_bh(&dp->reo_cmd_lock);
+	spin_lock_bh(&dp->reo_rxq_flush_lock);
 	list_add_tail(&elem->list, &dp->reo_cmd_cache_flush_list);
 	dp->reo_cmd_cache_flush_count++;
 
@@ -759,23 +830,11 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 			       msecs_to_jiffies(ATH12K_DP_RX_REO_DESC_FREE_TIMEOUT_MS))) {
 			list_del(&elem->list);
 			dp->reo_cmd_cache_flush_count--;
-
-			/* Unlock the reo_cmd_lock before using ath12k_dp_reo_cmd_send()
-			 * within ath12k_dp_reo_cache_flush. The reo_cmd_cache_flush_list
-			 * is used in only two contexts, one is in this function called
-			 * from napi and the other in ath12k_dp_free during core destroy.
-			 * Before dp_free, the irqs would be disabled and would wait to
-			 * synchronize. Hence there wouldn’t be any race against add or
-			 * delete to this list. Hence unlock-lock is safe here.
-			 */
-			spin_unlock_bh(&dp->reo_cmd_lock);
-
 			ath12k_dp_reo_cache_flush(ab, &elem->data);
 			kfree(elem);
-			spin_lock_bh(&dp->reo_cmd_lock);
 		}
 	}
-	spin_unlock_bh(&dp->reo_cmd_lock);
+	spin_unlock_bh(&dp->reo_rxq_flush_lock);
 
 	return;
 free_desc:
@@ -827,57 +886,38 @@ static void ath12k_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id, u
 	ath12k_hal_reo_shared_qaddr_cache_clear(ab);
 }
 
-static void ath12k_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id, u16 tid)
+static void ath12k_dp_mark_tid_as_inactive(struct ath12k_dp *dp, int peer_id, u8 tid)
 {
-	struct ath12k_reo_queue_ref *qref;
-	struct ath12k_dp *dp = &ab->dp;
-	bool ml_peer = false;
+	struct dp_reo_update_rx_queue_elem *elem;
+	struct ath12k_dp_rx_tid_rxq *rx_tid;
 
-	if (!ab->hw_params->reoq_lut_support)
-		return;
-
-	if (peer_id & ATH12K_PEER_ML_ID_VALID) {
-		peer_id &= ~ATH12K_PEER_ML_ID_VALID;
-		ml_peer = true;
+	spin_lock_bh(&dp->reo_rxq_flush_lock);
+	list_for_each_entry(elem, &dp->reo_cmd_update_rx_queue_list, list) {
+		if (elem->peer_id == peer_id) {
+			rx_tid = &elem->rx_tid;
+			if (rx_tid->tid == tid) {
+				rx_tid->active = false;
+				break;
+			}
+		}
 	}
-
-	if (ml_peer)
-		qref = (struct ath12k_reo_queue_ref *)dp->ml_reoq_lut.vaddr +
-				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
-	else
-		qref = (struct ath12k_reo_queue_ref *)dp->reoq_lut.vaddr +
-				(peer_id * (IEEE80211_NUM_TIDS + 1) + tid);
-
-	qref->info0 = u32_encode_bits(0, BUFFER_ADDR_INFO0_ADDR);
-	qref->info1 = u32_encode_bits(0, BUFFER_ADDR_INFO1_ADDR) |
-		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+	spin_unlock_bh(&dp->reo_rxq_flush_lock);
 }
 
 void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 				  struct ath12k_peer *peer, u8 tid)
 {
 	struct ath12k_dp_rx_tid *rx_tid = &peer->rx_tid[tid];
-	int ret;
-	struct ath12k_dp_rx_tid_rxq rx_tid_rxq;
+	struct ath12k_base *ab = ar->ab;
+	struct ath12k_dp *dp = &ab->dp;
 
 	if (!rx_tid->active)
 		return;
 
-	ath12k_dp_init_rx_tid_rxq(&rx_tid_rxq, rx_tid);
-
-	ret = ath12k_dp_rx_tid_delete_handler(ar->ab, &rx_tid_rxq);
-	if (ret) {
-		ath12k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
-			   tid, ret);
-		ath12k_dp_rx_tid_cleanup(ar->ab, &rx_tid->qbuf);
-	}
-
-	if (peer->mlo)
-		ath12k_peer_rx_tid_qref_reset(ar->ab, peer->ml_id, tid);
-	else
-		ath12k_peer_rx_tid_qref_reset(ar->ab, peer->peer_id, tid);
-
 	rx_tid->active = false;
+
+	ath12k_dp_mark_tid_as_inactive(dp, peer->peer_id, tid);
+	ath12k_dp_rx_process_reo_cmd_update_rx_queue_list(dp);
 }
 
 int ath12k_dp_rx_link_desc_return(struct ath12k_base *ab,
@@ -1042,6 +1082,29 @@ static int ath12k_dp_rx_assign_reoq(struct ath12k_base *ab,
 	return 0;
 }
 
+static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
+					     struct ath12k_peer *peer,
+					     struct ath12k_dp_rx_tid *rx_tid)
+{
+	struct dp_reo_update_rx_queue_elem *elem;
+
+	elem = kzalloc(sizeof(*elem), GFP_ATOMIC);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->peer_id = peer->peer_id;
+	elem->is_ml_peer = peer->mlo;
+	elem->ml_peer_id = peer->ml_id;
+
+	ath12k_dp_init_rx_tid_rxq(&elem->rx_tid, rx_tid);
+
+	spin_lock_bh(&dp->reo_rxq_flush_lock);
+	list_add_tail(&elem->list, &dp->reo_cmd_update_rx_queue_list);
+	spin_unlock_bh(&dp->reo_rxq_flush_lock);
+
+	return 0;
+}
+
 int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id,
 				u8 tid, u32 ba_win_sz, u16 ssn,
 				enum hal_pn_type pn_type)
@@ -1122,6 +1185,19 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		return ret;
 	}
 
+	/* Pre-allocate the update_rxq_list for the corresponding tid
+	 * This will be used during the tid delete. The reason we are not
+	 * allocating during tid delete is that, if any alloc fail in update_rxq_list
+	 * we may not be able to delete the tid vaddr/paddr and may lead to leak
+	 */
+	ret = ath12k_dp_prepare_reo_update_elem(dp, peer, rx_tid);
+	if (ret) {
+		ath12k_warn(ab, "failed to alloc update_rxq_list for rx tid %u\n", tid);
+		ath12k_dp_rx_tid_cleanup(ab, &rx_tid->qbuf);
+		spin_unlock_bh(&ab->base_lock);
+		return ret;
+	}
+
 	paddr_aligned = rx_tid->qbuf.paddr_aligned;
 	if (ab->hw_params->reoq_lut_support) {
 		/* Update the REO queue LUT at the corresponding peer id
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index da2332236b77..69d0a36a91d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -43,6 +43,14 @@ struct ath12k_dp_rx_reo_cache_flush_elem {
 	unsigned long ts;
 };
 
+struct dp_reo_update_rx_queue_elem {
+	struct list_head list;
+	struct ath12k_dp_rx_tid_rxq rx_tid;
+	int peer_id;
+	bool is_ml_peer;
+	u16 ml_peer_id;
+};
+
 struct ath12k_dp_rx_reo_cmd {
 	struct list_head list;
 	struct ath12k_dp_rx_tid_rxq data;
-- 
2.17.1


