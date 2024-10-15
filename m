Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECDAD1D896
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9euz3h8UX7OIntdCXSdQ/Ss30GDYBY0tQ9WcFi9RDY=; b=GZnqs9RRepn1xRL7wEIliVme7G
	LsPT71gvDbXaU9LahR2Cs4CbnTCrnfXC8hikeFhQmOPHUYi76ERvZKCZnwJKkkNyINoG33MsOZ0c1
	YIsDSHPKsB6Pu0RmHkssY3rOfkYLqz4Tsr6cx6hTTWm1dBfj5Op91IFVKuFHVJC3j93PXA8zOMi6Y
	8+5txGvPAeoUNozcYmGlLRsEd52vWe2f4SoGx7hlVRcOum/usUla5dRxbi7E/BqmuWhEZHu3jqgmI
	Yb4u8wkS2lCZ0yXhZeOzCSD9mSG/GI4UToeLK6exgtgMvgMCdgrKvLojvpAz5azM6WJj+moOkI0d8
	O+L0Gh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mGr-00000009C5t-0KVf
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 18:27:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mGo-00000009C4k-0EyE
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 18:27:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FB6fTI024391;
	Tue, 15 Oct 2024 18:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9euz3h8UX7OIntdCXSdQ/Ss30GDYBY0tQ9WcFi9RDY=; b=j8vgzIJtnUuAFMPU
	N2Lu116xlOvQ3wVqCq1JrAAHZO3SODTRA65tbsGyHX/+P0mUDkCxsZkI0lU87QoG
	b77sRwgDJC2UWj08BOSdQyESK9Q/SYT4MV63yTP4WHwiVR92k9buoeCXxPrcBGTm
	i33akZu76dWUjLlEBA4so3Ej6VDQko3AUlrKxFOuyugAWEp63W2z55q+iiJr3PX6
	wCYqsqJaSCUYbfhx2ngpiHaOwZNtrfAEQBaLW5CatU93O0LKiqwjBog8yhFz278t
	UQ5fQaQV1tSS2YhOLcI104jhUkAliGPJRUV7JmOLI5uih9FBm/NZ75h36K1UuF20
	fUHRJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd90jrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:27:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FIRhGp017877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:27:43 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 11:27:38 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 06/22] wifi: ath12k: add ath12k_hw_ring_mask for IPQ5332
Date: Tue, 15 Oct 2024 23:56:21 +0530
Message-ID: <20241015182637.955753-7-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mgR6x3miKBSCq-nNCCwUzXMjdyXY_eRm
X-Proofpoint-ORIG-GUID: mgR6x3miKBSCq-nNCCwUzXMjdyXY_eRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=963 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112746_129435_410FAE67 
X-CRM114-Status: GOOD (  12.28  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

Add ath12k_hw_ring_mask for new ath12k AHB based WiFi device IPQ5332.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 42 +++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 7ef3c8ede34f..20e4157683a7 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -573,6 +573,46 @@ static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_qcn9274 = {
 	},
 };
 
+static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_ipq5332 = {
+	.tx  = {
+		ATH12K_TX_RING_MASK_0,
+		ATH12K_TX_RING_MASK_1,
+		ATH12K_TX_RING_MASK_2,
+		ATH12K_TX_RING_MASK_3,
+	},
+	.rx_mon_dest = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_RX_MON_RING_MASK_0,
+	},
+	.rx = {
+		0, 0, 0, 0,
+		ATH12K_RX_RING_MASK_0,
+		ATH12K_RX_RING_MASK_1,
+		ATH12K_RX_RING_MASK_2,
+		ATH12K_RX_RING_MASK_3,
+	},
+	.rx_err = {
+		0, 0, 0,
+		ATH12K_RX_ERR_RING_MASK_0,
+	},
+	.rx_wbm_rel = {
+		0, 0, 0,
+		ATH12K_RX_WBM_REL_RING_MASK_0,
+	},
+	.reo_status = {
+		0, 0, 0,
+		ATH12K_REO_STATUS_RING_MASK_0,
+	},
+	.host2rxdma = {
+		0, 0, 0,
+		ATH12K_HOST2RXDMA_RING_MASK_0,
+	},
+	.tx_mon_dest = {
+		ATH12K_TX_MON_RING_MASK_0,
+		ATH12K_TX_MON_RING_MASK_1,
+	},
+};
+
 static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_wcn7850 = {
 	.tx  = {
 		ATH12K_TX_RING_MASK_0,
@@ -1211,7 +1251,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.hw_ops = &qcn9274_ops,
 		.regs = &ipq5332_regs,
-		.ring_mask = NULL,
+		.ring_mask = &ath12k_hw_ring_mask_ipq5332,
 
 		.host_ce_config = NULL,
 		.ce_count = 0,
-- 
2.34.1


