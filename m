Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD2FD1715F
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lX6Tiuudtz4TB40toBVkIAo/QSWRw5z0MJCRHJxGUpI=; b=ZzsuIYKUB50oLb1cnYYHTZV5rF
	bpTAiYFHENCDVfAo4OGmcW2LtJgz8O4wgm6uAqnpDw5qincmN6l1gKh33aF1eggTL6ysAuygyxgGd
	mxQRlYQf723iTLs5nd6wH4kYPXAMkH3MiA2vkVpOp3Ma3/N+r59jRwqcIQ8WsN8VfLR8Ub+PFWPaR
	jthtiMTMvlsqZV4gSzNX1By1iL/5nSHSq7kDp9fyDgKw0Tygoai8qMD5h/FiGIxdjmzLXmpBdMntZ
	1v+S8mzorPcoQauHD6DvP/BiusbX7rCxOvgvSTAY9HHVKjMxXM3bVVEV69mfF5RniWW+i9clnchZ0
	IkscMf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CmS-0000000AeU4-2Rzj
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 11:10:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Cl4-0000000AeHA-0tUQ
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 11:09:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M6l3rQ009622;
	Tue, 22 Oct 2024 11:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lX6Tiuudtz4TB40toBVkIAo/QSWRw5z0MJCRHJxGUpI=; b=UAjWwAEVVy44Dgvd
	7Kz/HtbsRKygz2epUm7gUeF0z2UQsNHOKalMO5c7li/Eb377WWQXO20yLSw58qic
	JVhHX4rHBZXI4C/D45fjFDQrNV0JUXaN46+IuTWtOCqSY9wnMxzDR44YhIqf1grz
	CMb8MQzx1l9R3VboE7q/OpNQhtndKgt1O5fQcbB9jlLmrXV6Z3NjqULblKwVVGuu
	Wkv4/wYBBAIFBN6CcorySQmpUOcSrRbMbIqMSIQ9ZTARRQlXBZtZHrAW/Vdli+B0
	n892aEsIbsBCJc1cMb77Unk2tGZetBwI4xod1akAQFMmneOXFxeXIk3vGphVM850
	NauZ8w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkbt4ac9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:09:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MB90Vf027459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:09:00 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 04:08:58 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 5/8] wifi: ath12k: fix struct hal_rx_mpdu_start
Date: Tue, 22 Oct 2024 19:08:28 +0800
Message-ID: <20241022110831.974-6-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241022110831.974-1-quic_kangyang@quicinc.com>
References: <20241022110831.974-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wkGi_IYh5ZUes_7PdAuQr-jWlYV4b-gj
X-Proofpoint-GUID: wkGi_IYh5ZUes_7PdAuQr-jWlYV4b-gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=664 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_040902_390504_4B1AC846 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Current struct hal_rx_mpdu_start in hal_rx.h is not matched with
hardware descriptor definition. This hardware descriptor definition
is determined by hardware. Host shall follow it.

So update struct hal_rx_mpdu_start and related code.

Both QCN9274 and WCN7850 need this modification.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_rx.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index c69df852ae69..2de7b0eba9f2 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -452,15 +452,16 @@ struct hal_rx_phyrx_rssi_legacy_info {
 	__le32 rsvd1;
 } __packed;
 
-#define HAL_RX_MPDU_START_INFO0_PPDU_ID	GENMASK(31, 16)
-#define HAL_RX_MPDU_START_INFO1_PEERID	GENMASK(31, 16)
-#define HAL_RX_MPDU_START_INFO2_MPDU_LEN GENMASK(13, 0)
+#define HAL_RX_MPDU_START_INFO0_PPDU_ID			GENMASK(31, 16)
+#define HAL_RX_MPDU_START_INFO1_PEERID			GENMASK(31, 16)
+#define HAL_RX_MPDU_START_INFO2_MPDU_LEN		GENMASK(13, 0)
 struct hal_rx_mpdu_start {
+	__le32 rsvd0[9];
 	__le32 info0;
 	__le32 info1;
-	__le32 rsvd1[11];
+	__le32 rsvd1[2];
 	__le32 info2;
-	__le32 rsvd2[9];
+	__le32 rsvd2[16];
 } __packed;
 
 #define HAL_RX_PPDU_END_DURATION	GENMASK(23, 0)
-- 
2.34.1


