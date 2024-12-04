Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C0FE7716D
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7sGOD67PyyE1wk6exvRwuWJEfYcSPOVVzhpon+BR3l0=; b=F0b1CiJcFqRLXiONI2sYcsrED/
	1PT16o0SFquqorB5+Op2+IOU4U3FBPQyuhh9dfBX+YCGYfnZeK1EnnAF4Slf1xFfzSPPus5W6Sl1Z
	6cLFhb2jgONMsIJTSmxIppXqDA23H9P832jP+xOxPAYs+Gqj13uo0ETmC7rvGSj4INgietu75pS9u
	2SFW0RxlWnwN6rypGitmw1R8dk23XvUNPwLKlDttm1Bd5R1ZPBWl47UQTHhAJT7YsuoSle1/eNmts
	A07ir+CCrHT4PbrN+Y3UP5uWC67Cr0fvYv9yWfI6H0yJ3/YF5DDPJlPgCvSS65VtTy3JwRCJduecS
	T0uwcrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjZO-0000000BgJz-1EeW
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 07:13:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjZL-0000000BgHi-1ROG
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 07:13:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45xtLW010494;
	Wed, 4 Dec 2024 07:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7sGOD67PyyE1wk6exvRwuW
	JEfYcSPOVVzhpon+BR3l0=; b=ErBrG0NzmYfM5tJ4EPs8RhUotuQcksB5AAjoiX
	P/jbYRcoFTVTUFwd9iyVNQaKBT5PkokUvwh/kxBgzYdsibKeGQNvSGeOIXUnJuI6
	wGRjDRK84LA3fM/YlsxZGnw2YkTIQVxZC2Z6DTHMg/wLjv0s/EYUxU4K5hc37pZA
	zjjP3zie/p5AI6tppg2pG2D64hnWseAtWsrP01omsl1LTfiHbjLkIVykSQvNnKuE
	mV32+MHLmqaRcsjaGMg+asgeXdv4ALLaIweHrGBJZa/LKAiDALQ5DBNPQs/QyZUr
	3xkoUNiHShhaPJVqL3tIiI2u+DuA/wyWIlTEMCeSn0mR7uFQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v7yuhfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 07:13:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B47D3PF026362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 07:13:03 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Dec 2024 23:13:01 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
Date: Wed, 4 Dec 2024 12:42:38 +0530
Message-ID: <20241204071238.948885-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y0LzFXmufgx-_EPKqb6DsHqs3z_cPsfw
X-Proofpoint-GUID: y0LzFXmufgx-_EPKqb6DsHqs3z_cPsfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_231307_498064_7293DF64 
X-CRM114-Status: GOOD (  13.68  )
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

There is mismatch between the format of monitor destination TLVs received
and the expected format by the current implementation. The received TLVs
are in 64-bit format, while the implementation is designed to handle
32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
for parsing 64-bit TLVs.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 14 +++++++-------
 drivers/net/wireless/ath/ath12k/hal_desc.h |  2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 494984133a91..dff14f77f504 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1199,19 +1199,19 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k_base *ab, struct ath12k_mon_data *pmon
 			    struct sk_buff *skb)
 {
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
-	struct hal_tlv_hdr *tlv;
+	struct hal_tlv_64_hdr *tlv;
 	enum hal_rx_mon_status hal_status;
-	u32 tlv_userid = 0;
+	u32 tlv_userid;
 	u16 tlv_tag, tlv_len;
 	u8 *ptr = skb->data;
 
 	memset(ppdu_info, 0, sizeof(struct hal_rx_mon_ppdu_info));
 
 	do {
-		tlv = (struct hal_tlv_hdr *)ptr;
-		tlv_tag = le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG);
-		tlv_len = le32_get_bits(tlv->tl, HAL_TLV_HDR_LEN);
-		tlv_userid = le32_get_bits(tlv->tl, HAL_TLV_USR_ID);
+		tlv = (struct hal_tlv_64_hdr *)ptr;
+		tlv_tag = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_TAG);
+		tlv_len = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_LEN);
+		tlv_userid = le64_get_bits(tlv->tl, HAL_TLV_64_USR_ID);
 		ptr += sizeof(*tlv);
 
 		/* The actual length of PPDU_END is the combined length of many PHY
@@ -1226,7 +1226,7 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k_base *ab, struct ath12k_mon_data *pmon
 		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ab, pmon,
 							       tlv_tag, ptr, tlv_userid);
 		ptr += tlv_len;
-		ptr = PTR_ALIGN(ptr, HAL_TLV_ALIGN);
+		ptr = PTR_ALIGN(ptr, HAL_TLV_64_ALIGN);
 
 		if ((ptr - skb->data) >= DP_RX_BUFFER_SIZE)
 			break;
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index a460d432288f..b90a6da72e29 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -579,6 +579,8 @@ struct hal_tlv_hdr {
 
 #define HAL_TLV_64_HDR_TAG		GENMASK(9, 1)
 #define HAL_TLV_64_HDR_LEN		GENMASK(21, 10)
+#define HAL_TLV_64_USR_ID		GENMASK(31, 26)
+#define HAL_TLV_64_ALIGN		8
 
 struct hal_tlv_64_hdr {
 	__le64 tl;
-- 
2.34.1


