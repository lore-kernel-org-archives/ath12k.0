Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5018ED41C0E
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuXN2uFTo4PZfP+mlFNJyxHRoYGoJOFTQSFvNN/ooks=; b=QgcbnQ70NyQNvga6XHwTs8U/Qs
	o/JAVBsrvFcKAum3j4b5nl1sUWUjTdwFjWogIPnvXOT9XvV/cjst6ZCVJzaR6VzUyapxp2TUuT+OW
	x8Eb84Bn4PXeyrdG8pQL4u5mhZQLnNh7GRFNpiGvfWjwd5mnTxOFSmnw/rU6aCMBjiSxWYe5+rVGV
	xxMgjaT6o7kEFcMa7eMr5Y1EaCWspkwwFx+5L2l7NlwKF8FU+qGCF7+3LJGn/H4tnMBBDizICQmzw
	vATfwJm1JEZds/64xeAcOf6PMheXuDu2vqjOBQF9pOAdSmTE6bWyXay5M77mGp7L2BsCE5Y6wbN9e
	Z/h/Swlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7mr-00000005zfB-0BWx
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 07:27:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7mn-00000005ze8-370M
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 07:27:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRQPS015377;
	Wed, 13 Nov 2024 07:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuXN2uFTo4PZfP+mlFNJyxHRoYGoJOFTQSFvNN/ooks=; b=Zhz+IwVw7rz1Yys4
	bv5IsG8sYWR8dhhkpX+2E7XGK4hWH1qqdRTOQvy+Bp+w2U1xKAdGwWtt9sJNTM0f
	O9lKUrRQA+l/JmbY0jrAru1RCfT8FVYYbRt6uaWa7a47EEPdiBfjEepKWD99btcG
	KWniEOuG2BRvelA4EjsxOFKjX/QuE3s6FhKb81/fxLDFwqwsMiogezgo5Z1apPUf
	HtyBYXLJXRgPLxNvWAFiEMXa3rDd1sW8qvCc2FZCfTeU63tp/9cDg/dd/aQOE3VD
	EMrb9agSxDoNzsX9qpKNKBm3gf8Hng+TwDPPdodrY4spvH1sXYnYgckDUE27X3uM
	hbdJxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t1189xqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:27:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD7RWu7032240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:27:32 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 23:27:30 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v5 2/4] wifi: ath12k: Support phy counter and TPC stats
Date: Wed, 13 Nov 2024 12:57:05 +0530
Message-ID: <20241113072707.3377341-3-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
References: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _GZBMKrmMIUIShHDs4FmTlBcpmBGj3VG
X-Proofpoint-GUID: _GZBMKrmMIUIShHDs4FmTlBcpmBGj3VG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_232733_835656_E7563E0B 
X-CRM114-Status: GOOD (  12.54  )
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

From: Dinesh Karthikeyan <quic_dinek@quicinc.com>

Add support to request counters and Transmission Power Control
(TPC) stats through HTT stats type 37. These stats give
information about counters like received packet count, CRC pass
count, error count, transmit abort count, etc., about counter reset
like reset cause, channel frequency, number and mode, channel flags,
etc., about TPC like transmit power scale, maximum transmit power,
gain cap, EIRP, etc.

Note: MCC firmware version -
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
support HTT stats type 37, i.e., the firmware does not respond to the
command requesting stats.

Sample output:
-------------
echo 37 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_PHY_STATS_TLV:
bdf_nf_chain[0] = -92
bdf_nf_chain[1] = -94
bdf_nf_chain[2] = -94
bdf_nf_chain[3] = -93
.....

HTT_PHY_COUNTERS_TLV:
rx_ofdma_timing_err_cnt = 18068
rx_cck_fail_cnt = 0
mactx_abort_cnt = 2612
macrx_abort_cnt = 0
.....

HTT_PHY_RESET_STATS_TLV:
pdev_id = 0
chan_mhz = 0
chan_band_center_freq1 = 0
chan_band_center_freq2 = 0
.....

HTT_PHY_RESET_COUNTERS_TLV:
pdev_id = 0
cf_active_low_fail_cnt = 0
cf_active_low_pass_cnt = 0
phy_off_through_vreg_cnt = 0
.....

HTT_PHY_TPC_STATS_TLV:
pdev_id = 0
tx_power_scale = 0
tx_power_scale_db = 0
min_negative_tx_power = 0
.....

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 248 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  98 +++++++
 2 files changed, 346 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index bde3644a7c21..575a03137e9f 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2628,6 +2628,239 @@ ath12k_htt_print_dlpager_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_phy_stats_tlv(const void *tag_buf, u16 tag_len,
+			       struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_phy_stats_tlv *htt_stats_buf = tag_buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 *buf = stats_req->buf, i;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_STATS_TLV:\n");
+	for (i = 0; i < ATH12K_HTT_STATS_MAX_CHAINS; i++)
+		len += scnprintf(buf + len, buf_len - len, "bdf_nf_chain[%d] = %d\n",
+				 i, a_sle32_to_cpu(htt_stats_buf->nf_chain[i]));
+	for (i = 0; i < ATH12K_HTT_STATS_MAX_CHAINS; i++)
+		len += scnprintf(buf + len, buf_len - len, "runtime_nf_chain[%d] = %d\n",
+				 i, a_sle32_to_cpu(htt_stats_buf->runtime_nf_chain[i]));
+	len += scnprintf(buf + len, buf_len - len, "false_radar_cnt = %u / %u (mins)\n",
+			 le32_to_cpu(htt_stats_buf->false_radar_cnt),
+			 le32_to_cpu(htt_stats_buf->fw_run_time));
+	len += scnprintf(buf + len, buf_len - len, "radar_cs_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->radar_cs_cnt));
+	len += scnprintf(buf + len, buf_len - len, "ani_level = %d\n\n",
+			 a_sle32_to_cpu(htt_stats_buf->ani_level));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_phy_counters_tlv(const void *tag_buf, u16 tag_len,
+				  struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_phy_counters_tlv *htt_stats_buf = tag_buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_COUNTERS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "rx_ofdma_timing_err_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_ofdma_timing_err_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_cck_fail_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_cck_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len, "mactx_abort_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mactx_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len, "macrx_abort_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->macrx_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len, "phytx_abort_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->phytx_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len, "phyrx_abort_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->phyrx_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len, "phyrx_defer_abort_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->phyrx_defer_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_gain_adj_lstf_event_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_gain_adj_lstf_event_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_gain_adj_non_legacy_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_gain_adj_non_legacy_cnt));
+	len += print_array_to_buf(buf, len, "rx_pkt_cnt", htt_stats_buf->rx_pkt_cnt,
+				  ATH12K_HTT_MAX_RX_PKT_CNT, "\n");
+	len += print_array_to_buf(buf, len, "rx_pkt_crc_pass_cnt",
+				  htt_stats_buf->rx_pkt_crc_pass_cnt,
+				  ATH12K_HTT_MAX_RX_PKT_CRC_PASS_CNT, "\n");
+	len += print_array_to_buf(buf, len, "per_blk_err_cnt",
+				  htt_stats_buf->per_blk_err_cnt,
+				  ATH12K_HTT_MAX_PER_BLK_ERR_CNT, "\n");
+	len += print_array_to_buf(buf, len, "rx_ota_err_cnt",
+				  htt_stats_buf->rx_ota_err_cnt,
+				  ATH12K_HTT_MAX_RX_OTA_ERR_CNT, "\n\n");
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_phy_reset_stats_tlv(const void *tag_buf, u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_phy_reset_stats_tlv *htt_stats_buf = tag_buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_RESET_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
+			 le32_to_cpu(htt_stats_buf->pdev_id));
+	len += scnprintf(buf + len, buf_len - len, "chan_mhz = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_mhz));
+	len += scnprintf(buf + len, buf_len - len, "chan_band_center_freq1 = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_band_center_freq1));
+	len += scnprintf(buf + len, buf_len - len, "chan_band_center_freq2 = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_band_center_freq2));
+	len += scnprintf(buf + len, buf_len - len, "chan_phy_mode = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_phy_mode));
+	len += scnprintf(buf + len, buf_len - len, "chan_flags = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->chan_flags));
+	len += scnprintf(buf + len, buf_len - len, "chan_num = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_num));
+	len += scnprintf(buf + len, buf_len - len, "reset_cause = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->reset_cause));
+	len += scnprintf(buf + len, buf_len - len, "prev_reset_cause = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->prev_reset_cause));
+	len += scnprintf(buf + len, buf_len - len, "phy_warm_reset_src = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_warm_reset_src));
+	len += scnprintf(buf + len, buf_len - len, "rx_gain_tbl_mode = %d\n",
+			 le32_to_cpu(htt_stats_buf->rx_gain_tbl_mode));
+	len += scnprintf(buf + len, buf_len - len, "xbar_val = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->xbar_val));
+	len += scnprintf(buf + len, buf_len - len, "force_calibration = %u\n",
+			 le32_to_cpu(htt_stats_buf->force_calibration));
+	len += scnprintf(buf + len, buf_len - len, "phyrf_mode = %u\n",
+			 le32_to_cpu(htt_stats_buf->phyrf_mode));
+	len += scnprintf(buf + len, buf_len - len, "phy_homechan = %u\n",
+			 le32_to_cpu(htt_stats_buf->phy_homechan));
+	len += scnprintf(buf + len, buf_len - len, "phy_tx_ch_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_tx_ch_mask));
+	len += scnprintf(buf + len, buf_len - len, "phy_rx_ch_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_rx_ch_mask));
+	len += scnprintf(buf + len, buf_len - len, "phybb_ini_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phybb_ini_mask));
+	len += scnprintf(buf + len, buf_len - len, "phyrf_ini_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phyrf_ini_mask));
+	len += scnprintf(buf + len, buf_len - len, "phy_dfs_en_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_dfs_en_mask));
+	len += scnprintf(buf + len, buf_len - len, "phy_sscan_en_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_sscan_en_mask));
+	len += scnprintf(buf + len, buf_len - len, "phy_synth_sel_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_synth_sel_mask));
+	len += scnprintf(buf + len, buf_len - len, "phy_adfs_freq = %u\n",
+			 le32_to_cpu(htt_stats_buf->phy_adfs_freq));
+	len += scnprintf(buf + len, buf_len - len, "cck_fir_settings = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->cck_fir_settings));
+	len += scnprintf(buf + len, buf_len - len, "phy_dyn_pri_chan = %u\n",
+			 le32_to_cpu(htt_stats_buf->phy_dyn_pri_chan));
+	len += scnprintf(buf + len, buf_len - len, "cca_thresh = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->cca_thresh));
+	len += scnprintf(buf + len, buf_len - len, "dyn_cca_status = %u\n",
+			 le32_to_cpu(htt_stats_buf->dyn_cca_status));
+	len += scnprintf(buf + len, buf_len - len, "rxdesense_thresh_hw = 0x%x\n",
+			 le32_to_cpu(htt_stats_buf->rxdesense_thresh_hw));
+	len += scnprintf(buf + len, buf_len - len, "rxdesense_thresh_sw = 0x%x\n\n",
+			 le32_to_cpu(htt_stats_buf->rxdesense_thresh_sw));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_phy_reset_counters_tlv(const void *tag_buf, u16 tag_len,
+					struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_phy_reset_counters_tlv *htt_stats_buf = tag_buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_RESET_COUNTERS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
+			 le32_to_cpu(htt_stats_buf->pdev_id));
+	len += scnprintf(buf + len, buf_len - len, "cf_active_low_fail_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->cf_active_low_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len, "cf_active_low_pass_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->cf_active_low_pass_cnt));
+	len += scnprintf(buf + len, buf_len - len, "phy_off_through_vreg_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->phy_off_through_vreg_cnt));
+	len += scnprintf(buf + len, buf_len - len, "force_calibration_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->force_calibration_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rf_mode_switch_phy_off_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rf_mode_switch_phy_off_cnt));
+	len += scnprintf(buf + len, buf_len - len, "temperature_recal_cnt = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->temperature_recal_cnt));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_phy_tpc_stats_tlv(const void *tag_buf, u16 tag_len,
+				   struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_phy_tpc_stats_tlv *htt_stats_buf = tag_buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_TPC_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
+			 le32_to_cpu(htt_stats_buf->pdev_id));
+	len += scnprintf(buf + len, buf_len - len, "tx_power_scale = %u\n",
+			 le32_to_cpu(htt_stats_buf->tx_power_scale));
+	len += scnprintf(buf + len, buf_len - len, "tx_power_scale_db = %u\n",
+			 le32_to_cpu(htt_stats_buf->tx_power_scale_db));
+	len += scnprintf(buf + len, buf_len - len, "min_negative_tx_power = %d\n",
+			 le32_to_cpu(htt_stats_buf->min_negative_tx_power));
+	len += scnprintf(buf + len, buf_len - len, "reg_ctl_domain = %u\n",
+			 le32_to_cpu(htt_stats_buf->reg_ctl_domain));
+	len += scnprintf(buf + len, buf_len - len, "twice_max_rd_power = %u\n",
+			 le32_to_cpu(htt_stats_buf->twice_max_rd_power));
+	len += scnprintf(buf + len, buf_len - len, "max_tx_power = %u\n",
+			 le32_to_cpu(htt_stats_buf->max_tx_power));
+	len += scnprintf(buf + len, buf_len - len, "home_max_tx_power = %u\n",
+			 le32_to_cpu(htt_stats_buf->home_max_tx_power));
+	len += scnprintf(buf + len, buf_len - len, "psd_power = %d\n",
+			 le32_to_cpu(htt_stats_buf->psd_power));
+	len += scnprintf(buf + len, buf_len - len, "eirp_power = %u\n",
+			 le32_to_cpu(htt_stats_buf->eirp_power));
+	len += scnprintf(buf + len, buf_len - len, "power_type_6ghz = %u\n",
+			 le32_to_cpu(htt_stats_buf->power_type_6ghz));
+	len += print_array_to_buf(buf, len, "max_reg_allowed_power",
+				  htt_stats_buf->max_reg_allowed_power,
+				  ATH12K_HTT_STATS_MAX_CHAINS, "\n");
+	len += print_array_to_buf(buf, len, "max_reg_allowed_power_6ghz",
+				  htt_stats_buf->max_reg_allowed_power_6ghz,
+				  ATH12K_HTT_STATS_MAX_CHAINS, "\n");
+	len += print_array_to_buf(buf, len, "sub_band_cfreq",
+				  htt_stats_buf->sub_band_cfreq,
+				  ATH12K_HTT_MAX_CH_PWR_INFO_SIZE, "\n");
+	len += print_array_to_buf(buf, len, "sub_band_txpower",
+				  htt_stats_buf->sub_band_txpower,
+				  ATH12K_HTT_MAX_CH_PWR_INFO_SIZE, "\n\n");
+
+	stats_req->buf_len = len;
+}
+
 static void
 ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
 				      struct debug_htt_stats_req *stats_req)
@@ -2958,6 +3191,21 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_DLPAGER_STATS_TAG:
 		ath12k_htt_print_dlpager_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_PHY_STATS_TAG:
+		ath12k_htt_print_phy_stats_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_PHY_COUNTERS_TAG:
+		ath12k_htt_print_phy_counters_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_PHY_RESET_STATS_TAG:
+		ath12k_htt_print_phy_reset_stats_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_PHY_RESET_COUNTERS_TAG:
+		ath12k_htt_print_phy_reset_counters_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_PHY_TPC_STATS_TAG:
+		ath12k_htt_print_phy_tpc_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DMAC_RESET_STATS_TAG:
 		ath12k_htt_print_dmac_reset_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index dfb6538585d5..10d7ca9c02f4 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -136,6 +136,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
 	ATH12K_DBG_HTT_EXT_STATS_DLPAGER_STATS		= 36,
+	ATH12K_DBG_HTT_EXT_PHY_COUNTERS_AND_PHY_STATS	= 37,
 	ATH12K_DBG_HTT_EXT_STATS_SOC_ERROR		= 45,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO	= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA	= 51,
@@ -196,6 +197,10 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_SELFGEN_AC_SCHED_STATUS_STATS_TAG	= 111,
 	HTT_STATS_TX_SELFGEN_AX_SCHED_STATUS_STATS_TAG	= 112,
 	HTT_STATS_DLPAGER_STATS_TAG			= 120,
+	HTT_STATS_PHY_COUNTERS_TAG			= 121,
+	HTT_STATS_PHY_STATS_TAG				= 122,
+	HTT_STATS_PHY_RESET_COUNTERS_TAG		= 123,
+	HTT_STATS_PHY_RESET_STATS_TAG			= 124,
 	HTT_STATS_MU_PPDU_DIST_TAG			= 129,
 	HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG		= 130,
 	HTT_STATS_TX_PDEV_RATE_STATS_BE_OFDMA_TAG	= 135,
@@ -203,6 +208,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
 	HTT_STATS_TX_SELFGEN_BE_SCHED_STATUS_STATS_TAG	= 139,
 	HTT_STATS_DMAC_RESET_STATS_TAG			= 155,
+	HTT_STATS_PHY_TPC_STATS_TAG			= 157,
 	HTT_STATS_PDEV_SCHED_ALGO_OFDMA_STATS_TAG	= 165,
 
 	HTT_STATS_MAX_TAG,
@@ -1085,6 +1091,98 @@ struct ath12k_htt_dl_pager_stats_tlv {
 	struct ath12k_htt_pgs_info pgs_info[ATH12K_NUM_PG_LOCK_STATE][ATH12K_PAGER_MAX];
 } __packed;
 
+#define ATH12K_HTT_STATS_MAX_CHAINS		8
+#define ATH12K_HTT_MAX_RX_PKT_CNT		8
+#define ATH12K_HTT_MAX_RX_PKT_CRC_PASS_CNT	8
+#define ATH12K_HTT_MAX_PER_BLK_ERR_CNT		20
+#define ATH12K_HTT_MAX_RX_OTA_ERR_CNT		14
+#define ATH12K_HTT_MAX_CH_PWR_INFO_SIZE		16
+
+struct ath12k_htt_phy_stats_tlv {
+	a_sle32 nf_chain[ATH12K_HTT_STATS_MAX_CHAINS];
+	__le32 false_radar_cnt;
+	__le32 radar_cs_cnt;
+	a_sle32 ani_level;
+	__le32 fw_run_time;
+	a_sle32 runtime_nf_chain[ATH12K_HTT_STATS_MAX_CHAINS];
+} __packed;
+
+struct ath12k_htt_phy_counters_tlv {
+	__le32 rx_ofdma_timing_err_cnt;
+	__le32 rx_cck_fail_cnt;
+	__le32 mactx_abort_cnt;
+	__le32 macrx_abort_cnt;
+	__le32 phytx_abort_cnt;
+	__le32 phyrx_abort_cnt;
+	__le32 phyrx_defer_abort_cnt;
+	__le32 rx_gain_adj_lstf_event_cnt;
+	__le32 rx_gain_adj_non_legacy_cnt;
+	__le32 rx_pkt_cnt[ATH12K_HTT_MAX_RX_PKT_CNT];
+	__le32 rx_pkt_crc_pass_cnt[ATH12K_HTT_MAX_RX_PKT_CRC_PASS_CNT];
+	__le32 per_blk_err_cnt[ATH12K_HTT_MAX_PER_BLK_ERR_CNT];
+	__le32 rx_ota_err_cnt[ATH12K_HTT_MAX_RX_OTA_ERR_CNT];
+} __packed;
+
+struct ath12k_htt_phy_reset_stats_tlv {
+	__le32 pdev_id;
+	__le32 chan_mhz;
+	__le32 chan_band_center_freq1;
+	__le32 chan_band_center_freq2;
+	__le32 chan_phy_mode;
+	__le32 chan_flags;
+	__le32 chan_num;
+	__le32 reset_cause;
+	__le32 prev_reset_cause;
+	__le32 phy_warm_reset_src;
+	__le32 rx_gain_tbl_mode;
+	__le32 xbar_val;
+	__le32 force_calibration;
+	__le32 phyrf_mode;
+	__le32 phy_homechan;
+	__le32 phy_tx_ch_mask;
+	__le32 phy_rx_ch_mask;
+	__le32 phybb_ini_mask;
+	__le32 phyrf_ini_mask;
+	__le32 phy_dfs_en_mask;
+	__le32 phy_sscan_en_mask;
+	__le32 phy_synth_sel_mask;
+	__le32 phy_adfs_freq;
+	__le32 cck_fir_settings;
+	__le32 phy_dyn_pri_chan;
+	__le32 cca_thresh;
+	__le32 dyn_cca_status;
+	__le32 rxdesense_thresh_hw;
+	__le32 rxdesense_thresh_sw;
+} __packed;
+
+struct ath12k_htt_phy_reset_counters_tlv {
+	__le32 pdev_id;
+	__le32 cf_active_low_fail_cnt;
+	__le32 cf_active_low_pass_cnt;
+	__le32 phy_off_through_vreg_cnt;
+	__le32 force_calibration_cnt;
+	__le32 rf_mode_switch_phy_off_cnt;
+	__le32 temperature_recal_cnt;
+} __packed;
+
+struct ath12k_htt_phy_tpc_stats_tlv {
+	__le32 pdev_id;
+	__le32 tx_power_scale;
+	__le32 tx_power_scale_db;
+	__le32 min_negative_tx_power;
+	__le32 reg_ctl_domain;
+	__le32 max_reg_allowed_power[ATH12K_HTT_STATS_MAX_CHAINS];
+	__le32 max_reg_allowed_power_6ghz[ATH12K_HTT_STATS_MAX_CHAINS];
+	__le32 twice_max_rd_power;
+	__le32 max_tx_power;
+	__le32 home_max_tx_power;
+	__le32 psd_power;
+	__le32 eirp_power;
+	__le32 power_type_6ghz;
+	__le32 sub_band_cfreq[ATH12K_HTT_MAX_CH_PWR_INFO_SIZE];
+	__le32 sub_band_txpower[ATH12K_HTT_MAX_CH_PWR_INFO_SIZE];
+} __packed;
+
 struct ath12k_htt_dmac_reset_stats_tlv {
 	__le32 reset_count;
 	__le32 reset_time_lo_ms;
-- 
2.25.1


