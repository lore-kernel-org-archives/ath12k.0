Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB4BCD1284
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awwxh7cg/+AvTEaIf5xaM20oDbqFazrBTIi79sYy7Hk=; b=LlMPfUBvULimKAzvxqZMbexfCz
	N4P3KcNiSiSFCRgX2uEKNQcaQ0/AvlatuTSvcjNO026QlopkYqItS6917W+ClPxTAfZs6fajvg6fT
	BaIeljakqcKiclZrxMWVQDQvQcpuRJpX37aY0f0/oFEv/Vi55tuAm8tG/xqkhcZFDyeLD0X2TQa16
	s9m2GrH8p4h21isiuQ62jxyCFsWfx/y6SEmb8WymRN7T3w7HllCLpAgtyCrBAKXuIGXcENHzq4sCM
	5N6438ueLxKj8HNHN67txCQNnClU0+D6nwXLik+fxHV6AIkw3sIpsSz1kg7Wc7CiQ0j88f+L0f9b0
	0Qtuj0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rura0-0000000BV0t-2LMS
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 10:22:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurZx-0000000BUyn-1GMh
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 10:22:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B8Eo5M032381;
	Thu, 11 Apr 2024 10:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=awwxh7cg/+AvTEaIf5xaM20oDbqFazrBTIi79sYy7Hk=; b=Rr
	ZFJyr6pYvpGWVRDHKO7V8fThyIKAZ47i34ObSwHLtHaDpMtS4u3IDD2TeE4rE5jW
	Ho1Zt4YjkjO1FyhOL8VsGgiiRjfUTVogXoO7fDBONOYOK4f6QvFKgTX1Dbf3ymD+
	y3gSU8Q+tFJXFimXCdLl2II257/rEwL8cvzmOWz5GmJgVagRzAxeN06iq2XrwUdE
	WP7AgYSgel8ngBLzWwwDhIUufMFv8mtCIMwiqhXV+AmYX7b674OUmsyXFj4k7Dht
	VPXYDszUsrT2w9JJQzMI9YyS3tH/Kb0DE7JQQ8lRHBRxKCiMnBBALJ8yfexQ+gu1
	XxL0lqJxcZaDTyq4hnsw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6dgjgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BAMh2O019661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:43 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 03:22:41 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 1/4] wifi: ath12k: avoid redundant code in Rx cookie conversion init
Date: Thu, 11 Apr 2024 15:52:23 +0530
Message-ID: <20240411102226.4045323-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
References: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9TZ6RCVvHO5ZHOpAeQqBrqF4f_R8bh93
X-Proofpoint-ORIG-GUID: 9TZ6RCVvHO5ZHOpAeQqBrqF4f_R8bh93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=895 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_032249_460751_2B079E95 
X-CRM114-Status: GOOD (  11.83  )
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


