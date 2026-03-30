Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B918D1061B1F
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=; b=kzbxz7D9VEdu36pZ9L6tejEyNW
	O7pQ4HBr6MKmHp1rhPcF0WsejAazQxzcORSvgc8hDNHoMoeI/phW20iQ7Weq7ZVgieqJclR6ejm1J
	ZH13AH5ETw7Lw8I4tUMqaF/8p3zX9FImbxo0Ju9swhnMcSZAZpXqDHrOzTJGPP39y2RT+iYLlNZzU
	diy4+1Uo5BS/5pW5r2hSSew6lC6J16UaBy3PqAV7xGbNivJbpO1VLbF/w8n7Ttvh/wBdx8u5bWzJa
	FzAJPtGmPWl3whxaB0myWoC+CDnD5Ms5g8uspqrdeJyum6cBVhDGFAO3DEuw3g7mJXhTwk815KYD8
	op0mxpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JPM-0000000Br3Q-1ek5;
	Mon, 30 Mar 2026 20:40:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOb-0000000BqOg-39yM
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 20:39:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFBJAC3722208
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=; b=CdQs4warMj4fzqle
	7RxxRMRzoti1GM2zpsPJRpZxOL5JIRaf47yiN+bm31KwsJrAs+dh9yUWdP4m0SN5
	ca1QS+ve0nf6i6zo1NGEq70J2oMYBi0Qxdtro7FX/zmEdwhv/PItguLbqF0raMuR
	WNX117kpogo853E9rp6hNatmmIPJPuRNI0XK3nzAQQuL3Sl/vMl4ADtrdceWeOWS
	A3NGewZib9839jpW/iCZasiH12Sn6k6TZQ7EF2cXs+Duf/tlJvblizRNuQ54yFko
	d6UaJTK6G/5qsdixUxA0N+MIxMj/PyW9Yd1NS3qBupwfuwV+qvx6+cmQKxS1Uq4d
	gQepVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmtg68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23c909256so37770635ad.0
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903176; x=1775507976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=BGa+PuOfPHuRAUHiC6MzrzrUbPx9vPvnCdY5mbO/3iGZiSO1xfTqwFexKqxn+of3kR
         j+Bw/q/fIkvRDneIGonwmIq9IavXvPRutbs2L3FiqgR3i1AU/TG0xWABUZhUqknjRZKR
         TMlimXIV2uR6zfVTLX4Joem8VKIgxwVQJEkUK98k+C3K+ydBen+QP7KgSdUnLAKyhC77
         5sGjdi2lPvmqY5ZUYgf/UFqbiWd7fhCBNklsQNhqwHpVpwbwigFQp4NhgECdhFvb32Wg
         9F6i5T+dHvFNVHA4uPxr/FLsiNCdTxBHMxZatxuhWXWJrR5NUR2HVGq8nZTc/GeP2a85
         YEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903176; x=1775507976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=o1mqEHCsGtbVDiGwP5y1Y2Lx43BjNcmPCNHaganJPQf72EsmXFC3g09pqL0P9ddRLg
         aJhu8MPGu9QMtkVvjf1oHQesCHjv3rlKTu5lVlriNe4+d8zvv8huiwdh/ITvwzIpj38f
         gu55Laq4yDRL8eSj/KX7tQ5NKooCaiVdLFBgSJ93NJV3m6LqxAztKzB6jPnuMkX8YtnA
         Buzxe1s0PY6k9Ih+vO4FAV6F/JObt8HpU8NXfGGaRUbG/sKaLTLH35DGXrwqp03aswxN
         Yu71gemHJU+rK/QVFmAvXWwXFhHOAvby+QBdoROZJfzAdQp9FxA8kogsoeJXvx9hsImH
         CK/g==
X-Forwarded-Encrypted: i=1; AJvYcCXZHqkFxPE+so2dz3w8VLTNHxcg8FutaDsbPhhvCfgh4zjHBXtURQdbDT1+x0460XMQ7VteAWE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7FBSb13/lKpnip0pfa5u6f5v/+jT0SCVqmSj4CQ8vfVF08oO5
	eAulENFZK53zKaciFQONPVcr+HNZovtghRPeCC2uIcL9q7O666ZEHgN6r8v9D29zc+uiNZd8aNO
	6yrGY3emB00q5D97MwQfdPH1hInWXtNG5FMd/8npa8Y8iIsCgHT21zAXj+gmL8DZ9
X-Gm-Gg: ATEYQzxRDMI90EWR+9i2EX35pM5LCJ/+6VZHyZOBzAsExDo9jOyZ51eEGDU0qDZRZco
	vs34dOe/7+HY06E04v+8Y2HGMvYwY0iPNisAwxe4z79Mgh+V0V+/E/lr0Fy1yiTkW+mSv9scTZI
	X0H3SbOLV4T8H+UUIW5xoTIdvj6bxp+y85Tm6sZGALBIbmWyPPRMJjUu/Mx8f2eiLSluQaZuxVr
	oFeAv/DBT3Yt8cgBwFWXjf9cBgtR1V5yEE1be34pldagVQrx4iIW4ycYvRNdgOHoJiJmLcTS5tw
	9Q5wKv6cO7cy+iGxUhYpKFL3grgJqwa+H4QCQOG98z5pz38dg7D6n242VjLqRco0E7kjwICKiWd
	mfsFslC0baZN6C0STI1peowDxN6wpZBZvsW/3m9RUXlHEqrsYDs25ycjqLerJSvxV1Q4lm8xe9E
	TRJ1tMb2lUbxQXQEIffpAzaxHJtphvPCNbbT3veaY=
X-Received: by 2002:a17:902:e802:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b0cdd1a6b4mr151261665ad.42.1774903175744;
        Mon, 30 Mar 2026 13:39:35 -0700 (PDT)
X-Received: by 2002:a17:902:e802:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b0cdd1a6b4mr151261475ad.42.1774903175208;
        Mon, 30 Mar 2026 13:39:35 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:34 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:10 +0530
Subject: [PATCH ath-next v3 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-5-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: SiljexqkFHkquU8ergyrKW1oFZ71PKYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX5TaBAnJ7/C81
 OcVO90vc2Z7Z64uXCK6ezN0CtyLErWwqt4zM/Mua5p432aAuHbidQ74xe09R8BJ72012ul5Omtj
 84BYbMYkhKvvf6T2HenYhKOKR2R+VumM+iok3RGzLrAJ0IHIBA5PIywifvIvvQ72gLuxlpCqvlS
 dY0sJvxYr6jG/4Qr14F7Ti7LnJOLu0jOpSMurDLVXeW41eJFKzFZPz/nLnUrJiUwKfyApsHpPR0
 YF4QiAyVm/XvEJTjt6sO0KwIIDsta+1HmV9Q2kMRnqUoQLcl5PtU+nqGIoHT7riWl+1XlvZkJcT
 fok50GySe0EAC5mLVGiCiWh6YGGWer0Mk26AXQy5EcUUmqcmMDl9ZQOYi8aDWNtkGq2+nh6KF6Z
 WLPr1YFS+TkYZWWC1kuKQrXvRS3Sml8RHssCcFq8OcM1Lq3zR6ydUG4jOwgtNqbC68e22+FZArs
 0CWDzZCxDFElr7nFmzw==
X-Proofpoint-ORIG-GUID: SiljexqkFHkquU8ergyrKW1oFZ71PKYX
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69cadf88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LDmrCAwXcT0UWmoAFo4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133937_984955_F9597383 
X-CRM114-Status: GOOD (  14.42  )
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


