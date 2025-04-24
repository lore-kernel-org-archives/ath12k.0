Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBE5C369AB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p0hqLDU/BqROalaZlrochMujk91gL2X1X5u9oWdHQSw=; b=xsv+LYHwt4sjsuMk3V8C8OnNP1
	aidhclA/t5ql2bCLJjl8ykWwXNPh2PzmHnT9KShcsTqn3a6Pcy6EAqCQg1+yZ5XBK9ZaBcY/hvT+H
	2NIZFMPQpFZMQkE0i5fexVOu+ia4DTb/Pgj2EeUPLaxgDVfa+jsh+KbdAkn+9GIxBnhRZgoF5WOKw
	Aetvxjdu27/b+ce1FT3gkPbqN/uWvdZiEGUHwt0tMMjeZkNgcAHc4AHpy5+CXRE/F45Cz2xLlXVKb
	LNzlrJKycqeL+qy8CVHNp5asgv5Nf8VLSh2Bwb6OEU9bWaaLStleq88WpE26I01RK8tIV2dGgMqNE
	seuClUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pUf-0000000CuxB-0l2V;
	Thu, 24 Apr 2025 05:51:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pUc-0000000Cuwn-3ODL
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 05:51:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7FM010071;
	Thu, 24 Apr 2025 05:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p0hqLDU/BqROalaZlrochM
	ujk91gL2X1X5u9oWdHQSw=; b=Y8TbQjVVgmc6+72/c9nAGxohTBEX1wf0Dst6WE
	7qURksxpAX5WZZgOsWBW8qpA5XsUAgxYN7647fAPOrcskqng5RpO9jUdqcebqFDB
	6AAShiu8fwa0fHm4XweG0ta2YePKSPlLtzc6bKdpTfaEP576q1QSRNAbVu6vb1hj
	gEhO5Ic2nUsU9oealgeJqCO1tU29BJ2ZWDgNPkysSvS3FTCDdkxPhvqK5wIPjvJI
	J1+B48jISmvzxS8xWmBYhduMgKL2k9kduXbRni8uZZCW1dTqU6i9Rx9dqBCa2u0B
	nGtfQLVbk/MkOgQ9EuvXs0JcWPlmn2vJFtb82eCNnYDgpR4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0cdb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:51:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O5pPRb003708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:51:25 GMT
Received: from hu-svardhin-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 22:51:23 -0700
From: Sowjanya vardhineni <quic_svardhin@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        P Praneesh
	<praneesh.p@oss.qualcomm.com>,
        Sowjanya vardhineni
	<quic_svardhin@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix invalid RSSI values in station dump
Date: Thu, 24 Apr 2025 11:21:04 +0530
Message-ID: <20250424055104.2503723-1-quic_svardhin@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ia268lT2qeS5Qjg3CPqyRbnxacm5RcoC
X-Proofpoint-ORIG-GUID: Ia268lT2qeS5Qjg3CPqyRbnxacm5RcoC
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809d15d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1SAiWIxsnNecYTMwat8A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAzNSBTYWx0ZWRfX104Z2oHxr7PH eg0DK75UilpWuKjL2j0+9MzNEKvogSTcke6ObAvFND4P3DaM6E5/v0sr5To9d7Hx4JFD7NPk1/d 838h7iyItoNiOWbHs44q9z7JvmhV7Z3Xbbkb0x+EEmZLkQl8sAcN9pSVqwsWULcLU3UBQTlliD1
 7rLh9ZHJIxF69qUmFR9Mq+zjnfyFCc3l3DCQDKDx2RPGoVQlP8Fp8AFpUJ4QyqhGRJ2+MXyX7h4 gD6kGBLCpu0Pp/XoC1m8Xty+Bw8exagz+/czucTDtEPZDTvCpiSZSRIetE6CnZnbIa1gNgOgfB+ sDZMLcCX/1XYPu1TMDJhhM3/lfH8V4pgNCSBD0HHri5Onb03UDrYTJeQq9GajN3sYAhQ+CwLyA/
 kYfcDwQxKPACvkIaU7vVoZ5ietj0r+EcvPap+JCcJaY0D7IA2nlWptCcUKj7rse3Fdl0IicY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=788 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_225126_873964_6C1059E1 
X-CRM114-Status: GOOD (  11.37  )
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

From: P Praneesh <praneesh.p@oss.qualcomm.com>

When processing a "station dump" command, the driver retrieves RSSI
values from the HAL_PHYRX_RSSI_LEGACY TLV received from the monitor
destination ring, and reports them to userspace. Currently, the RSSI
values reported are improper because the hardware has not been
configured to update them properly.

To fix this, enable the HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO in
the filter setup to ensure the correct RSSI values are returned in the
HAL_PHYRX_RSSI_LEGACY TLV, resulting in correct RSSI values being
reported to userspace.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
Signed-off-by: Sowjanya vardhineni <quic_svardhin@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b19e30d95560..fa952f6ca4a3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -229,7 +229,8 @@ ath12k_phymodes[NUM_NL80211_BANDS][ATH12K_CHAN_WIDTH_NUM] = {
 const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default = {
 	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
-		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
 	.pkt_filter_flags2 = HTT_RX_FP_CTRL_FILTER_FLASG2,

base-commit: 12b93f7c6d101d22e0ea3bf4a240699746c79117
-- 
2.34.1


