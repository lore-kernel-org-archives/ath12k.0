Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D17C5B564
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oev5EbRAy5unWgbJ30/92HLLL5x9+VTDf2AFl1ZoLOs=; b=fQAlb2rbh2LdWP
	/6ERIcPp6WASa4PEaA8yZXjaRb0YfpFyY5XjqHp1EsqyH1CkFrWiI1cLFaDeDl1GQvh/STBUtt2/k
	+4FkgfXipdqGdZ4TwiHaNjwhdLhRR1brhc/11pagTQG18rcyHBWPmep83KDnJA4CAlTv2ZEJlO2CZ
	tIO7dCdosN1lLyM9v+OhznlSPHqzqPFJYf3+CA6i0uzJTO8jQxzGMRE6r0Jn1CUEt/0wShZhdmbPo
	YVhm5lWiySNQ6HoSz5NfeXog0XXXXXrTUXuXFiQDpGvVJNxI4w4Vhnekj6cTM5bnsavqPyInIPWkj
	t+llvGoDSM3OX6pYmrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51KC-00Bkfp-1K
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 10:16:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51K4-00Bkcm-2s
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 10:16:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKAG8Ig028325;
	Mon, 20 Nov 2023 10:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=OZjsgw8SYxGJtJji937J6xR5BP2x6ahypt4nDX8i44Y=;
 b=MLj5LiR1DuIwXgDHiNdcPjzZ9fiQxBKWJVB8WBP022+W5g2bF1zMKDXGsTatJe3OaU4v
 zy8/eGtuHvqZEEoRM+8S++FgBqs1ck2UydT1M7ZcdR+bi7MMmzy9b6Kvdv6/WWFCq38C
 +PRdwd8W3foOQ59KybCmo5hLD9T9TFTgBlmaBpx2wXwrC5LNB1+lHc4Oxu0uCGFYJJ6W
 qLDLcFu69D9HvzuOMy8ShtdfA6NUGzqV5SFHLNGBmKYqBG+/swgH6e/qYiK/vVr63NQ7
 v0BcdFnFvAKZt3Mt3Y93wfXKpabsxHVv41l/gCYq97lxye3s62lHK11ADdMune3sZzpM bQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug26trh4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:08 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKAG7dt019758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:07 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 02:16:05 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 6/7] wifi: ath12k: do not restore ASPM in case of single MSI vector
Date: Mon, 20 Nov 2023 18:15:42 +0800
Message-ID: <20231120101543.4369-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120101543.4369-1-quic_kangyang@quicinc.com>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gTqnVcNcOPHQKGV4dKRBr2VOZogjJrpp
X-Proofpoint-GUID: gTqnVcNcOPHQKGV4dKRBr2VOZogjJrpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_07,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=825 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_021609_042454_8646F7E1 
X-CRM114-Status: GOOD (  15.63  )
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

Current code enables ASPM by default, it allows MHI to enter M2 state.
In case of one MSI vector, system hang is observed if ath12k does MHI
register reading in this state.

The workaround here is to prevent MHI from entering M2 state, this can
be done by disabling ASPM if only one MSI vector is used. When using 32
vectors ASPM is enabled as before.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4484bac18f4e..3850331438de 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1094,7 +1094,10 @@ int ath12k_pci_start(struct ath12k_base *ab)
 
 	set_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
-	ath12k_pci_aspm_restore(ab_pci);
+	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		ath12k_pci_aspm_restore(ab_pci);
+	else
+		ath12k_info(ab, "leaving PCI ASPM disabled to avoid MHI M2 problems\n");
 
 	ath12k_pci_ce_irqs_enable(ab);
 	ath12k_ce_rx_post_buf(ab);
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
