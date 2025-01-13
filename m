Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD02E7719F
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 07:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSD/9u6TxRmhR3v5SUKZ+W1yoiTBBGRPMQmp5Cg6ZOA=; b=IrlVd77XDCD67RICCHGBAPugaZ
	ieX7FO7vM0OTD0K1u5LLMyXaXS891kwxnS7it7NhhSeokCqOpSARm6MupM8hregZroEaPsKzYEjST
	A2nN/qfuTh/E/UcTRma0gc/5EZcf2rDkw+jHHbpZ+/ME0k96Q11Ql2XcxVOIPqjy5Qnyd7eN4xaWE
	yMbClmm90Chq0IdZ9Kn4PwKsD80xyhw3vLd3SRirUPNU0Mu2IcEBG67/oVYsiMIOoFDmeMjVXjKBl
	x0yXoT78PHSJlS4ayOtza+LjR2fV/cVFCOYacCShohuQUkwHYgQgDng9D/S9zLiGQ9twy4O+83Yae
	B1YA9sXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEcW-00000004D0F-2UTN
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 07:12:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEcU-00000004Cyd-2Plv
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 07:12:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D1pXFM012145;
	Mon, 13 Jan 2025 07:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSD/9u6TxRmhR3v5SUKZ+W1yoiTBBGRPMQmp5Cg6ZOA=; b=I33CUvS79iXgxHOt
	xjUsmOEJfi0ZPX0YLyHWt+Fb6Zw9AZqItbr1CwPnwA/fibAANgmprNbuKpPLMgCo
	8SEMemzvUDqbT3xQGZFFm9uuqo0yqbouiwnb7KTY94Igsi3pyr48lqvLxHx8FXhw
	4l4/yth7btrKeIW3kh4++shHLW8YpiNGZocpkW2A3wRK+gd9F1Bi01Zys5dr/Rop
	+H5HL2qAekJDc1TiRmpKIn7cbW8S4/vbI5reJr6Ev3uD50S/3tCbmvf2YNWafmph
	WPNhzPUWKkU+fky/NimoW22r+nTjwZffbTnD4Xi//kxnVg31udjnItIvHlrtrrvL
	oztk2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444shqgm5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:12:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D7CGe1024383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:12:16 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 23:12:14 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v3 4/6] wifi: ath12k: Add API to print s8 arrays in HTT stats
Date: Mon, 13 Jan 2025 12:41:42 +0530
Message-ID: <20250113071144.3397293-5-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
References: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IHRC48rcYUcclhr_T7hyOZTjjYMg0lqE
X-Proofpoint-GUID: IHRC48rcYUcclhr_T7hyOZTjjYMg0lqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=806 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231218_736731_D31DCEC9 
X-CRM114-Status: GOOD (  12.62  )
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

Currently, print_array_to_buf() is used to print arrays to HTT
stats buffer. This function supports printing only arrays with
32-bit unsigned integers. Add print_array_to_buf_s8(), which
implements print_array_to_buf()'s functionality to all the
arrays with 8-bit signed integers.

Sample output:
rx_ul_mumimo_target_rssi: user_0  =  0:-128, 1:-128, 2:-128, 3:-128
rx_ul_mumimo_target_rssi: user_1  =  0:-128, 1:-128, 2:-128, 3:-128
rx_ul_mumimo_target_rssi: user_2  =  0:-128, 1:-128, 2:-128, 3:-128

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 77c51269669f..92935134735a 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 					footer);
 }
 
+static u32
+print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
+		      const s8 *array, u32 array_len, const char *footer)
+{
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	int index = 0;
+	u8 i;
+
+	if (header)
+		index += scnprintf(buf + offset, buf_len - offset, "%s = ", header);
+
+	for (i = 0; i < array_len; i++) {
+		index += scnprintf(buf + offset + index, (buf_len - offset) - index,
+				   " %u:%d,", stats_index++, array[i]);
+	}
+
+	index--;
+	if ((offset + index) < buf_len)
+		buf[offset + index] = '\0';
+
+	if (footer) {
+		index += scnprintf(buf + offset + index, (buf_len - offset) - index,
+				   "%s", footer);
+	}
+
+	return index;
+}
+
 static const char *ath12k_htt_ax_tx_rx_ru_size_to_str(u8 ru_size)
 {
 	switch (ru_size) {
-- 
2.25.1


