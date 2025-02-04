Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA68C02197
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrVb+INNM+z4pj0PiN/+xSGN0XHpDBNtY7UI5NNgmI8=; b=wXmpvh64IeLk7jv5OxH8Iq/1Vn
	9VylXFYxH9IXRH13yA3XNl+90jrV6YA+41gRduoHUXKV6USKy1CKku+i63M1Tn3DsdZo5WVDVtWS0
	W4YLrO7nIOudwnPnZuJ50+7bzStp/x3VnQeleRoBxD0Zaqprh5CJuKrxWEXjAaoftUzrmnQbjDP8M
	sl80qKAN58aPYIXOOgcrQqiUhk8aX/sfccblj97OyTsH/GMWCDME9ibvN+aXob2+RVC1j+v+RTrgz
	zFt7bEZtQdj/vo8EBsLjOOlZE0ytUUpnzTAMW1At9mEGzMB0HBxzd78601/X39bsF2k4ABlwVyT16
	iGjJgUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATv-0000000HE2z-0S9k
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATt-0000000HE1d-2FiK
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513LdnKZ030926
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrVb+INNM+z4pj0PiN/+xSGN0XHpDBNtY7UI5NNgmI8=; b=eX1zT/y8Q28g6+lI
	NelVFC6kdNacEmslF/iin8/O1Naf/xHUKjwqX4j4fnl4bedPYzE0KESrGmMS1icn
	0IUmvxUvCUS4X7c2I1lenjqIj6dYvzVDGM80JORLccDn6S/85mU610sNlLKdLScM
	ZA/hzo7H5MRPSlhhQvrPPEM/n8RKkF7yZ1a41yvmnMeZJpba+ikyaMO3tx9fjL/W
	Oo1E4gCvr50DTUhRVo7y18tlBU6Y6SYu4yiayugVE0OCsLsfcInCsUSE9xezO82y
	7S9QB0qyvjfLpisHjGKOClwDliXEhUr3EfSOIXJZge5c/l6wB0by7eQAYgQFaDD/
	FVou0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k5w5rnc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2161d5b3eb5so106772935ad.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643052; x=1739247852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrVb+INNM+z4pj0PiN/+xSGN0XHpDBNtY7UI5NNgmI8=;
        b=mh9oeGDtrwyvJYk7sOnarDXmFj60an3t7UwW4HqHT4Boryze3PdIv/od+BLIo3Rc5N
         W5d0NMEcOpn8gl4VAu197U+w3CV/7I2i2sDOGVn7TUxUZ9h+CFt3WIuf/Lipy2pvglqI
         30BwEe5FP0RpxJZX9sANb9pmLzjCH2S2WhaklbP5764z5KDHZrCzgFZpvfSNDZddaNdz
         8UTsilOv+npEVXCj3eTaqt64rsRYFVGrJLtcXiZKhDCTVPDCInACqNxJ2yPQSzJLflVW
         FqyoqS1eWHQUnfDdGoNN7adAADweWz2AiuA4dRacn2QgNXUb/c9aTDTShnqYxpgb0WfH
         YkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXog9WFwVwzR+kPDmmg6t9dAnfg8Jij6JxPyH+ojymqAE9JonV7rUB8Zf2eBZosyjuuospJHrk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq5n4qOK4OcA96+mF4nK8lyed4unkooB0IqUoPqkAOJiDJ5hir
	7c1X79KnQi8DMjCCI1hrTHAs5qJ97H55MMC9Z8vK1LYo9N3Hztp3pD2+pa6bNwB9LM4l1s/Qwqh
	RuE5TdeRoXN2M+YukvjtexD+iZVDUj5rMqgSimax4kcoux2oj4p3KS0znEbU6Ij3hc4nx
X-Gm-Gg: ASbGncu1ZltpaM1fphzWkZuODEFGu3vBlmp3e/fcW4U2gRnwH4jc/9taC9Tut8cF/+K
	TlHXLX0x16NhTtKo5+zvz467fCzdQL75pyA4Fu4536Bj+QhlLte9iYojlYB338wc5QAQzCcK/9z
	SBUQG4rdCkpqRBplFN50ieF7Fw8UfvrJmPx8OiS2YuO7Mj++Lj8D2xWasmR9lbQh0yWks9J3uRA
	z0wreLF3/R4T5PrRiCmtTjSPk6IxttzLnlNzWgBA6Izve/IVyauug/wu1AVzaaO5B9WqI0fMEBj
	wL9k3d9KmetV6h91egGibLH+y4qyGAHgMqsvjLHZpriDeTewnQ5+p1b6lx13tcZ99PpHBWd1Lht
	aPojOX1diy3CzHw6TGaBsrwNmycocmA==
X-Received: by 2002:a17:902:d48e:b0:21a:5501:938 with SMTP id d9443c01a7336-21dd7e38e38mr386772235ad.52.1738643052116;
        Mon, 03 Feb 2025 20:24:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE49ECwcCEgYzSew4ZO7UPQc13n0Kq+P/s7ciZAzDlfP1uq9+He2FL6XzGDxNA6kiAXbLbiUQ==
X-Received: by 2002:a17:902:d48e:b0:21a:5501:938 with SMTP id d9443c01a7336-21dd7e38e38mr386771925ad.52.1738643051669;
        Mon, 03 Feb 2025 20:24:11 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:11 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:46 +0530
Subject: [PATCH 6/8] wifi: ath12k: relocate a few functions in mac.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-6-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 2fxW-pVKgrX5X4X6xaGgZhpN6cU_RbpT
X-Proofpoint-ORIG-GUID: 2fxW-pVKgrX5X4X6xaGgZhpN6cU_RbpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202413_598857_16D92DAE 
X-CRM114-Status: GOOD (  21.38  )
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

An upcoming change will invoke ath12k_mac_init_arvif(),
ath12k_mac_assign_link_vif(), and ath12k_mac_unassign_link_vif() from a
line located above their current definition. Hence, relocate these
functions to above so that these can be invoked later on.

No functionality changes. Compile tested only.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 202 +++++++++++++++++-----------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index db866c1419a613103f119037b19e24b7edaa6c24..5d80bbb664ea6a710eedd7b57db3523df9c893e6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3469,6 +3469,107 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
 		ath12k_warn(ar->ab, "failed to set beacon tx rate %d\n", ret);
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
+static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
+							  struct ieee80211_vif *vif,
+							  u8 link_id)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_link_vif *arvif;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
+	if (arvif)
+		return arvif;
+
+	if (!vif->valid_links) {
+		/* Use deflink for Non-ML VIFs and mark the link id as 0
+		 */
+		link_id = 0;
+		arvif = &ahvif->deflink;
+	} else {
+		/* If this is the first link arvif being created for an ML VIF
+		 * use the preallocated deflink memory except for scan arvifs
+		 */
+		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
+			arvif = &ahvif->deflink;
+		} else {
+			arvif = (struct ath12k_link_vif *)
+			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
+			if (!arvif)
+				return NULL;
+		}
+	}
+
+	ath12k_mac_init_arvif(ahvif, arvif, link_id);
+
+	return arvif;
+}
+
+static void ath12k_mac_unassign_link_vif(struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_hw *ah = ahvif->ah;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	rcu_assign_pointer(ahvif->link[arvif->link_id], NULL);
+	synchronize_rcu();
+	ahvif->links_map &= ~BIT(arvif->link_id);
+
+	if (arvif != &ahvif->deflink)
+		kfree(arvif);
+	else
+		memset(arvif, 0, sizeof(*arvif));
+}
+
 static int
 ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_vif *vif,
@@ -3973,107 +4074,6 @@ static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
 }
 
-static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
-				  struct ath12k_link_vif *arvif, int link_id)
-{
-	struct ath12k_hw *ah = ahvif->ah;
-	u8 _link_id;
-	int i;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	if (WARN_ON(!arvif))
-		return;
-
-	if (WARN_ON(link_id >= ATH12K_NUM_MAX_LINKS))
-		return;
-
-	if (link_id < 0)
-		_link_id = 0;
-	else
-		_link_id = link_id;
-
-	arvif->ahvif = ahvif;
-	arvif->link_id = _link_id;
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
-
-	/* Handle MLO related assignments */
-	if (link_id >= 0) {
-		rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
-		ahvif->links_map |= BIT(_link_id);
-	}
-
-	ath12k_generic_dbg(ATH12K_DBG_MAC,
-			   "mac init link arvif (link_id %d%s) for vif %pM. links_map 0x%x",
-			   _link_id, (link_id < 0) ? " deflink" : "", ahvif->vif->addr,
-			   ahvif->links_map);
-}
-
-static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
-							  struct ieee80211_vif *vif,
-							  u8 link_id)
-{
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
-	if (arvif)
-		return arvif;
-
-	if (!vif->valid_links) {
-		/* Use deflink for Non-ML VIFs and mark the link id as 0
-		 */
-		link_id = 0;
-		arvif = &ahvif->deflink;
-	} else {
-		/* If this is the first link arvif being created for an ML VIF
-		 * use the preallocated deflink memory except for scan arvifs
-		 */
-		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
-			arvif = &ahvif->deflink;
-		} else {
-			arvif = (struct ath12k_link_vif *)
-			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
-			if (!arvif)
-				return NULL;
-		}
-	}
-
-	ath12k_mac_init_arvif(ahvif, arvif, link_id);
-
-	return arvif;
-}
-
-static void ath12k_mac_unassign_link_vif(struct ath12k_link_vif *arvif)
-{
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ath12k_hw *ah = ahvif->ah;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	rcu_assign_pointer(ahvif->link[arvif->link_id], NULL);
-	synchronize_rcu();
-	ahvif->links_map &= ~BIT(arvif->link_id);
-
-	if (arvif != &ahvif->deflink)
-		kfree(arvif);
-	else
-		memset(arvif, 0, sizeof(*arvif));
-}
-
 static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
 					     struct ath12k_link_vif *arvif)
 {

-- 
2.34.1


