Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF031C282D3
	for <ath12k@archiver.kernel.org>; Tue,  4 Mar 2025 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlJ0qlR0+66MUXiXPJvUVirWZSEYVjo9iceen10ezWQ=; b=o4sYtSKW31bu9U9mwkVzNodFL3
	EnVYvfqqys7yrkUVOC5lo6d332qQy/T/Z0j7ZKtA8qrmu4l7EaNMnixLuDE4r+YHLArxKK75oqsc4
	Ag0UEt72dx/+1B8da9vVp55VKJAm06NQb6k69/+JoF3mrZHxwUIERxiMrBtvECFTG6naj+9lTwEUS
	azkpNPYTtDb7uNB9TYovB56M+OzbET0FLmkG3o+ABekmDW2CxIqOMQUrpdEEXrOP4z0/YyFAFXgVF
	I1xCFzjVXe+m9JswHoLWHYfeipOmUCoYK++SEAqAyfrQBmOzlUqPsxUwOA4XPKw56wfQOocfIzOmV
	w7Fo4zZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP0y-000000041Tv-2DbT
	for ath12k@archiver.kernel.org;
	Tue, 04 Mar 2025 09:56:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOya-000000040jq-23Kg
	for ath12k@lists.infradead.org;
	Tue, 04 Mar 2025 09:54:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5249Sm9n012764;
	Tue, 4 Mar 2025 09:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlJ0qlR0+66MUXiXPJvUVirWZSEYVjo9iceen10ezWQ=; b=K45pTLIA6TpafRvW
	XF/qoV2BxgkNIIMDeDzk7qUMdArLRRQwnGm6LgZkRjev+sp2oRIgK8gU5GG3Vj/y
	inW0UjlqLJquO2GiuWVolf4icEe+1ikDiTMh2r88u56wz5+Dkv0SSU6KioPewFVg
	mqs0MPLTi7gappNCujc12/11eiP35HLOl3UHAGlaF/Q7ZcMiBE2MbXfgrBKwLAFQ
	jjLnb2NZED8r8Ceweme/CtXIj4LFyBgsAMvPfza6fq5iZia3JndJv7AhC66qkyWq
	YGE95OpSq0cemEz2AofbGLYUeNf4bs4V0y2VHLjZ7v6/LvSeH16NwVJuyCWjiw0/
	36XL9A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t1evp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 09:54:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5249sBsH027937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 09:54:11 GMT
Received: from hu-surapk-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 01:54:09 -0800
From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Suraj P Kizhakkethil <quic_surapk@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath12k: Pass correct values of center freq1 and center freq2 for 320 MHz
Date: Tue, 4 Mar 2025 15:23:15 +0530
Message-ID: <20250304095315.3050325-3-quic_surapk@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304095315.3050325-1-quic_surapk@quicinc.com>
References: <20250304095315.3050325-1-quic_surapk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D1josDCKOqByJCmw01A6hbupzwQdkMx1
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c6cdc3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=OyfERs9buAgBwf57kVEA:9 a=iQ38tI3Jhiso9qxjJTu-:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: D1josDCKOqByJCmw01A6hbupzwQdkMx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_015412_532258_CFCFA3D0 
X-CRM114-Status: GOOD (  13.16  )
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
index bed8c24aef20..d6068ae10421 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1043,7 +1043,15 @@ static void ath12k_wmi_put_wmi_channel(struct ath12k_wmi_channel_params *chan,
 
 	chan->mhz = cpu_to_le32(arg->freq);
 	chan->band_center_freq1 = cpu_to_le32(center_freq1);
-	if (arg->mode == MODE_11BE_EHT160) {
+	if (arg->mode == MODE_11BE_EHT320) {
+		if (arg->freq > center_freq1)
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 80);
+		else
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 - 80);
+
+		chan->band_center_freq2 = cpu_to_le32(center_freq1);
+
+	} else if (arg->mode == MODE_11BE_EHT160) {
 		if (arg->freq > center_freq1)
 			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 40);
 		else
-- 
2.34.1


