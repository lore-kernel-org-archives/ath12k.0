Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A95C5478C
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVOT/Ynlm2jEPxxVndSwOeCRNtYwXVYPyCrsokhF8cs=; b=qhvIgNKkygUMeNSzLR7JtDNXY7
	33YlAFqLEjHyfKdcfGu8WDm7FkvrM9VqwYVmT7GPqGYFlxENiZktAMJhvGRqpONWihs3i7QBCFJdc
	v2IdRMOeKnsxR3874XgSKtL/tVgrTPGQlrsp9SvctodIOWBpo1M/7V/sFJXVPyrc+qcYnGrAaREGm
	OXaa/QNZulbwSp7ZU1dPA6/5Wvki/Sd+CicjVTMtv6Hl7gWtpeJMUIsQn1qYQZD3+YTn7IGbzb1jb
	uwbELed4qZt5ceeo3fgGoK16MK77GW0IWpDA3LzCxs+Dw3HCwb4jD4VaIqqRQkbc0oYjZVJhqIykq
	6TjNJYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redlN-00000001dyC-0OOX
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 16:23:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redlJ-00000001dwX-3SRW
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 16:23:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF8FXX015472;
	Mon, 26 Feb 2024 16:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=tVOT/Ynlm2jEPxxVndSwOeCRNtYwXVYPyCrsokhF8cs=; b=EK
	jwAo3ACtJLY6VqwzOcrafqu55uhALJcc/Z8oLllYzwGlZA3yZ3jnC0Z1gvp/gr2Q
	hAs68qqcGg+5FfI39M+7R/8e5H/ge/kD1wSzA6vhYPLktrIznmaB4GLQJzbLZbyO
	e2bs/6SOpFqd9dDMZtaVora9Ois2GR/tpA2NCO2Ylh6KIgfpiVTsAza5qt6g6EA2
	LMenDEdhA14E94KAMh3ltSskQrUwnofvch2gWYOAE3AWF7nJA4xobFKKcumNOr2W
	LKBzKjkchdrn8YNAsnPykorYFYRmHaBkRb46Brf1QfqeRua13m/eHMjUXv9yiL0x
	c0jBAZ6LiGZ4fiGJiNRg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxm1dfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:23:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QGNREP007165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:23:27 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 26 Feb 2024 08:23:25 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/3] wifi: ath12k: Refactor Rxdma buffer replinish argument
Date: Mon, 26 Feb 2024 21:53:08 +0530
Message-ID: <20240226162310.629162-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226162310.629162-1-quic_periyasa@quicinc.com>
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cxw3115EHLQi_D2eDS4VPHNcp6_-92mv
X-Proofpoint-GUID: cxw3115EHLQi_D2eDS4VPHNcp6_-92mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=571 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_082330_001664_FE77A980 
X-CRM114-Status: GOOD (  13.34  )
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

Currently, the Rxdma buffer replenish procedure implicitly retrieves the
number of free entries when the caller passes req_entries as zero. This is
helpful to replenishing the Rxdma ring when the caller is unaware of the
number of entries to replenish. After the Rxdma ring is initialized, we
can pass req_entries as zero to replenish all the free entry in the Rxdma
ring. This change helps to align the argument req_entries to the used list
entries for better code readability.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index ca76c018dd0c..45646d987139 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -422,13 +422,10 @@ static int ath12k_dp_rxdma_mon_ring_buf_setup(struct ath12k_base *ab,
 static int ath12k_dp_rxdma_ring_buf_setup(struct ath12k_base *ab,
 					  struct dp_rxdma_ring *rx_ring)
 {
-	int num_entries;
-
-	num_entries = rx_ring->refill_buf_ring.size /
-		ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_BUF);
+	rx_ring->bufs_max = rx_ring->refill_buf_ring.size /
+			ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_BUF);
 
-	rx_ring->bufs_max = num_entries;
-	ath12k_dp_rx_bufs_replenish(ab, rx_ring, num_entries);
+	ath12k_dp_rx_bufs_replenish(ab, rx_ring, 0);
 
 	return 0;
 }
-- 
2.34.1


