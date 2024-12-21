Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB35CE7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 05:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZdjCqBwhvWP5Cx5o5Kr4Fxa2ZvQZEhdJDyBOoKqUz0=; b=QBbFS3BBzamal7zlWS7nkphvQt
	EySXoPQ70onJeCEABqVKfsluBWTsNOl/3fS5ZDXomLAqVYosWXi19lBt3MbPGEP/Z65wRkZboaMxh
	Z+mv9kkXLIpKH0b1ccIdTaHAGXwDBA+brYwtvtyKnQgjRyxI7F9pESAUqDt/9OH/2guwvaBFPIszh
	PD1fs0UKvG6UmAojL+tKBYwfsRWCa5na12sg8rKdKwD4j9RYfP5/ITfDz/NQW/8TOcAPc513XD2NN
	W+BOOSkSahsn3QmgBRHQdFvXpIRoZDEIqZmoHYlvcwA7CS8JdOX8qsaaDjTC3kL9vcBT1uVbKTSyM
	70+53Q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOrxE-00000006aMz-2k5A
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 05:23:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOrxC-00000006aLH-2YJS
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 05:23:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL0giIi008113;
	Sat, 21 Dec 2024 05:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZdjCqBwhvWP5Cx5o5Kr4Fxa2ZvQZEhdJDyBOoKqUz0=; b=h+1fI9yoPUlgHLPL
	g+J2qNlNcGoI4G2FazcVg/jMk6eNpsLTth2XTtXODfqIlglxlM5h7WB8T2QTGLQb
	0AlKCekkpsQ117XTt/2VyoNFDkJMdGCLW2k7srjIoLGakm6LgPDmDgwJ71IIE9Et
	n7xt82WW6PIHAl+8BMqg8HBLXyyZQTXAAC+Ul83UtENYTQPURmhcF/73dfRhntWL
	w2DX+kasdHmeL/0OkeKs0ugdiuOzD7cRtyVpkpz2TO1P9nsGpkU/x12v02flX2mv
	GdP+3mJiKUQbxtytU4fsGpddUtVhr6rGQp4m7d8m1G51PdTQXI9l7F1RYUVaJO/x
	Gm5B7A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nkcc8j9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 05:23:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL5N5st004758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 05:23:05 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 21:23:03 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 05/10] wifi: ath12k: Update the peer id in PPDU end user stats TLV
Date: Sat, 21 Dec 2024 10:49:14 +0530
Message-ID: <20241221051919.686500-6-quic_periyasa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 8TvF7qq7GrhTDaap9ZJ-JZK-I7uMwG_B
X-Proofpoint-GUID: 8TvF7qq7GrhTDaap9ZJ-JZK-I7uMwG_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=998 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_212306_664234_EED3D0D2 
X-CRM114-Status: GOOD (  10.23  )
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

Currently, peer id get reported in the PPDU end user TLV tag. But the
monitor status handler is inherited from ath11k, but it was not updated
to incorporate the changes made to ath12k 802.11be hardware architecture.
Therefore, update the peer id from the PPDU end user TLV data to get latest
peer id update, it helps to populate accurate peer information on the
statistics data.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index a024a07bd704..b98f7a941fa1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1535,6 +1535,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 		ppdu_info->num_mpdu_fcs_err =
 			u32_get_bits(info[0],
 				     HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR);
+		ppdu_info->peer_id =
+			u32_get_bits(info[0], HAL_RX_PPDU_END_USER_STATS_INFO0_PEER_ID);
+
 		switch (ppdu_info->preamble_type) {
 		case HAL_RX_PREAMBLE_11N:
 			ppdu_info->ht_flags = 1;
-- 
2.34.1


