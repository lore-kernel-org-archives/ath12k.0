Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06583CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=m9rfMiUTZSGxIDm59vph5OqpV2
	wGy5rmh1z+lBUKJ9rovL5EYFAUYajMrbRcryVCynrp9ap0HJBrpiYujocDnWCDIgZlos764X4qlYu
	R1xYS05Ap+yJ0S6nWndNvYm3FUaaUnQjYErf6zj7KaujbQDLAmai6i+LePiUk1AnRkmPJgp1SxD17
	ColwNJ8S/3LopOiMLkzoNw8iyhg7fbHMwT7KPTtaxaxICpoHIBmiICoDlSEBDm7z1tRIDk0Ianlht
	yBMxs6hYoMzuYprG0cwWTPl5apyAE2wsZZmRvjZBEy9owzhFjcv5jeUI9LsZ5LuhQvRvGlhZ19C3W
	pqzHem3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIk-000000046IO-2mXr;
	Thu, 08 Oct 2026 10:24:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIi-000000046FV-0PvD
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KeWW2686733
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=f0Djo/nkhyfeWena
	rN5ES7SAAvtM/VPbN84CbdMbXue6gNseTXuNM8fs7fFU2rFdHqy1guvJaI0amlE8
	QwEvWpF/kDmkoXMjJOO20afiR7J/bs9RFeSX6e1sotIkIpSjLFktiIa+FIqYpaWH
	ISrrIdNhsAWhZZykASnAd4pFu2oAHPFxYPKqvLRQw368Q16q1U+LCP2sDQGTJSIf
	r0wEpNtEmYRFS0ZJRF641Wsenfu3Caigq/MsLvFFRk1Ro74gDpNUl9v+x1AH3E2O
	2GeGsj9ChpI7JGjh6T8ZKwk96rq0HcUvs6gEDtOHdHDX7BYZPQ0sj95EAZjbWiFi
	ACKbvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42f5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e80f7acc67so4646685ad.2
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455074; x=1792059874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=fL0VtyA7VmJRMb3ypl0uS0BCcBXyBLjBzGHCD9/bknoNZVokoDsUA97YPWAHbWEwn7
         rZup8nj/GBW9uJosLybSRGBGDakksf6ClAHGCfUe3Z+snX5Cqu0/qQ21RTPnbdGcd1U+
         a5Wd5y5hrPGj6454kxt3KbolJQTCUAywUkRtXaaDcwrVCmMRrEDzf4pH3LlHx8gCXwd2
         QpPP454/zRX6d58tvYo8W5R2bKirUvoco1mefL3vR/OwuIKwcp1Ox8NpQz5OnSMQ+/50
         wQGfa/4W1FJeEBTognpxVAU3IMnzTvvinfulZrMskejAyfcpO+3nyj92pg20iC9CIzbD
         kY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455074; x=1792059874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=V8HPUT//B99flVy0KUGO+IuyiShNkIdl2Q2nKl2vd/Kfv6jaspmZZYqXc3ZPTdXk9V
         v8P1BpZI+BAG1/pRSmOJD2aKQq3uugscFWwd6l7Zr1qAs1S+vXinOnA9nrjdufDrpkrs
         cLY3O2UnHY978l3qoWF+MUIR9LJMYdM7xQEWBfAHZMAxIZd9HpzYcsu9NMJiQUTEXsBy
         FZOfAiKM4S5tOMCIAkZ58lMX7N/AwF9AtejQeqPWPHqKy8cc/VS8yB5i25A28IfYHj/3
         3hQr8cWPbUsCa2t3ZqhK45QQumQw3fmLwNmWdp7/Kvf7tan/DvV0VaULodqAjGLt48HT
         fQHg==
X-Forwarded-Encrypted: i=1; AKwUvByd+pu+1BFsd+VxgaHjK5UsoJAbdaF5hGC83aKIPpuTbCPUXZfUQ6ZVpfD6+1hSHMApM/vgU+A=@lists.infradead.org
X-Gm-Message-State: AFq9FYKS48ZvdmzfUHQgom+o56uismlYZLbJpxvGKw2YrckW6CwgOXyr
	zfn6AfjJ1YUPNHsMk2T2aAct/rZJ+tYgHIRvui/mXwTXItD2wtbiwjkWbA1JIYzSOrbcYgBOhzt
	VQFMpFy3b78t2UZD2VC+oPVouNUKrRExYHzKy8PbKJVHWBIDmP9658ot63mRFbb83
X-Gm-Gg: AYBFou0mb8R6Data7Wu05wD9+PPbK5ImFx8oQD53JzO5eig4LPUWSCJEt26Qfr+K2Qd
	Wkb8K4VTFZhuYuvPu+oxeddEpajFz+uFYKBo4/VQm3rr3cWudkA3qt7UulU6GhuFhYA0BnIYxu1
	KhCVXLIQRMZcgq+zMhBTxtKKExiW3TSSmzJuS3fo3k54wZpMJdwi6r/AiAW1a037Qt2FMKTdCZM
	Wlxu14NXPpJ9hv2hwuU7Zs3/V7Sd1woWUq/hoqUV0IF0nfbYsltdJ9lQ6fHbV6ut9KLaIoOcDz4
	9SvfNw1PDXXxDTqwtmXlOrFo/am7JMIkgVk5aJxrT5JRAptu1s0SYAu4kslb3O1yEODJdP1Jzn6
	swm9CUaWWi2mAYJk8kK0+2C0zQzCuGSAD0p3HENjsN/p34kTU7wBXhoYS1GAyPIe3qAdXYledIR
	dEHIK7cI/IVVcS/g7lkQ6sww==
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr33978135ad.74.1791455073925;
        Thu, 08 Oct 2026 03:24:33 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr33977965ad.74.1791455073445;
        Thu, 08 Oct 2026 03:24:33 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:32 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:02 +0530
Subject: [PATCH ath-next 06/17] wifi: ath12k: move multi MSI vector flag to
 ath12k_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-6-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: lMbPs52cistFhpqv1y68OkYY9btHAYGP
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac76f63 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jN1JcmgayTw_7mYEAw8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX2v/KyOrqaSRs
 JgqTfpS2PsEHOceHNqXrTRWEh9zbHj+3/6i5TUNtMY9b3BSewWO4ascDEH0oPRyEbnKW+hkpp3C
 Vdj2FADqPhxRHWoKDE28hC7BLG04nVs=
X-Proofpoint-ORIG-GUID: lMbPs52cistFhpqv1y68OkYY9btHAYGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXwMkcFwT7fb4j
 yTsQeMRdHXFifOSbpUudJcPgxeerBHAvBmpElTQQX1nXUTLaZ1FlGf3FfndMt6PYS7G+nL4Nz1f
 HazKzRVIL3tJ3fYaCY+usMrisxHLafZ6EOgL7JsnvRP+mFpYgNAsRe5EyxKgYKUE+HhfFW/DS+X
 DNJiqURhxkeMb7hslq2aNS7Hd9epAGVEhP5GrzyzUYmWoFB9yyBay/DKBKaBPnL90t8pxteZX8j
 Krw3YzVZPoCwKJVt1N/Zjsb3/7gdo7bMRKsS0gWljG4+yMQeN+33R3Qkua4PhKekexX8Ltxc+6M
 tRSN1YFl1TEMN4qKMY9QSdFcNKbbnJNCtaF+I3ynN4ORviJ+mOxTlqxsMtZJOUs5N031f4WYirS
 iEPN/2IRTLPsmPqtfkEcdRNuL7fYKjwvDzdjpwOrY1NIvXaaeIciQLHXy6ahgduIuIs75qz2AOw
 2nXu/nrqkYGMLodsrQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_032436_272486_783F27BD 
X-CRM114-Status: GOOD (  18.90  )
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

QCN6432 uses MSI vectors, but although it is a PCIe device, it is
attached to the WCSS Q6 processor and registered as an AHB platform
device. As a result, it does not have a valid ab_pci context while
still reusing PCI IRQ APIs.

Move ATH12K_PCI_FLAG_MULTI_MSI_VECTORS from ath12k_pci_flags to
ath12k_dev_flags so it can be used without relying on PCI-specific context.
Rename it to ATH12K_FLAG_MULTI_MSI_VECTORS accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/pci.c  | 22 ++++++++++------------
 drivers/net/wireless/ath/ath12k/pci.h  |  1 -
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d87c59f68c12..eaea601ab32d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -278,6 +278,7 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 	ATH12K_FLAG_FTM_SEGMENTED,
 	ATH12K_FLAG_FIXED_MEM_REGION,
+	ATH12K_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath12k_tx_conf {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..56e697fbdad5 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -86,7 +86,7 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 
 	msi_data = base_vector;
 	for (i = 0; i < num_vectors; i++) {
-		if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 			irq[i] = ath12k_pci_get_msi_irq(ab->dev,
 							msi_data++);
 		else
@@ -248,7 +248,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		goto free_controller;
 	}
 
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 
 	mhi_ctrl->iova_start = 0;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 736e40492b41..e6fe891e58b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -341,13 +341,12 @@ static void ath12k_pci_free_irq(struct ath12k_base *ab)
 
 static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 irq_idx;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
@@ -356,13 +355,12 @@ static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 
 static void ath12k_pci_ce_irq_disable(struct ath12k_base *ab, u16 ce_id)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 irq_idx;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
@@ -427,13 +425,13 @@ static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 
 static void ath12k_pci_ext_grp_disable(struct ath12k_ext_irq_grp *irq_grp)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(irq_grp->ab);
+	struct ath12k_base *ab = irq_grp->ab;
 	int i;
 
 	/* In case of one MSI vector, we handle irq enable/disable
 	 * in a uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
@@ -462,13 +460,13 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 
 static void ath12k_pci_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(irq_grp->ab);
+	struct ath12k_base *ab = irq_grp->ab;
 	int i;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
@@ -626,7 +624,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
 					    const struct cpumask *m)
 {
-	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab_pci->ab->dev_flags))
 		return 0;
 
 	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
@@ -762,7 +760,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 					    PCI_IRQ_MSI);
 
 	if (num_vectors == msi_config->total_vectors) {
-		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab_pci->irq_flags = IRQF_SHARED;
 	} else {
 		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
@@ -773,7 +771,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 			ret = -EINVAL;
 			goto reset_msi_config;
 		}
-		clear_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		clear_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab->msi.config = &msi_config_one_msi;
 		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 		ath12k_dbg(ab, ATH12K_DBG_PCI, "request MSI one vector\n");
@@ -1152,7 +1150,7 @@ int ath12k_pci_start(struct ath12k_base *ab)
 
 	set_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
-	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		ath12k_pci_aspm_restore(ab_pci);
 	else
 		ath12k_info(ab, "leaving PCI ASPM disabled to avoid MHI M2 problems\n");
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 47c8760536e4..3097afb03432 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -100,7 +100,6 @@ enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
 	ATH12K_PCI_ASPM_RESTORE,
-	ATH12K_PCI_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath12k_pci_ops {

-- 
2.34.1


