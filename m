Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBF0E6FE49
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z63XzYst1xSC3ukSs3PBTa9crJST8EJ2iKcYHaHR71M=; b=gokU2iuIZn5bjAWWovVfOU6+f9
	4darK0w1NJDdvoOIyRjlvL8oDOAllISE0NKUXFbobzTRJJQFsUNTz8kBLKvUrVU3WsoD4aytvs7oW
	aEV3rnasVBFs9wFy+MaxbE69yfvBxjz+2zRtXgE3/HuLt2VHtBYOp7bTeAZCrtkNl4qknvCUTfsmI
	/353sy+vutc5P2sFk08tXmF0HhR+1qvcDZ2pjD6sbSSbXjMGa8AdBFrUcE2zN5lM+dUFaBpR9Dwvq
	B+DmzPI+c2UCJ070sMP3qTWW/TdOD1zVWFB9MC2idcZHZ/3YCGRxDxv3OTWGLI6N9Chy9nuwYLHhx
	EVHix0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYus-00000000r2V-22ub
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 07:34:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYrq-00000000q57-3IZN
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 07:31:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488NBm4J021696;
	Mon, 9 Sep 2024 07:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z63XzYst1xSC3ukSs3PBTa9crJST8EJ2iKc
	YHaHR71M=; b=i0FzUQbVutduzeK5fV7bq3Ru80LRgnMfd+vjmanShAEjfTbtgtp
	3RBt5am+GSCtXGMIP+Out5iA1bWrTq/2peOBlB0FqpiR+bFjyWOAfOe48w549AY/
	cYB/Xb2TVBu21sGEOmDC+vPer/wzfqtn0iWoslAJrozoSO+8ZoE/3O4yFMTwmVTc
	a3xjEVB3WPn2Illv6p06M37yVKUyzOtC2LtrtB56N3uETDCsZRqwTs29NGooPZwk
	FZ/3BJWOXfWHeCktAJyNJUo5H8AkgMjQYQPcBhQiwvzQ4/Ro6UNtfggT6gKjN9qn
	ixIGtlJA1hccEY91HZPoN4XhBGHJK9mIM+w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpj224-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 07:31:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4897VGx2027478;
	Mon, 9 Sep 2024 07:31:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41h0eqtrnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 07:31:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4897VGJZ027458;
	Mon, 9 Sep 2024 07:31:16 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-santrame-blr.qualcomm.com [10.190.109.189])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4897VGbN027457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 07:31:16 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4399736)
	id 9D835414D1; Mon,  9 Sep 2024 13:01:15 +0530 (+0530)
From: Santhosh Ramesh <quic_santrame@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
        Santhosh Ramesh <quic_santrame@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix tx power, max reg power update to firmware
Date: Mon,  9 Sep 2024 13:00:49 +0530
Message-Id: <20240909073049.3423035-1-quic_santrame@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pl4zqrVhgdmBKtRlsu88Wu5Q8C5uQzPr
X-Proofpoint-GUID: pl4zqrVhgdmBKtRlsu88Wu5Q8C5uQzPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_003122_990865_B45657BF 
X-CRM114-Status: GOOD (  12.60  )
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

From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>

Currently, when the vdev start WMI cmd is sent from host, vdev related
parameters such as max_reg_power, max_power, and max_antenna_gain are
multiplied by 2 before being sent to the firmware. This is incorrect
because the firmware uses 1 dBm steps for power calculations.

This leads to incorrect power values being used in the firmware and
radio, potentially causing incorrect behavior.

Fix the update of max_reg_power, max_power, and max_antenna_gain values
in the ath12k_mac_vdev_start_restart function, ensuring accurate
power settings in the firmware by sending these values as-is,
without multiplication.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Santhosh Ramesh <quic_santrame@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 137394c36460..6d7a005d83b4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 							chandef->chan->band,
 							arvif->vif->type);
 	arg.min_power = 0;
-	arg.max_power = chandef->chan->max_power * 2;
-	arg.max_reg_power = chandef->chan->max_reg_power * 2;
-	arg.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
+	arg.max_power = chandef->chan->max_power;
+	arg.max_reg_power = chandef->chan->max_reg_power;
+	arg.max_antenna_gain = chandef->chan->max_antenna_gain;
 
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;

base-commit: 903aaf66edc97dd5b9e3118d19677291051a9c40
-- 
2.34.1


