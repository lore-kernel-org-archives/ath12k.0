Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6684BE77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9feI2JUBwkJCvzz6V1r9yFr0fx6Vk4uQjBQj063kCI=; b=A56gIKeZKXgZdnpOwJkIo8WLEY
	Qd+Q5EMPRGnHzUQ/OZd9q8FX/z6LV2ZnEudh6YhyKZ54DD2qHODKWhxffggztjHjP8btugqQNmSW+
	78tlQQqpzsJZ64fNYGXyQdiOVydAZ2ivcmieXUNJT6p+QpLFiIpHDFEGhcRKNs6ZgJc4yfQ5HunA+
	wEuWCYg8sXo/s1chzL4RxADOfAddUChFAOYzohX0ygW5ZXq/ocPg2DJiWrAJSJGOB4ztthfFiFVCS
	Q5ONNRhvA6q7U20LFHPQIl0nkHn4C3KyQrKQtRILh+mFCVjbdHb5HxRhEYl9fKpze3/LZn/Lgttnu
	a/usc8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLtQ-00000002nq6-0khp
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 19:09:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLtM-00000002noI-3vJ4
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 19:09:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHKmIp015057;
	Thu, 19 Dec 2024 19:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y9feI2JUBwkJCvzz6V1r9y
	Fr0fx6Vk4uQjBQj063kCI=; b=EcFQrg+MOtW8nFF99Dxc2FmkTzD1/YIsOE7tV7
	i4CT50tpyEUkuKSzesGXj5C2RHKR+sW+MR/UkkahgOX3hat9PqbRG/V/kyXDQKCY
	7GnKf5NYptlEUhYlRa+8znlNnTXySqeT1q+f7t+sAeqIQQ7D9MT1D8Zi1e1ULXDz
	vzYRsg+Gvn8UnkQO4dWejROdzng6hBpLbPkS3ms+BGXsYGUownB4RzqV7K6z9wsK
	JPp5p9rOa8lM2MwQLySLtg20CFknUVV6yf2HdrZgAGGWqzOARaL+BzNC9qCkK9LC
	tDFNmjuArdyL+ivmYn40XSdbsA7cvZXn0UhDbkmeVN0ybyAw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mqt80821-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 19:08:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJJ8xnk009132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 19:08:59 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 11:08:58 -0800
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ramya Gnanasekar
	<quic_rgnanase@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH] wifi: ath12k: set flag for mgmt no-ack frames in Tx completion
Date: Thu, 19 Dec 2024 11:08:45 -0800
Message-ID: <20241219190845.605116-1-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NiuqUt-k5_1UNvCvZLHUTOOBWvFou5hO
X-Proofpoint-GUID: NiuqUt-k5_1UNvCvZLHUTOOBWvFou5hO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_110900_985905_00EFAE56 
X-CRM114-Status: GOOD (  10.25  )
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

From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

IEEE80211_TX_STAT_NOACK_TRANSMITTED flag signifies that frame was
successfully transmitted without any errors when no-ack is requested.

In WMI Tx management completion path, driver is not setting
IEEE80211_TX_STAT_NOACK_TRANSMITTED flag for the frames with
IEEE80211_TX_CTL_NO_ACK. Without this flag, the management frame
statistics will not track such frames.

Add IEEE80211_TX_STAT_NOACK_TRANSMITTED flag as part of the flags in
skb transmit information when WMI is processing Tx completion for
management frames.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 562b0615ed06..a098d4303a63 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5362,6 +5362,9 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
 	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 
+	if ((info->flags & IEEE80211_TX_CTL_NO_ACK) && !status)
+		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+
 	ieee80211_tx_status_irqsafe(ath12k_ar_to_hw(ar), msdu);
 
 	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
-- 
2.34.1


