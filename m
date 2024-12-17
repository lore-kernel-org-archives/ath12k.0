Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CDDE7716A
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5Ip1wOE346Jxu+0O183RbBM7WtgOj9IVfUryGQ9JDI=; b=l2qhEzYfQhCvu1W9ui2DJ/vo1b
	dlzo0ZRuFpTlmegIOlB4aNIT3+QACCt6TUI5VumOTs22usx0C+XaH/8OKXzgaSXyYb76hNOwRYR6S
	A3WRVguVMVd27Ko6P1MbpPZzt6fnOqef1pP3xIFyWszQpj+37/lB1SRkoPexRZs4IdA3s0pWep+Cb
	XfUUDe8oVRbR2cgT7UecNkhzXES8Mp5CGG5CUSH4++V0TjcR1BSqsd4WId1bRJK+JoT/0WT5lq7zk
	rjlg+kSuv6cgTjI4T4NZhebwyCQXpIm9ldXq/hvTJbSPI1nddBDQVOGCjkrsHF+6EJqTtjvvH8eGb
	vdgU1snA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUW1-0000000D45U-1RNv
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 10:09:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUG5-0000000D0Fy-3OZf
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 09:52:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH57bZV016377;
	Tue, 17 Dec 2024 09:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5Ip1wOE346Jxu+0O183RbBM7WtgOj9IVfUryGQ9JDI=; b=FhEkD8B+PPoV1UHp
	mgLdUAdH04s89Uijb2pDSEvOfbQV4fBr4LPhmXzGaI8bIQBAG6GpvF8raJYZPJQ2
	1jwqI4g3+D7EBJ4P5wzNobZcGI66lJ3qIcrDbos5t/oC0CT2IQ9Wl1EJJw8gzAWi
	yF23ygAo3Z3CEpkQDJDN/HtikguAD74UxDADRFfgMpiRxnMXni8z0RaZkAtYYKiZ
	KaJcQGWRF+g3m7I5De73J/dHQjHx3aHe8Kb6aQc54IpcN/Py4tgNNj3nqMDMgHDn
	Cu7b6h1G2GoX8FCzVAnvJa1kzVeDl1tweVC8WrtRf0zAzIiLtJdROCAM2kXD2mXg
	8P9g2A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2vngpna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:52:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9qq6x022317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:52:52 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:52:50 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 4/6] wifi: ath12k: Add API to print s8 arrays in HTT stats
Date: Tue, 17 Dec 2024 15:22:14 +0530
Message-ID: <20241217095216.1543923-5-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YbGdGBm8JORZj6uMhhXuBhLZ4o3s5XGy
X-Proofpoint-ORIG-GUID: YbGdGBm8JORZj6uMhhXuBhLZ4o3s5XGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=763 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_015253_855144_714A9AF8 
X-CRM114-Status: GOOD (  11.55  )
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

Currently, print_array_to_buf() is used to print arrays to HTT
stats buffer. This API supports printing only arrays with 32-bit
unsigned integers. Add API print_array_to_buf_s8(), which
implements print_array_to_buf()'s functionality to all the
arrays with 8-bit signed integers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 4569ff40e9d8..621676daf971 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 					footer);
 }
 
+static u32
+print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
+		      const s8 *array, u32 array_len, const char *footer)
+{
+	int index = 0;
+	u8 i;
+
+	if (header) {
+		index += scnprintf(buf + offset,
+				   ATH12K_HTT_STATS_BUF_SIZE - offset,
+				   "%s = ", header);
+	}
+	for (i = 0; i < array_len; i++) {
+		index += scnprintf(buf + offset + index,
+				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
+				   " %u:%d,", stats_index++, array[i]);
+	}
+	index--;
+	*(buf + offset + index) = '\0';
+
+	if (footer) {
+		index += scnprintf(buf + offset + index,
+				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
+				   "%s", footer);
+	}
+	return index;
+}
+
 static const char *ath12k_htt_ax_tx_rx_ru_size_to_str(u8 ru_size)
 {
 	switch (ru_size) {
-- 
2.25.1


