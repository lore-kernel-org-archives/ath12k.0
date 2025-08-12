Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619C0CA0EDF
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBfzaKcYETNsmTx+YH0KMvZNp8T5+9xb8kw2PQKwLdY=; b=rS4nYAnM8rdGJxGOZpw0hXkEQL
	P6adlm7OKfpBepqNMWmBXNyK5bdOk5RwMw9m2jdH6V+Yshs2LXpP8YBHSdS87OWsXBK6piFeZHxnA
	caQBfiE7fXfEWeXz8SPXCwbSg4AgbTkqmMk+jj7g/I011qnGIKm62+CshwZWO6zstZp6aRPfwNxjG
	KBfA8IvE3M1KkQKdfJbHWpwBLvoDDp5ri07UPHwdtbKB8dKmHksa5n0DK2rhjgFIf834UTDhgpItm
	/O1CT/ZyNtghbOIUv5IVIJiCKZ3rcQ0z0CSNvF1DDypJzU2lNBxGqpAbKXFShEkoPnLypo+SePN0Y
	6l3HTPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjq-0000000BKAa-33Sv;
	Tue, 12 Aug 2025 16:20:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln0R-0000000Aaow-1OCD
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 11:17:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvghT012368
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=WBfzaKcYETNsmTx+YH0KMvZNp8T5+9xb8kw2PQKwLdY=; b=fg
	L4vRrDha7S6mxMczkQZkZlodrc976EQtiiA5BpH3QokUn8RKGJZoMhUWWMsXZqg7
	alOJudEOw+42e9q1Kug/+wwPJ8FhePdSn5l/yBGcnxyNSZ/VNyAFTCOM2Q3EKd82
	eM7Uwajpf1fthx57Jrm6Z9zaoeBSiOPU6Bd3Y8RRWeApbnCgtii6ArOc1Moir4vv
	TKCYe1BSsT5GzfAFgMSjzqCPDWOa4yJStz5N2c82yBnf2Va09wzol57hoKY/Q/EV
	utP/NrhyULwpkOWj05/XXqjjE+Ri5e63IOMqevVQxWpDUYiv3MdzlP5qLGl2j+Nt
	+lS5ZC7xxMBRLN0ZBftQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduyvws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b42f03d50a9so2833796a12.0
        for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 04:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754997444; x=1755602244;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBfzaKcYETNsmTx+YH0KMvZNp8T5+9xb8kw2PQKwLdY=;
        b=PQ1SFSGtXDbrB6CZOVwdc2kNyDwoU+gQsKWLTBI5RqakcWqb2akBnnJQobgCMPKbrX
         2ejytiSv0JvrIIrVW/Dw8KRLzdGevoJdylBBfUslcm5MiUkM+zS7B71FqNkPZNfjT7Dd
         0SuqnT10DUPNMSYIbr0mrGq9DCdgxhHxNSxZ/0kzSAukTlzS3rgfy855OvWXOp66q9GH
         MDdiz2WrATwmKnak24NKC5an3VxQVplYVI/xZyZkHndNBotQYBLY80lIfU+JM+I3QqEL
         rW/e9TMCP3DO3D3PObEh88cREQtyYEiKWe7xcPtgGw4S6Z+/RO3A+YRORTyf88OYlQRW
         xWhQ==
X-Gm-Message-State: AOJu0YyIZEmdJyvj1lzZjGSteUlcTKiwQ3yjsYwZiG6IzMYIRjZIRAlG
	WgwqsrYRCvsDUsy9/NHmczWlp0hddnIVVTyKKDrLcvK3JTyjkVf7j9yxgvcrgpvw2cI78kP8seO
	55/EwfD5UuyIv4hT0eEtQJ+pcRgD63F69SgjHcwpNa2EOqu58Oq84zNTdcgKDO8ZrFYbvKA1U
X-Gm-Gg: ASbGncty+RnyeOsw7LKCJ5u2N4o1C8FJOCbcurZMOjxxi3qUUZSidxDrSqSfD+3a7TH
	TjTOf8h04lKpJj0JAd6Xww7s/bRSiZa8uZZzCv0LpXexYE9E0JHTu/1CJHTnFR7hVjpOc35MfdD
	oAAxM14Wjpy+Q3S4JhgcQ0wqvXCGoyXhBIZO5roNdGMpSiimJObuN78Qqaxkjp0tzj8WqejXtd3
	HsON+uO8aHF+PFtwG+6HPRbgaNS08eQ1RaiZH9M7Ve1wbbRiGdhNSylyaNrAQQJEUwTF20UOgmo
	wbislvgiRXF5/EY0q/Dn0l/GOHW5v6pEsFrsf0VsTBEOdVfC4O9qI5tSrfghCTjqYo1DWb7ypjO
	Zn0Pkryg=
X-Received: by 2002:a17:902:d48a:b0:240:9cf:99a8 with SMTP id d9443c01a7336-242c1ecbe3fmr212855605ad.11.1754997443903;
        Tue, 12 Aug 2025 04:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6S27eWRBiKQyx4wW9kDYBhDFE3GmPmiB4Q8YGVtRjZ5I/95I+WqjXrDDAkS1J8uup57m4iQ==
X-Received: by 2002:a17:902:d48a:b0:240:9cf:99a8 with SMTP id d9443c01a7336-242c1ecbe3fmr212855225ad.11.1754997443311;
        Tue, 12 Aug 2025 04:17:23 -0700 (PDT)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1ebc1sm296048935ad.67.2025.08.12.04.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 04:17:23 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 3/3] wifi: ath12k: Extend beacon miss handling for MLO non-AP STA
Date: Tue, 12 Aug 2025 16:47:08 +0530
Message-Id: <20250812111708.3686-4-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b22c5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-zu_XDMuf0vKP4TfBIsA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: SEg8nUxMg21zdt7T3PS0_HFzEwyNf9W2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX1A5cs0ehoRKu
 zMY/vvVAxWnB3NVNw4KgZqf9H5TeOltYZcAf/20jc1EKibZy3XTljhfwLklKUcnjkUgTJbYhLWR
 dhJkPmaz3munMbN/XWbMtBPJcGMRbl9ktCnl5LNElDIb03SiruEk7RRc8I2zosHkXyhZhxP9b9L
 9/5fntPjVIB3Q0rw7j7or2Um+p3GM6/9CXijB1AYIBnyGRzLCvS03qAIV+rlV25Z1Th0zLvZUlH
 9FIYmPs94JY4NrwHIEeOSOVA4MfACjSroU2/5s7AyhzOIlczWFVr7bPxBgltRT839MNjNK1OqRb
 KXMkooNENOt9+LR7QsWZBe+5wutY2PG7trCcxioBu6/U3hurHpPuY5iTFYEewGKddNbMLCyOnUm
 pSk704Pv
X-Proofpoint-GUID: SEg8nUxMg21zdt7T3PS0_HFzEwyNf9W2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_041727_489659_580E29D8 
X-CRM114-Status: GOOD (  20.88  )
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

Currently, ath12k_mac_handle_beacon_miss() does not handle the beacon
miss for the MLO case.

In MLO scenarios, the host fails to process the beacon miss because the
vdev_id comparison in ath12k_mac_handle_beacon_miss_iter() does not match.
This mismatch occurs since arvif always points to ahvif->deflink, which may
not correspond to the actual vdev_id associated with the event.

Fix this by retrieving arvif from vdev_id instead of ahvif->deflink which
will work for both MLO and Non-MLO case.

Also refactor the ath12k_mac_handle_beacon_miss(), by passing arvif
directly instead of vdev_id and remove ath12k_mac_handle_beacon_miss_iter()
which is no longer needed.

ath12k_mac_handle_beacon_miss() is called from ath12k_roam_event() for WCN
chipsets and ath12k_peer_sta_kickout_event() for QCN chipsets.

So, refactor the ath12k_roam_event() to pass arvif instead vdev_id to the
ath12k_mac_handle_beacon_miss() function to align with the
ath12k_peer_sta_kickout_event() and change the rcu_read_lock() to
guard(rcu)() in the same function ath12k_roam_event().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Co-developed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 24 ++++-------------
 drivers/net/wireless/ath/ath12k/mac.h |  3 ++-
 drivers/net/wireless/ath/ath12k/wmi.c | 37 ++++++++++++++++++---------
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd1ec3b2c084..ea13c5e0a4f7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1822,22 +1822,16 @@ void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb)
 						   skb);
 }
 
-static void ath12k_mac_handle_beacon_miss_iter(void *data, u8 *mac,
-					       struct ieee80211_vif *vif)
+void ath12k_mac_handle_beacon_miss(struct ath12k *ar,
+				   struct ath12k_link_vif *arvif)
 {
-	u32 *vdev_id = data;
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif = &ahvif->deflink;
-	struct ieee80211_hw *hw;
-
-	if (!arvif->is_created || arvif->vdev_id != *vdev_id)
-		return;
+	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 
-	if (!arvif->is_up)
+	if (!(arvif->is_created && arvif->is_up))
 		return;
 
 	ieee80211_beacon_loss(vif);
-	hw = ath12k_ar_to_hw(arvif->ar);
 
 	/* Firmware doesn't report beacon loss events repeatedly. If AP probe
 	 * (done by mac80211) succeeds but beacons do not resume then it
@@ -1848,14 +1842,6 @@ static void ath12k_mac_handle_beacon_miss_iter(void *data, u8 *mac,
 				     ATH12K_CONNECTION_LOSS_HZ);
 }
 
-void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id)
-{
-	ieee80211_iterate_active_interfaces_atomic(ath12k_ar_to_hw(ar),
-						   IEEE80211_IFACE_ITER_NORMAL,
-						   ath12k_mac_handle_beacon_miss_iter,
-						   &vdev_id);
-}
-
 static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *work)
 {
 	struct ath12k_link_vif *arvif = container_of(work, struct ath12k_link_vif,
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 18c79d4002cb..c05af40bd7a2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -168,7 +168,8 @@ int ath12k_mac_rfkill_enable_radio(struct ath12k *ar, bool enable);
 int ath12k_mac_rfkill_config(struct ath12k *ar);
 int ath12k_mac_wait_tx_complete(struct ath12k *ar);
 void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
-void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
+void ath12k_mac_handle_beacon_miss(struct ath12k *ar,
+				   struct ath12k_link_vif *arvif);
 int ath12k_mac_vif_set_keepalive(struct ath12k_link_vif *arvif,
 				 enum wmi_sta_keepalive_method method,
 				 u32 interval);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 113ce1390eb1..392377bb5471 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7302,6 +7302,7 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 	struct ath12k_link_vif *arvif;
 	struct ieee80211_sta *sta;
 	struct ath12k_peer *peer;
+	unsigned int link_id;
 	struct ath12k *ar;
 
 	if (ath12k_pull_peer_sta_kickout_ev(ab, skb, &arg) != 0) {
@@ -7330,11 +7331,23 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 
 	ar = arvif->ar;
 
-	sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
-					   arg.mac_addr, NULL);
+	if (peer->mlo) {
+		sta = ieee80211_find_sta_by_link_addrs(ath12k_ar_to_hw(ar),
+						       arg.mac_addr,
+						       NULL, &link_id);
+		if (peer->link_id != link_id) {
+			ath12k_warn(ab,
+				    "Spurious quick kickout for MLO STA %pM with invalid link_id, peer: %d, sta: %d\n",
+				    arg.mac_addr, peer->link_id, link_id);
+			goto exit;
+		}
+	} else {
+		sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
+						   arg.mac_addr, NULL);
+	}
 	if (!sta) {
-		ath12k_warn(ab, "Spurious quick kickout for STA %pM\n",
-			    arg.mac_addr);
+		ath12k_warn(ab, "Spurious quick kickout for %sSTA %pM\n",
+			    peer->mlo ? "MLO " : "", arg.mac_addr);
 		goto exit;
 	}
 
@@ -7345,7 +7358,7 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 	switch (arg.reason) {
 	case WMI_PEER_STA_KICKOUT_REASON_INACTIVITY:
 		if (arvif->ahvif->vif->type == NL80211_IFTYPE_STATION) {
-			ath12k_mac_handle_beacon_miss(ar, peer->vdev_id);
+			ath12k_mac_handle_beacon_miss(ar, arvif);
 			break;
 		}
 		fallthrough;
@@ -7360,6 +7373,7 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 
 static void ath12k_roam_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
+	struct ath12k_link_vif *arvif;
 	struct wmi_roam_event roam_ev = {};
 	struct ath12k *ar;
 	u32 vdev_id;
@@ -7378,21 +7392,22 @@ static void ath12k_roam_event(struct ath12k_base *ab, struct sk_buff *skb)
 		   "wmi roam event vdev %u reason %d rssi %d\n",
 		   vdev_id, roam_reason, roam_ev.rssi);
 
-	rcu_read_lock();
-	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
-	if (!ar) {
+	guard(rcu)();
+	arvif = ath12k_mac_get_arvif_by_vdev_id(ab, vdev_id);
+	if (!arvif) {
 		ath12k_warn(ab, "invalid vdev id in roam ev %d", vdev_id);
-		rcu_read_unlock();
 		return;
 	}
 
+	ar = arvif->ar;
+
 	if (roam_reason >= WMI_ROAM_REASON_MAX)
 		ath12k_warn(ab, "ignoring unknown roam event reason %d on vdev %i\n",
 			    roam_reason, vdev_id);
 
 	switch (roam_reason) {
 	case WMI_ROAM_REASON_BEACON_MISS:
-		ath12k_mac_handle_beacon_miss(ar, vdev_id);
+		ath12k_mac_handle_beacon_miss(ar, arvif);
 		break;
 	case WMI_ROAM_REASON_BETTER_AP:
 	case WMI_ROAM_REASON_LOW_RSSI:
@@ -7402,8 +7417,6 @@ static void ath12k_roam_event(struct ath12k_base *ab, struct sk_buff *skb)
 			    roam_reason, vdev_id);
 		break;
 	}
-
-	rcu_read_unlock();
 }
 
 static void ath12k_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
-- 
2.17.1


