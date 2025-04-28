Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A526C369D5
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cYIuDch08tyV7LqknEac8rcsOYsZ3Y6V4DEd/1dOSo=; b=MCFeo2isT4a1qgHcm8/uG6gxs4
	FGdfi6V/V1ovXo3VOZREKdRfMhVQEmoI9kjBsWIGsLQ2jXuhRiA8YbPnp0ny5SpaENKKNmDayqRBP
	gu/w6IsTMLMie7r7zVxFhzTiJ2T24ksFZjuUOQg5L68tPVfEcFd7NHtFQbPTOvQ6woVaUHrn62StY
	TZLnkV5pWn50tl6gbBMkhnwgp6zpPvyFlpuXHHfPi7kNvzRXnNZd6L51iqZhlOzbQMI68eQb1/0ij
	OjNDdXdAjNt4uUP2RYoIrQQZeaEtV+7jhJP1UoETx5cVBrKrpFgKVpL7jdVbSwtp3XzYeyeax52TR
	VMRfUibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QH2-00000006jzM-1HLV;
	Mon, 28 Apr 2025 15:20:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QGx-00000006jxs-2SDx
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 15:19:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8kx8d007899
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 15:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/cYIuDch08t
	yV7LqknEac8rcsOYsZ3Y6V4DEd/1dOSo=; b=IuZDle0AXYYbViXn0bsI2lgVmbi
	PGWjRVHjfMdIEgP5ZcU1Gr8sKyySSstZaljZOsELot1KhdHTUVdhqCnoV4o5UEoQ
	KOPKiYNWpWsX4SmJ63anXAC4yffiz1JfyexCgandOvB5JQWbQR7KVE8eiAqJ5ezs
	eovQQkKm0az19/l7nzQe+/DDiMsm+vnNjw86sORw0zILv0DMHNVKu8im5gi7bz1e
	halTdE3SFAv7YwYgkLj/mNIiP7u0+/gYcuVVwv7qOGcu+JdWbrxUG1VEtHEIitn3
	VkdNpiMSGKyis6TlnztF9Z3HJvAkY1lYKyMfzK+hylHJBp1N6lbNmcvfm9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn0gjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 15:19:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a96112fso77531315ad.2
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 08:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853594; x=1746458394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cYIuDch08tyV7LqknEac8rcsOYsZ3Y6V4DEd/1dOSo=;
        b=Vj6WeWD01oOj9DmjbdIfIAiu/1cgk4qxBBZ1sXp2eOYZzPNMQ3zCB5VfGuLuiYvjZM
         zcWB3OIJdEWDHEH/zmJpMXaz3/j/v+T728n5U4HQf7Xeyewr/0Gvysj7AEolXQzeHDHP
         HTM5NUlT1T6s7W3SToobFvrtfJ7hvMTa0zdBbJ7j71cd1+vj2n3KPunKonk0M7D75HG/
         3YR+7ts0zpwC1F8WuLjQzI6sIfJ801GS04OD6Bdg0e/C1u8HbFf9zdDYJzbBKSKmVfS9
         y0BImJfM6NNXbAZ8w915R12DZhorY4NiyGG1/evVPc0IvnZJvNSHXNfxQ1INNmV8eaqG
         n8Gg==
X-Gm-Message-State: AOJu0YxXxi96cqdwEuccMEA7UrXSQ88Z9YB+Cphg4hWRlgKcowp+z2kz
	d0m/Mbmjie/3sas1ulYE/aOmqquamSBryHsIEBb1fQkUFNsLqUoV9B25iyQwyzFMHkSIuU4zXQN
	UhAjCsqXD4TiS46R4ZMaRkx+BVTXrb504qhYq7NOZacYcg8vWm3Fs9X3bbQZ76U19d/mC
X-Gm-Gg: ASbGncvZGG40+BlZFMW06Z1Ch/oEZS3iJ1sw6mrGQlghDwYgu6O0gDPTtDexGxNYc/o
	Q1mpfSOa2+CB1puNU98wqz/2OxhtZ95BJesnjhWqLzPDEHRDZibwy606Rff/RkFsg/L6aMWMiBf
	tyc3aBgxZD1zOULQyhr0Aq7nvdUmRMO4LXuwae/O/RCLGLYmMu5yYpg6JO5YMybWlqn1X8G38+i
	0vroJdmhcmZHXd+NkVbwI7w1q4PXks7evNUO3tM0VktNFMZXYnQRuKqNcKK28Oq6ajRqbPoTCqM
	QkMm5b+Bh5uZSC7oRGcQUXsXYtQ/tyD2MSL9NtZUQrnU7O5LDXQVhuwkurs0iTibNGAXndYT/CP
	nVxwGBYDzYoZ1ew6qOzRVKfo66qYAHfwhud/PhrWg
X-Received: by 2002:a17:903:2405:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22dc6a0474dmr150911135ad.15.1745853593780;
        Mon, 28 Apr 2025 08:19:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj9bawxTlPZ/vT3cJBo4gD6x6U42aFDaVpKL5eIHZRS2DBfk0jmCu72kDo7fkXUTDGheXspw==
X-Received: by 2002:a17:903:2405:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22dc6a0474dmr150910595ad.15.1745853593128;
        Mon, 28 Apr 2025 08:19:53 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c13sm84134515ad.162.2025.04.28.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:19:52 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Prepare ahvif scan link for parallel scan
Date: Mon, 28 Apr 2025 20:49:26 +0530
Message-Id: <20250428151927.1169783-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JWeYo7XJRnxaK9NT55Fw8cp3W0S49UOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNSBTYWx0ZWRfX5ZvTPsh2hlJ2 Vmjiml5kn/+wNrlsHgrdwOajhd4WawkbdKbXxqUTUTxLymSAvBc1RgVOIfjaM2iACHVTqhc1dy0 vm6ibLGkN4AV99VLRtApWlOnRP2WjChAD5hJ41v49rzvqNjraAVf20PO0VTNffIQlQ6OreQUIc6
 hNI5GZinvCucO+J8tgnIElcrowYGaLSdtIETWD6ycezBS32wRi4wFoDidi4XP8GM9b+A7A/zAQC vAlj3/JIe68dMv6hA9xk+Y/J+U8wqvKjz7viUbsNl6W3XoQvGI5kmQDVQLK0NTtrAL1+mupX+jb CqzKeWBDQDzQx3SdWjEzmOshzSH0Q9402TlFGKAmhNNl/9OUv0Ggc+aUmSpyI1dIbGi9XR5hTAg
 vkSTenTB5k5OUb+oNNKT2PeDkhpGqM9728MeVgAHD5zM1g16B83JGE3csc3JSs4tWZFqwq7d
X-Proofpoint-GUID: JWeYo7XJRnxaK9NT55Fw8cp3W0S49UOM
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f9c9b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NQOVZfBc_sQf-YiYnVMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_081955_629878_D85DC782 
X-CRM114-Status: GOOD (  26.52  )
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
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 49 +++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.h  |  7 ++--
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4b8f434e3e9a..0d512818ee96 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -352,7 +352,7 @@ struct ath12k_vif {
 	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
 	/* indicates bitmap of link vif created in FW */
-	u16 links_map;
+	u32 links_map;
 	u8 last_scan_link;
 
 	/* Must be last - ends in a flexible-array member.
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8949073c0163..6dab2f3a9e0d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3483,7 +3483,7 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 	/* If this is the first link arvif being created for an ML VIF
 	 * use the preallocated deflink memory except for scan arvifs
 	 */
-	if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
+	if (!ahvif->links_map && link_id < ATH12K_FIRST_SCAN_LINK) {
 		arvif = &ahvif->deflink;
 
 		if (vif->type == NL80211_IFTYPE_STATION)
@@ -4475,11 +4475,12 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
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
@@ -4489,10 +4490,20 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
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
@@ -4523,9 +4534,16 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
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
@@ -8654,7 +8672,8 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	struct ath12k_hw *ah = hw->priv;
 	struct ath12k *ar;
 	struct ath12k_base *ab;
-	u8 link_id = arvif->link_id;
+	u8 link_id = arvif->link_id, scan_link_id;
+	unsigned long scan_link_map;
 	int ret;
 
 	lockdep_assert_wiphy(hw->wiphy);
@@ -8673,12 +8692,16 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
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
index da37332352fe..8ec4a890172c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -51,8 +51,11 @@ struct ath12k_generic_iter {
 /* Default link after the IEEE802.11 defined Max link id limit
  * for driver usage purpose.
  */
-#define ATH12K_DEFAULT_SCAN_LINK	IEEE80211_MLD_MAX_NUM_LINKS
-#define ATH12K_NUM_MAX_LINKS		(IEEE80211_MLD_MAX_NUM_LINKS + 1)
+#define ATH12K_FIRST_SCAN_LINK		IEEE80211_MLD_MAX_NUM_LINKS
+#define ATH12K_SCAN_MAX_LINKS		ATH12K_GROUP_MAX_RADIO
+/* Define 1 scan link for each radio for parallel scan purposes */
+#define ATH12K_NUM_MAX_LINKS	(IEEE80211_MLD_MAX_NUM_LINKS + ATH12K_SCAN_MAX_LINKS)
+#define ATH12K_SCAN_LINKS_MASK	GENMASK(ATH12K_NUM_MAX_LINKS, IEEE80211_MLD_MAX_NUM_LINKS)
 
 enum ath12k_supported_bw {
 	ATH12K_BW_20    = 0,
-- 
2.34.1


