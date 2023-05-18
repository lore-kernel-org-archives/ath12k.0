Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C758C77B7D
	for <ath12k@archiver.kernel.org>; Thu, 18 May 2023 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pxYpYAxe/BO8k07j3LtIMKKwILyZoYvU1ES4hvLjXBY=; b=YQaxUJyVIYdYl1
	K6d/gMNKEhi02n7CZkyHynOx10gxLOrgb7dKifYNitS3GeVzrHqK2ctcLMharMN8ba9L4waunY9vs
	MpdO7Mnyz3gADwiDR1jcgpxa2SmiQP2cZPsksu8KlJMTFm0okkxI804CsxjW6MBypbWR6JtC86+8h
	qPmhb6dFiDRh3HUfn9ON/Xt6GqnHm1hgpDrMvg7Gp6ShUMsm5IRYq/se0g3/JQQCOwjG63EhIc7KJ
	dq7xlrKynUOelmRTrtjZtkX/PFNiu8Ofm8/ROVM2y5Zy/kgWQggw4F3KFgklaR0pEz2mJVLQzdLGZ
	NgRrVtJd0YJaYkJAZMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXnM-00CB0I-0v
	for ath12k@archiver.kernel.org;
	Thu, 18 May 2023 07:11:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXnI-00CAzQ-2T
	for ath12k@lists.infradead.org;
	Thu, 18 May 2023 07:11:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I62vdN019512;
	Thu, 18 May 2023 07:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ZinPou2T9xQpwT4erP6BXpnOW1UNrk9U8CX7R1n5reI=;
 b=mANCVbZa9Ij4oaDQl91yFnVL5UdRdECusbXLfrLxnpScKNuGjWU9juIk+zJ2NshRcWU6
 q8ubVjowutMFyv5EeSKrvLVFBLUj7UUq/+GC7oDVidEBj7MQg1XFkxwOnM5kjjfRxJKZ
 VE3OVrimOvmE0DaIiVnvHfh+S9tH5M0mQa7vOdaonXb8Kpmv4za/mIh0JUDwZmf+O6FE
 qiFHpcMedBgYNEtgL0AHkd0b+r621SdyQ/uXiQVcxtDiuJqBTMnDbVLAnLvATIVx/4Pt
 wV1kq0sLlmnUho8F+WLZuvZh2r28VRgk56DoyNe0yMO2jD/1IWevPwVewVifr4E6IrBw Kw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn73urt5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 07:11:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I7B3Hu025817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 07:11:03 GMT
Received: from bselvara-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 18 May 2023 00:11:01 -0700
From: Balamurugan S <quic_bselvara@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>
Subject: [PATCH] wifi: ath12k: Avoid NULL pointer access during management transmit cleanup
Date: Thu, 18 May 2023 12:40:46 +0530
Message-ID: <20230518071046.14337-1-quic_bselvara@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2uPINWCWc_PtHNwxU9zDlijqKTDYyrte
X-Proofpoint-GUID: 2uPINWCWc_PtHNwxU9zDlijqKTDYyrte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_05,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=818 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_001124_940325_ABFC769E 
X-CRM114-Status: GOOD (  12.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently 'ar' reference is not added in skb_cb.
Though this is generally not used during transmit completion
callbacks, on interface removal the remaining idr cleanup callback
uses the ar pointer from skb_cb from management txmgmt_idr. Hence fill them
during transmit call for proper usage to avoid NULL pointer dereference.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d814d74bc168..a344211f5b53 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4443,6 +4443,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_vif *arvif,
 	int buf_id;
 	int ret;
 
+	ATH12K_SKB_CB(skb)->ar = ar;
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH12K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);

base-commit: 610b78b97bad8f3e77c27a15e9a03cbbb4109697
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
