Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C6C04FFE
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 07:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bxx4KK47uAyf3m6ptl0PVPbJrylEdGaXrem/QL3uYxA=; b=X2797GkvSFhJaF7Vy0K/2n7Jwj
	564n5ixp/eXnVSDguvx0jIRe+XlMs5U0OUoJjTO9u79J0oZ9RZqaXLUeFYVGEWPTV2JRJ8E9rWYAo
	UMJqiAqqiUss7nkx/fdMQbvxrVKh+E6Q/LChOE7umPnikGRQGx2R6S1ayPnHTalQ0DVK6C0E+Pg6E
	KRP2DZQ02+qeKHFs8uRBN1g0tFG4OtG4E/LKjTBGRgndi/zWOH0T7PFwbbu4TlPrjpJ83rN70kD/c
	gQmFdQ5sOdNrxlgdcBvi2wR79a1TRgfD+XhACJLpoaBUpjysUq+Zh2OVGdvrC1JnxTmVlGBt029WK
	CapArNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1K-0000000DiMq-2BSK
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 07:01:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1I-0000000DiM6-03EP
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 07:01:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0vWwW009728;
	Mon, 20 May 2024 07:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Bxx4KK47uAyf3m6ptl0PVPbJrylEdGaXrem/QL3uYxA=; b=YH
	fscpIFCum4foNzVJvXyni1FpcJjmhVS6pNu5mO26QVJRPd2k1j6+OFTRFkRLQNeX
	CjAHgN/StTWaWi25PCtKddXMl2BdbgpVLUERJt4B1w3gwEWD8z6aSCw4XwGthMUo
	ToTX+tEs0wEPc2/XshrK+nOxqCrBj+0DkkAHCMi+1BJpnfOgxnCOFNCgeNIF4DPz
	VHsxTi4E7oNeZlHpS0A1tdx/IEymQE41Q9aTbyrvTPnegqRq3exmBERC8BJ/o7jy
	Sh/U91Qwg89ssU0Xb/XBUJqP5E5F8pF3BlCk9k/lbAoAppGlb9mS52CY8S/tlSjN
	B+GDpc9ZuKeYI3hcd69g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4gapav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K71DPR028083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:13 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 May 2024 00:01:11 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 2/3] wifi: ath12k: fix invalid memory access while processing fragmented packets
Date: Mon, 20 May 2024 12:30:44 +0530
Message-ID: <20240520070045.631029-3-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520070045.631029-1-quic_ppranees@quicinc.com>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B_4DcRW6xWkCFEXjhg4yQfBR7wr2kcjF
X-Proofpoint-ORIG-GUID: B_4DcRW6xWkCFEXjhg4yQfBR7wr2kcjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=951
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_000116_190704_F20E8470 
X-CRM114-Status: GOOD (  11.80  )
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

The monitor ring and the reo reinject ring share the same ring mask index.
When the driver receives an interrupt for the reo reinject ring, the
monitor ring is also processed, leading to invalid memory access. Since
monitor support is not yet enabled in ath12k, the ring mask for the monitor
ring should be removed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 06f443216488..ffe06ebdc992 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -544,9 +544,6 @@ static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_qcn9274 = {
 	},
 	.rx_mon_dest = {
 		0, 0, 0,
-		ATH12K_RX_MON_RING_MASK_0,
-		ATH12K_RX_MON_RING_MASK_1,
-		ATH12K_RX_MON_RING_MASK_2,
 	},
 	.rx = {
 		0, 0, 0, 0,
@@ -572,8 +569,7 @@ static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_qcn9274 = {
 		ATH12K_HOST2RXDMA_RING_MASK_0,
 	},
 	.tx_mon_dest = {
-		ATH12K_TX_MON_RING_MASK_0,
-		ATH12K_TX_MON_RING_MASK_1,
+		0, 0, 0,
 	},
 };
 
-- 
2.25.1


