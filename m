Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F56EC5AD4C
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 02:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6jGDuXUKrJoF2zwKqP64L/F7NS1L43c4mj+10df0AY=; b=tsy7KXXD507ELA
	euxYmpnp2bV80tA80aSZ4rG8OtZH7S9+xyTiQ1TT848/oRoBYKAekvVMQip0ViMFeJikeLiwun13E
	OI1wddAwac3KdHiZQ/bL9NCkJ4wLmV4AedExGtjU/El+cf1DB9K9hh/c0WDDg75G8ATP6j0Ogoc4O
	FOy0BK/sL+D1NK0WhGJu+xxu3ljawDfKR9Ehxqsc77iKg2WR7KQhHOznlLIXQbbAaNUXZyE9A+16M
	4WnxdDviZewMHB4UlgUsjpqPSCKD7R1U6kg47YW66cqmJ+D4UVB/4O17hisZtps6WKSs9VdSjW6Li
	lAx+rXH2nnn1kd/TyZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5GGq-00FP39-0p
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 02:13:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5GGm-00FP14-0d
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 02:13:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL1ave1001624;
	Tue, 21 Nov 2023 02:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=fx1kAZ617jxBnrFZqsmgdt3HtpyUjiVdspVaUaTLp7g=;
 b=atZjoA5hFTRG+1gdfjaFazsr9MTrS+b+Rftar4p/8biQv8AZMblLyPu2g4mK1BWkVHGl
 TW0Q7mri48t4m7wGdFXDOghnhjuAnS8iPx9vu8sjAE8ZHUOKNtc/FtEnKBIMZI10T9Bz
 wxVLx5l12OzwAA7IcJoWfciygmbe4SE1r3fNCJP+8HLM0futbIlf3q77vBdFiy9H2Ut3
 KkH35c0I/USWWndXYU5jpWVPEGy7nSdRcBdfrHKM+doBjR58wKhEdPkZFbkw/cvuixVv
 /QM1VDdOfqgSa2Hgis3Jrfxm7Hvqg0gI7lZL6brJn1tCFIIa86DPRjwiQteDDiSyExLN Ng== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug34u2br9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:13:43 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL2Dg8Q019749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:13:42 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 18:13:40 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 6/7] wifi: ath12k: do not restore ASPM in case of single MSI vector
Date: Tue, 21 Nov 2023 10:13:02 +0800
Message-ID: <20231121021304.12966-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121021304.12966-1-quic_kangyang@quicinc.com>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ngniVms9u1My8ovaDo3cxKtB_COMsW_H
X-Proofpoint-GUID: ngniVms9u1My8ovaDo3cxKtB_COMsW_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=825 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_181344_352699_CF9148E3 
X-CRM114-Status: GOOD (  16.00  )
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

v2: No change from v1.

---
 drivers/net/wireless/ath/ath12k/pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 44cf7d68232b..1508dd67ed8c 100644
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
