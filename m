Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC1EC369AB
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 02:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=idDGPAqDhmx2tJ8Bjnk98i01+XNduU/w2CW2GcoML0w=; b=lAvXgMh+TX1LipINPm6JVu13oZ
	UOAIlSojdDGS5KzlmsFTYWjrdoq5BLG0DIRWsoGOzsa6Id+Lu4ASvmnwjssbhLdG2XuwG6/7tB/Hr
	nd8rjuMJhh7TNWzr+IG25LaAmfNaqhckZxWy5hEI6+yspzF5cNIOIcyqoysTmJZArMoH32jpOoJAU
	SrTOJW1FKxE5Gx1vu1aB3oCYR8jvC72EOxqZZHgVqj6DqvtVrVNkGeCSpkXusAMbzi+Oz3U3fxwEn
	ZkRYvqGxT50xTGo3l4So1WH93e56YXKaMeZVtJZEHO03KAsqbHDDiluwgiw+TwFl1+H+Xd9zLtN71
	EYcJ9MaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4s63-00000007sfm-0Mi9;
	Wed, 16 Apr 2025 02:01:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4s60-00000007sep-0w1p
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 02:01:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJT96q019159
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=idDGPAqDhmx2
	tJ8Bjnk98i01+XNduU/w2CW2GcoML0w=; b=bT4HNkKgqqvbPPjOho/DfK+lo1Z9
	658q7AWXBf73+Ux5eXY1x+qrXCT17UeRldCeEtA4GlcME/0LuWQg6tw53kF2xMhe
	MZhQDI0BOaudVxRUpb9pKHSA6mX/KkvlMqoDdkoKPdrfnlXaWvbHP2xHO29TvmIf
	CPqK9N1W03N5Cq5G27Z1SfgHZFd6uHP8BxEAHtE0KvoPJTyMhOFXRhyh6t6lL0EJ
	72zfUEZokzztGbPXT7pi/3ylnJ75nr2ctrMrra3AojITJsMQEzMzeymmR1iWMsEi
	ZgVajzPsLYv/tbv6aptDZoe6afydWZzdyntKLrs08fg09oKmbbCe258dcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjhwm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:01:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225107fbdc7so54983965ad.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744768905; x=1745373705;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idDGPAqDhmx2tJ8Bjnk98i01+XNduU/w2CW2GcoML0w=;
        b=n2mWnrEJEn9Fy32dwipBjhVIkrG+8ClC+ks6aYnJtb0XoSlSv5v6ZsKUTt+QAefq6o
         R5f70pDKUS08dfbsJdmW9kdLggmQtwWNxsHDxAq5R2uvSg5VJ4J9wCHJTQFI9Hvb2hnc
         IcvE+po7l26KvgGcDSicDkB4j6n7KRCJo2PuCShFhi3mqAv0G/6FuBpaQOpA0EiWXfmr
         M31SqdpHimFVCukUe55kyIl+KU+HWYbSfaKdPeT0epdyIpl891+EPFpOpKUYGBD1d7nR
         bmKtdaSVJPgJONYKRAv9PvNJBmTi+Pu7ZhQrtAY95qXOcb22cpAPVxudz8/XJuQhUHTH
         LmjA==
X-Gm-Message-State: AOJu0Yw+jhOSUZSMkNWIxbs4IsaUtHwqAVLgM3tmlCTNxUh7ctHUZfVI
	1uQ9M3eYLVHGccenjJkIWjsBbWfE+AiyeW0KChlSbbixP64tMb6gyiZ37Pc1gBSowNfdjol2OwI
	rnjpZJ6A381huuPhU2iqoAipmoAv0ZmYFQqNSsduKeNup7Ggyyp3xrVhT3WIDnwhEiXq3
X-Gm-Gg: ASbGncthvzwykZ/SKLVdoU8QdpoRJP4HNrXFSvyaR7zQ8EjCM8SbFK2i/W9Ji9Xm06w
	lJdo/mxN1f2NGwDipuirj+zjzG4KBsDcMYjrN3aJDYgdOHPdCXqhv2xH0r/Gn0SDdDrPU+f+Dc1
	tMqKJFZLorY03ot2RI01WQyqckJChB4kayUkVSZged7dxZbrPv+aHb2+BvyHbowN41p/JvqKwst
	qDJwWgGWsbiVj1WPE7ZCfiDoSXMGO52LQIaVU35fLEbe64Fx9EG/dnsPCWaDkKFmTd+d+MwZ5T1
	sDmhrlHBMX7Z6qe35ZsHL1ezblIJ5q5LOSM7JzrgeZYUHq/9bvaZalV0UROHfAG9UciSjDvW83X
	Y0ial8QqH9TBYGl8nG25rdjh6yRIoRsF+DywPgEEKIBku4A==
X-Received: by 2002:a17:902:fc86:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22c358c509cmr846095ad.11.1744768904780;
        Tue, 15 Apr 2025 19:01:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCbgAet0uemXl+73aKIuaic3aOU9FUrkIc08337Evt5XcSbofxrA2Vo7u/s5HsDCTDfQTJAw==
X-Received: by 2002:a17:902:fc86:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22c358c509cmr845745ad.11.1744768904319;
        Tue, 15 Apr 2025 19:01:44 -0700 (PDT)
Received: from che-siroccolnx03.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcbf4bsm2332195ad.195.2025.04.15.19.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 19:01:43 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH] wifi: ath12k: Prevent sending WMI commands to firmware during firmware crash
Date: Wed, 16 Apr 2025 07:31:38 +0530
Message-Id: <20250416020138.2161484-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: 9HEyiFHhnglVKw25e7Tr0iwTLRvVfL4H
X-Proofpoint-ORIG-GUID: 9HEyiFHhnglVKw25e7Tr0iwTLRvVfL4H
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ff0f8a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0aF2uJ-tSyx87ITvGwcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_190148_394500_A947F7A4 
X-CRM114-Status: GOOD (  14.85  )
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

Currently, we encounter the following kernel call trace when a firmware
crash occurs. This happens because the host sends WMI commands to the
firmware while it is in recovery, causing the commands to fail and
resulting in the kernel call trace.

Set the ATH12K_FLAG_CRASH_FLUSH and ATH12K_FLAG_RECOVERY flags when the
host driver receives the firmware crash notification from MHI. This
prevents sending WMI commands to the firmware during recovery.

Call Trace:
 <TASK>
 dump_stack_lvl+0x75/0xc0
 register_lock_class+0x6be/0x7a0
 ? __lock_acquire+0x644/0x19a0
 __lock_acquire+0x95/0x19a0
 lock_acquire+0x265/0x310
 ? ath12k_ce_send+0xa2/0x210 [ath12k]
 ? find_held_lock+0x34/0xa0
 ? ath12k_ce_send+0x56/0x210 [ath12k]
 _raw_spin_lock_bh+0x33/0x70
 ? ath12k_ce_send+0xa2/0x210 [ath12k]
 ath12k_ce_send+0xa2/0x210 [ath12k]
 ath12k_htc_send+0x178/0x390 [ath12k]
 ath12k_wmi_cmd_send_nowait+0x76/0xa0 [ath12k]
 ath12k_wmi_cmd_send+0x62/0x190 [ath12k]
 ath12k_wmi_pdev_bss_chan_info_request+0x62/0xc0 [ath1
 ath12k_mac_op_get_survey+0x2be/0x310 [ath12k]
 ieee80211_dump_survey+0x99/0x240 [mac80211]
 nl80211_dump_survey+0xe7/0x470 [cfg80211]
 ? kmalloc_reserve+0x59/0xf0
 genl_dumpit+0x24/0x70
 netlink_dump+0x177/0x360
 __netlink_dump_start+0x206/0x280
 genl_family_rcv_msg_dumpit.isra.22+0x8a/0xe0
 ? genl_family_rcv_msg_attrs_parse.isra.23+0xe0/0xe0
 ? genl_op_lock.part.12+0x10/0x10
 ? genl_dumpit+0x70/0x70
 genl_rcv_msg+0x1d0/0x290
 ? nl80211_del_station+0x330/0x330 [cfg80211]
 ? genl_get_cmd_both+0x50/0x50
 netlink_rcv_skb+0x4f/0x100
 genl_rcv+0x1f/0x30
 netlink_unicast+0x1b6/0x260
 netlink_sendmsg+0x31a/0x450
 __sock_sendmsg+0xa8/0xb0
 ____sys_sendmsg+0x1e4/0x260
 ___sys_sendmsg+0x89/0xe0
 ? local_clock_noinstr+0xb/0xc0
 ? rcu_is_watching+0xd/0x40
 ? kfree+0x1de/0x370
 ? __sys_sendmsg+0x7a/0xc0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: a9b46dd2e483 ("wifi: ath12k: Add firmware coredump collection support")
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 9c929c4ad8a8..08f44baf182a 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/msi.h>
@@ -285,8 +285,11 @@ static void ath12k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 			break;
 		}
 
-		if (!(test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags)))
+		if (!(test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags))) {
+			set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+			set_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
 			queue_work(ab->workqueue_aux, &ab->reset_work);
+		}
 		break;
 	default:
 		break;

base-commit: 176f3009ae598d0523b267db319fe16f69577231
-- 
2.17.1


