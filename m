Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6578BCD4F3C
	for <ath12k@archiver.kernel.org>; Fri, 15 May 2026 03:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xNaSX0ZjZaDQ+ouN6CHQGcgE/bkIh5J7f1JmzYdKatM=; b=KP8QGFKTm+4q1QqvoxF1Cvk4u5
	url9Wt2rsClzN6BnMUJurHZ7I3S1Sz3okZSyKZchdXMzv1tvsit7VAX5XRmggifQPiOFjqDQIgntK
	nAdzJEdfSp2ePTFRsSro0edrLZi3hmgCQh8dUFOKsYH8PLetDkswUwci/whBT8fI0Q/QnCCOnqtAc
	pNIcMuB7NeRXjOd1n/ZNiWUokXCq3R7NADg5nRhSWrKmrLCNxQ3alEYfnQybbSOwte/OlCwWfHUf8
	gliXHCJK7oFYBkqXxVueip7vkPlD5i5DBIX/B3875ax0ZpOiaIPBJL7tK+nzFuF0CGFYY0wHTSHtw
	WUM3CKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNivP-00000007C12-0FDa;
	Fri, 15 May 2026 03:09:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNivM-00000007C0Y-3ZSc
	for ath12k@lists.infradead.org;
	Fri, 15 May 2026 03:09:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F2jf901717292
	for <ath12k@lists.infradead.org>; Fri, 15 May 2026 03:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xNaSX0ZjZaDQ+ouN6CHQGcgE/bkIh5J7f1J
	mzYdKatM=; b=XJ6QwQVdxuktfDn4I5ew+Z4cuDD7AqDAcl+nAU1ku4gX85NRb5D
	sf6GGEWxEzinZbXY/7zmAtyVJV1pCG5SLaYgn3PRvdqpXFS5FMWuJtbrI7BWPRmg
	4xNSpNZS8nGVaMjclTUZ2AGrHMkGzhNk6uDWxNzXu8hVf0dQZYuyQVLEBZc+6UdN
	O2oGB+YVPFFpXB7lXrppNHUWRLKXL56OAC6ARUlAiU6Sol2/Ti/Y/sdZO9d20AMh
	xJxdtjsVyjxdf9tkexdXgQbrP9N2nlv3SHYEPFIQ5qsxTW52XylwqR43q1vUJQvX
	czWBSCI8nfPDht5b50RH8M68/vrlu5kWu2g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxr236-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 15 May 2026 03:09:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa366fb79so9452178b3a.2
        for <ath12k@lists.infradead.org>; Thu, 14 May 2026 20:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778814555; x=1779419355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNaSX0ZjZaDQ+ouN6CHQGcgE/bkIh5J7f1JmzYdKatM=;
        b=Yub9aQihDss3Wgcv02Y0sfWkQ6gcVAOouGIWK8MA4kXxIqtXPwyxf8PUOUvPU8aB4k
         FFmOPpxT9Jom6L3cGaIcHzcPgwadmt59axVfuqci2CuZHIh/O9vhNGhlc0zNlmCWMvOg
         GQ3myyivMlhO3NyzqHlCHZ8LF0pJm3nXIQYJGHqpGpYgFm3AlzmGfz5EaKE1GnNsQzrt
         UDsYy1qlnWQIosCaoMAyfIBD6x+YCzRF0ABsVQD8PpWb4QtBc3tBO5cwEGhFILYEQdjQ
         HpQlll8+Dt3trHBInj1obxq+yMknq5v98oRnFYBNPFjyQ4ORCXd2cyxr/0miPdcxHZIS
         NlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778814555; x=1779419355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNaSX0ZjZaDQ+ouN6CHQGcgE/bkIh5J7f1JmzYdKatM=;
        b=XlOg8RqLC9n3NQq9uFL9rEkO/6xtPg6OysNgL8lKEk+bJjT+vP3/czIdWAjlJS57NZ
         SRgEMQ1Blff3U9xj8M1pYfM4bpoKPVJnBFcbYl6OHdC5V/v0p/puHbOGuc7kIq5BcQN9
         +71u+OxeHk6uFJtwTrkNn/hwg6TST9XN1Fnk7anh8rLP04PVKm0kfPpaPG7fWdctaWwj
         b/2oqwrTdV+4v0P3jg7poS3z5lrwCD5BDExCw+7KHoX56W0RZsssXKfu3sA2NIaTvu7C
         CtF6JBbRUpOgcz4+fZBQp2K4raAXmDuvEYLA7AbpPs2P5Ghd4UGUgGs0TcLkp1Cg+Vrf
         5x7Q==
X-Gm-Message-State: AOJu0Ywsd9kvcjzWy5wImZF3MbzNLYyDBblnPmK9lnOAq5FC6Lduv7J3
	qnLlh3CTRYj987sqiYZghJF3WuJrpzXh0KN2P0b6g3C1oPf8cTSyOYl0j/m8bi3beG9O+Zz2Z47
	Ea6rp1SOtZye8kPjmO2cyev0QLCJGdndZ3LeI5RteknUdWXeUnmJAg5Py0QYswY1SwIq7bYGI
X-Gm-Gg: Acq92OHWjM6b4uwgf9U2E2fhYACPU/vEo7RQRXzfVi5C6xbniMV0kj5qlL4EtrFV8Wr
	cPZcfVPPQqNfkHPglR3QXpUYMkTdpOp6WC03CYCg2EO1840UzrBrjpbuNzxfsuhQqPkoTYHdexR
	w8XcNHDsZ73rdfF9QPmLUGSGWz2A/PHxwsMo6ERfgTuj2RKryfgcYLvOKC7qlohdb39+JnGlUl/
	F5YAG7SjKbrxF++IojKcfN8d5jIrtGmINIBVQBolWfPgeIkFCBJ4x54y0CtiY41QgnrERP4kbOs
	BeQxkYooyfNSC7NzQHvxqKGILaoN7pstA4oeTKWSMmjaoi518B2Kij7sHFRIC577d51zHG9t15S
	07Ms/8WcYpsFl2+mI5xmo6CcG5x2neTjzCbYSVtefgOb0VpraihOkDxy2uOS+tB34PMrYtekmEu
	wWlr6XrSWX9eQZVVyThOkTQJqAK7X76rR+0clAJtbQyRTS2hMp4hfX1lk=
X-Received: by 2002:a05:6a00:4b0b:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83f33dd0695mr2407129b3a.33.1778814554839;
        Thu, 14 May 2026 20:09:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83f33dd0695mr2407092b3a.33.1778814554319;
        Thu, 14 May 2026 20:09:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm4205041b3a.45.2026.05.14.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 20:09:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: add hardware parameters for maximum supported clients
Date: Fri, 15 May 2026 08:39:09 +0530
Message-Id: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a068e5b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=d6oOGSSlwGQnz5sBqGQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: H2qCQdXWibI42bERkQKPRn9jVDlSL4xZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyOCBTYWx0ZWRfXxgpjia1zeAhx
 pQ80JdklTNdPGRvDCO4HezAztiiiZ5Wn2bxHqqmtvfoKdP68ORlrhdCrIVh7COw5ouZr29/i4Kp
 /21n8YER0jiqXWKNr1QtZfcvZGPwZD2LxWy3LA9/qSIKygm6PZt1+z0VcFUbfPi/SPSegv8wkhV
 XkFgqrbGertBgYdYRGM3YJdBzLk/iGrjg+7f443CwzuBB4metW8ha6Mvs2ta61j3NgNYDO5GoMT
 lcyP6P7nLRuBQIW1tAQndHhQSroZ5u0COQitVIwug5KJJvia8CIyZC42093h7JaX11e/24mhmR+
 XPhOi1fV2DY1lXBnaG8cmZQIfEYbVTtFoF4F0LuwXQ/VOmsWnte/OgELziKpZmb3s7NrB1yUSga
 0WJYw5tstw9njclRip8DstPIjaLAUcNbQ181m7oSq5UFLnt+n7oIa4hbrGAbmkBajQjNW4TCmQq
 o/IMPKtbC/LFF+njyRA==
X-Proofpoint-GUID: H2qCQdXWibI42bERkQKPRn9jVDlSL4xZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_200916_898735_3CC1DD46 
X-CRM114-Status: GOOD (  15.09  )
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

Currently, the driver uses memory profile parameters to determine the
maximum number of supported clients, with a default limit of 512 for
single-radio and 128 for DBS and DBS+SBS configurations. However,
some devices have lower hardware limits depending on the radio
configuration. Exceeding these hardware-specific limits can lead to
firmware crashes.

Add hardware parameters in ath12k_hw_params to define the maximum supported
clients for each radio configuration. The driver uses the minimum of the
memory profile limit and the hardware capability limit to prevent exceeding
hardware constraints.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 25 +++++++++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 30 ++++++++++++++++++++++
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index a9888e0521a1..d135b2936378 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -19,14 +19,28 @@
 #define TARGET_NUM_VDEVS(ab)    ((ab)->profile_param->num_vdevs)
 
 /* Max num of stations for Single Radio mode */
-#define TARGET_NUM_STATIONS_SINGLE(ab) ((ab)->profile_param->max_client_single)
+#define TARGET_NUM_STATIONS_SINGLE(ab) \
+({ \
+	typeof(ab) _ab = (ab); \
+	min_not_zero(_ab->hw_params->client.max_client_single, \
+		     _ab->profile_param->max_client_single); \
+})
 
 /* Max num of stations for DBS */
-#define TARGET_NUM_STATIONS_DBS(ab)    ((ab)->profile_param->max_client_dbs)
+#define TARGET_NUM_STATIONS_DBS(ab) \
+({ \
+	typeof(ab) _ab = (ab); \
+	min_not_zero(_ab->hw_params->client.max_client_dbs, \
+		     _ab->profile_param->max_client_dbs); \
+})
 
 /* Max num of stations for DBS_SBS */
 #define TARGET_NUM_STATIONS_DBS_SBS(ab) \
-	((ab)->profile_param->max_client_dbs_sbs)
+({ \
+	typeof(ab) _ab = (ab); \
+	min_not_zero(_ab->hw_params->client.max_client_dbs_sbs, \
+		     _ab->profile_param->max_client_dbs_sbs); \
+})
 
 #define TARGET_NUM_STATIONS(ab, x)     TARGET_NUM_STATIONS_##x(ab)
 
@@ -213,6 +227,11 @@ struct ath12k_hw_params {
 
 	/* setup REO queue, frag etc only for primary link peer */
 	bool dp_primary_link_only:1;
+	struct {
+		u32 max_client_single;
+		u32 max_client_dbs;
+		u32 max_client_dbs_sbs;
+	} client;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index cb3185850439..98bf9293dd33 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -434,6 +434,11 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.current_cc_support = false,
 
 		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 512,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -520,6 +525,11 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.current_cc_support = true,
 
 		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 512,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -602,6 +612,11 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.current_cc_support = false,
 
 		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 512,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -677,6 +692,11 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.bdf_addr_offset = 0xC00000,
 
 		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 256,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -764,6 +784,11 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.current_cc_support = true,
 
 		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 512,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -843,6 +868,11 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.current_cc_support = false,
 
 		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 512,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
 	},
 };
 

base-commit: 8b3115499abadba0f4f8408978df0c6d258fe7ea
-- 
2.34.1


