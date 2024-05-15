Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B231C25B78
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHo15Pf/w2P+bJNHNdCciijo+wFZi3KNT4QmJCoIoEk=; b=fDVtezJh8i9RPyHyvc5iIc34gq
	4rzyRyflI37JJ6qGKBeY/4LDEUfh3Q/82WYcfXuwpXz7EJUjN9xh2/1cUyi2OnxyJPSpytf9jjDY3
	oOzuIFkpFIlM4Ky7Llhi7VZsY8vsGr1zVnxOHfbRkFzppxs3Aw8QO2rfNThyBCCTcQK6KlRu/ME0c
	fLXvx1nNJsI1TG+CsD1n7pOch8FMfKQX62Pnv6gj4PS5voheE7kPJLh5JDWW4EZ2IR6eGwcICpgSz
	gGeIg1g91da93Qsr7ATjs9boWXnjQfUFZOssx9yEt7CC+exIL7X5UfDUpGFM9tq9lFX5dRhQ9V2y8
	lH5K41+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7KJ5-00000002hxI-02sc
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 19:28:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7KJ2-00000002hwl-1DFg
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 19:28:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FIOVqq021782;
	Wed, 15 May 2024 19:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=cHo15Pf
	/w2P+bJNHNdCciijo+wFZi3KNT4QmJCoIoEk=; b=fKjkob5KksiSdygJe/r1CV2
	jBpB/m/a/Akay/Om46GuVkqFTTjgHK/gu9V+cPmo1PqeJzoYrjpqGWNpmMe0mL+q
	9skMn5B12strUAhxbcmkRkrMui8zL+Mk6CTHcCMC2W2KED740zTY2MUk/5WxAoJ/
	NAx2V346YDx0FZxuQFKcf1ImnhghnlJZ+CYdbab+WCQGKlLi/DvHUzXqqsrhKk/9
	2klP37uv7VpizUCiXdJtcCEN6DALnPeQzyODcoUXxwCmWqc/SOr2eP1uUmqBIxGD
	oTmGuNuFqVc+cMEuXSGU6WMn9SwdSRqppLA649s9pug4BGp4qwvHQzo9pMgywOA=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbc06k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 19:28:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FJSjQK018217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 19:28:45 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 12:28:44 -0700
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: Add Dynamic VLAN support
Date: Wed, 15 May 2024 12:28:30 -0700
Message-ID: <20240515192830.995013-1-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2kz3jVPqML9wMaiuz_jp1nSI_TiiOpdR
X-Proofpoint-ORIG-GUID: 2kz3jVPqML9wMaiuz_jp1nSI_TiiOpdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_12,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_122852_549423_372526DC 
X-CRM114-Status: GOOD (  19.31  )
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

Add support for dynamic VLAN. VLAN group traffic is encapsulated and
encrypted in mac80211 and driver needs to set flags for the VLAN group
traffic to skip hardware encapsulation and encryption.

VLAN group traffic utilizes ext MSDU and HTT Metadata to set
encapsulation type to RAW and encryption type to OPEN in order to
inform firmware to skip hardware encapsulation and encryption.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
---
v2: rename rsvd3 to rsvd0

---
 drivers/net/wireless/ath/ath12k/dp_tx.c    | 60 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hal_desc.h | 25 +++++++++
 drivers/net/wireless/ath/ath12k/hw.c       |  6 ++-
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index a7c7a868c14c..2a7c312ad3f9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -124,6 +124,44 @@ static void ath12k_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab,
 						 HAL_TX_MSDU_EXT_INFO1_ENCRYPT_TYPE);
 }
 
+#define HTT_META_DATA_ALIGNMENT 0x8
+
+static void *ath12k_dp_metadata_align_skb(struct sk_buff *skb, u8 tail_len)
+{
+	struct sk_buff *tail;
+	void *metadata;
+
+	if (unlikely(skb_cow_data(skb, tail_len, &tail) < 0))
+		return NULL;
+
+	metadata = pskb_put(skb, tail, tail_len);
+	memset(metadata, 0, tail_len);
+	return metadata;
+}
+
+/* Preparing HTT Metadata when utilized with ext MSDU */
+static int ath12k_dp_prepare_htt_metadata(struct sk_buff *skb)
+{
+	struct hal_tx_msdu_metadata *desc_ext;
+	u8 htt_desc_size;
+	/* Size rounded of multiple of 8 bytes */
+	u8 htt_desc_size_aligned;
+
+	htt_desc_size = sizeof(struct hal_tx_msdu_metadata);
+	htt_desc_size_aligned = ALIGN(htt_desc_size, HTT_META_DATA_ALIGNMENT);
+
+	desc_ext = ath12k_dp_metadata_align_skb(skb, htt_desc_size_aligned);
+	if (!desc_ext)
+		return -ENOMEM;
+
+	desc_ext->info0 = le32_encode_bits(1, HAL_TX_MSDU_METADATA_INFO0_ENCRYPT_FLAG) |
+			  le32_encode_bits(0, HAL_TX_MSDU_METADATA_INFO0_ENCRYPT_TYPE) |
+			  le32_encode_bits(1,
+					   HAL_TX_MSDU_METADATA_INFO0_HOST_TX_DESC_POOL);
+
+	return 0;
+}
+
 int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 		 struct sk_buff *skb)
 {
@@ -145,6 +183,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 	u8 ring_selector, ring_map = 0;
 	bool tcl_ring_retry;
 	bool msdu_ext_desc = false;
+	bool add_htt_metadata = false;
 
 	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
@@ -248,6 +287,18 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 		goto fail_remove_tx_buf;
 	}
 
+	if (!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	    !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
+	    !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
+	    ieee80211_has_protected(hdr->frame_control)) {
+		/* Add metadata for sw encrypted vlan group traffic */
+		add_htt_metadata = true;
+		msdu_ext_desc = true;
+		ti.flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
+		ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
+		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
+	}
+
 	tx_desc->skb = skb;
 	tx_desc->mac_id = ar->pdev_idx;
 	ti.desc_id = tx_desc->desc_id;
@@ -269,6 +320,15 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 		msg = (struct hal_tx_msdu_ext_desc *)skb_ext_desc->data;
 		ath12k_hal_tx_cmd_ext_desc_setup(ab, msg, &ti);
 
+		if (add_htt_metadata) {
+			ret = ath12k_dp_prepare_htt_metadata(skb_ext_desc);
+			if (ret < 0) {
+				ath12k_dbg(ab, ATH12K_DBG_DP_TX,
+					   "Failed to add HTT meta data, dropping packet\n");
+				goto fail_unmap_dma;
+			}
+		}
+
 		ti.paddr = dma_map_single(ab->dev, skb_ext_desc->data,
 					  skb_ext_desc->len, DMA_TO_DEVICE);
 		ret = dma_mapping_error(ab->dev, ti.paddr);
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 814c02f876d6..02b7db06b24e 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2984,4 +2984,29 @@ struct hal_mon_dest_desc {
  *	updated by SRNG.
  */
 
+#define HAL_TX_MSDU_METADATA_INFO0_ENCRYPT_FLAG		BIT(8)
+#define HAL_TX_MSDU_METADATA_INFO0_ENCRYPT_TYPE		GENMASK(16, 15)
+#define HAL_TX_MSDU_METADATA_INFO0_HOST_TX_DESC_POOL	BIT(31)
+
+struct hal_tx_msdu_metadata {
+	__le32 info0;
+	__le32 rsvd0[6];
+} __packed;
+
+/* hal_tx_msdu_metadata
+ * valid_encrypt_type
+ *		if set, encrypt type is valid
+ * encrypt_type
+ *		0 = NO_ENCRYPT,
+ *		1 = ENCRYPT,
+ *		2 ~ 3 - Reserved
+ * host_tx_desc_pool
+ *		If set, Firmware allocates tx_descriptors
+ *		in WAL_BUFFERID_TX_HOST_DATA_EXP,instead
+ *		of WAL_BUFFERID_TX_TCL_DATA_EXP.
+ *		Use cases:
+ *		Any time firmware uses TQM-BYPASS for Data
+ *		TID, firmware expect host to set this bit.
+ */
+
 #endif /* ATH12K_HAL_DESC_H */
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index f4c827015821..e089e08408af 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -891,7 +891,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
-					BIT(NL80211_IFTYPE_MESH_POINT),
+					BIT(NL80211_IFTYPE_MESH_POINT) |
+					BIT(NL80211_IFTYPE_AP_VLAN),
 		.supports_monitor = false,
 
 		.idle_ps = false,
@@ -1036,7 +1037,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
-					BIT(NL80211_IFTYPE_MESH_POINT),
+					BIT(NL80211_IFTYPE_MESH_POINT) |
+					BIT(NL80211_IFTYPE_AP_VLAN),
 		.supports_monitor = false,
 
 		.idle_ps = false,
-- 
2.34.1


