Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53CED1D898
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOjEC8VC0ndDjr2KlHWPV2ogs5acCb2sbpEl5Gd1Z4w=; b=KjQjUVWIWHKVOvs7IQTpt1hac8
	IU188n2p///utdA1vl5kknWF/WPuN3bULdxJRtTnn/fW0UoeAhJKEgpPohjg7txojTTyqtWsNloKF
	ghSNyu/jKscJpHJVSCskeChSprKdjQYQu0ut4AQPq3Shc/hqyRK0c09I5CcEC6R9DdNQ/omZgc4z7
	XCK5vkjvnwEsBDlyld59rRagXgWR2+j9Rc++rTkfx2IyAOb0TLHlPiG/k+k8/AA0Q1vPpjPSKReHE
	pCu6QNWDxGhkPHThx1AGve9rRXN0FXZObRVR6iyFFt1ff/qpWzirEd8ud4dQQXkFdgk+r6PkUDxbJ
	N+BME0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mGz-00000009CAh-2ksi
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 18:27:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mGx-00000009C9K-1nRn
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 18:27:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FG0pUi029374;
	Tue, 15 Oct 2024 18:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOjEC8VC0ndDjr2KlHWPV2ogs5acCb2sbpEl5Gd1Z4w=; b=H4ih/F/SHs2s1c11
	SbGZIJcWGxNutcak4A1ZzSTc3GwY0aJLkwhWRWwKfTuUIzblr1wWjZHIB/Qi7w7o
	ltKlHzzq9Tjy68rQeuwLQ42UZpy5I0XCBU/f1sUHrY/Bjroh8dcSq//1xBOkWkSc
	TmSKqzyZp/wb5cMkHdv8c3v9zVMXpBihMdJjR9dPUfV9Ni0jAT78V9i9w8PGE3aK
	hF0MWPDgB3JpahWVjEu0k6vTa1/evX+9owzzqcD8cNT+d6xblW6yTSlp9c3VVwal
	IAZGAD547TfNEWhNGjQy4HL7xsZfV8XHOpumchLobhIy3N98tDvVMJELuT8oI2ba
	Qu0ZTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429k7w20ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:27:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FIRreY004211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:27:53 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 11:27:48 -0700
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
        Balamurugan S <quic_bselvara@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 08/22] wifi: ath12k: add ath12k_hw_hal_params for IPQ5332
Date: Tue, 15 Oct 2024 23:56:23 +0530
Message-ID: <20241015182637.955753-9-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-GUID: veX0H25SxgN6JQ8XQQepmE58GWvDsK_l
X-Proofpoint-ORIG-GUID: veX0H25SxgN6JQ8XQQepmE58GWvDsK_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=876 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112755_498952_7BD5EBC2 
X-CRM114-Status: GOOD (  12.47  )
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

From: Balamurugan S <quic_bselvara@quicinc.com>

Add ath12k_hw_hal_params for new ath12k AHB based WiFi device IPQ5332.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 481b06613c1e..e5e2164c27d2 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1214,6 +1214,15 @@ static const struct ath12k_hw_hal_params ath12k_hw_hal_params_wcn7850 = {
 			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW4_EN,
 };
 
+static const struct ath12k_hw_hal_params ath12k_hw_hal_params_ipq5332 = {
+	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
+	.wbm2sw_cc_enable = HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW0_EN |
+			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW1_EN |
+			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW2_EN |
+			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW3_EN |
+			    HAL_WBM_SW_COOKIE_CONV_CFG_WBM2SW4_EN,
+};
+
 static const struct ath12k_hw_params ath12k_hw_params[] = {
 	{
 		.name = "qcn9274 hw1.0",
@@ -1471,7 +1480,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.svc_to_ce_map = ath12k_target_service_to_ce_map_wlan_ipq5332,
 		.svc_to_ce_map_len = 18,
 
-		.hal_params = NULL,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
 
 		.rxdma1_enable = false,
 		.num_rxdma_per_pdev = 1,
-- 
2.34.1


