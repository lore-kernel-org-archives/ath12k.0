Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6422CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=r7b88L+ZnX+tFJ4GDROeu6Rkjx
	fiAyAiwy1sLhtV4+plsSzTJsD53fkLN2rp7Gu/jkRO4isI/o61lfXEyXSnMDkWde0YLra4ICIWlWV
	psk6Kkb3WQ0t3eQudRYvGdBM4Br1kdI1fvqhKSdv9NnDEkljpq+TCgwM2LGmfLpJBUEmydScqobyj
	I0D980I1c8SsVn/EAT4ybRt+I/iHNBvIaZU2jNIHauXTUdCxGKO6QCBeaUzbb/PD1JxSqGFGhmu+g
	y+uGyD7pmtnUWduv8/tnPxqC4cpylDasvcIruyjRgcT+JM8ni2hy24nyCnhsoCCzwFTWqmZ5JWqFI
	5FTm0fIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWZ-00000001pZF-2d7F;
	Fri, 16 Oct 2026 03:22:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWY-00000001pY4-2UIn
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=iNM/dAk0pWutq6ZBV55CndMKRU
	de/AJPgyWC1G5RpgcKM/U+XSKbJMNDooqxNhRTlbvxUbWBzqgll/J6c8EXFIFCIPTedvchNbMINik
	D1dUT3kSGcEgMOt17RNcnm+z7ibDcSHG0eBib1WSJpyVeVkgFYZrP4mmyfbsU6DYayc9TNY93XbnX
	MwIjSs98Q9MTrRqsZc1TwDfi4S2EOj1QVyt1pAkYlljfDXEvMHAQ07yKwPn+NAJ3JFvex+jQjEecv
	yKYWfBbOpFACrkJFNtSwBUqNfjZ7OOcYtkh3VCRpcwkX/uUmFkQx3nj4xOKcM07XvlqkZzOHTj0iw
	jxkhqDpg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYWU-000000012SV-3kGA
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G0G5Zn1596905
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=VKB6X1XweT9cMFtL
	sHMG70ujvghao4/DgRv0Mr3Ywwf2Ijo4P3L0sqrH1YOPWSsqYrKRTuPpT10C5ASW
	4UdshHGeHjXEsOcgnzveWMp14mDPC3vWCU9IJ/ObjKrGDHXtmvv/uMwuNwcei+VF
	6u350vzROcFaMdtj8j4wlQMEvTQXqCbS0f7kSB3Hz9PbkbNJI93R1xGxGtxIBHR5
	0VdR2Yd3iqN93/elwVNhHdmZSu7nWLjC7DDXrMS6HQ54UKxTzTXJr5fN2NR9nUxp
	+tuS7Gn6qtA4YF8rYEhgGjuP/JQ5fnneQEs4A2u6Gy89DZBt5WO70vBTDtxU+TIP
	8L2Niw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2vbjn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so7209632eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120937; x=1792725737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=ThVhYjz0xQkRlHHgta2Uuy4KPNG3ucglzG7rlflBZIKDkzv2dZd4qmKLKC0u6ie1nq
         V77iVSOGM/cbxO6UPvCcs4shDVASwQANTwW+l5UARJh7ndW1FUEHJMLp9mbZuw+bVsGk
         k64zNm2+fXZA/R6yqRIE2UBj7/uA6wmpmbhUYxYJ+4CYC2F+JtBb5Ix3/Zy6ISFLLrLD
         TFtTpnRTrxFe2rpocsDwxGRna18R2civRXtCAUAMIWteQ4VTjdA74YdIQUJ452g/jpBf
         Qqemqa1ZBnBblufa3ox3DheVk+mwtFAY/2IKhQ7AJdh6OjoQ3p3W69IQZ8FguY7Xp/nV
         wS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120937; x=1792725737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=MmxX11NpkGo8cgCiQofEzsUKE0y9Suh7CblPUGmmE/Bk2EcDVrEKz0hh3TZnWYRfJQ
         r4s7JJEVejqrYqY3NsUqE6dplAj0fn7FDRNicFM+S4zdKSligm6xSzBvLt8Y/+VltBAX
         0jyJ1T+R+OksYzyp1EFPwMog2O4GU8DPW+zurPMVIDYqKr5UtTm1WmBzF3s7a15d1nDB
         75vdmkcfFpIgY6VZmlC+bRXkOavGAaSN8y7h+PpPFut0bB+5HpVm6tYDrig6oRSGFjEc
         y54HaL8fnOiSycxOauhvOEYVovnc0v7v9SSYTKq+jPLj3QkM5gpJXgI/hcrYt8gU4Wfu
         I/lA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ0UiYHDfDK2MstlgB+2fWFuTzQ3GtknPhBuLFZQIYNhsLpf4ZnstkZPNAKOer0DlLsltM/Bs=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZk7K23QrIjiVtWhvlVSqlojK3gH16v2xacQDFp+C9bBX2URQU
	nh0sd5lrFbM1uYMU+vRL8NA5CyTF9m0HOGYnoWdjO92w00e8WuQOlN/Udh0iK3G7QqCjxWRnzxI
	aSIIm1sER27wUzZ4V96ibzMidaYv6oLLzd2tSqcfKNF+3rn7SvtzWwk4H+9x/Y0HV
X-Gm-Gg: AYBFou1P2GcjCpRU+QJNUWRO7maHsdZ6xkRbSLI1WOxQlubINJztJCdzPjMIkPmHrsD
	a27mCrHur3QK6l9npAFiyC0JTjfq7QonRAU9nFOlAM9fKQE2nfkSKHXwkapLsKXN0xdt1FZ2qxx
	CQpA/LMhE9ItoMfz4WZ6ccGQlsbXYXjPkfxnpzpRxrRfeAYBDHUlSBvauABaCg9OT1kvrdtwESQ
	Q+siBiU8VHRGHeIHiOGOON2aLrEOfPI6GTAXlnU1lbAixRI3bc54l0u4f3MrvPcmpffuynz/cq/
	FIZsfRxaMgsfaLTzIeu3BmAQ31k8f3DQcAEB67IYmO4ZsTuJ8xrpf+WlC2ULvueVCXqPW1Wtj2W
	WVfnxVcydX+Wj/bVw9tmmz+OFw9Ar3Rxluk2FmUgyk2+c5q+eXCIGfTh4sV8iG8hlch5pVX4TNE
	QZBNve/Y+9QQ0fUeAXe1nr3Q==
X-Received: by 2002:a05:7301:1a04:b0:359:3460:bc1c with SMTP id 5a478bee46e88-3593460bce0mr21201427eec.12.1792120936800;
        Thu, 15 Oct 2026 20:22:16 -0700 (PDT)
X-Received: by 2002:a05:7301:1a04:b0:359:3460:bc1c with SMTP id 5a478bee46e88-3593460bce0mr21201402eec.12.1792120936266;
        Thu, 15 Oct 2026 20:22:16 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:15 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:43 +0530
Subject: [PATCH ath-next v2 06/17] wifi: ath12k: move multi MSI vector flag
 to ath12k_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-6-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxlwHj5oCd1IE
 zA5RFMwkP7gts/PM4DKW9VfuuDWzRxWbenJiUG6CCv2zhncjo/fDf7HvKMjtOUQ+MOFIHXkM78c
 vipRgWQuz7hMADBUvO4cMhN6s5sTkss18ObgXY6gKGAq4AWDkwV0D04elBPlfoq9lZxG+AN9qpV
 O6f+R5SrAhi6NDmW99xNMX8VadZPTqDl/RoH21/qNp5eqU2pOLFbDic/21Ei/aT7enKZbFxSvS4
 rX4xxaQveZ1E78aphiAr7H/5g0Y9Zhw2diwxsJeXgKypdWaNSV7bFr6qEm05Czdpjhw8jLc+RKT
 cWVXuRPGYDAFxieGTNJrflNJh+5fNpw1Q73Cwczt5KRnKdaCZ4TCe56iTkUudjK0t0TJ5/rroc/
 BUSdTbcaEeF84CkAz3sVt2HE0mLJFFRZfR/Js1UTF6wDZAA/V3nTIyt/q2mvhoR9DKKu/Y4kGZl
 sFiiw2o9ACavlzympHg==
X-Proofpoint-ORIG-GUID: TVdcV5EVB99tgafCtswQzTqnfeF4qzHt
X-Proofpoint-GUID: TVdcV5EVB99tgafCtswQzTqnfeF4qzHt
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad19869 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jN1JcmgayTw_7mYEAw8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxLvip37b/3Tf
 gW5XQWhbNXHY7kmaIvCB4UUeY01aL7WtR20WLX6vHsE/tfIhHqTQv1XvwnPUfQWyzlkxfBrapDA
 +ut7G97r9L81b3eQ0OkOQ0hGIvr6Qvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042223_817513_EDC9C11F 
X-CRM114-Status: GOOD (  19.94  )
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


