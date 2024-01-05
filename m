Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76272C47DA2
	for <ath12k@archiver.kernel.org>; Fri,  5 Jan 2024 19:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKJX8DpzuvAVcthquEQSl9CnPSw9uFBlhjT8mvvjuqc=; b=0zIzEbK+WqfazS8+Anwg8Pqq89
	tBLkc4JDaxiX+Yl57LmkezJhg693He2nNtUKfqsFFoVZx3RNN63bbs/BHnxCGI6szC8dhoRQXpcDk
	k3y5nJG5CbfuPgbxIMgc4a07hQ/1z/8DXg2VIaZPBayrDVc3AsCMOj/0uKhDRPeMDIKT+Wi6ey7eL
	FdTdCdMnQCASvpr4EbHKxQH0rZW0v98SWECQ26L/jRncN+dNq9OD8F9zwXcKvsUCwKAFKMnNvz9WN
	uUPF/PUKe+ER8Jg9nbi7F4wJzxJY+uBDWMledKTC1s1ZzTeDV84vZOhovuHUYpZeh6BwRR9ewToW7
	ajUeIzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJu-0008kw-0g
	for ath12k@archiver.kernel.org;
	Fri, 05 Jan 2024 19:57:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJm-0008gb-2x
	for ath12k@lists.infradead.org;
	Fri, 05 Jan 2024 19:57:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 405F5a8l030638;
	Fri, 5 Jan 2024 19:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=mKJX8DpzuvAVcthquEQSl9CnPSw9uFBlhjT8mvvjuqc=; b=gX
	tQaQUWE4w4SBcfgspb9L4uedW+YRTaZySxKYMJ9td29ypj/XcU6DTw6A6TFItOOk
	MbOSay/z/SFyo8D7QfnwZntkErffFvBNnac+6uXieLvTcaKBt0uHyYNtpWM9EJZL
	kRlG+Kpe9pNT6hmQkt37PBLLnbqI9yoBOUfHmjbiyY7Ebg+tuMC17nSyfU785ejj
	WV6Nr7GPOMoWgADStw1pehzfxW0cDUPOOIKKuratmngL2wguAGrN5dk+PhW4+Goh
	mPPeHUtz+CN/5/hAAyU/4TxacNNDXOWzipgNcdDG4txkVvKBP1PDZwPCdxFA8QGG
	gm/Toy3m5I5IeqC9JG+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve94ra72u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 19:57:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405JvMvI000345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jan 2024 19:57:22 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 5 Jan 2024 11:57:19 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 11/12] wifi: ath12k: fix PCI read and write
Date: Sat, 6 Jan 2024 01:26:38 +0530
Message-ID: <20240105195639.3217739-12-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
References: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: el1JOXZ9lp7hmuVQ9EyPQEj6WyjXzVSR
X-Proofpoint-GUID: el1JOXZ9lp7hmuVQ9EyPQEj6WyjXzVSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxlogscore=951 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_115722_961073_25E6AF08 
X-CRM114-Status: GOOD (  14.22  )
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


