Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A0C02198
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 01:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxuy21df/2e0Buchw5aKBBc5+FuLdQ+JcyJUusrW9aw=; b=ULhF0KRy7JPhak3vMMfqnhItf4
	fDow965TZluVvVAvDy3U/Olt3H8LgeqJXufJIIbaiTmPZtT9QQK0McQaG/waT0h51FqjmVpOWpdOf
	LWvshY3jdJMGyVMMVvwQV05zYSUvizoy6jVp1C91pOcgG4tBeS8W0mheROJ+C8ocwiD0I9rCoyE+j
	MqBQ8pi3OuqPgCrYjZORExf77k+wUkewNJngnAQQtiwzUuKihsgZEQx4SQrLf/i6LxDWJGJi1szKq
	/ernorU3A3OQP/XuWFDAyPs4cWOxUlJUvUZvwSN0x1ST85X5pRBDnjZbKMvXAiOlYvK6hnLJLo61o
	wceA/uQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNyK-00000009Nba-3tBd
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 01:24:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNyH-00000009NYi-3mIp
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 01:24:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CCiRQN010299;
	Thu, 13 Feb 2025 01:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxuy21df/2e0Buchw5aKBBc5+FuLdQ+JcyJUusrW9aw=; b=b3qEGWE2MKHbj63x
	QIEogBvpj8hZshOwPhsVVquIujy0e+WmSNm+O0d/omgMc/cG+JW5Xw9boqdTWY98
	Mt1G2lrXGPf3fcVp+Yufg+2BRZfRFVEJgDqNESZVe3mJH6DpIa1xExg9lipO4Xt3
	Hx5/zm2/oNbS4H45TG/Sy9hC/ebQc7oQq7UWp65l+BITaW+J4bNkhmHQj8rnFXbq
	E0TCdNajT039+yBzw9olEpGImEOuzCsBRqFEbowx0bjuoXNemGyT7bgFSOZQ+8KS
	hYX7wqKIVXCHnEFgP/Yhy10kmPBC6R5nSH2YL3k5+KOoEZnf4K+Mwvy0zaSaVkgl
	xBX1LA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5hjab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:24:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D1Oqh2012868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:24:52 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 17:24:51 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
Subject: [PATCH V10 2/9] wifi: ath12k: push EHT MU-MIMO params to hardware
Date: Wed, 12 Feb 2025 17:24:32 -0800
Message-ID: <20250213012439.278373-3-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
References: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pWzpVAMItKwwVbZP5EzA1l4dfMcSs4SY
X-Proofpoint-GUID: pWzpVAMItKwwVbZP5EzA1l4dfMcSs4SY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172454_161550_C2E0F6A2 
X-CRM114-Status: GOOD (  15.26  )
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

Currently, only the EHT IE in management frames is updated with
respect to MU-MIMO configurations, but this change is not
reflected in the hardware. Add support to propagate MU-MIMO
configurations to the hardware as well for AP mode. Similar
support for STA mode will be added in future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 58 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 21 ++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bb92d2db21e0..298949ec9e39 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3339,6 +3339,58 @@ static int ath12k_mac_vif_recalc_sta_he_txbf(struct ath12k *ar,
 	return 0;
 }
 
+static int ath12k_mac_set_eht_txbf_conf(struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k *ar = arvif->ar;
+	u32 param = WMI_VDEV_PARAM_SET_EHT_MU_MODE;
+	u32 value = 0;
+	int ret;
+	struct ieee80211_bss_conf *link_conf;
+
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ar->ab, "unable to access bss link conf in eht txbf conf\n");
+		return -ENOENT;
+	}
+
+	if (!link_conf->eht_support)
+		return 0;
+
+	if (link_conf->eht_su_beamformer) {
+		value |= u32_encode_bits(EHT_SU_BFER_ENABLE, EHT_MODE_SU_TX_BFER);
+		if (link_conf->eht_mu_beamformer &&
+		    ahvif->vdev_type == WMI_VDEV_TYPE_AP)
+			value |= u32_encode_bits(EHT_MU_BFER_ENABLE,
+						 EHT_MODE_MU_TX_BFER) |
+				 u32_encode_bits(EHT_DL_MUOFDMA_ENABLE,
+						 EHT_MODE_DL_OFDMA_MUMIMO) |
+				 u32_encode_bits(EHT_UL_MUOFDMA_ENABLE,
+						 EHT_MODE_UL_OFDMA_MUMIMO);
+	}
+
+	if (ahvif->vif->type != NL80211_IFTYPE_MESH_POINT) {
+		value |= u32_encode_bits(EHT_DL_MUOFDMA_ENABLE, EHT_MODE_DL_OFDMA) |
+			 u32_encode_bits(EHT_UL_MUOFDMA_ENABLE, EHT_MODE_UL_OFDMA);
+
+		if (link_conf->eht_80mhz_full_bw_ul_mumimo)
+			value |= u32_encode_bits(EHT_UL_MUMIMO_ENABLE, EHT_MODE_MUMIMO);
+
+		if (link_conf->eht_su_beamformee)
+			value |= u32_encode_bits(EHT_SU_BFEE_ENABLE,
+						 EHT_MODE_SU_TX_BFEE);
+	}
+
+	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, param, value);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to set vdev %d EHT MU mode: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
 					      struct ieee80211_link_sta *link_sta)
 {
@@ -4018,6 +4070,12 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 				ath12k_warn(ar->ab,
 					    "failed to set HE TXBF config for vdev: %d\n",
 					    arvif->vdev_id);
+
+			ret = ath12k_mac_set_eht_txbf_conf(arvif);
+			if (ret)
+				ath12k_warn(ar->ab,
+					    "failed to set EHT TXBF config for vdev: %d\n",
+					    arvif->vdev_id);
 		}
 		ath12k_control_beaconing(arvif, info);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 60b8b0dc2ae0..ce4ec3a23a11 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1159,6 +1159,7 @@ enum wmi_tlv_vdev_param {
 	WMI_VDEV_PARAM_BSS_COLOR,
 	WMI_VDEV_PARAM_SET_HEMU_MODE,
 	WMI_VDEV_PARAM_HEOPS_0_31 = 0x8003,
+	WMI_VDEV_PARAM_SET_EHT_MU_MODE = 0x8005,
 };
 
 enum wmi_tlv_peer_flags {
@@ -3112,6 +3113,26 @@ struct ath12k_wmi_rx_reorder_queue_remove_arg {
 #define HE_MU_BFER_ENABLE	1
 #define HE_SU_BFER_ENABLE	1
 
+#define EHT_MODE_SU_TX_BFEE		BIT(0)
+#define EHT_MODE_SU_TX_BFER		BIT(1)
+#define EHT_MODE_MU_TX_BFEE		BIT(2)
+#define EHT_MODE_MU_TX_BFER		BIT(3)
+#define EHT_MODE_DL_OFDMA		BIT(4)
+#define EHT_MODE_UL_OFDMA		BIT(5)
+#define EHT_MODE_MUMIMO			BIT(6)
+#define EHT_MODE_DL_OFDMA_TXBF		BIT(7)
+#define EHT_MODE_DL_OFDMA_MUMIMO	BIT(8)
+#define EHT_MODE_UL_OFDMA_MUMIMO	BIT(9)
+
+#define EHT_DL_MUOFDMA_ENABLE    1
+#define EHT_UL_MUOFDMA_ENABLE    1
+#define EHT_DL_MUMIMO_ENABLE     1
+#define EHT_UL_MUMIMO_ENABLE     1
+#define EHT_MU_BFEE_ENABLE       1
+#define EHT_SU_BFEE_ENABLE       1
+#define EHT_MU_BFER_ENABLE       1
+#define EHT_SU_BFER_ENABLE       1
+
 #define HE_VHT_SOUNDING_MODE_ENABLE		1
 #define HE_SU_MU_SOUNDING_MODE_ENABLE		1
 #define HE_TRIG_NONTRIG_SOUNDING_MODE_ENABLE	1
-- 
2.34.1


