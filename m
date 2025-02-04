Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E958C02197
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN5HH/8aK4QaE6vMfcOuIYz8YHDTi8XwCxrBcxjH2dE=; b=PvG5S6pQj1LLIXfg8YD5uq3hGu
	TZBL8EUO1Mky8iwNyd3h0i9kV6RQGidS97GmW4cMaC6NkO02BJIwTziQc9WhrjTNkHyvxcwlfTDpy
	TVGbc9lcMfiMT8+UhPW1gSPflg3y2ao9jknmqa8FdJSMLFyPZwK6BcrX3Q/DY9mmUsKyis7rMtc7u
	iity714Wm7IA4dEtHMv3icfeO9BOtNgIzqTI6uc3yR9MzobB8kRk8aVc7Bt9iJ3P8uSrYw98Ao+D7
	/O64o5QIZqSG2H8bvG8zGXWLaHxIcno+1YZfza5tGzluFrK588bjreIpuIjGnCAsTHYS4QssQxCtJ
	Uf3Pujrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMk-000000012LL-0HU1
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMh-000000012IA-02k7
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GuZm3024444
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WN5HH/8aK4QaE6vMfcOuIYz8YHDTi8XwCxrBcxjH2dE=; b=f/INd/E8o/rPhrP1
	jf9oKAxw2vaJS6NwdnTVlHhMy8gnCEGjXlWVRRtsV8ODpdJ6PTdQUIJyo6Etdkpc
	PpWi69ujlDmOF3boUtT+JfvN9u9DixUfBsryJbJh5z+XqWlqRB5dMI2wxpc164vG
	3Ds1oKebKUS2RVYylra23jB2DPNzanBbToqfen2pATw/oquUI3dC/d5AY4OhlW66
	ThdoX6THf+h49SdddNaIcUv4uHqLUdIylHfFyEXF+4dsxKgE5etWpYAGsyx+c8Cd
	SRwy2IksrSHT2fQnaNwQizHSr5QqpiJonNSJgiLipZvPRdDG/CY1e9/mm0o1cc2Z
	ku4JNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kpuy80w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f9c34c0048so2750579a91.3
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688733; x=1739293533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN5HH/8aK4QaE6vMfcOuIYz8YHDTi8XwCxrBcxjH2dE=;
        b=VqZ0LqYGrMUdhnNT1YnmMQ52SGsJ9B86iKrCWvBrnU13esXh4u0Hjjmn+fgNu/K2w2
         DWhJf0o3JYdn43s3WkJDl2C3JITE1AZKYZ15RSYJNaPUyhvu4ATINkkdMJk3Aj7/POMK
         PDHUHvS2F2qkPblWv/MGFb0kJ2WHZ1J26ga0qUVocOF2IQBqXc1OrdpJ6uw3rBR+d50d
         qJ8KwA5UjVDXTUIjkhJfSAS/UMezItOl/ey042xJrxjOvRcZU38eIjU2xuPyAWHnL7AX
         fK/VXv040dAWpCLl1u/5LeBIna8/U6BY32gCsa5wizizoVmbM2aEeYroqvoJaGkzlulu
         HszQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgR7oRFI3xj/Ga57Ct/gcBGMFvsAcv995yGOf41LftzIrvACdrtyQOk/IsQ174LMiE0Eb6TFM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHGEkC1de/72ELDTIb/kfTFgEEYI/NR5+tXiqi3nKRt1foehgV
	mg4K2xgtOZR1Hdqy4C7Ua68m56IKWWYqkgNFk0ayj0Laa4UvgV14y5LHu81V53zH8QSmUK6TdGd
	qQkIoVC4FN3U4D0Y7gdWnXqUON2GbZ8IjaDRwGRhW4VNSVCq8kdm9NZA/TSHwclDr76/T
X-Gm-Gg: ASbGncsV+Z15V4Z6p/lbavxW4lZRma1DPJQd4NPj2PetQR9OJQSx/uGuqjC963LCdvk
	W7IAvPaADG1iLT1f5FQEzDPAaB8y+On7s6GDvuW9dlVd1E3CjPLJWHcSh6jrLQDlKBEmabo7Nxq
	CM9TBtWpXgxAGRw2cVbp/xfsZIAOMehIRIOtQUSmqiEKkUxzKtIUg+qSlvsYQwqX9OnkXYv2gnY
	eY2ltvmZnCfaoaVJXQKcgCeG2ldEmxsj8IM0lurX4HvMcEOE97J1lfxHXwKQaThTPLKjx3amq+1
	ajmWPRiwkdWWp8uYdIAisopX9vOJ0LxaVKAZATtCnj0HMa+3H0GF7Uh9KCIF6UWIwTxpKMgtMMC
	ypB2nrbpwN4jgBUsAZ63vsXtWgKX7EA==
X-Received: by 2002:a05:6a00:2443:b0:71d:f4ef:6b3a with SMTP id d2e1a72fcca58-72fd0c97f99mr38907454b3a.21.1738688733384;
        Tue, 04 Feb 2025 09:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV4Scox1v8cF8o5B+dd4wbuk+Xtys9zwQP72i2ppE3zrl3iSfXErz5Ui3BkGP9bHQnBFm7Qg==
X-Received: by 2002:a05:6a00:2443:b0:71d:f4ef:6b3a with SMTP id d2e1a72fcca58-72fd0c97f99mr38907379b3a.21.1738688732823;
        Tue, 04 Feb 2025 09:05:32 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:32 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:12 +0530
Subject: [PATCH v2 6/8] wifi: ath12k: relocate a few functions in mac.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-6-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: nXXm-CGpsZ6fKJWiOzil1A9OqVxNCli5
X-Proofpoint-ORIG-GUID: nXXm-CGpsZ6fKJWiOzil1A9OqVxNCli5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090535_062231_CB3AB708 
X-CRM114-Status: GOOD (  22.27  )
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
ath12k_mac_assign_link_vif(), ath12k_mac_unassign_link_vif(), and
ath12k_mac_remove_link_interface() from a line located above their current
definition. Hence, relocate these functions to above so that these can be
invoked later on.

No functionality changes. Compile tested only.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 250 +++++++++++++++++-----------------
 1 file changed, 125 insertions(+), 125 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index db866c1419a613103f119037b19e24b7edaa6c24..4f5bda45387ee16e1ab7a3c15a72252933f29129 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3469,6 +3469,131 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
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
+static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
+					     struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_hw *ah = hw->priv;
+	struct ath12k *ar = arvif->ar;
+	int ret;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	cancel_delayed_work_sync(&arvif->connection_loss_work);
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac remove link interface (vdev %d link id %d)",
+		   arvif->vdev_id, arvif->link_id);
+
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		ret = ath12k_peer_delete(ar, arvif->vdev_id, arvif->bssid);
+		if (ret)
+			ath12k_warn(ar->ab, "failed to submit AP self-peer removal on vdev %d link id %d: %d",
+				    arvif->vdev_id, arvif->link_id, ret);
+	}
+	ath12k_mac_vdev_delete(ar, arvif);
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
@@ -3973,131 +4098,6 @@ static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
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
-static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
-					     struct ath12k_link_vif *arvif)
-{
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ath12k_hw *ah = hw->priv;
-	struct ath12k *ar = arvif->ar;
-	int ret;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	cancel_delayed_work_sync(&arvif->connection_loss_work);
-
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac remove link interface (vdev %d link id %d)",
-		   arvif->vdev_id, arvif->link_id);
-
-	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
-		ret = ath12k_peer_delete(ar, arvif->vdev_id, arvif->bssid);
-		if (ret)
-			ath12k_warn(ar->ab, "failed to submit AP self-peer removal on vdev %d link id %d: %d",
-				    arvif->vdev_id, arvif->link_id, ret);
-	}
-	ath12k_mac_vdev_delete(ar, arvif);
-}
-
 static struct ath12k*
 ath12k_mac_select_scan_device(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif,

-- 
2.34.1


