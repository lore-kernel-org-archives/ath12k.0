Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB630CA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=; b=G2V0hM0QIjC8YboqWtrKO/yL+E
	BP5us2ZZzfUKlYqEXpKwZ5uM8pzVri7O1w7mbn0eaxioQBZQYJlLDoWz9AuGh7g4cS9ejOkUXVy3Y
	MJV4/Y2LeBDWkU4K1Xpt8NUev9kRW+U7VZZfEOcTRcFwvDZLK4fY5eZ4CRdfF9Tt3MMFvmFDU4Jwr
	RkQy7tDoFOYCUkyS82Z+pnI1xCD7WkNpSEcFkgCQQmSSCYMzgzWl1IqVWsdmhUXYRgAqa4cA2YjdT
	uY0Z2cVOHkvUUjIuYyOVC4+rD2nl4LCjGqtfcMP95eTLv+b0nRAUiLAciLRsY7vHd/nyNnjzFVfO5
	zzt5hjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJV-000000046xO-25T6;
	Thu, 08 Oct 2026 10:25:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJT-000000046vI-1w4F
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=; b=Dp0eDcJz4iZr+EGFObSNO09mkZ
	Q7vnxkPbdLLxwWg3yiqYCrR1THHzqFC9Fh/n1orpD7F83+J3VL2+BMvh7Meoug2zySKMiMQ16hf0H
	7XBthe0+o8/qq9eNIpsdJ32Ke3oaqzrn1sLnOFiMEZNtMiMONM4sPZgz2wg9kR1HAm4vRkCQdAkvb
	XxuvLHo3z/4EVopomiEzeIDH6vTrhIPdIs6rwWbeM5/18XrA2jnmz+p4rQvaBSDJN7akV6ZTYRrXE
	DMILmgtPzSCmpxA0jdaLEHl4g+PDBC3Mh+jNvEu79nDY1wnlrHsuNg+NkmfHZpPdlWA2iLo8E6CdI
	0aRKQmEw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJP-0000000AHrP-1a3e
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K97v2560095
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=; b=VqqNyFXN1L7IKuJ2
	z8zc5sue5Gos/U6fGcNuwIfIBOIDAyNnNUcJdxHkr4UcYWFzXSeBbQR8EOoKCtQm
	G25jQviSLzuHCHkNvfHl04IxFnzxsvSMP18zDwt9hXX7UJ6UsJz0XxIham7PnOte
	awyTOwGc5V8p6c1sBHcUvZB+wUIemNRbu6QuKLQkFKCyoYzTIm3qhROn4rLKQXbF
	YGbVDqnlpEc8PLczRpWOgsUmXt4FIh9t9xzlxa0bMaH/A/Kvx5EuRse3bXJ/UgOF
	XXD1qxCW3WQ+Kw2Q7zICxx4fkY14E0ifXJJxVrz6i5CLO8D3khnCyRKwBU8x2bQS
	furcyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82cwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:25:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df5a65671eso7204525ad.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455116; x=1792059916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=;
        b=LJtzjJg2YX2XXJt1QCeNCKSZ+wvplzN+qKElUrNcOZ5U9/Ujwtqgjt/ydWMrtAHmSz
         cPB3ZVoBTDuAVIERhityEEj95dowPKX8SfaC3Vj9MBXldlgxJFY3P+fzISmFnkZhyAWP
         TfUHSJIn6sRgNR/Z5C0NJVusVGjxcUbK2VXMJ8WEDQM/rc2wXaE4pf6II1dqWlqpB/zb
         TQ9+hVTl5hnfMt4D8QnKVSORYE+k6qzOyyIBis2F2wsNhu7irCaww1RoP9Y5WPBpMuYW
         gKqPdZwNdNpL5k2cBiVuWWNenKlfOF7aGUghaHuO7U99u64l6DNKHevP6pou97j9QWNT
         xo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455116; x=1792059916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMm5VSqiHcH9DwnpPnRIkeDas/kbOfg9nUPZTTqULnA=;
        b=jj7WnEl1QpvyOOYMBy3F9w0TeesJYoMKdbrHwFJyEF6xthB3KT2Hx9XBkdcman9ST6
         Gxn4I39lBZBmTYve1SlIf9fRVeOZ6TKHsXquyy1KpEHt9KDx6Sh509Gm2IKaqoHot7I3
         +PrWwZz6+nqUqb3ubT1R/ZtDPmbH3xD+5EU4lMx2abplz1ORr1xKTNl8XXOcZmavv8kX
         EdgzQCLo6VadtJowIXsp14z8R2fi1S7UkTjk61PZFOgjszl7ooH05f8CCnvBeAQD8ubl
         m3LXpThHOVLGzcb2CEOK2s4vcNgimZjEpwH/UNxyzVQxkBuUVFZ9FDZI4lqcVqlwWBnP
         WXJA==
X-Forwarded-Encrypted: i=1; AKwUvBwCzsgjqdq40hx/UNdrvejkAL47ALeM1kTY0cxFnSg4D2GAXJAy2gOjaYH82DuRLb0TDKG1K7k=@lists.infradead.org
X-Gm-Message-State: AFq9FYL6RPbBorLAjHd/wJ2UUU4MaL0H3mlgjDA8TKJ0f40eX5VoKBKe
	S518B3RiI8l+Ysf9xtJJIHq9lEuULKOA/OhA4uujc6z3JH4n7jRDcem7n8irW5p6mHMEeIIUmmc
	4usX3m4uVwJ8DD6pFaRExwWocNCa7URDpeJTXhQ7M3vsu+9APHTURdrT+GRCR6hcy
X-Gm-Gg: AYBFou1JYWxaXahA+4Lsy+4TUsYvbEzThl+b+IqozF/cIifE/oUlLEodPneoUq04/t+
	tebtWOgm1bnQpGaYke5tBuT5pGs3ZYSX9C3kj+sUslvkZFpDZoN6BAwAFzYNQtqcgclmuu4gMq5
	FkmVWLmuh49rOOcaKE/ZeWb8uj0OhbpM6RH3zd1uXEXNA61gtK8R6IGSkur3j6kz0b1p29EfLSX
	NCPJhBa3QOO35Z6gEsATMHseqp4FoqhN4qMs6HMez1u00K5UC4hduvqMmideiBF5ZEwfRcLPkVP
	37wCZ5O1A1cuqUgQx+x3e75S57CmWlCVmHQ5BTfaX8m8gV+pjfEzBKHbvjNHxlNQsSJTLw/xfaD
	7geOCdgguFZ59iBoF3bvESmaEMQMygA8xstiGOOnN23+l9fbvekeTtDKlmMa74/xf+6iB/nq8Xd
	tWVUr+80mHdvwWkzE3RIfGBg==
X-Received: by 2002:a17:902:ef01:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e7ffe98eabmr15026175ad.41.1791455116350;
        Thu, 08 Oct 2026 03:25:16 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e7ffe98eabmr15025765ad.41.1791455115576;
        Thu, 08 Oct 2026 03:25:15 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:14 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:10 +0530
Subject: [PATCH ath-next 14/17] wifi: ath12k: store and use MSI data per CE
 and DP interrupt group for QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-14-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXxarfhElm+TrX
 kmI2pCdl9zNzpzNkCm2YSIMFXJ21MgZSp9Zw8GsETvemAJqVUpjoqEaIbCfDHwy2PYMQgwgUqSG
 mYpuLrkWcZmrm4/jZ5pSaWx2qjTtAQoSQAb7rTfkaZ328yWcFiWUUqx5NCHC5d240jPeqCeldvb
 X2Duw6hnOdSlwHVvMEINGCcUHS8egiG0ijGBrAKgP6dm2F4kB5kLg+gMjdEb73Fe+IOGrghmGFw
 vuSYsgiE7hI6j22UcoISX7jyGbIpJMVOGUI2njR0Kh8DjCxg2M83aB0KYK266qE4/BIBZobR9E5
 Go+wR/bNXwRnm+5azRpnTgQvq72buOLYqJx6ZqX5OMPmYJx8CfMcPzH9SkuFauQsnwCFu2ztONf
 G+8QeHB3ubfcTHDv+Mw8oVHJXMEuTU5riVuR5qQwPPCQRA6fltYV4ulRqI8CRUYiaK3cB8KPuFI
 ttq72vvIeEHLb73vIwA==
X-Proofpoint-GUID: qPwHG8BswZrFl-NMyEZNIowveM1kUtbA
X-Proofpoint-ORIG-GUID: qPwHG8BswZrFl-NMyEZNIowveM1kUtbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX4v2WXApFBEkt
 mq+SyZi6dZJ4tnjFrlSybHGijGUMH3/OMTJsgbcJarjrs6j29svKe+ruo6OXKmi1R5tinf4fGOs
 4JbKGflCXw0oPOXrV6phllaCGPuSUAM=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac76f8d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112520_136706_99D8648E 
X-CRM114-Status: GOOD (  14.49  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Store MSI data values for each interrupt vector during configuration
and use them for ring setup on hybrid devices. Hybrid devices require
explicit MSI data values rather than calculated offsets.

Add ce_msi_data and dp_msi_data arrays to store values captured from
MSI descriptors. Use stored values for ring configuration on QCN6432,
ensuring hardware uses exact platform MSI allocated values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c   | 7 ++++++-
 drivers/net/wireless/ath/ath12k/core.h | 2 ++
 drivers/net/wireless/ath/ath12k/dp.c   | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pcic.c | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c99e915e3885..cc8ed8451a2f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -270,7 +270,12 @@ static void ath12k_ce_srng_msi_ring_params_setup(struct ath12k_base *ab, u32 ce_
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.ce_msi_data[ce_id];
+	else
+		ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bbbde9f05ea9..575139555dd7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1172,6 +1172,8 @@ struct ath12k_base {
 		u32 ep_base_data;
 		u32 addr_lo;
 		u32 addr_hi;
+		u32 ce_msi_data[CE_COUNT_MAX];
+		u32 dp_msi_data[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6cf254b2d2a7..0f0800388935 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -225,8 +225,13 @@ static void ath12k_dp_srng_msi_setup(struct ath12k_base *ab,
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_group_number % msi_data_count)
-		+ msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.dp_msi_data[msi_group_number];
+	else
+		ring_params->msi_data = (msi_group_number % msi_data_count)
+			+ msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index 06178b4f20d1..9fa727115f8d 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -274,6 +274,7 @@ static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
 			}
 
 			ab->irq_num[irq_idx] = desc->irq;
+			ab->msi.dp_msi_data[i] = desc->msg.data;
 			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
 
@@ -317,6 +318,7 @@ static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 		}
 
 		ab->irq_num[irq_idx] = desc->irq;
+		ab->msi.ce_msi_data[i] = desc->msg.data;
 		ath12k_pcic_ce_irq_disable(ab, i);
 		vec_idx = (vec_idx + 1) % num_msi;
 

-- 
2.34.1


