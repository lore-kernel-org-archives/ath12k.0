Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155D1C25B74
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lcHP3Pxxs96DsAyQjqeg6rPhCycvVWs09gFcTpgDP8=; b=OziVtLxyaYxHo52oKSw/+VQE5J
	+hdyJQXrBvpEKXkObdRXZJ/pU/devjREuT9c65g3lL9f1gaX6PBv5gu9TJsxdDWK/MgJ7tZKlw+41
	ITcj3aBiC2f6NOPId8vIbgBXQYHQogeQ1rKpf/Vy4mzcQZiXSGUTuq3pwgzQUjMq5JBd2r/j4/x9u
	XxMjdVBmnOHEGKynFwM4V3gdZAW6/L8VrCR9O1uB9aAXwJd8mmHXZfDscTsoLIrOLiwskM+kYYlVV
	zr98qQBpv9Xv4YHR09PUKDTYvX9SRsDd7l0DvvdVoYIoH7wyAh1tt3kV2HQ0QpQzIu3djhn6xc92z
	taDtRKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nv2-0000000GtSl-1ZwP
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 20:29:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nuv-0000000GtNY-2mIr
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 20:29:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448CWWcG019868;
	Wed, 8 May 2024 20:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2lcHP3Pxxs96DsAyQjqeg6rPhCycvVWs09gFcTpgDP8=; b=X5
	0GK1gCfCNU7+m9mkQC+VC/iUKt9xaNuSh269RSBKoY9daMIv+NtQZBMRZi19P9+w
	4ROsoCwsydzpIqb1kxOzvNE/plQfXq0kph2VYEz5D9eAD2Y8NjhpB2tIDlJkPNA6
	hSE343JRtPkErBBNTmmC+wJIHS0L9rdYox5XmnFOpWB5ppjfXRV7C/4FgrJTGuew
	YlXznesc7O1hANlJ798oHCsoyWf/YxjsOh15fPUMp+kHW28aDNsVIcEn7n7yWTh9
	8qgbegDhx1/eRLPjsQqKpmNb8Y6mxLFJomkFF4ofA60dWgmgLNq0Hb0UYqMI+Fjx
	xdpJKInN55yYdOVf8eAA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09g5h2gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:29:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448KTPj1023165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:29:25 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 13:29:25 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH v2 7/9] wifi: ath12k: add MBSSID beacon support
Date: Wed, 8 May 2024 13:29:10 -0700
Message-ID: <20240508202912.11902-8-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240508202912.11902-1-quic_alokad@quicinc.com>
References: <20240508202912.11902-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9yaBAV1RYvLMiimzz702RiHV76KE9xTF
X-Proofpoint-GUID: 9yaBAV1RYvLMiimzz702RiHV76KE9xTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_132933_815472_B3DC60BA 
X-CRM114-Status: GOOD (  21.23  )
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

- A single beacon template is used for one multiple BSSID group as
only one interface from group transmits the beacons. But firmware
requires the host to send this template each time a nontransmitted
interface is brought up. Hence, modify existing logic to retrieve
the template from vif context of the transmitting interface. Also,
firmware crashes if host sends a template for a nontransmitted
interface which is already up, add a check to avoid this.
- Set rsnie_present and wpaie_present fields for nontransmitted VAPs.
- Send offset to the multiple BSSID element in the beacon template
firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 97 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c |  1 +
 2 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9391bea86050..ef591b1b0c48 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1295,11 +1295,14 @@ static int ath12k_mac_remove_vendor_ie(struct sk_buff *skb, unsigned int oui,
 	return 0;
 }
 
-static void ath12k_mac_set_arvif_ies(struct ath12k_vif *arvif, struct sk_buff *bcn)
+static void ath12k_mac_set_arvif_ies(struct ath12k_vif *arvif, struct sk_buff *bcn,
+				     u8 bssid_index, bool *nontx_profile_found)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)bcn->data;
+	const struct element *elem, *nontx, *index, *nie;
 	const u8 *start, *tail;
 	u16 rem_len;
+	u8 i;
 
 	start = bcn->data + ieee80211_get_hdrlen_from_skb(bcn) + sizeof(mgmt->u.beacon);
 	tail = skb_tail_pointer(bcn);
@@ -1313,28 +1316,114 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_vif *arvif, struct sk_buff *b
 	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT, WLAN_OUI_TYPE_MICROSOFT_WPA,
 				    start, rem_len))
 		arvif->wpaie_present = true;
+
+	/* Return from here for the transmitted profile */
+	if (!bssid_index)
+		return;
+
+	/* Initial rsnie_present for the nontransmitted profile is set to be same as that
+	 * of the transmitted profile. It will be changed if security configurations are
+	 * different.
+	 */
+	*nontx_profile_found = false;
+	for_each_element_id(elem, WLAN_EID_MULTIPLE_BSSID, start, rem_len) {
+		/* Fixed minimum MBSSID element length with at least one
+		 * nontransmitted BSSID profile is 12 bytes as given below;
+		 * 1 (max BSSID indicator) +
+		 * 2 (Nontransmitted BSSID profile: Subelement ID + length) +
+		 * 4 (Nontransmitted BSSID Capabilities: tag + length + info)
+		 * 2 (Nontransmitted BSSID SSID: tag + length)
+		 * 3 (Nontransmitted BSSID Index: tag + length + BSSID index
+		 */
+		if (elem->datalen < 12 || elem->data[0] < 1)
+			continue; /* Max BSSID indicator must be >=1 */
+
+		for_each_element(nontx, elem->data + 1, elem->datalen - 1) {
+			start = nontx->data;
+
+			if (nontx->id != 0 || nontx->datalen < 4)
+				continue; /* Invalid nontransmitted profile */
+
+			if (nontx->data[0] != WLAN_EID_NON_TX_BSSID_CAP ||
+			    nontx->data[1] != 2) {
+				continue; /* Missing nontransmitted BSS capabilities */
+			}
+
+			if (nontx->data[4] != WLAN_EID_SSID)
+				continue; /* Missing SSID for nontransmitted BSS */
+
+			index = cfg80211_find_elem(WLAN_EID_MULTI_BSSID_IDX,
+						   start, nontx->datalen);
+			if (!index || index->datalen < 1 || index->data[0] == 0)
+				continue; /* Invalid MBSSID Index element */
+
+			if (index->data[0] == bssid_index) {
+				*nontx_profile_found = true;
+				if (cfg80211_find_ie(WLAN_EID_RSN,
+						     nontx->data,
+						     nontx->datalen)) {
+					arvif->rsnie_present = true;
+					return;
+				} else if (!arvif->rsnie_present) {
+					return; /* Both tx and nontx BSS are open */
+				}
+
+				nie = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
+							     nontx->data,
+							     nontx->datalen);
+				if (!nie || nie->datalen < 2)
+					return; /* Invalid non-inheritance element */
+
+				for (i = 1; i < nie->datalen - 1; i++) {
+					if (nie->data[i] == WLAN_EID_RSN) {
+						arvif->rsnie_present = false;
+						break;
+					}
+				}
+
+				return;
+			}
+		}
+	}
 }
 
 static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 {
+	struct ath12k_vif *tx_arvif = arvif;
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_base *ab = ar->ab;
-	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
+	bool nontx_profile_found = false;
 	struct sk_buff *bcn;
 	int ret;
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
 		return 0;
 
-	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
+	if (vif->mbssid_tx_vif) {
+		tx_arvif = ath12k_vif_to_arvif(vif->mbssid_tx_vif);
+		if (tx_arvif != arvif && arvif->is_up)
+			return 0;
+	}
+
+	bcn = ieee80211_beacon_get_template(ath12k_ar_to_hw(tx_arvif->ar), tx_arvif->vif,
+					    &offs, 0);
 	if (!bcn) {
 		ath12k_warn(ab, "failed to get beacon template from mac80211\n");
 		return -EPERM;
 	}
 
-	ath12k_mac_set_arvif_ies(arvif, bcn);
+	if (tx_arvif == arvif) {
+		ath12k_mac_set_arvif_ies(arvif, bcn, 0, NULL);
+	} else {
+		ath12k_mac_set_arvif_ies(arvif, bcn,
+					 arvif->vif->bss_conf.bssid_index,
+					 &nontx_profile_found);
+		if (!nontx_profile_found)
+			ath12k_warn(ab,
+				    "nontransmitted profile not found in beacon template\n");
+	}
 
 	if (arvif->vif->type == NL80211_IFTYPE_AP && arvif->vif->p2p) {
 		ret = ath12k_mac_setup_bcn_p2p_ie(arvif, bcn);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 1c179b218144..b328005f995f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1813,6 +1813,7 @@ int ath12k_wmi_bcn_tmpl(struct ath12k *ar, u32 vdev_id,
 	cmd->csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[0]);
 	cmd->ext_csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[1]);
 	cmd->buf_len = cpu_to_le32(bcn->len);
+	cmd->mbssid_ie_offset = cpu_to_le32(offs->mbssid_off);
 
 	ptr = skb->data + sizeof(*cmd);
 
-- 
2.39.0


