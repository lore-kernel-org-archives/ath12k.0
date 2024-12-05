Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E2CE77172
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 01:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SIo8PsZjq5cs7jYg0cB8Cl5y7oU0VmHjpCAzV2h388=; b=xCRhpZEkvK7wz6LOP9QyoPRl5i
	1DLjg5DwretcgXyo0ZvIJnq5Kzm3sbjAXHTtpik6qgrAFEhJaZbmetL9uH+MRUXd/dOojgzM8w8/H
	BM2Uxd59w6RbJJAJ3whwYCMoahu2wIcMR+7B1+FFls/MA3ZHnuQBc9pSMb9dGzQokxUik27DDWEjJ
	XarqSfmZDiZTPxjUrowPmK1NJFpryWbO0rmT/9giGIrul3ebvvcEHxmBHLZpf9YESK8MmAQ/vyasi
	W2Xc5XHj/aSDZw/U13TP+SUt8CJLIR09lLUqBwDzXrURPjIOt9Z0sC2TCiqNAn5Gv5pdnwJgaIdti
	PeDTkdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ0MX-0000000ER7X-47Gu
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 01:09:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ0Lo-0000000ER07-1fT0
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 01:08:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B50LRrD026044;
	Thu, 5 Dec 2024 01:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SIo8PsZjq5cs7jYg0cB8Cl5y7oU0VmHjpCAzV2h388=; b=kms+6UGf5nasjwQV
	kh4R/AInv8gDBFxUdSh1o7VqN9H5Sazn28mrrWmwOUS3Saxp5DLB9ExefAzpHcfz
	twHQebMEa7PNbf6jr7L1TX0bh2akRPvxuPvNTBro2vEagGuDkZ7qCn0zUYEDjVcX
	o8AHlreMTFDRiCGvNiq2Z1vxlWcRcngHxoDcjieok74E4hQwZUzJNnPgeKXRXW33
	C9j5sXbdrt4EktEj6ZC8WMllE42w/BA+AJsEAMUwdsmOEephBJQSEJEDCVuRVsmX
	oh4WMj3JTcBQ1Qzbnczao+FdsKt70eKUsg6T0CmoCJ1YILpp8TChbYR3k0m7TcMK
	il5rOw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9ncny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 01:08:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B518EOW031167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 01:08:14 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 17:08:12 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2 2/8] wifi: ath12k: Refactor monitor status TLV structure
Date: Thu, 5 Dec 2024 06:37:48 +0530
Message-ID: <20241205010754.2846603-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205010754.2846603-1-quic_periyasa@quicinc.com>
References: <20241205010754.2846603-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZPKjBspWI53kMklFCUEO5Po1cBVFYLTK
X-Proofpoint-GUID: ZPKjBspWI53kMklFCUEO5Po1cBVFYLTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_170816_552339_A78E6476 
X-CRM114-Status: GOOD (  12.13  )
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

The following TLV structures and bitmask definitions were inherited from
the ath11k but were not updated for the ath12k 802.11be hardware. These
data structure and bitmask will be used to parse the monitor status
TLV data in the Rx path.

1. hal_rx_ppdu_end_user_stats_ext structure
2. hal_rx_ppdu_end_duration structure
3. HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF bitmask
4. HAL_RX_MPDU_START_INFO1_PEERID bitmask
5. HAL_INVALID_PEERID
6. hal_rx_ppdu_end_user_stats bitmask

Currently, there is no issue since the monitor status Rx path is not
enabled. However, in the future, the monitor status Rx path will be
enabled. Therefore, update the above TLV structures and bitmask to align
with the ath12k 802.11be hardware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_rx.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 2de7b0eba9f2..5cf3c5787ab7 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -19,7 +19,7 @@ struct hal_rx_wbm_rel_info {
 	bool hw_cc_done;
 };
 
-#define HAL_INVALID_PEERID 0xffff
+#define HAL_INVALID_PEERID	0x3fff
 #define VHT_SIG_SU_NSS_MASK 0x7
 
 #define HAL_RX_MAX_MCS 12
@@ -245,6 +245,8 @@ struct hal_rx_ppdu_start {
 	__le32 rsvd[2];
 } __packed;
 
+#define HAL_RX_PPDU_END_USER_STATS_INFO0_PEER_ID		GENMASK(13, 0)
+#define HAL_RX_PPDU_END_USER_STATS_INFO0_DEVICE_ID		GENMASK(15, 14)
 #define HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR	GENMASK(26, 16)
 
 #define HAL_RX_PPDU_END_USER_STATS_INFO1_MPDU_CNT_FCS_OK	GENMASK(10, 0)
@@ -299,6 +301,7 @@ struct hal_rx_ppdu_end_user_stats_ext {
 	__le32 info4;
 	__le32 info5;
 	__le32 info6;
+	__le32 rsvd;
 } __packed;
 
 #define HAL_RX_HT_SIG_INFO_INFO0_MCS		GENMASK(6, 0)
@@ -425,7 +428,7 @@ struct hal_rx_he_sig_b2_mu_info {
 
 #define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_ID	GENMASK(10, 0)
 #define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS	GENMASK(13, 11)
-#define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF	BIT(19)
+#define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF	BIT(14)
 #define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_MCS	GENMASK(18, 15)
 #define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_DCM	BIT(19)
 #define HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING	BIT(20)
@@ -453,7 +456,8 @@ struct hal_rx_phyrx_rssi_legacy_info {
 } __packed;
 
 #define HAL_RX_MPDU_START_INFO0_PPDU_ID			GENMASK(31, 16)
-#define HAL_RX_MPDU_START_INFO1_PEERID			GENMASK(31, 16)
+#define HAL_RX_MPDU_START_INFO1_PEERID			GENMASK(29, 16)
+#define HAL_RX_MPDU_START_INFO1_DEVICE_ID		GENMASK(31, 30)
 #define HAL_RX_MPDU_START_INFO2_MPDU_LEN		GENMASK(13, 0)
 struct hal_rx_mpdu_start {
 	__le32 rsvd0[9];
@@ -468,7 +472,7 @@ struct hal_rx_mpdu_start {
 struct hal_rx_ppdu_end_duration {
 	__le32 rsvd0[9];
 	__le32 info0;
-	__le32 rsvd1[4];
+	__le32 rsvd1[18];
 } __packed;
 
 struct hal_rx_rxpcu_classification_overview {
-- 
2.34.1


