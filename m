Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155E8D25042
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=; b=UJtz/brkW/abi5PnFO3P8xQV87
	WN8hrBKMvBxgPc77oYlxw9ybAnJ3e+/Q6sMJu/m62cLQlb7mPSBp6G9DFDFp4nFqpJWCNlU1c40Kg
	ex95KXrMYEc7QsiTcQ6wsb3qNLd7UzkdC05ffG+xKLRm+9a/Q+ybJ601cT44aMz21BGNhYBVTQnRL
	7N0Odkbazy4V5FcQliTUkeLelwqe/uBXEbovfivDMiS1VgpUPRMhZyM6gLz+fuxfv8bx4rH4zp7/h
	RNzQeCMh/bO/crXWaq2O4hbyIXOeJtusYAaeh/dz+EY+RX3SZExUk0VxpWzp7fiJUg46kuZeLf2ry
	h+AZwb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUR-00000004tkn-31QV;
	Mon, 12 Jan 2026 07:37:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUK-00000004tbM-2nn0
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BLjG0d3923462
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=; b=inTx+tu6QOU8rP0l
	SZv4hgopu7iTPwuTmFzXuhvia2uIMmxLtj+1VdWWjKh30VisXSe3xRIc8zq0KO17
	wOsz6crVc2Q3OpdgieFUu8CIHYdMrDAFUuf/9WdI9bMKgJomX1dH3k5Zs9kiRNY8
	nj71on+qepZwYrAKxO3jqrpkLEgefnDKFMdk6A13xi4qrTqZIKNUdex46vNUrcFr
	i0fthT1NApzQ9d7MoMD7w0yTBVtjtXulyVaYcvJcpZIGtmz0UeKwYaUsH9+WInt9
	MVqtOcsrUrCsQwnxzZKv361tJm1yaa8WoJtiJ2KkfjhJLX86sIo8BhxT8Qo4zRlO
	g5EFxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhakxdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so1670200a12.3
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203439; x=1768808239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=;
        b=EyV78R3a4sjaVkPQw89+aTJprZuWumxTBdTIzABQKiovDFx47rRE+48fQyGfRhIFE2
         Qkv9BIIPqYccFSGCV32AqOnYthjSBjzrvc87mc7wYw0dCB8y/HTf4p43WgVUdrsp/+Gt
         +5n/UCAXeb2hUH+kLKed1PZ4lsG0OrEEgY7cxjYVcoXRyTPAdJ4dzyIuDwLMN3PyaHNy
         fOXLhNMKlVQ5vr6mQEdH+uF/d91f8ySXkKxKjsBxwGUyYetHOqLcvQMTzq3ZtvwIk/SL
         Drpa5tgqU7ePHAFdc5uMiQQR54x59VQDGgQdr6gukU7QHCMp5wEMSPdHm3C9x9oV1or+
         nMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203439; x=1768808239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jZvo/PgqxxzPt/YAqJn18tnE7p169uzy9Tl+w5hbSkY=;
        b=wuOinvGprqMQ9cmOwgE8YKlD4QsVPvxwqcAiaDTSibbJV3yi1TxsKCjBKA+CDIE40D
         BhO8WZY2U9KLKHhJPhI+VZAS7YjV6sNDVJ5zOTQKxUTfk/Wu1GnMq3j8EdWfV5hdUaLA
         dmGGDeIcbKfER864rd1vw7a6+r3nohBCo7PK775xbgh/CuMz6vNHaOC2uKznY4QIHmJg
         1yvFoiJ/uHGxaW9JF9wut52pOBFcuUxcYk8pTeJepRZuD6MZBzxYDjiPSOPjquG9kNxb
         rCfoeYJHFCUaeMtY3Ap4Xm49FagDyge0zUJdCh0LBXcsk1M4o03qaeb2eUPK74kQ1gx/
         CYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3oJ25PIzrkjVZNb3p7erqaPRhQULdRPC7bmUT7m1JoAdtFCqvveEWBSokJnR3TxxtOEhZuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiJxWeLIoyHuTBf96PA5Mp5NP7oDMJxBjsve/QYfbTMAyBCOXB
	kFriIwb2aZAj8y9GUj+2nf/kYul60l9XEqlc/1NTk35G+9YIzTDJN6ZylFwF+CB89Wsvd9Vr4qH
	xYAy+oGmGV5J2Uu3c2U+nT71JUO4FA/hIlGzDRD2xXhPlGGycNLwlSQb7faWVnvP4gym8k9znDa
	4=
X-Gm-Gg: AY/fxX5fBn2kyrloBu2f/vUjsxea3CuZfe1+Eg7CQyg6oWk4+1AYEltnsPULgY11CH5
	cw9aCd2ZEgpYQX5JIyPt33d2X5HRLCio4b3k50o0KiHjAmB721gkrm3BT7za30tFaAhDy190Hek
	sOELg2Ac085uc2zcxfzg7A5cm9DzR0SWzUMcQhsyvNFWymTEUMq0GQS6vGsIeNA14JmmO+I/Uqn
	7SA8anIh9jxZOV9CKtR1sJTTh6Fh10pDbUUztYt5GbABHwztmtVKqv49Y6UVSzKoeX7HDSMg+py
	Uok9mA6t+licc4YIagqxv5nsa3/AqbIibx6AOQkAAB5l/NYcNA40WHC8NJLUVheCumdEQM+Lok5
	p9BDVKpd8+oEHORwyQo42WmIeaL8TgjoKK9HV0QbB7IeSQh0B3YA2hbXBlKQTVCs=
X-Received: by 2002:a05:6a20:a128:b0:35d:c68e:1b07 with SMTP id adf61e73a8af0-3898f9dd184mr15945311637.54.1768203439177;
        Sun, 11 Jan 2026 23:37:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1/rxOfJLekMUNQmzp5KOfgKmR2v3CCDboTRVLPoF1uWR609h4DZwWU4FFaQhRysawiCRfzg==
X-Received: by 2002:a05:6a20:a128:b0:35d:c68e:1b07 with SMTP id adf61e73a8af0-3898f9dd184mr15945291637.54.1768203438675;
        Sun, 11 Jan 2026 23:37:18 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:18 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:34 +0800
Subject: [PATCH ath-next v2 14/18] wifi: ath12k: handle REO status ring for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-14-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: zGTAVkIvwHHHMt5RTtbykg7Ww-ZaCxj-
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6964a4b0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gK-fc3CfFqufNovLaDoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: zGTAVkIvwHHHMt5RTtbykg7Ww-ZaCxj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfXxeco3VbQrDqe
 WeE9eMi0tzCHrSNZKWuDVs8Pb0MdGyioTNhPf9aX/oYJ7MWE8kqOCm7gEZFLigxp6jKkqxSY+/J
 CkVKQ1HuWRrHMT3JSJxPstWgBtS+mh6bpYb29OSs57MasM6GnheB8HmxssgIzTVJ+HZzJwDqebp
 VECcoT1JGl0Cw5JTSvN2E+/U+Ypy7RUF/r+qL3/ARJxXp2oQK9rzbVTF4/aolmV22lsW7fh8w8U
 ZA/7GIvXpueIxIjfkZUN0fYK3pyic6IAvaoqddqpR3nPTdrOFC8jaukBlOMlgLlh4ZjKH+kqLKG
 tMNrGg9/2SybVkiRlX3xVLRcTXNeC8cPXy1Z8o+4/UQj69Wooh12ngN7x4hauRHNqAHzdisVCP1
 gsEQAdVucrRBvuX67OfLdVjWuQWiF91vlyE3BxA/7LRZDbHeWKbEMMYBiMDJzwC82zgMf6nwmpX
 C4qy10K/2B3z69n8RPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233720_799415_E3086BC5 
X-CRM114-Status: GOOD (  16.67  )
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


