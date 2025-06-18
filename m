Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F44AC71157
	for <ath12k@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kx8HdG18VyDKXxGTrwIZhfVXBtWZ0wXzBh0CGv9KtfQ=; b=txYseEo9VQTPgVdPKUaujwAXO0
	ShCmcm3b3n5ducRAMahEr/QSL7+p9d0mWXKbWOFeaLGlmONTRTmikjA8PZ6YDBLCTwlZGySGo9F4h
	zn4pAhb8kf7RUtLUAm4xuuL97+XH4Xjp413bvtwW2jPgdXOf6bcBqjXhNhUxDcaUL3jmzL6DU3/PV
	IbXLNu1Y2+opth4ETSEuVhW4fiy6WsVTz8SiJMinJ43wGBLFHjBS5QzPmzeAOJQG0UcpchwW85TH9
	HztGZHxfSmJZSGrFhnihGE+ekDdNXgp93P4u728jkmF7PVMIkNYgTnjwHpLS3FjtggvIDQSBJjLHx
	BMUF14QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfL-0000000BEeN-2l9R;
	Wed, 18 Jun 2025 19:41:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxxx-0000000B83w-2YQj
	for ath12k@lists.infradead.org;
	Wed, 18 Jun 2025 18:56:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IIYjLY020826
	for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 18:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kx8HdG18VyDKXxGTrwIZhfVXBtWZ0wXzBh0
	CGv9KtfQ=; b=Sdpnz0nFoLlZoLjk5gmobP2vDasjPWgR25MWMxgIt3j6h5ffKgW
	4887MyJorwMz3Gc9lk7h9QQpzlNPKThHvnXNJ9sVwIMu53cHbuCUJfxYuHWv8SPD
	5B06wLL8LKN3+nY21a4nBJiY4FVzcOMDKS/NVeuuQKhUQKPh59FraLlHZLaCItJM
	vhOp6sKpjeprSNGOnFFU2kvx5xO/60MzkXfhfrvQdZzHN+IA1OjKCjYj6FL61TW+
	JgFZir1n5pZEy8BnrEsc1z0RrOCyA+e0JLhfg+0uq2kYHoyROPEn3TdFoBhtK6/I
	mwqK9A5BIPweSsOViw8KBF0KpGHDmf+y9sA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9d9br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 18:56:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so159075ad.3
        for <ath12k@lists.infradead.org>; Wed, 18 Jun 2025 11:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750273014; x=1750877814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kx8HdG18VyDKXxGTrwIZhfVXBtWZ0wXzBh0CGv9KtfQ=;
        b=crNuAfIQtacXV6uS1oytt/stZiWm3aRtzWtTVheGGMEx+Ow8kxxjEu2iD8Sq1xVJqi
         cg4fTmiNxdJgJF6ZhGWSADCOKKeRC8gao/Mj5ocZApYG7dIXK5O+3TclANXOgOXAJyyE
         1tk5DOlGvmUjDGQ+GPcBQ0zGOkJxrPr3pEkUVLqM8AwZ8R5upBXJPGj/Qtx9pMvuxQ5g
         t4cisJKp6doSc0I50lFPAs7NRqAcb6GJebE+AXKa9/brgKLvM/T45XI3fNoG9EtmsXa6
         YwR8lb29a+cil05QsE8BMEkXm7cTiByHfUb8uV48l+Q3VaZr/FAtRQ63CwDxiwuZvAnX
         lOOA==
X-Gm-Message-State: AOJu0YxoSA3AYE378H1ft+qXLfRi8o9LEAp7j5Kp1H2MAjstEZ14F5Yt
	OLRGB46n5GKp4yfq3/oCoHbCbxf6Jx8FMipAOkaUXTjeslbMBB/v8UDzDJRDtHoaFsu8QtLfqU8
	TMttvBy+k2lOTgWM4rgZskM2URXokadLHBN/TSWyGTpXy6EaDQrDN2kG5y8+yAT//0zqNezjD
X-Gm-Gg: ASbGncvNu9P9YuDW4p937yg1zcCHv8fEk6YDTe3Wek260P8o2XZ80Fd5C99mAxaeJNk
	9cHV7O4E/pdDdDGVXPrCRqd+RRO4ktsW81Rs67Jnhdf/l5F5pyPGvKaBvZj4WUPihgz7BmOhfPK
	IAEBw6+Qp7XeBK0q8JJWooWxDolp69Y5JBYLEvmLLHTAENpUPiSFNp446/Xks5FeGzl8U4pI1zh
	+jBVWZ4YNHhFC3TBntDPco2gKJwotxsSe8wjOx/mICOcH+3b3vXtrSXt4jEM+84v+VNI9s3A5WO
	CnXWgulrIfgx1z0nNJVT8Ie6hBM3zjjqV4aP1q4xn2kU5TtQh7/aiRtzQd1j5x05+MjIh3xBnxe
	ZqqrHZAAccuthtaxDIzAtENNbkCvNacOyN5XrFae3lWzsfFqUdjM=
X-Received: by 2002:a17:903:1b0c:b0:234:ba37:879e with SMTP id d9443c01a7336-2366b3c3c7cmr296753185ad.38.1750273013618;
        Wed, 18 Jun 2025 11:56:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF18Jiq7IRmgSlgVAZg7mArKxxi+Si93V0vX3POGyss1Ij62DBzXhixoYtE3oKcfMqpWtXBEw==
X-Received: by 2002:a17:903:1b0c:b0:234:ba37:879e with SMTP id d9443c01a7336-2366b3c3c7cmr296752875ad.38.1750273013183;
        Wed, 18 Jun 2025 11:56:53 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0cffe6sm103589305ad.245.2025.06.18.11.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:56:52 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Avoid accessing uninitialized arvif->ar during beacon miss
Date: Thu, 19 Jun 2025 00:26:35 +0530
Message-Id: <20250618185635.750470-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: svrMf3SihqZa9Nz-z8A0lC4nAhhamXLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2MiBTYWx0ZWRfX2/26fL83yP3D
 pSkYczQI5c7TsO+mbw5ixJb7RQNE15p2/9L1e4NL1k6sCSIfb/pbYMWhcb8uKj6keTHAmASJIrm
 vAaGKBx/ThffI2rAJ7Jr86BsX7e84CjK2IF8dn59JmSsysmLciqZth3D7tpmFQYiWws7oT46NMG
 U1crkO+PZJMcGssOBZTExPXc7OzsUBdnremv/tG4fvtQrK/JQTpdBUzwE7Tfwn812fYTc38o0QT
 anYFIgPsPVXtpkmNh9vv5N5SDuld6nPbks/cthDCORM7vnx6ylATsjAjqSBHfjPxjOC1wWq58b0
 pXZycP/o0SP8hV6lkYnPNfT/JhXD51/pbFhg4y71FdMTxo7rbp1pUrUDorsh+Z64BZzd+wpLqhu
 T3iE0VERk5H0f4JZm4356/VnAT6hBco7/xkvoihvUnONjBxaVPNVO9tFG9EHK7yVjDC8eG7R
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68530bf7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=oDydKND7yF-1bX00yyYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: svrMf3SihqZa9Nz-z8A0lC4nAhhamXLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_115657_787184_CE5D2C27 
X-CRM114-Status: GOOD (  17.62  )
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

During beacon miss handling, ath12k driver iterates over active virtual
interfaces (vifs) and attempts to access the radio object (ar) via
arvif->deflink->ar.

However, after commit aa80f12f3bed ("wifi: ath12k: defer vdev creation for
MLO"), arvif is linked to a radio only after vdev creation, typically when
a channel is assigned or a scan is requested.
For P2P capable devices, a default P2P interface is created by
wpa_supplicant along with regular station interfaces, these serve as dummy
interfaces for P2P-capable stations, lack an associated netdev and initiate
frequent scans to discover neighbor p2p devices. When a scan is initiated
on such P2P vifs, driver selects destination radio (ar) based on scan
frequency, creates a scan vdev, and attaches arvif to the radio. Once the
scan completes or is aborted, the scan vdev is deleted, detaching arvif
from the radio and leaving arvif->ar uninitialized.

While handling beacon miss for station interfaces, P2P interface is also
encountered in the vif iteration and ath12k_mac_handle_beacon_miss_iter()
tries to dereference the uninitialized arvif->deflink->ar.

Fix this by verifying that vdev is created for the arvif before accessing
its ar during beacon miss handling and similar vif iterator callbacks.

==========================================================================
 wlp6s0: detected beacon loss from AP (missed 7 beacons) - probing
 KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]

 CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 6.16.0-rc1-wt-ath+ #2 PREEMPT(full)
 RIP: 0010:ath12k_mac_handle_beacon_miss_iter+0xb5/0x1a0 [ath12k]
 Call Trace:
  __iterate_interfaces+0x11a/0x410 [mac80211]
  ieee80211_iterate_active_interfaces_atomic+0x61/0x140 [mac80211]
  ath12k_mac_handle_beacon_miss+0xa1/0xf0 [ath12k]
  ath12k_roam_event+0x393/0x560 [ath12k]
  ath12k_wmi_op_rx+0x1486/0x28c0 [ath12k]
  ath12k_htc_process_trailer.isra.0+0x2fb/0x620 [ath12k]
  ath12k_htc_rx_completion_handler+0x448/0x830 [ath12k]
  ath12k_ce_recv_process_cb+0x549/0x9e0 [ath12k]
  ath12k_ce_per_engine_service+0xbe/0xf0 [ath12k]
  ath12k_pci_ce_workqueue+0x69/0x120 [ath12k]
  process_one_work+0xe3a/0x1430

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: aa80f12f3bed ("wifi: ath12k: defer vdev creation for MLO")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/p2p.c |  3 ++-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 59ec422992d3..5be7b79db341 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -693,6 +693,9 @@ static void ath12k_get_arvif_iter(void *data, u8 *mac,
 		if (WARN_ON(!arvif))
 			continue;
 
+		if (!arvif->is_created)
+			continue;
+
 		if (arvif->vdev_id == arvif_iter->vdev_id &&
 		    arvif->ar == arvif_iter->ar) {
 			arvif_iter->arvif = arvif;
@@ -1755,7 +1758,7 @@ static void ath12k_mac_handle_beacon_iter(void *data, u8 *mac,
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif = &ahvif->deflink;
 
-	if (vif->type != NL80211_IFTYPE_STATION)
+	if (vif->type != NL80211_IFTYPE_STATION || !arvif->is_created)
 		return;
 
 	if (!ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
@@ -1778,16 +1781,16 @@ static void ath12k_mac_handle_beacon_miss_iter(void *data, u8 *mac,
 	u32 *vdev_id = data;
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif = &ahvif->deflink;
-	struct ath12k *ar = arvif->ar;
-	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
+	struct ieee80211_hw *hw;
 
-	if (arvif->vdev_id != *vdev_id)
+	if (!arvif->is_created || arvif->vdev_id != *vdev_id)
 		return;
 
 	if (!arvif->is_up)
 		return;
 
 	ieee80211_beacon_loss(vif);
+	hw = ath12k_ar_to_hw(arvif->ar);
 
 	/* Firmware doesn't report beacon loss events repeatedly. If AP probe
 	 * (done by mac80211) succeeds but beacons do not resume then it
@@ -9818,7 +9821,7 @@ ath12k_mac_change_chanctx_cnt_iter(void *data, u8 *mac,
 		if (WARN_ON(!arvif))
 			continue;
 
-		if (arvif->ar != arg->ar)
+		if (!arvif->is_created || arvif->ar != arg->ar)
 			continue;
 
 		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
@@ -9853,7 +9856,7 @@ ath12k_mac_change_chanctx_fill_iter(void *data, u8 *mac,
 		if (WARN_ON(!arvif))
 			continue;
 
-		if (arvif->ar != arg->ar)
+		if (!arvif->is_created || arvif->ar != arg->ar)
 			continue;
 
 		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index 84cccf7d91e7..59589748f1a8 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <net/mac80211.h>
@@ -124,7 +125,7 @@ static void ath12k_p2p_noa_update_vdev_iter(void *data, u8 *mac,
 
 	WARN_ON(!rcu_read_lock_any_held());
 	arvif = &ahvif->deflink;
-	if (arvif->ar != arg->ar || arvif->vdev_id != arg->vdev_id)
+	if (!arvif->is_created || arvif->ar != arg->ar || arvif->vdev_id != arg->vdev_id)
 		return;
 
 	ath12k_p2p_noa_update(arvif, arg->noa);

base-commit: ede00d893af8a50412c3b93067322d27fb8ee97d
-- 
2.34.1


