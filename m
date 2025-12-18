Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2404D66B87
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=; b=HkNPssWaNnpCy7bIY7lMxft/yY
	wpnQeiSFNj8a7yZLjar7nFUrrRSbzuCQsEE9XH7h4yjkIgZRHZzr8PH2nuDnQelFMGC3PiHq+AfLB
	IKxqkaZxK5Tvt0E5VMXI/3VU8xXxnNlt8lVLe1bzY0wZ0za5Czbb2QZOwmD5gxR5M9D3xLUVxCL7m
	xMhafb7NLTI3CpeYyRdaxXFbtiLW8poVlZ2z8LXGniDKv7v93n/mSyaUbG6+qgAg/dtcRHL0UUZ46
	Tqf7+LQHCceKL5p70TgPxacbXglP56yAed19oHwVEW83x/99nofrMKlaaLkCMAGmwmorWr3MIBBW9
	yYi7h4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3EZ-00000007fny-1hbf;
	Thu, 18 Dec 2025 01:55:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3EW-00000007fm6-2U95
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YeqW4148006
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=; b=KprRR0R20S3BXHy6
	0mk4EFZD8YIl35D6Vj+2oUfoC84SSolyFLcWTqCtnoHNNBKBuxenFGwqftmWRrEV
	9gwXeRun5AZqEAqH4RB3vxHm0xdLmwZ2kyLQhd3TXMAZMNK3OzzNCjVQa2OY6aGQ
	oQQn6RcJFE5+mkqV6xtPtbcl2Pj5j8StnqcWnS3L1Cvj+7AGAqwb1lJhC2zP4DrL
	lKXMUnFjzvEurkG366X2gtvhAqLmQrAeNxIp5s5H7gt/mzeIImmdxsfPbpOYU2Cg
	Ly5hToRbyAc2nNJPe1RdHxtqblSHn76v7mEPd8AFYIEXGR+00S0FllHedsfAv+oP
	XpUHZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u798kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29efd658fadso4187755ad.0
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022911; x=1766627711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=;
        b=WuYEpP3ADAMIMFmLwpSLlDXS1Vd5me5XVAjk/tObirFRcaUzdx6X/KN20qBg90wbqw
         dWaqSySzzBnn8QoIO7MEwDSAreXIaGTMw0KOOS3vcxzQ1jpuOwsMODxFOURhGQoKQukg
         D2K7a/16YAT9t/6wJE9LO+v1AOH0Jp27/BAH2rVt8WPN17aSqceRhMCSmLqdXNCpCsOw
         8Cmq8m7I2aR5rbUd3ZwKERNsg3eLpECrVlRLkwqljGi2Kbjxe504kRHTPKjDAaUozxbk
         ZprRDxMS5h4nCF8vxlblqwUZr/ksI8T0Aku5RbtxqvUoE0xrf3zsg46YowaJBzrvwS0i
         9r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022911; x=1766627711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=;
        b=QpFa++TKS0RF+bx8bvGb9OQx14YsSeHJUrZmjYVj7cW8QmhYSaCDKCfcHyTEDeiF+X
         ozLvvvsUJws5CyK6Oh7aaMqmKUwohkx/EFWGAG24qjezexBVJ0QLiHvgqyjKPe++udhY
         OHF6XHgLNrnHs/bdvjE7d1wrFOiWYRc7FX2vsIfxAK0VaYkEGbcFq1wv58xziu2HTg2g
         x9uZg3mifQdreDqL5EwFQerCAPlI00IqG5+FejVLYREOmUMieAhQ76Zm76Kp8DevxH4D
         +Ck8UgEzBPwCBqFWW8iHheBz8sYBCSF+BdAiOf8pAR/FlFo1tqSXuaS41jvRPPSUGDhe
         Kjnw==
X-Forwarded-Encrypted: i=1; AJvYcCUIukV6uPTeSEQvRRkEJmH9qyPz6w4pIlnTrzAbs05LIpCgNHxnQl9QdcJ0KCciTjqF9HjVu4w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEiMByM054ief6NFvPOs+bT96NFFiuWPOb2iy4DP2+Qq4iy+u
	AkSl5UMZQJY5ES2OvJj3rHfgmZf+pVU9VuSZXhP4V5tELs+4GWy4U1P3nl6D2yW7j890MfxME/F
	yuydiY6JxCGcpyTiojnfhNaHI6+hdzaEkKPPzeLIpdqISnVlc0mOTW1dKI6X0u2qIXoq5d/3Afo
	o=
X-Gm-Gg: AY/fxX4wJAyBhN1Q95k7HLrZOMf86QKRwEs4srCOFNXKaTjALEcUGfCKhUbj6PC3kou
	B8TS9zsH6KbwYTvigxjrkn00FnMBGL1FDCXpadP8STXzKvGYlkFyN44R6ME2MF3qHH/IFCaartI
	/X2p1Xk4T/+//pjMHQQKGgU655bi9vKN0Q/vAtaiHylZY9AbDpJDr3c0Y63TO/X2iKgDf4xRhSP
	1+6Vy5OG/GD/em5RSpJAOZ5OQOo9CYAsBDfLVP2rI/1ebmNgR0uFedBVsZA3B8FGudWljAJQL8c
	HL+WT6rX9MWtoi/21QPv6Dy9QnfOgB3HWSwOF2plooVZD0R/y2kt1w2Fe7eNbLpCPpjjfbZCJxZ
	CDgcUmhxjHc0ccHuCI2gkFPVqj276cjviuIyuWUmhA37IoB5FYrglA6i6B4GiS8c=
X-Received: by 2002:a17:902:f70a:b0:2a0:9d01:c3c1 with SMTP id d9443c01a7336-2a09d01d4a9mr144260785ad.1.1766022911087;
        Wed, 17 Dec 2025 17:55:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtEwZOODi5YePTeyR18dM99buf73OyxwH3M4KmZIvfMi2TAtXZlCwwuWKTxnTw0RTh+nmkcg==
X-Received: by 2002:a17:902:f70a:b0:2a0:9d01:c3c1 with SMTP id d9443c01a7336-2a09d01d4a9mr144260595ad.1.1766022910544;
        Wed, 17 Dec 2025 17:55:10 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:10 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:17 +0800
Subject: [PATCH ath-next 03/19] wifi: ath12k: refactor REO status ring
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-3-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: zlG8zbP1UXUwwSXGSY-EY8sGY7sip-KO
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69435f00 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PMNv47187FcU-8MNZ6AA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zlG8zbP1UXUwwSXGSY-EY8sGY7sip-KO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX2XvsDzAYgqif
 1wM4ieTKvrzc3WKW/TfcLpMTSh2b7ktErZOYDPJDCAGxpjesVjQq2+9upFjZTG7Pu+en495xB1K
 TrpZCOhhSzkEQoU1lferPU6exkWV5unAGIr6P3oagu98aVYFOlFl/5+k6ALN2CUlUQmMjfLNRxG
 C0Zp/vjMo5gqtGvJw0JZfYkGF8F2WhtY14RTY87OqptgqHccmOcFzKOqFkPBhU/Ixnb+klCBNgs
 jkblyjShXOHDuHxGNKVLsuJkX3rxyZ0Hl57DTqmGTlXP3h/P8GQiJBI7jDs8TFaJijz5b3/Pb8/
 Tb2QRPgQeqHW5B3Ybqef1rC2Mbel5RmQ+Sa+z4KzcK8OcvPYTw0ZaDjHnG13oNTPF5RvvWYw6Tj
 zx6/j1DDZDPV18f1LJ3zCCWEuR9qLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175513_214744_4D496318 
X-CRM114-Status: GOOD (  16.25  )
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

The entry of REO status ring of existing chips has a 64 bit TLV header,
hence below functions take a 64 bit TLV assumption by default

        ath12k_wifi7_dp_rx_process_reo_status()
        ath12k_wifi7_hal_reo_status_queue_stats()
        ath12k_wifi7_hal_reo_flush_queue_status()
        ath12k_wifi7_hal_reo_flush_cache_status()
        ath12k_wifi7_hal_reo_unblk_cache_status()
        ath12k_wifi7_hal_reo_flush_timeout_list_status()
        ath12k_wifi7_hal_reo_desc_thresh_reached_status()
        ath12k_wifi7_hal_reo_update_rx_reo_queue_status()

However this is not the case for QCC2072 of which the TLV is 32 bit.

Refactor above functions to prepare for QCC2072 support, this is done by
removing TLV length assumption and offloading TLV decoding work to a newly
added callback _reo_status_dec_tlv_hdr. This way each chip can register
its own handler hence can do the work accordingly.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c              | 12 ++++++++
 drivers/net/wireless/ath/ath12k/hal.h              |  5 ++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 18 ++++++------
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 --
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     | 33 +++++-----------------
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h     | 24 ++++++++--------
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  1 +
 8 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index b19bec8ea082..bafb49ab5475 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -834,3 +834,15 @@ void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len)
 	return tlv64->value;
 }
 EXPORT_SYMBOL(ath12k_hal_encode_tlv64_hdr);
+
+u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc)
+{
+	struct hal_tlv_64_hdr *tlv64 = tlv;
+	u16 tag;
+
+	tag = le64_get_bits(tlv64->tl, HAL_SRNG_TLV_HDR_TAG);
+	*desc = tlv64->value;
+
+	return tag;
+}
+EXPORT_SYMBOL(ath12k_hal_decode_tlv64_hdr);
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 595e49046471..81b0cb002b38 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1427,6 +1427,7 @@ struct hal_ops {
 					 struct ath12k_buffer_addr **pp_buf_addr,
 					 u8 *rbm, u32 *msdu_cnt);
 	void *(*reo_cmd_enc_tlv_hdr)(void *tlv, u64 tag, u64 len);
+	u16 (*reo_status_dec_tlv_hdr)(void *tlv, void **desc);
 };
 
 #define HAL_TLV_HDR_TAG		GENMASK(9, 1)
@@ -1450,6 +1451,9 @@ struct hal_tlv_64_hdr {
 	u8 value[];
 } __packed;
 
+#define HAL_SRNG_TLV_HDR_TAG		GENMASK(9, 1)
+#define HAL_SRNG_TLV_HDR_LEN		GENMASK(25, 10)
+
 dma_addr_t ath12k_hal_srng_get_tp_addr(struct ath12k_base *ab,
 				       struct hal_srng *srng);
 dma_addr_t ath12k_hal_srng_get_hp_addr(struct ath12k_base *ab,
@@ -1538,4 +1542,5 @@ void ath12k_hal_rx_reo_ent_buf_paddr_get(struct ath12k_hal *hal, void *rx_desc,
 					 struct ath12k_buffer_addr **pp_buf_addr,
 					 u8 *rbm, u32 *msdu_cnt);
 void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
+u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a1ca55fe51c0..dc8d72aeca45 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2114,12 +2114,12 @@ void ath12k_wifi7_dp_rx_process_reo_status(struct ath12k_dp *dp)
 {
 	struct ath12k_base *ab = dp->ab;
 	struct ath12k_hal *hal = dp->hal;
-	struct hal_tlv_64_hdr *hdr;
 	struct hal_srng *srng;
 	struct ath12k_dp_rx_reo_cmd *cmd, *tmp;
 	bool found = false;
 	u16 tag;
 	struct hal_reo_status reo_status;
+	void *hdr, *desc;
 
 	srng = &hal->srng_list[dp->reo_status_ring.ring_id];
 
@@ -2130,35 +2130,35 @@ void ath12k_wifi7_dp_rx_process_reo_status(struct ath12k_dp *dp)
 	ath12k_hal_srng_access_begin(ab, srng);
 
 	while ((hdr = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
-		tag = le64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
+		tag = hal->ops->reo_status_dec_tlv_hdr(hdr, &desc);
 
 		switch (tag) {
 		case HAL_REO_GET_QUEUE_STATS_STATUS:
-			ath12k_wifi7_hal_reo_status_queue_stats(ab, hdr,
+			ath12k_wifi7_hal_reo_status_queue_stats(ab, desc,
 								&reo_status);
 			break;
 		case HAL_REO_FLUSH_QUEUE_STATUS:
-			ath12k_wifi7_hal_reo_flush_queue_status(ab, hdr,
+			ath12k_wifi7_hal_reo_flush_queue_status(ab, desc,
 								&reo_status);
 			break;
 		case HAL_REO_FLUSH_CACHE_STATUS:
-			ath12k_wifi7_hal_reo_flush_cache_status(ab, hdr,
+			ath12k_wifi7_hal_reo_flush_cache_status(ab, desc,
 								&reo_status);
 			break;
 		case HAL_REO_UNBLOCK_CACHE_STATUS:
-			ath12k_wifi7_hal_reo_unblk_cache_status(ab, hdr,
+			ath12k_wifi7_hal_reo_unblk_cache_status(ab, desc,
 								&reo_status);
 			break;
 		case HAL_REO_FLUSH_TIMEOUT_LIST_STATUS:
-			ath12k_wifi7_hal_reo_flush_timeout_list_status(ab, hdr,
+			ath12k_wifi7_hal_reo_flush_timeout_list_status(ab, desc,
 								       &reo_status);
 			break;
 		case HAL_REO_DESCRIPTOR_THRESHOLD_REACHED_STATUS:
-			ath12k_wifi7_hal_reo_desc_thresh_reached_status(ab, hdr,
+			ath12k_wifi7_hal_reo_desc_thresh_reached_status(ab, desc,
 									&reo_status);
 			break;
 		case HAL_REO_UPDATE_RX_REO_QUEUE_STATUS:
-			ath12k_wifi7_hal_reo_update_rx_reo_queue_status(ab, hdr,
+			ath12k_wifi7_hal_reo_update_rx_reo_queue_status(ab, desc,
 									&reo_status);
 			break;
 		default:
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 7d65b82c61f2..9337225a5253 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -369,9 +369,6 @@
 #define HAL_DEFAULT_BE_BK_VI_REO_TIMEOUT_USEC	(100 * 1000)
 #define HAL_DEFAULT_VO_REO_TIMEOUT_USEC		(40 * 1000)
 
-#define HAL_SRNG_TLV_HDR_TAG		GENMASK(9, 1)
-#define HAL_SRNG_TLV_HDR_LEN		GENMASK(25, 10)
-
 #define HAL_SRNG_DESC_LOOP_CNT		0xf0000000
 
 #define HAL_REO_CMD_FLG_NEED_STATUS		BIT(0)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index ff26e9684e9e..95850e6dc6c7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -1030,4 +1030,5 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
+	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
 };
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
index 3b8710a3b6ad..a88ef126aada 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
@@ -543,12 +543,9 @@ ath12k_wifi7_hal_rx_msdu_link_desc_set(struct ath12k_base *ab,
 }
 
 void ath12k_wifi7_hal_reo_status_queue_stats(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_get_queue_stats_status *desc,
 					     struct hal_reo_status *status)
 {
-	struct hal_reo_get_queue_stats_status *desc =
-		(struct hal_reo_get_queue_stats_status *)tlv->value;
-
 	status->uniform_hdr.cmd_num =
 				le32_get_bits(desc->hdr.info0,
 					      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
@@ -607,12 +604,9 @@ void ath12k_wifi7_hal_reo_status_queue_stats(struct ath12k_base *ab,
 }
 
 void ath12k_wifi7_hal_reo_flush_queue_status(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_flush_queue_status *desc,
 					     struct hal_reo_status *status)
 {
-	struct hal_reo_flush_queue_status *desc =
-		(struct hal_reo_flush_queue_status *)tlv->value;
-
 	status->uniform_hdr.cmd_num =
 			le32_get_bits(desc->hdr.info0,
 				      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
@@ -626,12 +620,10 @@ void ath12k_wifi7_hal_reo_flush_queue_status(struct ath12k_base *ab,
 
 void
 ath12k_wifi7_hal_reo_flush_cache_status(struct ath12k_base *ab,
-					struct hal_tlv_64_hdr *tlv,
+					struct hal_reo_flush_cache_status *desc,
 					struct hal_reo_status *status)
 {
 	struct ath12k_hal *hal = &ab->hal;
-	struct hal_reo_flush_cache_status *desc =
-		(struct hal_reo_flush_cache_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
 			le32_get_bits(desc->hdr.info0,
@@ -668,12 +660,10 @@ ath12k_wifi7_hal_reo_flush_cache_status(struct ath12k_base *ab,
 }
 
 void ath12k_wifi7_hal_reo_unblk_cache_status(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_unblock_cache_status *desc,
 					     struct hal_reo_status *status)
 {
 	struct ath12k_hal *hal = &ab->hal;
-	struct hal_reo_unblock_cache_status *desc =
-		(struct hal_reo_unblock_cache_status *)tlv->value;
 
 	status->uniform_hdr.cmd_num =
 			le32_get_bits(desc->hdr.info0,
@@ -697,12 +687,9 @@ void ath12k_wifi7_hal_reo_unblk_cache_status(struct ath12k_base *ab,
 
 void
 ath12k_wifi7_hal_reo_flush_timeout_list_status(struct ath12k_base *ab,
-					       struct hal_tlv_64_hdr *tlv,
+					       struct hal_reo_flush_timeout_list_status *desc,
 					       struct hal_reo_status *status)
 {
-	struct hal_reo_flush_timeout_list_status *desc =
-		(struct hal_reo_flush_timeout_list_status *)tlv->value;
-
 	status->uniform_hdr.cmd_num =
 			le32_get_bits(desc->hdr.info0,
 				      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
@@ -727,12 +714,9 @@ ath12k_wifi7_hal_reo_flush_timeout_list_status(struct ath12k_base *ab,
 
 void
 ath12k_wifi7_hal_reo_desc_thresh_reached_status(struct ath12k_base *ab,
-						struct hal_tlv_64_hdr *tlv,
+						struct hal_reo_desc_thresh_reached_status *desc,
 						struct hal_reo_status *status)
 {
-	struct hal_reo_desc_thresh_reached_status *desc =
-		(struct hal_reo_desc_thresh_reached_status *)tlv->value;
-
 	status->uniform_hdr.cmd_num =
 			le32_get_bits(desc->hdr.info0,
 				      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
@@ -762,12 +746,9 @@ ath12k_wifi7_hal_reo_desc_thresh_reached_status(struct ath12k_base *ab,
 }
 
 void ath12k_wifi7_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
-						     struct hal_tlv_64_hdr *tlv,
+						     struct hal_reo_status_hdr *desc,
 						     struct hal_reo_status *status)
 {
-	struct hal_reo_status_hdr *desc =
-		(struct hal_reo_status_hdr *)tlv->value;
-
 	status->uniform_hdr.cmd_num =
 			le32_get_bits(desc->info0,
 				      HAL_REO_STATUS_HDR_INFO0_STATUS_NUM);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index aa1bca813955..95f5595b30ad 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -813,25 +813,27 @@ enum hal_mon_reception_type {
 			(HAL_RU(ru_per80, num_80mhz, ru_idx_per80mhz))
 
 void ath12k_wifi7_hal_reo_status_queue_stats(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_get_queue_stats_status *desc,
 					     struct hal_reo_status *status);
 void ath12k_wifi7_hal_reo_flush_queue_status(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_flush_queue_status *desc,
 					     struct hal_reo_status *status);
 void ath12k_wifi7_hal_reo_flush_cache_status(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_flush_cache_status *desc,
 					     struct hal_reo_status *status);
 void ath12k_wifi7_hal_reo_unblk_cache_status(struct ath12k_base *ab,
-					     struct hal_tlv_64_hdr *tlv,
+					     struct hal_reo_unblock_cache_status *desc,
 					     struct hal_reo_status *status);
-void ath12k_wifi7_hal_reo_flush_timeout_list_status(struct ath12k_base *ab,
-						    struct hal_tlv_64_hdr *tlv,
-						    struct hal_reo_status *status);
-void ath12k_wifi7_hal_reo_desc_thresh_reached_status(struct ath12k_base *ab,
-						     struct hal_tlv_64_hdr *tlv,
-						     struct hal_reo_status *status);
+void
+ath12k_wifi7_hal_reo_flush_timeout_list_status(struct ath12k_base *ab,
+					       struct hal_reo_flush_timeout_list_status *desc,
+					       struct hal_reo_status *status);
+void
+ath12k_wifi7_hal_reo_desc_thresh_reached_status(struct ath12k_base *ab,
+						struct hal_reo_desc_thresh_reached_status *desc,
+						struct hal_reo_status *status);
 void ath12k_wifi7_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
-						     struct hal_tlv_64_hdr *tlv,
+						     struct hal_reo_status_hdr *desc,
 						     struct hal_reo_status *status);
 void ath12k_wifi7_hal_rx_msdu_link_info_get(struct hal_rx_msdu_link *link, u32 *num_msdus,
 					    u32 *msdu_cookies,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 49c45431c0c7..c3093c01af87 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -803,4 +803,5 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
+	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
 };

-- 
2.25.1


