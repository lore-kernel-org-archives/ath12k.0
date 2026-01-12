Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653EED25040
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=; b=KX4NVbTr+4I3c5L7EYFq6rDf83
	p5vDvtl2zqOCBSS19dFyO9VD25otoDpbpPOlSmfi1RinEgN6D0AKdMm+lawhbUPWgvaWSOlvrTPHg
	EjhxAdz6t7G2zRDHko1f38ezvYs+oEldTV0dFcoWetiddzLKVJz7JvKhnfYNnMweXFfCPWKTYih+M
	9kZUmj1cFWXHtOLiuNqJFoWSpgZtbxzoe7cVxmEE5xRgRN1EBJ1rLXkUXIwmmO+Yuam2M8HbBO/AL
	tYeGi0AeqYa9cUEt2iFqYPjb4/LzOn9osQu93dQtOnLasmhMUIKo7mE+rt79Dfrcgla6zI3DlNnaw
	5oB9iY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUP-00000004tiK-45Vw;
	Mon, 12 Jan 2026 07:37:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUI-00000004taL-43lC
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2O3FK113636
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=; b=QWJlSThVf8sa2q4K
	y45RguH8wCGViIadLoJgOKd+dDyGQmROQaDP0rH4bpHgSeQ+EN/pBa0GkxdkoSos
	nYUtHY/X4CC3wOSqUB1pR2uCAmw48MvDvct7dUJ1QGV6BVqCv2AzHvNh02/siqsb
	fMWB++OSRm6nozOP2L4bAr4cKxza/2Jp+OFbZVtJcJywrGD83H8XkzDFUG4FD/l3
	GJRP//2eMEVYz6CVpccl0HsQohptEn5BhfadN+I3mLsllbO9CXg9itSEozlIz0gl
	5kt1LiNRzfZ8DqrGzuV16jdnIUzjcHwoFrlGX+q0ttI8KrPCSNaR3oBuKEOi5d/Y
	Rt4kYw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ugscv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5659f40515so4333132a12.2
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203438; x=1768808238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=;
        b=Cm5fvILDW4gasJU4IDhJ6c30Ag4bhWdoTqiqVdBrxHPiUqt1UlCa6eMd29NJsLFm7Y
         ENCYYINmJBvC5CoAThQ3E1yUUpnUTaIhZrAdknPlNQAWZZxKZAaK/w58Tao1a+o5Sg/q
         b4vnlqzqZTxW1LthmKwan9oeOZHiKhnRw6qKzdkVgxH+gNSQGvXbLpLzeCHkdYoTHfW1
         GDLtFwk9eblRcQZnPdwYl7ft2PPS/ChSEsVRz72EuG81PDymcHDpbmGzvBvF0rvEnY7J
         YCAUEP/YXfLn4Qi8m3Gj2AV35drruh1wlCw1qoOYXbPFUNdqDCfYg8xmxfL6rTITIbDT
         NF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203438; x=1768808238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=;
        b=DnOBPh5oYrrjGZ10ngTqb5VFaQT2qgM2dME1NECdBiNC+SjIQK+70jqxgTMorkvbc9
         EC+tzFbCNhLmkyN5Wh5SRCC62iKruD6QFhSsL9SySbsrlkC1AkAcjau34U7+hqs7IxDu
         9PRqWMEFrXatXCXA4VvzdBsqTLwkjAlLPUd+9ppQISghml6gfkW+zx0w8Ui+vHltZZpc
         0gr9GWtnvE/l8fk1LAf0RfJTTXtTVFErcufTWe6S++CaoH/tIYPtu+xbaT+BB76rPgs1
         hQDoABuw6fkdeaiZiPzLfJ+4BFjQ0RJ129N3uskBi9um3xZCv5el36bbGyj8vpCwIsVu
         N1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVkMOy7+KYapFkaZRP9wVHolxxmWTRXrM/2+EXcq6BLsqcaL7mqx7h4WzdbCOhTnZ9gJvlk0BU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFj2fvHa6dVmlgqboKuNh9/DN7EQNQrEIZ+IEDLk7uO7YKQNx
	QMkfuLY1G7DiqNJs65ifa+rZydjNLkzX4qWeqL2Q2fDuxhdkfMjcjUXcZkyy65rP1hcrghEMaD9
	PheyRAzCMsThUpiIQZ6uIrUQ+j4qjCfgsRVWFCA8ZeY/f25EyDgSoyQMFZTalGLCqda/Zx4fQD2
	4=
X-Gm-Gg: AY/fxX4BVLCQA8po1YaLcQiPrYCG0GA/jNEJBLUiy3R6YIDh90RPYiX8CdALGNhP4z+
	+PdVkTogZUe1mgahK+JFSeKARboeJmxYCDhVKIvkkkylZHvdPEEgU+ULCHKLT6sCvF/DgglH4Zk
	brQN28oA7ZW+Kkh8+dIcdLmFnx/IdoL8hXrdl+ripAJDo0Tw1C4WR6fjadwDmFDTQx7u7XwgY3H
	t0DdUfsYEnbs5UX3F2elCiBfvuQ9/YcM1Zlg9WGH7xdFxH/CV//aTUSF9sKrBJGzyt8xYRGrgM2
	RHnLtcYzxWmElo7vOCBRSAZrqO3Mow8gyTAq683pAomhk/5gh6wVLsmJzv78mnOm67WeLZRnZSk
	t/Fn4Huw2Ry9xuzAsJJOGFOl/Ea/5VxkmZX0j74fGQVziQGoTSw4Aj8cWlB0quCQ=
X-Received: by 2002:a05:6a21:7a48:b0:34e:a801:8166 with SMTP id adf61e73a8af0-3898f923739mr13191355637.32.1768203437459;
        Sun, 11 Jan 2026 23:37:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLaTEE3XoeVlTTVh97NjGjIR8OO/m3gjse8XJWaPhp9KYQmYnOcWMnW1Fn475oe/2EBWKpQA==
X-Received: by 2002:a05:6a21:7a48:b0:34e:a801:8166 with SMTP id adf61e73a8af0-3898f923739mr13191343637.32.1768203436978;
        Sun, 11 Jan 2026 23:37:16 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:16 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:33 +0800
Subject: [PATCH ath-next v2 13/18] wifi: ath12k: handle REO CMD ring for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-13-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX1UD22FgbCgOL
 XgJPosP9hOMg9oS3A7oHZdqNLV8ixbqWb0Ntmgc1sYgF6/0Uz6CVbQMFcgokjkCgi3EXefhSbfY
 E5kTB5BBcEZHIORlIxz3ByeMAfg0oDY1aw89/Uvvnjxu39anor4a9OCod/mJBMfz/xodSD0qD8d
 Tez6Lv/U/lc5JFnVibhnVxrBuDN7PJnmK6Vn6kRjbFKcBFhRw9wVPJvq7DkGlWWORKUrv8un+G1
 iZHPAyf9jZvh7xgnRXd77Sp/L6ttGHgTW6KV+GXT5uHx/mSYDq4tM2bdC+PIsXa9Z9oRXOvdYGh
 WyT/WvW2J/Ab9vxc2henA5RR/N5G8bdoLkiGSnOfG5Q6haD4/LLUJmagOBCPE8UQaV4IWHreavd
 ihbL9Wb3PXkowdOAkqwV3ynlRpTRUGvTlOM6z/v+xRjHpxHkgeM3lnUnR1tRu9S0BDqwGyV6bFc
 W7NprX8c4nxPGU976AA==
X-Proofpoint-ORIG-GUID: Y8ifVMrEUJoMQOI7gCq61324XgQ3eZZN
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964a4ae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FdA_q80-M5M2ZQSmf9kA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Y8ifVMrEUJoMQOI7gCq61324XgQ3eZZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233719_285615_177C151F 
X-CRM114-Status: GOOD (  22.62  )
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

As far as REO CMD ring is concerned, there are two differences between
QCC2072 and the existing chips:

For the first, the TLV header of ring descriptor for QCC2072 is 32 bits
while 64 bits for existing chips.

For the second, QCC2072 has different hal_reo_get_queue_stats,
hal_reo_flush_cache and hal_reo_update_rx_queue structures. Take
hal_reo_get_queue_stats as an example:

QCC2072:
struct hal_reo_get_queue_stats_qcc2072 {
        struct hal_reo_cmd_hdr cmd;
        [...]
        __le32 rsvd0[6];
} __packed;

QCN9274/WCN7850:
struct hal_reo_get_queue_stats {
        struct hal_reo_cmd_hdr cmd;
        [...]
        __le32 rsvd0[6];
        __le32 tlv64_pad;
} __packed;

Note there is no tlv64_pad at the end for QCC2072, but all other
former fields share the same layout.

These make different ring entry size, so that parameter has to be updated
with respect to existing chips. This is done in the newly introduced
ath12k_hal_srng_create_config_qcc2072() function, which first creates all
ring configs by utilizing ath12k_hal_srng_create_config_wcn7850() and then
updates the individual field.

Besides, the REO command TLV encoding also need to be corrected because of
the different TLV bits. This is done by introducing a 32 bit variant for
each of the existing 64 bit callback.

Note the hal_reo_get_queue_stats_qcc2072 structure is introduced for the
purpose of calculating ring entry size. Existing hal_reo_get_queue_stats
structure gets used elsewhere even for QCC2072. This is working because
the only difference is the tlv64_pad field that is located at the end and
not getting used, hence can be ignored.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.c              | 11 ++++++++++
 drivers/net/wireless/ath/ath12k/hal.h              |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h   |  7 ++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 22 ++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     | 25 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h     |  2 ++
 6 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index bafb49ab5475..5ce5e0f89ca8 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -835,6 +835,17 @@ void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len)
 }
 EXPORT_SYMBOL(ath12k_hal_encode_tlv64_hdr);
 
+void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len)
+{
+	struct hal_tlv_hdr *tlv32 = tlv;
+
+	tlv32->tl = le32_encode_bits(tag, HAL_TLV_HDR_TAG) |
+		    le32_encode_bits(len, HAL_TLV_HDR_LEN);
+
+	return tlv32->value;
+}
+EXPORT_SYMBOL(ath12k_hal_encode_tlv32_hdr);
+
 u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc)
 {
 	struct hal_tlv_64_hdr *tlv64 = tlv;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 94ecc035fc49..f322000e8ac9 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1544,5 +1544,6 @@ void ath12k_hal_rx_reo_ent_buf_paddr_get(struct ath12k_hal *hal, void *rx_desc,
 					 struct ath12k_buffer_addr **pp_buf_addr,
 					 u8 *rbm, u32 *msdu_cnt);
 void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
+void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len);
 u16 ath12k_hal_decode_tlv64_hdr(void *tlv, void **desc);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
index cdcf24b1d6eb..c4c7ca9ee827 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
@@ -1049,6 +1049,13 @@ struct hal_reo_get_queue_stats {
  *		Hole_count
  */
 
+struct hal_reo_get_queue_stats_qcc2072 {
+	struct hal_reo_cmd_hdr cmd;
+	__le32 queue_addr_lo;
+	__le32 info0;
+	__le32 rsvd0[6];
+} __packed;
+
 #define HAL_REO_FLUSH_QUEUE_INFO0_DESC_ADDR_HI		GENMASK(7, 0)
 #define HAL_REO_FLUSH_QUEUE_INFO0_BLOCK_DESC_ADDR	BIT(8)
 #define HAL_REO_FLUSH_QUEUE_INFO0_BLOCK_RESRC_IDX	GENMASK(10, 9)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index 522b94b04f9f..0ae5b073287a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -412,8 +412,24 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(rx_desc);
 }
 
+static int ath12k_hal_srng_create_config_qcc2072(struct ath12k_hal *hal)
+{
+	struct hal_srng_config *s;
+	int ret;
+
+	ret = ath12k_hal_srng_create_config_wcn7850(hal);
+	if (ret)
+		return ret;
+
+	s = &hal->srng_config[HAL_REO_CMD];
+	s->entry_size = (sizeof(struct hal_tlv_hdr) +
+			 sizeof(struct hal_reo_get_queue_stats_qcc2072)) >> 2;
+
+	return 0;
+}
+
 const struct hal_ops hal_qcc2072_ops = {
-	.create_srng_config = ath12k_hal_srng_create_config_wcn7850,
+	.create_srng_config = ath12k_hal_srng_create_config_qcc2072,
 	.rx_desc_set_msdu_len = ath12k_hal_rx_desc_set_msdu_len_qcc2072,
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcc2072,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcc2072,
@@ -443,7 +459,7 @@ const struct hal_ops hal_qcc2072_ops = {
 	.write_reoq_lut_addr = ath12k_wifi7_hal_write_reoq_lut_addr,
 	.write_ml_reoq_lut_addr = ath12k_wifi7_hal_write_ml_reoq_lut_addr,
 	.setup_link_idle_list = ath12k_wifi7_hal_setup_link_idle_list,
-	.reo_init_cmd_ring = ath12k_wifi7_hal_reo_init_cmd_ring_tlv64,
+	.reo_init_cmd_ring = ath12k_wifi7_hal_reo_init_cmd_ring_tlv32,
 	.reo_hw_setup = ath12k_wifi7_hal_reo_hw_setup,
 	.rx_buf_addr_info_set = ath12k_wifi7_hal_rx_buf_addr_info_set,
 	.rx_buf_addr_info_get = ath12k_wifi7_hal_rx_buf_addr_info_get,
@@ -451,7 +467,7 @@ const struct hal_ops hal_qcc2072_ops = {
 	.get_idle_link_rbm = ath12k_wifi7_hal_get_idle_link_rbm,
 	.rx_msdu_list_get = ath12k_wifi7_hal_rx_msdu_list_get,
 	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
-	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
+	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv32_hdr,
 	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
index a88ef126aada..49c693289709 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
@@ -890,6 +890,31 @@ void ath12k_wifi7_hal_reo_init_cmd_ring_tlv64(struct ath12k_base *ab,
 	}
 }
 
+void ath12k_wifi7_hal_reo_init_cmd_ring_tlv32(struct ath12k_base *ab,
+					      struct hal_srng *srng)
+{
+	struct hal_reo_get_queue_stats *desc;
+	struct hal_srng_params params;
+	struct hal_tlv_hdr *tlv;
+	int i, cmd_num = 1;
+	int entry_size;
+	u8 *entry;
+
+	memset(&params, 0, sizeof(params));
+
+	entry_size = ath12k_hal_srng_get_entrysize(ab, HAL_REO_CMD);
+	ath12k_hal_srng_get_params(ab, srng, &params);
+	entry = (u8 *)params.ring_base_vaddr;
+
+	for (i = 0; i < params.num_entries; i++) {
+		tlv = (struct hal_tlv_hdr *)entry;
+		desc = (struct hal_reo_get_queue_stats *)tlv->value;
+		desc->cmd.info0 = le32_encode_bits(cmd_num++,
+						   HAL_REO_CMD_HDR_INFO0_CMD_NUMBER);
+		entry += entry_size;
+	}
+}
+
 void ath12k_wifi7_hal_reo_hw_setup(struct ath12k_base *ab, u32 ring_hash_map)
 {
 	struct ath12k_hal *hal = &ab->hal;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index 95f5595b30ad..ac2a8ac03288 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -864,6 +864,8 @@ void ath12k_wifi7_hal_rx_msdu_list_get(struct ath12k *ar,
 				       u16 *num_msdus);
 void ath12k_wifi7_hal_reo_init_cmd_ring_tlv64(struct ath12k_base *ab,
 					      struct hal_srng *srng);
+void ath12k_wifi7_hal_reo_init_cmd_ring_tlv32(struct ath12k_base *ab,
+					      struct hal_srng *srng);
 void ath12k_wifi7_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab);
 void ath12k_wifi7_hal_reo_hw_setup(struct ath12k_base *ab, u32 ring_hash_map);
 void ath12k_wifi7_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,

-- 
2.25.1


