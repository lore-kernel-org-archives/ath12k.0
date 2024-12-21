Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6701E77184
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X4ZFuTXa+wYuc0tkzPTu8kiCqKpDRdufsJ5vezUdKc=; b=qkeqiL7zrrGC7p/yneCwSNcEPN
	Z1X38NFNuoF6+Myav4vnm5sQlh4mVvh2ny4Tw15E/7gyPSshqmWSkTzQfJETT9Z3Yfkjsl537xrKO
	LPT5lcfwXHYhY7k7L59Dz7ggUS2i9qVa2xygSazVlZAmLBBvKyI4ekr/YIjxgPXHmgHN/BXON8cWk
	5MccolsY/PA80ySbiBLrBwXPxtgH86ww3o5F7bOcqMYopsUEbQScQ3BkTZq6+wr3i4OJEy4UrVpfC
	V/l4dHVG/7bhrn5r+xpQLn1ZN2X+FlDe0RSO5TAQJFRiyg9NVab+oq/GcXs4GpuOhGTjoZrjdn9qW
	QdaV5Q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9P-00000006Xi5-2INa
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:31:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr9N-00000006Xgh-2lFk
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:31:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKCiin6013155;
	Sat, 21 Dec 2024 04:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X4ZFuTXa+wYuc0tkzPTu8kiCqKpDRdufsJ5vezUdKc=; b=K/fbkH1rwh9ZwBwg
	X15d57uwN57QjnnUbjaqBZBQ/KNpw4I+By3i4E8nzPXXzGoCDGD2adp1rrM2gU+2
	U3SGm7wwxDMWWiqCb87nM4CNNyZBMiA3jhb72KvO8mdqmf/ZMgL2IlhesV8Tv2Kz
	vsPEOtNpUEnkAuGCt6TXjfo+U93G1fBPGw9KiUgWWlsoQlacmE87XgTTzFuOwUUe
	qsuD7YvdziMwUR3L3OondtXAp44R69GV/7jJLye/4Awl9DmkKZzMc72B2C7frBNA
	1cgVsJFF7s2R+eLxY0Sl0a9JPRaspmub2/6qO7K+9OuavHMAV1I4fGTpOJJ95JLe
	x0sGbQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n8uvhxq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4Va18008804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:36 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:31:34 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 13/14] wifi: ath12k: Handle monitor drop TLVs scenario
Date: Sat, 21 Dec 2024 10:00:13 +0530
Message-ID: <20241221043014.1252841-14-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7__RZ6pbXZHrzREi47sxT1YhARJ4WIdI
X-Proofpoint-ORIG-GUID: 7__RZ6pbXZHrzREi47sxT1YhARJ4WIdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203137_720821_7455BFFD 
X-CRM114-Status: GOOD (  14.51  )
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


