Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483F8C41513
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 23:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oV58GTcdEXBlqVRRFPaVMfUhg2llaS+4R0NrvgKiSuI=; b=OlUMF93/ijiW+a
	fRymoHyCAx+K1NEgNnHiA0yLKyAP3+rcQ9i3VS32PaFaZZNn6tUCb3gxES0+oIcqog6jBCpakXrS1
	owCxoZAXmQBZWAljqgl4D136NwxEHwRKMoB2/37LjJxHcgm32vMmJUkbTDmbSVQGjCrbHQNG7YMsI
	Ey1nYGnhoSOvHfBF7C5Ol4FroqALGsfpND+GbMlZGPr/JjdJSG/EXWgvIG2c5lGe7YNrmCmMVAp3v
	f/OcB2hap32ko5ACjs+1ihb5IE8l3Splwa7/gFEeuQ1qlRwUZMEXxaMqtNTL9/wT+jbad17bVuNvD
	bhT4rfezDoxjZlhsA6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qORie-008jft-03
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 23:45:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOQhz-008ejn-1m
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 22:40:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PLvP6v001479;
	Tue, 25 Jul 2023 22:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=nVq/yDVviJZ8EO7xnjEYYftIAFsPnhn9YWAtyyE6ruo=;
 b=KwCBfWruyGEgAQrLuoIMvxWmpHIlDABdffIGylUc/KyO4YYcYT9JHx5GgPHGpq8yMzwf
 nnmd3SeAST88Gq5QDgtgemMb3T+AryQgB9RK/FjS7UwN35TxHUlk1PXEHp/+oiD2e38g
 zY4UshJaL0kUVGU9kAxtIOcoBujd/ZJI4/Z+CKUWpl69XDq/wFL4QUtLnWfwAW746BS/
 yTI4aqblHfKy/aHNffkCU/88sY5tLlrZONrZkhDzFpMzzHzkB3/9lNCmjKHJrc2U8XLT
 qZf3KJahZ3b5JTznxh+gl/RiJ9NuHTJ7TCao3RTFp8g1GsT1lWXXfW91H4dW+Bpsmyaf Sw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s29xmhxs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PMekPs028364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:46 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 15:40:45 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>
Subject: [PATCH v5 03/11] wifi: ath12k: WMI support to process EHT capabilities
Date: Tue, 25 Jul 2023 15:40:26 -0700
Message-ID: <20230725224034.14045-4-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230725224034.14045-1-quic_alokad@quicinc.com>
References: <20230725224034.14045-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VFt8y4Zw621xkokO7VWSv-aEv9OZO5DE
X-Proofpoint-GUID: VFt8y4Zw621xkokO7VWSv-aEv9OZO5DE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_154047_596336_6787E1E8 
X-CRM114-Status: GOOD (  27.77  )
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

Add WMI support to process the EHT capabilities passed by
the firmware. Add required EHT specific definitions in
structures ath12k_band_cap and ath12k_wmi_svc_rdy_ext_parse.

For single_pdev chip such as WCN7850, only one pdev is created
and only one hardware is registered to mac80211. This one pdev
manages both 2.4 GHz radio and 5 GHz/6 GHz radio.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v5: Added comments for structures ath12k_pdev and ath12k_fw_pdev
v4: Add support for WCN7850.
v3: No change from v2.
v2: Changed 'target' to 'firmware' in the description.

 drivers/net/wireless/ath/ath12k/core.h |  23 ++++
 drivers/net/wireless/ath/ath12k/wmi.c  | 147 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  38 +++++++
 3 files changed, 208 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2f93296db792..0a5292f14ad2 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -580,6 +580,14 @@ struct ath12k_band_cap {
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
@@ -614,6 +622,12 @@ struct ath12k_pdev {
 	struct mlo_timestamp timestamp;
 };
 
+struct ath12k_fw_pdev {
+	u32 pdev_id;
+	u32 phy_id;
+	u32 supported_bands;
+};
+
 struct ath12k_board_data {
 	const struct firmware *fw;
 	const void *data;
@@ -669,7 +683,16 @@ struct ath12k_base {
 	struct mutex core_lock;
 	/* Protects data like peers */
 	spinlock_t base_lock;
+	/* Single pdev device - firmware maintains data for all bands
+	 * but advertises a single phy to the host which is stored as
+	 * a single element in this array.
+	 * Other devices - this array will contain as many elements as
+	 * the number of radios.
+	 */
 	struct ath12k_pdev pdevs[MAX_RADIOS];
+	/* Only single pdev devices use this to store phy specific data  */
+	struct ath12k_fw_pdev fw_pdev[MAX_RADIOS];
+	u8 fw_pdev_count;
 	struct ath12k_pdev __rcu *pdevs_active[MAX_RADIOS];
 	struct ath12k_wmi_hal_reg_capabilities_ext_arg hal_reg_cap[MAX_RADIOS];
 	unsigned long long free_vdev_map;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 6512267ae4ca..62700a61e084 100644
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
@@ -445,8 +447,10 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	const struct ath12k_wmi_soc_mac_phy_hw_mode_caps_params *hw_caps = svc->hw_caps;
 	const struct ath12k_wmi_hw_mode_cap_params *wmi_hw_mode_caps = svc->hw_mode_caps;
 	const struct ath12k_wmi_mac_phy_caps_params *wmi_mac_phy_caps = svc->mac_phy_caps;
+	struct ath12k_base *ab = wmi_handle->wmi_ab->ab;
 	struct ath12k_band_cap *cap_band;
 	struct ath12k_pdev_cap *pdev_cap = &pdev->cap;
+	struct ath12k_fw_pdev *fw_pdev;
 	u32 phy_map;
 	u32 hw_idx, phy_idx = 0;
 	int i;
@@ -475,6 +479,12 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	pdev_cap->supported_bands |= le32_to_cpu(mac_caps->supported_bands);
 	pdev_cap->ampdu_density = le32_to_cpu(mac_caps->ampdu_density);
 
+	fw_pdev = &ab->fw_pdev[ab->fw_pdev_count];
+	fw_pdev->supported_bands = le32_to_cpu(mac_caps->supported_bands);
+	fw_pdev->pdev_id = le32_to_cpu(mac_caps->pdev_id);
+	fw_pdev->phy_id = le32_to_cpu(mac_caps->phy_id);
+	ab->fw_pdev_count++;
+
 	/* Take non-zero tx/rx chainmask. If tx/rx chainmask differs from
 	 * band to band for a single radio, need to see how this should be
 	 * handled.
@@ -3811,6 +3821,7 @@ static int ath12k_wmi_ext_soc_hal_reg_caps_parse(struct ath12k_base *soc,
 
 	soc->num_radios = 0;
 	phy_id_map = le32_to_cpu(svc_rdy_ext->pref_hw_mode_caps.phy_id_map);
+	soc->fw_pdev_count = 0;
 
 	while (phy_id_map && soc->num_radios < MAX_RADIOS) {
 		ret = ath12k_pull_mac_phy_cap_svc_ready_ext(wmi_handle,
@@ -4038,6 +4049,125 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 	return ret;
 }
 
+static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
+				      const __le32 cap_mac_info[],
+				      const __le32 cap_phy_info[],
+				      const __le32 supp_mcs[],
+				      const struct ath12k_wmi_ppe_threshold_params *ppet,
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
+static int
+ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
+				      const struct ath12k_wmi_caps_ext_params *caps,
+				      struct ath12k_pdev *pdev)
+{
+	u32 bands;
+	int i;
+
+	if (ab->hw_params->single_pdev_only) {
+		for (i = 0; i < ab->fw_pdev_count; i++) {
+			struct ath12k_fw_pdev *fw_pdev = &ab->fw_pdev[i];
+
+			if (fw_pdev->pdev_id == le32_to_cpu(caps->pdev_id) &&
+			    fw_pdev->phy_id == le32_to_cpu(caps->phy_id)) {
+				bands = fw_pdev->supported_bands;
+				break;
+			}
+		}
+
+		if (i == ab->fw_pdev_count)
+			return -EINVAL;
+	} else {
+		bands = pdev->cap.supported_bands;
+	}
+
+	if (bands & WMI_HOST_WLAN_2G_CAP) {
+		ath12k_wmi_eht_caps_parse(pdev, NL80211_BAND_2GHZ,
+					  caps->eht_cap_mac_info_2ghz,
+					  caps->eht_cap_phy_info_2ghz,
+					  caps->eht_supp_mcs_ext_2ghz,
+					  &caps->eht_ppet_2ghz,
+					  caps->eht_cap_info_internal);
+	}
+
+	if (bands & WMI_HOST_WLAN_5G_CAP) {
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
+	const struct ath12k_wmi_caps_ext_params *caps = ptr;
+	int i = 0, ret;
+
+	if (tag != WMI_TAG_MAC_PHY_CAPABILITIES_EXT)
+		return -EPROTO;
+
+	if (ab->hw_params->single_pdev_only) {
+		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id))
+			return 0;
+	} else {
+		for (i = 0; i < ab->num_radios; i++) {
+			if (ab->pdevs[i].pdev_id == le32_to_cpu(caps->pdev_id))
+				break;
+		}
+
+		if (i == ab->num_radios)
+			return -EINVAL;
+	}
+
+	ret = ath12k_wmi_tlv_mac_phy_caps_ext_parse(ab, caps, &ab->pdevs[i]);
+	if (ret) {
+		ath12k_warn(ab,
+			    "failed to parse extended MAC PHY capabilities for pdev %d: %d\n",
+			    ret, ab->pdevs[i].pdev_id);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
@@ -4054,6 +4184,23 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
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
+				ath12k_warn(ab, "failed to parse extended MAC PHY capabilities WMI TLV: %d\n",
+					    ret);
+				return ret;
+			}
+
+			parse->mac_phy_caps_ext_done = true;
 		}
 		break;
 	default:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index d89c12bfb009..27f9ce4462a9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2581,6 +2581,44 @@ struct ath12k_wmi_soc_hal_reg_caps_params {
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
+struct ath12k_wmi_caps_ext_params {
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
