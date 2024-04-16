Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B6C4345F
	for <ath12k@archiver.kernel.org>; Tue, 16 Apr 2024 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mBAfj53NHH6k4XlPZkjXvaFjngclHvL3pD6ZElWb19E=; b=1g7jlH/lr45sswjQCfa3kd74ci
	c9S/Chx23JbcbSRwRmI5m5v1A4wxYwOgyYOjpJup5hq0vXQJWe+z+MMRo1EC/BF6hBmD7dJACPA2b
	WEy3gnZhbJvRFx+xELeYf3SfGd00rzL4h1oDvQtNXPEOfIzG+sdi7Gr/+3oUWbe8oLqDPAIitkbiB
	ss+iSb8wIEx1cMkHuwnMtkn5i5mW9Mih0edkJ31EIgogWL7qg2Kyndq7yTqX558gonvCuc+MI8zwp
	dZ5jTvOn1nOCrWlRAQ4aXTQStjHybue+MGtM2C8rFSYZ7aWyXN7OA4r11R8cjlahAeNq0Iv4g5n7x
	iMlGM5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlsH-0000000D3VF-0I04
	for ath12k@archiver.kernel.org;
	Tue, 16 Apr 2024 16:41:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlsD-0000000D3Tv-1DKm
	for ath12k@lists.infradead.org;
	Tue, 16 Apr 2024 16:41:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GEPt1T032590;
	Tue, 16 Apr 2024 16:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=mBA
	fj53NHH6k4XlPZkjXvaFjngclHvL3pD6ZElWb19E=; b=afdWNcE18+HRWOjYM36
	bgC9qZg1JH4GiOcq7z4FN0e2Gztd6ZNEJ8qU3UxFHTU1i0HvAhVVBJhy6g0siPTd
	zH5k/1TlllnY92VU5sNtr0lS9NYUev1qa1sf8SCOXj3A/o0H8f2lWI0g+4hldYIG
	BRB40tVavtt8rrJgBThyRpIzsgW+oc8mBgYVQ4CvETS5bXy6kTUQZ1DpEKrf2Xzx
	BKKpSRdvyMLXD0ljS1/M5Kjof4kYqyRLrGBNAEnGWOBrjlh8Cu3zI9VyCtHsG0qE
	9HUi+dZ+sd/pUbqMrAJLkDZVQD93/Vu0HNIYngV6K/SQmykqc2aHAvy5zgBCTufQ
	X6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xhu3agdhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 16:41:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43GGfPSL021744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 16:41:26 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Apr
 2024 09:41:25 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 16 Apr 2024 09:41:19 -0700
Subject: [PATCH] wifi: ath12k: don't use %pK in dmesg format strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240416-pk-v1-1-2c8852743e6d@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAC+qHmYC/x3M0QpAQBCF4VfRXNtC05JXkYvdNZhkaUZS8u6Wy
 6/+c25QEiaFNrtB6GTlLSaUeQZhdnEiw0MyVEWFBZbW7IvBAWuyvvF2REjhLjTy9Z90fbJ3Ssa
 Li2H+pqvTgwSe5wXiEauobQAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FMbGQQ7tOQ0bNm1Y9TMc19g7Wv1qbf1p
X-Proofpoint-GUID: FMbGQQ7tOQ0bNm1Y9TMc19g7Wv1qbf1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_14,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=927
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_094133_456656_C8F2338E 
X-CRM114-Status: GOOD (  14.51  )
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

Currently, when debug logs are enabled, messages such as the following
are found in the kernel log:

event mgmt rx skb         pK-error len 209 ftype 00 stype 50

The "pK-error" comes from using %pK to display an skb address in an
interrupt context.

Per the guidance in the current "printk-formats" documentation, %pK
"is only intended when producing content of a file read by userspace
from e.g. procfs or sysfs, not for dmesg."

So replace %pK with %p in all of the ath12k_dbg() format strings.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c |  6 +++---
 drivers/net/wireless/ath/ath12k/dp_rx.c  |  2 +-
 drivers/net/wireless/ath/ath12k/htc.c    |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c    | 10 +++++-----
 drivers/net/wireless/ath/ath12k/pci.c    |  2 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 2d56913a75d0..6b0b72477540 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -944,7 +944,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 			goto err_merge_fail;
 
 		ath12k_dbg(ab, ATH12K_DBG_DATA,
-			   "mpdu_buf %pK mpdu_buf->len %u",
+			   "mpdu_buf %p mpdu_buf->len %u",
 			   prev_buf, prev_buf->len);
 	} else {
 		ath12k_dbg(ab, ATH12K_DBG_DATA,
@@ -958,7 +958,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 err_merge_fail:
 	if (mpdu_buf && decap_format != DP_RX_DECAP_TYPE_RAW) {
 		ath12k_dbg(ab, ATH12K_DBG_DATA,
-			   "err_merge_fail mpdu_buf %pK", mpdu_buf);
+			   "err_merge_fail mpdu_buf %p", mpdu_buf);
 		/* Free the head buffer */
 		dev_kfree_skb_any(mpdu_buf);
 	}
@@ -1092,7 +1092,7 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	spin_unlock_bh(&ar->ab->base_lock);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_DATA,
-		   "rx skb %pK len %u peer %pM %u %s %s%s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %p len %u peer %pM %u %s %s%s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   peer ? peer->addr : NULL,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 977a8acb736c..2b89a8d2c08f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2467,7 +2467,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	spin_unlock_bh(&ab->base_lock);
 
 	ath12k_dbg(ab, ATH12K_DBG_DATA,
-		   "rx skb %pK len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   peer ? peer->addr : NULL,
diff --git a/drivers/net/wireless/ath/ath12k/htc.c b/drivers/net/wireless/ath/ath12k/htc.c
index 23f7428abd95..2f2230f565bb 100644
--- a/drivers/net/wireless/ath/ath12k/htc.c
+++ b/drivers/net/wireless/ath/ath12k/htc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -358,7 +358,7 @@ void ath12k_htc_rx_completion_handler(struct ath12k_base *ab,
 		goto out;
 	}
 
-	ath12k_dbg(ab, ATH12K_DBG_HTC, "htc rx completion ep %d skb %pK\n",
+	ath12k_dbg(ab, ATH12K_DBG_HTC, "htc rx completion ep %d skb %p\n",
 		   eid, skb);
 	ep->ep_ops.ep_rx_complete(ab, skb);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 09b829dce1b3..42ec834bdc86 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6630,7 +6630,7 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	ab = ar->ab;
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
-		   "mac chanctx add freq %u width %d ptr %pK\n",
+		   "mac chanctx add freq %u width %d ptr %p\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
 	mutex_lock(&ar->conf_mutex);
@@ -6660,7 +6660,7 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	ab = ar->ab;
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
-		   "mac chanctx remove freq %u width %d ptr %pK\n",
+		   "mac chanctx remove freq %u width %d ptr %p\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
 	mutex_lock(&ar->conf_mutex);
@@ -7114,7 +7114,7 @@ static void ath12k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
-		   "mac chanctx change freq %u width %d ptr %pK changed %x\n",
+		   "mac chanctx change freq %u width %d ptr %p changed %x\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx, changed);
 
 	/* This shouldn't really happen because channel switching should use
@@ -7192,7 +7192,7 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
-		   "mac chanctx assign ptr %pK vdev_id %i\n",
+		   "mac chanctx assign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
 	arvif->punct_bitmap = ctx->def.punctured;
@@ -7283,7 +7283,7 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
-		   "mac chanctx unassign ptr %pK vdev_id %i\n",
+		   "mac chanctx unassign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
 	WARN_ON(!arvif->is_started);
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 14954bc05144..5fa7a3d770ee 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -872,7 +872,7 @@ static int ath12k_pci_claim(struct ath12k_pci *ab_pci, struct pci_dev *pdev)
 		goto release_region;
 	}
 
-	ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot pci_mem 0x%pK\n", ab->mem);
+	ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot pci_mem 0x%p\n", ab->mem);
 	return 0;
 
 release_region:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index a5575ce9eed4..bd393fa032c9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5933,7 +5933,7 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 	 */
 
 	ath12k_dbg(ab, ATH12K_DBG_MGMT,
-		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
+		   "event mgmt rx skb %p len %d ftype %02x stype %02x\n",
 		   skb, skb->len,
 		   fc & IEEE80211_FCTL_FTYPE, fc & IEEE80211_FCTL_STYPE);
 

---
base-commit: 448ef71a317cc00e2ec0c1edcefbdf6df4b3e46b
change-id: 20240416-pk-4d47e6b8b6f4


