Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48629C02196
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSD2xSqgc+UtRZaCrfIPDdeC6n1yLrDoUby1rjCIZRE=; b=1g74s7SfNrctdCUrEY4E+UkI4P
	U0YU4vnUS54onerg8oHRRYqZc/L/ydfkea/s2kyEy/C+M9U+iBBpfH3hsAk+OhnYfvnE4hQGhX4AO
	mAUamPkdxywqjqEZh61H6ktZDcJkp8TK51G705nmFmzai0VMilVFvTvyDHaazUaaWZDJemKcsUBa+
	XpQtvobbPqBxBLNVsZ5cdWLIzQlm0jlVUTTKwpfaK5rCV5njDoaQTyJiigpUdDNIXDBQgzVFIAJlf
	0UCQFhJp4oR/9yaXaVqozvgbrsri1wab/aBaeWdTSGQusjaHANTP1Sl72u/974jIn105wuczzqI6J
	a61KR9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATt-0000000HE1F-0D0w
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATp-0000000HDzG-3K1I
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141BdD4021166
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSD2xSqgc+UtRZaCrfIPDdeC6n1yLrDoUby1rjCIZRE=; b=JvxtmIXjoIYFfxte
	+GG7fsBK6w8KIL09Ut4vyjq3Lykgqm8F2fGSWV1kF4rQvi5YB3pZJBIfwqmvbsRa
	30jS1khygjm3xhRV/oH+SJSRCAaSTDGyLn+J14w6gpm7M2Yi7Wg4OGkLs2PJRmCA
	pC8MVRidmPGrLtXH7DYpVcXqXVSNMdDXJsh2PuqeryBRbiackc8CZGyHTaS1p1S2
	ZuWNLakPNY6CJHX8N5VlG5pcRl1zIKhRBz8FGv2YbwKbys1i8DdatEpFu69LQUoK
	MhTPaG3jjpIybd3DU8zlSJbEtE0ObJjKUMeQDitnBbfBjQqUloydert1CAlqbj9e
	m1XDjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k911gah7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2162f80040aso108875085ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643047; x=1739247847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSD2xSqgc+UtRZaCrfIPDdeC6n1yLrDoUby1rjCIZRE=;
        b=d2msPoEwc88bssGZCkHHrBW/3AQAIz1ITZbJ4ik9p+kChl2dtDzqPGr5g7EV7IlXRU
         wK6xp8Q2iGAEXgRO/zd699F1BNZiYoBN62m3XfewjK54ID/dqFHtj4YcRta6VftUZmWY
         vNqyTfmCK4GZxnmv0JjXlrNBw/A9J8fbXWCps7EcVR9gvJRlaNdW+4Cbl84V6LEukfOW
         AnhMcxwbQi72G4/vp1Njvhd0COroQXAQsi0qG/EbsFruIiOXPRBCOE3ENhK0GT3HeHdf
         7vsYzgEKCX3ffO52L3YX/XlVeOpYogrj0ndqazbJOc68FtvznH0FU5bgWJiFzhvgN0ax
         p+bg==
X-Forwarded-Encrypted: i=1; AJvYcCVbOdxLquVilloE9XfIDmTAahp0E6vTNNEsqOEY9I2U45Y2cxIJHUpdfbyhrU0rEl/Se2K/Zww=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9DRtlOJ5doQaBHOBI6DJL4ozLX7N1hr3Shiv+HRb/85iUbNxI
	2lOL7cTyEDBnoJw/A6vJdws0+NVpi1x5AjdmZ5F53ueWhKCcMyqeHU2mffGmLayOjteKZZVrEyy
	6Sm3hUlkNPGtrzZLUsEwRvfQqpnNOYjxPm2WLDaE5pZUcOQw9HjkoTpUJI88O1aXuc6q9
X-Gm-Gg: ASbGncthuYdA7NBI+XI5hjvVIwrV/58F1MFv4Eyg59/Jy6Mubs4YGdKlxdAcA394z+9
	UU6apuoqpSDecgpNZcGK+NtJFy/5JxLqlvV//tFRxuUgg3gZW0npMPCh/dML826WKREIS/njaDR
	TeY+aNRDcBOzCk0Gl62zN48psNDI2v2PJWLjk3lP7dgiB/pcMl5MLh0r5QFoicZpozJ+olJsQf9
	biB5uJ7wFMCV/fB89gs1EKCZdymFgfIuBMJlLDj53Wn04xzqAsm5gGlLVjZjdjNFNK8Px2kvE1c
	hfj+6wNHAu0wK6KeW+UAhtHy2QHQp5bmTHWMA/0UAdQZgr2sMgKFbQlYiDEeLIuIPmtnHF5NatJ
	P0rDQz21axKYtPEBeAAs3gIl0BaeY0w==
X-Received: by 2002:a05:6a21:8dc8:b0:1e0:d934:6189 with SMTP id adf61e73a8af0-1ed7a6e12e6mr41633274637.31.1738643047462;
        Mon, 03 Feb 2025 20:24:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnli/E874b/FlDlx0jep/rC6suUy2lsy1H+BJH6Rq1iVfIuI+6c0/qJ8tC48WQ/GeAsfZA2Q==
X-Received: by 2002:a05:6a21:8dc8:b0:1e0:d934:6189 with SMTP id adf61e73a8af0-1ed7a6e12e6mr41633241637.31.1738643047073;
        Mon, 03 Feb 2025 20:24:07 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:06 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:44 +0530
Subject: [PATCH 4/8] wifi: ath12k: remove redundant logic for initializing
 arvif
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-4-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4YtMBytzfOPXzPBr-OL0P0IDTFeeHGlQ
X-Proofpoint-ORIG-GUID: 4YtMBytzfOPXzPBr-OL0P0IDTFeeHGlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202409_969102_FA7A947D 
X-CRM114-Status: GOOD (  18.19  )
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

The current logic for initializing arvif is present in both the add
interface operation callback and ath12k_mac_assign_link_vif(). The former
handles deflink initialization, while the latter is responsible for other
links. This redundancy could be avoided by using a common helper function.

Hence, add a new helper ath12k_mac_init_arvif() which initializes a
given arvif.

Since synchronizing rcu is not required after adding a rcu pointer, remove
that now.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 80 +++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7defc2b20fb61dcaec06d0e332c48a1b6cd2f5d6..5f0388002e16c38a834d6c7c6c020b7afa7044f0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3973,13 +3973,59 @@ static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
 }
 
+static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
+				  struct ath12k_link_vif *arvif, int link_id)
+{
+	struct ath12k_hw *ah = ahvif->ah;
+	u8 _link_id;
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	if (WARN_ON(!arvif))
+		return;
+
+	if (WARN_ON(link_id >= ATH12K_NUM_MAX_LINKS))
+		return;
+
+	if (link_id < 0)
+		_link_id = 0;
+	else
+		_link_id = link_id;
+
+	arvif->ahvif = ahvif;
+	arvif->link_id = _link_id;
+
+	INIT_LIST_HEAD(&arvif->list);
+	INIT_DELAYED_WORK(&arvif->connection_loss_work,
+			  ath12k_mac_vif_sta_connection_loss_work);
+
+	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
+		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
+		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
+		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
+	}
+
+	/* Handle MLO related assignments */
+	if (link_id >= 0) {
+		rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
+		ahvif->links_map |= BIT(_link_id);
+	}
+
+	ath12k_generic_dbg(ATH12K_DBG_MAC,
+			   "mac init link arvif (link_id %d%s) for vif %pM. links_map 0x%x",
+			   _link_id, (link_id < 0) ? " deflink" : "", ahvif->vif->addr,
+			   ahvif->links_map);
+}
+
 static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 							  struct ieee80211_vif *vif,
 							  u8 link_id)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif;
-	int i;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
@@ -4006,25 +4052,8 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 		}
 	}
 
-	arvif->ahvif = ahvif;
-	arvif->link_id = link_id;
-	ahvif->links_map |= BIT(link_id);
-
-	INIT_LIST_HEAD(&arvif->list);
-	INIT_DELAYED_WORK(&arvif->connection_loss_work,
-			  ath12k_mac_vif_sta_connection_loss_work);
-
-	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
-		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
-		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
-		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
-	}
+	ath12k_mac_init_arvif(ahvif, arvif, link_id);
 
-	rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
-	ahvif->links_map |= BIT(link_id);
-	synchronize_rcu();
 	return arvif;
 }
 
@@ -8312,19 +8341,8 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	ahvif->ah = ah;
 	ahvif->vif = vif;
 	arvif = &ahvif->deflink;
-	arvif->ahvif = ahvif;
-
-	INIT_LIST_HEAD(&arvif->list);
-	INIT_DELAYED_WORK(&arvif->connection_loss_work,
-			  ath12k_mac_vif_sta_connection_loss_work);
 
-	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
-		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
-		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
-		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
-	}
+	ath12k_mac_init_arvif(ahvif, arvif, -1);
 
 	/* Allocate Default Queue now and reassign during actual vdev create */
 	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;

-- 
2.34.1


