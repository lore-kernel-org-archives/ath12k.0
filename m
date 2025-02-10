Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8132C021A1
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp2/DibRsByMa+EuVeyCQ+AgsGVeDKcUvGXcO4trUWo=; b=iKrL2rhSCx8wt9i+PRsk9icGWE
	IvAr6GSLYxAsvKK1+k9pKLwvZ8lDfYN6xmKIuD2QB5HDLDZaTyuQ6j8HEziwiPaqSKGoMXfxeh+Xt
	1mMDV2xqnjvCEwssfPQFjfKGiwNxSm1aK8Ll/xRBY9LAg5le89N7TDfafqGrvnYMBdAWKWf32868f
	8/PJVlQoBz+yp/PfaZURwHz/TA+RL9BEvVv8LoMgzGABH6tMTZoo9V8xrzCsZvTxTwIClCprwrP/U
	GQ7TXfPUpc7/dQHf1SL3VS5h4XfNVyHQgc6Fg8bLYxyyDYR+6cqNgLc/xaCQDLXBLRo/I03JpaphE
	JKnFWyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYfr-00000000xJO-19vr
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 18:38:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVC-00000000v4s-11Ft
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AAGiSM006587
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yp2/DibRsBy
	Ma+EuVeyCQ+AgsGVeDKcUvGXcO4trUWo=; b=Pvt+3jv2kS1sZP1AiSC7O1I2U34
	TJzFpNEomiQFwOQF67y/ZaTmzSGvPjjKaYnqFAwwRM4Jb66eEdaCFe/3k+Z1Yvpq
	EVx0QA5jGlCLIw9qU+b966vKt3kpabmmBCKZZmwBrFGo2nW8KsrjCfLLGclCGdVZ
	b+qmGrCZZXlneyn3LupBC+8FW3wv2GsewihoHM0h//XxShia0hUCHXYP6m0mULQc
	XK6ZCH8iWMeegZDAOPDDAAfvPj46TSh2cCMY9O4gOzY2cCEYMIwS+ynUGn2galsu
	ocXKAHt2kn2Q0yj0mOsh7Lq2OMVuEEaZr/B/u0VMxdcylnOkbkFO/punh2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guw83b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa2edc3824so6325292a91.2
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212044; x=1739816844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yp2/DibRsByMa+EuVeyCQ+AgsGVeDKcUvGXcO4trUWo=;
        b=hDxxifZOjMtKaKu//jFV4M6TTcxYPew8xaeeduZd+ASHDjf/EsV+OTdRsCYUBrNYrw
         3IOsVlFx2wizHO3l2blU0unugZM3qs0sykPGgFaIJDi6P2yOpbYStu0vHK8z4Lmo9oyc
         ReDIIhO551JtwEv+3t/Yj8GYS3hy35M/uriXbllNmiKsK36mkLBXsM6Myjy9YNZyQgxB
         QjjNrSaHJec2Yeqd7xvxkxaKnuj1jx99cv4Ih7PmK2aKWfL+adxCZrsau+zb6ocEv9pA
         PM25Ejk5U8hVyvo5aZhjMX7Iv/LwRB5YByPB5MHF2gSZrrrht6vCFn0prmxUifsxom63
         Zk3A==
X-Forwarded-Encrypted: i=1; AJvYcCXfx0ksRr21i5uXOGDSPa/Vc6CImGnRW5zUtaI0gDCy5v/3s2Hpe+Qver0gG3ij4NvZOjXWug8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF/u3hk9rs0xzg6zZ+w4+OWIIRlZ7f504FIMPlM+B4TJwywbJt
	JsicvUu3PPvmzpxwpFtIq0sHjtE7VwD3K/gjv5O8vf1Kj2b32B7F1xk7tuI64Fy3MsJeKs6MH8F
	+EtmMQSkY5TNesNGUwqkBn6+lQ4idPj1Ven5tnflU6KpA52DmCeHHICWgEzLc
X-Gm-Gg: ASbGncsGqYd2LzHpwUEm8RKGjLCgZSntOe62bWUXWsKq+ZDwfjukKWd/pc8Sjz+DQBl
	jsn+wXj03SSGKkxYmQ8SyY2dqdfrDFNyGuTuJEeJNvzZjdeEWtb11MHTEgVXFwbK7pgGCS+Gzkp
	3rWdVWN8e01Ym8Igv8bbrB/LmeeJNBZny6vP4zdxeJzkHOwysSoKB+xzUUNnXQZafAgEex1ragc
	xEPFpbZSwQqt+wspbelSikSmoVU7gUlSaauHz89SFCkMAMD4fqukGkpsvI76wGBMqArLZ7hPmhz
	qP1HCRoC41gbqBUUyb+1lrwUD+rJhPqG3b44BKAhR8Nxan8mAvf5y/x98vXo
X-Received: by 2002:a05:6a00:7491:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-73075b17593mr10741978b3a.16.1739212043797;
        Mon, 10 Feb 2025 10:27:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE91sQYwrJPLIU/e6nitruwQTHgHylPVSviUYoGaKIF8VGT7OcasBjhnPeYpHaknDQwBYfSvw==
X-Received: by 2002:a05:6a00:7491:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-73075b17593mr10741931b3a.16.1739212043231;
        Mon, 10 Feb 2025 10:27:23 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 3/5] wifi: ath12k: refactor transmitted arvif retrieval
Date: Mon, 10 Feb 2025 10:27:16 -0800
Message-Id: <20250210182718.408891-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pBSU92svwNT8jP4LDPD49wURHwYClndt
X-Proofpoint-GUID: pBSU92svwNT8jP4LDPD49wURHwYClndt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=995 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102726_405171_B2CD5687 
X-CRM114-Status: GOOD (  18.93  )
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

Create a new function ath12k_mac_get_tx_arvif() to retrieve 'arvif'
for the transmitted interface of the MBSSID set. This clean up will
help modifying the same code path for MLO changes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 60 +++++++++++++++------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 16e6f2fae943..e642fba2843e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -579,6 +579,19 @@ static int ath12k_mac_vif_link_chan(struct ieee80211_vif *vif, u8 link_id,
 	return 0;
 }
 
+static struct ath12k_link_vif *ath12k_mac_get_tx_arvif(struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *tx_ahvif;
+
+	if (arvif->ahvif->vif->mbssid_tx_vif) {
+		tx_ahvif = ath12k_vif_to_ahvif(arvif->ahvif->vif->mbssid_tx_vif);
+		if (tx_ahvif)
+			return &tx_ahvif->deflink;
+	}
+
+	return NULL;
+}
+
 struct ieee80211_bss_conf *
 ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif)
 {
@@ -1637,7 +1650,6 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 	struct ieee80211_ema_beacons *beacons;
 	struct ath12k_link_vif *tx_arvif;
 	bool nontx_profile_found = false;
-	struct ath12k_vif *tx_ahvif;
 	int ret = 0;
 	u8 i;
 
@@ -1649,10 +1661,9 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_ahvif = ath12k_vif_to_ahvif(ahvif->vif->mbssid_tx_vif);
-	tx_arvif = &tx_ahvif->deflink;
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
-							 tx_ahvif->vif,
+							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
 	if (!beacons || !beacons->cnt) {
 		ath12k_warn(arvif->ar->ab,
@@ -1695,11 +1706,10 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ieee80211_bss_conf *link_conf;
-	struct ath12k_link_vif *tx_arvif = arvif;
+	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_mutable_offsets offs = {};
-	struct ath12k_vif *tx_ahvif = ahvif;
 	bool nontx_profile_found = false;
 	struct sk_buff *bcn;
 	int ret;
@@ -1714,17 +1724,19 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	if (vif->mbssid_tx_vif) {
-		tx_ahvif = ath12k_vif_to_ahvif(vif->mbssid_tx_vif);
-		tx_arvif = &tx_ahvif->deflink;
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	if (tx_arvif) {
 		if (tx_arvif != arvif && arvif->is_up)
 			return 0;
 
 		if (link_conf->ema_ap)
 			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+	} else {
+		tx_arvif = arvif;
 	}
 
-	bcn = ieee80211_beacon_get_template(ath12k_ar_to_hw(tx_arvif->ar), tx_ahvif->vif,
+	bcn = ieee80211_beacon_get_template(ath12k_ar_to_hw(tx_arvif->ar),
+					    tx_arvif->ahvif->vif,
 					    &offs, tx_arvif->link_id);
 	if (!bcn) {
 		ath12k_warn(ab, "failed to get beacon template from mac80211\n");
@@ -1781,6 +1793,7 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	int ret;
 
@@ -1811,11 +1824,9 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 	params.vdev_id = arvif->vdev_id;
 	params.aid = ahvif->aid;
 	params.bssid = arvif->bssid;
-	if (ahvif->vif->mbssid_tx_vif) {
-		struct ath12k_vif *tx_ahvif =
-			ath12k_vif_to_ahvif(ahvif->vif->mbssid_tx_vif);
-		struct ath12k_link_vif *tx_arvif = &tx_ahvif->deflink;
 
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	if (tx_arvif) {
 		params.tx_bssid = tx_arvif->bssid;
 		params.nontx_profile_idx = info->bssid_index;
 		params.nontx_profile_cnt = 1 << info->bssid_indicator;
@@ -7673,14 +7684,9 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
 					       u32 *flags, u32 *tx_vdev_id)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_vif *tx_vif = ahvif->vif->mbssid_tx_vif;
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_link_vif *tx_arvif;
-	struct ath12k_vif *tx_ahvif;
-
-	if (!tx_vif)
-		return 0;
 
 	link_conf = ath12k_mac_get_link_bss_conf(arvif);
 	if (!link_conf) {
@@ -7689,11 +7695,13 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
 		return -ENOLINK;
 	}
 
-	tx_ahvif = ath12k_vif_to_ahvif(tx_vif);
-	tx_arvif = &tx_ahvif->deflink;
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	if (!tx_arvif)
+		return 0;
 
 	if (link_conf->nontransmitted) {
-		if (ar->ah->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+		if (ath12k_ar_to_hw(ar)->wiphy !=
+		    ath12k_ar_to_hw(tx_arvif->ar)->wiphy)
 			return -EINVAL;
 
 		*flags = WMI_VDEV_MBSSID_FLAGS_NON_TRANSMIT_AP;
@@ -9071,9 +9079,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   int n_vifs)
 {
 	struct ath12k_wmi_vdev_up_params params = {};
+	struct ath12k_link_vif *arvif, *tx_arvif;
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_link_vif *arvif;
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	u8 link_id;
@@ -9141,11 +9149,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		params.vdev_id = arvif->vdev_id;
 		params.aid = ahvif->aid;
 		params.bssid = arvif->bssid;
-		if (vif->mbssid_tx_vif) {
-			struct ath12k_vif *tx_ahvif =
-				ath12k_vif_to_ahvif(vif->mbssid_tx_vif);
-			struct ath12k_link_vif *tx_arvif = &tx_ahvif->deflink;
 
+		tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+		if (tx_arvif) {
 			params.tx_bssid = tx_arvif->bssid;
 			params.nontx_profile_idx = link_conf->bssid_index;
 			params.nontx_profile_cnt = 1 << link_conf->bssid_indicator;
-- 
2.34.1


