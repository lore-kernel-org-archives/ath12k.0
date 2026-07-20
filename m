Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E51AC44521
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTQRx+rrokptjJrQYXAxJBx9AXbq0g6+c8h3UPvj4iY=; b=yDBSpYxiYGkrDokjGa/SeLY7Ip
	wqH3B6lNAlkRJO8mKnAl7ds5C5DGJBD5+wdGSw3v/e2UVlVZz19BGPiJ5Jnp6XKFOosEgjte1LUlu
	N8JzGfIWI5J3dvBLlrwb3TShPAZ4owDzxFxeUaMYN6yi9+bbuhzKjUdkzkonvrtPU1BAUjviTNa9H
	U7NVZoDeeyr8+tudmvxW7wVMoS+4CJ0XNrt8B+y2NpBafT83ogQm5qrqmlj3k6vkLk8I+vWWVM2uj
	9IPN5rwe3VNVJkVLRf5/hVvw99f4v61Ta1//GCHm5FKjuw8Ms9qw9kVE43P5bhXqjoxbdD8vWpINw
	6yB7KA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhjH-00000005zTo-3xWT;
	Mon, 20 Jul 2026 06:43:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhjF-00000005zQh-0bzF
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6ROC82771279
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTQRx+rrokptjJrQYXAxJBx9AXbq0g6+c8h3UPvj4iY=; b=KxlAmYaZZkAgPiua
	8uzdicSUH3j/dN7MTLUXfyLG2niJVIo0EmVow7bKs4V4NSEWgfY46+5qGRsB6LnM
	xUtpg6up3z6xxXPMiryVNvLgZaxpY9lU2+qxYbo6fY0fw9LOkRROZV1brGVn9H6l
	Ub2Ifz7giXcVsiNcUUUMhDfOG6aIhZdHt9Uoz7YSGGkc0C8FqUARjRvoQ6bjTR5A
	DLIeE3cRFVtn0Xu372n2wYoHCNdQETtyPlEiUjJ+dsho50YTZ8uwfrSQxXY+iwVH
	Jqd2K8MlZF8XwrDk2dd7X7Dqe4d4SEjOxekG7Mc1eKbJGZZP3bDKT08RlmoeA6Uu
	tUQ94A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aavsae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486ffba174so16249792b3a.1
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529832; x=1785134632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTQRx+rrokptjJrQYXAxJBx9AXbq0g6+c8h3UPvj4iY=;
        b=J6SJMXyMTdBUA/GoERg+yX0bPZVsmp4gdyrAzVRuG0vyZ5lrVJgF7ltB17CVWAmQYi
         s9hMx/MHg1/0RpxoR2qd5ykuZw4A+tuUAsyOwpPwVCs9ka1+dIOs9ObRADamw0sZaJwV
         dNTVIwEFJq0HHvOqmPVzGkYYnCoYrcH6z1hIhuPC+ZU6lZw+5LZLsW5tPQcNnK6Fsjg8
         Gy9/H/RB4tDfMpaiK+B0ws9iok3Pfh+lmFz+qtsVokVZBhPFFYzVWld6Y4TUaiazDFs9
         PFqp8tElw+Z+9d7qFWwiKHywCboicCm8HraaphgHqR5SOqPjQC7VwioSrKMoG4wZuxU3
         wGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529832; x=1785134632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTQRx+rrokptjJrQYXAxJBx9AXbq0g6+c8h3UPvj4iY=;
        b=ZjaWjm1L4U+CBMLSNK3mTqylNOSDWOD7UHO4PEQOrpymzQAB/24ZVWa4Afg9/G7mas
         HZ/ElKtzBnZs8Eq31d4sopK5oWwdbaIUtdE74SHqF/gYCtXJ+HWMYzgAVjtoFtDgMHSp
         UjK/H9goFgHAPFSSn+CMpo4R8mCobe1Go28crD4N/2VDw+xPrupJoi6HqyZqUekfyBO5
         xr2iD2oJImbmDeuNVYEdwgsH6Gtr2ebvxbry3yMj71MvZYB6VJC2KhOW5GvOzu9H5Bdm
         rF8ISWkAt+0QBXC+81SixfuKbX8iQreWLtacbp/r6ZKVWECdC+L8bnzRVtHyOZ2wgfgW
         P5Hg==
X-Forwarded-Encrypted: i=1; AHgh+RoQDV/RAzGhu6Veve+pM8A1IyZPg7c7cB29nV8m26SVuqiIgOpv3AjNz80GlxAV7t8BpYiATLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk7Yl6lCHtS9OEfhIrLNtbrMfx+fp5pgiJsBYukzZVnFiP4nUH
	8tPM2mEbsS281hiis80jHfdoVmPRpN01BeqIhEwUS4t+ND1CR43bF/YRoWaf5LMpReWJefGjsfw
	iErDnG8Z+SaMpMzNn7QibPECHc5td75G/lJR/fxOv80uPOg0fZSkjNY155KN8FJJB
X-Gm-Gg: AfdE7clcACbW3rMIRUTJawa66+1cHZ6U4FHE9rDWW7FVi+WxSEOCt+j0z6nX8iU66vL
	1uwoA2AXmRGDwDjzcQ+0d/FM6Tpz36bb2EFGCYs3AfxdYiUmOUqer7lYhA273Xckk01g5MAyDI1
	geoRj0W8zJrxYulDyzyJi3iInySgS0KxkHMkxgUFwq3AXpOhwTbUAc/Xctz0Y+lS13q0bCBEa6t
	ZVX7BpwJudYr+YN89UUAAQ9ZiXJIeitJL4JRUcjFOiMvLRQUQ8VX+rD8WJ8DQDLgTgiU6CGDZEO
	MPGYhX2ZS/jUFRli0u7atIv5iqgtGsfRM6nFoWd8KuDKwepaZB2fFT5cXe2wOYj0a9vggSUtIdr
	NysaVrk9OueeKPbor/fcvQk+orqZ6mwCms7GrCV/ADfQH/plnQxxM4g==
X-Received: by 2002:a05:6a00:400f:b0:846:2f3c:3f68 with SMTP id d2e1a72fcca58-84c295116efmr12208809b3a.57.1784529831804;
        Sun, 19 Jul 2026 23:43:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:400f:b0:846:2f3c:3f68 with SMTP id d2e1a72fcca58-84c295116efmr12208791b3a.57.1784529831226;
        Sun, 19 Jul 2026 23:43:51 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:49 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:29 +0800
Subject: [PATCH ath-current v2 8/8] wifi: ath12k: resolve PENDING ML peer
 ID from MLO_PEER_MAP HTT event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-8-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: FbytJd6DzzhD0hJTaf9q2rlXv5o1bvS_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX17QoPNX47/3I
 MR1eFOH8YLwx5pmfLLqKseWIjA+/23cz/Md8SYwQCHVvaEQ6U6XTtZyJp/OFvYyReyBwIIEufX2
 5pZfw3haXhI+u2mpd4cr3TOn9J8t8c0=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5dc3a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TDBLFCPSxtiKLUTLmbQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: FbytJd6DzzhD0hJTaf9q2rlXv5o1bvS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX6MFGIBus8rDP
 vBOCGEyttr8bGsxffvWQ2LZ47EJFJGA8xT9k/QbaIAG4LuvyBfFgijMC6b/7fetMMThC+8vGFvG
 QKVeWxECkZllGw04qwtUrjXOdW/BDtE7zkKZUzxShSPEeRx38Os1tQGPUY6aP15i6VAvPP8SJCM
 ZFwAmI/LLp1G8kP0xaaLpUw7lopEvYhpiY0uNS+z4s/1c2xECHoc4WkfIOY6RKx8Xl6+ekRd34T
 5Nsxusd9Q6EIVz0RsA9G+Yw9RXYKCB8y4791d9xyLBRDX3do3UkdGbT8Tjzi7ulzRo9H/erhF2J
 HfD2qqGUVED3x1x3RT5REhGd5AXShQAJs7BqKvgXpxT7lK6RRxX12cxB/MT2PSovtT97CCXnmLY
 8W3WH63WpuosW6BpomW/+lC+eaRow3Ms/7Js2jayObekAYP4rlu/L8Z5LVrhG/k6AImd3INcK6A
 t57qdA/AoiQLb2UyHqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234353_199968_06FCC063 
X-CRM114-Status: GOOD (  23.98  )
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

Add ath12k_dp_peer_fixup_peer_id() and call it from the
HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP handler. For devices where the
firmware allocates the MLD peer ID, this is the point at which
all data structures that were left with ATH12K_MLO_PEER_ID_PENDING
or ATH12K_MLO_PEER_ID_INVALID get their real ID:

  - dp_peer->peer_id is updated and the dp_peer is published into
    dp_hw->dp_peers[];
  - every existing dp_link_peer in dp_peer->link_peers[] gets its
    ml_id set to the same value;
  - ahsta->ml_peer_id is updated to the same value so peer_assoc,
    sta_state and cleanup paths see a consistent ID.

Devices with host_alloc_ml_id == true also receive the same HTT
event, but the firmware-reported ID always matches the
host-allocated one and everything has already been populated by
ath12k_dp_peer_create(); Skips the helper entirely on those devices.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221039
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |  2 ++
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_htt.c  | 19 +++++++++++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 52 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp_peer.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c     | 24 ++++++++++++++
 6 files changed, 100 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0e7c732f8222..cf9c5b068fa6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1547,6 +1547,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		}
 
 		wiphy_unlock(ah->hw->wiphy);
+
+		complete(&ah->peer_ml_id_done);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 8769b41f5db5..30726e580833 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -795,6 +795,7 @@ struct ath12k_hw {
 	bool regd_updated;
 	bool use_6ghz_regd;
 	bool host_alloc_ml_id;
+	struct completion peer_ml_id_done;
 
 	u8 num_radio;
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 150b190f9c7f..68968f96b4f1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -6,6 +6,7 @@
 
 #include "core.h"
 #include "peer.h"
+#include "dp_peer.h"
 #include "htc.h"
 #include "dp_htt.h"
 #include "debugfs_htt_stats.h"
@@ -582,6 +583,7 @@ static void ath12k_dp_htt_mlo_peer_map_handler(struct ath12k_base *ab,
 	struct htt_t2h_mlo_peer_map_event *ev = &resp->mlo_peer_map_ev;
 	u16 raw_peer_id, peer_id, addr_h16;
 	u8 peer_addr[ETH_ALEN];
+	int ret;
 
 	if (skb->len < sizeof(*ev)) {
 		ath12k_warn(ab, "unexpected htt mlo peer map event len %u\n",
@@ -600,6 +602,23 @@ static void ath12k_dp_htt_mlo_peer_map_handler(struct ath12k_base *ab,
 
 	ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "htt mlo peer map peer %pM id %u\n",
 		   peer_addr, peer_id);
+
+	/*
+	 * Fix up the dp_peer entry created with ATH12K_MLO_PEER_ID_PENDING
+	 * earlier; on chips with host_alloc_ml_id == false this is the only
+	 * point at which the host learns the firmware-assigned ID. Chips
+	 * that allocate the ID on the host also receive this event but the
+	 * firmware-reported ID matches the host-allocated one, so there is
+	 * nothing to fix up.
+	 */
+	if (!ab->hw_params->host_alloc_ml_id) {
+		ret = ath12k_dp_peer_fixup_peer_id(ab, peer_addr,
+						   peer_id);
+		if (ret)
+			ath12k_warn(ab,
+				    "failed to fix up peer id %u for dp peer %pM: %d\n",
+				    peer_id, peer_addr, ret);
+	}
 }
 
 void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 2a2eae194007..09142dcb74f9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -695,3 +695,55 @@ void ath12k_dp_link_peer_reset_rx_stats(struct ath12k_dp *dp, const u8 *addr)
 	if (rx_stats)
 		memset(rx_stats, 0, sizeof(*rx_stats));
 }
+
+int ath12k_dp_peer_fixup_peer_id(struct ath12k_base *ab,
+				 const u8 *peer_addr, u16 peer_id)
+{
+	struct ath12k_dp_link_peer *link_peer;
+	struct ath12k_dp_peer *dp_peer = NULL;
+	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_dp_hw *dp_hw = NULL;
+	struct ath12k_hw *ah;
+	int i;
+
+	if (peer_id >= (ATH12K_PEER_ML_ID_VALID | ATH12K_MAX_MLO_PEERS))
+		return -EINVAL;
+
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ag->ah[i];
+		if (!ah)
+			continue;
+
+		spin_lock_bh(&ah->dp_hw.peer_lock);
+		dp_peer = ath12k_dp_peer_find_by_addr(&ah->dp_hw,
+						      (u8 *)peer_addr);
+		if (dp_peer) {
+			dp_hw = &ah->dp_hw;
+			break;
+		}
+		spin_unlock_bh(&ah->dp_hw.peer_lock);
+	}
+
+	if (!dp_peer)
+		return -ENOENT;
+
+	/* dp_hw->peer_lock is held */
+
+	dp_peer->peer_id = peer_id;
+	rcu_assign_pointer(dp_hw->dp_peers[peer_id], dp_peer);
+
+	for (i = 0; i < ATH12K_NUM_MAX_LINKS; i++) {
+		link_peer = rcu_dereference_protected(dp_peer->link_peers[i],
+						      lockdep_is_held(&dp_hw->peer_lock));
+		if (link_peer)
+			link_peer->ml_id = peer_id;
+	}
+
+	ath12k_sta_to_ahsta(dp_peer->sta)->ml_peer_id = peer_id;
+
+	spin_unlock_bh(&dp_hw->peer_lock);
+
+	complete(&ah->peer_ml_id_done);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index f5067e66f1e1..9842671b5475 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -180,4 +180,6 @@ struct ath12k_dp_peer *ath12k_dp_peer_find_by_peerid(struct ath12k_pdev_dp *dp_p
 struct ath12k_dp_link_peer *
 ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id);
 void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer);
+int ath12k_dp_peer_fixup_peer_id(struct ath12k_base *ab, const u8 *peer_addr,
+				 u16 peer_id);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 533109f9d5bd..e4c240f168e3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3855,9 +3855,11 @@ static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
 static int ath12k_mac_peer_assoc(struct ath12k *ar,
 				 struct ath12k_wmi_peer_assoc_arg *peer_arg)
 {
+	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
 	int ret;
 
 	reinit_completion(&ar->peer_assoc_done);
+	reinit_completion(&ah->peer_ml_id_done);
 
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 	if (ret) {
@@ -3872,6 +3874,27 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 		return -ETIMEDOUT;
 	}
 
+	/*
+	 * For devices where the firmware allocates the MLD peer ID, the host
+	 * learns the real ID only from the MLO_RX_PEER_MAP HTT event, which is
+	 * handled in a softirq (BH workqueue) context that cannot take the
+	 * wiphy lock. Block here, while still holding the wiphy lock, until
+	 * that event has fixed up the ID. This serialises the fixup against
+	 * all other wiphy-locked ml_peer_id accesses.
+	 *
+	 * The firmware sends the event only once, in response to the assoc-link
+	 * peer assoc, so block only for that link.
+	 */
+	if (!ah->host_alloc_ml_id &&
+	    peer_arg->is_assoc &&
+	    peer_arg->ml.enabled &&
+	    peer_arg->ml.assoc_link &&
+	    !wait_for_completion_timeout(&ah->peer_ml_id_done, 1 * HZ)) {
+		ath12k_warn(ar->ab, "failed to get MLO peer map event for %pM vdev %i\n",
+			    peer_arg->peer_mac, peer_arg->vdev_id);
+		return -ETIMEDOUT;
+	}
+
 	return 0;
 }
 
@@ -15332,6 +15355,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 	ah->num_radio = num_pdev_map;
 
 	mutex_init(&ah->hw_mutex);
+	init_completion(&ah->peer_ml_id_done);
 
 	spin_lock_init(&ah->dp_hw.peer_lock);
 	INIT_LIST_HEAD(&ah->dp_hw.dp_peers_list);

-- 
2.25.1


