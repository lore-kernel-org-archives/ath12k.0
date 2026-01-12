Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132E0D25040
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=; b=TeNUUx0PFGFAtSgUnc1NeNRZBh
	jjCq0Rhj7kUQsJ3FXMFqbWg71ErRZ0AWPaaRZ0xwR06WSbh0nw6/ee+Dly58nvEvzOQV26oCgoqWc
	NgNRdSlybvcxjJISoQ5aKx/kFiSXoxGbmYyDhs3lEmyu4PfHVmpxwjQ6u5OKrpsHbl+CT+PqokrX5
	VJIgqOTnwInyBwMWy6U2K5inwGImoFdG1tZg5y8CYPSGc28hQRopn/A5bayUkUgGQYMPYib47K19x
	4W40yoAF9hvi+P7lKYskbGvimEf+/g2uv7+SK+nRS4d9wrOSaMtv9pLvUEmKZ4qBr9pQcHgQuQXSp
	15EAoTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU4-00000004tM4-3Qn3;
	Mon, 12 Jan 2026 07:37:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU2-00000004tKG-1XjO
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C5hBwo2044567
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=; b=aXI1suS3+VpNjHTm
	I472u9KF3HGPbvKi/oZcfYxkla/2OJ3TBI1CRjA/EbvwpEzjmXwFI/zJN4DcETrK
	N40ZUOlDC5oqqpF5pdbyxKhAGEpOb2M9JKinIPsDtGfDfvLEDz75PCau/+I86bMj
	u6kLV9wweikrvIKpMLeWB7G8EdZ+pPbJeV82CytyIckBkd7e5SITztFs6NlxlrX5
	+g2mvFER136bzoTBsPLPjMBpgLdg00XEDban86sc9bfH2qKLVtf6SWiaq7hMhXw3
	GgiVxTij3/21u2rZNbEJ278AKcBVnSpzCEg4ZqKS8xr4sYXvBvtAeiBgPwL/mgLX
	1/v7NA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4172-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c552d1f9eafso4397325a12.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203420; x=1768808220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=;
        b=Faq17i4K+8G7DR9zV5UUrAI4k+WPe7083xyNaO8DtRUG7D1jyNwyQhSmoc76ZL3Ex2
         zoyQrIOPydexQL1ZbN/8WtszSzuIjiLXS6Y2u6YG3Jub/4/sDfElhvDI5uGcQRIxeX4F
         kdnCi9vcH9kfje12EEpmloC0mP7V/CqCsKTBcRDAbJk9ew38hWJ2lqNMo+BR6FfyWr6X
         es47TsxCVwu2b55jUUsoVu3NQ2HeFE+xSegLg/mqPBGO+tBTgYIQic0LlwlgKlrfff6k
         0ZZo7fdEXshrl6CRgR912j07d1DOqdMFPfeCo1UbeT8D/fnovEBuvtjVZA+46/483qjb
         TAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203420; x=1768808220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJk3Q0+MS5u8Oi6Z4LN2M/8NwLLBO3cAu0s+bHFvby8=;
        b=e/XpqEi/WISunEKq8+yjbvsMHSp20lyS/vGGMinlb67LGVY9bG3za/X+fTyKBuT5+l
         oTkYY+OMO7bsRb5JlliwVVtUPTDuJlG8m8QIl5MhutsYP2uW7Z0xUFwawi31jhj7XRk/
         gog5oLSLzpBaZH+WcQaNHQFj3HnD8cDFivuG8WEGx824ge0oWBHAxBgGc0w+JcXJP95E
         6ZKlciXjK4CaVuTkKT4KThwfxrR8rQvkxZ4xsjAeDNQRRJzuRsONvvl9Pz0T9LqFJXux
         H765jmSlu/49mA36a8EHM5YXHIfP9WAG+MzcGojPEOKbDlLty+r6rDgiHCT29FKkkPV6
         4mlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVYKZDPcbXpW9StshqsEPnMDsx8q5a4kgoF9nEiXojefq/j0ClbYmNoKs0szqErQA0HIbD7yA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAB6II78He+C8KSJSyQKOxVWc6E0jvSzzTRjIVv6n6pvqVht5M
	+i4kMY68IY2dHWVJYgWWHoW4VGC5aK3JGuJN1leDeHZIta+jJUmllSh9SSQxf3LY5VkNVeEXp9E
	Shv9vI+tWPGW4FnFwmKwGvzCw/CiBG9dZDjxr2XjE8miI/UFJUu7nbgMJOkQOhdUq340sTcdNDC
	4=
X-Gm-Gg: AY/fxX7RtyuWTCP6UTA6/551jUrksLdYXhLJrk6kJWJiw/SZHNSHZMZMVwlxQuuO7hZ
	MGNkFDLh3ovllsmXPgyznnJT9QVYpKNscDkm87mlnlUN2ptD/DL/FMnR6j4/KYitHXnplpAYd5b
	tRWuO+0KrSuKOr0qcQRDj6ookDVumAjzXJUMhFM+U8tCmEZGcETAgrhf46ZzMgIGmfGNinTj/w/
	CCrv5WHwLPEXcpDUvSdDhLDDsWPvf0IvYvD3YBCHi1yQnYz/aX6kYJSwtPdQ5E4rhWjxT9Hnhtf
	ksvKDawRoYaJESbvW2KfSVuErHOfvzbJTFXdMun6KET7nH8q/S6ahJFhbJUrr5XXKVTzA0qCDD0
	4ZEhzzpH515pVVT8eZopM6c2DzuRB39jMbOVJPcTok9eyTifB8AtRHS2F3vmSOTI=
X-Received: by 2002:a05:6a20:3d90:b0:35e:da63:4e7f with SMTP id adf61e73a8af0-3898f9975a6mr15360794637.39.1768203419405;
        Sun, 11 Jan 2026 23:36:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP5jYn+9Av4NgJqkmkfm1gmPLeZYt/TOJKi71XIM/9W3h8BuZDLRy6HP6GbvSHmFhuxRHEOQ==
X-Received: by 2002:a05:6a20:3d90:b0:35e:da63:4e7f with SMTP id adf61e73a8af0-3898f9975a6mr15360782637.39.1768203418882;
        Sun, 11 Jan 2026 23:36:58 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:36:58 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:23 +0800
Subject: [PATCH ath-next v2 03/18] wifi: ath12k: refactor REO status ring
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-3-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OQ_hw1DCGiC2JI10E1Nv1u5uwueyCdEO
X-Proofpoint-ORIG-GUID: OQ_hw1DCGiC2JI10E1Nv1u5uwueyCdEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX7EIMzTKDOo2j
 DdzfgfWfmzxmtghsOjp1TeXFBiDD/1PW0IqRzbNzkqA8pwUC33LN/6wVDkAQammKWkMIGin+Bxq
 EzKRSmqvqheLXN+GPDCl08zA6eZLIeEfuytwQ0cjP7s5h5IIlHXJVw8wQoHnCWCgV4Y9wymUWSl
 bK1dN/Afsed/1ClfUB+8gHiqDP2OZ3o9pA5C9qtPP348hIptnWue4J/zl5C9LGMsZHDvWBeQmMF
 vgOpZt8IXIPmRfXWT86sH/775q7YpxdQ6Yb45cLfDRu/KE07OvSVheRmJ5BlzZxkSuwmNIGvCmO
 mEod4ydOfRggF6x/OS3Jkuqm9hL1qRfPhccgVHlHAW3/1DaCt2RYJs77FBCRMa0O2qlzJ0X2p3n
 vwWusnRLj/mf80oz0J0YNkUYTDF6dFrcApugFzpF4YPC1XKA08gTPopRnBiOb3yK1CPyJtRiTVF
 cTkHQ8TY0/9DYKAdIlg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964a49d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PMNv47187FcU-8MNZ6AA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233702_537396_EEDE5BE5 
X-CRM114-Status: GOOD (  16.53  )
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


