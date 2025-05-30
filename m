Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E1EC5B543
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbzjtDFPMgDSfw8+tY1nLj4pEi94zY5+Io8Fdjldiuo=; b=HbT5aQvmepGYNg4ukj+Et5sSZe
	83WX9TeLVf9SFURu28EkvEzvFl8xBNK25i6Q71AZXemk7EhXgPmvRzHBUbqt3ai2512vq8xKbNqH1
	RSMnM01rWNp+WZIah+/dT4x9hWRM9wgpi3msn6AKPk7wPJhK1r74eoASH1Ug2Z75KOhdKGzc4kJJS
	GTqKLWfWtAWP3gtgfXQe1b1fBAJEecaRA8XCJvoilyz2AQPCZDL4fuISlnj+o2QmOjHM0Dk80HnNv
	VvYtL1bJ8SzmtqOyBhXCdDxf/0GfGE+gbmb+zvYe404vNz8SYuF8j5cqZGDtPfNbloXhybGrSLe/e
	ej1QPL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44N-00000001TqX-0qnM;
	Fri, 30 May 2025 18:03:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44K-00000001TpU-1HPJ
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 18:03:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UALpqq008227
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=tbzjtDFPMgDSfw8+tY1nLj4pEi94zY5+Io8Fdjldiuo=; b=YT
	6bfQvvhB4M48JUQUGMNT05J6yPFZpBK/rpgv+o51Ip9wfdYKJFqdRVTlXkgpXmsK
	eiROtwQVukDkXuWxe3dufdxxqz4Kx8+LyU7lkrCijfvzlhs8rvjchHqrVgzxoStq
	7xIVikriAUo2rZx2sS5B4YvN/KecAn8TBGaqEuGtslCUXrRgUPt2NuID/ZiNAZ/c
	vdyyv3Gd7H+PPlQ1M02bt0iCsf8v/lp/YbFxeIRo3sMV0ElbXHIjVRtkz6fwug9K
	xwNhtRbzgmoMbAZiR4KUdTKzlHK5VEFs/srhmpvtli/BfOcMo1jYu3ggX33g+OH+
	5Pj1v0GsgxwX2TDmknyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992v7ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:02:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23446aa30d1so24487005ad.3
        for <ath12k@lists.infradead.org>; Fri, 30 May 2025 11:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748628179; x=1749232979;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbzjtDFPMgDSfw8+tY1nLj4pEi94zY5+Io8Fdjldiuo=;
        b=Y6NzAk5kAAzyE0LS8fcHO4rs3+osmhZNldVMVCpGD2C4jEiYCbOtozwrPE5FoRjn9+
         2FEodbsakTJDIJspOZx0WNYadnqx0bU1Zg0YxRxVTyjSTcTETPrGDqYM1kcdpryZa08B
         GjRwbLUT/CYQETKpKXvFjICNweCLe8gU5wUXfNk6OvHF9+a/16diTlUyoHjjcXkqBk8D
         JWdk/Arh6P4KZxOgQlJkj/4ubCi5oy3pVgVIlHrFya78nJYNi+4kTheeJSrCPpLpacSO
         p0kJs+CLhfuuXMGm/C1YKay3oluJqnLSkNJq2GxRsbDRkTYzQ0hUPeQJxd7ezou1c8jX
         uMRA==
X-Gm-Message-State: AOJu0YyJkDSwh+j5MRy9/LRG0qo6MTbz7sJhJjsN26eE5WR0CsSqOwH3
	LAxIKXIy97aqoMzIyFumbFmdF0kHPmTBXgJO8dUpS4MCQurHwCZO9tFmWGHbgiKnMLHBH2nmP3Q
	qZG1euZnxw9ErLB0/fvs9aiEiDnjoUb6esFaGJBK+vprHtyXLQet4wv0R1KCU/eBdH/6WOAki
X-Gm-Gg: ASbGncus/SnBDPMg1pvKpc9PUL5h1zvPmS49rG9Ja5c8syynuQFlOyM2beKsQDqmTVt
	pC/IIvMvxHx+IEpQegfnRAS653VWospMCENil3UTpyqyctkie1GvmCVn4gEyKSz/Lfjnie8Ndrs
	y4x8OvJG6LAAdlxDZiHhVx/8L8NoUg4unN3m89rPIKaIYR96tk9HLrb8uqoOOdjLzF8jdawyv0P
	fxgHa2gIawWzpEewwVCNiqIGLU/pOkM58h3sEnAIz55WFjMnFrhiQUzOxfPtCN21r/QBB1mhHg1
	ZR7HZ7SWcTYpIXsKR2C+i2HFiyHUHc7WYVxLWjdjHSvx2WHdNjMzOT128ILx1ojWYEO72LgX8vb
	JblhKSzNwtJfcqJ3FzxoxH5XnyMLEfNGZp3jU30g0UAbT0g==
X-Received: by 2002:a17:902:dacb:b0:234:8c3d:2912 with SMTP id d9443c01a7336-235289fdbabmr68768025ad.11.1748628178704;
        Fri, 30 May 2025 11:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdEztbPoaFJSpq9upOrgHw5rokN4u18YbJRz/Yo+GH/QtKCo3WKkhqFQ21A/LUfJmgbWYTRQ==
X-Received: by 2002:a17:902:dacb:b0:234:8c3d:2912 with SMTP id d9443c01a7336-235289fdbabmr68767545ad.11.1748628178141;
        Fri, 30 May 2025 11:02:58 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc868asm31374435ad.31.2025.05.30.11.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 11:02:57 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 1/3] wifi: ath12k: Fix the handling of TX packets in mode
Date: Fri, 30 May 2025 23:32:45 +0530
Message-Id: <20250530180247.424349-2-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1OSBTYWx0ZWRfXwbTdvyF1mVMg
 wQ7yOvLSWTDlbYbLhvZj2EjT6j8iHqanNqARIAE9QyyaSxmvtIHeE1PBO+gmi9f3m1ts7bs6g6s
 uxcML2bvnYqYIWMcpm4aJj4ypyk7FlbhBO1uKMpPyOw9LWhukItrKBz9V1OA4pJxR5Zt341q1BW
 4tQJu/K0mRYTUJ8/aLOe22mTbvef8vD4X+i2jSCE8PurP9FGoWeq4cIOwwUhUPDo7p6Regt5Xp5
 DSfnhqFhVdNF4GseerFETxhfwaJvdjChJt1hI1pL/iPTGLRXT+l4XA/bc23S8xNEFlfcu7iskAL
 6xMemqnB360oshtIijpZsBPjkPnYkrJPdiLg5nGCn7wdwvzQ5zdfpGuGghMPXte6AX0LJXctcYc
 DkoxKAS0aBI75tAWuNetsh75NGXKTG3ikgRaI/1L7AtWR9xoQxcq1Q6o2+P5SPeYJcJ9z5It
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839f2d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vl7YvmKCL5Z24jtCxAEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: O3ko1cb7oxKrpdeqQtTY1eC-eHStMNUR
X-Proofpoint-ORIG-GUID: O3ko1cb7oxKrpdeqQtTY1eC-eHStMNUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_110300_346860_B4DBD4CE 
X-CRM114-Status: GOOD (  17.73  )
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

Currently, in the transmit (TX) direction, EAPOL, QoS NULL,
and multicast frames are sent in native Wi-Fi (802.11) format.
However, when the virtual interface is configured in Ethernet
mode, transmission fails for packets received in this format.

To address this issue, the firmware should be instructed to
treat these packets as RAW type packets, ensuring proper
handling even when the interface operates in Ethernet mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 38 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.c   |  1 +
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index b6816b6c2c04..189c742f2a00 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -245,6 +245,8 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	bool msdu_ext_desc = false;
 	bool add_htt_metadata = false;
 	u32 iova_mask = ab->hw_params->iova_mask;
+	bool is_diff_encap = false;
+	bool is_null_frame = false;
 
 	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
@@ -335,7 +337,19 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
 	switch (ti.encap_type) {
 	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
-		ath12k_dp_tx_encap_nwifi(skb);
+		is_null_frame = ieee80211_is_nullfunc(hdr->frame_control);
+		if (ahvif->vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) {
+			if (skb->protocol == cpu_to_be16(ETH_P_PAE) || is_null_frame)
+				is_diff_encap = true;
+
+			/* Firmware expects msdu ext descriptor for nwifi/raw packets
+			 * received in ETH mode. Without this, observed tx fail for
+			 * Multicast packets in ETH mode.
+			 */
+			msdu_ext_desc = true;
+		} else {
+			ath12k_dp_tx_encap_nwifi(skb);
+		}
 		break;
 	case HAL_TCL_ENCAP_TYPE_RAW:
 		if (!test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags)) {
@@ -379,15 +393,25 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		goto fail_remove_tx_buf;
 	}
 
-	if (!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
-	    !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
-	    !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
-	    ieee80211_has_protected(hdr->frame_control)) {
-		/* Add metadata for sw encrypted vlan group traffic */
+	if ((!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	     !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
+	     !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
+	     ieee80211_has_protected(hdr->frame_control)) ||
+	     is_diff_encap) {
+		/* Firmware is not expecting meta data for qos null
+		 * nwifi packet received in ETH interface.
+		 */
+		if (is_null_frame && msdu_ext_desc)
+			goto skip_htt_meta;
+
+		/* Add metadata for sw encrypted vlan group traffic
+		 * and EAPOL nwifi packet received in ETH interface.
+		 */
 		add_htt_metadata = true;
 		msdu_ext_desc = true;
-		ti.flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
 		ti.meta_data_flags |= HTT_TCL_META_DATA_VALID_HTT;
+skip_htt_meta:
+		ti.flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
 		ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
 		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87a..958299bd5acc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7574,6 +7574,7 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 		is_dvlan = true;
 
 	if (!vif->valid_links || !is_mcast || is_dvlan ||
+	    (skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) ||
 	    test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags)) {
 		ret = ath12k_dp_tx(ar, arvif, skb, false, 0, is_mcast);
 		if (unlikely(ret)) {
-- 
2.17.1


