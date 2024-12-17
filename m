Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB55E77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmRavJ84/ZqlGF4feSXh+mmnP8FY4va81jQfZPCofpI=; b=sVxRIOkxd8FZsckUONtwiRyK17
	85O+J5NYxfNsPoqzJEqEd8g4HM8BIhALPWU1sM3uX2tSVRA9lu2P9acCjCzNxH2+bso8JplSdWsyp
	rL5Z4l2DAncdfuXAjqvBf7ANHBlDghAAYU/I6+3lOUtG9zWSUTmj2OIq1PSElL/BDi/Nvq01hzdPH
	/kFlGY3sHuXRK5CxcXial4t047yNkzPdjqGhqP5fPmUiM2I9y3IDLxpbbTQzQF4Naqlg7FLOvmy5i
	Q6WaMtX/GRPitKraozGngWx4z2hTQOR3WYljagr0BOC0oj6kWl3BHp/TusrVyjP5Mx9WRQw7P5jkc
	YC1DVqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTJ9-0000000CmKd-0nfm
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 08:51:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTD4-0000000CkmX-3vO9
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 08:45:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6RehB003132;
	Tue, 17 Dec 2024 08:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmRavJ84/ZqlGF4feSXh+mmnP8FY4va81jQfZPCofpI=; b=Ze2Pw5mreyNQxKQ1
	Ts8qCmWzsmGwbtx7OLiPJEwx5sOeR+7zzS3nzvVfV/Zq+Z3hxcKvPVErsvJjk9ws
	6U2qNsJ8Jyban3I6HntiBoCFRZsadiHytuhSYxsc+4FeuFPnB/5FwFao7AxFhIXa
	KkKhogKniJ/IJbQst/GvuenKFcNX+8qqIBZIJBQtIW+xMIkLQMGti0DBb7DCwm5P
	fopOduYcIev8WJvkA1QiOk1Z+K1X+HUxg80nXWh/0AFYNVGfAA9MuITi5d9Z1zZ1
	YqQ/XQSnQHyub/43G8R4qB9+I3N0rYOqRpjFCdn+fK0cNQa3NfWH+UHQSr4VDtUa
	lrvqXQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k424gbtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH8jfQ3006267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:41 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 00:45:39 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 7/8] wifi: ath12k: Change the Tx monitor SRNG ring ID
Date: Tue, 17 Dec 2024 14:15:10 +0530
Message-ID: <20241217084511.2981515-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u7wl8U09ax717yedKNeH9NrvNEHSDi8B
X-Proofpoint-ORIG-GUID: u7wl8U09ax717yedKNeH9NrvNEHSDi8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004543_084900_C3F09D83 
X-CRM114-Status: GOOD (  13.63  )
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

The Tx monitor SRNG ring ID does not align with the ath12k 802.11be
hardware architecture. Currently, there is no issue since the Tx monitor
is not enabled. However, in the future, the Tx monitor will be enabled.
Therefore, change the HAL_SRNG_RING_ID_WMAC1_SW2TXMON_BUF0 SRNG ID and
assign the correct start ring ID for the ring type HAL_TX_MONITOR_BUF.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 2 +-
 drivers/net/wireless/ath/ath12k/hal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index fd98fac16dd5..cd59ff8e6c7b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -181,7 +181,7 @@ static const struct hal_srng_config hw_srng_config_template[] = {
 		.max_size = HAL_WBM2PPE_RELEASE_RING_BASE_MSB_RING_SIZE,
 	},
 	[HAL_TX_MONITOR_BUF] = {
-		.start_ring_id = HAL_SRNG_SW2TXMON_BUF0,
+		.start_ring_id = HAL_SRNG_RING_ID_WMAC1_SW2TXMON_BUF0,
 		.max_rings = 1,
 		.entry_size = sizeof(struct hal_mon_buf_ring) >> 2,
 		.mac_type = ATH12K_HAL_SRNG_PMAC,
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 8a78bb9a10bc..94e2e8735958 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -485,8 +485,8 @@ enum hal_srng_ring_id {
 	HAL_SRNG_RING_ID_WMAC1_RXMON2SW0 = HAL_SRNG_RING_ID_WMAC1_RXDMA2SW1,
 	HAL_SRNG_RING_ID_WMAC1_SW2RXDMA1_DESC,
 	HAL_SRNG_RING_ID_RXDMA_DIR_BUF,
-	HAL_SRNG_RING_ID_WMAC1_SW2TXMON_BUF0,
 	HAL_SRNG_RING_ID_WMAC1_TXMON2SW0_BUF0,
+	HAL_SRNG_RING_ID_WMAC1_SW2TXMON_BUF0,
 
 	HAL_SRNG_RING_ID_PMAC1_ID_END,
 };
-- 
2.34.1


