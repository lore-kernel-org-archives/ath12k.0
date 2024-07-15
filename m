Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971DFC3DA49
	for <ath12k@archiver.kernel.org>; Mon, 15 Jul 2024 02:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DdS7iyiiwXdZcOSMR83Am9cMk8IYiEsJKsY8E/rfWqg=; b=1vRFnPIUnenW4HSpWg2Y3pf+VG
	Ms8SiqXnfX00EXJAnhJwgAqbjR5jYGCxy8U0XQXictMzDq5u8GaAfuO+a/nskAzDUEEPHLZtmSths
	VCvdroSRdHRQZIiXSRyMz9ZRC3IlVKpn5lU9KUseeszdI4pKIOm9jn+Id5rS8AxA7YujYpU//w2aS
	8LXql9myRu7Q/9J1aMsbZp6lCfplgIB8ilyM3l9ilG6qif474c7NrqYErDBtcL9aGNRymh7bqej7+
	5tEsDvhFr0qw664jw84+iAQbU1ozTGQnSf2+bKUELWO6CS3cJRfLbU5uLqz9hrufSwUyYklSa5Mja
	8nbzHj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTBbu-00000005ekc-0eHI
	for ath12k@archiver.kernel.org;
	Mon, 15 Jul 2024 02:38:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTBbr-00000005ejj-14a1
	for ath12k@lists.infradead.org;
	Mon, 15 Jul 2024 02:38:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F0E8WV024036;
	Mon, 15 Jul 2024 02:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DdS7iyiiwXdZcOSMR83Am9
	cMk8IYiEsJKsY8E/rfWqg=; b=O+JuLxm8pJnjp97nzvCgwnkyuhkcDTP8F0M6bd
	x4TqSy+ZPBx6yyGF+K5k1lkyxQKOjEjtqduv5sxmq9GI+EUuuJRvCLWtFIK3mn8D
	SIgXSlbOtD0YCJ8TGO9sdnlUGgUm1TsONfAB4w+gQp36jZm3ADM8XfdarV3h2k5D
	cwkyjOMML+smQUrZNjbgrOgsPFRFqdRhYSG6B4z75xgXfrKznPcDzZSJRtwSVRCM
	LlmRwjTRRGXImCJc8SOVgTl6Lee5ita8BRMK3SJ52Mv0hqmkUSeRvSAEGZTRQhvk
	f4BgcMdMoct2Tc78SCNicneGaEPUoW5Rn8yw5LfzY/K8Pxsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bht2jjvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 02:38:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46F2cZ1w014290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 02:38:35 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 14 Jul 2024 19:38:30 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>,
        <kernel@quicinc.com>, <netdev@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850
Date: Mon, 15 Jul 2024 10:38:14 +0800
Message-ID: <20240715023814.20242-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h2j_DL7fX8r8ze4NdACtA1U4tFedkU81
X-Proofpoint-ORIG-GUID: h2j_DL7fX8r8ze4NdACtA1U4tFedkU81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-14_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_193839_434419_E7A2309E 
X-CRM114-Status: GOOD (  23.27  )
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

In transmit path, it is likely that the iova is not aligned to PCIe TLP
max payload size, which is 128 for WCN7850. Normally in such cases hardware
is expected to split the packet into several parts in a manner such that
they, other than the first one, have aligned iova. However due to hardware
limitations, WCN7850 does not behave like that properly with some specific
unaligned iova in transmit path. This easily results in target hang in a
KPI transmit test: packet send/receive failure, WMI command send timeout
etc. Also fatal error seen in PCIe level:

	...
	Capabilities: ...
		...
		DevSta: ... FatalErr+ ...
		...
	...

Work around this by manually moving/reallocating payload buffer such that
we can map it to a 128 bytes aligned iova. The moving requires sufficient
head room or tail room in skb: for the former we can do ourselves a favor
by asking some extra bytes when registering with mac80211, while for the
latter we can do nothing.

Moving/reallocating buffer consumes additional CPU cycles, but the good news
is that an aligned iova increases PCIe efficiency. In my tests on some X86
platforms the KPI results are almost consistent.

Since this is seen only with WCN7850, add a new hardware parameter to
differentiate from others.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 72 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hw.c    |  6 +++
 drivers/net/wireless/ath/ath12k/hw.h    |  4 ++
 drivers/net/wireless/ath/ath12k/mac.c   |  1 +
 4 files changed, 83 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index d08c04343e90..00475d0848e1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -162,6 +162,60 @@ static int ath12k_dp_prepare_htt_metadata(struct sk_buff *skb)
 	return 0;
 }
 
+static void ath12k_dp_tx_move_payload(struct sk_buff *skb,
+				      unsigned long delta,
+				      bool head)
+{
+	unsigned long len = skb->len;
+
+	if (head) {
+		skb_push(skb, delta);
+		memmove(skb->data, skb->data + delta, len);
+		skb_trim(skb, len);
+	} else {
+		skb_put(skb, delta);
+		memmove(skb->data + delta, skb->data, len);
+		skb_pull(skb, delta);
+	}
+}
+
+static int ath12k_dp_tx_align_payload(struct ath12k_base *ab,
+				      struct sk_buff **pskb)
+{
+	u32 iova_mask = ab->hw_params->iova_mask;
+	unsigned long offset, delta1, delta2;
+	struct sk_buff *skb2, *skb = *pskb;
+	unsigned int headroom = skb_headroom(skb);
+	int tailroom = skb_tailroom(skb);
+	int ret = 0;
+
+	offset = (unsigned long)skb->data & iova_mask;
+	delta1 = offset;
+	delta2 = iova_mask - offset + 1;
+
+	if (headroom >= delta1) {
+		ath12k_dp_tx_move_payload(skb, delta1, true);
+	} else if (tailroom >= delta2) {
+		ath12k_dp_tx_move_payload(skb, delta2, false);
+	} else {
+		skb2 = skb_realloc_headroom(skb, iova_mask);
+		if (!skb2) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		dev_kfree_skb_any(skb);
+
+		offset = (unsigned long)skb2->data & iova_mask;
+		if (offset)
+			ath12k_dp_tx_move_payload(skb2, offset, true);
+		*pskb = skb2;
+	}
+
+out:
+	return ret;
+}
+
 int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 		 struct sk_buff *skb)
 {
@@ -184,6 +238,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 	bool tcl_ring_retry;
 	bool msdu_ext_desc = false;
 	bool add_htt_metadata = false;
+	u32 iova_mask = ab->hw_params->iova_mask;
 
 	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
@@ -279,6 +334,23 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 		goto fail_remove_tx_buf;
 	}
 
+	if (iova_mask &&
+	    (unsigned long)skb->data & iova_mask) {
+		ret = ath12k_dp_tx_align_payload(ab, &skb);
+		if (ret) {
+			dev_warn_once(ab->dev, "failed to align TX buffer %d\n", ret);
+			/* don't bail out, give original buffer
+			 * a chance even unaligned.
+			 */
+			goto map;
+		}
+
+		/* hdr is pointing to a wrong place after alignment,
+		 * so refresh it for later use.
+		 */
+		hdr = (void *)skb->data;
+	}
+map:
 	ti.paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
 	if (dma_mapping_error(ab->dev, ti.paddr)) {
 		atomic_inc(&ab->soc_stats.tx_err.misc_fail);
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 2e11ea763574..7b3e2420e3c5 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -924,6 +924,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1000,6 +1002,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
+
+		.iova_mask = PCIE_MAX_PAYLOAD_SIZE - 1,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1072,6 +1076,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index e792eb6b249b..49668aa0efc8 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -96,6 +96,8 @@
 #define ATH12K_M3_FILE			"m3.bin"
 #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
 
+#define PCIE_MAX_PAYLOAD_SIZE		128
+
 enum ath12k_hw_rate_cck {
 	ATH12K_HW_RATE_CCK_LP_11M = 0,
 	ATH12K_HW_RATE_CCK_LP_5_5M,
@@ -215,6 +217,8 @@ struct ath12k_hw_params {
 
 	const guid_t *acpi_guid;
 	bool supports_dynamic_smps_6ghz;
+
+	u32 iova_mask;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8106297f0bc1..ce41c8153080 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9193,6 +9193,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	hw->vif_data_size = sizeof(struct ath12k_vif);
 	hw->sta_data_size = sizeof(struct ath12k_sta);
+	hw->extra_tx_headroom = ab->hw_params->iova_mask;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);

base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
-- 
2.25.1


