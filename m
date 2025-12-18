Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF552D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=; b=ECDtI+ylR0QhqG1bdvrWsBvDyJ
	YnOrt13y2l5CAD5ZSXOVpR1i6jW6GuId7wjWIYD8Z+sxfcCLjtUdWiXsp3q6Bhn4bXMi0CHz/PNmn
	GsktKUU+IOGhK50Hk7OHAgvkBb9qwi3FJxtHi8GXaqBMEhxO7JL1psapSwloBpno13YEN0vQmB1uZ
	Ok3lOy7cqFaxYjCWGRp5P0jh2ZNuLNg80E1JE7EJb5MouR+h/JfFR2Lker4FUFjl3tGt5ajUWPXKc
	VaecQk8nIAt6xf0u4cVpEK7qqZmFfoToNm0LX+KvkfRwVhOJfXvpz62NE2vxueEU3Y/mTyW+cSBNz
	f4DIHGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3EY-00000007fn7-0Un2;
	Thu, 18 Dec 2025 01:55:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3EU-00000007fl4-2KXh
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YZqQ4147974
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=; b=jH0RBl1buQK0ans5
	5bglJZVts1Q4oGXYDHpkBTDc4aBKBzqfmsL5wVGM+kCGZYLfYQjnUOBcNpYsyPBL
	3n6pbf6p6Gt51Tyt765XEOZ2Y/UrNmFIZJ+vpaj/niqaylDi77VBgoJMkTUfwkQR
	H0QY/xSMZW/npeD3/DjcAv0U9W2IOXj/AezRT1HEDeB1cYvogQ0/H7BZxVa1TM08
	PLTGLubHMdt9ReoqTk8WvA5rPZhvUDvRprd0QRDfjQ2zyXexgOLmyNVTGehBORIu
	6ylb9ZcU/VTgDu0ZDBMin6LYMcEz9lPS5Ltx3C1guVsmznuwuyrPZPXz+zl/puy+
	cQyYIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u798ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso1669995ad.0
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022909; x=1766627709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=;
        b=VFCEChmskiv99zs+mHqLomT08G6j9GlONzKHWrGzb6jj3Kp3PifEzW/d5hzWpy7jAV
         YaEsNU5L1nkiCoI6jPnF+qSHDB1BwyHLp+dtY/8vW5htSGbaRSXakBX18BgO2gB29RCG
         l0QHfQB8ZeGBHzq7feuBiXLNZab2z6POzEWsCGYcLweClwq6K4u9YNXCWCdOUiJEGsDW
         I+Q0LUnmukEY+jFsFDGHNA3AzxoS1ttKUSamg0FvV+eyzISvDOTBFA7rYQauKzcH2pTy
         Myq+YSylrP/9edI9trKuuYIckRouXHHRysEgvbQpdFrA3jQCMTKo7qASS53oeHQdM4Dm
         y/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022909; x=1766627709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=;
        b=vmNQn3hgqHZxxq1Ru8+r1GmxrpyUq+eCQsMKOr7qJY+6F0YPXXImpd7JhjYPMyDke7
         PhD79VpytNg+FqHqbmM8SVG1zTCDDYYNMyLmDr5nyHP5G5xDAntajpNqkLlfQrNYC0Ze
         QMzAzVKmdHTgSO3C4lv6yOfUSNN3Gj/jEN/Ulf/drjy19sT9DhXJT2hDNXyi2p8pU94N
         ltzTlolKeTguOWysc5QU33v+rg6EQu8CvnOZdJTf6a2/U/MCaKlsYXdQEiny56M9nuOj
         bJt+W9sDRsQg9JzjAfv1eRSFluRaE5j0KOL8XjD6d6NF2K2HmlgN7gFIw5H03qA3fQs6
         qYhg==
X-Forwarded-Encrypted: i=1; AJvYcCWT/Hy7pvWi2xm+dFfWqhRnSjItkruitFWPpxieOTtBkEoC+iaW5u/plz6gay+0Uw4T76s63Vg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUD5VA/svHGUXQQtRvCRvFXdsV2O7YWGyO5vGXxSBc+hCAS61L
	02O+8XJsn1UrR1eEDifUTLP03ppza7DXa4BwF9lfKpns3dvXCfRATL8660pyXkzBgxWRZoTzTSc
	cdwFbUIyAKu90s+xQcABOiEEAwh5NAkV5TJFFUhj9olHJnsoL+huec90x/81iJAWO3dIfXS0KI4
	k=
X-Gm-Gg: AY/fxX6lz4rqU/v0YwlmW7L/ec91qpoho1QPMxJESWDrQit9IZOSVVjyWhW5+DFZbsc
	z2odjqejqVs/xQKzSfUOmGy/dzdHtEXf6/dEsaiCNDP30Now038fus4udmzktUQHGpSeXeV3ULx
	o1fVtxLbuyXiWXwoEfSEbbckwswyjjX3CBOVsQ41/PftlDamdoncCdtAmxvwWePW2M5Adl4zrki
	v4A/WwFouyU/ROuXHSEkvH8CqGYgrjy8avDh5U/+cu2EuVDVm0pYUevvsctdTY72BquVj+Gmwkz
	JBO3ih8ZmH9LscSWVvXoxQHao42KA6Hk/TIxqCIM9FvjgekpPmTVWW56SEGUPQLPLmuM8jGstkk
	LMFzqiwgM7plPJwAOGu5rYJgK7hjLUWpNk9S69+KL78u+DL57LiF5Z9rJbVojvpQ=
X-Received: by 2002:a17:903:3843:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a0d6299386mr110161075ad.9.1766022909006;
        Wed, 17 Dec 2025 17:55:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLFkPskK3UxU2NlNOh1xNwyPH5m6dKFSekMOkjDUjCPJgtW6g8xoDb/VwCMhtkGyOa7YlT8g==
X-Received: by 2002:a17:903:3843:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a0d6299386mr110160875ad.9.1766022908433;
        Wed, 17 Dec 2025 17:55:08 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:08 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:16 +0800
Subject: [PATCH ath-next 02/19] wifi: ath12k: refactor REO CMD ring
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-2-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: -mPKrR9c7Ftlixg9Ptifa8eJ7RdaiI7A
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69435efd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N_EWgtucFCvFHXU7mioA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -mPKrR9c7Ftlixg9Ptifa8eJ7RdaiI7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXyRYN2WhBVROa
 T1nZLdC2Hm66dMFw5FzgArwf9R1FJh8KTWJWzF58Gw1PO795Q3+VnpWCJJcaWv2YMJD/cSxg4XO
 C/VuJUQXNUr9DGq7om24jyf+1Ao2Qhr64KRO87vGl2g7klHCwkOvQECdtKtAGClyuwQhbqKE6qr
 SbHPDboNz+DYWd6bQFqmAgsavf5z0l06J0+AML3ZcHU2FEo06CyUoWCe5BakWlzO1PvMrpocN2E
 5M/N2hfZDFBomneXCPG8apK3XjIY5+dY18AcqE3rFEzZzVJTEzG+RgfzFy+cSZKbNC4BbIToqIq
 hlb4yKDwFZ0g6B2avdMalnyPXYMj+AYq7sozDJxiMVTkwobxd1PNvDI4nmxPfcpPUvAYjbskpVh
 tDizdsNKdBgLHfAx8hHJcu7JKXWclQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175510_612897_4D31B4DA 
X-CRM114-Status: GOOD (  17.14  )
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

The entry of REO CMD ring of existing chips has a 64 bit TLV header, hence
below functions take a 64 bit TLV assumption by default

        ath12k_wifi7_hal_reo_init_cmd_ring()
        ath12k_wifi7_hal_reo_cmd_queue_stats()
        ath12k_wifi7_hal_reo_cmd_flush_cache()
        ath12k_wifi7_hal_reo_cmd_update_rx_queue()

However this is not the case for QCC2072 of which the TLV is 32 bit,
meaning above functions don't work for it.

Rename/refactor above functions to prepare for QCC2072 support:

Rename the first one to ath12k_wifi7_hal_reo_init_cmd_ring_tlv64() to
better reflect what it is doing. There will be a 32 bit variant when
QCC2072 support is in place.

For the last ones, remove TLV length assumption and offload TLV encoding
work to a newly added callback _reo_cmd_enc_tlv_hdr. This way each chip
can register its own handler hence can do the work accordingly.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c              | 11 ++++++
 drivers/net/wireless/ath/ath12k/hal.h              | 23 +++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h   | 21 ------------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  3 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     | 39 +++++++++-------------
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h     |  4 +--
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  3 +-
 7 files changed, 56 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index c7a152490fa0..b19bec8ea082 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -823,3 +823,14 @@ void ath12k_hal_dump_srng_stats(struct ath12k_base *ab)
 				   jiffies_to_msecs(jiffies - srng->timestamp));
 	}
 }
+
+void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len)
+{
+	struct hal_tlv_64_hdr *tlv64 = tlv;
+
+	tlv64->tl = le64_encode_bits(tag, HAL_TLV_HDR_TAG) |
+		    le64_encode_bits(len, HAL_TLV_HDR_LEN);
+
+	return tlv64->value;
+}
+EXPORT_SYMBOL(ath12k_hal_encode_tlv64_hdr);
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index f23ba1f9eaac..595e49046471 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1426,8 +1426,30 @@ struct hal_ops {
 					 u32 *sw_cookie,
 					 struct ath12k_buffer_addr **pp_buf_addr,
 					 u8 *rbm, u32 *msdu_cnt);
+	void *(*reo_cmd_enc_tlv_hdr)(void *tlv, u64 tag, u64 len);
 };
 
+#define HAL_TLV_HDR_TAG		GENMASK(9, 1)
+#define HAL_TLV_HDR_LEN		GENMASK(25, 10)
+#define HAL_TLV_USR_ID		GENMASK(31, 26)
+
+#define HAL_TLV_ALIGN	4
+
+struct hal_tlv_hdr {
+	__le32 tl;
+	u8 value[];
+} __packed;
+
+#define HAL_TLV_64_HDR_TAG		GENMASK(9, 1)
+#define HAL_TLV_64_HDR_LEN		GENMASK(21, 10)
+#define HAL_TLV_64_USR_ID		GENMASK(31, 26)
+#define HAL_TLV_64_ALIGN		8
+
+struct hal_tlv_64_hdr {
+	__le64 tl;
+	u8 value[];
+} __packed;
+
 dma_addr_t ath12k_hal_srng_get_tp_addr(struct ath12k_base *ab,
 				       struct hal_srng *srng);
 dma_addr_t ath12k_hal_srng_get_hp_addr(struct ath12k_base *ab,
@@ -1515,4 +1537,5 @@ void ath12k_hal_rx_reo_ent_buf_paddr_get(struct ath12k_hal *hal, void *rx_desc,
 					 dma_addr_t *paddr, u32 *sw_cookie,
 					 struct ath12k_buffer_addr **pp_buf_addr,
 					 u8 *rbm, u32 *msdu_cnt);
+void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
index 9dad8f7ca9f2..cdcf24b1d6eb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
@@ -487,27 +487,6 @@ enum hal_tlv_tag {
 	HAL_TLV_BASE						= 511 /* 0x1ff */,
 };
 
-#define HAL_TLV_HDR_TAG		GENMASK(9, 1)
-#define HAL_TLV_HDR_LEN		GENMASK(25, 10)
-#define HAL_TLV_USR_ID          GENMASK(31, 26)
-
-#define HAL_TLV_ALIGN	4
-
-struct hal_tlv_hdr {
-	__le32 tl;
-	u8 value[];
-} __packed;
-
-#define HAL_TLV_64_HDR_TAG		GENMASK(9, 1)
-#define HAL_TLV_64_HDR_LEN		GENMASK(21, 10)
-#define HAL_TLV_64_USR_ID		GENMASK(31, 26)
-#define HAL_TLV_64_ALIGN		8
-
-struct hal_tlv_64_hdr {
-	__le64 tl;
-	u8 value[];
-} __packed;
-
 #define RX_MPDU_DESC_INFO0_MSDU_COUNT		GENMASK(7, 0)
 #define RX_MPDU_DESC_INFO0_FRAG_FLAG		BIT(8)
 #define RX_MPDU_DESC_INFO0_MPDU_RETRY		BIT(9)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index c129e937132b..ff26e9684e9e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -1020,7 +1020,7 @@ const struct hal_ops hal_qcn9274_ops = {
 	.write_reoq_lut_addr = ath12k_wifi7_hal_write_reoq_lut_addr,
 	.write_ml_reoq_lut_addr = ath12k_wifi7_hal_write_ml_reoq_lut_addr,
 	.setup_link_idle_list = ath12k_wifi7_hal_setup_link_idle_list,
-	.reo_init_cmd_ring = ath12k_wifi7_hal_reo_init_cmd_ring,
+	.reo_init_cmd_ring = ath12k_wifi7_hal_reo_init_cmd_ring_tlv64,
 	.reo_hw_setup = ath12k_wifi7_hal_reo_hw_setup,
 	.reo_shared_qaddr_cache_clear = ath12k_wifi7_hal_reo_shared_qaddr_cache_clear,
 	.rx_buf_addr_info_set = ath12k_wifi7_hal_rx_buf_addr_info_set,
@@ -1029,4 +1029,5 @@ const struct hal_ops hal_qcn9274_ops = {
 	.get_idle_link_rbm = ath12k_wifi7_hal_get_idle_link_rbm,
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
+	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
 };
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
index 903fb52a03bf..3b8710a3b6ad 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
@@ -23,15 +23,13 @@ void ath12k_wifi7_hal_reo_set_desc_hdr(struct hal_desc_header *hdr,
 	hdr->info0 |= le32_encode_bits(magic, HAL_DESC_HDR_INFO0_DBG_RESERVED);
 }
 
-static int ath12k_wifi7_hal_reo_cmd_queue_stats(struct hal_tlv_64_hdr *tlv,
+static int ath12k_wifi7_hal_reo_cmd_queue_stats(struct ath12k_hal *hal, void *tlv,
 						struct ath12k_hal_reo_cmd *cmd)
 {
 	struct hal_reo_get_queue_stats *desc;
 
-	tlv->tl = le64_encode_bits(HAL_REO_GET_QUEUE_STATS, HAL_TLV_HDR_TAG) |
-		  le64_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
-
-	desc = (struct hal_reo_get_queue_stats *)tlv->value;
+	desc = hal->ops->reo_cmd_enc_tlv_hdr(tlv, HAL_REO_GET_QUEUE_STATS,
+					     sizeof(*desc));
 	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
@@ -47,8 +45,7 @@ static int ath12k_wifi7_hal_reo_cmd_queue_stats(struct hal_tlv_64_hdr *tlv,
 	return le32_get_bits(desc->cmd.info0, HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
 }
 
-static int ath12k_wifi7_hal_reo_cmd_flush_cache(struct ath12k_hal *hal,
-						struct hal_tlv_64_hdr *tlv,
+static int ath12k_wifi7_hal_reo_cmd_flush_cache(struct ath12k_hal *hal, void *tlv,
 						struct ath12k_hal_reo_cmd *cmd)
 {
 	struct hal_reo_flush_cache *desc;
@@ -61,10 +58,8 @@ static int ath12k_wifi7_hal_reo_cmd_flush_cache(struct ath12k_hal *hal,
 		hal->current_blk_index = avail_slot;
 	}
 
-	tlv->tl = le64_encode_bits(HAL_REO_FLUSH_CACHE, HAL_TLV_HDR_TAG) |
-		  le64_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
-
-	desc = (struct hal_reo_flush_cache *)tlv->value;
+	desc = hal->ops->reo_cmd_enc_tlv_hdr(tlv, HAL_REO_FLUSH_CACHE,
+					     sizeof(*desc));
 	memset_startat(desc, 0, cache_addr_lo);
 
 	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
@@ -98,15 +93,13 @@ static int ath12k_wifi7_hal_reo_cmd_flush_cache(struct ath12k_hal *hal,
 }
 
 static int
-ath12k_wifi7_hal_reo_cmd_update_rx_queue(struct hal_tlv_64_hdr *tlv,
+ath12k_wifi7_hal_reo_cmd_update_rx_queue(struct ath12k_hal *hal, void *tlv,
 					 struct ath12k_hal_reo_cmd *cmd)
 {
 	struct hal_reo_update_rx_queue *desc;
 
-	tlv->tl = le64_encode_bits(HAL_REO_UPDATE_RX_REO_QUEUE, HAL_TLV_HDR_TAG) |
-		  le64_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
-
-	desc = (struct hal_reo_update_rx_queue *)tlv->value;
+	desc = hal->ops->reo_cmd_enc_tlv_hdr(tlv, HAL_REO_UPDATE_RX_REO_QUEUE,
+					     sizeof(*desc));
 	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
@@ -227,7 +220,8 @@ int ath12k_wifi7_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 				  enum hal_reo_cmd_type type,
 				  struct ath12k_hal_reo_cmd *cmd)
 {
-	struct hal_tlv_64_hdr *reo_desc;
+	struct ath12k_hal *hal = &ab->hal;
+	void *reo_desc;
 	int ret;
 
 	spin_lock_bh(&srng->lock);
@@ -241,14 +235,13 @@ int ath12k_wifi7_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 
 	switch (type) {
 	case HAL_REO_CMD_GET_QUEUE_STATS:
-		ret = ath12k_wifi7_hal_reo_cmd_queue_stats(reo_desc, cmd);
+		ret = ath12k_wifi7_hal_reo_cmd_queue_stats(hal, reo_desc, cmd);
 		break;
 	case HAL_REO_CMD_FLUSH_CACHE:
-		ret = ath12k_wifi7_hal_reo_cmd_flush_cache(&ab->hal, reo_desc,
-							   cmd);
+		ret = ath12k_wifi7_hal_reo_cmd_flush_cache(hal, reo_desc, cmd);
 		break;
 	case HAL_REO_CMD_UPDATE_RX_QUEUE:
-		ret = ath12k_wifi7_hal_reo_cmd_update_rx_queue(reo_desc, cmd);
+		ret = ath12k_wifi7_hal_reo_cmd_update_rx_queue(hal, reo_desc, cmd);
 		break;
 	case HAL_REO_CMD_FLUSH_QUEUE:
 	case HAL_REO_CMD_UNBLOCK_CACHE:
@@ -891,8 +884,8 @@ void ath12k_wifi7_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
 					  REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3);
 }
 
-void ath12k_wifi7_hal_reo_init_cmd_ring(struct ath12k_base *ab,
-					struct hal_srng *srng)
+void ath12k_wifi7_hal_reo_init_cmd_ring_tlv64(struct ath12k_base *ab,
+					      struct hal_srng *srng)
 {
 	struct hal_srng_params params;
 	struct hal_tlv_64_hdr *tlv;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index 8a0f4a781d8a..aa1bca813955 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -860,8 +860,8 @@ void ath12k_wifi7_hal_rx_msdu_list_get(struct ath12k *ar,
 				       void *link_desc,
 				       void *msdu_list_opaque,
 				       u16 *num_msdus);
-void ath12k_wifi7_hal_reo_init_cmd_ring(struct ath12k_base *ab,
-					struct hal_srng *srng);
+void ath12k_wifi7_hal_reo_init_cmd_ring_tlv64(struct ath12k_base *ab,
+					      struct hal_srng *srng);
 void ath12k_wifi7_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab);
 void ath12k_wifi7_hal_reo_hw_setup(struct ath12k_base *ab, u32 ring_hash_map);
 void ath12k_wifi7_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 7108cc41536d..49c45431c0c7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -793,7 +793,7 @@ const struct hal_ops hal_wcn7850_ops = {
 	.write_reoq_lut_addr = ath12k_wifi7_hal_write_reoq_lut_addr,
 	.write_ml_reoq_lut_addr = ath12k_wifi7_hal_write_ml_reoq_lut_addr,
 	.setup_link_idle_list = ath12k_wifi7_hal_setup_link_idle_list,
-	.reo_init_cmd_ring = ath12k_wifi7_hal_reo_init_cmd_ring,
+	.reo_init_cmd_ring = ath12k_wifi7_hal_reo_init_cmd_ring_tlv64,
 	.reo_shared_qaddr_cache_clear = ath12k_wifi7_hal_reo_shared_qaddr_cache_clear,
 	.reo_hw_setup = ath12k_wifi7_hal_reo_hw_setup,
 	.rx_buf_addr_info_set = ath12k_wifi7_hal_rx_buf_addr_info_set,
@@ -802,4 +802,5 @@ const struct hal_ops hal_wcn7850_ops = {
 	.get_idle_link_rbm = ath12k_wifi7_hal_get_idle_link_rbm,
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
+	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
 };

-- 
2.25.1


