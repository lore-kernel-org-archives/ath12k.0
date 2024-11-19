Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354A4D60D00
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoPZYB7m9Mz0NyzKcvkARhWfTWEvTu/tNyGXysqht5Y=; b=SH60Z76fUVfA6Ab43U0muEMAxM
	lyMrl8u2GxpPx71PFaXQSccP+c3xCa9hvcKBrJKhmyd0eoS+2mjoUGFm+1pMz7xbNm0vssy0+qrhm
	LtUfmbLIiwtny5iS4kSfGSbFiV5wJreurFUFvMO2KH9Ob9aaab7F+4xuld35b+qo7PpKVUyM70NvF
	Y9NgGeMMNtEWalegcdOmomMsn0WOeK4H/G8ykWD89KvXyR17FxtWK8z9L+SBotU0eHO9/5jKhkdtu
	k+n2pzRk9VAarp/7cjjGG0cOoCMN13WiezCi8osEwnnQr4oHk1Q0W/6E7lQ1bNfRkJSCMc7nEaENh
	DNErgrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCB5-0000000AxFg-3LPC
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 00:33:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCB3-0000000AxEU-1fMI
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 00:33:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGHdq9006464;
	Tue, 19 Nov 2024 00:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoPZYB7m9Mz0NyzKcvkARhWfTWEvTu/tNyGXysqht5Y=; b=gBoyes5rw6TCAGNI
	4D9A3e6Xgb/VmBXwQ7+QoSwtlGaGTUTTDeNBqA90MMIELeXWPLVZ6aAu55vmO2w9
	xbhtkFabSY2IW84Qtv3R6YgrnZ9lJK//oX6tiEdnG8RUo2S9qoVc9lo7mgdCV4Ai
	sPOwHI1on4VMZrOXGyNlBk71DQ6oU0wL9dYZYSUasdoeyBX5jAQ0KMBnFlgnVeMb
	7Z8t17KIrTCEzJcyWYfyWukaETLhohi/C/q5+APcXq5iDDf+S7YcqRBIm1L5CBWy
	VTIS7fmRXl3QHJdUgWYii9Zw0yltRrcNXtFTi3I4ICwkubs5rzDHkY3QvdKFTguM
	qTga2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8gyf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ0X6Qv020546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:06 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 16:33:04 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/8] wifi: ath12k: Add documentation HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
Date: Tue, 19 Nov 2024 06:02:41 +0530
Message-ID: <20241119003248.1579567-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sViMoys0vyB51GMl8X51TghP7gaKadv2
X-Proofpoint-GUID: sViMoys0vyB51GMl8X51TghP7gaKadv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_163309_440646_8901797D 
X-CRM114-Status: GOOD (  11.04  )
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

Add missing field documentation for HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
command with indentation alignment.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 2e05fc19410e..ed41e5bcae39 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -694,9 +694,9 @@ enum htt_stats_internal_ppdu_frametype {
  *
  *    The message would appear as follows:
  *
- *    |31       26|25|24|23            16|15             8|7             0|
- *    |-----------------+----------------+----------------+---------------|
- *    |   rsvd1   |PS|SS|     ring_id    |     pdev_id    |    msg_type   |
+ *    |31   29|28|27|26|25|24|23       16|15             8|7             0|
+ *    |-------+--+--+--+--+--+-----------+----------------+---------------|
+ *    | rsvd1 |ED|DT|OV|PS|SS|  ring_id  |     pdev_id    |    msg_type   |
  *    |-------------------------------------------------------------------|
  *    |              rsvd2               |           ring_buffer_size     |
  *    |-------------------------------------------------------------------|
@@ -723,7 +723,13 @@ enum htt_stats_internal_ppdu_frametype {
  *                    More details can be got from enum htt_srng_ring_id
  *          b'24    - status_swap: 1 is to swap status TLV
  *          b'25    - pkt_swap:  1 is to swap packet TLV
- *          b'26:31 - rsvd1:  reserved for future use
+ *          b'26    - rx_offset_valid (OV): flag to indicate rx offsets
+ *		      configuration fields are valid
+ *          b'27    - drop_thresh_valid (DT): flag to indicate if the
+ *		      rx_drop_threshold field is valid
+ *          b'28    - rx_mon_global_en: Enable/Disable global register
+ *		      configuration in Rx monitor module.
+ *          b'29:31 - rsvd1:  reserved for future use
  * dword1 - b'0:16  - ring_buffer_size: size of buffers referenced by rx ring,
  *                    in byte units.
  *                    Valid only for HW_TO_SW_RING and SW_TO_HW_RING
-- 
2.34.1


