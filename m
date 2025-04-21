Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C19C369D7
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hZqULHZjm1SplECvDuI++vRjWXBgF16wtK/q2Pk1SE=; b=zeKQRk9AFQhfMCX6bIzAMZ/gko
	+0DOFAQA9D51mXHbaxroAek1AAsYwuHuuSS+bNWWQ/IKzN8RHLPTjdeOUalniS4vZZERgbAcm9NLO
	gZsozmohhFBt4KSQm1AHqpsFRlG8KUQvlLhBecQPIVSGYrBnKhwp+N0RAZ7Dz4wTYmKlJt2TLmev+
	RA8ZLcEnXcO4YDBmftOk0mh8rmyJNqQo7S26aYAsmFVtfcCg/d49qPIbikAZ2qCMbd5LPqbSiMACY
	r3Uqls+27JF7VsTunlNoyxXm9eQfrNaD8J8XXqAdCs2jNASr4miOFzwYR8ZTF3VEHQwJbe7tReXT3
	jYjKVtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0U-00000003S9t-42Y5;
	Mon, 21 Apr 2025 02:35:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0R-00000003S6u-3pef
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNKsiT023678
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8hZqULHZjm1
	SplECvDuI++vRjWXBgF16wtK/q2Pk1SE=; b=goMqR1roX2JDaxZ3tGaSNEkTY6M
	hgf0FoxHoxqIbRVSaFg0z1Hks2oe8MQE/949VbolabSnvaZAjaE3g7bL5/TWh+UP
	BcohIUyCr+dDHksqwZh43tRWU+PW5WA4m0wjGj39/BsqvMIeAQGLuh2QXb9uLoAz
	l35WfOAx7+VXp2mXaV9/56TUJ6OSLu09mO2zoiEQ/XgSKKLwdEj4/icC7wlnCTWr
	pZS+JlQmGlA0eALVqF7Zu0ZlIywbeRggwJUz/BMHRWs4JH2YmwucQbgrPFCo0mGj
	f6IHHfQTLuChXVvgwzC4XjCrl12X5jSyaFhMSpl191GsV26RTUVLwQYdzZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhjx6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22c35bafdbdso54193845ad.1
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202933; x=1745807733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hZqULHZjm1SplECvDuI++vRjWXBgF16wtK/q2Pk1SE=;
        b=SqLCdOAoufZ/yAaBKb3q/KeE/t6ewrk8XDa7F3hImXcsbtcLE3y/gEj51jBoFJ/ceH
         uW41u4xY/8GbF4Lr44hEsvqeAHnIkJ24MvLTxzEKzsfoyftQhWBbaygINn95KZSS6mWE
         S+liUVCO0QbZWBUveoyPiQapfAzKZ++PyP2DNUwc3oJOs5LQzN8y1fcgqvsnQ+KN6Rp4
         npMihepsw0wPhkKM5udUGoWBBYQvoWPaCArMOpmRyGRQ521+o4oLWzTjZgEZiZZzFuIB
         xwUqpJqsZuoJXcLuntonqKTULjXzoDuycbx02a6xg3iEB8kxfiJl04oTaNL3bzrV9dv1
         m5ww==
X-Gm-Message-State: AOJu0Yxf/BsWhLykV+RfCdZTDeB7Vr6BuOA2+vPXbooW/iFVTQbFMTwt
	haGsA5/PiauTcwlxUKlPYXW6fSOS01dzuhC6l3sa7U97VHzPUgtHZPRPNMsQ8KlDAnGeo0OvV9g
	hTN0fkDQXcNE8KkbLpYZYeQjRLvqMJ2rFods53dpDQPX/C+LRpvHX5OzUT6SwXYh4PuCfL4E=
X-Gm-Gg: ASbGncu6jL1sxiEe5arFhNQ20czXrC0tjsKE4I91Y9U2ge9exeUER/62cCg/z1gU5zK
	Rq7gNgUZoWUHcquFv5Kib0u61Nk/BUysk8804S6Zx94IDzyNdmrj3lr9njRh67YTZvkSqIc2oU6
	1dWptUXMgoEKR+x0t2miItOm5kNEQQBcw1l/KazM2I6oLfzZOTMl0KZujGALCszGwA9ygH5D8cT
	nbu2cfM5bjOe3PGpHXBI0/SFCUgQI3ByImX6zAAg48VuRpoFr6I4UDw+iPUh/BgxnoL+toBWJE0
	OVGvHksWzhJZGYcqILhc3td0CoC7xb0Ur/cekI+FG7ocyhgMJzvplKWbkIcezd61TsxTeMniIJq
	qb6aIwFeb38Q=
X-Received: by 2002:a17:902:f54c:b0:224:1074:63a2 with SMTP id d9443c01a7336-22c5361c436mr159845325ad.43.1745202933544;
        Sun, 20 Apr 2025 19:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsWmmltyrsFvtZ+zV7ulHOBb3JA17xX4Ll7gxpRrPdYgMCim5NBNOpMKFVjPILnn7BK5pVfw==
X-Received: by 2002:a17:902:f54c:b0:224:1074:63a2 with SMTP id d9443c01a7336-22c5361c436mr159845115ad.43.1745202933184;
        Sun, 20 Apr 2025 19:35:33 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:32 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 09/13] wifi: ath12k: use ath12k_buffer_addr in ath12k_dp_rx_link_desc_return()
Date: Mon, 21 Apr 2025 10:34:40 +0800
Message-Id: <20250421023444.1778-10-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6805aef7 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vwqPoxeLtJ6jty5K6VgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: roZsvynduoW8GjK866Sn0idmE-lSjyG_
X-Proofpoint-ORIG-GUID: roZsvynduoW8GjK866Sn0idmE-lSjyG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193536_019470_15CA1716 
X-CRM114-Status: GOOD (  16.40  )
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

Currently, ath12k_dp_rx_link_desc_return() takes struct
hal_reo_dest_ring as its second input. This struct is converted to
struct hal_wbm_release_ring and passed into
ath12k_hal_rx_msdu_link_desc_set(), where it is converted again.

This double conversion is both strange and inefficient.

In ath12k_hal_rx_msdu_link_desc_set(), only buf_addr_info is actually
used. To simplify the code and improve readability, directly passes
buf_addr_info when calling ath12k_dp_rx_link_desc_return().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 26 ++++++++++++------------
 drivers/net/wireless/ath/ath12k/hal_rx.c | 16 +++++++--------
 drivers/net/wireless/ath/ath12k/hal_rx.h |  4 ++--
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 6bbae10f7389..382d364fb3ff 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -843,15 +843,10 @@ void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 	rx_tid->active = false;
 }
 
-/* TODO: it's strange (and ugly) that struct hal_reo_dest_ring is converted
- * to struct hal_wbm_release_ring, I couldn't figure out the logic behind
- * that.
- */
 static int ath12k_dp_rx_link_desc_return(struct ath12k_base *ab,
-					 struct hal_reo_dest_ring *ring,
+					 struct ath12k_buffer_addr *buf_addr_info,
 					 enum hal_wbm_rel_bm_act action)
 {
-	struct hal_wbm_release_ring *link_desc = (struct hal_wbm_release_ring *)ring;
 	struct hal_wbm_release_ring *desc;
 	struct ath12k_dp *dp = &ab->dp;
 	struct hal_srng *srng;
@@ -869,7 +864,7 @@ static int ath12k_dp_rx_link_desc_return(struct ath12k_base *ab,
 		goto exit;
 	}
 
-	ath12k_hal_rx_msdu_link_desc_set(ab, desc, link_desc, action);
+	ath12k_hal_rx_msdu_link_desc_set(ab, desc, buf_addr_info, action);
 
 exit:
 	ath12k_hal_srng_access_end(ab, srng);
@@ -882,14 +877,17 @@ static int ath12k_dp_rx_link_desc_return(struct ath12k_base *ab,
 static void ath12k_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
 				       bool rel_link_desc)
 {
+	struct ath12k_buffer_addr *buf_addr_info;
 	struct ath12k_base *ab = rx_tid->ab;
 
 	lockdep_assert_held(&ab->base_lock);
 
 	if (rx_tid->dst_ring_desc) {
-		if (rel_link_desc)
-			ath12k_dp_rx_link_desc_return(ab, rx_tid->dst_ring_desc,
+		if (rel_link_desc) {
+			buf_addr_info = &rx_tid->dst_ring_desc->buf_addr_info;
+			ath12k_dp_rx_link_desc_return(ab, buf_addr_info,
 						      HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
+		}
 		kfree(rx_tid->dst_ring_desc);
 		rx_tid->dst_ring_desc = NULL;
 	}
@@ -3507,7 +3505,7 @@ static int ath12k_dp_rx_frag_h_mpdu(struct ath12k *ar,
 			goto out_unlock;
 		}
 	} else {
-		ath12k_dp_rx_link_desc_return(ab, ring_desc,
+		ath12k_dp_rx_link_desc_return(ab, &ring_desc->buf_addr_info,
 					      HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
 	}
 
@@ -3620,7 +3618,7 @@ ath12k_dp_process_rx_err_buf(struct ath12k *ar, struct hal_reo_dest_ring *desc,
 
 	if (ath12k_dp_rx_frag_h_mpdu(ar, msdu, desc)) {
 		dev_kfree_skb_any(msdu);
-		ath12k_dp_rx_link_desc_return(ar->ab, desc,
+		ath12k_dp_rx_link_desc_return(ar->ab, &desc->buf_addr_info,
 					      HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
 	}
 exit:
@@ -3699,7 +3697,8 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 		    rbm != partner_ab->hw_params->hal_params->rx_buf_rbm) {
 			ab->soc_stats.invalid_rbm++;
 			ath12k_warn(ab, "invalid return buffer manager %d\n", rbm);
-			ath12k_dp_rx_link_desc_return(partner_ab, reo_desc,
+			ath12k_dp_rx_link_desc_return(partner_ab,
+						      &reo_desc->buf_addr_info,
 						      HAL_WBM_REL_BM_ACT_REL_MSDU);
 			continue;
 		}
@@ -3717,7 +3716,8 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 			drop = true;
 
 			/* Return the link desc back to wbm idle list */
-			ath12k_dp_rx_link_desc_return(partner_ab, reo_desc,
+			ath12k_dp_rx_link_desc_return(partner_ab,
+						      &reo_desc->buf_addr_info,
 						      HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
 		}
 
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index 98eeccc68fcd..837284992cd9 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -447,16 +447,16 @@ void ath12k_hal_rx_reo_ent_paddr_get(struct ath12k_base *ab,
 }
 
 void ath12k_hal_rx_msdu_link_desc_set(struct ath12k_base *ab,
-				      struct hal_wbm_release_ring *dst_desc,
-				      struct hal_wbm_release_ring *src_desc,
+				      struct hal_wbm_release_ring *desc,
+				      struct ath12k_buffer_addr *buf_addr_info,
 				      enum hal_wbm_rel_bm_act action)
 {
-	dst_desc->buf_addr_info = src_desc->buf_addr_info;
-	dst_desc->info0 |= le32_encode_bits(HAL_WBM_REL_SRC_MODULE_SW,
-					    HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE) |
-			   le32_encode_bits(action, HAL_WBM_RELEASE_INFO0_BM_ACTION) |
-			   le32_encode_bits(HAL_WBM_REL_DESC_TYPE_MSDU_LINK,
-					    HAL_WBM_RELEASE_INFO0_DESC_TYPE);
+	desc->buf_addr_info = *buf_addr_info;
+	desc->info0 |= le32_encode_bits(HAL_WBM_REL_SRC_MODULE_SW,
+					HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE) |
+		    le32_encode_bits(action, HAL_WBM_RELEASE_INFO0_BM_ACTION) |
+		    le32_encode_bits(HAL_WBM_REL_DESC_TYPE_MSDU_LINK,
+				     HAL_WBM_RELEASE_INFO0_DESC_TYPE);
 }
 
 void ath12k_hal_reo_status_queue_stats(struct ath12k_base *ab, struct hal_tlv_64_hdr *tlv,
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index c753eb2a03ad..ef8bda3c0fc2 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -1141,8 +1141,8 @@ void ath12k_hal_rx_msdu_link_info_get(struct hal_rx_msdu_link *link, u32 *num_ms
 				      u32 *msdu_cookies,
 				      enum hal_rx_buf_return_buf_manager *rbm);
 void ath12k_hal_rx_msdu_link_desc_set(struct ath12k_base *ab,
-				      struct hal_wbm_release_ring *dst_desc,
-				      struct hal_wbm_release_ring *src_desc,
+				      struct hal_wbm_release_ring *desc,
+				      struct ath12k_buffer_addr *buf_addr_info,
 				      enum hal_wbm_rel_bm_act action);
 void ath12k_hal_rx_buf_addr_info_set(struct ath12k_buffer_addr *binfo,
 				     dma_addr_t paddr, u32 cookie, u8 manager);
-- 
2.34.1


