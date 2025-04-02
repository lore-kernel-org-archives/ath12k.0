Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB486C36017
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fdShziIALLnGA3EOn3bsai4736gfzWW/VFrWzHvrNCc=; b=CDgcrPuACF2II6vL+4NJoZHblU
	gBbCP2RyL+SDTFdtF/cVS7IouBcs9W8onc5nDzzN2SilxsnyMFK6HvMV7FNIGayL6KKFLUlu4vWEM
	WzRSt/QlhZy9YyQTTKt+CmHL/qnWUasKiY6AAnJUMNekxaDpWI1uSL55y6tUMzq9OSB9MVX6eOF3F
	HRyA8RwtU84xA8JycxN7pzDRBExJhOLYN3qhcZ1PTLLaLMfKNd0pzOwXI7+tgMeuqS/Ld1awOTqjr
	vHwFS0GpwQYWoxGlnLSK7D9TzbwkSF54542sKLR/6J7j/a6ZSEIvQZiVjUnqeevfnZA2mS6CNpA+L
	8nrveNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02TV-00000006sSC-23HB
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:06:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02TT-00000006sRX-1Oz7
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:06:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DWUxv024674
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fdShziIALLnGA3EOn3bsai4736gfzWW/VFr
	WzHvrNCc=; b=j4NTr6hyQBaz726K5beN2vpCTMD0p7mvwPP70zR6rkx62ThgMnV
	WTeXQj8I7QK3mLsA5rjwyYu7ZAyBjUibAnTpcAwzioMXbPJtoUijeTCrd+8tnnHa
	ypwCeW7FSw83U1lu8Ww9bwIgUAQvL9j46sB2mzwlLNbuhCY65O5oeuE3U4Yq+Ndj
	rLCaOr6zch8N9Kvu0UnqigpPGXTWf3bGgEntwTIMPwivtsM9+EQc36dL4MG72RYd
	TkqHgVjQ5VQSYMI4Xtk5YuHJZVd80p2qRRAe8aK8VH9V4apZPAgnArBOkZtdAmnL
	4k8MFuGbiCHYHOzDkjNsOG+YlVGkzwNWdtA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpywd1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:06:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7375e2642b4so38265b3a.2
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617161; x=1744221961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdShziIALLnGA3EOn3bsai4736gfzWW/VFrWzHvrNCc=;
        b=S/ENCdFXM0cKA8N+/PQ5hENmG7TuMLc9JyP1E7utk3HYlYUtKUP+3VOyWuhXt/Zi54
         IVyeYVSmZkv/S4Qe2Spco6isZQMUEIewv5778F+pRo80QaJRtIzYOEGvfQCYe2zWZ5dc
         Q65P6kS+Bi1VZWnEqaB4WJ3C9d1trLlh4FpLkHb5gSMWHBhEqXJnLplaUTZscU8u9EuZ
         ADvEVI6p60Lvox4uZiavwzUbIzOSOqt2NPWXNXvv05LxTFFFttm/7kgojoFIPACB4dJE
         SfHbNCqV6B/p93o7f+a+8bpY5SNzIjgR8sf0vUkkf2AWrAOV9gF/W87PGKi6kKGodnKQ
         E1vg==
X-Gm-Message-State: AOJu0YyHiDtIyYsoPF6/rs2Gr4heICJu8hhrQ6gDz3LRSOs9kK0Ywwqp
	DEsqB3tgivPaRJnngMR5vCCQL9uzd0IzMD79nxoEzC/bhje7ikRfhcf7Qabkdf5nKOh2dHpknDE
	C7sXfww0gk4/scLleTi9aTGcwsm7uKgUUvsu0nFOEtLHSJn6H7VyfgfMaRZBitl/yAcjp
X-Gm-Gg: ASbGnctLKezzKRTd8TMob5bV3NEsjBlZGreOij0zpAsjKqtW5dfNel20ugKU6IyDkEZ
	nEKbNu7gIKn7Nk541dvur+XQfd74zcX0Rgdat7bHR3Tet3XDoW2buoYS5yv/pbQzAHU7gtGCOCV
	D2RM0+xn8QWcyqokfaDEu4EbHSOU+165UpGIwFyWWBggtpB041qos8TWxKMrXQgXls0hkPxy6tI
	eYpmL531qvSw7oUkJb5FYkwxWFKfTmCdh2JsmVN7zVLsMcj1AqeoHgYa05QJ5eJ20xgMBOMOI00
	VTJPog0yRANpJLEPj3/ADcIJp0lsie48ik2tj1lMemCWCUXf3AEVuMJ3Lc8Cg4eCeqxRWETavO/
	hZdbSPD8FOE5R3UNq+IqFqxqvDxmN28fLVg==
X-Received: by 2002:a05:6a00:3c8f:b0:737:9b:582a with SMTP id d2e1a72fcca58-739b611a1c2mr10850264b3a.24.1743617161072;
        Wed, 02 Apr 2025 11:06:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa5k9e0Yz9dh4yttEZuPbgBkDcLC6RWpmj+jDGu11Xc5bwMo2ILgv0fZQBlNylIIIYhqmGqA==
X-Received: by 2002:a05:6a00:3c8f:b0:737:9b:582a with SMTP id d2e1a72fcca58-739b611a1c2mr10850206b3a.24.1743617160525;
        Wed, 02 Apr 2025 11:06:00 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710636aesm11677804b3a.91.2025.04.02.11.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:06:00 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: Fix invalid memory access while forming 802.11 header
Date: Wed,  2 Apr 2025 23:35:43 +0530
Message-Id: <20250402180543.2670947-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iDOrsW77lsEcRT7_AxueIH2DZdGj782Z
X-Proofpoint-ORIG-GUID: iDOrsW77lsEcRT7_AxueIH2DZdGj782Z
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed7c8a cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=JjvW5l02fN9JWm9YJMsA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_110603_380033_1900F19B 
X-CRM114-Status: GOOD (  17.90  )
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

While forming the 802.11 header from the rx descriptor, skb_push() is
performed for the 802.11 header length and then calls
ath12k_dp_rx_desc_get_dot11_hdr(). Since skb_push() moves the skb->data
pointer backwards by the 802.11 header length, the rx descriptor points to
a different memory area than intended, causing invalid information to be
fetched from the rx descriptor.

Also, when IV and ICV are not stripped from the given MSDU, mac80211
performs PN validation for these MSDUs, which requires the crypto header.
Before forming the crypto header from the given rx descriptor, skb_push()
is performed for the crypto header length, which overwrites the memory
pointed to by the rx descriptor, causing invalid information to form the
802.11 header.

Fix these issues by moving all rx descriptor accesses before the skb_push()
operation which ensures the proper 802.11 headers are generated from the
given rx descriptor and removing ath12k_dp_rxdesc_get_mpdu_frame_ctrl()
for filling frame control, as this information is already fetched by
ath12k_dp_rx_desc_get_dot11_hdr().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Co-developed-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 27 +++++++++----------------
 drivers/net/wireless/ath/ath12k/hal.c   | 19 -----------------
 drivers/net/wireless/ath/ath12k/hal.h   |  1 -
 3 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 66603e9c154b..d54c59812270 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -228,12 +228,6 @@ static void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_base *ab,
 	ab->hal_rx_ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
 }
 
-static u16 ath12k_dp_rxdesc_get_mpdu_frame_ctrl(struct ath12k_base *ab,
-						struct hal_rx_desc *desc)
-{
-	return ab->hal_rx_ops->rx_desc_get_mpdu_frame_ctl(desc);
-}
-
 static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_base *ab,
 						struct hal_rx_desc *desc)
 {
@@ -2122,10 +2116,13 @@ static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k *ar,
 	struct hal_rx_desc *rx_desc = rxcb->rx_desc;
 	struct ath12k_base *ab = ar->ab;
 	size_t hdr_len, crypto_len;
-	struct ieee80211_hdr *hdr;
+	struct ieee80211_hdr hdr;
 	u16 qos_ctl;
-	__le16 fc;
-	u8 *crypto_hdr;
+	u8 *crypto_hdr, mesh_ctrl;
+
+	ath12k_dp_rx_desc_get_dot11_hdr(ab, rx_desc, &hdr);
+	hdr_len = ieee80211_hdrlen(hdr.frame_control);
+	mesh_ctrl = ath12k_dp_rx_h_mesh_ctl_present(ab, rx_desc);
 
 	if (!(status->flag & RX_FLAG_IV_STRIPPED)) {
 		crypto_len = ath12k_dp_rx_crypto_param_len(ar, enctype);
@@ -2133,22 +2130,16 @@ static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k *ar,
 		ath12k_dp_rx_desc_get_crypto_header(ab, rx_desc, crypto_hdr, enctype);
 	}
 
-	fc = cpu_to_le16(ath12k_dp_rxdesc_get_mpdu_frame_ctrl(ab, rx_desc));
-	hdr_len = ieee80211_hdrlen(fc);
 	skb_push(msdu, hdr_len);
-	hdr = (struct ieee80211_hdr *)msdu->data;
-	hdr->frame_control = fc;
-
-	/* Get wifi header from rx_desc */
-	ath12k_dp_rx_desc_get_dot11_hdr(ab, rx_desc, hdr);
+	memcpy(msdu->data, &hdr, min(hdr_len, sizeof(hdr)));
 
 	if (rxcb->is_mcbc)
 		status->flag &= ~RX_FLAG_PN_VALIDATED;
 
 	/* Add QOS header */
-	if (ieee80211_is_data_qos(hdr->frame_control)) {
+	if (ieee80211_is_data_qos(hdr.frame_control)) {
 		qos_ctl = rxcb->tid;
-		if (ath12k_dp_rx_h_mesh_ctl_present(ab, rx_desc))
+		if (mesh_ctrl)
 			qos_ctl |= IEEE80211_QOS_CTL_MESH_CONTROL_PRESENT;
 
 		/* TODO: Add other QoS ctl fields when required */
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 031f76d88bef..d00869a33fea 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -511,11 +511,6 @@ static void ath12k_hw_qcn9274_rx_desc_get_crypto_hdr(struct hal_rx_desc *desc,
 	crypto_hdr[7] = HAL_RX_MPDU_INFO_PN_GET_BYTE2(desc->u.qcn9274.mpdu_start.pn[1]);
 }
 
-static u16 ath12k_hw_qcn9274_rx_desc_get_mpdu_frame_ctl(struct hal_rx_desc *desc)
-{
-	return __le16_to_cpu(desc->u.qcn9274.mpdu_start.frame_ctrl);
-}
-
 static int ath12k_hal_srng_create_config_qcn9274(struct ath12k_base *ab)
 {
 	struct ath12k_hal *hal = &ab->hal;
@@ -736,7 +731,6 @@ const struct hal_rx_ops hal_rx_qcn9274_ops = {
 	.rx_desc_is_da_mcbc = ath12k_hw_qcn9274_rx_desc_is_da_mcbc,
 	.rx_desc_get_dot11_hdr = ath12k_hw_qcn9274_rx_desc_get_dot11_hdr,
 	.rx_desc_get_crypto_header = ath12k_hw_qcn9274_rx_desc_get_crypto_hdr,
-	.rx_desc_get_mpdu_frame_ctl = ath12k_hw_qcn9274_rx_desc_get_mpdu_frame_ctl,
 	.dp_rx_h_msdu_done = ath12k_hw_qcn9274_dp_rx_h_msdu_done,
 	.dp_rx_h_l4_cksum_fail = ath12k_hw_qcn9274_dp_rx_h_l4_cksum_fail,
 	.dp_rx_h_ip_cksum_fail = ath12k_hw_qcn9274_dp_rx_h_ip_cksum_fail,
@@ -975,11 +969,6 @@ ath12k_hw_qcn9274_compact_rx_desc_get_crypto_hdr(struct hal_rx_desc *desc,
 		HAL_RX_MPDU_INFO_PN_GET_BYTE2(desc->u.qcn9274_compact.mpdu_start.pn[1]);
 }
 
-static u16 ath12k_hw_qcn9274_compact_rx_desc_get_mpdu_frame_ctl(struct hal_rx_desc *desc)
-{
-	return __le16_to_cpu(desc->u.qcn9274_compact.mpdu_start.frame_ctrl);
-}
-
 static bool ath12k_hw_qcn9274_compact_dp_rx_h_msdu_done(struct hal_rx_desc *desc)
 {
 	return !!le32_get_bits(desc->u.qcn9274_compact.msdu_end.info14,
@@ -1080,8 +1069,6 @@ const struct hal_rx_ops hal_rx_qcn9274_compact_ops = {
 	.rx_desc_is_da_mcbc = ath12k_hw_qcn9274_compact_rx_desc_is_da_mcbc,
 	.rx_desc_get_dot11_hdr = ath12k_hw_qcn9274_compact_rx_desc_get_dot11_hdr,
 	.rx_desc_get_crypto_header = ath12k_hw_qcn9274_compact_rx_desc_get_crypto_hdr,
-	.rx_desc_get_mpdu_frame_ctl =
-		ath12k_hw_qcn9274_compact_rx_desc_get_mpdu_frame_ctl,
 	.dp_rx_h_msdu_done = ath12k_hw_qcn9274_compact_dp_rx_h_msdu_done,
 	.dp_rx_h_l4_cksum_fail = ath12k_hw_qcn9274_compact_dp_rx_h_l4_cksum_fail,
 	.dp_rx_h_ip_cksum_fail = ath12k_hw_qcn9274_compact_dp_rx_h_ip_cksum_fail,
@@ -1330,11 +1317,6 @@ static void ath12k_hw_wcn7850_rx_desc_get_crypto_hdr(struct hal_rx_desc *desc,
 	crypto_hdr[7] = HAL_RX_MPDU_INFO_PN_GET_BYTE2(desc->u.wcn7850.mpdu_start.pn[1]);
 }
 
-static u16 ath12k_hw_wcn7850_rx_desc_get_mpdu_frame_ctl(struct hal_rx_desc *desc)
-{
-	return __le16_to_cpu(desc->u.wcn7850.mpdu_start.frame_ctrl);
-}
-
 static int ath12k_hal_srng_create_config_wcn7850(struct ath12k_base *ab)
 {
 	struct ath12k_hal *hal = &ab->hal;
@@ -1555,7 +1537,6 @@ const struct hal_rx_ops hal_rx_wcn7850_ops = {
 	.rx_desc_is_da_mcbc = ath12k_hw_wcn7850_rx_desc_is_da_mcbc,
 	.rx_desc_get_dot11_hdr = ath12k_hw_wcn7850_rx_desc_get_dot11_hdr,
 	.rx_desc_get_crypto_header = ath12k_hw_wcn7850_rx_desc_get_crypto_hdr,
-	.rx_desc_get_mpdu_frame_ctl = ath12k_hw_wcn7850_rx_desc_get_mpdu_frame_ctl,
 	.dp_rx_h_msdu_done = ath12k_hw_wcn7850_dp_rx_h_msdu_done,
 	.dp_rx_h_l4_cksum_fail = ath12k_hw_wcn7850_dp_rx_h_l4_cksum_fail,
 	.dp_rx_h_ip_cksum_fail = ath12k_hw_wcn7850_dp_rx_h_ip_cksum_fail,
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9f12ed84a653..a365703f84c0 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1080,7 +1080,6 @@ struct hal_rx_ops {
 	bool (*rx_desc_is_da_mcbc)(struct hal_rx_desc *desc);
 	void (*rx_desc_get_dot11_hdr)(struct hal_rx_desc *desc,
 				      struct ieee80211_hdr *hdr);
-	u16 (*rx_desc_get_mpdu_frame_ctl)(struct hal_rx_desc *desc);
 	void (*rx_desc_get_crypto_header)(struct hal_rx_desc *desc,
 					  u8 *crypto_hdr,
 					  enum hal_encrypt_type enctype);

base-commit: ba613742db305037ca2193b2b552b769c4f2a5f7
-- 
2.34.1


