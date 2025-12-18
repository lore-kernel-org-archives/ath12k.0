Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDF8D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=; b=EsBFqRKLrx4PBoOoeO649Gk+15
	8XZFS19L1++r0FsbyLhDAdvOvZQN9dNzwNFWwfhCbxhwI0JBNVJEpPxtvx7oRnmvP4DnuK5E3v3LB
	0Z5lZNyuIYbHmTEi8mnzGZhth6vJ0cXZA50P46NGMSc8mDWD5naklwyfXx/cZv6WAFQI3aQVV1Bgd
	cgTWco7sFZy9SV1dM1LbS5ozexf/wMBDAyswI2U2347mEDC0QeV+9Y9DTQWv11TmsIaEowBcIwN1U
	pOvDkgu1g4uXaJ/7zBlnlaVBAfl6UidhrYLeWZpZzsZRJZRptJQKHcgCeb5z8wBQTXhCiAX+I83CD
	jBpfS7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3F4-00000007gHv-1RAJ;
	Thu, 18 Dec 2025 01:55:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Eu-00000007g6i-0YIF
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YYmr4147955
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=; b=WC213rCr6tb12V10
	d861Fd+JpKoQm9Am8XCQGYOTX2vDkWKh5Wk3dnSABZD90Ttajkmon68m4tlRm7kl
	1xsmlhGxM5SEObveRzeUgkn3M10Hz9A6cE8rL3jnmtS2PpuPjhDWWzvuXkoyUl1l
	JHIKMMV20UvHZED9y1PEMAS+rOe2ItWBqcBIpt/j4pbc+gXXIQ7NBlen3wNQb/Vh
	4nPUFZbc6Y9yoYYrnyDlTv+odhg42+JqIaGeCma8fOEo4L3ZCjhZaGsPSms27hSM
	JnNQfU3Lh4n8gTGCjvDKJOZS6Wsi/QHMaLJvpvlpltTYqGBgAD2RCreAB6z6IRvg
	syW0VA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u798nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0c495fc7aso2019775ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022935; x=1766627735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=;
        b=L8QBR+WU9wx6Gap/tbuqpwEvqxyU8MGiPRSqhxnIb/qjiLzfv3fsWOpsSEn0WLLZ8W
         +D5TrhUKJCJUegTPIv/tqZXt0NeoitmnyNYvc5gjgVb+ug9ha0UJqTWZYDhGOfg+UjWZ
         Sh1s8PbbhvjxB8UagnMwldyQ04/WKBSIpATC2y/Fsrz3pSSHi1Ii+vK7TVjk0q40+xNP
         Gjfbdq7yb0rfYhlOXxp3WDgQZYUqnYiBcIrGcEuPJLxJwvyKZCC6VGeODXKXd0QlD9M4
         eUk3W9goVKrx+0N/arK7QcI3XpjwWbNpVRy+nVSlAVgPxavgEJTR7UdvsJVocir/SpMW
         vAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022935; x=1766627735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=;
        b=ICaIhnlUKUI303TXOrjww4edj4ZlIFaaWeNjUp+mG9XojS181wZ4pcrTH1T5P+xYx1
         53/NumTYajfHd+4/Jfrs07IHKnZ+xvUowYWbgkakDnAcf/fspY25quUMjV6tVZRTVAMR
         8dLpBG76DIALKk1d8m7dzAQirBu1Px8G7GyS0ilbhUDnDSpair/414XjiH6N5AwFY/pf
         K1+pLDj72+xMJoy8F470PdtCG9kHsqGJbFbl2eFtVMDnKXhyC9BkE7QLHjMqKtOp3iQj
         FgUXXMCRfO7LqziU8fLBGGDMqaSJTNnrjXGy6+MwpFSdtAS4oeP6QXXUiAFlKfTWWBUj
         QljQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYhbkZZpR5pgjxRWwNtAg6L8QpWBl8BMee+lLEVkYit/rPGTwTVWNm4RK/Cl6ni2bQWjLYREY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHIzHDV5hsHnI62uTXCmlfOHd+jSvchl3oK0WjkeD6/4lrfOq
	5M6blgAvAoPY12AhFEIGc7G3zBJ3Z2z+sl/FRwB3NJT1UwiFu4OIJYh+e19U4N0SOZy6QmsSOrl
	iEFANbs4ioTQmAAPQodTthBed71KvHiGduUQ3PTepWadELopRWiz4r5zCIfZPfQnzElG8maisHf
	g=
X-Gm-Gg: AY/fxX4f8FrCYsdXlYvp5IkhYmcUPbgYSiosdqt0E+35RzYGHzAUq8dSOjsZINziWk8
	Sn7E8cOKm0otfIal8YCiOfui7GCe3dfBxFaHu5vDtDzMW9oQpKLmVx8LnYk47RK83YgrWdFsu9O
	Sx9RZIYtYsgn1g0Oft/HULbv8zkG9mQAmbzmBDP3lzhGvvZd/xK4RI7vJj+V8IzgDPFKflea8tI
	mVKuuy3dghZxAFYRMfV1ZgtFGkMUt9iClSURV/xaxCAqjwalcu2/BUJntMyU4kT30DWR85ZaU6S
	2zi9QLJZGrZwCgFeUtsAGKyzpfgz9gsYroeDwSOpHXX336n0KXiJlmaFEGrnekoOgk6gIfIz5Yp
	wrNyYxVFbVNwG8MNcBusJwbJSKw72PPihI8KE/oBFWlgiooFINxFw6Snfh4DxBFI=
X-Received: by 2002:a17:903:320b:b0:299:e031:173 with SMTP id d9443c01a7336-29f23c7be2emr224283015ad.35.1766022934672;
        Wed, 17 Dec 2025 17:55:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ1T70JdNTucTwb5NwZg/55VozzIfHt+1/wLS4kLIzpPnRuTWhRR2DZjVwA/ZIzEkpdccoeg==
X-Received: by 2002:a17:903:320b:b0:299:e031:173 with SMTP id d9443c01a7336-29f23c7be2emr224282655ad.35.1766022933927;
        Wed, 17 Dec 2025 17:55:33 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:33 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:29 +0800
Subject: [PATCH ath-next 15/19] wifi: ath12k: handle REO status ring for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-15-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ddx4uF632vjIaUMVUaUAp9KGOyiS47e5
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69435f17 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gK-fc3CfFqufNovLaDoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ddx4uF632vjIaUMVUaUAp9KGOyiS47e5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXyN7c4v3G9HNN
 Sao6cNXWurxI2sPa/WAsabyLscgEGrhB4MJfHqFJLxrRT32/D9zfSIAQMu+339It4gwqKpyTAcz
 JRilykWrGvWH2VDSjPhvBoxHszoH/HWGpHL4RQuWRVUafrdGcT4nSuA0HBCM2U2pD9EdeIW8Q7t
 dMauHI6uyc0MrbL70WMCaLp84Nut3S7DZhqLwzntqrQoNmkRfpnxBFBOe/acUOZdSEMvjxAODZX
 eP43VSBeIyToTTEYMXYA4lQvSarikL6Zy4Z+vrxzLnKawCysTS+HPf4fwDWS8XuciEupryKKGUS
 6XKzqSXIbz0PKoqgpDM2lWknrcJm0AZA24n/jygPKLin4Qx2fOOxrpCMT3pQX4fwfyTfEN9AOdS
 PPNfK9GixGPw5i44ZM7cnwZ0bxxEBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175536_255442_43013B38 
X-CRM114-Status: GOOD (  16.16  )
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

For QCC2072 below REO status descriptors are different compared with
QCN9274/WCN7850:

        hal_reo_get_queue_stats_status
        hal_reo_flush_queue_status
        hal_reo_flush_cache_status
        hal_reo_unblock_cache_status
        hal_reo_flush_timeout_list_status
        hal_reo_desc_thresh_reached_status

Take hal_reo_get_queue_stats_status as an example:

QCC2072:
struct hal_reo_get_queue_stats_status_qcc2072 {
        __le32 tlv32_padding;
        struct hal_reo_get_queue_stats_status status;
} __packed;

QCN9274/WCN7850:
struct hal_reo_get_queue_stats_status;

Besides, QCC2072 has a 32 bits TLV header while QCN9274/WCN7850 has 64.

This means that there is no difference between these 3 devices in layout
of actual fields, because they all start after a 8 bytes offset

QCC2072:
	{
		struct hal_tlv_hdr tlv;
		__le32 tlv32_padding;
		struct hal_reo_get_queue_stats_status status;
	}

QCN9274/WCN7850:
	{
		struct hal_tlv_64_hdr tlv;
		struct hal_reo_get_queue_stats_status status;
	}

Therefore current implementation luckily works for QCC2072 as well.
However it leads to misunderstanding, which should be avoided.

So add individual REO status ring handling for QCC2072.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c               | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h    |  5 +++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 21 ++++++++++++++++++++-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 5ce5e0f89ca8..a164563fff28 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -857,3 +857,15 @@ u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc)
 	return tag;
 }
 EXPORT_SYMBOL(ath12k_hal_decode_tlv64_hdr);
+
+u16 ath12k_hal_decode_tlv32_hdr(void *tlv, void **desc)
+{
+	struct hal_tlv_hdr *tlv32 = tlv;
+	u16 tag;
+
+	tag = le32_get_bits(tlv32->tl, HAL_SRNG_TLV_HDR_TAG);
+	*desc = tlv32->value;
+
+	return tag;
+}
+EXPORT_SYMBOL(ath12k_hal_decode_tlv32_hdr);
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index f322000e8ac9..520587305dfa 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1546,4 +1546,5 @@ void ath12k_hal_rx_reo_ent_buf_paddr_get(struct ath12k_hal *hal, void *rx_desc,
 void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
 void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len);
 u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc);
+u16 ath12k_hal_decode_tlv32_hdr(void *tlv, void **desc);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
index c4c7ca9ee827..e1ab47b44433 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
@@ -2439,6 +2439,11 @@ struct hal_reo_get_queue_stats_status {
  *		entries into this Ring has looped around the ring.
  */
 
+struct hal_reo_get_queue_stats_status_qcc2072 {
+	__le32 tlv32_padding;
+	struct hal_reo_get_queue_stats_status status;
+} __packed;
+
 #define HAL_REO_STATUS_LOOP_CNT			GENMASK(31, 28)
 
 #define HAL_REO_FLUSH_QUEUE_INFO0_ERR_DETECTED	BIT(0)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index 0ae5b073287a..ee2427fadfc1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -425,9 +425,28 @@ static int ath12k_hal_srng_create_config_qcc2072(struct ath12k_hal *hal)
 	s->entry_size = (sizeof(struct hal_tlv_hdr) +
 			 sizeof(struct hal_reo_get_queue_stats_qcc2072)) >> 2;
 
+	s = &hal->srng_config[HAL_REO_STATUS];
+	s->entry_size = (sizeof(struct hal_tlv_hdr) +
+			 sizeof(struct hal_reo_get_queue_stats_status_qcc2072)) >> 2;
+
 	return 0;
 }
 
+static u16 ath12k_hal_reo_status_dec_tlv_hdr_qcc2072(void *tlv, void **desc)
+{
+	struct hal_reo_get_queue_stats_status_qcc2072 *status_tlv;
+	u16 tag;
+
+	tag = ath12k_hal_decode_tlv32_hdr(tlv, (void **)&status_tlv);
+	/*
+	 * actual desc of REO status entry starts after tlv32_padding,
+	 * see hal_reo_get_queue_stats_status_qcc2072
+	 */
+	*desc = &status_tlv->status;
+
+	return tag;
+}
+
 const struct hal_ops hal_qcc2072_ops = {
 	.create_srng_config = ath12k_hal_srng_create_config_qcc2072,
 	.rx_desc_set_msdu_len = ath12k_hal_rx_desc_set_msdu_len_qcc2072,
@@ -468,7 +487,7 @@ const struct hal_ops hal_qcc2072_ops = {
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv32_hdr,
-	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
+	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_qcc2072,
 };
 
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcc2072(void)

-- 
2.25.1


