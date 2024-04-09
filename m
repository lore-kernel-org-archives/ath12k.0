Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C3CD1296
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awwxh7cg/+AvTEaIf5xaM20oDbqFazrBTIi79sYy7Hk=; b=K8IZz3ANTH/KTSm60+c7K89G+H
	xnwv3QmD7VErTWCPH4gRgbVmtOYCou6LfcOQaRtbSNsjvww/NfMWcNQEqLl/GAXYZFjyNpRlpbuDI
	ASiwQcWAd4s40unGaYaWFrmHNVV7WPfPtuZ+M2mr33PuPHEa+ihPENIutlX6HAG3Hi1jVBb+XR8tg
	kwNmpT3g09IGDrDuyiyXxlGwrmGyutHPQJ+VmmdC0jBk6buakveAHJpD+XeBGYMiSVJyBFDkL4wh5
	0oV9c51BW5t+lJRJraP3XjAUBVHL9P+Uvq+ITQMofisZ106yW+Bj04EpMPJ0sXirnVrkjwuqrq8QS
	xzknbGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDBF-00000002e7D-1tjZ
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 15:14:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDBD-00000002e5D-12tx
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 15:14:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439CpMAh016113;
	Tue, 9 Apr 2024 15:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=awwxh7cg/+AvTEaIf5xaM20oDbqFazrBTIi79sYy7Hk=; b=GS
	ajjFFOmFCwuXCGFD4+gcMDPaw9vsnmnbyVQRKg36Zo+fE/iyWz9aXR0FFL1N/wHM
	gbpvvH4yJIG56XdQ14SgRVtBlBZHQ+2gdl7Rl8IMlP/OFLTWxoce6yMiYJGa/O52
	dCTAhirYAllqml9g7HeOPtTliX3HXLlMqPS+0USaijZOgfKBUyZIwfbMP+baaJAO
	1YBv5rjc0aNTur65vsdpB4+54zJzreniUSvfLnKCsp/ooppu3p9TOjUZU8u9YtbL
	hEcUD8SZuJa1rTqQVTRQpj/netUvs8rGHYyP6njHCgShvmO0EMNk6GsusUHCxFPZ
	/zhwuql/o1Sd71TrrW/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xd61v8baw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 15:14:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439FEWdH020465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Apr 2024 15:14:32 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Apr 2024 08:14:30 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2 1/4] wifi: ath12k: avoid redundant code in Rx cookie conversion init
Date: Tue, 9 Apr 2024 20:44:12 +0530
Message-ID: <20240409151415.1226109-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
References: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NBNlOK4Z2qqHcU1m5qDG597R8pKtsYKS
X-Proofpoint-GUID: NBNlOK4Z2qqHcU1m5qDG597R8pKtsYKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=895 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_081435_316741_C30685A4 
X-CRM114-Status: GOOD (  10.90  )
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

Currently, in the Rx data path cookie conversion initialization procedure,
the primary page table index (ppt_idx) is computed within the secondary
page table iteration. However this is invariant, and hence the ppt_idx
should be calculated outside of the iteration to avoid repeated execution
of the statement.

Found in code review.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index a0aa8c571867..796c757c0f58 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1425,10 +1425,11 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			}
 
 			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
+			ppt_idx = ATH12K_NUM_RX_SPT_PAGES + tx_spt_page;
+
 			dp->spt_info->txbaddr[tx_spt_page] = &tx_descs[0];
 
 			for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
-				ppt_idx = ATH12K_NUM_RX_SPT_PAGES + tx_spt_page;
 				tx_descs[j].desc_id = ath12k_dp_cc_cookie_gen(ppt_idx, j);
 				tx_descs[j].pool_id = pool_id;
 				list_add_tail(&tx_descs[j].list,
-- 
2.34.1


