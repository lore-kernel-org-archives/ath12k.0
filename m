Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E80C54E76
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtTdyQXGZ4y1FkwEsBgn9klKvLm+zkI5tYUeT7yLTy8=; b=H4vr9vuhgqCTZv
	NqaN9Dt+jM0p33cQ9zfjh6u5NFnTPqGumk3XoBN1sSJayHE8WX5+ebpNCJYTs74wF+O/j1HOn1818
	k0gAaH3KRHL8RVPHw4EaiHujUL/jcMuLqtM8HjpcDhiWYq5/bHQsF+Hdbxmad+TkDKhHjbMLzaqrl
	VjrlgBzwjELaXsK74r5Dpg5MJ9vVqIGbJPZwt37gTY1TrQwVrjwiIGtG5D811FXK1Q2JHiBE84/SN
	UJQIAHtINGvPxcP5NTP5ZkdriuWJr0TI0tL8jTR6sOeolTs2n3u5EQfWEGApBm46bNr0W7YDLKZ//
	63K6pNF0m9CnRkyyzlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51K6-00BkdO-2p
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 10:16:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51Jy-00Bkb1-0W
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 10:16:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK4txZC031861;
	Mon, 20 Nov 2023 10:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=LlzzVY+H2eDLFJ0u7BTyMgXFnPHboxmbKfaczKcZOBI=;
 b=SVrD0gbNnipebrH8GX9joN5yQJEj+n2C5eZ4hTHKRskT9PnQMAmiFMr9n+eRWozG4lvk
 aN4SWTd50nH6hH4nus07cNYQZmrA5igktN4dXLyNAU1vxvT1/3nerPJyYqAqosXhr3wR
 FV/7cdWMJhGDbsVVZVk+rmYqcTzYWNsbCIC6bkJl5aV4sUwu+LM5iVsySCh5P5XYQcYN
 mO4hzClezWrg9GDMihKVC4gMza4mienCx4lJr/Obx0KZYbheeYJCL6wj8xp1BUVFsBbS
 1xlsE3ZiHCnoGhFLuhLpQG5Hs0AeBn2A3sXh8dxxActNSHTLV/GR2F2MAJ2uPFIK94VL Rg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uem80kqrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:00 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKAG0aP019598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:00 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 02:15:58 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 1/7] wifi: ath12k: get msi_data again after request_irq is called
Date: Mon, 20 Nov 2023 18:15:37 +0800
Message-ID: <20231120101543.4369-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120101543.4369-1-quic_kangyang@quicinc.com>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GqYIuQ6PdIrKtw7qUNZVwfQraX_8Aa8O
X-Proofpoint-ORIG-GUID: GqYIuQ6PdIrKtw7qUNZVwfQraX_8Aa8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_07,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=937
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_021602_303886_25A54635 
X-CRM114-Status: GOOD (  19.96  )
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

The reservation mode of interrupts in kernel assigns a dummy vector
when the interrupt is allocated and assigns a real vector when the
request_irq is called. The reservation mode helps to ease vector
pressure when devices with a large amount of queues/interrupts are
initialized, but only a minimal subset of those queues/interrupts
is actually used.

So on reservation mode, the msi_data may change after request_irq is
called, then it will lead to spurious interrupt. But when VT-d in
BIOS is enabled and ath12k can get 32 MSI vectors, ath12k always get
the same msi_data before and after request_irq.

So in case of one MSI vector, ath12k need read msi_data again after
request_irq is called, and then the correct msi_data is programmed
into WCN7850 hardware components.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 3006cd3fbe11..c5bc9afaa9fc 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -708,6 +708,25 @@ static void ath12k_pci_msi_free(struct ath12k_pci *ab_pci)
 	pci_free_irq_vectors(ab_pci->pdev);
 }
 
+static int ath12k_pci_config_msi_data(struct ath12k_pci *ab_pci)
+{
+	struct msi_desc *msi_desc;
+
+	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
+	if (!msi_desc) {
+		ath12k_err(ab_pci->ab, "msi_desc is NULL!\n");
+		pci_free_irq_vectors(ab_pci->pdev);
+		return -EINVAL;
+	}
+
+	ab_pci->msi_ep_base_data = msi_desc->msg.data;
+
+	ath12k_dbg(ab_pci->ab, ATH12K_DBG_PCI, "pci after request_irq msi_ep_base_data %d\n",
+		   ab_pci->msi_ep_base_data);
+
+	return 0;
+}
+
 static int ath12k_pci_claim(struct ath12k_pci *ab_pci, struct pci_dev *pdev)
 {
 	struct ath12k_base *ab = ab_pci->ab;
@@ -1286,6 +1305,17 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 		goto err_ce_free;
 	}
 
+	/* kernel may allocate a dummy vector before request_irq and
+	 * then allocate a real vector when request_irq is called.
+	 * So get msi_data here again to avoid spurious interrupt
+	 * as msi_data will configured to srngs.
+	 */
+	ret = ath12k_pci_config_msi_data(ab_pci);
+	if (ret) {
+		ath12k_err(ab, "failed to config msi_data: %d\n", ret);
+		goto err_free_irq;
+	}
+
 	ret = ath12k_core_init(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to init core: %d\n", ret);
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
