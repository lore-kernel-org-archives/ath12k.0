Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B1BC3ABC5
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 19:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwKI5jA8OMKg+8bF5bR6cOAjHSyQ+AqN+1M4Cp7EEak=; b=zj2IgOJbEWxo4tAu/CRaG6DNxt
	SDsH3B6Vc0AW6qCzFhigu5rpkWRyPh2b1bVhRmYsfrbebng0hO7hSX9Owzoihj+LfBfavU11SOlHo
	6BY53w3QfMehWLeFVQsEY+V4CpzWvdD6iUZOjQUBxy2yUEC/wFgzmNbUu3YY3OBfI1gTtIUMc8XwJ
	xYl09RXTRgp4TaxTLMionixAkOmieAMr04X+3lFUDBte1JPaqo7bBBSZvGk+73QDU6vkRRlp7dHBV
	iAtqe9KLfnOPACpNeMxkKAch70qoBEW0zzGRdcw5qDyAetdcNO+FD/w2tt+ZUZDBoPtVVjQIDGDbx
	9cmnsQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCklL-0000000GbfS-2YRc;
	Wed, 07 May 2025 19:49:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCklF-0000000GbeC-3LpB
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 19:49:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AtsIc021930
	for <ath12k@lists.infradead.org>; Wed, 7 May 2025 19:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XwKI5jA8OMK
	g+8bF5bR6cOAjHSyQ+AqN+1M4Cp7EEak=; b=I77xTJStlB1HJHuA+1P4o0UTkJU
	CPMFV7FJFsmGWHlvDSKWIBpdybhYMHY1D91TYXt11h0Sb7pYpJRyWRB7TtVW6yU8
	vgkhNKt8psdLRNYXYj340YfgWWEj0YqfNirvfMQPDLur0aQbbpMNlly2GnoiossJ
	r8mtQhKrypOxXSa3jDr7ka0d7Fl1OR9CdtvUYk4Au7p5Gtj1JvIeiqwFMnCkavMA
	UyrrI5BPIOP/W17tPzJT8oVXDBb3JuCSIPDGFyZNY55mWmoqQ/mCm1DVH/QuqRmU
	jkTjyHfgOqcWzTa5pPsw3F7P8zESKMOO2+MFQzMGPE3qt7Zp4+Nyb5+D+Ug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuy0u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 May 2025 19:48:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1d9f278aecso74501a12.2
        for <ath12k@lists.infradead.org>; Wed, 07 May 2025 12:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746647335; x=1747252135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwKI5jA8OMKg+8bF5bR6cOAjHSyQ+AqN+1M4Cp7EEak=;
        b=wOJD+sBdzTWG/ss6F7AvJN7X1OciBwMrzPUkguqhsBijZRG8DkuPBpYmA/JfOpznLM
         TkzFOnnvdONCH1TzXu5Zc6M7a9g9LpeP27cFvEfxNTcgsbIqrFx4c6Hlw5FretwdgynL
         NtpABPAxnRkuKLe4SdJfwykvfWPjUK2c34NExuWJf19R7kdoom8Nny9A43fB6UQ8fKmp
         bIZAYjht4JlL6DP/W3aqcWTakfVGgbavMH6B3z9jknA/MOz8IPIT85iFuRsuA3S8H1sB
         6INehV2RcIdFIpbNS1kGxXGMQZm1mh4qHwz6uT+xo20OuxUup2NYa4oXe0VhFXc6bFcx
         m6ZQ==
X-Gm-Message-State: AOJu0YziwwjcQbstzVhbwN4DofaW90GIfj0eHz0CqJ7hIMTvIDvnCqI2
	YH/Ev/DPZ9j8cUkAhHnQLvJwNiQc+qsgtnvOJ5blDF2yTI02c8mRauCGT4xPRrmghRKrvpHf66q
	cOI7vQNg8FYD/fMF034pKKHXlJ9hyL7JEJE6QqxSwngI3SdfmthS6ymrvXO8kakhd4Rud
X-Gm-Gg: ASbGncuIks7TcsaJsJZGiBNTU3TrUC65H4aJzBWlO9/M+HSavphAOq8PGsekAPD/Fu5
	e0WXTOtY4FmmppRqok66220ptEYnI615M3m7hCN/Z8656dW39bcj8w2dO1l+Sm/k67+c1wBghpU
	tXdH6nls8uOjJHX5eDt213Zxcq2c3LTLN3hpAQ7D3Dma57ac5mgMGNHTjf5L8vKlBx63GRZUGCm
	fWWsUMp2KmJZjyQr3IJ1GDEQcbLqhiFQuXP5z8BFlNbrvFZF3xaBUgRtLMX8UxUm3X4BPc4XFuq
	VA/dCVNYaXo4SNfPdJsmi8U1SEOuzc9zEJXxpEc89zSaV/BH2ikrBytU8aMjauUdkmpXBDPkeay
	65MA1CpvOEMmCujA4ya4XrBD/5O0F6UyctL6ridEu
X-Received: by 2002:a05:6a20:2d27:b0:204:695f:47e1 with SMTP id adf61e73a8af0-2148c21e5b2mr6199487637.23.1746647335416;
        Wed, 07 May 2025 12:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxAvWBi+9vbWSuGJzghkgb7rwjXyKrmtXfei5W9+e8FDuVL36YaW3uDbqX9QePUcf0pF5S5g==
X-Received: by 2002:a05:6a20:2d27:b0:204:695f:47e1 with SMTP id adf61e73a8af0-2148c21e5b2mr6199462637.23.1746647334948;
        Wed, 07 May 2025 12:48:54 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm9972704a12.11.2025.05.07.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:48:54 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>
Subject: [PATCH ath-pending v2 1/2] wifi: ath12k: Prepare ahvif scan link for parallel scan
Date: Thu,  8 May 2025 01:18:31 +0530
Message-Id: <20250507194832.2501668-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681bb928 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NQOVZfBc_sQf-YiYnVMA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YgeG4XKySuBB70t2fA2WnqrgCKUAFQ1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE4MCBTYWx0ZWRfX1uSGnkMFmG0T
 I1YBP5c5cv0Lhhti9OPkwJU4owAS/l8yGfLTK0HpyfxUMJPyWbtvEqoR7F1W/OuVfp3y/P6hptJ
 e0Fuka2b5F2S9rslbTtraV2od6Dr5vsGmaKlUuafn3uksoBguofcX24i63vr+S6MJHgxWMBl0SD
 TgCP16JxaDhb0A4HyDrngTPlQ8qvNKVf0sJ96SQBsIblKdp8ScvpTDNlqKSW1i/gJL3y6Pr7z0D
 f3jH25Gvk2EU6mbPRhjHj+SqbG14h2KUDFN4pLoxC4QqCNbZOvnt+VaMpfhsWv20aVn0vbEZg5d
 shy+4PLqOGR1aOcvmglpkFw6IXVIY/jM8WF5K72SG+MZbpwTZ/vDpdzAy/MwGO3TPrSXuPLTH88
 B0Jy5GFKnetY8HUCRAyy8JkfpIqYSMRI4cpJGyaRoEm9ewdcccPvoWp05i6zSU0/xPMTF3wV
X-Proofpoint-ORIG-GUID: YgeG4XKySuBB70t2fA2WnqrgCKUAFQ1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_124857_958072_423BC6B0 
X-CRM114-Status: GOOD (  26.76  )
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

When two split-phy devices that support overlapping frequency ranges within
the same band(say 5 GHz low and 5 GHz high) are grouped into an ath12k
hardware (HW) setup, they share a common wiphy instance. Consequently, the
channel list (wiphy->bands[]) becomes unified across all associated
radios (ar).

When a scan is triggered with frequency list containing frequencies of
both 5 GHz low and 5 GHz high, mac80211 generates a single scan request
to driver with all the frequencies. This is because mac80211 splits the
scan request based on band.

ath12k checks the first frequency in the requested scan frequency list and
initiates scan to corresponding radio's(ar) firmware with all the
frequencies. Firmware rejects this scan since some of the frequencies in
the scan request are not supported, resulting in a scan failure.
To fix this ath12k driver should split the scan request into multiple
scans based on requested frequencies and schedule them to corresponding
underlying radio(s) in parallel.

Currently, ath12k driver assigns the scan link (link 15) in ahvif->links[]
for scan vdev creation. However, with parallel scan support being
introduced in the following patch, multiple radios (e.g., 5 GHz low and
5 GHz high) in the same HW group may attempt to use the same scan link
concurrently, causing conflicts where the vdev created by one radio could
be deleted and re-initialized by another.

To address this, reserve space for additional scan links for each radio in
a MLO group and allow subsequent radios to use different available scan
links (ahvif->link[15..MAX_SCAN_LINKS]) when scan link (15) is
pre-occupied.
While at it, rename ATH12K_DEFAULT_SCAN_LINK as ATH12K_FIRST_SCAN_LINK
as there is no longer only one scan link.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Mahendran P <quic_mahep@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 49 +++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.h  |  7 ++--
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 31add5f8a8ff..570bbe4aecd5 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -380,7 +380,7 @@ struct ath12k_vif {
 	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
 	/* indicates bitmap of link vif created in FW */
-	u16 links_map;
+	u32 links_map;
 	u8 last_scan_link;
 
 	/* Must be last - ends in a flexible-array member.
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d3b12ce32c78..b80ae1476f5e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3891,7 +3891,7 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 	/* If this is the first link arvif being created for an ML VIF
 	 * use the preallocated deflink memory except for scan arvifs
 	 */
-	if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
+	if (!ahvif->links_map && link_id < ATH12K_FIRST_SCAN_LINK) {
 		arvif = &ahvif->deflink;
 
 		if (vif->type == NL80211_IFTYPE_STATION)
@@ -4909,11 +4909,12 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
 	struct ath12k_link_vif *arvif;
 	struct ath12k_hw *ah = ahvif->ah;
 	unsigned long links = ahvif->links_map;
+	unsigned long scan_links_map;
 	u8 link_id;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
-	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+	for_each_set_bit(link_id, &links, ATH12K_NUM_MAX_LINKS) {
 		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
 
 		if (!arvif || !arvif->is_created)
@@ -4923,10 +4924,20 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
 			return link_id;
 	}
 
-	/* input ar is not assigned to any of the links of ML VIF, use scan
-	 * link (15) for scan vdev creation.
+	/* input ar is not assigned to any of the links of ML VIF, use next
+	 * available scan link for scan vdev creation. There are cases where
+	 * single scan req needs to be split in driver and initiate separate
+	 * scan requests to firmware based on device.
 	 */
-	return ATH12K_DEFAULT_SCAN_LINK;
+
+	 /* Unset all non-scan links (0-14) of scan_links_map so that ffs() will
+	  * choose an available link among scan links (i.e link id >= 15)
+	  */
+	scan_links_map = ~ahvif->links_map & ATH12K_SCAN_LINKS_MASK;
+	if (scan_links_map)
+		return __ffs(scan_links_map);
+
+	return ATH12K_FIRST_SCAN_LINK;
 }
 
 static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
@@ -4957,9 +4968,16 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	/* check if any of the links of ML VIF is already started on
 	 * radio(ar) corresponding to given scan frequency and use it,
-	 * if not use scan link (link 15) for scan purpose.
+	 * if not use scan link (link id >= 15) for scan purpose.
 	 */
 	link_id = ath12k_mac_find_link_id_by_ar(ahvif, ar);
+	/* All scan links are occupied. ideally this shouldn't happen as
+	 * mac80211 won't schedule scan for same band until ongoing scan is
+	 * completed, don't try to exceed max links just in case if it happens.
+	 */
+	if (link_id >= ATH12K_NUM_MAX_LINKS)
+		return -EBUSY;
+
 	arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac link ID %d selected for scan",
@@ -9184,7 +9202,8 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	struct ath12k_hw *ah = hw->priv;
 	struct ath12k *ar;
 	struct ath12k_base *ab;
-	u8 link_id = arvif->link_id;
+	u8 link_id = arvif->link_id, scan_link_id;
+	unsigned long scan_link_map;
 	int ret;
 
 	lockdep_assert_wiphy(hw->wiphy);
@@ -9203,12 +9222,16 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	 * and now we want to create for actual usage.
 	 */
 	if (ieee80211_vif_is_mld(vif)) {
-		scan_arvif = wiphy_dereference(hw->wiphy,
-					       ahvif->link[ATH12K_DEFAULT_SCAN_LINK]);
-		if (scan_arvif && scan_arvif->ar == ar) {
-			ar->scan.arvif = NULL;
-			ath12k_mac_remove_link_interface(hw, scan_arvif);
-			ath12k_mac_unassign_link_vif(scan_arvif);
+		scan_link_map = ahvif->links_map & ATH12K_SCAN_LINKS_MASK;
+		for_each_set_bit(scan_link_id, &scan_link_map, ATH12K_NUM_MAX_LINKS) {
+			scan_arvif = wiphy_dereference(hw->wiphy,
+						       ahvif->link[scan_link_id]);
+			if (scan_arvif && scan_arvif->ar == ar) {
+				ar->scan.arvif = NULL;
+				ath12k_mac_remove_link_interface(hw, scan_arvif);
+				ath12k_mac_unassign_link_vif(scan_arvif);
+				break;
+			}
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 33835172e446..e30524802dda 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -53,8 +53,11 @@ struct ath12k_generic_iter {
 /* Default link after the IEEE802.11 defined Max link id limit
  * for driver usage purpose.
  */
-#define ATH12K_DEFAULT_SCAN_LINK	IEEE80211_MLD_MAX_NUM_LINKS
-#define ATH12K_NUM_MAX_LINKS		(IEEE80211_MLD_MAX_NUM_LINKS + 1)
+#define ATH12K_FIRST_SCAN_LINK	IEEE80211_MLD_MAX_NUM_LINKS
+#define ATH12K_SCAN_MAX_LINKS	ATH12K_GROUP_MAX_RADIO
+/* Define 1 scan link for each radio for parallel scan purposes */
+#define ATH12K_NUM_MAX_LINKS (IEEE80211_MLD_MAX_NUM_LINKS + ATH12K_SCAN_MAX_LINKS)
+#define ATH12K_SCAN_LINKS_MASK	GENMASK(ATH12K_NUM_MAX_LINKS, IEEE80211_MLD_MAX_NUM_LINKS)
 
 #define HECAP_PHY_SUBFMR_GET(hecap_phy) \
 	u8_get_bits(hecap_phy[3], IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER)
-- 
2.34.1


