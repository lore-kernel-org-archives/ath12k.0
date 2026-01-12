Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB80D25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gux+YAeNwcnKrHcfx0XLVSy/UlMzXiR9/nR145kzg18=; b=mzLVzlSIwxTvpxDs+t76VRyF46
	t+Hd7yPYJGHhbcF8hRiE24mBM8hY0s/tDXzRcesHYom2XyJkZFiwKc/znxWuKDlWbsvoUJI2Xw7cQ
	ChiwJSmAJ0ob127kneaaAQeFLWEFOQ7l6rjiGsuxvuhIGv9XRX99r2hfW4wTOmluRceSHE9VpyFLE
	jwvtnFp2eOnwewV5gUNpX5OV3nPz6mUZvLBORMjc1VJbOA34VA72DfREgsQl+HpU4Biydz9xB/D7g
	s42Cy7UJn9Hr+INb4SrG/4gEt+f6XS0SvRHFlDSkSU9S7KzbP/xZsQgNvZ/cXjZwWk3ow3yDcVJXC
	9tg6OIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUN-00000004teq-25Wh;
	Mon, 12 Jan 2026 07:37:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUH-00000004tYA-0ZpH
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7OfMd555266
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gux+YAeNwcnKrHcfx0XLVSy/UlMzXiR9/nR145kzg18=; b=J7DVajdIGAkpbPeZ
	tM3v6AP/85WgqTUDR8o6qDRAkSb/fJcQE7+nPBlI6BopE5RZURNRC4gGoGIH9jxO
	Np1IXi/SmDnmxTYJ2n6yzxVEArMfp/U0KJkLU7NxvmznUYOIariK+U+dUneCIWDG
	itFw05r6JbPNvtP9fWImSuuK17Y1YBva7sIEEmItB6S6E2G83ngd5WzzDsAmQE3i
	Uzm8I0rBjzrRCe9B1K21WNlkwqdWl3oulLPvMFLkzVvBLLmHlD109cVjbym9FFha
	RMDxM1fB/yNuCyz5C+z+ZpoyZnsNhM9Cia/+CQ8xYA9zKVQUiVE6ZKPZ+ReylJvX
	hlLoaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw016a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c3dfa080662so2674169a12.1
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203436; x=1768808236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gux+YAeNwcnKrHcfx0XLVSy/UlMzXiR9/nR145kzg18=;
        b=KrVxA39+eDaqvGxG3obMkSh0bCaCITtCNz4bQGaob2wp+7HLAzRqRptChpDdoWmUgp
         ltEW3eAPzD/yEInrAw6W+wQXhKZnIyKwUDVtWug4Ov31eNyP4A5JxIlsBsft8Il9mGHZ
         6OSLVD61DaJJA7kjW2LxQmzk1ahJhnuix4hA8SA39IQoRfsW2k5yK3n+G4KJBNuJExIQ
         ZkPyKOyMD4m86cIWaxIMF3InkGEPHSix5s47GxYJmRql8W3l6aUtCq3kFsjoQ58k+2pB
         mqF0ZXyIDR28Ya+FlQxkW8yXTiBjlnr69YeM4/V4zBcvvC1UTMTTvSEKZcgqwdxvonbI
         u8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203436; x=1768808236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gux+YAeNwcnKrHcfx0XLVSy/UlMzXiR9/nR145kzg18=;
        b=TfZUi3177I/TLTvvUg926iwgTrTRjKDCbDSRWWkt9MdTBN0I0QxBDyKdPwd3AtPfV5
         M2wxa6Kqf3Oz8+WQDaW5noG9XdLDFIEphyPLxvECwW4Q+M7yVDaYh8f5qDrg+rL9v/HO
         JnhnD3diwPeUAQpYLyBmNTCH7VSGpTR5ATeQ/qxa7eB9VNc7YFbR7QUiRRtbXATdQ6NQ
         l65+XoObZgRv6U1vtcH3HdtPr5IpAuw3z2lHEae+tDZ3xb9B8MUwSP1OZzi/At3OHENt
         OSE+KyoHcCXbr0R1o6PuZzuFHiPGfV3mwtmHa8w+lMdwW8VeStsXFvzVfbd4Fqwa9yaJ
         PNNg==
X-Forwarded-Encrypted: i=1; AJvYcCV/MTEihaNfu2Ai+BDDlEblRIV3K9yuisfPkoJUTibpEILnjjRlNEBGM1rjajNvZJluDQd641s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIDR9qcPN9Vn7MR5Wuj2FtPnvk9xqfLjbgBMdgQ/raFtWSg2Wz
	KMeCfoximapClzDlC0mccce0cNx8r3f2oM0zFnib1zinkBw9eAjgretL3svWDYBRAvsuV4VSpe3
	+bFH1CWv7A7VcbxeH1NBVVzy3tVMRbsmvwS9Yc6c44TUrV1dCfsUs9HmcHVm3RbxjdA5WoNvDSp
	8=
X-Gm-Gg: AY/fxX5lg60eO56VcekmCWoS8zlEAQJF3sEeVs2k17W9IC4GHWmnIWsbyVTHzhJeJ5l
	fEE7V2kBnzZsGD93vParwz4hHG6f759xkCw8kXEQU1OXZrnVukXmw4x8yW9UbRtIHYlCCkRe76R
	VZP6RmC71ealJ7CJOql26+rrmFwTcXz6q3hhj6VxfjST/o9SsAHGozKbGeU+Ld6qqUsvgeKRV7g
	lPha2ySwpzZ9KBiKeYE27uTC2yY1hdx+DtQtwR2VIhCe7aTWxrD7Ia9Oqgwl85hywQFW+m1GJmp
	KwR+6td4vf3TRo630pQxDUIIzkyRm5rPszpBk2gvgSWAUnmBJ8KcBdXPLHFW3IwctzTWmINx/bT
	KGgRZxhAAx3oapXcbxR0T8wu96Ineuxz+zJVR3SQzxMDTCX3a3mJll2YO4eMUutg=
X-Received: by 2002:a05:6a20:939e:b0:2cf:afc1:cc3c with SMTP id adf61e73a8af0-3898e9f5a98mr15349422637.16.1768203435707;
        Sun, 11 Jan 2026 23:37:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU1ipMulfXL1gNlpo+dxtnYSolORyI9IdCUFLphGPJdYXH+3hpMdXhvg+vppkoPddP5JXkPg==
X-Received: by 2002:a05:6a20:939e:b0:2cf:afc1:cc3c with SMTP id adf61e73a8af0-3898e9f5a98mr15349405637.16.1768203435179;
        Sun, 11 Jan 2026 23:37:15 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:14 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:32 +0800
Subject: [PATCH ath-next v2 12/18] wifi: ath12k: add hardware ops support
 for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-12-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX9MWPjfklLgQf
 Td7VxRmrl3aTVnobmz1n3CLGEA31dIvfVJr42VV463aWfuu3kIh2BpsD1lKAVp6W+U4nITAVg/f
 M7m0zEUDwtSy5rMFdy9grevTEerjwWAG8+lpmtpywKE1AlswiPKVGZ9XTBr6bT9qDg+FEZ8Ug2l
 046cP+v0H9A0MIwxiI0vZgSHQ2tuh+Z79Fd2hJJ1U6V62qFkEYoYzgpnL7onGWVJ/LO9yK+EIHk
 KvlNjcyErcV+qbnkgKfB27S8+dJQqHuuOf4C4ApZGGZbkJCjD4b4seZ1oEpA/hfrNYhtYO+p3J0
 isrCzNFgmUVxXDGRsMGYR87dH40o55Q5tmqILKb1lTr2GMuiT4aMQw76htZXrBK4r/TYHX9ZgSY
 WngrncNcgjbbXpgfoEe33GBxdNGbl63m72Fyv2NKolTweYi5XWdqJzwLh549SdERm5xcJtorZLM
 zF38MwfZAF+bE/u7lqA==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a4ac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JvaljHK-8QMZ73MRPjUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: XM8F12kJInqxX6ub7MCGBBQ5WchQ3X9J
X-Proofpoint-ORIG-GUID: XM8F12kJInqxX6ub7MCGBBQ5WchQ3X9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233717_230947_94C561F4 
X-CRM114-Status: GOOD (  19.43  )
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
index 38c388319e00..f75690f586cd 100644
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
@@ -673,7 +683,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
 		.internal_sleep_clock = true,
 
-		.hw_ops = &wcn7850_ops,
+		.hw_ops = &qcc2072_ops,
 		.ring_mask = &ath12k_wifi7_hw_ring_mask_wcn7850,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_wcn7850,

-- 
2.25.1


