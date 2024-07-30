Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D3EC3DA49
	for <ath12k@archiver.kernel.org>; Tue, 30 Jul 2024 03:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QlOXAqIAke/i/+55iXYKdr6UqllRFLxYXFdthomviN4=; b=SCrjetr0M0FoGSV891mOuX3WLP
	ACtKSPAPsYkQjBcTwkeOPoTXlHKeCUX4EUo1NYv4GUgk1CoPT3Ciia6iAwg6aNlQ3IEbvS8oqQmZt
	56F+4Tcoprwk+Zs8Xtwpt0RXuHSC9OU0Ez31jkrfcsAsjtGRxaXDeAvtqw2YLmPo3zRzVSgChq1+U
	pauBv4qZBRIllaFiru73+zgFhj6+KNpS50lHB0z9r0T5akUGCEhXr3UW2V9xFJKeAlZz77C1cumSX
	RiEyibrm0zDRXDjwV5KcY4EcUG9O0ds9qLpLSZnbR3GZ1qitCp0z33OI6G7lkKoPpZLgxDdcM3CMy
	JyA8w+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYdrt-0000000DWDL-3rre
	for ath12k@archiver.kernel.org;
	Tue, 30 Jul 2024 03:49:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYdrr-0000000DWCm-0wKA
	for ath12k@lists.infradead.org;
	Tue, 30 Jul 2024 03:49:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TMlaju012347
	for <ath12k@lists.infradead.org>; Tue, 30 Jul 2024 03:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QlOXAqIAke/i/+55iXYKdr
	6UqllRFLxYXFdthomviN4=; b=cwnxsjGn+6HenRuQyR/1aHiS82XBWcUCkRAO2s
	typdUT0s0ENCiU9xDj2AdzkgR1wD+Fh4XpNM7a/V7vPXQiJkKBNcbjNpjZb/+Ryd
	LCbux348ehA9hHpSMoSTFN8V/79f8zkAsIBDJNKdwIaBXKtO4nKeDju6KQJoyjkn
	A5FeUdIri8HjXfhQrmjy6hHwdr2S3Jh02/8nV3ZVjf5oYsc8IU12wxZ87REOJjGe
	mngbUgJIHqFXHWAJzVb9R4vWN+cx1e1rqrNrd6oRAqPDXsMOJ2SuG8klUp5zW2gv
	dUrmRiy+w/OoSomyUqAQrFPch80U/J/GMZ/qQba6CV1igeLg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mr7gp49m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jul 2024 03:49:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46U3ndTU004361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jul 2024 03:49:39 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 20:49:38 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Date: Tue, 30 Jul 2024 09:19:01 +0530
Message-ID: <20240730034901.3723428-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FPPA_1TWA4aGRTKTWe_iraWI0jgLOOXO
X-Proofpoint-GUID: FPPA_1TWA4aGRTKTWe_iraWI0jgLOOXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_03,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=886 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_204943_418614_7CC38480 
X-CRM114-Status: GOOD (  13.70  )
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

The API print_array_to_buf() currently supports printing
arrays with 0 indexing. In some cases, a few arrays need
to be printed with 1-based indexing, i.e., array should be
printed, starting with 1.

Add a new version of print_array_to_buf(), named
print_array_to_buf_v2(), which implements the functionality
of print_array_to_buf(), but with an extra variable,
pointing to the index starting with which the array should
be printed. Modify print_array_to_buf() to call
print_array_to_buf_v2() with 0 as the starting index.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index f1b7e74aefe4..4d7fe4b4f320 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -12,8 +12,8 @@
 #include "dp_rx.h"
 
 static u32
-print_array_to_buf(u8 *buf, u32 offset, const char *header,
-		   const __le32 *array, u32 array_len, const char *footer)
+print_array_to_buf_v2(u8 *buf, u32 offset, const char *header, u32 stats_index,
+		      const __le32 *array, u32 array_len, const char *footer)
 {
 	int index = 0;
 	u8 i;
@@ -26,7 +26,7 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 	for (i = 0; i < array_len; i++) {
 		index += scnprintf(buf + offset + index,
 				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
-				   " %u:%u,", i, le32_to_cpu(array[i]));
+				   " %u:%u,", stats_index++, le32_to_cpu(array[i]));
 	}
 	/* To overwrite the last trailing comma */
 	index--;
@@ -40,6 +40,13 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 	return index;
 }
 
+static u32
+print_array_to_buf(u8 *buf, u32 offset, const char *header,
+		   const __le32 *array, u32 array_len, const char *footer)
+{
+	return print_array_to_buf_v2(buf, offset, header, 0, array, array_len, footer);
+}
+
 static void
 htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, u16 tag_len,
 				struct debug_htt_stats_req *stats_req)

base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
-- 
2.25.1


