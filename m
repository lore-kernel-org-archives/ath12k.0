Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575D6C47DDF
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 06:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmVXKId+DBQDIUM11J5Xbn9JnGmCg4l1DhYD7mQ8j40=; b=HmncTlm+jXuMX3fXHr6YIVQGbo
	aD+rqjH8o02Xy77axLMsJGC6b1Mye3Ak5MqyQNESYRCZJ3CjWwraZ1RKo632xLuh8oUnI2q/O9CVD
	nJu0TfphutjcwA1R/oMJzQ9UU4tI3ttTN8vSqv5DjGGyP+NBAiLOrHsjNE7Fe1yu4f2xchVPMN54U
	d/ruhU9v/M0YVucdCBxEgGIcchbMWypxY96TpoaJLoUiCRkwPfdj2E6CNd7ZSZZy3Xl1WCtWf1D0j
	Cxd+cJdKJz0UuTb9IW9yOu6MVO9mC8vIGoxe4GBi3gxS+sWww81jb4dA+tMpcpdhx0HRBWJ77Eys+
	sEhK7FAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULaw-0000000BZ8j-3vFf
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 06:58:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULas-0000000BZ5n-3OKC
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 06:58:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T5oiua030747;
	Mon, 29 Jan 2024 06:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=xmVXKId+DBQDIUM11J5Xbn9JnGmCg4l1DhYD7mQ8j40=; b=Fa
	SXzFqUjXD/upCGrtYCBX0KCJlMG+srADO2RM1RC5M8ffdwFEOqJOqD54F44sCVE8
	FfnFW7YrtUASmUCpESUz8lSxP3BLbcqqN/SKdteIm6ByoZNrXTtt5pUbj116pDsF
	KGsr67gHCH4mscnKhl4S/QzesJ2wb8FT7SfPAFJSAe+Czc+VGas9oYIXV/y9ISe9
	udmwdAyH8mcXzlRk77z+f4W0rUdycdaD8NV3wpyfN/h1N19006irGbegk+GoPs2a
	Bw9P5+hFysvVjovEO4HDXgJ4yPeCCnfXjRW9PjU3VXd/6I1iW6SeNgTDAFpqbX3b
	8Nfh8ggPgbK714L7MsMg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx23k8ft7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:58:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T6w9I9006625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:58:09 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 28 Jan 2024 22:58:07 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 11/13] wifi: ath12k: fix PCI read and write
Date: Mon, 29 Jan 2024 12:27:22 +0530
Message-ID: <20240129065724.2310207-12-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: szydAUpalrUnP2YsWNfWJPbnT-yJFQuW
X-Proofpoint-GUID: szydAUpalrUnP2YsWNfWJPbnT-yJFQuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_03,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=908
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_225810_921612_36F79F5D 
X-CRM114-Status: GOOD (  14.48  )
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

Currently, PCI read is failing for the registers belonging to
SECURITY_CONTROL_WLAN registers. These registers read is required
to read the board-id to identify the dual-mac QCN9274 hardware.

The failure is because, for these registers (SECURITY_CONTROL_WLAN)
offset, ath12k_pci_get_window_start() returns window_start as 0. Due
to this PCI read is done without PCI select window and with
window_start offset as 0.

Hence, fix PCI read and write by doing PCI select window and by using
the correct window_start offset - WINDOW_START for
SECURITY_CONTROL_WLAN registers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 43 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index d334f41f9658..14954bc05144 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -205,18 +205,17 @@ static u32 ath12k_pci_get_window_start(struct ath12k_base *ab,
 	/* If offset lies within CE register range, use 2nd window */
 	else if ((offset ^ HAL_CE_WFSS_CE_REG_BASE) < WINDOW_RANGE_MASK)
 		window_start = 2 * WINDOW_START;
-	/* If offset lies within PCI_BAR_WINDOW0_BASE and within PCI_SOC_PCI_REG_BASE
-	 * use 0th window
-	 */
-	else if (((offset ^ PCI_BAR_WINDOW0_BASE) < WINDOW_RANGE_MASK) &&
-		 !((offset ^ PCI_SOC_PCI_REG_BASE) < PCI_SOC_RANGE_MASK))
-		window_start = 0;
 	else
 		window_start = WINDOW_START;
 
 	return window_start;
 }
 
+static inline bool ath12k_pci_is_offset_within_mhi_region(u32 offset)
+{
+	return (offset >= PCI_MHIREGLEN_REG && offset <= PCI_MHI_REGION_END);
+}
+
 static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 {
 	u32 val, delay;
@@ -1172,15 +1171,17 @@ u32 ath12k_pci_read32(struct ath12k_base *ab, u32 offset)
 		if (window_start == WINDOW_START) {
 			spin_lock_bh(&ab_pci->window_lock);
 			ath12k_pci_select_window(ab_pci, offset);
-			val = ioread32(ab->mem + window_start +
-				       (offset & WINDOW_RANGE_MASK));
+
+			if (ath12k_pci_is_offset_within_mhi_region(offset)) {
+				offset = offset - PCI_MHIREGLEN_REG;
+				val = ioread32(ab->mem +
+					       (offset & WINDOW_RANGE_MASK));
+			} else {
+				val = ioread32(ab->mem + window_start +
+					       (offset & WINDOW_RANGE_MASK));
+			}
 			spin_unlock_bh(&ab_pci->window_lock);
 		} else {
-			if ((!window_start) &&
-			    (offset >= PCI_MHIREGLEN_REG &&
-			     offset <= PCI_MHI_REGION_END))
-				offset = offset - PCI_MHIREGLEN_REG;
-
 			val = ioread32(ab->mem + window_start +
 				       (offset & WINDOW_RANGE_MASK));
 		}
@@ -1217,15 +1218,17 @@ void ath12k_pci_write32(struct ath12k_base *ab, u32 offset, u32 value)
 		if (window_start == WINDOW_START) {
 			spin_lock_bh(&ab_pci->window_lock);
 			ath12k_pci_select_window(ab_pci, offset);
-			iowrite32(value, ab->mem + window_start +
-				  (offset & WINDOW_RANGE_MASK));
+
+			if (ath12k_pci_is_offset_within_mhi_region(offset)) {
+				offset = offset - PCI_MHIREGLEN_REG;
+				iowrite32(value, ab->mem +
+					  (offset & WINDOW_RANGE_MASK));
+			} else {
+				iowrite32(value, ab->mem + window_start +
+					  (offset & WINDOW_RANGE_MASK));
+			}
 			spin_unlock_bh(&ab_pci->window_lock);
 		} else {
-			if ((!window_start) &&
-			    (offset >= PCI_MHIREGLEN_REG &&
-			     offset <= PCI_MHI_REGION_END))
-				offset = offset - PCI_MHIREGLEN_REG;
-
 			iowrite32(value, ab->mem + window_start +
 				  (offset & WINDOW_RANGE_MASK));
 		}
-- 
2.34.1


