Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F167FA372E
	for <ath12k@archiver.kernel.org>; Fri, 13 Sep 2024 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byZcb5UCwo926CJjoWilfR0VSGPtBT3AIB8R5FrVt/A=; b=cvgOuZM83qg80CMEJlqmQOzXyf
	KD5Jm3mlU/JanEcUtTGZLG1VJ1yM80CrF1N2PV0mJkljh1yTZP1BAhsmoamFx8z8KNTbAemrzF+ZA
	bRppVLYb1uWFGmdSB7OYC1/Nhn4o6QQPbwQRx4SaHModRAyLQftyKs7VZKkZFbPi49MLb766h/NRa
	ybHLwmvyFYr3Wv81DlvlV3FBAc09RM8rxdWBIAKZQdn01P3ErSPkTifbg2/ULZUImqdtCDY9QTA1v
	m4FRQosQq6Z/jDsmBKFc0NGKlSpDo8lw7o7oZhnYYh9j1o+JKdblr0NorICpftoRnodjqGPPNPfkx
	uuEqK3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1iI-0000000FLU1-0rRH
	for ath12k@archiver.kernel.org;
	Fri, 13 Sep 2024 08:31:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1hB-0000000FLCm-1VMX
	for ath12k@lists.infradead.org;
	Fri, 13 Sep 2024 08:30:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBp5b013058;
	Fri, 13 Sep 2024 08:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byZcb5UCwo926CJjoWilfR0VSGPtBT3AIB8R5FrVt/A=; b=AZmNCvVC2Vyojs7z
	vOLIV8FLPdzXHhOGwTCl1s57uKvpM6AKieujrhL2JdWuGg/gHuR3ikcDgthUkJ+x
	muVSPUaJB3Knp7N+SQfU3O604UoJyquc1mLh3AqRha1c5UMOluGt+39MWmx6gPOo
	TmdrOdO2nETWp7s+6GQ/OiW2ldFRLj8l/KYt7LykSTLoMR34fqJYeQVuc8IANtnl
	YRjqNa3+26gRUtLaSSbxLrvkN5Plja/7hNxQTZ4nLDUhHwVhDKhwnHsnu+YhqXTg
	5mKzQun2DVtY9Q9LR/aBtFV7sUPLEaimf+0ddY0GGRkmdyEBRXVpX6ArkEZqpnCy
	Iug9zA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy51fxu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:30:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D8UMHH000868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:30:23 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 01:30:20 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH 3/4] wifi: ath12k: Support pdev Transmit Multi-user stats
Date: Fri, 13 Sep 2024 13:59:48 +0530
Message-ID: <20240913082949.573482-4-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913082949.573482-1-quic_rdevanat@quicinc.com>
References: <20240913082949.573482-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z2QgLvlrmER4wtw_t5aRE_T9cmlgw8ZX
X-Proofpoint-GUID: z2QgLvlrmER4wtw_t5aRE_T9cmlgw8ZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_013025_587903_D366C375 
X-CRM114-Status: GOOD (  15.15  )
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

Add support to request multi-user stats from firmware for transmitter
through HTT stats type 17. These stats give information about multi-
user MIMO, OFDMA and MPDU for different Wi-Fi standards.

Sample output:
-------------
echo 17 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_TX_PDEV_MU_MIMO_SCH_STATS_TLV:
mu_mimo_sch_posted = 0
mu_mimo_sch_failed = 0
mu_mimo_ppdu_posted = 0

ac_mu_mimo_sch_posted_per_group_index 0 (SU) = 0
ac_mu_mimo_sch_posted_per_group_index 1 (TOTAL STREAMS = 2) = 0
.....

ax_mu_mimo_sch_posted_per_group_index 0 (SU) = 0
ax_mu_mimo_sch_posted_per_group_index 1 (TOTAL STREAMS = 2) = 0
.....

be_mu_mimo_sch_posted_per_group_index 0 (SU) = 0
be_mu_mimo_sch_posted_per_group_index 1 (TOTAL STREAMS = 2) = 0
.....

11ac MU_MIMO SCH STATS:
ac_mu_mimo_sch_nusers_0 = 0
ac_mu_mimo_sch_nusers_1 = 0
ac_mu_mimo_sch_nusers_2 = 0
ac_mu_mimo_sch_nusers_3 = 0

11ax MU_MIMO SCH STATS:
ax_mu_mimo_sch_nusers_0 = 0
ax_mu_mimo_sch_nusers_1 = 0
ax_mu_mimo_sch_nusers_2 = 0
.....

11be MU_MIMO SCH STATS:
be_mu_mimo_sch_nusers_0 = 0
be_mu_mimo_sch_nusers_1 = 0
be_mu_mimo_sch_nusers_2 = 0
.....

11ax OFDMA SCH STATS:
ax_ofdma_sch_nusers_0 = 0
ax_ul_ofdma_basic_sch_nusers_0 = 0
ax_ul_ofdma_bsr_sch_nusers_0 = 0
ax_ul_ofdma_bar_sch_nusers_0 = 0
ax_ul_ofdma_brp_sch_nusers_0 = 0
.....

11ax UL MUMIMO SCH STATS:
ax_ul_mumimo_basic_sch_nusers_0 = 0
ax_ul_mumimo_brp_sch_nusers_0 = 0

ax_ul_mumimo_basic_sch_nusers_1 = 0
ax_ul_mumimo_brp_sch_nusers_1 = 0
.....

HTT_TX_PDEV_MUMIMO_GRP_STATS:
dl_mumimo_grp_tputs_observed (per bin = 300 mbps) =  0:0, 1:0, 2:0, 3:0,
4:0, 5:0, 6:0, 7:0, 8:0, 9:0
dl_mumimo_grp eligible =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
dl_mumimo_grp_ineligible =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
.....

HTT_TX_PDEV_MU_MIMO_AC_MPDU_STATS:
ac_mu_mimo_mpdus_queued_usr_0 = 0
ac_mu_mimo_mpdus_tried_usr_0 = 0
ac_mu_mimo_mpdus_failed_usr_0 = 0
.....

HTT_TX_PDEV_MU_MIMO_AX_MPDU_STATS:
ax_mu_mimo_mpdus_queued_usr_0 = 0
ax_mu_mimo_mpdus_tried_usr_0 = 0
ax_mu_mimo_mpdus_failed_usr_0 = 0
.....

HTT_TX_PDEV_AX_MU_OFDMA_MPDU_STATS:
ax_mu_ofdma_mpdus_queued_usr_0 = 0
ax_mu_ofdma_mpdus_tried_usr_0 = 0
ax_mu_ofdma_mpdus_failed_usr_0 = 0
.....

11ac MU_MIMO SCH STATS:
ac_mu_mimo_sch_nusers_0 = 0
ac_mu_mimo_sch_nusers_1 = 0
ac_mu_mimo_sch_nusers_2 = 0
ac_mu_mimo_sch_nusers_3 = 0
.....

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
Note: MCC firmware version -
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
print stats because MCC firmware reports an event, but there are
no tags or data. The length of the received TLV is 0.
---
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 304 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  79 +++++
 2 files changed, 383 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 98610d0ce4a2..43e159055a7e 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2077,6 +2077,301 @@ ath12k_htt_print_sfm_client_user_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf, u16 tag_len,
+					       struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_tx_pdev_mu_mimo_sch_stats_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 i;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_PDEV_MU_MIMO_SCH_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mu_mimo_sch_posted = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_sch_posted));
+	len += scnprintf(buf + len, buf_len - len, "mu_mimo_sch_failed = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_sch_failed));
+	len += scnprintf(buf + len, buf_len - len, "mu_mimo_ppdu_posted = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_ppdu_posted));
+	len += scnprintf(buf + len, buf_len - len,
+			 "\nac_mu_mimo_sch_posted_per_group_index %u (SU) = %u\n", 0,
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_per_grp_sz[0]));
+	for (i = 1; i < ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ac_mu_mimo_sch_posted_per_group_index %u ", i);
+		len += scnprintf(buf + len, buf_len - len,
+				 "(TOTAL STREAMS = %u) = %u\n", i + 1,
+				 le32_to_cpu(htt_stats_buf->ac_mu_mimo_per_grp_sz[i]));
+	}
+
+	for (i = 0; i < ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ac_mu_mimo_sch_posted_per_group_index %u ",
+				 i + ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS);
+		len += scnprintf(buf + len, buf_len - len,
+				 "(TOTAL STREAMS = %u) = %u\n",
+				 i + ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS + 1,
+				 le32_to_cpu(htt_stats_buf->ac_mu_mimo_grp_sz_ext[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len,
+			 "\nax_mu_mimo_sch_posted_per_group_index %u (SU) = %u\n", 0,
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_per_grp_sz[0]));
+	for (i = 1; i < ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_mu_mimo_sch_posted_per_group_index %u ", i);
+		len += scnprintf(buf + len, buf_len - len,
+				 "(TOTAL STREAMS = %u) = %u\n", i + 1,
+				 le32_to_cpu(htt_stats_buf->ax_mu_mimo_per_grp_sz[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len,
+			"\nbe_mu_mimo_sch_posted_per_group_index %u (SU) = %u\n", 0,
+			le32_to_cpu(htt_stats_buf->be_mu_mimo_per_grp_sz[0]));
+	for (i = 1; i < ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "be_mu_mimo_sch_posted_per_group_index %u ", i);
+		len += scnprintf(buf + len, buf_len - len,
+				 "(TOTAL STREAMS = %u) = %u\n", i + 1,
+				 le32_to_cpu(htt_stats_buf->be_mu_mimo_per_grp_sz[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "\n11ac MU_MIMO SCH STATS:\n");
+	for (i = 0; i < ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_sch_nusers_");
+		len += scnprintf(buf + len, buf_len - len, "%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ac_mu_mimo_sch_nusers[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "\n11ax MU_MIMO SCH STATS:\n");
+	for (i = 0; i < ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_sch_nusers_");
+		len += scnprintf(buf + len, buf_len - len, "%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_mu_mimo_sch_nusers[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "\n11be MU_MIMO SCH STATS:\n");
+	for (i = 0; i < ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len, "be_mu_mimo_sch_nusers_");
+		len += scnprintf(buf + len, buf_len - len, "%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->be_mu_mimo_sch_nusers[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "\n11ax OFDMA SCH STATS:\n");
+	for (i = 0; i < ATH12K_HTT_TX_NUM_OFDMA_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ofdma_sch_nusers_%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ofdma_sch_nusers[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_basic_sch_nusers_%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ul_ofdma_nusers[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_bsr_sch_nusers_%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ul_ofdma_bsr_nusers[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_bar_sch_nusers_%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ul_ofdma_bar_nusers[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_ofdma_brp_sch_nusers_%u = %u\n\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ul_ofdma_brp_nusers[i]));
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "11ax UL MUMIMO SCH STATS:\n");
+	for (i = 0; i < ATH12K_HTT_TX_NUM_UL_MUMIMO_USER_STATS; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_mumimo_basic_sch_nusers_%u = %u\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ul_mumimo_nusers[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "ax_ul_mumimo_brp_sch_nusers_%u = %u\n\n", i,
+				 le32_to_cpu(htt_stats_buf->ax_ul_mumimo_brp_nusers[i]));
+	}
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv(const void *tag_buf, u16 tag_len,
+					      struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_tx_pdev_mumimo_grp_stats_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	int j;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_TX_PDEV_MUMIMO_GRP_STATS:\n");
+	len += print_array_to_buf(buf, len,
+				  "dl_mumimo_grp_tputs_observed (per bin = 300 mbps)",
+				  htt_stats_buf->dl_mumimo_grp_tputs,
+				  ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS, "\n");
+	len += print_array_to_buf(buf, len, "dl_mumimo_grp eligible",
+				  htt_stats_buf->dl_mumimo_grp_eligible,
+				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
+	len += print_array_to_buf(buf, len, "dl_mumimo_grp_ineligible",
+				  htt_stats_buf->dl_mumimo_grp_ineligible,
+				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
+	len += scnprintf(buf + len, buf_len - len, "dl_mumimo_grp_invalid:\n");
+	for (j = 0; j < ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ; j++) {
+		len += scnprintf(buf + len, buf_len - len, "grp_id = %u", j);
+		len += print_array_to_buf(buf, len, "",
+					  htt_stats_buf->dl_mumimo_grp_invalid,
+					  ATH12K_HTT_STATS_MAX_INVALID_REASON_CODE,
+					  "\n");
+	}
+
+	len += print_array_to_buf(buf, len, "ul_mumimo_grp_best_grp_size",
+				  htt_stats_buf->ul_mumimo_grp_best_grp_size,
+				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
+	len += print_array_to_buf_v2(buf, len, "ul_mumimo_grp_best_num_usrs = ", 1,
+				     htt_stats_buf->ul_mumimo_grp_best_usrs,
+				     ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
+	len += print_array_to_buf(buf, len,
+				  "ul_mumimo_grp_tputs_observed (per bin = 300 mbps)",
+				  htt_stats_buf->ul_mumimo_grp_tputs,
+				  ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS, "\n\n");
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf, u16 tag_len,
+						struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_tx_pdev_mpdu_stats_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 user_index;
+	u32 tx_sched_mode;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	user_index = __le32_to_cpu(htt_stats_buf->user_index);
+	tx_sched_mode = __le32_to_cpu(htt_stats_buf->tx_sched_mode);
+
+	if (tx_sched_mode == ATH12K_HTT_STATS_TX_SCHED_MODE_MU_MIMO_AC) {
+		if (!user_index)
+			len += scnprintf(buf + len, buf_len - len,
+					 "HTT_TX_PDEV_MU_MIMO_AC_MPDU_STATS:\n");
+
+		if (user_index < ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS) {
+			len += scnprintf(buf + len, buf_len - len,
+					 "ac_mu_mimo_mpdus_queued_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_queued_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ac_mu_mimo_mpdus_tried_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_tried_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ac_mu_mimo_mpdus_failed_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_failed_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ac_mu_mimo_mpdus_requeued_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_requeued_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ac_mu_mimo_err_no_ba_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->err_no_ba_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ac_mu_mimo_mpdu_underrun_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdu_underrun_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					"ac_mu_mimo_ampdu_underrun_usr_%u = %u\n\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->ampdu_underrun_usr));
+		}
+	}
+
+	if (tx_sched_mode == ATH12K_HTT_STATS_TX_SCHED_MODE_MU_MIMO_AX) {
+		if (!user_index)
+			len += scnprintf(buf + len, buf_len - len,
+					 "HTT_TX_PDEV_MU_MIMO_AX_MPDU_STATS:\n");
+
+		if (user_index < ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS) {
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_mpdus_queued_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_queued_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_mpdus_tried_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_tried_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_mpdus_failed_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_failed_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_mpdus_requeued_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_requeued_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_err_no_ba_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->err_no_ba_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_mpdu_underrun_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdu_underrun_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_mimo_ampdu_underrun_usr_%u = %u\n\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->ampdu_underrun_usr));
+		}
+	}
+
+	if (tx_sched_mode == ATH12K_HTT_STATS_TX_SCHED_MODE_MU_OFDMA_AX) {
+		if (!user_index)
+			len += scnprintf(buf + len, buf_len - len,
+					 "HTT_TX_PDEV_AX_MU_OFDMA_MPDU_STATS:\n");
+
+		if (user_index < ATH12K_HTT_TX_NUM_OFDMA_USER_STATS) {
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_mpdus_queued_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_queued_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_mpdus_tried_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_tried_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_mpdus_failed_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_failed_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_mpdus_requeued_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdus_requeued_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_err_no_ba_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->err_no_ba_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_mpdu_underrun_usr_%u = %u\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->mpdu_underrun_usr));
+			len += scnprintf(buf + len, buf_len - len,
+					 "ax_mu_ofdma_ampdu_underrun_usr_%u = %u\n\n",
+					 user_index,
+					 le32_to_cpu(htt_stats_buf->ampdu_underrun_usr));
+		}
+	}
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -2230,6 +2525,15 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_SFM_CLIENT_USER_TAG:
 		ath12k_htt_print_sfm_client_user_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_TX_PDEV_MU_MIMO_STATS_TAG:
+		ath12k_htt_print_tx_pdev_mu_mimo_sch_stats_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG:
+		ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_TX_PDEV_MPDU_STATS_TAG:
+		ath12k_htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(tag_buf, len, stats_req);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index ed6eb5935e2d..bd764ddd5394 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -132,6 +132,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_TX_SELFGEN_INFO	= 12,
 	ATH12K_DBG_HTT_EXT_STATS_SRNG_INFO		= 15,
 	ATH12K_DBG_HTT_EXT_STATS_SFM_INFO		= 16,
+	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_MU		= 17,
 
 	/* keep this last */
 	ATH12K_DBG_HTT_NUM_EXT_STATS,
@@ -155,6 +156,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_DE_ENQUEUE_PACKETS_TAG		= 21,
 	HTT_STATS_TX_DE_ENQUEUE_DISCARD_TAG		= 22,
 	HTT_STATS_TX_DE_CMN_TAG				= 23,
+	HTT_STATS_TX_PDEV_MU_MIMO_STATS_TAG		= 25,
 	HTT_STATS_SFM_CMN_TAG				= 26,
 	HTT_STATS_SRING_STATS_TAG			= 27,
 	HTT_STATS_TX_PDEV_SCHEDULER_TXQ_STATS_TAG	= 36,
@@ -174,6 +176,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_DE_COMPL_STATS_TAG			= 65,
 	HTT_STATS_WHAL_TX_TAG				= 66,
 	HTT_STATS_TX_PDEV_SIFS_HIST_TAG			= 67,
+	HTT_STATS_TX_PDEV_MPDU_STATS_TAG		= 74,
 	HTT_STATS_SCHED_TXQ_SCHED_ORDER_SU_TAG		= 86,
 	HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG	= 87,
 	HTT_STATS_HW_WAR_TAG				= 89,
@@ -182,6 +185,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_SELFGEN_AC_SCHED_STATUS_STATS_TAG	= 111,
 	HTT_STATS_TX_SELFGEN_AX_SCHED_STATUS_STATS_TAG	= 112,
 	HTT_STATS_MU_PPDU_DIST_TAG			= 129,
+	HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG		= 130,
 	HTT_STATS_TX_SELFGEN_BE_ERR_STATS_TAG		= 137,
 	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
 	HTT_STATS_TX_SELFGEN_BE_SCHED_STATUS_STATS_TAG	= 139,
@@ -708,12 +712,35 @@ struct ath12k_htt_tx_de_compl_stats_tlv {
 	__le32 tqm_bypass_frame;
 } __packed;
 
+enum ath12k_htt_tx_mumimo_grp_invalid_reason_code_stats {
+	ATH12K_HTT_TX_MUMIMO_GRP_VALID,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_NUM_MU_USERS_EXCEEDED_MU_MAX_USERS,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_SCHED_ALGO_NOT_MU_COMPATIBLE_GID,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_NON_PRIMARY_GRP,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_ZERO_CANDIDATES,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_MORE_CANDIDATES,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_GROUP_SIZE_EXCEED_NSS,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_GROUP_INELIGIBLE,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_GROUP_EFF_MU_TPUT_OMBPS,
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_MAX_REASON_CODE,
+};
+
 #define ATH12K_HTT_NUM_AC_WMM				0x4
 #define ATH12K_HTT_MAX_NUM_SBT_INTR			4
 #define ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS		4
 #define ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS		8
 #define ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS		8
 #define ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS	7
+#define ATH12K_HTT_TX_NUM_OFDMA_USER_STATS		74
+#define ATH12K_HTT_TX_NUM_UL_MUMIMO_USER_STATS		8
+#define ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ		8
+#define ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS		10
+
+#define ATH12K_HTT_STATS_MAX_INVALID_REASON_CODE \
+	ATH12K_HTT_TX_MUMIMO_GRP_INVALID_MAX_REASON_CODE
+#define ATH12K_HTT_TX_NUM_MUMIMO_GRP_INVALID_WORDS \
+	(ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ * ATH12K_HTT_STATS_MAX_INVALID_REASON_CODE)
 
 struct ath12k_htt_tx_selfgen_cmn_stats_tlv {
 	__le32 mac_id__word;
@@ -922,4 +949,56 @@ struct ath12k_htt_sfm_client_user_tlv {
 	DECLARE_FLEX_ARRAY(__le32, dwords_used_by_user_n);
 } __packed;
 
+struct ath12k_htt_tx_pdev_mu_mimo_sch_stats_tlv {
+	__le32 mu_mimo_sch_posted;
+	__le32 mu_mimo_sch_failed;
+	__le32 mu_mimo_ppdu_posted;
+	__le32 ac_mu_mimo_sch_nusers[ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS];
+	__le32 ax_mu_mimo_sch_nusers[ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS];
+	__le32 ax_ofdma_sch_nusers[ATH12K_HTT_TX_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_nusers[ATH12K_HTT_TX_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_bsr_nusers[ATH12K_HTT_TX_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_bar_nusers[ATH12K_HTT_TX_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_brp_nusers[ATH12K_HTT_TX_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_mumimo_nusers[ATH12K_HTT_TX_NUM_UL_MUMIMO_USER_STATS];
+	__le32 ax_ul_mumimo_brp_nusers[ATH12K_HTT_TX_NUM_UL_MUMIMO_USER_STATS];
+	__le32 ac_mu_mimo_per_grp_sz[ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS];
+	__le32 ax_mu_mimo_per_grp_sz[ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS];
+	__le32 be_mu_mimo_sch_nusers[ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS];
+	__le32 be_mu_mimo_per_grp_sz[ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS];
+	__le32 ac_mu_mimo_grp_sz_ext[ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS];
+} __packed;
+
+struct ath12k_htt_tx_pdev_mumimo_grp_stats_tlv {
+	__le32 dl_mumimo_grp_best_grp_size[ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ];
+	__le32 dl_mumimo_grp_best_num_usrs[ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS];
+	__le32 dl_mumimo_grp_eligible[ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ];
+	__le32 dl_mumimo_grp_ineligible[ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ];
+	__le32 dl_mumimo_grp_invalid[ATH12K_HTT_TX_NUM_MUMIMO_GRP_INVALID_WORDS];
+	__le32 dl_mumimo_grp_tputs[ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS];
+	__le32 ul_mumimo_grp_best_grp_size[ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ];
+	__le32 ul_mumimo_grp_best_usrs[ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS];
+	__le32 ul_mumimo_grp_tputs[ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS];
+} __packed;
+
+enum ath12k_htt_stats_tx_sched_modes {
+	ATH12K_HTT_STATS_TX_SCHED_MODE_MU_MIMO_AC = 0,
+	ATH12K_HTT_STATS_TX_SCHED_MODE_MU_MIMO_AX,
+	ATH12K_HTT_STATS_TX_SCHED_MODE_MU_OFDMA_AX,
+	ATH12K_HTT_STATS_TX_SCHED_MODE_MU_OFDMA_BE,
+	ATH12K_HTT_STATS_TX_SCHED_MODE_MU_MIMO_BE
+};
+
+struct ath12k_htt_tx_pdev_mpdu_stats_tlv {
+	__le32 mpdus_queued_usr;
+	__le32 mpdus_tried_usr;
+	__le32 mpdus_failed_usr;
+	__le32 mpdus_requeued_usr;
+	__le32 err_no_ba_usr;
+	__le32 mpdu_underrun_usr;
+	__le32 ampdu_underrun_usr;
+	__le32 user_index;
+	__le32 tx_sched_mode;
+} __packed;
+
 #endif
-- 
2.25.1


