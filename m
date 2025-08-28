Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C65CA0EED
	for <ath12k@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zn+J7rnO++Uu4TTXtCH3VlrNsUtq0yHkZZuOnYLaJI=; b=TnU03s7PiukI0ucReQs1hJlWmK
	cqwa9RkHU0T77r5w/Lp99EPm34QwReVzpWa8DwJqEd9D8TGMTc1UaIjwhb4DWAJEAUoqUR0I9J/HM
	W1hoSzWSVlSJ6TBTQk/3Ik7sy0SxMgeWWZNNS4sBybIDXM/jB54DKCawnDtfHRZYnPBNZezsP3Bgn
	3aZDgQqBCg66aJR+jdZG0NWZ7t/fb7k3VUvdJpnoItWhnVs/SIjH8gRGCNmbK06lzhdPBOpFQndBx
	CKQGGI0cTaCYubCKH6IQx/Be5MKBqbBJQVqnlDqY7CYRVWgsoL3T72kog8tunjyuWsgCxaHoxZV8x
	59b1dMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzQ-00000003dLn-0EI3;
	Thu, 28 Aug 2025 23:25:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgY8-00000002Yh3-1Epu
	for ath12k@lists.infradead.org;
	Thu, 28 Aug 2025 17:36:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEV0eR014774;
	Thu, 28 Aug 2025 17:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Zn+J7rnO++Uu4TTXtCH3VlrNsUtq0yHkZZuOnYLaJI=; b=TbCZdSxJKdCdWNkU
	P29IIxiOukp6Oa9B+D0vtLvP/3vkdI5l0km7ld6QrxTirIWxXeI/aob/b3Ijy4k7
	W3EfMjv38HTCUDTy5/jbd0WQQwwTt0J+Cte85T2p74v/PjxdPwhyVi38ls0R/66K
	bYP6p7PK3oZ1lvIbR34J1SCLqibiGsEH9YNLbsmV0WN7xJwtIdTId1GvuizcrHS/
	oraT7tS0g6WwDS15Kw3G/Xr/aKx3hW8JElKmiQzcWv2qlMdZ2C9Hv6l/uBs4+sZT
	eryuvXylHoHRKwU9VkksCl2X3fjDx5dvuo5dNnsKxYJ1YO8debT63AYfCYqBLcPz
	nNwHBA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we8urx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SHaUa9015725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:30 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 10:36:28 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 13/20] wifi: ath12k: Move arch specific REO functions to wifi7 directory
Date: Thu, 28 Aug 2025 23:05:46 +0530
Message-ID: <20250828173553.3341351-14-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fG6Zq7iR0D595pcGg64HeAZnmgyXlNt4
X-Proofpoint-ORIG-GUID: fG6Zq7iR0D595pcGg64HeAZnmgyXlNt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3hc/4hbgU49n
 Om3l67Q7IWxf56DogkIVbmF3JtoLB2RWnCoBuVi8tHHfzIHGlblTrPEyhJ2wEYYfC+Ifqobc9I3
 IotTrJsbjZn3zE3pr1EVz09cYBiYY25pqAS+mnp6h+xB+j/iRSZpx3v8Z5lWi1xOocJAQnxPs/0
 hiyd9RHc4VlKAtD+6+ohCB3APT7wokRjG1dZg/kSyVPbCAPQPJZlhOO8j0ROO46F/QhNsLspwZb
 u2ihVu1DgBYG7qdQ5S+2mUVfLLHO6eby1Vmwimfs5wrnoTggMhG0U3TofVb74xo3126CJ8b4Am9
 SY67m1zyVf/uocR0Nr6KDW7uwxTF0cyxBl0EqdaiXitRUZvDiCR+LffPUzvOTcWDvbP6qrNS98V
 zm2RJ8Rt
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b0939f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=tDD_XfHHEMizwVAdGK0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_103636_457025_275A191E 
X-CRM114-Status: GOOD (  17.01  )
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

Move arch specific REO functions to wifi7 directory.

The moved APIs will be a part of dp_rx.c file inside wifi7 directory.
wifi7/dp_rx.c file will continue to be part of ath12k.ko temporarily
until the corresponding infra for movement to ath12k_wifi7.ko arrives
in upcoming patches.

Architecture specific APIs:
ath12k_dp_setup_pn_check_reo_cmd
ath12k_dp_rx_assign_reoq

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 82 +------------------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 80 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  6 ++
 3 files changed, 87 insertions(+), 81 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index dd771063f591..22d9c2d8c4e3 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -13,6 +13,7 @@
 #include "wifi7/hal_desc.h"
 #include "hw.h"
 #include "dp_rx.h"
+#include "wifi7/dp_rx.h"
 #include "wifi7/hal_rx.h"
 #include "dp_tx.h"
 #include "peer.h"
@@ -728,57 +729,6 @@ static int ath12k_peer_rx_tid_reo_update(struct ath12k *ar,
 	return 0;
 }
 
-static int ath12k_dp_rx_assign_reoq(struct ath12k_base *ab,
-				    struct ath12k_sta *ahsta,
-				    struct ath12k_dp_rx_tid *rx_tid,
-				    u16 ssn, enum hal_pn_type pn_type)
-{
-	u32 ba_win_sz = rx_tid->ba_win_sz;
-	struct ath12k_reoq_buf *buf;
-	void *vaddr, *vaddr_aligned;
-	dma_addr_t paddr_aligned;
-	u8 tid = rx_tid->tid;
-	u32 hw_desc_sz;
-	int ret;
-
-	buf = &ahsta->reoq_bufs[tid];
-	if (!buf->vaddr) {
-		/* TODO: Optimize the memory allocation for qos tid based on
-		 * the actual BA window size in REO tid update path.
-		 */
-		if (tid == HAL_DESC_REO_NON_QOS_TID)
-			hw_desc_sz = ath12k_hal_reo_qdesc_size(ba_win_sz, tid);
-		else
-			hw_desc_sz = ath12k_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX, tid);
-
-		vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1, GFP_ATOMIC);
-		if (!vaddr)
-			return -ENOMEM;
-
-		vaddr_aligned = PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
-
-		ath12k_hal_reo_qdesc_setup(vaddr_aligned, tid, ba_win_sz,
-					   ssn, pn_type);
-
-		paddr_aligned = dma_map_single(ab->dev, vaddr_aligned, hw_desc_sz,
-					       DMA_BIDIRECTIONAL);
-		ret = dma_mapping_error(ab->dev, paddr_aligned);
-		if (ret) {
-			kfree(vaddr);
-			return ret;
-		}
-
-		buf->vaddr = vaddr;
-		buf->paddr_aligned = paddr_aligned;
-		buf->size = hw_desc_sz;
-	}
-
-	rx_tid->qbuf = *buf;
-	rx_tid->active = true;
-
-	return 0;
-}
-
 int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id,
 				u8 tid, u32 ba_win_sz, u16 ssn,
 				enum hal_pn_type pn_type)
@@ -958,36 +908,6 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 	return ret;
 }
 
-static void ath12k_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
-					     struct ath12k_dp_rx_tid *rx_tid,
-					     u32 cipher, enum set_key_cmd key_cmd)
-{
-	cmd->flag = HAL_REO_CMD_FLG_NEED_STATUS;
-	cmd->upd0 = HAL_REO_CMD_UPD0_PN |
-			HAL_REO_CMD_UPD0_PN_SIZE |
-			HAL_REO_CMD_UPD0_PN_VALID |
-			HAL_REO_CMD_UPD0_PN_CHECK |
-			HAL_REO_CMD_UPD0_SVLD;
-
-	switch (cipher) {
-	case WLAN_CIPHER_SUITE_TKIP:
-	case WLAN_CIPHER_SUITE_CCMP:
-	case WLAN_CIPHER_SUITE_CCMP_256:
-	case WLAN_CIPHER_SUITE_GCMP:
-	case WLAN_CIPHER_SUITE_GCMP_256:
-		if (key_cmd == SET_KEY) {
-			cmd->upd1 |= HAL_REO_CMD_UPD1_PN_CHECK;
-			cmd->pn_size = 48;
-		}
-		break;
-	default:
-		break;
-	}
-
-	cmd->addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
-	cmd->addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
-}
-
 int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 				       const u8 *peer_addr,
 				       enum set_key_cmd key_cmd,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index cbc51a9a2c42..bcdfa19a2e5f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -8,6 +8,56 @@
 #include "../dp_tx.h"
 #include "../peer.h"
 
+int ath12k_dp_rx_assign_reoq(struct ath12k_base *ab, struct ath12k_sta *ahsta,
+			     struct ath12k_dp_rx_tid *rx_tid,
+			     u16 ssn, enum hal_pn_type pn_type)
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
 static void ath12k_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					struct ath12k_dp_rx_info *rx_info)
 {
@@ -1354,6 +1404,36 @@ static void ath12k_dp_rx_wbm_err(struct ath12k *ar,
 	ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_info);
 }
 
+void ath12k_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+				      struct ath12k_dp_rx_tid *rx_tid,
+				      u32 cipher, enum set_key_cmd key_cmd)
+{
+	cmd->flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd->upd0 = HAL_REO_CMD_UPD0_PN |
+			HAL_REO_CMD_UPD0_PN_SIZE |
+			HAL_REO_CMD_UPD0_PN_VALID |
+			HAL_REO_CMD_UPD0_PN_CHECK |
+			HAL_REO_CMD_UPD0_SVLD;
+
+	switch (cipher) {
+	case WLAN_CIPHER_SUITE_TKIP:
+	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
+	case WLAN_CIPHER_SUITE_GCMP:
+	case WLAN_CIPHER_SUITE_GCMP_256:
+		if (key_cmd == SET_KEY) {
+			cmd->upd1 |= HAL_REO_CMD_UPD1_PN_CHECK;
+			cmd->pn_size = 48;
+		}
+		break;
+	default:
+		break;
+	}
+
+	cmd->addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd->addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+}
+
 int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 				 struct napi_struct *napi, int budget)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index 63176a53c1e7..3589db00c906 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -19,4 +19,10 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int mac_id,
 void ath12k_dp_rx_process_reo_status(struct ath12k_base *ab);
 int ath12k_dp_rxdma_ring_sel_config_qcn9274(struct ath12k_base *ab);
 int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab);
+void ath12k_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+				      struct ath12k_dp_rx_tid *rx_tid,
+				      u32 cipher, enum set_key_cmd key_cmd);
+int ath12k_dp_rx_assign_reoq(struct ath12k_base *ab, struct ath12k_sta *ahsta,
+			     struct ath12k_dp_rx_tid *rx_tid,
+			     u16 ssn, enum hal_pn_type pn_type);
 #endif
-- 
2.34.1


