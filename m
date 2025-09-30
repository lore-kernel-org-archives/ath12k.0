Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16525CAC5B8
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJH/ZtkwOxoV8E6xs5G3pO8BZxsKdEzfnAjYiBZUsv8=; b=Eno94TOxIEmP2sVCbFtoMlr6Tz
	sECHvbugyrDr53IfKADZyCf3yWOefGHK1swwNTww6toBnb+utO/au39Hj00T/BIIEcAOBkB5FUc+/
	s+9xXvTgOPH9HovBha0vAAaSc4qBWwciFgJYctvpbPSwW0EnxwWLreG6Hg5iezCwgm2Y1Ht9n+Vsm
	VhuAYsCFcaTnTmElSze8ZcG4DOrM10ctlaAzhvQpJgYttneuuhDtzJaCkmtDsNt9QzPjCsBHTUizt
	Ls9OGC5HxfZjEv2t+duoTsPtQBP+89LSGsu6DhO/i3YSfEU35c82vHTPQZR8IOjKhsGVB3GiUyx2I
	cAokSrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WTN-00000004mne-2LyR;
	Tue, 30 Sep 2025 09:16:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WTC-00000004mgW-1yUY
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 09:16:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HeGb001100
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZJH/ZtkwOxo
	V8E6xs5G3pO8BZxsKdEzfnAjYiBZUsv8=; b=YxehpsrYLQp3bbuvCxG31q+M5bR
	PfIC5F8nxmQ+Mb9CiZxaIKEUKs8rNdLy8HrdgO3TYZItGVPtocPkqwVG0GGGSntr
	KDpWW0zHGsoqh5gKp9G010JqWyxnL5mpwZyNlH72H8VRIefCR1b2hpRL55NEKR1T
	MHVDDcuID42dc5+a6/4BXkiDjptBlDyUL8evTLPxtft9JSKqPBihiHxxIFg/lf/4
	ws+201J6CcklxkpVqflY/rEAangxYsKYO15LtlU5PxLp8TNC8YIH9iir2xpATokI
	z+NvkBbIcsT0HM9Y3Gg2tm5EnQlG5wfNRjLtgHMpBJ5a21DoqyaWllsC0Sw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr3w6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:16:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-783604212ebso4594709b3a.3
        for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 02:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223784; x=1759828584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJH/ZtkwOxoV8E6xs5G3pO8BZxsKdEzfnAjYiBZUsv8=;
        b=ewxeh9ownPSlFAKxGs7vUeigZktEU9859/8qfXV2MSPSqYOFoEZeRvdGecRscrYFpb
         lWFhPX5uQGNO0X+bpvT6FTRCWoZEUcIsP0XVbC8/M8i7P3kmsHLCR6ca4eZrR7ngrcLk
         ty7DJdBSQT/SBE/UaInju24qcERdBb3jCq21isauo1807TOOSa88GpxHserz0uwfeAoX
         VkZS2y4aDUlMh4KRAPaqed6pgety+MddEq+Rg+EWZW6kp0A69gVGfXGglCk1/vQimHtp
         BV29t3YQxf+ekPM8NpSlhAwK1ssIX2osEbFkTro7Y7zaOcEKi4sxACL9OgenT+4sZbP0
         JmkA==
X-Gm-Message-State: AOJu0YzyvnrcAiGFOoNIM1mCRJJ/QD7sD3d0JbhW2lP7+mjgP6Lf/kMv
	yAUaM4nJTnnNMPSVPTim+69pM+6whgzEueoEaWd8OQXTDa6PmRPBNd7+ZQMZLDBHJ6ut01//sZb
	eHZuFCdCn4961tEMCKjpMePOgJAP8kXFYjqqw9IVEQNmHpeg86Wl5geqAZTQGLn0Hvg9A/wH8
X-Gm-Gg: ASbGnctfrmRddDmiax97CH7+jUiJeGklk3iy6lRgYQesmxhsB3BcQAUd8yYLv0YutQR
	JrP/co5pkZPxrKxZU5yzqJmNi+vWjanrDiH3zPXh6NIfZa7vqa9pxqXZZUoDCZ5HqzvrXNL+4X2
	VDn0rWkGKPEmpxpG/FPWe6ixg1TG1AuFy7XlmFlgaq+ssSOYDo+9wMJrCX6aJOTN1mbLJBrV6FS
	FTIMOIxwiDAQUolBcy+g89eRnD3vappxf8ciXpdjEOKFfKq+CZFg4RPJ18ofDJlDNRv+TlsRZIZ
	h7fhLzK89qFGCnasIf7+ZVJF2+Fg0+tKYoRhLQYTtdyC6vF003n7lg+zvi2Rq7uS4sbSJEMfxxF
	dcK8ydYwGsfhFCfciVASzdEX2w9ZjfeoXxDpuin3t19yk7Z9ZEHfXyC7NJvofzSItrKA=
X-Received: by 2002:a05:6a00:2e1f:b0:781:1a62:4a30 with SMTP id d2e1a72fcca58-7811a624f87mr16511500b3a.4.1759223783799;
        Tue, 30 Sep 2025 02:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGibKp7B//qOqxI5zAQQqr5glMnnDl1vHh24fU8qvthO2SKNqMWMbB9NDwoG+iADv8nM231+w==
X-Received: by 2002:a05:6a00:2e1f:b0:781:1a62:4a30 with SMTP id d2e1a72fcca58-7811a624f87mr16511445b3a.4.1759223783306;
        Tue, 30 Sep 2025 02:16:23 -0700 (PDT)
Received: from hu-sarishar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b26644sm13431963b3a.67.2025.09.30.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:16:23 -0700 (PDT)
From: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: track dropped MSDU buffer type packets in REO exception ring
Date: Tue, 30 Sep 2025 14:45:51 +0530
Message-Id: <20250930091551.3305312-3-sarika.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
References: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfXyD/8iJcp0pi9
 KhP1/9ejMBNsES83+n7uuPHkKyJAJkCV+Myj+AGmfPNNtR4fugaHMNhZV5amVivNiGTY13bBXTw
 oXQTAUwobAwuHb4Q+Y6Mm8pusHlTicEH6mpQ6rWn2nyKhD0NsSR6N1B1ZWoNKmah4TtYWr7Ybi5
 P3dGf/qa1okKOgJJZD/eFVmpkHcFaRRPnBH+zlvJXP/U6TBSD+RS0fTExW4U3OM80mTnRJATpi9
 XzTTKqbE/NNzBbs+hhXLC+X3mOUaFfIMw2uedJrNF7N6XWYflRM/UkjXZQVr1SDAvfeTay6kwQQ
 6il5oc9qnuVRUnq515T0qr2Le8rjaVLDxb+3v0E497G5IqfoTcRP9n6BEToxi6yigoY5WuIPq5m
 YjMCfPzuw6bGSdVKB0dWDOhJ/vgOcQ==
X-Proofpoint-ORIG-GUID: IHvu6dsQ-3s2BbjRWQ9NBAU0erTVFjlr
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68db9fe9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YO4AT9S2ZIYcgAK9BHQA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: IHvu6dsQ-3s2BbjRWQ9NBAU0erTVFjlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_021626_656734_B91276AF 
X-CRM114-Status: GOOD (  17.70  )
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

Add a counter "reo_excep_msdu_buf_type" in
ath12k_debugfs_dump_device_dp_stats() to account for packets dropped
due to unexpected MSDU buffer types in the RX error path. These
packets are discarded to prevent incorrect parsing and potential
kernel crashes. This helps in debugging and monitoring RX error
handling behavior.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h    | 1 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 5 ++++-
 drivers/net/wireless/ath/ath12k/dp_rx.c   | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3d1956966a48..48d95ea7b3db 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -963,6 +963,7 @@ struct ath12k_device_dp_stats {
 	u32 tx_wbm_rel_source[HAL_WBM_REL_SRC_MODULE_MAX];
 	u32 tx_enqueued[DP_TCL_NUM_RING_MAX];
 	u32 tx_completed[DP_TCL_NUM_RING_MAX];
+	u32 reo_excep_msdu_buf_type;
 };
 
 struct ath12k_reg_freq {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 16601a8c3644..15219429d4ed 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
@@ -1178,6 +1178,9 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "\n");
 	}
 
+	len += scnprintf(buf + len, size - len, "\nREO excep MSDU buf type:%u\n",
+			 device_stats->reo_excep_msdu_buf_type);
+
 	len += scnprintf(buf + len, size - len, "\nRx WBM REL SRC Errors:\n");
 
 	for (i = 0; i < HAL_WBM_REL_SRC_MODULE_MAX; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 99d29eda26cf..6c9f0839c83a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3790,6 +3790,8 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_base *ab,
 	struct sk_buff *msdu;
 	u64 desc_va;
 
+	ab->device_stats.reo_excep_msdu_buf_type++;
+
 	desc_va = (u64)le32_to_cpu(desc->buf_va_hi) << 32 |
 		  le32_to_cpu(desc->buf_va_lo);
 	desc_info = (struct ath12k_rx_desc_info *)(uintptr_t)desc_va;
-- 
2.34.1


