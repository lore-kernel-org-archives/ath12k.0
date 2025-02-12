Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2460BC021A0
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 02:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZAw5hbdY76KOMmAK5YeVelDyMrFKIyauU3evVYq/Dk=; b=Q/LYbDCzF0X3/XGLMwi14W751p
	/Gy+aDedGaOspbm5HSvwVlvqabeYdVxVA2aud+fFGfNmmnIAZNhIiIpJ31OHYps1/f56yMNNSoFE4
	sPjzu6IfTaQvAEjdPc5fJmE8wzZ7alvqo9AR/YtFJ5IZooKcmNiGIfeQlYGYTiNYj4MyNxAJNt23t
	6cjhUpEhdcrvHPc4U+xxsziWCULjnNghIMhazymKyjyCyklOKNuXz3/f2WpeS4reO/+SbNuYsD9Vs
	rS1WI97bEJgic/YG9BCu42WJmnHZ9IK5V55830L/lFm7pkn0j7pEQ/+SP7Eb8ILWZSXuEnMMhXMMj
	UOtpxu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti2eD-00000005yAU-3jvP
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 02:38:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti2eB-00000005yA8-26b5
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 02:38:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C0Udxo030555;
	Wed, 12 Feb 2025 02:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dZAw5hbdY76KOMmAK5YeVe
	lDyMrFKIyauU3evVYq/Dk=; b=nYHcYVN4CoUKigr1TKL+rD5rz4YmAG4WwzX3nJ
	rpcigqivsOLHd52LhSU8V2ztZeN4lCIapJHQGo1Y/tK0ry4yWB2HKXDHTuDd8B1N
	Pd5LHKzJLba7SMePFG8D2oKIpsHCAFmwMKQ1idyArol37Y/UtGuyAK5+WtAixfoZ
	QYQgc/5y0tVHrg3FKJTbWH1QkIHrFW2Iocx0YPRnMZZ6v8mrgcrVjtSEHBt9YWRL
	Sq6txiFsxG4piqLuIOg+TigyiQhyTG/Qv46c0Nf7YKeZYWt6FfOLzNvpErP0F2bh
	Ob7gi5KywavYVGCxNjBNXkrki9EdoYksmPAcmIfv1PACsObw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9kcyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 02:38:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C2cdtC003969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 02:38:39 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 18:38:38 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: avoid deadlock during regulatory update in ath12k_regd_update()
Date: Wed, 12 Feb 2025 10:38:29 +0800
Message-ID: <20250212023829.3300-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QbJsiYS3iK02njbb2o1DTuefgcR7Bpw5
X-Proofpoint-GUID: QbJsiYS3iK02njbb2o1DTuefgcR7Bpw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_183843_734837_25434617 
X-CRM114-Status: GOOD (  21.70  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Running this test in a loop it is easy to reproduce an rtnl deadlock:

iw reg set FI
ifconfig wlan0 down

What happens is that thread A (workqueue) tries to update the regulatory:

    try to acquire the rtnl_lock of ar->regd_update_work

    rtnl_lock
    ath12k_regd_update [ath12k]
    ath12k_regd_update_work [ath12k]
    process_one_work
    worker_thread
    kthread
    ret_from_fork

And thread B (ifconfig) tries to stop the interface:

    try to cancel_work_sync(&ar->regd_update_work) in ath12k_mac_op_stop().
    ifconfig  3109 [003]  2414.232506: probe:

    ath12k_mac_op_stop [ath12k]
    drv_stop [mac80211]
    ieee80211_do_stop [mac80211]
    ieee80211_stop [mac80211]

The sequence of deadlock is:

1. Thread B calls rtnl_lock().

2. Thread A starts to run and calls rtnl_lock() from within
   ath12k_regd_update_work(), then enters wait state because the lock is
   owned by thread B.

3. Thread B tries to call cancel_work_sync(&ar->regd_update_work), but
   thread A is in ath12k_regd_update_work() waiting for rtnl_lock(). So
   cancel_work_sync() forever waits for ath12k_regd_update_work() to
   finish and we have a deadlock.

Change to use regulatory_set_wiphy_regd(), which is the asynchronous
version of regulatory_set_wiphy_regd_sync(). This way rtnl & wiphy locks
are not required so can be removed, and in the end the deadlock issue can
be avoided.

But a side effect introduced by the asynchronous regd update is that,
some essential information used in ath12k_reg_update_chan_list(), which
would be called later in ath12k_regd_update(), might has not been updated
by cfg80211, as a result wrong channel parameters sent to firmware.

To handle this side effect, move ath12k_reg_update_chan_list() to
ath12k_reg_notifier(), and advertise WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER
to cfg80211. This works because, in the process of the asynchronous regd
update, after the new regd is processed, cfg80211 will notify ath12k by
calling ath12k_reg_notifier(). Since all essential information is updated
at that time, we are good to do channel list update.

Please note ath12k_reg_notifier() could also be called due to other
reasons, like core/beacon/user hints etc. For them we are not allowed to
call ath12k_reg_update_chan_list() because regd has not been updated.
This is done by verifying  the initiator.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
v2:
 - rebased on ToT
 - reformat commit text to make checkpatch happy
 - update copyright

 drivers/net/wireless/ath/ath12k/reg.c | 37 +++++++++++++++------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 439d61f284d8..987fcca71504 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/rtnetlink.h>
 #include "core.h"
@@ -55,6 +55,24 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	ath12k_dbg(ar->ab, ATH12K_DBG_REG,
 		   "Regulatory Notification received for %s\n", wiphy_name(wiphy));
 
+	if (request->initiator == NL80211_REGDOM_SET_BY_DRIVER) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+			   "driver initiated regd update\n");
+		if (ah->state != ATH12K_HW_STATE_ON)
+			return;
+
+		for_each_ar(ah, ar, i) {
+			ret = ath12k_reg_update_chan_list(ar);
+			if (ret) {
+				ath12k_warn(ar->ab,
+					    "failed to update chan list for pdev %u, ret %d\n",
+					    i, ret);
+				break;
+			}
+		}
+		return;
+	}
+
 	/* Currently supporting only General User Hints. Cell base user
 	 * hints to be handled later.
 	 * Hints from other sources like Core, Beacons are not expected for
@@ -211,7 +229,6 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 	struct ieee80211_regdomain *regd, *regd_copy = NULL;
 	int ret, regd_len, pdev_id;
 	struct ath12k_base *ab;
-	int i;
 
 	ab = ar->ab;
 
@@ -275,11 +292,7 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 		goto err;
 	}
 
-	rtnl_lock();
-	wiphy_lock(hw->wiphy);
-	ret = regulatory_set_wiphy_regd_sync(hw->wiphy, regd_copy);
-	wiphy_unlock(hw->wiphy);
-	rtnl_unlock();
+	ret = regulatory_set_wiphy_regd(hw->wiphy, regd_copy);
 
 	kfree(regd_copy);
 
@@ -290,15 +303,6 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 		goto skip;
 
 	ah->regd_updated = true;
-	/* Apply the new regd to all the radios, this is expected to be received only once
-	 * since we check for ah->regd_updated and allow here only once.
-	 */
-	for_each_ar(ah, ar, i) {
-		ab = ar->ab;
-		ret = ath12k_reg_update_chan_list(ar);
-		if (ret)
-			goto err;
-	}
 skip:
 	return 0;
 err:
@@ -770,6 +774,7 @@ void ath12k_regd_update_work(struct work_struct *work)
 void ath12k_reg_init(struct ieee80211_hw *hw)
 {
 	hw->wiphy->regulatory_flags = REGULATORY_WIPHY_SELF_MANAGED;
+	hw->wiphy->flags |= WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER;
 	hw->wiphy->reg_notifier = ath12k_reg_notifier;
 }
 

base-commit: 704a2d7237043317ed1b0f8a08203e9ddde70097
-- 
2.25.1


