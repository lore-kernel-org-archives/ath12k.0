Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D5CCCF9E3
	for <ath12k@archiver.kernel.org>; Mon, 10 Nov 2025 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOHGjlnbO3xkh0TT8O9lLH6KWHsEx5heJCE8eWAq+rc=; b=Kc9CBHYDx2f77nZhMJfSnD38E4
	3MWdNph4j4ts5pDfa6/ZDto/Fjiwh0V6NJpeqbU82PJqO5eda+7fHKqGhdOiwBVaHtg3BO0HTIqoY
	QvXqVHYiRbTNyVr/Yx3JntTxyLtzs9hZT8wkBg0LMDGybLtZ1hTW2VsXzIIgJDpCD5GUrEwmf/h31
	EsGaVS1jKqXQQQh3ZKIRnifWJq+24izXVWx8YDLiq9kfA1FMpOI3pfTG+lV1gZIWeJvrLD0ij6suQ
	Cf1yIkir1nSsHgjCrEwNsKBp8AQZXLESOBj3Cgt9oNlkCQhtkuYuv52FUjE43vV8BtSZq/+5AA43+
	ae9GAWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHH-00000005C3M-3A21;
	Mon, 10 Nov 2025 10:37:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPH8-00000005Btv-2J2d
	for ath12k@bombadil.infradead.org;
	Mon, 10 Nov 2025 10:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IOHGjlnbO3xkh0TT8O9lLH6KWHsEx5heJCE8eWAq+rc=; b=ScrtYBuBqpgjknXr1I+ZEEgB1X
	bikZ24R5s70a1DGgjA2rf+85PZM2MV3f78Xg43nWVTxqQAzVN0pMvgumE3lefondBeQ9UmyAJq63F
	7K6pdFVxbCVQ288L+V0NsFoV/iMGb0sLTZODB3SvrtJZEwl1ur7mlDyXC4y6l+nO/vjgQncGqhkcM
	Vf7GFzh4zu8nvry6+gRxC/TS5DCvXFZzINmP/YOwxfHJcZNfKGZRv9wcKEvp2cZ2psPIo0K7HgYmk
	WjHWVRdUCKzK43Ye5WQXSlIv5vHn50c1B6PocUCIWX5f+eMNNVm6/S/WTo1EhWXWVgZ1dm6svATWi
	J/tnUQfw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOPO-0000000AOrT-3cMj
	for ath12k@lists.infradead.org;
	Mon, 10 Nov 2025 09:42:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9CfZD3146224;
	Mon, 10 Nov 2025 10:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IOHGjlnbO3x
	kh0TT8O9lLH6KWHsEx5heJCE8eWAq+rc=; b=VKMdhG5TB1Ne4cWdp+3wPg6SuCh
	m1xsVo3qB6hEKYqNYt88y3HtJrA8LkWZSAw5E6f0YQAD4sxymTcIvWE3SCyCd4H/
	kKIS8q3/zg9gw++2vLZTVvgTKibLF157PMC/EgbmtR2Ko9m/hb5BZeKBmcBFF5eH
	TJ4Mglm5+OQ4ZD3IjxDFgVr3W7KR+8g+zjijLm0WwM0pGS4+lYQ5vIXOR5g401U7
	dEUpyTjZJu5PWxjM9dVbYUXMOm7CF82PkqSdmmgDw126BP2atJreiw7rreAtr7UQ
	wB3GfBStNKQ5OeN21WyKOLCc1v7rAmzytwmlYCXZgyITX7X0waxyvtvl2WA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7hr911-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:37:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAAbHV3008071;
	Mon, 10 Nov 2025 10:37:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkq1gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:37:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AAAbHOX008044;
	Mon, 10 Nov 2025 10:37:18 GMT
Received: from hu-devc-blr-u22-c.qualcomm.com (hu-aloksing-blr.qualcomm.com [10.190.111.138])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AAAbIhv008091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:37:18 +0000
Received: by hu-devc-blr-u22-c.qualcomm.com (Postfix, from userid 2272527)
	id 93E77B71; Mon, 10 Nov 2025 16:07:16 +0530 (+0530)
From: Alok Singh <quic_aloksing@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Alok Singh <quic_aloksing@quicinc.com>
Subject: [PATCH ath12k-ng 07/12] wifi: ath12k: Move HE SIG processing to Wi-Fi 7 module
Date: Mon, 10 Nov 2025 16:07:08 +0530
Message-Id: <20251110103713.3484779-8-quic_aloksing@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
References: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _L5T2VsQ3r_1iTGstX9XSPdwv-iqDMU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MiBTYWx0ZWRfX2liyVuIQviTd
 NsjhN9OIlX7BNzhVIBRsb97Kh+xbetNRJiqyfhxsJPQjz2tDzUiRsEqAXnxGB9T/lyHW2SsXcVW
 lM2vDz+L8g9vqQqN4LOpKgkxPB/IpT9EZ2HYKT4SD16mXvZWQLMw/CSaKx9XC/zhWUhz8qgyXFQ
 eGkd6GLfWp1h87CCReTX+dwHqrG9UZMeYFqzWuXwxPlbNIUytzDsIFgSRahUqHqrfM4g0WbpkYK
 xDkIfBcdtEySbEuXElRxwEROzAqM4eSzPyfwxYsteMgyLA2fUWXfhJq/rTv1IHeVDLs9l6vsWYF
 oO6Bs0J9dFRZDdispSvmE7RtgbquSJb2ZFNIgjubbrt790oH5NnwJFcVr7xPJ0uMwQwugwJFa1m
 NYrVP5tbHNhuVZQ36b78PvPdcLPw7Q==
X-Proofpoint-ORIG-GUID: _L5T2VsQ3r_1iTGstX9XSPdwv-iqDMU8
X-Authority-Analysis: v=2.4 cv=Yt4ChoYX c=1 sm=1 tr=0 ts=6911c062 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=DQTqEAmwNBtFOvnCKkoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094159_303916_5917FACE 
X-CRM114-Status: GOOD (  10.80  )
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

Separate Wi-Fi 7-specific monitor code from ath12k common code to
improve modularity.

Move following HE SIG processing functions to the wifi7/dp_mon.c and
rename the relocated functions with the ath12k_wifi7 prefix:
- ath12k_dp_mon_parse_he_sig_b2_ofdma()
- ath12k_dp_mon_parse_he_sig_b2_mu()
- ath12k_dp_mon_parse_he_sig_b1_mu()
- ath12k_dp_mon_parse_he_sig_mu()
- ath12k_dp_mon_parse_he_sig_su()

Export helper functions required by the ath12k_wifi7 module.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Alok Singh <quic_aloksing@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 360 -----------------
 drivers/net/wireless/ath/ath12k/dp_mon.h      |  14 -
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 380 +++++++++++++++++-
 3 files changed, 370 insertions(+), 384 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 879dc86fcdb7..df9203d90f00 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -153,366 +153,6 @@ void ath12k_dp_mon_parse_l_sig_a(const struct hal_rx_lsig_a_info *lsiga,
 }
 EXPORT_SYMBOL(ath12k_dp_mon_parse_l_sig_a);
 
-void
-ath12k_dp_mon_parse_he_sig_b2_ofdma(const struct hal_rx_he_sig_b2_ofdma_info *ofdma,
-				    struct hal_rx_mon_ppdu_info *ppdu_info)
-{
-	u32 info0, value;
-
-	info0 = __le32_to_cpu(ofdma->info0);
-
-	ppdu_info->he_data1 |= HE_MCS_KNOWN | HE_DCM_KNOWN | HE_CODING_KNOWN;
-
-	/* HE-data2 */
-	ppdu_info->he_data2 |= HE_TXBF_KNOWN;
-
-	ppdu_info->mcs = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_MCS);
-	value = ppdu_info->mcs << HE_TRANSMIT_MCS_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_DCM);
-	value = value << HE_DCM_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING);
-	ppdu_info->ldpc = value;
-	value = value << HE_CODING_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	/* HE-data4 */
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_ID);
-	value = value << HE_STA_ID_SHIFT;
-	ppdu_info->he_data4 |= value;
-
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS);
-	ppdu_info->beamformed = u32_get_bits(info0,
-					     HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF);
-}
-EXPORT_SYMBOL(ath12k_dp_mon_parse_he_sig_b2_ofdma);
-
-void
-ath12k_dp_mon_parse_he_sig_b2_mu(const struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu,
-				 struct hal_rx_mon_ppdu_info *ppdu_info)
-{
-	u32 info0, value;
-
-	info0 = __le32_to_cpu(he_sig_b2_mu->info0);
-
-	ppdu_info->he_data1 |= HE_MCS_KNOWN | HE_CODING_KNOWN;
-
-	ppdu_info->mcs = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_MCS);
-	value = ppdu_info->mcs << HE_TRANSMIT_MCS_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING);
-	ppdu_info->ldpc = value;
-	value = value << HE_CODING_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_ID);
-	value = value << HE_STA_ID_SHIFT;
-	ppdu_info->he_data4 |= value;
-
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS);
-}
-EXPORT_SYMBOL(ath12k_dp_mon_parse_he_sig_b2_mu);
-
-void
-ath12k_dp_mon_parse_he_sig_b1_mu(const struct hal_rx_he_sig_b1_mu_info *he_sig_b1_mu,
-				 struct hal_rx_mon_ppdu_info *ppdu_info)
-{
-	u32 info0 = __le32_to_cpu(he_sig_b1_mu->info0);
-	u16 ru_tones;
-
-	ru_tones = u32_get_bits(info0,
-				HAL_RX_HE_SIG_B1_MU_INFO_INFO0_RU_ALLOCATION);
-	ppdu_info->ru_alloc = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
-	ppdu_info->he_RU[0] = ru_tones;
-}
-EXPORT_SYMBOL(ath12k_dp_mon_parse_he_sig_b1_mu);
-
-void
-ath12k_dp_mon_parse_he_sig_mu(const struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl,
-			      struct hal_rx_mon_ppdu_info *ppdu_info)
-{
-	u32 info0, info1, value;
-	u16 he_gi = 0, he_ltf = 0;
-
-	info0 = __le32_to_cpu(he_sig_a_mu_dl->info0);
-	info1 = __le32_to_cpu(he_sig_a_mu_dl->info1);
-
-	ppdu_info->he_mu_flags = 1;
-
-	ppdu_info->he_data1 = HE_MU_FORMAT_TYPE;
-	ppdu_info->he_data1 |=
-			HE_BSS_COLOR_KNOWN |
-			HE_DL_UL_KNOWN |
-			HE_LDPC_EXTRA_SYMBOL_KNOWN |
-			HE_STBC_KNOWN |
-			HE_DATA_BW_RU_KNOWN |
-			HE_DOPPLER_KNOWN;
-
-	ppdu_info->he_data2 =
-			HE_GI_KNOWN |
-			HE_LTF_SYMBOLS_KNOWN |
-			HE_PRE_FEC_PADDING_KNOWN |
-			HE_PE_DISAMBIGUITY_KNOWN |
-			HE_TXOP_KNOWN |
-			HE_MIDABLE_PERIODICITY_KNOWN;
-
-	/* data3 */
-	ppdu_info->he_data3 = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_BSS_COLOR);
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_UL_FLAG);
-	value = value << HE_DL_UL_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_LDPC_EXTRA);
-	value = value << HE_LDPC_EXTRA_SYMBOL_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_STBC);
-	value = value << HE_STBC_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	/* data4 */
-	ppdu_info->he_data4 = u32_get_bits(info0,
-					   HAL_RX_HE_SIG_A_MU_DL_INFO0_SPATIAL_REUSE);
-	ppdu_info->he_data4 = value;
-
-	/* data5 */
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_TRANSMIT_BW);
-	ppdu_info->he_data5 = value;
-	ppdu_info->bw = value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_CP_LTF_SIZE);
-	switch (value) {
-	case 0:
-		he_gi = HE_GI_0_8;
-		he_ltf = HE_LTF_4_X;
-		break;
-	case 1:
-		he_gi = HE_GI_0_8;
-		he_ltf = HE_LTF_2_X;
-		break;
-	case 2:
-		he_gi = HE_GI_1_6;
-		he_ltf = HE_LTF_2_X;
-		break;
-	case 3:
-		he_gi = HE_GI_3_2;
-		he_ltf = HE_LTF_4_X;
-		break;
-	}
-
-	ppdu_info->gi = he_gi;
-	value = he_gi << HE_GI_SHIFT;
-	ppdu_info->he_data5 |= value;
-
-	value = he_ltf << HE_LTF_SIZE_SHIFT;
-	ppdu_info->he_data5 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_NUM_LTF_SYMB);
-	value = (value << HE_LTF_SYM_SHIFT);
-	ppdu_info->he_data5 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_PKT_EXT_FACTOR);
-	value = value << HE_PRE_FEC_PAD_SHIFT;
-	ppdu_info->he_data5 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_PKT_EXT_PE_DISAM);
-	value = value << HE_PE_DISAMBIGUITY_SHIFT;
-	ppdu_info->he_data5 |= value;
-
-	/*data6*/
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_DOPPLER_INDICATION);
-	value = value << HE_DOPPLER_SHIFT;
-	ppdu_info->he_data6 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_TXOP_DURATION);
-	value = value << HE_TXOP_SHIFT;
-	ppdu_info->he_data6 |= value;
-
-	/* HE-MU Flags */
-	/* HE-MU-flags1 */
-	ppdu_info->he_flags1 =
-		HE_SIG_B_MCS_KNOWN |
-		HE_SIG_B_DCM_KNOWN |
-		HE_SIG_B_COMPRESSION_FLAG_1_KNOWN |
-		HE_SIG_B_SYM_NUM_KNOWN |
-		HE_RU_0_KNOWN;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_MCS_OF_SIGB);
-	ppdu_info->he_flags1 |= value;
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_DCM_OF_SIGB);
-	value = value << HE_DCM_FLAG_1_SHIFT;
-	ppdu_info->he_flags1 |= value;
-
-	/* HE-MU-flags2 */
-	ppdu_info->he_flags2 = HE_BW_KNOWN;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_TRANSMIT_BW);
-	ppdu_info->he_flags2 |= value;
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_COMP_MODE_SIGB);
-	value = value << HE_SIG_B_COMPRESSION_FLAG_2_SHIFT;
-	ppdu_info->he_flags2 |= value;
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_NUM_SIGB_SYMB);
-	value = value - 1;
-	value = value << HE_NUM_SIG_B_SYMBOLS_SHIFT;
-	ppdu_info->he_flags2 |= value;
-
-	ppdu_info->is_stbc = info1 &
-			     HAL_RX_HE_SIG_A_MU_DL_INFO1_STBC;
-}
-EXPORT_SYMBOL(ath12k_dp_mon_parse_he_sig_mu);
-
-void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *he_sig_a,
-				   struct hal_rx_mon_ppdu_info *ppdu_info)
-{
-	u32 info0, info1, value;
-	u32 dcm;
-	u8 he_dcm = 0, he_stbc = 0;
-	u16 he_gi = 0, he_ltf = 0;
-
-	ppdu_info->he_flags = 1;
-
-	info0 = __le32_to_cpu(he_sig_a->info0);
-	info1 = __le32_to_cpu(he_sig_a->info1);
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_FORMAT_IND);
-	if (value == 0)
-		ppdu_info->he_data1 = HE_TRIG_FORMAT_TYPE;
-	else
-		ppdu_info->he_data1 = HE_SU_FORMAT_TYPE;
-
-	ppdu_info->he_data1 |=
-			HE_BSS_COLOR_KNOWN |
-			HE_BEAM_CHANGE_KNOWN |
-			HE_DL_UL_KNOWN |
-			HE_MCS_KNOWN |
-			HE_DCM_KNOWN |
-			HE_CODING_KNOWN |
-			HE_LDPC_EXTRA_SYMBOL_KNOWN |
-			HE_STBC_KNOWN |
-			HE_DATA_BW_RU_KNOWN |
-			HE_DOPPLER_KNOWN;
-
-	ppdu_info->he_data2 |=
-			HE_GI_KNOWN |
-			HE_TXBF_KNOWN |
-			HE_PE_DISAMBIGUITY_KNOWN |
-			HE_TXOP_KNOWN |
-			HE_LTF_SYMBOLS_KNOWN |
-			HE_PRE_FEC_PADDING_KNOWN |
-			HE_MIDABLE_PERIODICITY_KNOWN;
-
-	ppdu_info->he_data3 = u32_get_bits(info0,
-					   HAL_RX_HE_SIG_A_SU_INFO_INFO0_BSS_COLOR);
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_BEAM_CHANGE);
-	value = value << HE_BEAM_CHANGE_SHIFT;
-	ppdu_info->he_data3 |= value;
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DL_UL_FLAG);
-	value = value << HE_DL_UL_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS);
-	ppdu_info->mcs = value;
-	value = value << HE_TRANSMIT_MCS_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM);
-	he_dcm = value;
-	value = value << HE_DCM_SHIFT;
-	ppdu_info->he_data3 |= value;
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING);
-	value = value << HE_CODING_SHIFT;
-	ppdu_info->he_data3 |= value;
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_LDPC_EXTRA);
-	value = value << HE_LDPC_EXTRA_SYMBOL_SHIFT;
-	ppdu_info->he_data3 |= value;
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC);
-	he_stbc = value;
-	value = value << HE_STBC_SHIFT;
-	ppdu_info->he_data3 |= value;
-
-	/* data4 */
-	ppdu_info->he_data4 = u32_get_bits(info0,
-					   HAL_RX_HE_SIG_A_SU_INFO_INFO0_SPATIAL_REUSE);
-
-	/* data5 */
-	value = u32_get_bits(info0,
-			     HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW);
-	ppdu_info->he_data5 = value;
-	ppdu_info->bw = value;
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_CP_LTF_SIZE);
-	switch (value) {
-	case 0:
-		he_gi = HE_GI_0_8;
-		he_ltf = HE_LTF_1_X;
-		break;
-	case 1:
-		he_gi = HE_GI_0_8;
-		he_ltf = HE_LTF_2_X;
-		break;
-	case 2:
-		he_gi = HE_GI_1_6;
-		he_ltf = HE_LTF_2_X;
-		break;
-	case 3:
-		if (he_dcm && he_stbc) {
-			he_gi = HE_GI_0_8;
-			he_ltf = HE_LTF_4_X;
-		} else {
-			he_gi = HE_GI_3_2;
-			he_ltf = HE_LTF_4_X;
-		}
-		break;
-	}
-	ppdu_info->gi = he_gi;
-	value = he_gi << HE_GI_SHIFT;
-	ppdu_info->he_data5 |= value;
-	value = he_ltf << HE_LTF_SIZE_SHIFT;
-	ppdu_info->ltf_size = he_ltf;
-	ppdu_info->he_data5 |= value;
-
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
-	value = (value << HE_LTF_SYM_SHIFT);
-	ppdu_info->he_data5 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_PKT_EXT_FACTOR);
-	value = value << HE_PRE_FEC_PAD_SHIFT;
-	ppdu_info->he_data5 |= value;
-
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF);
-	value = value << HE_TXBF_SHIFT;
-	ppdu_info->he_data5 |= value;
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_PKT_EXT_PE_DISAM);
-	value = value << HE_PE_DISAMBIGUITY_SHIFT;
-	ppdu_info->he_data5 |= value;
-
-	/* data6 */
-	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
-	value++;
-	ppdu_info->he_data6 = value;
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_DOPPLER_IND);
-	value = value << HE_DOPPLER_SHIFT;
-	ppdu_info->he_data6 |= value;
-	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXOP_DURATION);
-	value = value << HE_TXOP_SHIFT;
-	ppdu_info->he_data6 |= value;
-
-	ppdu_info->mcs =
-		u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS);
-	ppdu_info->bw =
-		u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW);
-	ppdu_info->ldpc = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING);
-	ppdu_info->is_stbc = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC);
-	ppdu_info->beamformed = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF);
-	dcm = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM);
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
-	ppdu_info->dcm = dcm;
-}
-EXPORT_SYMBOL(ath12k_dp_mon_parse_he_sig_su);
-
 static void
 ath12k_dp_mon_hal_rx_parse_u_sig_cmn(const struct hal_mon_usig_cmn *cmn,
 				     struct hal_rx_mon_ppdu_info *ppdu_info)
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index 86d0c18d8c07..90811a2f75a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -128,20 +128,6 @@ void ath12k_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
 void ath12k_dp_mon_parse_l_sig_a(const struct hal_rx_lsig_a_info *lsiga,
 				 struct hal_rx_mon_ppdu_info *ppdu_info);
 void
-ath12k_dp_mon_parse_he_sig_b2_ofdma(const struct hal_rx_he_sig_b2_ofdma_info *ofdma,
-				    struct hal_rx_mon_ppdu_info *ppdu_info);
-void
-ath12k_dp_mon_parse_he_sig_b2_mu(const struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu,
-				 struct hal_rx_mon_ppdu_info *ppdu_info);
-void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *he_sig_a,
-				   struct hal_rx_mon_ppdu_info *ppdu_info);
-void
-ath12k_dp_mon_parse_he_sig_b1_mu(const struct hal_rx_he_sig_b1_mu_info *he_sig_b1_mu,
-				 struct hal_rx_mon_ppdu_info *ppdu_info);
-void
-ath12k_dp_mon_parse_he_sig_mu(const struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl,
-			      struct hal_rx_mon_ppdu_info *ppdu_info);
-void
 ath12k_dp_mon_hal_rx_parse_user_info(const struct hal_receive_user_info *rx_usr_info,
 				     u16 user_id,
 				     struct hal_rx_mon_ppdu_info *ppdu_info);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 0c83df4be9da..f6d41ded5715 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -76,6 +76,362 @@ ath12k_wifi7_dp_mon_parse_ht_sig(const struct hal_rx_ht_sig_info *ht_sig,
 	ppdu_info->nss = (ppdu_info->mcs >> 3);
 }
 
+static void
+ath12k_wifi7_dp_mon_parse_he_sig_b2_ofdma(const struct hal_rx_he_sig_b2_ofdma_info *ofdma,
+					  struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	u32 info0, value;
+
+	info0 = __le32_to_cpu(ofdma->info0);
+
+	ppdu_info->he_data1 |= HE_MCS_KNOWN | HE_DCM_KNOWN | HE_CODING_KNOWN;
+
+	/* HE-data2 */
+	ppdu_info->he_data2 |= HE_TXBF_KNOWN;
+
+	ppdu_info->mcs = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_MCS);
+	value = ppdu_info->mcs << HE_TRANSMIT_MCS_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_DCM);
+	value = value << HE_DCM_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING);
+	ppdu_info->ldpc = value;
+	value = value << HE_CODING_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	/* HE-data4 */
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_ID);
+	value = value << HE_STA_ID_SHIFT;
+	ppdu_info->he_data4 |= value;
+
+	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS);
+	ppdu_info->beamformed = u32_get_bits(info0,
+					     HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF);
+}
+
+static void
+ath12k_wifi7_dp_mon_parse_he_sig_b2_mu(const struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu,
+				       struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	u32 info0, value;
+
+	info0 = __le32_to_cpu(he_sig_b2_mu->info0);
+
+	ppdu_info->he_data1 |= HE_MCS_KNOWN | HE_CODING_KNOWN;
+
+	ppdu_info->mcs = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_MCS);
+	value = ppdu_info->mcs << HE_TRANSMIT_MCS_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING);
+	ppdu_info->ldpc = value;
+	value = value << HE_CODING_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_ID);
+	value = value << HE_STA_ID_SHIFT;
+	ppdu_info->he_data4 |= value;
+
+	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS);
+}
+
+static void
+ath12k_wifi7_dp_mon_parse_he_sig_b1_mu(const struct hal_rx_he_sig_b1_mu_info *he_sig_b1_mu,
+				       struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	u32 info0 = __le32_to_cpu(he_sig_b1_mu->info0);
+	u16 ru_tones;
+
+	ru_tones = u32_get_bits(info0,
+				HAL_RX_HE_SIG_B1_MU_INFO_INFO0_RU_ALLOCATION);
+	ppdu_info->ru_alloc = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
+	ppdu_info->he_RU[0] = ru_tones;
+}
+
+static void
+ath12k_wifi7_dp_mon_parse_he_sig_mu(const struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl,
+				    struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	u32 info0, info1, value;
+	u16 he_gi = 0, he_ltf = 0;
+
+	info0 = __le32_to_cpu(he_sig_a_mu_dl->info0);
+	info1 = __le32_to_cpu(he_sig_a_mu_dl->info1);
+
+	ppdu_info->he_mu_flags = 1;
+
+	ppdu_info->he_data1 = HE_MU_FORMAT_TYPE;
+	ppdu_info->he_data1 |=
+			HE_BSS_COLOR_KNOWN |
+			HE_DL_UL_KNOWN |
+			HE_LDPC_EXTRA_SYMBOL_KNOWN |
+			HE_STBC_KNOWN |
+			HE_DATA_BW_RU_KNOWN |
+			HE_DOPPLER_KNOWN;
+
+	ppdu_info->he_data2 =
+			HE_GI_KNOWN |
+			HE_LTF_SYMBOLS_KNOWN |
+			HE_PRE_FEC_PADDING_KNOWN |
+			HE_PE_DISAMBIGUITY_KNOWN |
+			HE_TXOP_KNOWN |
+			HE_MIDABLE_PERIODICITY_KNOWN;
+
+	/* data3 */
+	ppdu_info->he_data3 = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_BSS_COLOR);
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_UL_FLAG);
+	value = value << HE_DL_UL_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_LDPC_EXTRA);
+	value = value << HE_LDPC_EXTRA_SYMBOL_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_STBC);
+	value = value << HE_STBC_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	/* data4 */
+	ppdu_info->he_data4 = u32_get_bits(info0,
+					   HAL_RX_HE_SIG_A_MU_DL_INFO0_SPATIAL_REUSE);
+	ppdu_info->he_data4 = value;
+
+	/* data5 */
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_TRANSMIT_BW);
+	ppdu_info->he_data5 = value;
+	ppdu_info->bw = value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_CP_LTF_SIZE);
+	switch (value) {
+	case 0:
+		he_gi = HE_GI_0_8;
+		he_ltf = HE_LTF_4_X;
+		break;
+	case 1:
+		he_gi = HE_GI_0_8;
+		he_ltf = HE_LTF_2_X;
+		break;
+	case 2:
+		he_gi = HE_GI_1_6;
+		he_ltf = HE_LTF_2_X;
+		break;
+	case 3:
+		he_gi = HE_GI_3_2;
+		he_ltf = HE_LTF_4_X;
+		break;
+	}
+
+	ppdu_info->gi = he_gi;
+	value = he_gi << HE_GI_SHIFT;
+	ppdu_info->he_data5 |= value;
+
+	value = he_ltf << HE_LTF_SIZE_SHIFT;
+	ppdu_info->he_data5 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_NUM_LTF_SYMB);
+	value = (value << HE_LTF_SYM_SHIFT);
+	ppdu_info->he_data5 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_PKT_EXT_FACTOR);
+	value = value << HE_PRE_FEC_PAD_SHIFT;
+	ppdu_info->he_data5 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_PKT_EXT_PE_DISAM);
+	value = value << HE_PE_DISAMBIGUITY_SHIFT;
+	ppdu_info->he_data5 |= value;
+
+	/*data6*/
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_DOPPLER_INDICATION);
+	value = value << HE_DOPPLER_SHIFT;
+	ppdu_info->he_data6 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_MU_DL_INFO1_TXOP_DURATION);
+	value = value << HE_TXOP_SHIFT;
+	ppdu_info->he_data6 |= value;
+
+	/* HE-MU Flags */
+	/* HE-MU-flags1 */
+	ppdu_info->he_flags1 =
+		HE_SIG_B_MCS_KNOWN |
+		HE_SIG_B_DCM_KNOWN |
+		HE_SIG_B_COMPRESSION_FLAG_1_KNOWN |
+		HE_SIG_B_SYM_NUM_KNOWN |
+		HE_RU_0_KNOWN;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_MCS_OF_SIGB);
+	ppdu_info->he_flags1 |= value;
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_DCM_OF_SIGB);
+	value = value << HE_DCM_FLAG_1_SHIFT;
+	ppdu_info->he_flags1 |= value;
+
+	/* HE-MU-flags2 */
+	ppdu_info->he_flags2 = HE_BW_KNOWN;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_TRANSMIT_BW);
+	ppdu_info->he_flags2 |= value;
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_COMP_MODE_SIGB);
+	value = value << HE_SIG_B_COMPRESSION_FLAG_2_SHIFT;
+	ppdu_info->he_flags2 |= value;
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_MU_DL_INFO0_NUM_SIGB_SYMB);
+	value = value - 1;
+	value = value << HE_NUM_SIG_B_SYMBOLS_SHIFT;
+	ppdu_info->he_flags2 |= value;
+
+	ppdu_info->is_stbc = info1 &
+			     HAL_RX_HE_SIG_A_MU_DL_INFO1_STBC;
+}
+
+static void
+ath12k_wifi7_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *he_sig_a,
+				    struct hal_rx_mon_ppdu_info *ppdu_info)
+{
+	u32 info0, info1, value;
+	u32 dcm;
+	u8 he_dcm = 0, he_stbc = 0;
+	u16 he_gi = 0, he_ltf = 0;
+
+	ppdu_info->he_flags = 1;
+
+	info0 = __le32_to_cpu(he_sig_a->info0);
+	info1 = __le32_to_cpu(he_sig_a->info1);
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_FORMAT_IND);
+	if (value == 0)
+		ppdu_info->he_data1 = HE_TRIG_FORMAT_TYPE;
+	else
+		ppdu_info->he_data1 = HE_SU_FORMAT_TYPE;
+
+	ppdu_info->he_data1 |=
+			HE_BSS_COLOR_KNOWN |
+			HE_BEAM_CHANGE_KNOWN |
+			HE_DL_UL_KNOWN |
+			HE_MCS_KNOWN |
+			HE_DCM_KNOWN |
+			HE_CODING_KNOWN |
+			HE_LDPC_EXTRA_SYMBOL_KNOWN |
+			HE_STBC_KNOWN |
+			HE_DATA_BW_RU_KNOWN |
+			HE_DOPPLER_KNOWN;
+
+	ppdu_info->he_data2 |=
+			HE_GI_KNOWN |
+			HE_TXBF_KNOWN |
+			HE_PE_DISAMBIGUITY_KNOWN |
+			HE_TXOP_KNOWN |
+			HE_LTF_SYMBOLS_KNOWN |
+			HE_PRE_FEC_PADDING_KNOWN |
+			HE_MIDABLE_PERIODICITY_KNOWN;
+
+	ppdu_info->he_data3 = u32_get_bits(info0,
+					   HAL_RX_HE_SIG_A_SU_INFO_INFO0_BSS_COLOR);
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_BEAM_CHANGE);
+	value = value << HE_BEAM_CHANGE_SHIFT;
+	ppdu_info->he_data3 |= value;
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DL_UL_FLAG);
+	value = value << HE_DL_UL_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS);
+	ppdu_info->mcs = value;
+	value = value << HE_TRANSMIT_MCS_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM);
+	he_dcm = value;
+	value = value << HE_DCM_SHIFT;
+	ppdu_info->he_data3 |= value;
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING);
+	value = value << HE_CODING_SHIFT;
+	ppdu_info->he_data3 |= value;
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_LDPC_EXTRA);
+	value = value << HE_LDPC_EXTRA_SYMBOL_SHIFT;
+	ppdu_info->he_data3 |= value;
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC);
+	he_stbc = value;
+	value = value << HE_STBC_SHIFT;
+	ppdu_info->he_data3 |= value;
+
+	/* data4 */
+	ppdu_info->he_data4 = u32_get_bits(info0,
+					   HAL_RX_HE_SIG_A_SU_INFO_INFO0_SPATIAL_REUSE);
+
+	/* data5 */
+	value = u32_get_bits(info0,
+			     HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW);
+	ppdu_info->he_data5 = value;
+	ppdu_info->bw = value;
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_CP_LTF_SIZE);
+	switch (value) {
+	case 0:
+		he_gi = HE_GI_0_8;
+		he_ltf = HE_LTF_1_X;
+		break;
+	case 1:
+		he_gi = HE_GI_0_8;
+		he_ltf = HE_LTF_2_X;
+		break;
+	case 2:
+		he_gi = HE_GI_1_6;
+		he_ltf = HE_LTF_2_X;
+		break;
+	case 3:
+		if (he_dcm && he_stbc) {
+			he_gi = HE_GI_0_8;
+			he_ltf = HE_LTF_4_X;
+		} else {
+			he_gi = HE_GI_3_2;
+			he_ltf = HE_LTF_4_X;
+		}
+		break;
+	}
+	ppdu_info->gi = he_gi;
+	value = he_gi << HE_GI_SHIFT;
+	ppdu_info->he_data5 |= value;
+	value = he_ltf << HE_LTF_SIZE_SHIFT;
+	ppdu_info->ltf_size = he_ltf;
+	ppdu_info->he_data5 |= value;
+
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
+	value = (value << HE_LTF_SYM_SHIFT);
+	ppdu_info->he_data5 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_PKT_EXT_FACTOR);
+	value = value << HE_PRE_FEC_PAD_SHIFT;
+	ppdu_info->he_data5 |= value;
+
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF);
+	value = value << HE_TXBF_SHIFT;
+	ppdu_info->he_data5 |= value;
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_PKT_EXT_PE_DISAM);
+	value = value << HE_PE_DISAMBIGUITY_SHIFT;
+	ppdu_info->he_data5 |= value;
+
+	/* data6 */
+	value = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
+	value++;
+	ppdu_info->he_data6 = value;
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_DOPPLER_IND);
+	value = value << HE_DOPPLER_SHIFT;
+	ppdu_info->he_data6 |= value;
+	value = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXOP_DURATION);
+	value = value << HE_TXOP_SHIFT;
+	ppdu_info->he_data6 |= value;
+
+	ppdu_info->mcs =
+		u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS);
+	ppdu_info->bw =
+		u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW);
+	ppdu_info->ldpc = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING);
+	ppdu_info->is_stbc = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC);
+	ppdu_info->beamformed = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF);
+	dcm = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM);
+	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
+	ppdu_info->dcm = dcm;
+}
+
 static enum hal_rx_mon_status
 ath12k_wifi7_dp_mon_rx_parse_status_tlv(struct ath12k_pdev_dp *dp_pdev,
 					struct ath12k_mon_data *pmon,
@@ -230,23 +586,23 @@ ath12k_wifi7_dp_mon_rx_parse_status_tlv(struct ath12k_pdev_dp *dp_pdev,
 		break;
 
 	case HAL_PHYRX_HE_SIG_A_SU:
-		ath12k_dp_mon_parse_he_sig_su(tlv_data, ppdu_info);
+		ath12k_wifi7_dp_mon_parse_he_sig_su(tlv_data, ppdu_info);
 		break;
 
 	case HAL_PHYRX_HE_SIG_A_MU_DL:
-		ath12k_dp_mon_parse_he_sig_mu(tlv_data, ppdu_info);
+		ath12k_wifi7_dp_mon_parse_he_sig_mu(tlv_data, ppdu_info);
 		break;
 
 	case HAL_PHYRX_HE_SIG_B1_MU:
-		ath12k_dp_mon_parse_he_sig_b1_mu(tlv_data, ppdu_info);
+		ath12k_wifi7_dp_mon_parse_he_sig_b1_mu(tlv_data, ppdu_info);
 		break;
 
 	case HAL_PHYRX_HE_SIG_B2_MU:
-		ath12k_dp_mon_parse_he_sig_b2_mu(tlv_data, ppdu_info);
+		ath12k_wifi7_dp_mon_parse_he_sig_b2_mu(tlv_data, ppdu_info);
 		break;
 
 	case HAL_PHYRX_HE_SIG_B2_OFDMA:
-		ath12k_dp_mon_parse_he_sig_b2_ofdma(tlv_data, ppdu_info);
+		ath12k_wifi7_dp_mon_parse_he_sig_b2_ofdma(tlv_data, ppdu_info);
 		break;
 
 	case HAL_PHYRX_RSSI_LEGACY: {
@@ -855,23 +1211,27 @@ ath12k_wifi7_dp_mon_tx_parse_status_tlv(struct ath12k_base *ab,
 	}
 
 	case HAL_MACTX_HE_SIG_A_SU:
-		ath12k_dp_mon_parse_he_sig_su(tlv_data, &tx_ppdu_info->rx_status);
+		ath12k_wifi7_dp_mon_parse_he_sig_su(tlv_data,
+						    &tx_ppdu_info->rx_status);
 		break;
 
 	case HAL_MACTX_HE_SIG_A_MU_DL:
-		ath12k_dp_mon_parse_he_sig_mu(tlv_data, &tx_ppdu_info->rx_status);
+		ath12k_wifi7_dp_mon_parse_he_sig_mu(tlv_data, &tx_ppdu_info->rx_status);
 		break;
 
 	case HAL_MACTX_HE_SIG_B1_MU:
-		ath12k_dp_mon_parse_he_sig_b1_mu(tlv_data, &tx_ppdu_info->rx_status);
+		ath12k_wifi7_dp_mon_parse_he_sig_b1_mu(tlv_data,
+						       &tx_ppdu_info->rx_status);
 		break;
 
 	case HAL_MACTX_HE_SIG_B2_MU:
-		ath12k_dp_mon_parse_he_sig_b2_mu(tlv_data, &tx_ppdu_info->rx_status);
+		ath12k_wifi7_dp_mon_parse_he_sig_b2_mu(tlv_data,
+						       &tx_ppdu_info->rx_status);
 		break;
 
 	case HAL_MACTX_HE_SIG_B2_OFDMA:
-		ath12k_dp_mon_parse_he_sig_b2_ofdma(tlv_data, &tx_ppdu_info->rx_status);
+		ath12k_wifi7_dp_mon_parse_he_sig_b2_ofdma(tlv_data,
+							  &tx_ppdu_info->rx_status);
 		break;
 
 	case HAL_MACTX_VHT_SIG_A:
-- 
2.34.1


