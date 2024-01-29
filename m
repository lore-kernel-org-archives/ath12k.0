Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8462C47422
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpgZvJJ3UhK+6M5+KnAIKLD9Bzn4RZG+3OKQBYn0IhM=; b=n3NK4r99HlzihIlVvEddaQLyvJ
	czunnv4bRCiJSVdaUPXiZHGJyOtrdl+Yb/7yvMgjjFM/C05dF95bBwANv2NruY31mM+LRS9Nf6v63
	pkR4KvjL3bOtXkqUMjsaTm333GM0eaihuXyLxqljm/0GYMauoFSfFNKmV25gkRG4x/jBuBAAHqiOV
	kc0s4jK+/HvCbmG1vpUgrwXp7minunBjZ0Umho9/Cig2VyGoOGo5QPO4UtFzWTJWiunGvzg0H5Wqh
	qq2akb3NKOwf2dvh0tpdSYezA45qV5HqPWcUR370KKaeLNs5yF1ST1vZVvqPNmRWXFSSZmnRVd28k
	cfIlLPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULaf-0000000BYxX-1FZa
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 06:57:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULaa-0000000BYvr-3UzC
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 06:57:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T3VFGp032499;
	Mon, 29 Jan 2024 06:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=fpgZvJJ3UhK+6M5+KnAIKLD9Bzn4RZG+3OKQBYn0IhM=; b=SK
	MVKTAbwjCsLE52aE3ylor9RMNGZ11zOD2Y0fLxhbPH5NF3VechTOKbBpY0QN8wws
	ZArqAo5GVbdcOWIsC5FV8gLqInRtWOk1alo9MkaOocy/CMVPPJIeMn7JMbYVl1LV
	EYLqMqOj5hWaQM7n5++Gi2DRBYTQ4QPtyAI2LAwlNAFPRh4ITVwy3X95zVmpwC65
	b+KV1CrIxlHqnxyirK/YvvYYe6Y6BS+WQac2keoTkeop+kGP82s8zLoydTlohY1x
	0G+WmcZv2kgT3FTvGyIVwuro5U4HfPNMdidBGGAwCsm/GGVdnbJ4bvnMoSc0HvMC
	2edq05Mm7yPepNPa9W6A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx275gf6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:57:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T6voM1008765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:57:50 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 28 Jan 2024 22:57:49 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 02/13] wifi: ath12k: fetch correct pdev id from WMI_SERVICE_READY_EXT_EVENTID
Date: Mon, 29 Jan 2024 12:27:13 +0530
Message-ID: <20240129065724.2310207-3-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aV2fiIAi25raEk3Wonmw5PRQJHmw9GCO
X-Proofpoint-GUID: aV2fiIAi25raEk3Wonmw5PRQJHmw9GCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_03,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 mlxlogscore=863 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_225753_048686_4184F951 
X-CRM114-Status: GOOD (  15.44  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Currently while fetching for pdev id from WMI_SERVICE_READY_EXT_EVENTID
we consider 32 bit pdev_id in ath12k_wmi_caps_ext_params structure. But
Firmware sends lower 16 bit for pdev id along with higher 16 bit for
hw_link_id. Due to this wrong pdev id is fetched. This wrong pdev id
when used for WMI commands leads to Firmware crash.

Hence fetch the correct pdev id considering only the lower 16 bits.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c |  9 +++---
 drivers/net/wireless/ath/ath12k/wmi.h | 44 ++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 5f1cce16589f..487ca82bd17d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -493,13 +493,13 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 
 	mac_caps = wmi_mac_phy_caps + phy_idx;
 
-	pdev->pdev_id = le32_to_cpu(mac_caps->pdev_id);
+	pdev->pdev_id = ath12k_wmi_mac_phy_get_pdev_id(mac_caps);
 	pdev_cap->supported_bands |= le32_to_cpu(mac_caps->supported_bands);
 	pdev_cap->ampdu_density = le32_to_cpu(mac_caps->ampdu_density);
 
 	fw_pdev = &ab->fw_pdev[ab->fw_pdev_count];
 	fw_pdev->supported_bands = le32_to_cpu(mac_caps->supported_bands);
-	fw_pdev->pdev_id = le32_to_cpu(mac_caps->pdev_id);
+	fw_pdev->pdev_id = ath12k_wmi_mac_phy_get_pdev_id(mac_caps);
 	fw_pdev->phy_id = le32_to_cpu(mac_caps->phy_id);
 	ab->fw_pdev_count++;
 
@@ -4215,7 +4215,7 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 		for (i = 0; i < ab->fw_pdev_count; i++) {
 			struct ath12k_fw_pdev *fw_pdev = &ab->fw_pdev[i];
 
-			if (fw_pdev->pdev_id == le32_to_cpu(caps->pdev_id) &&
+			if (fw_pdev->pdev_id == ath12k_wmi_caps_ext_get_pdev_id(caps) &&
 			    fw_pdev->phy_id == le32_to_cpu(caps->phy_id)) {
 				bands = fw_pdev->supported_bands;
 				break;
@@ -4272,7 +4272,8 @@ static int ath12k_wmi_tlv_mac_phy_caps_ext(struct ath12k_base *ab, u16 tag,
 			return 0;
 	} else {
 		for (i = 0; i < ab->num_radios; i++) {
-			if (ab->pdevs[i].pdev_id == le32_to_cpu(caps->pdev_id))
+			if (ab->pdevs[i].pdev_id ==
+			    ath12k_wmi_caps_ext_get_pdev_id(caps))
 				break;
 		}
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index d8481c710021..06b931222321 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2542,9 +2542,17 @@ struct ath12k_wmi_hw_mode_cap_params {
 
 #define WMI_MAX_HECAP_PHY_SIZE                 (3)
 
+/* pdev_id is present in lower 16 bits of pdev_and_hw_link_ids in
+ * ath12k_wmi_mac_phy_caps_params & ath12k_wmi_caps_ext_params.
+ *
+ * hw_link_id is present in higher 16 bits of pdev_and_hw_link_ids.
+ */
+#define WMI_CAPS_PARAMS_PDEV_ID		GENMASK(15, 0)
+#define WMI_CAPS_PARAMS_HW_LINK_ID	GENMASK(31, 16)
+
 struct ath12k_wmi_mac_phy_caps_params {
 	__le32 hw_mode_id;
-	__le32 pdev_id;
+	__le32 pdev_and_hw_link_ids;
 	__le32 phy_id;
 	__le32 supported_flags;
 	__le32 supported_bands;
@@ -2636,13 +2644,7 @@ struct wmi_service_ready_ext2_event {
 
 struct ath12k_wmi_caps_ext_params {
 	__le32 hw_mode_id;
-	union {
-		struct {
-			__le16 pdev_id;
-			__le16 hw_link_id;
-		} __packed ath12k_wmi_pdev_to_link_map;
-		__le32 pdev_id;
-	};
+	__le32 pdev_and_hw_link_ids;
 	__le32 phy_id;
 	__le32 wireless_modes_ext;
 	__le32 eht_cap_mac_info_2ghz[WMI_MAX_EHTCAP_MAC_SIZE];
@@ -4921,4 +4923,30 @@ int ath12k_wmi_probe_resp_tmpl(struct ath12k *ar, u32 vdev_id,
 int ath12k_wmi_set_hw_mode(struct ath12k_base *ab,
 			   enum wmi_host_hw_mode_config_type mode);
 
+static inline u32
+ath12k_wmi_caps_ext_get_pdev_id(const struct ath12k_wmi_caps_ext_params *param)
+{
+	return le32_get_bits(param->pdev_and_hw_link_ids, WMI_CAPS_PARAMS_PDEV_ID);
+}
+
+static inline u32
+ath12k_wmi_caps_ext_get_hw_link_id(const struct ath12k_wmi_caps_ext_params *param)
+{
+	return le32_get_bits(param->pdev_and_hw_link_ids, WMI_CAPS_PARAMS_HW_LINK_ID);
+}
+
+static inline u32
+ath12k_wmi_mac_phy_get_pdev_id(const struct ath12k_wmi_mac_phy_caps_params *param)
+{
+	return le32_get_bits(param->pdev_and_hw_link_ids,
+			     WMI_CAPS_PARAMS_PDEV_ID);
+}
+
+static inline u32
+ath12k_wmi_mac_phy_get_hw_link_id(const struct ath12k_wmi_mac_phy_caps_params *param)
+{
+	return le32_get_bits(param->pdev_and_hw_link_ids,
+			     WMI_CAPS_PARAMS_HW_LINK_ID);
+}
+
 #endif
-- 
2.34.1


