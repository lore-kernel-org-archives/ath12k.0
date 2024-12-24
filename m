Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA24E7718E
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBoEoPRzZCgn6Jh554hVeibLw5a/e9ohh6rolbzAQCQ=; b=dokVZO+SqJ3+RbEgZKWywQuU5V
	Nz2vvv+gJ3sqeyTzmp7RdtKvidelfGDnl/LMPRwdLHNdaDv88Ms6yNxZBB4wBjdYfyyjLWe6dhJg4
	JCHkkePuN9wGUJp+cQvXOCekcEyYh/NqORjCHVF6hHqv4tUJWWhd/gfMJcXxAwmR895Z+SX9d9DSn
	nAc1Wqh/daHCZwFs0QwWc510rQEO97+E5AWmozhc1MltutuV1cSYuoGGzDxIAFdbuVT738clkqCEM
	7iPW4WfoaKnL0JsBrDo239kt2qbjgvAyh9C9MrRKxhKt27xvNC5oAdSlHZNDAW4NcB77N/bZ7GRS7
	tZ1qd5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ21w-0000000Bjmh-3Tph
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 10:20:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ21v-0000000BjlN-0B0e
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 10:20:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO5lQ9n006721;
	Tue, 24 Dec 2024 10:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBoEoPRzZCgn6Jh554hVeibLw5a/e9ohh6rolbzAQCQ=; b=LuTG9ujynvKQZnDG
	/xlpC50b4QVheFqdfc3ojtwZ3BoTmSsVCdwNCFatQC1snbldEi6Z9vL1i5OfQs1E
	ItL71iX0MnL9w8S8zmBSjabEiKG/oLr0/XmgBYKH6E7cvcERI+TmRUn/kcA1GeFd
	dkUdoF311RTzN2/EngdKbs5DxS4By5aLAXEg/FnLyhyaDpl+0bKpmoNKvdDB1d5t
	Cn+9dMiCcIcfH5dqwYz0UEqq5z7Sz/T8gW43rQODuBEkKw6dE0ouQcN7/fbbVMJQ
	GFp53OL+gnnIOdgiScJxgwNSdhMzWtsVpsGU6L1VOVr2wc6TYLQnaewILk+bUawB
	ZZe/qQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qq4b1951-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOAKkxe010604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:46 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Dec 2024 02:20:44 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v2 4/6] wifi: ath12k: Add API to print s8 arrays in HTT stats
Date: Tue, 24 Dec 2024 15:50:11 +0530
Message-ID: <20241224102013.1530055-5-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
References: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LbC-F6Gnk-DdWDMiPctqMcsWrCaSdsqc
X-Proofpoint-GUID: LbC-F6Gnk-DdWDMiPctqMcsWrCaSdsqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=807
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_022047_090707_84E69338 
X-CRM114-Status: GOOD (  12.35  )
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
stats buffer. This function supports printing only arrays with
32-bit unsigned integers. Add print_array_to_buf_s8(), which
implements print_array_to_buf()'s functionality to all the
arrays with 8-bit signed integers.

Sample output:
rx_ul_mumimo_target_rssi: user_0  =  0:-128, 1:-128, 2:-128, 3:-128
rx_ul_mumimo_target_rssi: user_1  =  0:-128, 1:-128, 2:-128, 3:-128
rx_ul_mumimo_target_rssi: user_2  =  0:-128, 1:-128, 2:-128, 3:-128

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 7ddf862d2007..37a78d6c8df8 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 					footer);
 }
 
+static u32
+print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
+		      const s8 *array, u32 array_len, const char *footer)
+{
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	int index = 0;
+	u8 i;
+
+	if (header)
+		index += scnprintf(buf + offset, buf_len - offset, "%s = ", header);
+
+	for (i = 0; i < array_len; i++) {
+		index += scnprintf(buf + offset + index, (buf_len - offset) - index,
+				   " %u:%d,", stats_index++, array[i]);
+	}
+
+	index--;
+	if ((offset + index) < buf_len)
+		buf[offset + index] = '\0';
+
+	if (footer) {
+		index += scnprintf(buf + offset + index, (buf_len - offset) - index,
+				   "%s", footer);
+	}
+
+	return index;
+}
+
 static const char *ath12k_htt_ax_tx_rx_ru_size_to_str(u8 ru_size)
 {
 	switch (ru_size) {
-- 
2.25.1


