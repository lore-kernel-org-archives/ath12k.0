Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D4C3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 04:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yeNO4AKwiCcFpEeCLw5AUtin1pXv5hQiMEITO/FtqSQ=; b=pGSZaW0D/8Q470qZ5gHMp7uvR/
	8w84ROMPJSu+VUS4kKN6j/QQ6rmXZVXHV6iBT1HfehOQ8A0d+anE5yfiRd5kqhIOBQ09jz1uijVlH
	7kVirQH1cKi1TiVZ/0BIJYgcgSAJ78dLf66MDJMJILIx/wl3WmY2gmIDqy7xQMO+fFEERdk97AKkm
	trqO9W26cGLJ+Hl3VQAH2v3PRVEP5WByDfsm+Plwc7VJ3mzJ+WM2FmXi7AuZtNeeSz8viBu6PB7tO
	VFu5J7MDPk1EQ98xMEuKa+uB/LfyNDXqrh1QC9ZkbS1GixSmROt5nXwwXeC0NvH+NOCmpJwra+vZp
	nzW4p8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20y8-00000002jGQ-2nWH
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 04:53:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20y5-00000002jG1-3xsr
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 04:53:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382Gi5B029925;
	Tue, 8 Apr 2025 04:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yeNO4AKwiCcFpEeCLw5AUt
	in1pXv5hQiMEITO/FtqSQ=; b=Com/g0todURvIe8pUtF7jRoktfpu3qv7jysmQZ
	CJgUKD9187duIG2xEQypw+LyqiDkednK+8a4yLMxBQS3yCt5vrKm07WKFsfERaQ1
	2N0sCrkdVc6+oz2WLmFi+nOdXKkRXzV2jCljyreWX6MRcJw/K19jJedldvuN/VxC
	beAotwJ3KxB6YsdY19i8emyYeo7LDYUx+cdstUaM+MGI8xDUvxDJYg2kqUyL44+y
	kNFiD076VuhDhIvxA+JP0EE8pLRWgcDZWQBb2Yg2S1sm4R2C65b6QMXzqUXuEpk8
	r+CQ4YKKTFe8Nd4wGhdVFKwPH2kQT3ea8TTH6QnU8aSRqVNQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcregx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 04:53:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5384rl7A002482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 04:53:47 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 21:53:45 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: fix invalid access to memory
Date: Tue, 8 Apr 2025 10:23:27 +0530
Message-ID: <20250408045327.1632222-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O7HSksRpaqWZbgwxHx0cDdYirrkeLDhv
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f4abdc cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=nUr2IJqUNz9C21EoXSIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O7HSksRpaqWZbgwxHx0cDdYirrkeLDhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_215350_105207_0C4B7EA8 
X-CRM114-Status: GOOD (  12.70  )
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

In ath12k_dp_rx_msdu_coalesce(), rxcb is fetched from skb and boolean
is_continuation is part of rxcb.
Currently, after freeing the skb, the rxcb->is_continuation accessed
again which is wrong since the memory is already freed.
This might lead use-after-free error.

Hence, fix by locally defining bool is_continuation from rxcb,
so that after freeing skb, is_continuation can be used.

Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 48d907a400b3..f0f9d05443b9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1824,6 +1824,7 @@ static int ath12k_dp_rx_msdu_coalesce(struct ath12k *ar,
 	struct hal_rx_desc *ldesc;
 	int space_extra, rem_len, buf_len;
 	u32 hal_rx_desc_sz = ar->ab->hal.hal_desc_sz;
+	bool is_continuation;
 
 	/* As the msdu is spread across multiple rx buffers,
 	 * find the offset to the start of msdu for computing
@@ -1872,7 +1873,8 @@ static int ath12k_dp_rx_msdu_coalesce(struct ath12k *ar,
 	rem_len = msdu_len - buf_first_len;
 	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
 		rxcb = ATH12K_SKB_RXCB(skb);
-		if (rxcb->is_continuation)
+		is_continuation = rxcb->is_continuation;
+		if (is_continuation)
 			buf_len = DP_RX_BUFFER_SIZE - hal_rx_desc_sz;
 		else
 			buf_len = rem_len;
@@ -1890,7 +1892,7 @@ static int ath12k_dp_rx_msdu_coalesce(struct ath12k *ar,
 		dev_kfree_skb_any(skb);
 
 		rem_len -= buf_len;
-		if (!rxcb->is_continuation)
+		if (!is_continuation)
 			break;
 	}
 

base-commit: 12b93f7c6d101d22e0ea3bf4a240699746c79117
-- 
2.34.1


