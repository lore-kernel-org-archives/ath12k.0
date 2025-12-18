Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A676D65C7F
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 02:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=; b=LLXsp7azgqhXhn3XgKj5iaDX7h
	xzGuUYU8ZQ36j7Uby7UMg5gqpQKFxhMocPapKKhkD3f15JePVprPcIYxvgLDQFzW8lQPNKNEEHKpj
	hDCVmnRclV7gQuKKG2fD3bkJPtlSHFFXc1WYIbyAqkXPoHxETY3IaWtW3M2IX1rVxw/dyIk0TjpLE
	tP88j/5Txvn5/XDwiXiCK1NLpe0tV0AhVIxw065RnaHhvNLcmfH39FpTbEbsnOAzvUXSi6W8dCgO7
	BNcKPkvmGKo7QGXGjfxysC0bxeKcx5OVcSXrskYQ2OjSICrDmc/ust80t4uO1hCbsM83cGUlPF3Md
	llryK1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3K0-00000007gwx-0AsV;
	Thu, 18 Dec 2025 02:00:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Jy-00000007gw5-2mFL
	for ath12k@bombadil.infradead.org;
	Thu, 18 Dec 2025 02:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=; b=kVFeSDTgWF4KljdyKvdO8UdEFJ
	42jtoxIMwaP9P84ecsh4SgOLW64rLhqrHrWwnHo9sFuVkG5ipOwaRrOATjxduBJ1M9nt44Q58DlKZ
	Jj8x1Kw8ZAUF/PHHfqnoPiWsWoo5rZn1TaWy0uhUt6U+Rwx3C5VidpF75mu8LMQvOmv0c6C9DYrFg
	GPt9sJr9o5PdnYRStjhMhpxsudMOjvt6plJsYTJTr7rviA5FEf7ENruqoKUp4aex34SQ0yU6d6Y0B
	ymPdTKHSuRZN6LYLI0pQZD8s6UV/3JA4kYFEShpu6j4orViMDXgSm1YNveIlZcwRfxdxNRi6F0ioc
	xHR+qALg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2Nc-00000007srA-1yOi
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:05:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Z44k175405
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=; b=OPST4mig2+rzmNLT
	Qj1hFlt0+2gWPw+qIUv63mAc8UlpimM2AcmaemYbmPyp8aCPjehmebBRGIFIszk9
	H8VNO2tzwlborFw5lGnuJkMxPjQ7LdGD2xP/v2IUCy1D0mwrBfPXKm4EMDizemFe
	5Tw6Vz0VdjJVZibZizyL9TsOyJoPUNrF1CNaEMFlkcNMcUEBUUlYNZbEHero2n5x
	JJqVpsz9YuuNyuKKuCTXiddmij3EuxehK7qSQQRjtdOklFPC8/7XdbRyNwpT0BL3
	YvCsCtpyUn/39fSNlbkqLQyo0imUvO5Y2NZUiTdGCwrecjBP2TxuRiH5iXnX4A37
	OtWGRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmrqrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f8e6a5de4so2008735ad.2
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022933; x=1766627733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=;
        b=GMSQ8t8YP1RatcQ/dGiPaJkg/ciCpcj2OSMgGi3n4nfW0SW/vmsb8c8/hFBloQHtDX
         m9h7vn44UiLgU0NF7/+CEXtAG48wPs5j88R/EnTWtzgJJXEITk3IanAnKrbOk1BCbJ+x
         IqfEjNyFyj6FntXjt3gtdGPpj/nv0eu2E9DbN3XlBe+n7h92cO6hfPs0kjW/Q9qu1QIu
         ro6DfEZT7EvLw3CACQBH5vTVO3VXkx5iDNP3SHwt9D49vh7ynIPsdZxdwGQRemc1jHrW
         zc9ofmqOiRG7zhAWXMXsBf4ASRDLwzIBYmv8T7KiTVFnI9KQGZB5sBDm4+4Qm/R9nZtl
         YB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022933; x=1766627733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+DDj03Q/JZ7H86NZCwW9Onb7O0YE7qrXi49wOwmk9A=;
        b=fnmY1dtQFY+FRply+ZvczN6y+P0BlFKlIkqPKxIm7+2KBzdoZa2DXcArwl10FfnxeY
         O5rb3sKITQj9s2jOa9KEVp5+ERBWcOdZd3Dbqt5ytc25eHN7CZR3NKUY5rzOt93Bom0E
         tTHVVYDmV91VAzWrD56f/SKQ4cHyrrydd7/xYFcr9XW1oPwtT612wb/bpSTBH5wFunWl
         EbSk9gc850GC/SQTbNmLSNQDLjasVlCtnq8uAywainLKC9zORc7PQ5rC3WXmjYOVWUA2
         m2NERuiZNte6dqOD1uyT077s50OyBlWOavauxsLWgxZzlG7aSwwiM1GQDpSYiuZXChmU
         sHkg==
X-Forwarded-Encrypted: i=1; AJvYcCVgzaYihhx8NCUPBbUAcZORcoPdZiVC5wVppBkmKzdV4BTpHobqWnqjIiUOZpnnh3rdxjRG9A0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSSVuxA9utLryK8OpWM3pnOca9VtXgGZ2bLfUhU2x3SzdHv70N
	TLs0wqbX0WCj0LjC2MOg5BlB6/mDCespXM+epnj346uBqeI5qBh8iwWFAO/wyx5g2jbr2GcO6Gp
	qa9g+LkzvGo0expj/VdzxPOhEmxcG6xGUCHlWEvNxMvv1fypeiChMONhJ2UJ7ENKNL0rA7LFz2d
	w=
X-Gm-Gg: AY/fxX71MROzaiVgk8Bzm3SU8Rzkos61rx8yotvT8qs16Jm3ejKcrpXQ/M4rfr519ZV
	N5ZWoPXvoTol40DqKEwdLm8HG+ZEADQyzp/7/XnqFyo28jdn6KlTWfoAh5qXMBfq3ANkIpu27e+
	UF6Ek58KecNN5dqHFRxMHiCXE9gjfoOW1tCpxgAHg9b/mUK92XnNkYyXkyYViR9DiwEUbAxzZu/
	R+58HgJUbfA5WMFCEMQLsQaSFBa4U5Q4Mlm9PRMLyLVK3R25G+Mht6gqZ+VA4SbMgsdd9kxc94t
	qmJlkebhHd+KduJdXAHw2HjREi2gQRYvKZPmrLTBQ1gfBQTMY3CXENrXySMrF42c682d37X7dYi
	SHrQytWgwDs34vv+pVnPvRAuCpoE5qh36n0wPKuzv2Nd7YFpXhhiTCNo4wbvs7Kw=
X-Received: by 2002:a17:902:d4c5:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a0c8849791mr139750155ad.38.1766022932516;
        Wed, 17 Dec 2025 17:55:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEH2UVqIC4y4+JuhQmcmy2peK7sD1Q/kN3Hw42zPpKYf6Jl8V2DzPluWZoR4Z07tW83cPxvw==
X-Received: by 2002:a17:902:d4c5:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a0c8849791mr139749855ad.38.1766022932013;
        Wed, 17 Dec 2025 17:55:32 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:31 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:28 +0800
Subject: [PATCH ath-next 14/19] wifi: ath12k: handle REO CMD ring for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-14-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: YykKFteeMGk3190O9C_LjcL0fDuD9Ge5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX8pQWa2p0iXvD
 yKTieP8fazUAc329IwqwSqVD5tn/5K2bvw1DZg9I+zME7xYKxMS8S8xKxzKcbN/uKUTnOc02B/p
 lqVcAm2ZDhJi4RsGAPFHqHyIQ4+/1rXBunocZpvlU5ga34CoBgYbb5V/BEAmCdF0Jjms5ceLXBc
 +cEKFqLkWaAx0t915IpEyQnCUnsny26crVtlR8rc+DqhEf5wjVhmHGUH7/2i0k783EDaj4/mPNp
 AHKI3U4ppZM9pAI/7wWsBgZhH9rD87VxRaBaSKVBdYXswhUHWQeHdFh4u9MqhwnXtHQ8FXfeb58
 6Kcboct9JRVcDzdQ9UmDB7UkyWJfRG8DxdKzr4rxQTvSSYrop/pbtD/tNWIoRxLl+D1G7umU7jj
 mEnKWS33kHraW69R0ZOGfkhLp9vOwg==
X-Proofpoint-ORIG-GUID: YykKFteeMGk3190O9C_LjcL0fDuD9Ge5
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69435f15 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FdA_q80-M5M2ZQSmf9kA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010214_665332_8398BE4B 
X-CRM114-Status: GOOD (  21.62  )
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


