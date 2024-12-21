Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FCDE7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dccjv2Y3itawRQQPxPPPGJMQ2p6nAnYcz5vTo87rU9k=; b=HGcl2FdGPfoSJrtthZ8EO6KFzn
	BrdwDjTmeW0J447zA9Xdo6Gx+htj9E5LvBNcZYceF9sFJ1z3mmPgTZ6NiT6K+MaCugbPbbzK9gEfr
	GbTAI+Fo4HhAzheRYUpEjLFsaj91tIxCmROgX6bR/AjCcJJuJVMnZExI3cmhCz9lBgh/cj7+ENrvJ
	m1lkcRUcm+19WnH+X9w/kxQHofKbIDBf8FtICrDCsAmLZABSzEKgJjkVKkN3TsGvI+njtBNb/9tJ4
	txpJ/1Aleot9D0lwvoaBrpwfy4rFMw/MH8Ui9RRMgw5siAssgdEeRzOAXJbKp92mB9HyK25LySOx5
	t6N+tncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9F-00000006Xae-0dU9
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:31:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9C-00000006XYr-2ZWP
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:31:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL0gipv008108;
	Sat, 21 Dec 2024 04:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dccjv2Y3itawRQQPxPPPGJMQ2p6nAnYcz5vTo87rU9k=; b=MGrESmbeVg/59648
	VJtOxZ3DPIbke5devhK+FrMQp/cbV4AzN5XdTv5+VIB6OAfCh0sKiRpn2Vl3RvZf
	wujfziDi9X6OGUuECBWm7gd9rbp9p5aF/iqcbZjw72REr4TfN3xt54eE4KdnG9lf
	HvF6wKek157GGS24pYYFUPLSksWZTOoXmiQ79SCHCJFQ66FJYGwFpqGpYpHG1Qt0
	w/OvCjyNMDMYNi33Y/4wqPsZvPdKg4yo4+vxdpk8F1eGy3PmfNPipFWq6nXr0tTI
	db4DWxDabv61s0gwb1YRBsm4AGTJSj0Os1IPqM8uoExDhY30KBTobjHjda0NVd+j
	qvS8OQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nkcc8cf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4VPTC013451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:25 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:31:23 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 09/14] wifi: ath12k: Handle end reason for the monitor destination ring
Date: Sat, 21 Dec 2024 10:00:09 +0530
Message-ID: <20241221043014.1252841-10-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: meV-FdoBCMmHbe1cQO17uHAsmZLa-WbM
X-Proofpoint-GUID: meV-FdoBCMmHbe1cQO17uHAsmZLa-WbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=897 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203126_679757_C423424F 
X-CRM114-Status: GOOD (  14.85  )
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

Currently, the monitor destination ring's descriptor includes a 2-bit
field for the end reason. Out of all the end reason values, hardware uses
HAL_MON_FLUSH_DETECTED and HAL_MON_PPDU_TRUNCATED to indicate buffers that
should not be processed due to system level errors. Driver should not
process entries with these end reasons, as they contain junk values.
However, the current code lacks end reason-specific checks for the monitor
destination ring, leading to the processing of invalid buffers.
Fix this by adding checks for these two end reasons during the reaping
phase. Free the skb if either HAL_MON_FLUSH_DETECTED or
HAL_MON_PPDU_TRUNCATED is detected, preventing the driver from processing
invalid entries.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 17 ++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_desc.h |  3 +--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index bf43ef2b6b39..dbf5afd88ad5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2329,7 +2329,7 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	struct sk_buff_head skb_list;
 	u64 cookie;
 	int num_buffs_reaped = 0, srng_id, buf_id;
-	u32 hal_status, end_offset, info0;
+	u32 hal_status, end_offset, info0, end_reason;
 	u8 pdev_idx = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, ar->pdev_idx);
 
 	__skb_queue_head_init(&skb_list);
@@ -2373,6 +2373,21 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 				 skb->len + skb_tailroom(skb),
 				 DMA_FROM_DEVICE);
 
+		end_reason = u32_get_bits(info0, HAL_MON_DEST_INFO0_END_REASON);
+
+		/* HAL_MON_FLUSH_DETECTED implies that an rx flush received at the end of
+		 * rx PPDU and HAL_MON_PPDU_TRUNCATED implies that the PPDU got
+		 * truncated due to a system level error. In both the cases, buffer data
+		 * can be discarded
+		 */
+		if ((end_reason == HAL_MON_FLUSH_DETECTED) ||
+		    (end_reason == HAL_MON_PPDU_TRUNCATED)) {
+			ath12k_dbg(ab, ATH12K_DBG_DATA,
+				   "Monitor dest descriptor end reason %d", end_reason);
+			dev_kfree_skb_any(skb);
+			goto move_next;
+		}
+
 		end_offset = u32_get_bits(info0, HAL_MON_DEST_INFO0_END_OFFSET);
 		if (likely(end_offset <= DP_RX_BUFFER_SIZE)) {
 			skb_put(skb, end_offset);
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index a102d27e5785..3e8983b85de8 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2969,8 +2969,7 @@ struct hal_mon_buf_ring {
 #define HAL_MON_DEST_COOKIE_BUF_ID      GENMASK(17, 0)
 
 #define HAL_MON_DEST_INFO0_END_OFFSET		GENMASK(11, 0)
-#define HAL_MON_DEST_INFO0_FLUSH_DETECTED	BIT(16)
-#define HAL_MON_DEST_INFO0_END_OF_PPDU		BIT(17)
+#define HAL_MON_DEST_INFO0_END_REASON		GENMASK(17, 16)
 #define HAL_MON_DEST_INFO0_INITIATOR		BIT(18)
 #define HAL_MON_DEST_INFO0_EMPTY_DESC		BIT(19)
 #define HAL_MON_DEST_INFO0_RING_ID		GENMASK(27, 20)
-- 
2.34.1


