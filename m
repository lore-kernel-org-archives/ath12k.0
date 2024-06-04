Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876F3C25B74
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8CP5EFDC5Z1q3FYqUkR3iqQgAqGx8EVTHVM3KUEuD9A=; b=UyO/BJK5GAcJ8xYTxTr4E7G/Sc
	ppa6PZCyfqgCu53XkBvvAxwBQkWA7M/dAXDixZBaVibE4tia3Th9U8PUbNrQVkneVS6kJn9z//HEz
	Z2UF1qQIBqa5ATERM1EBq6jsc2SAum4PXiyRn9+mUh6rXh/NvNBmjchHXi/qk8a75ppgrk9hUG7Ki
	VuCZOj/Z2tOeAqephagFSHufTrhQajqgxpURGCdGJpUEsrvy9Ruujnyeprjt3n9plrv8+tPT4ER9H
	Y1RDF2pW5Q1wVzJOAPQyGFGbUY1WPyt/N9NaYu0RPzwjnLr2QYajwzHnFiocGp6BvCz9gjZhy/LhT
	CmuruYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENdN-00000001NIu-0ZPb
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 06:27:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENdJ-00000001NHu-3oLW
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 06:26:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453N13oU001552;
	Tue, 4 Jun 2024 06:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8CP5EFDC5Z1q3FYqUkR3iq
	QgAqGx8EVTHVM3KUEuD9A=; b=QzF6EF+sNGOcN7yss58h2MRxKuOegt/Jwn+lyG
	cLnA8FMANrp+421Usk0M/CC4BsA2C/7iIPBaSwsDfmMefZI1TgnkGPUWNploVHUG
	A4egnfXy74kdxXwKQMEc6HCHC8TwL8ddfMstShVp0/Dh9kZxR/A4A0H7BEYci5WC
	r0d+FsRGRtJ+AcIL2GZ1S6JzO8En068eqeU2JoEOwCsAZX7kLOw2u/KEKqdRtXTO
	2KxQTEnmiIVwX52pMVGQ/0XLoHCzua+KcP2Exnnp86+qwk4GXKoK+8Hu2/XGprpH
	Zf5hP6bdvygKPGbbicJxDM7VXIa8yHcEypEnK3rbqUQc4Ngg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6v62p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 06:26:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4546Qtck026237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 06:26:55 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 23:26:53 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: avoid unnecessary MSDU drop in the Rx error process
Date: Tue, 4 Jun 2024 11:56:41 +0530
Message-ID: <20240604062641.2956288-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xCV4x4bBHxQJNzKRVIcsOJZ3-3_9kuck
X-Proofpoint-ORIG-GUID: xCV4x4bBHxQJNzKRVIcsOJZ3-3_9kuck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxlogscore=855 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406040050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_232657_977944_B6F303CC 
X-CRM114-Status: GOOD (  11.17  )
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

Currently, in the Rx error processing handler, once an MSDU drop is
detected, the subsequent MSDUs get unintentionally dropped due to the
previous drop flag being retained across all MSDU processing, leading
to the discarding of valid MSDUs. To resolve this issue, the drop flag
should be reset to false before processing each descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index cb1f308f096b..54aea3c22311 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3402,7 +3402,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 	struct ath12k *ar;
 	dma_addr_t paddr;
 	bool is_frag;
-	bool drop = false;
+	bool drop;
 	int pdev_id;
 
 	tot_n_bufs_reaped = 0;
@@ -3420,7 +3420,9 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 
 	while (budget &&
 	       (reo_desc = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
+		drop = false;
 		ab->soc_stats.err_ring_pkts++;
+
 		ret = ath12k_hal_desc_reo_parse_err(ab, reo_desc, &paddr,
 						    &desc_bank);
 		if (ret) {

base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6
-- 
2.34.1


