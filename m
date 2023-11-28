Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BB0C07CB1
	for <ath12k@archiver.kernel.org>; Tue, 28 Nov 2023 02:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtHqIGfP2u1NK5q1nKLOwM/7XXpDZEBa0sfotOlveu8=; b=bSj+kb3Zpv5Mc0
	3bKuKuyu0n+V2Z02vxj2h7Sle/jt7+ScJcBxLe4bp1BL6KviPKMrDmuwU4UoNaljBvuoa7hNisdhC
	xtLrbwB73aNRDyAde3u8BB+XqbIyird+o6yRI75pRSq2+HPcADstCxyLvEefGrQuOa02+p/6nGfIs
	gE0QRHye4lyST+giZ1/+qUCd1LCtCy1FgyELqUqWqltvdG6OYDmXplGryvClHDQqTX2wLlDQqxQ+V
	vlsJKSEsz+g8jchrmViv1fm5JMM/2mm95LkxMCZyNMQ3cNFttu2a7G1X65m0rgrGbrQ7Q+K7SWriv
	aM7ooXmclPY1y11+EiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7oFc-003vbR-0Y
	for ath12k@archiver.kernel.org;
	Tue, 28 Nov 2023 02:55:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7oFY-003vZP-0s
	for ath12k@lists.infradead.org;
	Tue, 28 Nov 2023 02:55:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS0NTvF019760;
	Tue, 28 Nov 2023 02:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rIW3Rw3NKTsnVifloDxgmuLkl37xQyfmBmHOLPHTjzg=;
 b=e512bmAUl4bRzGYYbMlfUyXcrTX7guFvMWH2QTqyWlpPYDDSZ5S0wwzGenT4bD4MLiOk
 PN5JRgJDCi3PRVqF5eriSU3D8MXLQW+jcdkerQ2uy3wVGlGyqVQbUpc3XgYYqP+9vxDl
 HO1YcAcj4mw8HzUGhV7JgzsDukzKv4StcMobo3B4bFmdqhcF6B0HH0SXhtLjPB2tJ9vw
 yqtlFPshDpEO/yVe2FTnyRNqpNut2H96YPwaum3OCwqYpds/dW+AHF/1R+REec36ZvL4
 /DgG31aA9cAaJw4/YL1PV3yH/5klpwZWfNkxQSzXft3ZLdoX6vNi8GNTXUk4vpzfm2er nQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umt6323ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 02:54:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS2suE2019618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 02:54:56 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 18:54:55 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 1/3] wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
Date: Tue, 28 Nov 2023 10:54:38 +0800
Message-ID: <20231128025440.46988-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128025440.46988-1-quic_bqiang@quicinc.com>
References: <20231128025440.46988-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YaEMebpBWvRJfpnMj0SWXVfX21c7HI0l
X-Proofpoint-ORIG-GUID: YaEMebpBWvRJfpnMj0SWXVfX21c7HI0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=737 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_185500_449211_96A14B67 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Some fields of hal_reo_update_rx_queue structure are wrongly
defined, so fix it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_desc.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 6c17adc6d60b..ec204939e50c 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2500,13 +2500,13 @@ struct hal_rx_reo_queue {
 #define HAL_REO_UPD_RX_QUEUE_INFO1_PN_HANDLE_ENABLE		BIT(30)
 #define HAL_REO_UPD_RX_QUEUE_INFO1_IGNORE_AMPDU_FLG		BIT(31)
 
-#define HAL_REO_UPD_RX_QUEUE_INFO2_BA_WINDOW_SIZE		GENMASK(7, 0)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_SIZE			GENMASK(9, 8)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_SVLD				BIT(10)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_SSN				GENMASK(22, 11)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_SEQ_2K_ERR			BIT(23)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_ERR			BIT(24)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_VALID			BIT(25)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_BA_WINDOW_SIZE		GENMASK(9, 0)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_SIZE			GENMASK(11, 10)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_SVLD				BIT(12)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_SSN				GENMASK(24, 13)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_SEQ_2K_ERR			BIT(25)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_ERR			BIT(26)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_VALID			BIT(27)
 
 struct hal_reo_update_rx_queue {
 	struct hal_reo_cmd_hdr cmd;
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
