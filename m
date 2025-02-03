Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64021C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzgQ7WEzKjkqJTUuDP5NT6Dy6EKSLNgaW54nzToTabM=; b=LeggMFmXrjSiPOluj2tYFXdeve
	yefSbf/z0aBHUynz4NHQHGwpNuaIo1FyYg4rbC+1gr6J8Kw9LH5AhWjd2CYTqttz6hVW0NxkZ6J6o
	UdI8y/yVNnvuu1H9gyxFDFNtSYwoj2mhqVP7iVP7otb5jJYR49R1wXom6mb3xb2cmz11Mv0KpD0+T
	3CJ+AoApNVdDUI+MhJFjh5VRvyPiA5XdCwlKN8gVspBLpV5d9svQ9vO3l+Zqce+14CXfa9yCRuI8S
	wvKCkrJ277q3X4Jf/PEKFJEk/pBWuSwvG2fV/m4d3JPEf8hHqm6r75MwRTZ6nyX63gZIykqQQZHjq
	mSfdTTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FV-0000000GhlJ-0g4x
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 21:44:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FR-0000000GhiE-2MO6
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IcVBO015487
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QzgQ7WEzKjk
	qJTUuDP5NT6Dy6EKSLNgaW54nzToTabM=; b=aIMWNip4kHAyANI0oKXlo3cMZMA
	4/69cCR4V+4B5fzJEY1m01rGB33giUufw3NNLTiGqE0FqaJjsu0ZSzDENyvYXgv5
	u2ML4TxAmpQQ+VWj66vGXtBIrOFM944XQCbvWqA2ZqAZiKflxw+uKZojErsmMojm
	x6FiQy0ItyedNHefQkeyshcf4t5PW/H3/9cDeBgM3J9z6WHmgHXmrj0T3KWrvLT6
	ArzAF0piulH5obOWvQlKiSvBJxCEFtCyPqlLvqifPigXVQqeLJgQugiS1sY/XUJj
	XYncyUtiC2+D2T8N3CmBXhFAEW9Vwz0az5CiclvFRKXUBOK8HlrBeL/l6Wg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3890c2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so13626998a91.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619092; x=1739223892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzgQ7WEzKjkqJTUuDP5NT6Dy6EKSLNgaW54nzToTabM=;
        b=wIfXdf0ei69zm+/10DgvYM9QeVplnq1hV3yIGi9m0vbPcrH4nIPsW4+6+13PaBj3Fe
         AfnTzBx0/HvhiBsuEGn7+zMsXujp0xmdrkPjHAiOHAcaHeWqbc1/xcETZJaCpAXk3ykK
         0CmXlCVxA/tGmszmnhBdWeSwGtFlr1XUSDnHr6sRr459rH/AztqJIzpg6bE6aS3TGkn/
         cm1u8us0sMZUtuLuD/LwR8zpk5XxRIMEToAUXEUhcr7f5+AvfBU10Gb+O7syM33u/7xF
         3c+NLA2WhvZhrcXdzCiLgs5qv4nhTFqeJLwK1TBsE3o2YsDtsAtL43jqst6Io/ry8EIQ
         6U+A==
X-Forwarded-Encrypted: i=1; AJvYcCVJsiGOFpExwMivUNkaSKCGyYo3aDPu9JSjhCY3WVhy7d/XPL4CrNW7p0Ebq94c8Pr+DvkT9S4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjgM2pePMyTzeJIrzoYNkr/bXxQ/QEMYJsPQ7Bdfabp6DZLgtg
	qZSHf+iS/MTe14Fj7YDw2bc/9OHvm5M5U9ORCNNUMg2AalyGnXeDDiZOyrEgaK7vZASSaJriINb
	5hjAgQwqsK7Bds5amLGM94HBi6ZrOARhVc+DdrJ26INwHBXmjCyToUP9TEWl5
X-Gm-Gg: ASbGncsmcy+nuP0lO8X+kXauEQRVzPqkYQNUUE5Eom4eHCkoPRBjSHLAHy7n6yflkZR
	DSxyFXAxEzUH3jY+uOyMxuDMfrVGkRDA7OZxT0/uba5txb/pykOzSi9h9f4nmHNlZ6Jlit+Lymt
	8q25JU6IZ2nM3WVoicmprGsPk1h5C2WZuObgH3WjK4EIxAx8fziO52I85mHFHQDC+Q2xfduQ5qL
	8Z1xOwsUPQqu/lKKhiXtSLHGIIfaAcuNEQyh1zmtxy3W6ETGl/e4bzvaC36+YqRzHnvn0X55sd1
	RYO/fjFiBI7kZW0yszPnYK3lz6ZFpJByMIFrEXVk/KKGvssdWxlL6bnfPcfb
X-Received: by 2002:a17:90b:520d:b0:2f6:f107:fae4 with SMTP id 98e67ed59e1d1-2f83abd7cdamr33973423a91.8.1738619091720;
        Mon, 03 Feb 2025 13:44:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfncbyH+z3ef2HHy3M5k7kIczzJ+qP6vF0ACkktpzZsvaYdcrXOgcKU4O7yZ/PVgow0po8QA==
X-Received: by 2002:a17:90b:520d:b0:2f6:f107:fae4 with SMTP id 98e67ed59e1d1-2f83abd7cdamr33973402a91.8.1738619091341;
        Mon, 03 Feb 2025 13:44:51 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:51 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 1/5] wifi: ath11k: refactor transmitted arvif retrieval
Date: Mon,  3 Feb 2025 13:44:44 -0800
Message-Id: <20250203214448.1978156-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XTy3Vnsd1a9F1yUWCaiz7-02yROEboII
X-Proofpoint-GUID: XTy3Vnsd1a9F1yUWCaiz7-02yROEboII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=947 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134453_598416_6A7039EC 
X-CRM114-Status: GOOD (  20.56  )
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

Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
for the transmitted interface of the MBSSID set. This will help
modifying the same code path to reflect mac80211 data structure
changes to support MLO. This also fixes an issue in
ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
inside for loop during each iteration.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 55 +++++++++++++--------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1556392f7ad4..8b81f450a216 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -1529,6 +1529,14 @@ static int ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
 	return ret;
 }
 
+static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
+{
+	if (arvif->vif->mbssid_tx_vif)
+		return ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+
+	return NULL;
+}
+
 static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 {
 	struct ath11k_vif *tx_arvif;
@@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	u32 params = 0;
 	u8 i = 0;
 
-	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 
 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
@@ -1589,21 +1597,21 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *tx_arvif = arvif;
+	struct ath11k_vif *tx_arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	if (vif->mbssid_tx_vif) {
-		tx_arvif = ath11k_vif_to_arvif(vif->mbssid_tx_vif);
-		if (tx_arvif != arvif) {
-			ar = tx_arvif->ar;
-			ab = ar->ab;
-			hw = ar->hw;
-			vif = tx_arvif->vif;
-		}
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (tx_arvif && tx_arvif != arvif) {
+		ar = tx_arvif->ar;
+		ab = ar->ab;
+		hw = ar->hw;
+		vif = tx_arvif->vif;
+	} else {
+		tx_arvif = arvif;
 	}
 
 	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
@@ -1674,7 +1682,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				     struct ieee80211_bss_conf *info)
 {
 	struct ath11k *ar = arvif->ar;
-	struct ath11k_vif *tx_arvif = NULL;
+	struct ath11k_vif *tx_arvif;
 	int ret = 0;
 
 	lockdep_assert_held(&arvif->ar->conf_mutex);
@@ -1701,9 +1709,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 
 	ether_addr_copy(arvif->bssid, info->bssid);
 
-	if (arvif->vif->mbssid_tx_vif)
-		tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
-
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 	ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 				 arvif->bssid,
 				 tx_arvif ? tx_arvif->bssid : NULL,
@@ -6330,23 +6336,20 @@ static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_vif *tx_arvif;
-	struct ieee80211_vif *tx_vif;
 
 	*tx_vdev_id = 0;
-	tx_vif = arvif->vif->mbssid_tx_vif;
-	if (!tx_vif) {
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (!tx_arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
 		return 0;
 	}
 
-	tx_arvif = ath11k_vif_to_arvif(tx_vif);
-
 	if (arvif->vif->bss_conf.nontransmitted) {
-		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+		if (ar->hw->wiphy != tx_arvif->ar->hw->wiphy)
 			return -EINVAL;
 
 		*flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
-		*tx_vdev_id = ath11k_vif_to_arvif(tx_vif)->vdev_id;
+		*tx_vdev_id = tx_arvif->vdev_id;
 	} else if (tx_arvif == arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
 	} else {
@@ -7306,8 +7309,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			   int n_vifs)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif, *tx_arvif = NULL;
-	struct ieee80211_vif *mbssid_tx_vif;
+	struct ath11k_vif *arvif, *tx_arvif;
 	int ret;
 	int i;
 	bool monitor_vif = false;
@@ -7361,10 +7363,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
 				    ret);
 
-		mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
-		if (mbssid_tx_vif)
-			tx_arvif = ath11k_vif_to_arvif(mbssid_tx_vif);
-
+		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 		ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 					 arvif->bssid,
 					 tx_arvif ? tx_arvif->bssid : NULL,
-- 
2.34.1


