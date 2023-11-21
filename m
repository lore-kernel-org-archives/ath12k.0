Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C36C61D94
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 02:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roN1FdQyVLi5RgxPSEUe6F+pFwUSiOZRciNQ1ZzFNgQ=; b=C/S6UWfTdVOjeT
	MTW1DzjI0uGWL/AHECLAIm91txT43s1NGPuFul1O23BNREQM2WXvTwUPeS3ZlZaANo8G1gRwsiIn3
	ZX8B2F2Px85b5WnLR0ZMxxa8qdBjropJqcFawE5RY9jOdK5RLp+JLGtIPi8nX0/B9mLJM/Q5cOR8Z
	p01STYRNdZT/N+CIQmVQlpPEJySCAuo64w5XjcQdU+4ybNWowZPLui++I/nH9STYRBu5QiGMsOK3u
	Z4S3LRMJiLot89+id67L4ojyFw55b1/uxF2G+gZI+TcZ8o3Jal7nQLtpNEphEzwcLu39SWcGBDewQ
	1RS34g8NiG3Phdt1lyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5GGr-00FP4A-1V
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 02:13:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5GGq-00FP32-2W
	for ath12k@bombadil.infradead.org;
	Tue, 21 Nov 2023 02:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3T3tsbrW2QCOzTzf5sP4r+PMl/ssqlywb08dph4B51U=; b=SxAKXdw8iYXcJJIYy9nybeii6E
	+hH/8ce28UZPPZm0IWo2X7eg9CdMABh5euQgSawOSAQrf+tqUvgdenk2S1I7lI9FT5Cg4GIO0G9iU
	QaYEPNxAFVQOZ7MzpBKv3pWwuDYUFsVipk4sUCuUjXhjntHnCJa4zT/WiqdymBg8YnPoi6ustn6Nv
	ORZHBQAm6VFCMzhqy0QAlzwoxhdfqkMU5GT6pCp9diiySR9lAqwPM8lr5Bqbsnv5Y9VA9RaZA7E6v
	zkq5k8tMpLZuYV6DEQsyNRee6xHyBSg5yThvQDy34VDdxinhKlh4je2RzLVUeS8+pCujapkfwRr7F
	2q5Yt2wA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5GGl-00BEBe-1Q
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 02:13:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL0ocqv010832;
	Tue, 21 Nov 2023 02:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=3T3tsbrW2QCOzTzf5sP4r+PMl/ssqlywb08dph4B51U=;
 b=P2uILgCcLSuh6b60s8QrtUkNE9PJ1Wxqr5ydsjFEbsMga69TLZegFlwJxQQxHS/y7qic
 ww6macmGyeNh3a66P+FmwIet4tsruL+eLFSEPfxMMwzH9IEULxqURbX9/COPaOmLxG8N
 dPExMR/s6BzjpgrjYnt9RqSrPaDbIydiCDoRpoXnVB1J+r3DV4c2aHVyWIguOrXwnEfp
 8f7ijBKoP0M5y4cdTG6V+p9YZCuoWrhnC8L3GmYzgn85H5Ahki9z4QZtwRz5m1+49lV9
 2Yi28/edCCa+rux+zTaWYTVi6qYViPX47yNTS6dmHp86FMA7vWJsBrdmZ7HKBWtpGFB/ sQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugdxmgm2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:13:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL2Dbt0031537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:13:37 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 18:13:36 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 3/7] wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP IRQ
Date: Tue, 21 Nov 2023 10:12:59 +0800
Message-ID: <20231121021304.12966-4-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121021304.12966-1-quic_kangyang@quicinc.com>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: av0r_GpyUKHOJpfaVQS4LXVKn5yRNyyN
X-Proofpoint-ORIG-GUID: av0r_GpyUKHOJpfaVQS4LXVKn5yRNyyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxlogscore=610 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311210013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_021344_185887_7EB65CF5 
X-CRM114-Status: GOOD (  16.69  )
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

Like ATH12K_PCI_IRQ_CE0_OFFSET, define ATH12K_PCI_IRQ_DP_OFFSET for
DP to save the IRQ instead of base_vector from MSI config.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v2: No change from v1.

---
 drivers/net/wireless/ath/ath12k/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 7f984a80fb27..4b872eff087c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -17,7 +17,8 @@
 #define ATH12K_PCI_BAR_NUM		0
 #define ATH12K_PCI_DMA_MASK		32
 
-#define ATH12K_PCI_IRQ_CE0_OFFSET		3
+#define ATH12K_PCI_IRQ_CE0_OFFSET	3
+#define ATH12K_PCI_IRQ_DP_OFFSET	14
 
 #define WINDOW_ENABLE_BIT		0x40000000
 #define WINDOW_REG_ADDRESS		0x310c
@@ -511,9 +512,8 @@ static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
 static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 {
 	int i, j, ret, num_vectors = 0;
-	u32 user_base_data = 0, base_vector = 0, base_idx;
+	u32 user_base_data = 0, base_vector = 0;
 
-	base_idx = ATH12K_PCI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
 	ret = ath12k_pci_get_user_msi_assignment(ab, "DP",
 						 &num_vectors,
 						 &user_base_data,
@@ -542,7 +542,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 		}
 
 		irq_grp->num_irq = num_irq;
-		irq_grp->irqs[0] = base_idx + i;
+		irq_grp->irqs[0] = ATH12K_PCI_IRQ_DP_OFFSET + i;
 
 		for (j = 0; j < irq_grp->num_irq; j++) {
 			int irq_idx = irq_grp->irqs[j];
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
