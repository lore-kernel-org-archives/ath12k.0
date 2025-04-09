Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D3CC369A5
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 02:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxeZJ3beleUO2Hu1G4hvMf5YxN/f3Zi7LJGUIKu6UbM=; b=Bo5QqP4wy6XHoAqOpLapCIYkkn
	C6xwxhn4jqzx0qW1zBg1Dnc6JC/IwN1D2UdfhqrcVJ3Dz5zHrDdKtGh2e+vuvsXb+JurIM7c54okQ
	MX9Kqkoa44ByXI2YBIPaBq5y1Bh84qMVhzHliNZeu0Z1gRLTBF+6auw0wEXetguIzmjbN4tYnLjiB
	qGO6DjqKTCXyjeM4hsQ7klVpzp/pWe+Lp3cBARASBBhg+wR0pS24EkFCFH5tv0htBKXYL+hBuTrav
	GfPOwG1wm4bYkPNpiqdhz504sjEQ2niaediZuvZJiZ2e1w+jUSPb5InahvMvLTvkgo9Oo41/5ZDq6
	v6Rq4DGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LA3-00000005vTw-0I7y
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 02:27:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LA0-00000005vS1-1nlQ
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 02:27:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYnaF004675;
	Wed, 9 Apr 2025 02:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxeZJ3beleUO2Hu1G4hvMf5YxN/f3Zi7LJGUIKu6UbM=; b=MQZq7xW/9f4t1EWg
	oVRMsdmsPge5VybDaKpcZyh/NXyXVtwuiiynEqMnQk5uHNgCsjUmIxVpSHQcbmZP
	O1QOq6y93PC0HuB/dcuR8UE2XKZDq8GI1UWgcDY+pjs1kJhrFr5FiahKF6scmdrD
	VEZG7C0u+PKvdkz9w7PCOZe//TYd1wFLhANW1TfMvgImc0fwE7+A4LU27RE7ezwy
	oxpVeP5+igAW/saL6EG+agnGhkVBnEq0a9Fh580KhtdauuEe/pLar3xLuvMEFvYg
	UEFRx7DJs7enHiYpXh8i8ji+zHU7aGkJIiQmESgtZRS7uTGbjJHCFUeyugFjRYRQ
	xle8Qg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb1vc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 02:27:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5392RPEw024577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 02:27:25 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 19:27:23 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 9 Apr 2025 10:26:40 +0800
Subject: [PATCH ath-next v2 7/9] wifi: ath12k: alloc REO queue per station
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250409-ath12k-wcn7850-mlo-support-v2-7-3801132ca2c3@quicinc.com>
References: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
In-Reply-To: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q_1-pPvDFBo_Ow74_zrEpJBiZIwGLdCu
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f5db0d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=lhfdp0ZiA_BiyW879yIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: q_1-pPvDFBo_Ow74_zrEpJBiZIwGLdCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_192728_911324_6F2F91FF 
X-CRM114-Status: GOOD (  19.01  )
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

In MLO case, all link peers share the same REO queue, so the queue
should be allocated only once, currently this is done by checking
primary_link flag in ath12k_dp_rx_peer_tid_setup(). However, the
check not only avoids duplicate allocation, but also bypasses sending
queue configuration to firmware for non-primary links. In an upcoming
patch, changes will be added to make this check no-ops for WCN7850,
as WCN7850 firmware needs to be explicitly notified each link peer's
queue configuration. That said, the duplicate allocation would arise
again after that change, hence it needs to be resolved before hand.

Since all link peers share the same queue, it should be allocated per
MLD peer, not per link peer. So change to do allocation once and save
it in MLD peer, link peers can simply get queue configuration from
there.

Also relocate ath12k_reoq_buf structure to core.h to avoid circular
dependency.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h  |  8 +++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 95 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_rx.h |  6 ---
 3 files changed, 65 insertions(+), 44 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 39a7784e36d90130f9c5f170adaef279ad071a92..40f18e446fb9bf4215c8d4a4de6ea50dfcf36bf6 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -533,6 +533,12 @@ struct ath12k_link_sta {
 	u8 link_idx;
 };
 
+struct ath12k_reoq_buf {
+	void *vaddr;
+	dma_addr_t paddr_aligned;
+	u32 size;
+};
+
 struct ath12k_sta {
 	struct ath12k_vif *ahvif;
 	enum hal_pn_type pn_type;
@@ -545,6 +551,8 @@ struct ath12k_sta {
 	u8 num_peer;
 
 	enum ieee80211_sta_state state;
+
+	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
 };
 
 #define ATH12K_HALF_20MHZ_BW	10
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index eb34b0f312c2b53f55c360d4b444a8fdbb391ea0..3b4dac515b6a02c12656565e1acac636616bdbf6 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -929,17 +929,66 @@ static int ath12k_peer_rx_tid_reo_update(struct ath12k *ar,
 	return 0;
 }
 
+static int ath12k_dp_rx_assign_reoq(struct ath12k_base *ab,
+				    struct ath12k_sta *ahsta,
+				    struct ath12k_dp_rx_tid *rx_tid,
+				    u16 ssn, enum hal_pn_type pn_type)
+{
+	u32 ba_win_sz = rx_tid->ba_win_sz;
+	struct ath12k_reoq_buf *buf;
+	void *vaddr, *vaddr_aligned;
+	dma_addr_t paddr_aligned;
+	u8 tid = rx_tid->tid;
+	u32 hw_desc_sz;
+	int ret;
+
+	buf = &ahsta->reoq_bufs[tid];
+	if (!buf->vaddr) {
+		/* TODO: Optimize the memory allocation for qos tid based on
+		 * the actual BA window size in REO tid update path.
+		 */
+		if (tid == HAL_DESC_REO_NON_QOS_TID)
+			hw_desc_sz = ath12k_hal_reo_qdesc_size(ba_win_sz, tid);
+		else
+			hw_desc_sz = ath12k_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX, tid);
+
+		vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1, GFP_ATOMIC);
+		if (!vaddr)
+			return -ENOMEM;
+
+		vaddr_aligned = PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
+
+		ath12k_hal_reo_qdesc_setup(vaddr_aligned, tid, ba_win_sz,
+					   ssn, pn_type);
+
+		paddr_aligned = dma_map_single(ab->dev, vaddr_aligned, hw_desc_sz,
+					       DMA_BIDIRECTIONAL);
+		ret = dma_mapping_error(ab->dev, paddr_aligned);
+		if (ret) {
+			kfree(vaddr);
+			return ret;
+		}
+
+		buf->vaddr = vaddr;
+		buf->paddr_aligned = paddr_aligned;
+		buf->size = hw_desc_sz;
+	}
+
+	rx_tid->qbuf = *buf;
+	rx_tid->active = true;
+
+	return 0;
+}
+
 int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id,
 				u8 tid, u32 ba_win_sz, u16 ssn,
 				enum hal_pn_type pn_type)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_dp *dp = &ab->dp;
-	struct hal_rx_reo_queue *addr_aligned;
 	struct ath12k_peer *peer;
+	struct ath12k_sta *ahsta;
 	struct ath12k_dp_rx_tid *rx_tid;
-	u32 hw_desc_sz;
-	void *vaddr;
 	dma_addr_t paddr_aligned;
 	int ret;
 
@@ -972,9 +1021,9 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 	}
 
 	rx_tid = &peer->rx_tid[tid];
+	paddr_aligned = rx_tid->qbuf.paddr_aligned;
 	/* Update the tid queue if it is already setup */
 	if (rx_tid->active) {
-		paddr_aligned = rx_tid->qbuf.paddr_aligned;
 		ret = ath12k_peer_rx_tid_reo_update(ar, peer, rx_tid,
 						    ba_win_sz, ssn, true);
 		spin_unlock_bh(&ab->base_lock);
@@ -1002,39 +1051,14 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 
 	rx_tid->ba_win_sz = ba_win_sz;
 
-	/* TODO: Optimize the memory allocation for qos tid based on
-	 * the actual BA window size in REO tid update path.
-	 */
-	if (tid == HAL_DESC_REO_NON_QOS_TID)
-		hw_desc_sz = ath12k_hal_reo_qdesc_size(ba_win_sz, tid);
-	else
-		hw_desc_sz = ath12k_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX, tid);
-
-	vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1, GFP_ATOMIC);
-	if (!vaddr) {
-		spin_unlock_bh(&ab->base_lock);
-		return -ENOMEM;
-	}
-
-	addr_aligned = PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
-
-	ath12k_hal_reo_qdesc_setup(addr_aligned, tid, ba_win_sz,
-				   ssn, pn_type);
-
-	paddr_aligned = dma_map_single(ab->dev, addr_aligned, hw_desc_sz,
-				       DMA_BIDIRECTIONAL);
-
-	ret = dma_mapping_error(ab->dev, paddr_aligned);
+	ahsta = ath12k_sta_to_ahsta(peer->sta);
+	ret = ath12k_dp_rx_assign_reoq(ab, ahsta, rx_tid, ssn, pn_type);
 	if (ret) {
 		spin_unlock_bh(&ab->base_lock);
-		goto err_mem_free;
+		ath12k_warn(ab, "failed to assign reoq buf for rx tid %u\n", tid);
+		return ret;
 	}
 
-	rx_tid->qbuf.vaddr = vaddr;
-	rx_tid->qbuf.paddr_aligned = paddr_aligned;
-	rx_tid->qbuf.size = hw_desc_sz;
-	rx_tid->active = true;
-
 	if (ab->hw_params->reoq_lut_support) {
 		/* Update the REO queue LUT at the corresponding peer id
 		 * and tid with qaddr.
@@ -1054,11 +1078,6 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 							     ba_win_sz);
 	}
 
-	return ret;
-
-err_mem_free:
-	kfree(vaddr);
-
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 1376360d71d0903113735ef1cf5836e45cdbd274..d8e9c55c321f02a75a775f99fc54123daeda8279 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -12,12 +12,6 @@
 
 #define DP_MAX_NWIFI_HDR_LEN	30
 
-struct ath12k_reoq_buf {
-	void *vaddr;
-	dma_addr_t paddr_aligned;
-	u32 size;
-};
-
 struct ath12k_dp_rx_tid {
 	u8 tid;
 	u32 ba_win_sz;

-- 
2.25.1


