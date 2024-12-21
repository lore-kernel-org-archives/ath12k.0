Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E9E7718C
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 05:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfmwYyDaUSB9BWoQrkbK84OEt1RCSpfRhLYEhg+a8hs=; b=qdj6uEfvx7FPkFBAXlkd8Z/15/
	46iSEUWK7ER9gvwzrxAj0SkCDVMJYeltSW9CNCylaf55v/0mPDbFJgyoJojdhN7S1PiM2V2DbIjGb
	MG4q4gevpz6UqB4QE/3CJgbfCgv9yRnjLECihjYiFcHGPXPJNGsJCfCOqWrSoxFIUJLkL+h2tDRng
	Vq2itNYqZF2+FoaBbycZr5FRlRE9aW1JLDBtc8QUjblOYPXf9Zjo70Nnbzivw/+f5PP3BUihdiQeP
	tt5HI1WtE7O0XmSRF9RXvCUbcFigv9JijuLNKhMTBdZo/drgVP6S4O0XSBShZuqP0sGHwqygLe0LF
	4ea9b8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOrx7-00000006aHp-0RJe
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 05:23:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOrx4-00000006aGi-0yYX
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 05:22:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL4lvIS006966;
	Sat, 21 Dec 2024 05:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfmwYyDaUSB9BWoQrkbK84OEt1RCSpfRhLYEhg+a8hs=; b=hjUMkIfqmc/njMbN
	7iz1OCoWWsSajUL0LBd28J3tUOy8Vq3sjeppzD78MINu/X3mkvaIkkQmgCU1dCiX
	snmZgAHhVy/XPXE0DCEUoGqgjjwr9knEvvX73Yr8KAnzuxkBKVJdbX1MtTOfk8N0
	vvRHf8ri6PSAp2LbbqlSOwOT1MeEMj8dkzwpZ536qZWg4f3hTn/yy9sjpxUX8z+b
	WuxtrmHbeEYPhkgLdA3Ur45ryMSRej/XSvc3re6WKqN/nuQuViJw5yCmyDef0yUL
	Rb+PUVrSIiFYSWuqaoUUQLN8xlccgQzhpAtEiUlagWFfxYrn9kYKbKFj6IHQfiez
	s+ATcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43npy7g4dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 05:22:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL5MuK3004136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 05:22:56 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 21:22:54 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 01/10] wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
Date: Sat, 21 Dec 2024 10:49:10 +0530
Message-ID: <20241221051919.686500-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221051919.686500-1-quic_periyasa@quicinc.com>
References: <20241221051919.686500-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SsZldAOjPGy1rduxp_axPDp4yF8S2FQM
X-Proofpoint-GUID: SsZldAOjPGy1rduxp_axPDp4yF8S2FQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412210043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_212258_286291_379EEEDA 
X-CRM114-Status: GOOD (  16.94  )
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

Currently, monitor is not enabled. However, in the future, the monitor
will be enabled. Therefore, add the necessary HAL_PHYRX_GENERIC_U_SIG TLV
parsing support in monitor Rx path, which help to populate the EHT
radiotap data.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 209 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_rx.h |  60 +++++++
 2 files changed, 268 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 4e9a60181c06..576bfc35adad 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -10,6 +10,9 @@
 #include "dp_tx.h"
 #include "peer.h"
 
+#define ATH12K_LE32_DEC_ENC(value, dec_bits, enc_bits)	\
+		u32_encode_bits(le32_get_bits(value, dec_bits), enc_bits)
+
 static void
 ath12k_dp_mon_rx_handle_ofdma_info(const struct hal_rx_ppdu_end_user_stats *ppdu_end_user,
 				   struct hal_rx_user_status *rx_user_status)
@@ -562,6 +565,193 @@ static void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *
 	ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
 }
 
+static enum hal_rx_mon_status
+ath12k_dp_mon_hal_rx_parse_u_sig_cmn(const struct hal_mon_usig_cmn *cmn,
+				     struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	u32 common;
+	u8 bw;
+
+	bw = le32_get_bits(cmn->info0, HAL_RX_USIG_CMN_INFO0_BW);
+
+	common = __le32_to_cpu(ppdu_info->usig.common);
+	common |= IEEE80211_RADIOTAP_EHT_USIG_COMMON_PHY_VER_KNOWN |
+		  IEEE80211_RADIOTAP_EHT_USIG_COMMON_BW_KNOWN |
+		  IEEE80211_RADIOTAP_EHT_USIG_COMMON_UL_DL_KNOWN |
+		  IEEE80211_RADIOTAP_EHT_USIG_COMMON_BSS_COLOR_KNOWN |
+		  IEEE80211_RADIOTAP_EHT_USIG_COMMON_TXOP_KNOWN |
+		  ATH12K_LE32_DEC_ENC(cmn->info0,
+				      HAL_RX_USIG_CMN_INFO0_PHY_VERSION,
+				      IEEE80211_RADIOTAP_EHT_USIG_COMMON_PHY_VER) |
+		  u32_encode_bits(bw, IEEE80211_RADIOTAP_EHT_USIG_COMMON_BW) |
+		  ATH12K_LE32_DEC_ENC(cmn->info0,
+				      HAL_RX_USIG_CMN_INFO0_UL_DL,
+				      IEEE80211_RADIOTAP_EHT_USIG_COMMON_UL_DL) |
+		  ATH12K_LE32_DEC_ENC(cmn->info0,
+				      HAL_RX_USIG_CMN_INFO0_BSS_COLOR,
+				      IEEE80211_RADIOTAP_EHT_USIG_COMMON_BSS_COLOR) |
+		  ATH12K_LE32_DEC_ENC(cmn->info0,
+				      HAL_RX_USIG_CMN_INFO0_TXOP,
+				      IEEE80211_RADIOTAP_EHT_USIG_COMMON_TXOP);
+	ppdu_info->usig.common = cpu_to_le32(common);
+
+	switch (bw) {
+	default:
+		fallthrough;
+	case HAL_EHT_BW_20:
+		ppdu_info->bw = HAL_RX_BW_20MHZ;
+		break;
+	case HAL_EHT_BW_40:
+		ppdu_info->bw = HAL_RX_BW_40MHZ;
+		break;
+	case HAL_EHT_BW_80:
+		ppdu_info->bw = HAL_RX_BW_80MHZ;
+		break;
+	case HAL_EHT_BW_160:
+		ppdu_info->bw = HAL_RX_BW_160MHZ;
+		break;
+	case HAL_EHT_BW_320_1:
+	case HAL_EHT_BW_320_2:
+		ppdu_info->bw = HAL_RX_BW_320MHZ;
+		break;
+	}
+
+	return HAL_TLV_STATUS_PPDU_NOT_DONE;
+}
+
+static enum hal_rx_mon_status
+ath12k_dp_mon_hal_rx_parse_u_sig_tb(const struct hal_mon_usig_tb *usig_tb,
+				    struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	enum ieee80211_radiotap_eht_usig_tb spatial_reuse1, spatial_reuse2;
+	u32 common, value, mask;
+
+	spatial_reuse1 = IEEE80211_RADIOTAP_EHT_USIG2_TB_B3_B6_SPATIAL_REUSE_1;
+	spatial_reuse2 = IEEE80211_RADIOTAP_EHT_USIG2_TB_B7_B10_SPATIAL_REUSE_2;
+
+	common = __le32_to_cpu(ppdu_info->usig.common);
+	value = __le32_to_cpu(ppdu_info->usig.value);
+	mask = __le32_to_cpu(ppdu_info->usig.mask);
+
+	common |= ATH12K_LE32_DEC_ENC(usig_tb->info0,
+				      HAL_RX_USIG_TB_INFO0_RX_INTEG_CHECK_PASS,
+				      IEEE80211_RADIOTAP_EHT_USIG_COMMON_BAD_USIG_CRC);
+
+	value |= IEEE80211_RADIOTAP_EHT_USIG1_TB_B20_B25_DISREGARD |
+		 ATH12K_LE32_DEC_ENC(usig_tb->info0,
+				     HAL_RX_USIG_TB_INFO0_PPDU_TYPE_COMP_MODE,
+				     IEEE80211_RADIOTAP_EHT_USIG2_TB_B0_B1_PPDU_TYPE) |
+		 IEEE80211_RADIOTAP_EHT_USIG2_TB_B2_VALIDATE |
+		 ATH12K_LE32_DEC_ENC(usig_tb->info0,
+				     HAL_RX_USIG_TB_INFO0_SPATIAL_REUSE_1,
+				     spatial_reuse1) |
+		 ATH12K_LE32_DEC_ENC(usig_tb->info0,
+				     HAL_RX_USIG_TB_INFO0_SPATIAL_REUSE_2,
+				     spatial_reuse2) |
+		 IEEE80211_RADIOTAP_EHT_USIG2_TB_B11_B15_DISREGARD |
+		 ATH12K_LE32_DEC_ENC(usig_tb->info0,
+				     HAL_RX_USIG_TB_INFO0_CRC,
+				     IEEE80211_RADIOTAP_EHT_USIG2_TB_B16_B19_CRC) |
+		 ATH12K_LE32_DEC_ENC(usig_tb->info0,
+				     HAL_RX_USIG_TB_INFO0_TAIL,
+				     IEEE80211_RADIOTAP_EHT_USIG2_TB_B20_B25_TAIL);
+
+	mask |= IEEE80211_RADIOTAP_EHT_USIG1_TB_B20_B25_DISREGARD |
+		IEEE80211_RADIOTAP_EHT_USIG2_TB_B0_B1_PPDU_TYPE |
+		IEEE80211_RADIOTAP_EHT_USIG2_TB_B2_VALIDATE |
+		spatial_reuse1 | spatial_reuse2 |
+		IEEE80211_RADIOTAP_EHT_USIG2_TB_B11_B15_DISREGARD |
+		IEEE80211_RADIOTAP_EHT_USIG2_TB_B16_B19_CRC |
+		IEEE80211_RADIOTAP_EHT_USIG2_TB_B20_B25_TAIL;
+
+	ppdu_info->usig.common = cpu_to_le32(common);
+	ppdu_info->usig.value = cpu_to_le32(value);
+	ppdu_info->usig.mask = cpu_to_le32(mask);
+
+	return HAL_TLV_STATUS_PPDU_NOT_DONE;
+}
+
+static enum hal_rx_mon_status
+ath12k_dp_mon_hal_rx_parse_u_sig_mu(const struct hal_mon_usig_mu *usig_mu,
+				    struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	enum ieee80211_radiotap_eht_usig_mu sig_symb, punc;
+	u32 common, value, mask;
+
+	sig_symb = IEEE80211_RADIOTAP_EHT_USIG2_MU_B11_B15_EHT_SIG_SYMBOLS;
+	punc = IEEE80211_RADIOTAP_EHT_USIG2_MU_B3_B7_PUNCTURED_INFO;
+
+	common = __le32_to_cpu(ppdu_info->usig.common);
+	value = __le32_to_cpu(ppdu_info->usig.value);
+	mask = __le32_to_cpu(ppdu_info->usig.mask);
+
+	common |= ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				      HAL_RX_USIG_MU_INFO0_RX_INTEG_CHECK_PASS,
+				      IEEE80211_RADIOTAP_EHT_USIG_COMMON_BAD_USIG_CRC);
+
+	value |= IEEE80211_RADIOTAP_EHT_USIG1_MU_B20_B24_DISREGARD |
+		 IEEE80211_RADIOTAP_EHT_USIG1_MU_B25_VALIDATE |
+		 ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				     HAL_RX_USIG_MU_INFO0_PPDU_TYPE_COMP_MODE,
+				     IEEE80211_RADIOTAP_EHT_USIG2_MU_B0_B1_PPDU_TYPE) |
+		 IEEE80211_RADIOTAP_EHT_USIG2_MU_B2_VALIDATE |
+		 ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				     HAL_RX_USIG_MU_INFO0_PUNC_CH_INFO,
+				     punc) |
+		 IEEE80211_RADIOTAP_EHT_USIG2_MU_B8_VALIDATE |
+		 ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				     HAL_RX_USIG_MU_INFO0_EHT_SIG_MCS,
+				     IEEE80211_RADIOTAP_EHT_USIG2_MU_B9_B10_SIG_MCS) |
+		 ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				     HAL_RX_USIG_MU_INFO0_NUM_EHT_SIG_SYM,
+				     sig_symb) |
+		 ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				     HAL_RX_USIG_MU_INFO0_CRC,
+				     IEEE80211_RADIOTAP_EHT_USIG2_MU_B16_B19_CRC) |
+		 ATH12K_LE32_DEC_ENC(usig_mu->info0,
+				     HAL_RX_USIG_MU_INFO0_TAIL,
+				     IEEE80211_RADIOTAP_EHT_USIG2_MU_B20_B25_TAIL);
+
+	mask |= IEEE80211_RADIOTAP_EHT_USIG1_MU_B20_B24_DISREGARD |
+		IEEE80211_RADIOTAP_EHT_USIG1_MU_B25_VALIDATE |
+		IEEE80211_RADIOTAP_EHT_USIG2_MU_B0_B1_PPDU_TYPE |
+		IEEE80211_RADIOTAP_EHT_USIG2_MU_B2_VALIDATE |
+		punc |
+		IEEE80211_RADIOTAP_EHT_USIG2_MU_B8_VALIDATE |
+		IEEE80211_RADIOTAP_EHT_USIG2_MU_B9_B10_SIG_MCS |
+		sig_symb |
+		IEEE80211_RADIOTAP_EHT_USIG2_MU_B16_B19_CRC |
+		IEEE80211_RADIOTAP_EHT_USIG2_MU_B20_B25_TAIL;
+
+	ppdu_info->usig.common = cpu_to_le32(common);
+	ppdu_info->usig.value = cpu_to_le32(value);
+	ppdu_info->usig.mask = cpu_to_le32(mask);
+
+	return HAL_TLV_STATUS_PPDU_NOT_DONE;
+}
+
+static enum hal_rx_mon_status
+ath12k_dp_mon_hal_rx_parse_u_sig_hdr(const struct hal_mon_usig_hdr *usig,
+				     struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	const struct hal_mon_usig_cmn *usig_cmn = &usig->cmn;
+	u8 comp_mode;
+	bool ap_ppdu;
+
+	ppdu_info->eht_usig = true;
+
+	ath12k_dp_mon_hal_rx_parse_u_sig_cmn(&usig->cmn, ppdu_info);
+
+	ap_ppdu = le32_get_bits(usig_cmn->info0, HAL_RX_USIG_CMN_INFO0_UL_DL);
+	comp_mode = le32_get_bits(usig->non_cmn.mu.info0,
+				  HAL_RX_USIG_MU_INFO0_PPDU_TYPE_COMP_MODE);
+
+	if (comp_mode == 0 && ap_ppdu)
+		return ath12k_dp_mon_hal_rx_parse_u_sig_tb(&usig->non_cmn.tb, ppdu_info);
+	else
+		return ath12k_dp_mon_hal_rx_parse_u_sig_mu(&usig->non_cmn.mu, ppdu_info);
+}
+
 static enum hal_rx_mon_status
 ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 				  struct ath12k_mon_data *pmon,
@@ -774,6 +964,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 		return HAL_RX_MON_STATUS_MSDU_END;
 	case HAL_RX_MPDU_END:
 		return HAL_RX_MON_STATUS_MPDU_END;
+	case HAL_PHYRX_GENERIC_U_SIG:
+		ath12k_dp_mon_hal_rx_parse_u_sig_hdr(tlv_data, ppdu_info);
+		break;
 	case HAL_DUMMY:
 		return HAL_RX_MON_STATUS_BUF_DONE;
 	case HAL_RX_PPDU_END_STATUS_DONE:
@@ -971,7 +1164,21 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 		rxs->ampdu_reference = ampdu_id;
 	}
 
-	if (ppduinfo->he_mu_flags) {
+	if (ppduinfo->eht_usig) {
+		struct ieee80211_radiotap_tlv *tlv;
+		struct ieee80211_radiotap_eht_usig *usig;
+		u16 len = sizeof(*usig);
+
+		rxs->flag |= RX_FLAG_RADIOTAP_TLV_AT_END;
+		skb_reset_mac_header(mon_skb);
+
+		tlv = skb_push(mon_skb, sizeof(*tlv) + len);
+		tlv->type = cpu_to_le16(IEEE80211_RADIOTAP_EHT_USIG);
+		tlv->len = cpu_to_le16(len);
+
+		usig = (struct ieee80211_radiotap_eht_usig *)tlv->data;
+		*usig = ppduinfo->usig;
+	} else if (ppduinfo->he_mu_flags) {
 		rxs->flag |= RX_FLAG_RADIOTAP_HE_MU;
 		rxs->encoding = RX_ENC_HE;
 		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he_mu));
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index e4f9e21158dc..ed078bb5751e 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -235,6 +235,8 @@ struct hal_rx_mon_ppdu_info {
 	bool is_ampdu;
 	u8 medium_prot_type;
 	bool ppdu_continuation;
+	bool eht_usig;
+	struct ieee80211_radiotap_eht_usig usig;
 };
 
 #define HAL_RX_PPDU_START_INFO0_PPDU_ID			GENMASK(15, 0)
@@ -675,6 +677,64 @@ enum nl80211_he_ru_alloc ath12k_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
 	return ret;
 }
 
+enum hal_eht_bw {
+	HAL_EHT_BW_20,
+	HAL_EHT_BW_40,
+	HAL_EHT_BW_80,
+	HAL_EHT_BW_160,
+	HAL_EHT_BW_320_1,
+	HAL_EHT_BW_320_2,
+};
+
+#define HAL_RX_USIG_CMN_INFO0_PHY_VERSION	GENMASK(2, 0)
+#define HAL_RX_USIG_CMN_INFO0_BW		GENMASK(5, 3)
+#define HAL_RX_USIG_CMN_INFO0_UL_DL		BIT(6)
+#define HAL_RX_USIG_CMN_INFO0_BSS_COLOR		GENMASK(12, 7)
+#define HAL_RX_USIG_CMN_INFO0_TXOP		GENMASK(19, 13)
+#define HAL_RX_USIG_CMN_INFO0_DISREGARD		GENMASK(25, 20)
+#define HAL_RX_USIG_CMN_INFO0_VALIDATE		BIT(26)
+
+struct hal_mon_usig_cmn {
+	__le32 info0;
+} __packed;
+
+#define HAL_RX_USIG_TB_INFO0_PPDU_TYPE_COMP_MODE	GENMASK(1, 0)
+#define HAL_RX_USIG_TB_INFO0_VALIDATE			BIT(2)
+#define HAL_RX_USIG_TB_INFO0_SPATIAL_REUSE_1		GENMASK(6, 3)
+#define HAL_RX_USIG_TB_INFO0_SPATIAL_REUSE_2		GENMASK(10, 7)
+#define HAL_RX_USIG_TB_INFO0_DISREGARD_1		GENMASK(15, 11)
+#define HAL_RX_USIG_TB_INFO0_CRC			GENMASK(19, 16)
+#define HAL_RX_USIG_TB_INFO0_TAIL			GENMASK(25, 20)
+#define HAL_RX_USIG_TB_INFO0_RX_INTEG_CHECK_PASS	BIT(31)
+
+struct hal_mon_usig_tb {
+	__le32 info0;
+} __packed;
+
+#define HAL_RX_USIG_MU_INFO0_PPDU_TYPE_COMP_MODE	GENMASK(1, 0)
+#define HAL_RX_USIG_MU_INFO0_VALIDATE_1			BIT(2)
+#define HAL_RX_USIG_MU_INFO0_PUNC_CH_INFO		GENMASK(7, 3)
+#define HAL_RX_USIG_MU_INFO0_VALIDATE_2			BIT(8)
+#define HAL_RX_USIG_MU_INFO0_EHT_SIG_MCS		GENMASK(10, 9)
+#define HAL_RX_USIG_MU_INFO0_NUM_EHT_SIG_SYM		GENMASK(15, 11)
+#define HAL_RX_USIG_MU_INFO0_CRC			GENMASK(20, 16)
+#define HAL_RX_USIG_MU_INFO0_TAIL			GENMASK(26, 21)
+#define HAL_RX_USIG_MU_INFO0_RX_INTEG_CHECK_PASS	BIT(31)
+
+struct hal_mon_usig_mu {
+	__le32 info0;
+} __packed;
+
+union hal_mon_usig_non_cmn {
+	struct hal_mon_usig_tb tb;
+	struct hal_mon_usig_mu mu;
+};
+
+struct hal_mon_usig_hdr {
+	struct hal_mon_usig_cmn cmn;
+	union hal_mon_usig_non_cmn non_cmn;
+} __packed;
+
 void ath12k_hal_reo_status_queue_stats(struct ath12k_base *ab,
 				       struct hal_tlv_64_hdr *tlv,
 				       struct hal_reo_status *status);
-- 
2.34.1


