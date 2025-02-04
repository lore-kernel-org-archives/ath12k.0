Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1CC02196
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 05:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnuMkCTVXu5UeKaSUwz9cY8BRcQVw1EbU5gqxKwtCA8=; b=xfwRH9nNmD4/pYZ6mui1wmmf+C
	EPUa524mwf5En6Us2Wb5cOxKxC9QbbKdSC67Vv+Tg5lMLdTFrF7vTjotXP6jxNrgzlwJ1N5Ez6XhE
	DWpxrJh/5uVotA4w4FAm+MTBYC6je7OfO2BNIrrB9xWT0zn1iY2r09eWM85SJStxEQ8Fk2BKf5JII
	dwHJ3N4F13946zma7HI8hbOvuRtsGJMs4yhWjQQ7wscIq8gzHak9Rwo0D0HC4jVy4WOn1pIc6a6TN
	41Q7+IyNkypPjWldpnDc0jXzaH59HyZUnLEJCmVKnUc1u4fEu7mKIbThrO6QmPkwPg1qv98upkSTr
	i46Hm1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBar-0000000HI60-1qsE
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 05:35:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfBap-0000000HI4v-2j6M
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 05:35:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51457l4N007884;
	Tue, 4 Feb 2025 05:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnuMkCTVXu5UeKaSUwz9cY8BRcQVw1EbU5gqxKwtCA8=; b=UllazbF8T361eyL4
	fslOreHN69FWILx7E38FKqf/uCDCY74APjeemQrPvQcnlqUafE6vSx5XbxdoIh3o
	9v2u39QTztuNL0hDmyatFB+esyV5UIwbLchQrjDPRNkYpv2xk/Etctl9sdyuML4p
	5rNB16kcZ8Twxs64rieaa6u1y4TgvE18CbefTDqKqw7D5tlJB0p3Fp5yX3Urb5Lo
	NJlJblfohnym/e+f7TqwGUiMYaBoVR4nc6D5KG+p8dDxmmcOtF/myj6gDMdjkIl4
	eDtO1tjzVT3OqMUoZR+YcEnPWSGjimXX9RQO4DOftxDn33uove5HxazT+Eqtkk2Y
	Dkngtg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcfp01rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 05:35:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5145ZP9m026842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 05:35:25 GMT
Received: from hu-surapk-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 21:35:24 -0800
From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Suraj P Kizhakkethil <quic_surapk@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: Pass correct values of center freq1 and center freq2 for 320 MHz
Date: Tue, 4 Feb 2025 11:04:51 +0530
Message-ID: <20250204053451.2703834-3-quic_surapk@quicinc.com>
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
X-Proofpoint-GUID: WGP6YD1UwJajc3SA8ueXWXjXZb0Zu1nE
X-Proofpoint-ORIG-GUID: WGP6YD1UwJajc3SA8ueXWXjXZb0Zu1nE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_213527_817933_153A2B94 
X-CRM114-Status: GOOD (  12.62  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Currently, for 320 MHz bandwidth, center frequency1 and
center frequency2 are not passed correctly to the firmware.
Set center frequency1 as the center frequency of the
primary 160 MHz channel segment and center frequency2 as the center
frequency of the 320 MHz channel and pass the values
to the firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 848a65268194..982bdfc4902f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1043,7 +1043,15 @@ static void ath12k_wmi_put_wmi_channel(struct ath12k_wmi_channel_params *chan,
 
 	chan->mhz = cpu_to_le32(arg->freq);
 	chan->band_center_freq1 = cpu_to_le32(arg->band_center_freq1);
-	if (arg->mode == MODE_11BE_EHT160) {
+	if (arg->mode == MODE_11BE_EHT320) {
+		if (arg->freq > arg->band_center_freq1)
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 80);
+		else
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 - 80);
+
+		chan->band_center_freq2 = cpu_to_le32(arg->band_center_freq1);
+
+	} else if (arg->mode == MODE_11BE_EHT160) {
 		if (arg->freq > arg->band_center_freq1)
 			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 40);
 		else
-- 
2.34.1


