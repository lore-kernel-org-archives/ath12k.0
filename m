Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E039EE77190
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X4ZFuTXa+wYuc0tkzPTu8kiCqKpDRdufsJ5vezUdKc=; b=YU74SKvJ6yxpwsmGLptWUBH54+
	VYM6nTDbE9sUCSOonRUUuYYulFEEq2/6so8xgRxeohJLgKh/56gyBxkdB1HYrz1AJvAiUHwF4uUMv
	kJ18rof99VrDwTh4cXyuWsN6SLefERNTRxuo4yZS8RdTgHL/mM+K++LLLyNgFNet15Hy/XfUfnTNt
	0JZMF7B/ghZcbY8EoQFjRLehCuCGIqGP55heZSv+XWlSosZLponU6W6JvC+LsMMljHVPVixVSbx8E
	oS75mvqEzX5hf2PGI9NcGL6/zdgK98SWMHPF72RG/PSQpz9k9+6r94cSuK4ObanDu2pHFCj22l7sZ
	hYhJ2kVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbWD-00000009NXl-2Z9C
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 06:02:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW9-00000009NSb-1y5b
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 06:02:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMMPBHX028828;
	Mon, 23 Dec 2024 06:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X4ZFuTXa+wYuc0tkzPTu8kiCqKpDRdufsJ5vezUdKc=; b=lBMOHKUX+Nu6Y/gL
	ZL6xu/hz+gm4ulV7/+6lHpGmsVolR+R8YJq5goAVR/9yVxtsEbbItfkd0huKON8U
	FPpwYlAo/8ybKpYLlm/CddW67cmh1TrSqyeY3ZivO5Q2/gqnM9C6dkx6nUJAZc13
	FJC1klX3hb/loOD2PMzWBRY9JCna9xLvaf06wxXUJHzo49CQrPVlPCQLWE3lJ99F
	RzN5Bn3C0x+ezMSGcq7s4HzveRJWIrXhWZCI+OnumDfewfvX1rxF9fhfVlU/EIZa
	bmV5IegZ2tUI9r/Lbo1v4hqn4QECxjcI+9k40wTSaCH74lKK3NoAP9Ou+pXM1Slt
	Wxj1kA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ptdnh9fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:02:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN62CYA017796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:02:12 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Dec 2024 22:02:10 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 13/14] wifi: ath12k: Handle monitor drop TLVs scenario
Date: Mon, 23 Dec 2024 11:31:31 +0530
Message-ID: <20241223060132.3506372-14-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
References: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wflisqIfGGD1TlNuPvVnP4OW_8S_Gupg
X-Proofpoint-ORIG-GUID: wflisqIfGGD1TlNuPvVnP4OW_8S_Gupg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220213_531428_309EE6CE 
X-CRM114-Status: GOOD (  15.48  )
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

During monitor destination ring back-pressure, hardware failed to send
HAL_RX_PPDU_END_STATUS_DONE TLV. But driver uses this TLV as a delimiter
to complete one PPDU worth of data parsing. This causes driver to overwrite
the existing PPDU information with the new PPDU information.

Fix it by recording the end reason which is provided under each buffer's
descriptor in skb->cb and uses it while parsing TLV tags to mark the PPDU
end delimiter.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h   | 1 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b789b375b891..ad69d8544357 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -141,6 +141,7 @@ struct ath12k_skb_rxcb {
 	u8 is_frag;
 	u8 tid;
 	u16 peer_id;
+	bool is_end_of_ppdu;
 };
 
 enum ath12k_hw_rev {
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 23b1a41c6fd2..4e9a60181c06 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1139,6 +1139,7 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 			    struct sk_buff *skb)
 {
 	struct hal_tlv_64_hdr *tlv;
+	struct ath12k_skb_rxcb *rxcb;
 	enum hal_rx_mon_status hal_status;
 	u16 tlv_tag, tlv_len;
 	u8 *ptr = skb->data;
@@ -1170,6 +1171,10 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 		 (hal_status == HAL_RX_MON_STATUS_MPDU_END) ||
 		 (hal_status == HAL_RX_MON_STATUS_MSDU_END));
 
+	rxcb = ATH12K_SKB_RXCB(skb);
+	if (rxcb->is_end_of_ppdu)
+		hal_status = HAL_RX_MON_STATUS_PPDU_DONE;
+
 	return hal_status;
 }
 
@@ -2345,8 +2350,10 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 		 * HAL_MON_END_OF_PPDU to ensure that one PPDU worth of data is always
 		 * reaped. This helps to efficiently utilize the NAPI budget.
 		 */
-		if (end_reason == HAL_MON_END_OF_PPDU)
+		if (end_reason == HAL_MON_END_OF_PPDU) {
 			*budget -= 1;
+			rxcb->is_end_of_ppdu = true;
+		}
 
 		end_offset = u32_get_bits(info0, HAL_MON_DEST_INFO0_END_OFFSET);
 		if (likely(end_offset <= DP_RX_BUFFER_SIZE)) {
-- 
2.34.1


