Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C36CC02196
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 05:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmO7ibLXAi5oB2uIK3WSFCe/c0foBv16j8IkzgabKO0=; b=ZKgafotRCAe9CuwKLZCfu7jCZM
	9qi6uTALuZPF4XBO43PQGNmwCOPE9FSHLYeT2zeje22J39s8ffrhdgfDghvdBvH9cJeKV7LbeE1wN
	m3AA32HreOizxuGmV8SNexOt/e20IkSBHIkYvIVWFHrjjBRjqh99u8MmtxTey49gnVRv9NO4xwIAV
	1xYMMCKqoqltR2AW3TKgMSrzcnMxsmHVL46l4CieV5eGKfl0FrgWoe2k+X56i1QoQrcuNsvB3/zvm
	eeBNhB35HA8J9DXwb2mYHnGZIIfodt79fmt0rF7aKfh2tHDAOq+4inS+NIpxsJp/scz2CmRG2OGaA
	PMPSk9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBap-0000000HI4p-0LkJ
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 05:35:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBam-0000000HI46-46WC
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 05:35:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQmY6027045;
	Tue, 4 Feb 2025 05:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmO7ibLXAi5oB2uIK3WSFCe/c0foBv16j8IkzgabKO0=; b=kaVknL0VhaOESTNZ
	FCWU7JumRnFPEeNFbxm6h9tgr/OurIQ5MQjDk6M+0e4VI8k0t35NWnqn9hNN+BQS
	p/hY1pGjFrY8SikSoW+30HUURxvSw+suVVh3FBpDr7NVSFOjiE4g8dBux45qZj30
	BtGjU7TmM1T2O6//hVyP92oaDmwDltSFbQKSaYaZgibGeqx3ORbzi+0QZpIZjjCc
	1YRFzWKfiIhvqH7InkaCli8K3b7Mvy2cxmcro29feobP7E7pDBBHTWIo0uq147Qf
	8Gefjyl0OVYD14m8QZM/y69ArfAMAvVLNzgJFl9ydy5GUlwUeKzqmIkfErrCoYVG
	4lrbHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufrxr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 05:35:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5145ZNpU003638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 05:35:23 GMT
Received: from hu-surapk-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 21:35:22 -0800
From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Suraj P Kizhakkethil
	<quic_surapk@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: Pass correct values of center freq1 and center freq2 for 160 MHz
Date: Tue, 4 Feb 2025 11:04:50 +0530
Message-ID: <20250204053451.2703834-2-quic_surapk@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204053451.2703834-1-quic_surapk@quicinc.com>
References: <20250204053451.2703834-1-quic_surapk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hQ8dS3u3fagN1mYdrrZo5wXKzR7ObDsC
X-Proofpoint-ORIG-GUID: hQ8dS3u3fagN1mYdrrZo5wXKzR7ObDsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_213525_018882_1FE58833 
X-CRM114-Status: GOOD (  12.79  )
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

Currently, for 160 MHz bandwidth, center frequency1 and
center frequency2 are not passed correctly to the firmware.
Set center frequency1 as the center frequency
of the primary 80 MHz channel segment and center frequency2 as
the center frequency of the 160 MHz channel and pass the values
to the firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f934d49acee6..848a65268194 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1037,14 +1037,24 @@ int ath12k_wmi_vdev_down(struct ath12k *ar, u8 vdev_id)
 static void ath12k_wmi_put_wmi_channel(struct ath12k_wmi_channel_params *chan,
 				       struct wmi_vdev_start_req_arg *arg)
 {
+	u32 center_freq1 = arg->band_center_freq1;
+
 	memset(chan, 0, sizeof(*chan));
 
 	chan->mhz = cpu_to_le32(arg->freq);
 	chan->band_center_freq1 = cpu_to_le32(arg->band_center_freq1);
-	if (arg->mode == MODE_11AC_VHT80_80)
+	if (arg->mode == MODE_11BE_EHT160) {
+		if (arg->freq > arg->band_center_freq1)
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 40);
+		else
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 - 40);
+
+		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq1);
+	} else if (arg->mode == MODE_11BE_EHT80_80) {
 		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq2);
-	else
+	} else {
 		chan->band_center_freq2 = 0;
+	}
 
 	chan->info |= le32_encode_bits(arg->mode, WMI_CHAN_INFO_MODE);
 	if (arg->passive)
-- 
2.34.1


