Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A087C369AB
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 02:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=McLdTTvXb1l9bjmpzpBcXmwL7POQ7Rnxj+nHgweb3tg=; b=FivGLWSaQ5JV4nMOCucIfm5P4z
	BIBB2jrtht++O0kkPlUXRb6L6j/drCLfqw6QT2bKMq0vcH7zTNUKYMiWBVUvrL4sA6T7izFuv4ySG
	UzsTfDwDj7Fp9OFJWu2nj0sC5YLIO8fEilimaxVNuVGO/aAiQvOpZAAdQSoHd7pvxBFfsWHfbby7J
	e27QdL7jVzY8MucPVgqeRkmVsslTpsuhgXsZaAsk+526njergdlqiQ2SalEEkTDIKm2arvsNiqVC+
	ZIrqPyvJes0HUIihAUo9RVucYnaLqZFn0IwtANGhgp9/gx+NSHkYjOHhppYSscG8NX7R+0h8iMaSR
	99joVFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4s8V-00000007t0G-3InJ;
	Wed, 16 Apr 2025 02:04:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4s8T-00000007sye-1UGs
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 02:04:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJ3MJl002421
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=McLdTTvXb1l9
	bjmpzpBcXmwL7POQ7Rnxj+nHgweb3tg=; b=euBGayx7iwqPn8dr9HtclXoHc9Yv
	+VGK4yN42O7GO7F4UXNfmvRoCNV4Q4X9zJowvNE+QF/wFxqFhKakyPhZVm7lMCak
	6bNMN332816UmXW9GCgC4EHeYN5KB78MIymZF4bJSDKwPUEAimzDwxgn+oUNT96L
	aAUxI4m/7TymgauJb/NKuraTM9d/+DskWU1QnKttFgH8ORxQltDmAuLgPMWOTKBT
	o7deoYY/vIH8+HFD5dKb85eXV1yLnV8UfpsI0uIj6uwdScUtf662IgFypl8LumhH
	IYLOwvalqZZJ9G7BArFgKIw6nTKs6ctdkIDJUDmuvF2vILCZ2LOhz+ZH8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk1uth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:04:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so42908625ad.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744769060; x=1745373860;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McLdTTvXb1l9bjmpzpBcXmwL7POQ7Rnxj+nHgweb3tg=;
        b=ixa4i+mCJ4GTn79i1mMdpBFnGwzUpSUqtNr7oSu55fvyElwtrXi+ImOxHuqJ03/j3c
         PzaPeaZdwlz2R/PmCJjpENlRTasEQeXL0S2TE5MFdoKPzfzIEcGZZsUco7ZQbjKUBP8R
         EwwNtRunpy3+KLAxGlbj1eyrOsPo+qhFUF4Pdr6cKl42I57/AycvYWq3EKU3Tte4Pvmc
         fpYrzktRxVsdHp9fu4uQ3SAUqN5zPC811CtIj65ZB9Vx34xz+ajoVrIi4SSmEYDOT9+A
         x8vYFbN52izQcDBvKhKntmRLIO0eJUiDwn715LlNotH2BB+DrWbgnt0GUa6rh8LsvHWj
         p8pQ==
X-Gm-Message-State: AOJu0YwgE4chKRTCJ66Wpb5nGnQEPVz4D9Mslt98JigNnqvppNso7UEx
	qWTcNY+H8ge+m1/p7iN985sPiXXy310d+vXHPwofGn4/uwdEXIfOfyATO4sxDThIhqcvcrTqKO0
	w/uGwOmb4bvggKI+sX2prslJSPKyth6Yep0zsv239KaNdJf4ZkMNdhvKYgSpQdHpKQ/fA
X-Gm-Gg: ASbGncuSja4aQUMzEQxMjzjDFhmN/bGNsPXCxKg342zs+WOE0AsJ5ZWS5Z5gct+RydU
	nYE1dq1Wqf1QBq4eGzzoCvgHb/TXLnwt641KAdRVQNq/mlKutABKd+Q0iN4JOyVDKK/jqxr4C54
	/j8/uelVNCZNKE+iZta9Qtq/geWjDcHOhimd0eFHOa0ykpJhUFHB+cTPNF3RFrW6QKFjHoYpjdT
	4Rx+p43bt9XpIj1b/fhujmfAILAjhEmNn+Lq1E8WFlTPL/B/f1Zy1HEJUHGtzfGJD50XwiEanGc
	KDU7zCK1ll2F+HaHxD2dRg1fzO3KhqkzB86Ulc1xEyjmc8dmUKx/9ahKkRHRq5rAxQ9dpB0MLE4
	a82OaEo+Fm/Q/DOmmxfxtbZFvYnpQsue0LM7VMC/FanUf5g==
X-Received: by 2002:a17:903:2411:b0:223:4341:a994 with SMTP id d9443c01a7336-22c358c60famr894595ad.9.1744769059668;
        Tue, 15 Apr 2025 19:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNSyHL4nlUreSQMoD0Q3SLW1GH83ootC65W0rrfzfdVDfwAICBeEBcvfddha3iR1aCuyQWGg==
X-Received: by 2002:a17:903:2411:b0:223:4341:a994 with SMTP id d9443c01a7336-22c358c60famr894345ad.9.1744769059309;
        Tue, 15 Apr 2025 19:04:19 -0700 (PDT)
Received: from che-siroccolnx03.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc6503sm2316175ad.171.2025.04.15.19.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 19:04:18 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Prevent sending WMI commands to firmware during firmware crash
Date: Wed, 16 Apr 2025 07:34:14 +0530
Message-Id: <20250416020414.2161545-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67ff1024 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0aF2uJ-tSyx87ITvGwcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: t1in8iUSKfn-RK7SpGEjKYWZPfgSko3E
X-Proofpoint-ORIG-GUID: t1in8iUSKfn-RK7SpGEjKYWZPfgSko3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_190421_397384_A8B1AA81 
X-CRM114-Status: GOOD (  14.79  )
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

v2: Added the tag in the commit title.

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


