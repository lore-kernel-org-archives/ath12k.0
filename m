Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C4CA0FFF
	for <ath12k@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEh0ICVJiF553mOHqN8i1M4Oxb/v9J4HYMLs5wY5Tic=; b=XSI0/tSifNmYrl4vhJYftxslzs
	3QnDK5lGLCFWdGxy6C3pWF7TjgKPVANox545CNAZtCfrtbz4+0vIhlQgrChnF+oLUhg/G99KK3W7u
	eAiRumVfLNI0Mf97UAZyXaz33PAtBI5KcSaT3PpklEpDJYwdyxYHVE4pHhtzRpzv1/C1C/YGtayuS
	hqmu0URLMgGceQKxHa2YAItbchbz43Ckk+Blib+8jR/zUqa+yJM4xFY6m5JIPxf/sC71aYZxiJgtS
	ki8Re/i0FtqZE+Iqex08VgWHyWOiC8FZaN8fkFhuAfxL/xn0vFEZR9zM72PUjix5LFYpIvt5Pubmg
	Wgl+vnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzS-00000003dPF-32id;
	Thu, 28 Aug 2025 23:25:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgYI-00000002Yix-1pSH
	for ath12k@bombadil.infradead.org;
	Thu, 28 Aug 2025 17:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SEh0ICVJiF553mOHqN8i1M4Oxb/v9J4HYMLs5wY5Tic=; b=k+jq1iJ/NDBOAZVSynjYGprPG+
	VuUtNrfvqJnroCpyMUZfCBtj9p5JZ/332PirWi0EqxoYxUQAhOhm9qxzuALr1hEYUBl0L31FTGPwl
	QQ/F9MQ5jbaWnUr3ikeVn1Et5nS206z0OEg+3dy/rTa48/k3o9Gk6+F0LqyNWg7LzvnylcaCAreR1
	eucth2VXQWu7GtS+/EuX4Cvq/V6CcZVSSfIYcRvCD5q2SdbZ/jc1PCzgMMFgRBTsJXBtApNd9XST6
	U88N0FiRXOnbWSNKXTDWyjl9NSiMfew9U8/MOp6wSb+eAjt8PaY4oUjUNtHHLsQNYf6WxvtSeyqww
	PyH2tUNw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgYE-00000002pDP-3djr
	for ath12k@lists.infradead.org;
	Thu, 28 Aug 2025 17:36:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SAE6Cw007255;
	Thu, 28 Aug 2025 17:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEh0ICVJiF553mOHqN8i1M4Oxb/v9J4HYMLs5wY5Tic=; b=P8yHxVMNMEoNR75z
	dUupBNh2dXNC5m7VQM2Y5nTl6h/EJsPEOo4I/8/pCqI1c37mRLoK3RqvVu8HDLT+
	rHm1ApgW8yXrcPSQkEDS1HErsGWpNJ2r1meDctF3pOfT9B1odyRDj6nRg/i/kF+5
	i3BJmT1MV6CSmuY3KS32TjPQrz8O5PLcE+QFud0iC06zEfoxIoP9RG3/IRi4QlgE
	MguHDL61InGnvrYl4uW/ltq3MJMEezqzcTGgyKJmoyxG4OqD8zOPP2Ovzkkzjg9j
	wU2t8VHgHSnPhBjmsLanG86ARIy0sbNP+KCuYvpq31z/COh8kQ+MIbAisfq2Sfua
	ieS7fA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67h9hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SHaeJj019806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:40 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 10:36:39 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 20/20] wifi: ath12k: Move HTT specific code from dp.c to newly introduced files
Date: Thu, 28 Aug 2025 23:05:53 +0530
Message-ID: <20250828173553.3341351-21-quic_rdeuri@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfXwDChspDqwpEy
 lqRhEdjwkdhcRPIMeKWP+AEektYVfyDjlQ7qMOHYfgiF8JxPGMx/YbujDAhaaoxBcf/QuF2pLrA
 toxabUjPjDZnvMu+08eDRWuHUhSCo/WJympVwYo8AvhpVyc/eQbJqwv3yEA5AJKQ5lgxTO90y+u
 /v1aNPNh4I8LRhIOQU+kSctH36eVkspOiUoUmZh9T3i1DoHj/X8Ittnt0mGxhd91pmF2qtMxaXt
 tOmZIAabOqKhjPrHldh9Bka3YAKSQMipxC0msKGXjk8sOAWkULmObroebGYKBvCFzpx0H7L0LDi
 /a2rXzl+eDtPqcI1YKcovJiWLfObyadvpf/wujWbX/FS5qch0tknIDNHXn6l1e2QWE3PfCExKtE
 nsktwLFh
X-Proofpoint-GUID: Spcc2L0IOAUYKGTBvNsHXkdSy3CnL1To
X-Proofpoint-ORIG-GUID: Spcc2L0IOAUYKGTBvNsHXkdSy3CnL1To
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b093a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KFaOQ6OXsHnzEyzz7ZwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183643_322276_AF420FF5 
X-CRM114-Status: GOOD (  15.78  )
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

From: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>

WLAN Host driver interacts with the Firmware and vice versa using
Host-To-Target (HTT) interface.

Relocate HTT specific code from dp.c to newly introduced file dp_htt.c
for HTT interface.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c     | 29 ----------------------
 drivers/net/wireless/ath/ath12k/dp.h     |  1 -
 drivers/net/wireless/ath/ath12k/dp_htt.c | 31 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/dp_htt.h |  3 +++
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index d0bdf058633f..8909415df2e2 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -19,12 +19,6 @@ enum ath12k_dp_desc_type {
 	ATH12K_DP_RX_DESC,
 };
 
-static void ath12k_dp_htt_htc_tx_complete(struct ath12k_base *ab,
-					  struct sk_buff *skb)
-{
-	dev_kfree_skb_any(skb);
-}
-
 void ath12k_dp_peer_cleanup(struct ath12k *ar, int vdev_id, const u8 *addr)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -957,29 +951,6 @@ int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
 	return ret;
 }
 
-int ath12k_dp_htt_connect(struct ath12k_dp *dp)
-{
-	struct ath12k_htc_svc_conn_req conn_req = {};
-	struct ath12k_htc_svc_conn_resp conn_resp = {};
-	int status;
-
-	conn_req.ep_ops.ep_tx_complete = ath12k_dp_htt_htc_tx_complete;
-	conn_req.ep_ops.ep_rx_complete = ath12k_dp_htt_htc_t2h_msg_handler;
-
-	/* connect to control service */
-	conn_req.service_id = ATH12K_HTC_SVC_ID_HTT_DATA_MSG;
-
-	status = ath12k_htc_connect_service(&dp->ab->htc, &conn_req,
-					    &conn_resp);
-
-	if (status)
-		return status;
-
-	dp->eid = conn_resp.eid;
-
-	return 0;
-}
-
 static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
 {
 	switch (arvif->ahvif->vdev_type) {
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index ad93e63e3344..18a3287945b7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -432,7 +432,6 @@ static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
 	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
 }
 
-int ath12k_dp_htt_connect(struct ath12k_dp *dp);
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_free(struct ath12k_base *ab);
 int ath12k_dp_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 45aa8ae86a14..6ab5b2d8aac9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -11,6 +11,35 @@
 #include "debugfs_htt_stats.h"
 #include "debugfs.h"
 
+static void ath12k_dp_htt_htc_tx_complete(struct ath12k_base *ab,
+					  struct sk_buff *skb)
+{
+	dev_kfree_skb_any(skb);
+}
+
+int ath12k_dp_htt_connect(struct ath12k_dp *dp)
+{
+	struct ath12k_htc_svc_conn_req conn_req = {};
+	struct ath12k_htc_svc_conn_resp conn_resp = {};
+	int status;
+
+	conn_req.ep_ops.ep_tx_complete = ath12k_dp_htt_htc_tx_complete;
+	conn_req.ep_ops.ep_rx_complete = ath12k_dp_htt_htc_t2h_msg_handler;
+
+	/* connect to control service */
+	conn_req.service_id = ATH12K_HTC_SVC_ID_HTT_DATA_MSG;
+
+	status = ath12k_htc_connect_service(&dp->ab->htc, &conn_req,
+					    &conn_resp);
+
+	if (status)
+		return status;
+
+	dp->eid = conn_resp.eid;
+
+	return 0;
+}
+
 static int ath12k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
 				      u16 peer_id)
 {
@@ -818,8 +847,6 @@ int ath12k_dp_tx_htt_srng_setup(struct ath12k_base *ab, u32 ring_id,
 	return ret;
 }
 
-#define HTT_TARGET_VERSION_TIMEOUT_HZ (3 * HZ)
-
 int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.h b/drivers/net/wireless/ath/ath12k/dp_htt.h
index b13af1c69253..6020e632f74e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.h
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.h
@@ -36,6 +36,8 @@ struct ath12k_dp;
 
 #define HTT_TX_WBM_COMP_INFO2_ACK_RSSI		GENMASK(31, 24)
 
+#define HTT_TARGET_VERSION_TIMEOUT_HZ (3 * HZ)
+
 struct htt_tx_wbm_completion {
 	__le32 rsvd0[2];
 	__le32 info0;
@@ -1514,6 +1516,7 @@ struct htt_mac_addr {
 	__le32 mac_addr_h16;
 } __packed;
 
+int ath12k_dp_htt_connect(struct ath12k_dp *dp);
 int ath12k_dp_tx_htt_srng_setup(struct ath12k_base *ab, u32 ring_id,
 				int mac_id, enum hal_ring_type ring_type);
 
-- 
2.34.1


