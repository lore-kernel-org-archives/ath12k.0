Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F13E77172
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 01:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NozwjvjMI0URh9H+VuZv7GFOaAy1koE/0tlvC615hXw=; b=Jq1hrq0iI+ECp0YAN+O8sCNGxn
	kI17nL17ZK3titr9GgJncj+IyUOxfawxpSZfGY0YTwSHPLlwpDTSZFV70C/2maqzkWxmNEr2RMjz2
	e4gpMFB1nJhaOAl86ZIBT5ySqmdn/WoauTBYqJCw2mNnAvzTnO88wLenAB8OnQrtY6m6tb0UE1HA+
	IWzvCzEPIplqzZtcpLcbl9aZgvfehZigLpMtGIA1j1Cqz5oCiXDMDlrRzG6odz/9K83/glljJPdmz
	NRbu+nmCTFuwYa3hJJ5PID+marcHc1NahY8+wrcVENI1hauTXSyg3zDG+t51b7+jZrvu4vJwRmGjt
	uI92u1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ0NX-0000000ERKr-1q7r
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 01:10:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ0Lw-0000000ER27-2YoT
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 01:08:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4FamMv023344;
	Thu, 5 Dec 2024 01:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NozwjvjMI0URh9H+VuZv7GFOaAy1koE/0tlvC615hXw=; b=eZGiNIF2e6VHH8vG
	py5y0Een4Zh3KVRBz8KpKtnP8Ym75h1j+7bcPU+j5K8pJP2dgZABz2v05Jou+Wpz
	/ixZoIlrajOXn+SHJ4bAytYd44B673LrBlldhxkmyMh/5HD3cu1agvieIKlZEKDU
	arJ5OITJkuLfcDYbAakEBKhl6eyuoSIp6mEh4tYKogBHR/GZPHL+NfPgDRqOKk2P
	QEEMOX/00QZLOY8x75mbnXOO3a5t2s1sK2DfI2lWaKMqT9OKIJ5ukjC0PeWwvA3X
	o2/FzOT9Pf4/VdclrM+xigGlP4X1u0GYu1luVd3+Gnk7aOC/o5fZbnrlBqUV9QR2
	jXE5iQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42ame9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 01:08:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B518MPw025671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 01:08:22 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 17:08:20 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2 6/8] wifi: ath12k: Remove unused HAL Rx mask in DP monitor path
Date: Thu, 5 Dec 2024 06:37:52 +0530
Message-ID: <20241205010754.2846603-7-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205010754.2846603-1-quic_periyasa@quicinc.com>
References: <20241205010754.2846603-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vbK-dwStNAQ8ZSL5kayL1CcTZiBAIK5Q
X-Proofpoint-ORIG-GUID: vbK-dwStNAQ8ZSL5kayL1CcTZiBAIK5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=651 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_170824_762154_7B39CC4A 
X-CRM114-Status: GOOD (  10.18  )
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

Currently, CODING and TXBF are unused masks defined in the HAL Rx monitor
status TLV parsing code path. Therefore, remove the unused masks to
prevent incorrect assumptions for code readers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_rx.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 5cf3c5787ab7..b08aa2e79f41 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -398,11 +398,9 @@ struct hal_rx_he_sig_a_su_info {
 #define HAL_RX_HE_SIG_A_MU_DL_INFO0_DOPPLER_INDICATION	BIT(25)
 
 #define HAL_RX_HE_SIG_A_MU_DL_INFO1_TXOP_DURATION	GENMASK(6, 0)
-#define HAL_RX_HE_SIG_A_MU_DL_INFO1_CODING		BIT(7)
 #define HAL_RX_HE_SIG_A_MU_DL_INFO1_NUM_LTF_SYMB	GENMASK(10, 8)
 #define HAL_RX_HE_SIG_A_MU_DL_INFO1_LDPC_EXTRA		BIT(11)
 #define HAL_RX_HE_SIG_A_MU_DL_INFO1_STBC		BIT(12)
-#define HAL_RX_HE_SIG_A_MU_DL_INFO1_TXBF		BIT(10)
 #define HAL_RX_HE_SIG_A_MU_DL_INFO1_PKT_EXT_FACTOR	GENMASK(14, 13)
 #define HAL_RX_HE_SIG_A_MU_DL_INFO1_PKT_EXT_PE_DISAM	BIT(15)
 
-- 
2.34.1


