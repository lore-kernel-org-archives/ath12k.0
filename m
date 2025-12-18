Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4573D68BCA
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6RdSgZXj1yWlDovsnupc8A6+Yof29U8kequtY5oc4Q=; b=cKFbXnwULWexq0HPFlaPCn9KRI
	OcbBlvWoQoqB45S2hVNwKVj0azH23uBB9QnnpdjBshrfqZK1B9SkZj65kTZKkRF0mNkljE/zzG+HB
	LSCpnuUucA2olzorXFd0tRw7uyctgRjf5ffBES/NQHIUw3ZFKvZr7fz6jP70HpCdwgPIcgxT6qcZW
	tX3fRnAzRInmwFJ10MY7aBB+ntHRRZbIQI4B3xjgvIXgjULlvzPIa8epjPVJOk4dHr18JX+XD6p/j
	ZexN110xDP4xZRIlL/wOdzBWWXypp5xQsDkluXNaRUVC4A7FrNJXuQqjmNRZUHbmOdrXU8odVkV5t
	CJ9pc0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3F0-00000007gDP-1sVx;
	Thu, 18 Dec 2025 01:55:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Er-00000007g2V-0HQJ
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YTRd680496
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6RdSgZXj1yWlDovsnupc8A6+Yof29U8kequtY5oc4Q=; b=oab8U++jmxez6Ij5
	XR2s38T2pQdp8uPOMpKbkP47sKNivxqf3q4IJqeqWdMIar70HdrlQS8dzopwwFja
	IHR8EnxVWqljUFomxkztbsGEvJ+RvSI1cCkQbSKf+vGkhcB1EhyqbkaeMdvovwvT
	ENQWO99T9bg4X9akJ4yvCbsaQQ5WYKDZDC/yeJmOR/Vl9uWhWYvwGSQezm8m58PY
	6Trc6OXgl1j/mATwcTYIgVY680eQUEqjX+wUuuERYpHbC9J3B4JHaWmYy9MexpCR
	He9WnLH706lMYIPyBHaTRVq4968nwby1aKMzWf7re0cE+4J9glohJ3Qgmm2J250i
	zg0uGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhgdmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f8e6a5de4so2008125ad.2
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022931; x=1766627731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6RdSgZXj1yWlDovsnupc8A6+Yof29U8kequtY5oc4Q=;
        b=GKA0XWS6sn0hDpnHsAGZGDsr+sk+h7I15y5KRlG/1Y7U/UsMmnSWxEL2dJxlsXaBUQ
         TbnJQTyY/liW8YBof/9NIyl3COLBC58dN/SA9CbegSHeBGhihIsDcIo3k8THENZtxxYG
         bCPs1Zcngdxe+dl48RvCfW/aHlfRZQ8bq1wozFz45FLuuI1gRUmJ0wJL9IftqVpiRTCV
         LIqJp5DSFqfQAoKHWhEY/27UCKFtxt92Bmu9/19sxVXgIV0/jcJgiATJgVglGPVb9o9D
         /K2BceMdB7MC3FGTR9eEYHb1uk+GVQ5l1JhiEGFV65G5PuclHy2KpMwARs/1dz0mvmQC
         v+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022931; x=1766627731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6RdSgZXj1yWlDovsnupc8A6+Yof29U8kequtY5oc4Q=;
        b=gtkrhJVLbhCOgZwYGYDrRBmp64S1Az1qvmU9YenVH0cpQgco7X57LtvlUgvcUdBSPZ
         uCGM4sak5UHRg25/UqEhgSSTPEi4YNt7WV7G+pwldgl6mzWtkUKK+EUiFkTg3f28SD33
         OZVxJdaSx7IOgJDlIgs14TCpbYpJYEdfKdz+fMwP2fS0qycROkxC2PNl2WBRC/59Ocfa
         eCqgq5p/j8luLbdb0mvJWEfCe0UpWbXCWAFhmF73a3EuG0RKmz9wz7igDKYRJlWsrwjQ
         gcnDj+X7vv93AEwGjmYQNczhtaKOYKogpJ9ZhCkUUqnIwjGsvuwtITD1CBgvcc1ydY5K
         wrTg==
X-Forwarded-Encrypted: i=1; AJvYcCU1/PqQ++mB32UHwFf/A3lB3TZuKdf/qRcBwlsGDkrhm6f1pomOeakFmmcJkoPIlq3Mf+lCKkg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDRIAr1RaFpfMfOvUJhfvOZ2OEZh5wocKhY1TnCVZcQZNSXB/F
	lp4w5JrQrxLgw7cTopgaNt/3YjLLCz1fCA6ci0yXP4XMtWchi9woq66WDQD89PdcdT3O03cV6QF
	4bKlx8F+c8tbBTPnvL87AlTHIj5q03MxRyPbn0mBCgPJpdD89dxBCg3TyL/prXKEVsSoWHPtQVA
	M=
X-Gm-Gg: AY/fxX7oXn056CN06aTjcgnzSNM58O5VC92QgcQpyxVDXmfBecCwDoeXKIf320QGPOa
	1xl8suUF7unozsstlEX6MnHTlDw1l6zvT2Xlv7tMEl0qNaygtpagPfGw36g/dh8ocY/d6dvWPM+
	qTPutqGAvFJ/LwiaeTOEBjlW96b57HPvr5nAfmM1lxDlGmyfGh4ryungkUzoe5/sEdDi6JyAKYz
	sl41N/LRxGeRCJw4M8l+HErdDuLN41RWXiKWNre8PDdzn8IBXFORQPV1HPgw2WFeCYyoxchmDQu
	2netjrIjQuXRGtZXrR4N3Pmxi0B5x/5GPU8mGqe5zxCRYu1CY8N5UvEiFEWmNTyYnvJqEl0LrLv
	zrVeKNLx34JL4AxFTPdKUuYxksp1H7mvPCmc9y5mwxLdK9XNE6hUfkXWX1jiaaq0=
X-Received: by 2002:a17:902:cec7:b0:246:7a43:3f66 with SMTP id d9443c01a7336-29f23de4a8fmr206125505ad.7.1766022930548;
        Wed, 17 Dec 2025 17:55:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE0JBFDic937dc0W+SsYrBqU1p5SoIu1slPWGusjs5l82W2GoN00f2zLU+rfldt7IPpPn1fg==
X-Received: by 2002:a17:902:cec7:b0:246:7a43:3f66 with SMTP id d9443c01a7336-29f23de4a8fmr206125235ad.7.1766022930034;
        Wed, 17 Dec 2025 17:55:30 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:29 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:27 +0800
Subject: [PATCH ath-next 13/19] wifi: ath12k: add hardware ops support for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-13-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: rbOVfLVzbXZXpueoZbTAOvFdnx7oT78y
X-Proofpoint-ORIG-GUID: rbOVfLVzbXZXpueoZbTAOvFdnx7oT78y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX6axxmk2Q+JKB
 9JV4zisuViNVo1GOO+RmO/YNj2/ndSc0KSyeEJxEdVigKFuNaGWD5iLEPCS0EbjyKFbhcPX+4CI
 perbyzbTCg7KkhnxKmNVEL8TfhmwsLRLrHgQ90zTR7YlcEVswXtMUKm9QeuuLFCvAIuod+xWq2N
 k+CYH+S/8uqPceX1RUD3xfBC9CKxVdg10m6RcOuDVpqpAmMvH0kDEvvXlaOpT/IlAGDSxrrZI/q
 Sy5amdUSFv1yrOKMRAtIgHFZa0KujHNO2IiByJT6qmSkxNJ3lQT5QwEVNxrQEsa5FOgTNLJgjbD
 yhGv4PDqCad0bhicaodfYt/NtnjMtbW/M/cto4Ma44V7osfq55jhiSKDxt3JlsduX7YSF2akp94
 VPW//6MhNghUfpf3Fh+/9h6FDKDSEQ==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=69435f13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JvaljHK-8QMZ73MRPjUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175533_258750_38A7894C 
X-CRM114-Status: GOOD (  19.45  )
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

Due to HAL descriptors, QCC2027 has different offsets of MPDU start tag
and MSDU end tag, compared with other chips. Hence add new hardware
ops structure for QCC2072. All ops are directly taken from WCN7850, with
the exception to rxdma_ring_sel_config, which needs a new function
ath12k_dp_rxdma_ring_sel_config_qcc2072() to handle the difference
mentioned above.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 44 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |  1 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 10 +++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.h    |  3 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 12 +++++-
 5 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index dc8d72aeca45..7450938adf65 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -9,6 +9,7 @@
 #include "../peer.h"
 #include "hal_qcn9274.h"
 #include "hal_wcn7850.h"
+#include "hal_qcc2072.h"
 
 static u16 ath12k_wifi7_dp_rx_get_peer_id(struct ath12k_dp *dp,
 					  enum ath12k_peer_metadata_version ver,
@@ -2110,6 +2111,49 @@ int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab)
 	return ret;
 }
 
+int ath12k_dp_rxdma_ring_sel_config_qcc2072(struct ath12k_base *ab)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct htt_rx_ring_tlv_filter tlv_filter = {};
+	u32 ring_id;
+	int ret = 0;
+	u32 hal_rx_desc_sz = ab->hal.hal_desc_sz;
+	int i;
+
+	ring_id = dp->rx_refill_buf_ring.refill_buf_ring.ring_id;
+
+	tlv_filter.rx_filter = HTT_RX_TLV_FLAGS_RXDMA_RING;
+	tlv_filter.pkt_filter_flags2 = HTT_RX_FP_CTRL_PKT_FILTER_TLV_FLAGS2_BAR;
+	tlv_filter.pkt_filter_flags3 = HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_MCAST |
+				       HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_UCAST |
+				       HTT_RX_FP_DATA_PKT_FILTER_TLV_FLASG3_NULL_DATA;
+	tlv_filter.offset_valid = true;
+	tlv_filter.rx_packet_offset = hal_rx_desc_sz;
+
+	tlv_filter.rx_header_offset = offsetof(struct hal_rx_desc_qcc2072, pkt_hdr_tlv);
+
+	tlv_filter.rx_mpdu_start_offset =
+		ath12k_hal_rx_desc_get_mpdu_start_offset_qcc2072();
+	tlv_filter.rx_msdu_end_offset =
+		ath12k_hal_rx_desc_get_msdu_end_offset_qcc2072();
+
+	/*
+	 * TODO: Selectively subscribe to required qwords within msdu_end
+	 * and mpdu_start and setup the mask in below msg
+	 * and modify the rx_desc struct
+	 */
+
+	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
+		ring_id = dp->rx_mac_buf_ring[i].ring_id;
+		ret = ath12k_dp_tx_htt_rx_filter_setup(ab, ring_id, i,
+						       HAL_RXDMA_BUF,
+						       DP_RXDMA_REFILL_RING_SIZE,
+						       &tlv_filter);
+	}
+
+	return ret;
+}
+
 void ath12k_wifi7_dp_rx_process_reo_status(struct ath12k_dp *dp)
 {
 	struct ath12k_base *ab = dp->ab;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index a98836b83f48..8aa79faf567f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -22,6 +22,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int mac_id,
 void ath12k_wifi7_dp_rx_process_reo_status(struct ath12k_dp *dp);
 int ath12k_dp_rxdma_ring_sel_config_qcn9274(struct ath12k_base *ab);
 int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab);
+int ath12k_dp_rxdma_ring_sel_config_qcc2072(struct ath12k_base *ab);
 void ath12k_wifi7_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
 					    struct ath12k_dp_rx_tid *rx_tid,
 					    u32 cipher, enum set_key_cmd key_cmd);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index 847484ece204..522b94b04f9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -454,3 +454,13 @@ const struct hal_ops hal_qcc2072_ops = {
 	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv64_hdr,
 	.reo_status_dec_tlv_hdr = ath12k_hal_decode_tlv64_hdr,
 };
+
+u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcc2072(void)
+{
+	return offsetof(struct hal_rx_desc_qcc2072, mpdu_start_tag);
+}
+
+u32 ath12k_hal_rx_desc_get_msdu_end_offset_qcc2072(void)
+{
+	return offsetof(struct hal_rx_desc_qcc2072, msdu_end_tag);
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h
index 392bfbb6a412..6de943df7786 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h
@@ -8,3 +8,6 @@
 
 extern const struct ath12k_hw_regs qcc2072_regs;
 extern const struct hal_ops hal_qcc2072_ops;
+
+u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcc2072(void);
+u32 ath12k_hal_rx_desc_get_msdu_end_offset_qcc2072(void);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 03732370b58e..610db63475cb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -170,6 +170,16 @@ static const struct ath12k_hw_ops wcn7850_ops = {
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
 };
 
+static const struct ath12k_hw_ops qcc2072_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi7_hw_qcn9274_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi7_hw_mac_id_to_pdev_id_wcn7850,
+	.mac_id_to_srng_id = ath12k_wifi7_hw_mac_id_to_srng_id_wcn7850,
+	.rxdma_ring_sel_config = ath12k_dp_rxdma_ring_sel_config_qcc2072,
+	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
+	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
+	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
+};
+
 #define ATH12K_TX_RING_MASK_0 0x1
 #define ATH12K_TX_RING_MASK_1 0x2
 #define ATH12K_TX_RING_MASK_2 0x4
@@ -678,7 +688,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
 		.internal_sleep_clock = true,
 
-		.hw_ops = &wcn7850_ops,
+		.hw_ops = &qcc2072_ops,
 		.ring_mask = &ath12k_wifi7_hw_ring_mask_wcn7850,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_wcn7850,

-- 
2.25.1


