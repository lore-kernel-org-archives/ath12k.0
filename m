Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E39ACC6B01
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=; b=cxRXm3kdNn3/BE7vCT9APY4ne3
	m9UvTjxwSzodlswzKvz4mQfzXDCokPNEOKcEa6pgJmCVWw/TVBbxoOWCnaN2pF9t4extBG/Sthn1A
	JxqVBboZJ2dt8F+yVghPxfSe8epyHq+iw6bwjAfJxy15AlRrP3fbYEYYjhm7d0tfR61F1NUm7pNQa
	XTygGjbu/58vuDmnyoq6+RKsKmr+npdwhAg6f1Dr4NHlxzlXD7Rp776kEnTWRzxPQzUQMwRYuKy+/
	PWYPKcXTBD9ZXrqHrFV17WCMV5oB8+6qjUErYYgYZar7KNZYhFuGYPxI6HgSmFrxDox1PIAIFE8ZY
	rNGWHpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898i-0000000Ggnv-0Tcv;
	Thu, 02 Apr 2026 03:54:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898f-0000000GgmA-0yrA
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4MIs3044386
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=; b=HpI6Sl/AfkDqHLSc
	SN9Lc1JmcsgfQnTPAMlPnEzHZX9pD13HbBwrgFh1lebVOSgCoicnOq95v5UUBwH1
	4uWZBDxi9D8T5jmJhuGIKake3K10Imk98LekdG8eumoeoEn1JfrDTY2wzlzLdsdB
	U6PbZ5dKGTtN0G0J/iviezwCqZo3BIhBM4V25KmyQpMHxavAvwT3GXIaSXQ5fPMd
	Qov8E/nyHVm38M5fENYNS71W/da4BtEPNTUIlOqCVq3a2cAMngAFh9OA8I+cesxS
	eCJSPK/fGjyJWzkC38EUEQFgpPXVdL8h0oL0C4z7CEw6kNi98EnxGUKj436UND/3
	oawDKg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483tufu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso236299b3a.1
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102076; x=1775706876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=JIIMyMcTQP8uTkGeZMqZ4/1um7Cc4JJgZW98bOY1PB1Id+h8IBYWhbm1nUsxaA/Pps
         WHRTugDboxt3LqY/klNpPRnFmPjbN8zVPG1hCi9/TqNQk982Li2up3JKZYGt2i4MFnIS
         Xtle0Oki3ouxvTvW5B95dzs7kpX02os6WqwQ45Km8gvdwGYuQ1bEfhJQyTizdhtetYaS
         Ge900o+pK5QXtgL4vqgYAG6WO4Tth8fSQXM7NGaWWaLcOl7kgCPTS8sL7UGkPwQln/pW
         jID5elTfn8yiFLlSPUHIvB8Bf5Tfwmzjfvh9n4bIy2xxCQsPW7IpNWtMiNfFfbXTgA3w
         Ph8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102076; x=1775706876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=COr99qcJt5vzsJb1eMODl2tHhHhD3nLln048xTbvv00z/LsW/cp0hC6sgS9ctQNNnu
         r5SuTSUbjoDE808g1ZxijN+2lALkipzJ3UuXkeIid2MFWJEri4lz8f1s47wEwInSTGkU
         OplM+jfsHZSHjO538hdlpJC/BGxBtXeBdtZxLOYzlwccUhcUa0qSEAxUKH4Eo+HoJe93
         I813/6jozbY6OBCCfe0f98iyL7O4lRANPoNAYj+IOD2NYJsBwam8JP8nqQsczps7/anP
         /1CWvuqFSfM7CNAbYSprihWCzEGBsIzP87Kn3b1x23ph/i0hKnn5gh/8HjOPjyEiBNnu
         6xVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP803jhAhgcss8PaYWcejY0Is0yUwkrlyDdny/utnylmmKXf0yMK6KrssSmtb3fxPOlJMCQkU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq+EsnJASibkRWFNrdzypQsrNkAwuvSY+MSyd7tHo44BAylsiZ
	guW2PT5Iyr4Hg+ZlkkLaNt+Z7txj5aRaQ86PoQdcp8/qxZ69lBYEyBfzdDTYskIFT/+7i4bKIyw
	d6one/q+IHdcxGCIX2/Hvl7ZnNzaqAn1spIa5sP79VRnzDC2+LV/L8ev55hfLA8UeeBfqOLsm
X-Gm-Gg: ATEYQzwA2qTAHk8fZlj3S8qspZGFxNWWd2TIH0a9AxJPvUECNkH057mu05UlhvtGq4N
	GMoPBkk19gJdBhQmuRE9RnieVVlW49aXIylmM0J/BRDNkapU1toKkdYDuq+NEHCSwEz2njR+usk
	N2pDi+oLFZiYEOHg3jkYi7hDcbrk8UY09oAYAQuVpYeUSFbKHngbHaTo9Bt9x1ea0c98hZlF9rC
	2ed0IdHcLHXCrNlw1CNmhQEvmP1DMp9kpWEDIpborQfmtuRA98f7P+rvz1JstrvWdLBzGIfxYwZ
	TOLS8jqBTlXdyKw2nPRL3zHV8dWqZjoMIybGXj/lHFgrmnTsEJA5KfGQtET5zkaDM7cIEr6/3g1
	5v0+w0fiVPxQDEjPnlfZ+1cFRUQ9l9pCZ3/JP8ip++SQ5KOM/8ahV2wDNMdYCdS3iN5TMKwCZbE
	1W6EmOcqmsBoPyGqpV+UBBMiptxCBrg6yvcQ4i7eE=
X-Received: by 2002:a05:6a00:3d08:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82ce88ea07emr6644291b3a.1.1775102075877;
        Wed, 01 Apr 2026 20:54:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d08:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82ce88ea07emr6644257b3a.1.1775102075286;
        Wed, 01 Apr 2026 20:54:35 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:34 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:03 +0530
Subject: [PATCH ath-next v4 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-5-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cde87c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LDmrCAwXcT0UWmoAFo4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfXyAfkNuLEegAd
 80BjIf1Q1XJYZCnrw3UD4eBs+AX2YWsRqWhB8m6+TiUPf26yZ7wQZWcx01zQIspugWX/jVLdLU/
 mGfwzhG1k5OLDYZSjZKRus6tUADZI6XMZw1/NC8eILK6qeMkpbWZns0JqSjCRAII3M21Opp9QT2
 S3ff/lGz49quoRFy5iOZHk48klzZShILzNMUOwHPUI1ziVNRp3a/JhKQYsFrE+ZBu0PxD6taefY
 G1HIzpfO42QeExF1PBA4+V0q4T8Mf0cRYOKkD0BN2yu04XWQiVvarQNZ6pngTayWQhIMOurR5E/
 HnmmFAff8c+hq/LqEqWCmH+9FIXNR7r74OVE00nk3tvIm73sWPKGbRXFsVaX5jgLB2jraFsZaB5
 o+47RLJm7vUmfqy6ZIGMhEKlntQaKWsSV0VMX97dOMWNmjYYvwQ4YfStHuoqANkcv2MafXe+Hp9
 //df2GiSVcnD8NFlPtQ==
X-Proofpoint-ORIG-GUID: JaY4JUwj7ME3HfeqsJpCev8rByAD41gk
X-Proofpoint-GUID: JaY4JUwj7ME3HfeqsJpCev8rByAD41gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205437_314923_63F69B6B 
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

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add CE remap hardware parameters for Ath12k AHB device IPQ5424.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.h       | 13 +++++++++----
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 22 +++++++++++++++++-----
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index df4f2a4f8480..009cddf2d68d 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -38,10 +38,15 @@
 #define PIPEDIR_INOUT		3 /* bidirectional */
 #define PIPEDIR_INOUT_H2H	4 /* bidirectional, host to host */
 
-/* CE address/mask */
-#define CE_HOST_IE_ADDRESS	0x75804C
-#define CE_HOST_IE_2_ADDRESS	0x758050
-#define CE_HOST_IE_3_ADDRESS	CE_HOST_IE_ADDRESS
+/* IPQ5332 CE address/mask */
+#define CE_HOST_IPQ5332_IE_ADDRESS	0x75804C
+#define CE_HOST_IPQ5332_IE_2_ADDRESS	0x758050
+#define CE_HOST_IPQ5332_IE_3_ADDRESS	CE_HOST_IPQ5332_IE_ADDRESS
+
+/* IPQ5424 CE address/mask */
+#define CE_HOST_IPQ5424_IE_ADDRESS	0x21804C
+#define CE_HOST_IPQ5424_IE_2_ADDRESS	0x218050
+#define CE_HOST_IPQ5424_IE_3_ADDRESS	CE_HOST_IPQ5424_IE_ADDRESS
 
 #define CE_HOST_IE_3_SHIFT	0xC
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 9b9ca06a9f45..a2c98cc1e348 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -329,9 +329,15 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 };
 
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
-	.ie1_reg_addr = CE_HOST_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
-	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
-	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IPQ5332_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+};
+
+static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5424 = {
+	.ie1_reg_addr = CE_HOST_IPQ5424_IE_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IPQ5424_IE_2_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IPQ5424_IE_3_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
 static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
@@ -340,6 +346,12 @@ static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
 	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
 };
 
+static const struct ce_remap ath12k_wifi7_ce_remap_ipq5424 = {
+	.base = HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.size = HAL_IPQ5424_CE_SIZE,
+	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
+};
+
 static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 	{
 		.name = "qcn9274 hw1.0",
@@ -822,8 +834,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.iova_mask = 0,
 		.supports_aspm = false,
 
-		.ce_ie_addr = NULL,
-		.ce_remap = NULL,
+		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5424,
+		.ce_remap = &ath12k_wifi7_ce_remap_ipq5424,
 		.bdf_addr_offset = 0x940000,
 
 		.dp_primary_link_only = true,

-- 
2.34.1


