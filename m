Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4DC47DDB
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 04:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkXMf/HXIM4wnA6kwwxoRws/wkw7K2OC47NPgC/dw/Q=; b=th+33koxu0n7TyXeNfORAfUMLY
	CMxunzWmTc2+W2e5xCSMOT4mFtxusFJkwYHCTbOrdm1ZHEy178WjIYNhMB/ILgWEpbfS7Iyk6UHRa
	41Jw115uxp9HaS+rROnOPIj2IGOu93nHphb68R/cyWMRB1eA5K/2NrvWLJf9aFfjUCchRU5+3y2Df
	KU+fQA0+brPJV7F3mTOKt+n9BfNzt5NBu7+UqoLqSz63YEMO6BhZnlTxvHwg63dWN+WjoP5dX/6dr
	9N2cTW71jb7G1vpWJjRBr7U1EL5ZF5ByEBBXhXWwr35XTPgdBuUXLEe5s65sB/esDtVspsk2mhuyV
	vegIbavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLU-0000000FCJp-2F6z
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 04:03:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLR-0000000FCI1-3PEm
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 04:03:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TNZXZj023175;
	Tue, 30 Jan 2024 04:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=KkXMf/HXIM4wnA6kwwxoRws/wkw7K2OC47NPgC/dw/Q=; b=mf
	a/81stnemxB/QYpcCcu2vYRnrM5eE+ksJANtlooi9+9mVK/1X1DFDy84V4xXmpGy
	JRpS+3wzECBwTQ1LRyMN1EGj/ThcUndudS3pYJRo+SCcJOT7NAYiK60egM+seZiW
	rN21qWKZ1Ce8AzfiuxZBo2S0efS9JzPY6SSf7uSDok2rkLAnAwdN80GMWqE7RGiA
	DzKWvFSvWeRlFbvg7ADjnkaZUnx0ciCXV7SSmOm7rRJNxhZuVuy1Lg+EEx36IKbo
	9Oh2pmYb65aljDMsemiU4VXvWfFXfgF4PsHVGHg8Bdkswy5EBxSb6vJjciSUhuxg
	UiQ6v6yunpYkKvX5txBw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx86htkd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U43VCP022573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:31 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 20:03:30 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 04/11] wifi: ath12k: add P2P IE in beacon template
Date: Tue, 30 Jan 2024 12:02:56 +0800
Message-ID: <20240130040303.370590-5-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130040303.370590-1-quic_kangyang@quicinc.com>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4A0x90VJ7xczLzJmsez_klTj1ALM4fnv
X-Proofpoint-GUID: 4A0x90VJ7xczLzJmsez_klTj1ALM4fnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_200333_998662_DB2FAF4A 
X-CRM114-Status: GOOD (  18.03  )
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

P2P Element is a necessary component of P2P protocol communication.
It contains the Vendor Specific Information Element which includes
the WFA OUI and an OUI Type indicating P2P.

Add P2P IE in beacon template, and implement WMI interface for it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v6: no change.
v5: no change.
v4: no change.
v3: no change.
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright.

---
 drivers/net/wireless/ath/ath12k/mac.c | 85 ++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.c | 39 ++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 10 +++-
 3 files changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index cf3c1d83063d..1604597d8825 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1138,6 +1138,64 @@ static int ath12k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	return ret;
 }
 
+static int ath12k_mac_setup_bcn_p2p_ie(struct ath12k_vif *arvif,
+				       struct sk_buff *bcn)
+{
+	struct ath12k *ar = arvif->ar;
+	struct ieee80211_mgmt *mgmt;
+	const u8 *p2p_ie;
+	int ret;
+
+	mgmt = (void *)bcn->data;
+	p2p_ie = cfg80211_find_vendor_ie(WLAN_OUI_WFA, WLAN_OUI_TYPE_WFA_P2P,
+					 mgmt->u.beacon.variable,
+					 bcn->len - (mgmt->u.beacon.variable -
+						     bcn->data));
+	if (!p2p_ie) {
+		ath12k_warn(ar->ab, "no P2P ie found in beacon\n");
+		return -ENOENT;
+	}
+
+	ret = ath12k_wmi_p2p_go_bcn_ie(ar, arvif->vdev_id, p2p_ie);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit P2P GO bcn ie for vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
+				       u8 oui_type, size_t ie_offset)
+{
+	size_t len;
+	const u8 *next;
+	const u8 *end;
+	u8 *ie;
+
+	if (WARN_ON(skb->len < ie_offset))
+		return -EINVAL;
+
+	ie = (u8 *)cfg80211_find_vendor_ie(oui, oui_type,
+					   skb->data + ie_offset,
+					   skb->len - ie_offset);
+	if (!ie)
+		return -ENOENT;
+
+	len = ie[1] + 2;
+	end = skb->data + skb->len;
+	next = ie + len;
+
+	if (WARN_ON(next > end))
+		return -EINVAL;
+
+	memmove(ie, next, end - next);
+	skb_trim(skb, skb->len - len);
+
+	return 0;
+}
+
 static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 {
 	struct ath12k *ar = arvif->ar;
@@ -1170,14 +1228,37 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 				    ies, (skb_tail_pointer(bcn) - ies)))
 		arvif->wpaie_present = true;
 
-	ret = ath12k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
+	if (arvif->vif->type == NL80211_IFTYPE_AP && arvif->vif->p2p) {
+		ret = ath12k_mac_setup_bcn_p2p_ie(arvif, bcn);
+		if (ret) {
+			ath12k_warn(ab, "failed to setup P2P GO bcn ie: %d\n",
+				    ret);
+			goto free_bcn_skb;
+		}
 
-	kfree_skb(bcn);
+		/* P2P IE is inserted by firmware automatically (as
+		 * configured above) so remove it from the base beacon
+		 * template to avoid duplicate P2P IEs in beacon frames.
+		 */
+		ret = ath12k_mac_remove_vendor_ie(bcn, WLAN_OUI_WFA,
+						  WLAN_OUI_TYPE_WFA_P2P,
+						  offsetof(struct ieee80211_mgmt,
+							   u.beacon.variable));
+		if (ret) {
+			ath12k_warn(ab, "failed to remove P2P vendor ie: %d\n",
+				    ret);
+			goto free_bcn_skb;
+		}
+	}
+
+	ret = ath12k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
 
 	if (ret)
 		ath12k_warn(ab, "failed to submit beacon template command: %d\n",
 			    ret);
 
+free_bcn_skb:
+	kfree_skb(bcn);
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d8ebaf4b8359..98c27954f04f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1713,6 +1713,45 @@ int ath12k_wmi_send_bcn_offload_control_cmd(struct ath12k *ar,
 	return ret;
 }
 
+int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
+			     const u8 *p2p_ie)
+{
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct wmi_p2p_go_set_beacon_ie_cmd *cmd;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	void *ptr;
+	int ret, len;
+	size_t p2p_ie_len = p2p_ie[1] + 2;
+	size_t aligned_len = roundup(p2p_ie_len, sizeof(u32));
+
+	len = sizeof(*cmd) + TLV_HDR_SIZE + aligned_len;
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+	ptr = skb->data;
+	cmd = ptr;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_P2P_GO_SET_BEACON_IE,
+						 sizeof(*cmd));
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->ie_buf_len = cpu_to_le32(p2p_ie_len);
+
+	ptr = skb->data + sizeof(*cmd);
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_ARRAY_BYTE,
+					     aligned_len);
+	memcpy(tlv->value, p2p_ie, p2p_ie_len);
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_P2P_GO_SET_BEACON_IE);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to send WMI_P2P_GO_SET_BEACON_IE\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
 int ath12k_wmi_bcn_tmpl(struct ath12k *ar, u32 vdev_id,
 			struct ieee80211_mutable_offsets *offs,
 			struct sk_buff *bcn)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 4afc6ca15c91..b017e36e1d85 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_WMI_H
@@ -3506,6 +3506,12 @@ struct wmi_bcn_tmpl_cmd {
 	__le32 esp_ie_offset;
 } __packed;
 
+struct wmi_p2p_go_set_beacon_ie_cmd {
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 ie_buf_len;
+} __packed;
+
 struct wmi_vdev_install_key_cmd {
 	__le32 tlv_header;
 	__le32 vdev_id;
@@ -4809,6 +4815,8 @@ int ath12k_wmi_cmd_send(struct ath12k_wmi_pdev *wmi, struct sk_buff *skb,
 struct sk_buff *ath12k_wmi_alloc_skb(struct ath12k_wmi_base *wmi_sc, u32 len);
 int ath12k_wmi_mgmt_send(struct ath12k *ar, u32 vdev_id, u32 buf_id,
 			 struct sk_buff *frame);
+int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
+			     const u8 *p2p_ie);
 int ath12k_wmi_bcn_tmpl(struct ath12k *ar, u32 vdev_id,
 			struct ieee80211_mutable_offsets *offs,
 			struct sk_buff *bcn);
-- 
2.34.1


