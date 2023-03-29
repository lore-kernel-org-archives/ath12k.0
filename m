Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEA3C77B60
	for <ath12k@archiver.kernel.org>; Wed, 29 Mar 2023 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75K5w2eNXybFzqZ6KSVzv+B6YcvaN5JyCOIYBlcuFn4=; b=g49+lSMxxjtX6v
	w6jGCKpLFE5fmC+f/64F6Hf/Pn5RAIa7784nEdWeQrV0Dqt2G9dWNgiY03Gn6i31Wo7oB5gNw1qhp
	ZC9AMp3Ot33j7A3fmz9lc8y/WZBdaRcOkcCKDKDNJiLrCnvvudSZRftEn8A+30tnZroEjfXyO8wD0
	ZsluokUjfd5UXaCoTG9geDfnyxSLa94+ILZEqttosled4sJQqKvPYQ7nMdZztk7Ap6xZrqsxQpSmK
	Cef6FLL1R58yRQ01vTaB8KLP+QgJJEgTpP2LnVdHsGxydB7dw0O6VdZHpccXIBpV4RkUQ1aPTwmq6
	jxc21gMvuqJ1MUy6tvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phexY-0021x9-1z
	for ath12k@archiver.kernel.org;
	Wed, 29 Mar 2023 23:12:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phexW-0021vr-0v
	for ath12k@lists.infradead.org;
	Wed, 29 Mar 2023 23:12:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TMLVY8026091;
	Wed, 29 Mar 2023 23:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Qj7c220vJ618wpTIChYJoMDQlypWQ3oJe0Bgzjh0zoY=;
 b=CWEmZF7kAGFk7AXq+4bs27nuji9J9ueEvOhtUrKW85vTznmZdQAJhH59V27NjIvbaPVP
 gbS2lFpKVpn9kFmZVAZN01NAzZMpppTNxdpDWQm0pMrm+erVOpkdQLCIEb5K8kiOIfPg
 LgTXFXGnNa0EjSW/xvPqVUTULXAWnLcRXRS7a3tZ5cRxc3cK8efqeF8sluEEmzpngDlQ
 7rUBu0pjsVHKBfzIXofbrHDVHvucBXJ/+FVLc1yWy40nJ/R/3AqX3hk+/A3Bn+HXBG/s
 4Ua8YrM1eEbBfoflFkZlcgu/88l7ScoiI78f7GFPpkNlJwdcHQoOuX7ybl6G34dpVBCg pQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmq1wsbup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 23:12:01 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNBwDd003370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 23:11:59 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:11:58 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH 03/11] wifi: ath12k: process EHT capabilities from target
Date: Wed, 29 Mar 2023 16:11:37 -0700
Message-ID: <20230329231145.20171-4-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230329231145.20171-1-quic_alokad@quicinc.com>
References: <20230329231145.20171-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XwRb7vj-Vh9W5l4lBxp825IABpCItz5m
X-Proofpoint-GUID: XwRb7vj-Vh9W5l4lBxp825IABpCItz5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=847 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_161202_442163_1729DC4E 
X-CRM114-Status: GOOD (  22.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Add WMI support to process the EHT capabilities passed by the
hardware. Add required EHT specific definitions in
structures ath12k_band_cap and ath12k_wmi_svc_rdy_ext_parse.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   8 ++
 drivers/net/wireless/ath/ath12k/wmi.c  | 112 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  38 +++++++++
 3 files changed, 158 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 9439052a652e..ed21dd78a2b9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -579,6 +579,14 @@ struct ath12k_band_cap {
 	u32 he_cap_phy_info[PSOC_HOST_MAX_PHY_SIZE];
 	struct ath12k_wmi_ppe_threshold_arg he_ppet;
 	u16 he_6ghz_capa;
+	u32 eht_cap_mac_info[WMI_MAX_EHTCAP_MAC_SIZE];
+	u32 eht_cap_phy_info[WMI_MAX_EHTCAP_PHY_SIZE];
+	u32 eht_mcs_20_only;
+	u32 eht_mcs_80;
+	u32 eht_mcs_160;
+	u32 eht_mcs_320;
+	struct ath12k_wmi_ppe_threshold_arg eht_ppet;
+	u32 eht_cap_info_internal;
 };
 
 struct ath12k_pdev_cap {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7ae0bb78b2b5..89c3bf759bd4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -65,6 +65,8 @@ struct ath12k_wmi_svc_rdy_ext_parse {
 struct ath12k_wmi_svc_rdy_ext2_parse {
 	struct ath12k_wmi_dma_ring_caps_parse dma_caps_parse;
 	bool dma_ring_cap_done;
+	bool spectral_bin_scaling_done;
+	bool mac_phy_caps_ext_done;
 };
 
 struct ath12k_wmi_rdy_parse {
@@ -4034,6 +4036,100 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 	return ret;
 }
 
+static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
+				      __le32 cap_mac_info[],
+				      __le32 cap_phy_info[],
+				      __le32 supp_mcs[],
+				      struct ath12k_wmi_ppe_threshold_params *ppet,
+				       __le32 cap_info_internal)
+{
+	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
+	u8 i;
+
+	for (i = 0; i < WMI_MAX_EHTCAP_MAC_SIZE; i++)
+		cap_band->eht_cap_mac_info[i] = le32_to_cpu(cap_mac_info[i]);
+
+	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
+		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
+
+	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
+	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);
+	if (band != NL80211_BAND_2GHZ) {
+		cap_band->eht_mcs_160 = le32_to_cpu(supp_mcs[2]);
+		cap_band->eht_mcs_320 = le32_to_cpu(supp_mcs[3]);
+	}
+
+	cap_band->eht_ppet.numss_m1 = le32_to_cpu(ppet->numss_m1);
+	cap_band->eht_ppet.ru_bit_mask = le32_to_cpu(ppet->ru_info);
+	for (i = 0; i < WMI_MAX_NUM_SS; i++)
+		cap_band->eht_ppet.ppet16_ppet8_ru3_ru0[i] =
+			le32_to_cpu(ppet->ppet16_ppet8_ru3_ru0[i]);
+
+	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
+}
+
+static int ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
+						 struct ath12k_wmi_mac_phy_caps_ext_params *caps,
+						 struct ath12k_pdev *pdev)
+{
+	if (pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP) {
+		ath12k_wmi_eht_caps_parse(pdev, NL80211_BAND_2GHZ,
+					  caps->eht_cap_mac_info_2ghz,
+					  caps->eht_cap_phy_info_2ghz,
+					  caps->eht_supp_mcs_ext_2ghz,
+					  &caps->eht_ppet_2ghz,
+					  caps->eht_cap_info_internal);
+	}
+
+	if (pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP) {
+		ath12k_wmi_eht_caps_parse(pdev, NL80211_BAND_5GHZ,
+					  caps->eht_cap_mac_info_5ghz,
+					  caps->eht_cap_phy_info_5ghz,
+					  caps->eht_supp_mcs_ext_5ghz,
+					  &caps->eht_ppet_5ghz,
+					  caps->eht_cap_info_internal);
+
+		ath12k_wmi_eht_caps_parse(pdev, NL80211_BAND_6GHZ,
+					  caps->eht_cap_mac_info_5ghz,
+					  caps->eht_cap_phy_info_5ghz,
+					  caps->eht_supp_mcs_ext_5ghz,
+					  &caps->eht_ppet_5ghz,
+					  caps->eht_cap_info_internal);
+	}
+
+	return 0;
+}
+
+static int ath12k_wmi_tlv_mac_phy_caps_ext(struct ath12k_base *ab, u16 tag,
+					   u16 len, const void *ptr,
+					   void *data)
+{
+	struct ath12k_wmi_mac_phy_caps_ext_params *caps =
+			(struct ath12k_wmi_mac_phy_caps_ext_params *)ptr;
+	int i, ret;
+
+	if (tag != WMI_TAG_MAC_PHY_CAPABILITIES_EXT)
+		return -EPROTO;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		if (ab->pdevs[i].pdev_id == le32_to_cpu(caps->pdev_id))
+			break;
+	}
+
+	if (i == ab->num_radios)
+		return -EINVAL;
+
+	ret = ath12k_wmi_tlv_mac_phy_caps_ext_parse(ab, caps, &ab->pdevs[i]);
+	if (ret) {
+		ath12k_warn(ab,
+			    "failed to extract mac phy caps ext, pdev_id:%d\n",
+			    ab->pdevs[i].pdev_id);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
@@ -4050,6 +4146,22 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 				return ret;
 
 			parse->dma_ring_cap_done = true;
+		} else if (!parse->spectral_bin_scaling_done) {
+			/* TODO: This is a place-holder as WMI tag for
+			 * spectral scaling is before
+			 * WMI_TAG_MAC_PHY_CAPABILITIES_EXT
+			 */
+			parse->spectral_bin_scaling_done = true;
+		} else if (!parse->mac_phy_caps_ext_done) {
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_mac_phy_caps_ext,
+						  parse);
+			if (ret) {
+				ath12k_warn(ab, "failed to parse tlv %d\n", ret);
+				return ret;
+			}
+
+			parse->mac_phy_caps_ext_done = true;
 		}
 		break;
 	default:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 08a8c9e0f59f..fa513a24bca4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2577,6 +2577,44 @@ struct ath12k_wmi_soc_hal_reg_caps_params {
 	__le32 num_phy;
 } __packed;
 
+#define WMI_MAX_EHTCAP_MAC_SIZE  2
+#define WMI_MAX_EHTCAP_PHY_SIZE  3
+
+/* Used for EHT MCS-NSS array. Data at each array index follows the format given
+ * in IEEE P802.11be/D2.0, May 20229.4.2.313.4.
+ *
+ * Index interpretation:
+ * 0 - 20 MHz only sta, all 4 bytes valid
+ * 1 - index for bandwidths <= 80 MHz except 20 MHz-only, first 3 bytes valid
+ * 2 - index for 160 MHz, first 3 bytes valid
+ * 3 - index for 320 MHz, first 3 bytes valid
+ */
+#define WMI_MAX_EHT_SUPP_MCS_2G_SIZE  2
+#define WMI_MAX_EHT_SUPP_MCS_5G_SIZE  4
+
+struct ath12k_wmi_mac_phy_caps_ext_params {
+	__le32 hw_mode_id;
+	union {
+		struct {
+			__le16 pdev_id;
+			__le16 hw_link_id;
+		} __packed ath12k_wmi_pdev_to_link_map;
+		__le32 pdev_id;
+	};
+	__le32 phy_id;
+	__le32 wireless_modes_ext;
+	__le32 eht_cap_mac_info_2ghz[WMI_MAX_EHTCAP_MAC_SIZE];
+	__le32 eht_cap_mac_info_5ghz[WMI_MAX_EHTCAP_MAC_SIZE];
+	__le32 rsvd0[2];
+	__le32 eht_cap_phy_info_2ghz[WMI_MAX_EHTCAP_PHY_SIZE];
+	__le32 eht_cap_phy_info_5ghz[WMI_MAX_EHTCAP_PHY_SIZE];
+	struct ath12k_wmi_ppe_threshold_params eht_ppet_2ghz;
+	struct ath12k_wmi_ppe_threshold_params eht_ppet_5ghz;
+	__le32 eht_cap_info_internal;
+	__le32 eht_supp_mcs_ext_2ghz[WMI_MAX_EHT_SUPP_MCS_2G_SIZE];
+	__le32 eht_supp_mcs_ext_5ghz[WMI_MAX_EHT_SUPP_MCS_5G_SIZE];
+} __packed;
+
 /* 2 word representation of MAC addr */
 struct ath12k_wmi_mac_addr_params {
 	u8 addr[ETH_ALEN];
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
