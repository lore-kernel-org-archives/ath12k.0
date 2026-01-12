Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1587D25040
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=; b=CrbluBXAM7Re6vJi7+tk8qYz2g
	/TS3GM2bwHv9UySOuy1MRLv6cful/lQKF2DM7psYWy3yskSS9xJwg/IuMRuXt3DBGB8ZuhFZqn+HK
	xeQTCIazm4UhRtegICaTWuNgb0DLDdG8cBgB+b4753xjh/YK68AdPGcCcT3yNvN4d5cvrK0/twB8/
	nztBjD5VU64pjkOIb6w8JDFeK9IRYdebVts3MgShpzoxRHzWNnwgjgmRCWn0wtbtR4IczIivXgjG7
	bExXG990eZbU3/ZewbZKVGV9+S6K9YPjAEoI7w9943WnwCjZcSkgTyLIxK8+c5Fa5NDsPdG93dsck
	30S+79uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU0-00000004tJp-2Aq1;
	Mon, 12 Jan 2026 07:37:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCTy-00000004tIK-3H4I
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:36:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2O12W113539
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=; b=WKRbMb2MnJCxbESN
	E7NyV5p0tT0qYQrSHDZAew8PZ1jxbYYL0O5oHWQGG0BRJXmEIv3rXVfM9fFpwNGu
	1GcNtt8UoeaWEDYxR9sbyapWqcuGywovE3yA58nnFIa+kpabUsIK56Jc8YadoerD
	783JdRxH0pqofxbOsKH8GMR716OoPZFszzGSFpj8psIHCYkp8eQ1NAIB2/2ZOuLz
	Tj/mS0PlLQ16PYdzUMa+tJilU1W+tvFFVouv4ZobDppXvHojqSsT/q+CoOqfRdbU
	6behUaT+a0bfyAlNY25Fh9ZQJDhH7Jd3S+4HtneEfiHtx74mSWnGz3FOaqmJ49o2
	fITPsw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ugsa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:36:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c37b8dc4fso11559025a91.2
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203417; x=1768808217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=;
        b=LmRcwMFEre4+mkGjWWEUu2lL0lRsVkKqX43JmPRz3lbKTRrbILf1rlk8Anzni5Tiv5
         4odJ81Mk+FXeekMefyPVBp9H5jYE87feIMkTG8xq5kU1W1s0d/Tq3zPVJ9sdL8JcaeVh
         JC7NZ4btWycXZZZomi9t8fbXIH7l7pISZ96Yi1xFqNp00aNAt5C2bAbXlrubZUu9AxdI
         uV7TizTaIlA9oGRJFqBK3EMJ0umkCt6aNX5BBniNVFg69Wxr+0+J4ErcNPDxBmU9X2RR
         YzfBQeqmfKp9Uv094gCbuRvxB64RvGHHBE0l49OcOPo27lfiHNr5KNF7NJ1xlx3IXwZF
         2S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203417; x=1768808217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xO/Z8OTWEryPFUqXFceT9Nx46ORhtkGydwhL3x4O9+Q=;
        b=jS1SlP9y1i1hfMuJGtra7l0xbniynDBlJ+9ZALMes1jI4ts7AC3/TulH3ISZTTwg23
         7To80p/mPA8xzsTvBs3BiDH2q/N1zRV6NC0YW+rZF0qIkHAyACdzJY1NBtCmWxUoYaAb
         LexE/sZq6Cbe9lEXjgqT1Mdlt5uC0nb25T6kdLGzq0CW8uJtTU+fnTHamd0iqXqCP4+l
         jb+hdwuu1MDVfw7XEqqO5JewuycmmtgIJJNWWyITVQ0KRGcRRAwRFSqfJ2Au0PF8PhBI
         cYDKb1nhymOVk8aPM4MWZRb+xElsJSWDiwODrOiZIghzbWqLuDbv4/Z4iLQ1PmDRyuY1
         xkvg==
X-Forwarded-Encrypted: i=1; AJvYcCW66D9OyHctmClELWCpnkVuxp+M8vTO5w3G61qUlmJaOARdd7opBsUjEqg5i/PryCtHlD4XPKA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCMVbzLdurZuc/WSRU2HniIb/HfXw5lOShKFbSq5VgGjC24W1i
	1bxuKk+fF8N7faPdW495qjX3+Svleq8atmtHU97lnYR5ItUJKsYbc9RcrdiKZVmCvahoAAGtr7M
	Ge3YWKcInr43WIxMGQ5Vx4sWdk3+vK2lrYNEoAqI8E0aUUf9jSjqWlLbck+dvcZqWwKzi00u3EU
	U=
X-Gm-Gg: AY/fxX6ckq6Pvep8bzIgEiYO6ZwoeSC7CJuGd9pLrzwqQC3Jwikjb+7aRVJkLjdlX7U
	LJIH9Br2/LYm+t0q+H64DFceVZyJLy1lYwNInTS1MeYVMNOPwPpzbwnfWiWKTuXS+XkDJ6ij+pC
	bC6CNDZF2/77qX8MTQCgJ5K/mYELDjr3Qt5WDLT7YiseOcW0KqOV7uj0rUciMbYTiSo6gQpTsqB
	m4g7dtz0N3lRqQfNdTzcKu7QfGGPJ3OR9EJFRVctKUFc/APPKJ62gaYi7UFYee/L02ewb8nWA6Z
	6khOWnfbrpvvF+vegGEloFtenwxDSFuI1uP4ivds6u33l7AqHOH8OvmvAAN8qNVXOQcU4cdEKsR
	/y9Huv43zUILtEAfakVOsGOqhvCWqz5YHphFMJDn6ECDJKQI9CmcAk64UtvQll4I=
X-Received: by 2002:a05:6a20:a110:b0:355:1add:c298 with SMTP id adf61e73a8af0-3898f8ddd35mr17042273637.21.1768203417418;
        Sun, 11 Jan 2026 23:36:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmURWcIwclguCQQW+VUWnPdXpDHgIRNoQdJxV+WFucZMw0ZwvAsoc6R+z9GkJYybe4YnfvHA==
X-Received: by 2002:a05:6a20:a110:b0:355:1add:c298 with SMTP id adf61e73a8af0-3898f8ddd35mr17042255637.21.1768203416951;
        Sun, 11 Jan 2026 23:36:56 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:36:56 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:22 +0800
Subject: [PATCH ath-next v2 02/18] wifi: ath12k: refactor REO CMD ring
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-2-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX6fP6QucSFA3t
 pv6GXj0GSVTqETdhl9mPaaQiEIlsUhxJTogLYAVcAuifd930jctIsDdYsgGOMlXSBNxw+2HoI+c
 p66CL+zD+gkKv+cYhNmOkBjhfMc6kKZ0eEQGjRbrQSJaYEGkNZwDuuYWMUzD49MSEJgJuBO79I/
 TMCYPu9NJ4fAHh+fIerpnVLW4iejUlhYDtbgs7NsXousvPaKSwUvxJXYgzUHgXvG/JtiVujezQ5
 MNinkBYUkiBVTivIQN10OQdpasTNBoFe7GPY1E5nrO9Kcp35CnlWmS7FVTxVstA99YfbvqfRL5d
 R83OuV/oZtA8yYhvdo17h9mspHhMKFHHCwkoejqzW8y7Ili2Egwc3aD3coLb6Jjxv7KSXSdoBHa
 cyqD/dVKeviHgYIwIqT8ocmhgmcNApDDnAx5yxcn3n0xbNoZ2BMIv5poxm+jaWEQjRVCG2Xhf2n
 1576riTflIKUFLTyJMg==
X-Proofpoint-ORIG-GUID: QwsH8UVmJeUkuYEgxAzqDGRFuP4E4PjL
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964a49a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N_EWgtucFCvFHXU7mioA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QwsH8UVmJeUkuYEgxAzqDGRFuP4E4PjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233658_833796_2A8FF317 
X-CRM114-Status: GOOD (  17.57  )
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


