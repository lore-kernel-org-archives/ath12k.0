Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86650CAC5B9
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hko3ZFl0bEzJNMgMOTQBflRu3baR4K6MWSD/7TDHLRo=; b=r6kszCPp5l8Wu6/7m8l1Vb2MJl
	vwz1jKso/ExKvS8xbJc9lKf1861eqrcqnAGBRF6ycs6e8x68B3izYqj7CWonr1e8Zv4ueOlA13FY/
	HpA4TDvdWg/QYDz2rWWgCXM9rqHChOx0VrzlfQ5amLU1cI4eotd6jjF2SDvGnKvrj4rVDpFuvG2t7
	slvCdK8csLHw2Nb+9eezqWKf0YFui5IvbVL1H8NBVAYUZ91KTlIphWrUVOHHGvZjhNwtA07Koh+2J
	pRovrcDZjDQXLLm4doQ4YH6cCWV263+ZLJriOLoDxoKXBYSWnCdXd7J8fXLhMCx0GUqXYNMx0+0xA
	Byr1Mdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WTO-00000004moH-0sJS;
	Tue, 30 Sep 2025 09:16:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WTA-00000004men-2UGG
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 09:16:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOtm026864
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hko3ZFl0bEz
	JNMgMOTQBflRu3baR4K6MWSD/7TDHLRo=; b=gaCa80nl97ivpFC1dFFJzz1bVpb
	4NDxmWUdmKb8cWuOjsvt3k2ao7SNzK2ol6+pmqo0DUWITF6zrd6akBWN9A84UONr
	x9JNCxKAMpP/KDcSWabQStHtwXqfB+RAZDCBt9Q74bRBkPIkR556vsOgYC8ElyQ5
	uUPfzlUAlPSXwB1vmxplJqU5u2IQwN1TEXEvBKDvCsIv+J7JcmPT/93usF7CChLy
	9SjxV9UDWXmQs8TXKyecUWmRmi6fs/SZF0MTT7jvr05vpVgWMKLBsHrRz9GUJvLJ
	r/BbqH/BUAGQTzTqXFixcDhfzUqGQZ8CyDKU+H9eumhrGcGvKsICFdk251g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf20gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:16:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso10301047b3a.0
        for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 02:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223782; x=1759828582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hko3ZFl0bEzJNMgMOTQBflRu3baR4K6MWSD/7TDHLRo=;
        b=nLlJR+Dn/WVukguh6hhO8LUu52vSxrhxSnN0bAEEN738NUNKW+KdbYPmGsRr6eMgk9
         LYtCOIfe8thkyjC6FQBiUFNGX8p8VhmIlRt50WElHIo/VVODPdOuTzfKzchv2+X1L4IC
         yeAyulyXGLTmkzXgUI0EvxfVWc4suszQxi4EayVG2sLOAKP6Cux9Xz8sMejt7s53G+sD
         vCineBAZX9iaOXijFmw7eMWrgZfsjukCFwUigWfWG3mJyWZuADF5XHBOP1QPJYtp2IGI
         2xcBhuUUMl/AJtEhKcPXsn4rOftHWn6vzePEYoKLqPX7Qw+fEPClJ0nbUfjMEISZbdOh
         gPNw==
X-Gm-Message-State: AOJu0YxiLpbIEFuOosAI5BKmXPd3DX9+3KcJNQDzD0h3gtBRyu7YiFVg
	/j9izyD+Xetw09C+mWWS46GG+Qo0xqPhSdbeqwwT6Otn5d8jNLE2XHBo7yqKTgBeW+7QBLK0MLL
	FnES4g1m/3PNnKcnVYNA6HvwZJtujQojqVu7Em0Ru9eJ3y44rLybcinjQYKVGGfE87ueK6tmU
X-Gm-Gg: ASbGnctNafObng3e6GdvUOLY+hOxiYdewRQJY0ZCsjAuZae1PYJCZG6t9UYdfrB5E0c
	gT0OnNBfWx4JYD7pTrASwc08u5XraFct6WXb/bGdWcyJWp8AFLI+wrX2DBuIdOvB88yDV6iHJGl
	0NJ98kuL5M15r4a90jkuu3DRWXMwc2x6AiOPx4ZXtLXqyxxEFKJpxgI4TMCf5DiD16OJg+mebky
	IxFj4BOcjVuq+m88RMut2xXlgpFiCIZ8EcTKyftEzDrBScH5ehRO+6foBxs04AW7/7YoQioP+3b
	E1JpClPTAPOZrDsSbESLgRuCfk2SKWpZVznyKbY9FSo8OUPnJ82HB4wZ/5KhpC5aKiBaNbPfCQB
	L7CHDg6iq6cJHZ30lsclvIGFHH1GPZkLuhCEjmqzpNtnnMjtjvpHyuhDmJEqIL9r/Upc=
X-Received: by 2002:a05:6a00:1792:b0:782:cc55:be67 with SMTP id d2e1a72fcca58-782cc55c00fmr8780652b3a.20.1759223782016;
        Tue, 30 Sep 2025 02:16:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtMrFnBmX79yekIRbfrIUmm/McZQhDVzZxrKUGHXqG62pky4T0tu8eofU6mtc0ilmgQURhXQ==
X-Received: by 2002:a05:6a00:1792:b0:782:cc55:be67 with SMTP id d2e1a72fcca58-782cc55c00fmr8780631b3a.20.1759223781548;
        Tue, 30 Sep 2025 02:16:21 -0700 (PDT)
Received: from hu-sarishar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b26644sm13431963b3a.67.2025.09.30.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:16:21 -0700 (PDT)
From: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Fix MSDU buffer types handling in RX error path
Date: Tue, 30 Sep 2025 14:45:50 +0530
Message-Id: <20250930091551.3305312-2-sarika.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
References: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: U9TOyPkKoNhQkugie8bbDovzpSOBJCrO
X-Proofpoint-GUID: U9TOyPkKoNhQkugie8bbDovzpSOBJCrO
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db9fe7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FUVsxDsjtWu2R0VvNmgA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX3aD0BoeV7HqG
 OZnkcZlatICPUji8U9eNih2qThW6hYBpaccM9FlLFA++B0DYwbFwlAbqagB1BFYgr2qlbQ4xMHC
 kw55rqXXJIcrTJ6aCFxgGyLPahNysXOnnm02HVt9q9hldECSiCYSZzCyMuHT4wlAJYg+BO8B8pR
 ttTswLFRGT6OWDk1l5+BsvR1mf5bCRq2YmQG+9wr7dKsQJY/eP2U5NjU58rqo6QnDQHvulTaBMI
 sp3rX+CQIUVDCwFNpxsmcoUJ+SBl6p6GnaQu61atRKTJZbQSb7uEz64LeWJaYU42WLUgAbT5yE4
 UWVchUpoLcjgcCxQdaJ00V3tsoIKenwK+mLNdll8WJMhTQauEnHoZyf6KCDIefzGJPrt0ll0m5+
 YJSCrchvAPMUVvg9UsJqMalsKZYQ9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_021624_773209_C29A8A4A 
X-CRM114-Status: GOOD (  19.67  )
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

Currently, packets received on the REO exception ring from
unassociated peers are of MSDU buffer type, while the driver expects
link descriptor type packets. These packets are not parsed further due
to a return check on packet type in ath12k_hal_desc_reo_parse_err(),
but the associated skb is not freed. This may lead to kernel
crashes and buffer leaks.

Hence to fix, update the RX error handler to explicitly drop
MSDU buffer type packets received on the REO exception ring.
This prevents further processing of invalid packets and ensures
stability in the RX error handling path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 70 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/hal_rx.c | 10 +---
 2 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 5e5c14a70316..99d29eda26cf 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/ieee80211.h>
@@ -3781,6 +3781,48 @@ ath12k_dp_process_rx_err_buf(struct ath12k *ar, struct hal_reo_dest_ring *desc,
 	return 0;
 }
 
+static int ath12k_dp_h_msdu_buffer_type(struct ath12k_base *ab,
+					struct list_head *list,
+					struct hal_reo_dest_ring *desc)
+{
+	struct ath12k_rx_desc_info *desc_info;
+	struct ath12k_skb_rxcb *rxcb;
+	struct sk_buff *msdu;
+	u64 desc_va;
+
+	desc_va = (u64)le32_to_cpu(desc->buf_va_hi) << 32 |
+		  le32_to_cpu(desc->buf_va_lo);
+	desc_info = (struct ath12k_rx_desc_info *)(uintptr_t)desc_va;
+	if (!desc_info) {
+		u32 cookie;
+
+		cookie = le32_get_bits(desc->buf_addr_info.info1,
+				       BUFFER_ADDR_INFO1_SW_COOKIE);
+		desc_info = ath12k_dp_get_rx_desc(ab, cookie);
+		if (!desc_info) {
+			ath12k_warn(ab, "Invalid cookie in manual descriptor retrieval: 0x%x\n",
+				    cookie);
+			return -EINVAL;
+		}
+	}
+
+	if (desc_info->magic != ATH12K_DP_RX_DESC_MAGIC) {
+		ath12k_warn(ab, "rx exception, magic check failed with value: %u\n",
+			    desc_info->magic);
+		return -EINVAL;
+	}
+
+	msdu = desc_info->skb;
+	desc_info->skb = NULL;
+	list_add_tail(&desc_info->list, list);
+	rxcb = ATH12K_SKB_RXCB(msdu);
+	dma_unmap_single(ab->dev, rxcb->paddr, msdu->len + skb_tailroom(msdu),
+			 DMA_FROM_DEVICE);
+	dev_kfree_skb_any(msdu);
+
+	return 0;
+}
+
 int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 			     int budget)
 {
@@ -3825,6 +3867,26 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 		drop = false;
 		ab->device_stats.err_ring_pkts++;
 
+		hw_link_id = le32_get_bits(reo_desc->info0,
+					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
+		device_id = hw_links[hw_link_id].device_id;
+		partner_ab = ath12k_ag_to_ab(ag, device_id);
+
+		/* Below case is added to handle data packet from un-associated clients.
+		 * As it is expected that AST lookup will fail for
+		 * un-associated station's data packets.
+		 */
+		if (le32_get_bits(reo_desc->info0, HAL_REO_DEST_RING_INFO0_BUFFER_TYPE) ==
+		    HAL_REO_DEST_RING_BUFFER_TYPE_MSDU) {
+			if (!ath12k_dp_h_msdu_buffer_type(partner_ab,
+							  &rx_desc_used_list[device_id],
+							  reo_desc)) {
+				num_buffs_reaped[device_id]++;
+				tot_n_bufs_reaped++;
+			}
+			goto next_desc;
+		}
+
 		ret = ath12k_hal_desc_reo_parse_err(ab, reo_desc, &paddr,
 						    &desc_bank);
 		if (ret) {
@@ -3833,11 +3895,6 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 			continue;
 		}
 
-		hw_link_id = le32_get_bits(reo_desc->info0,
-					   HAL_REO_DEST_RING_INFO0_SRC_LINK_ID);
-		device_id = hw_links[hw_link_id].device_id;
-		partner_ab = ath12k_ag_to_ab(ag, device_id);
-
 		pdev_id = ath12k_hw_mac_id_to_pdev_id(partner_ab->hw_params,
 						      hw_links[hw_link_id].pdev_idx);
 		ar = partner_ab->pdevs[pdev_id].ar;
@@ -3886,6 +3943,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 			}
 		}
 
+next_desc:
 		if (tot_n_bufs_reaped >= quota) {
 			tot_n_bufs_reaped = quota;
 			goto exit;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index 669096278fdd..c4443ca05cd6 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "debug.h"
@@ -323,7 +323,7 @@ int ath12k_hal_desc_reo_parse_err(struct ath12k_base *ab,
 {
 	enum hal_reo_dest_ring_push_reason push_reason;
 	enum hal_reo_dest_ring_error_code err_code;
-	u32 cookie, val;
+	u32 cookie;
 
 	push_reason = le32_get_bits(desc->info0,
 				    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
@@ -338,12 +338,6 @@ int ath12k_hal_desc_reo_parse_err(struct ath12k_base *ab,
 		return -EINVAL;
 	}
 
-	val = le32_get_bits(desc->info0, HAL_REO_DEST_RING_INFO0_BUFFER_TYPE);
-	if (val != HAL_REO_DEST_RING_BUFFER_TYPE_LINK_DESC) {
-		ath12k_warn(ab, "expected buffer type link_desc");
-		return -EINVAL;
-	}
-
 	ath12k_hal_rx_reo_ent_paddr_get(ab, &desc->buf_addr_info, paddr, &cookie);
 	*desc_bank = u32_get_bits(cookie, DP_LINK_DESC_BANK_MASK);
 
-- 
2.34.1


