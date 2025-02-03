Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79494C02193
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/NOJiLGgX+K66BZwbw+Ol/19603T6IJWbf/Z2BMZNA=; b=Zl26vFbx2weaLkks/lg0sMDkYR
	4duR5z5MRa4nPqk+W1GgeSgokHXLTTKC1AWzelrN7Vmu5KCNKzHTBG95J1X+Ya4tPpRWkdGNDRDGi
	iJ/CeOskQl5x3Ss3Iq4IJI6Btmie7/KPILOmE+zION0nZgNxrXwdJf4l400giZ+R2XzxP5SktVDFP
	3xtPkOE4kwEpnhc9xmNJ/NKqEcG3Ia5mW50iDnvhLF+oBd51G2xFjNNNq23liDf0KaA2MdWEhuK9j
	EyRBQTjJQAfCydryXT3FqlLMGCv3KmK88bEiQSdrDlGuGlzrauZcFCK6smEsJhbXudI8/FEwfD24q
	yyATTy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Fb-0000000GhsF-10Gz
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 21:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FV-0000000Ghlj-2oxm
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JlXP7028506
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o/NOJiLGgX+
	K66BZwbw+Ol/19603T6IJWbf/Z2BMZNA=; b=DuJy5I9YwsJHWfZxgEl/O6s+xkj
	ZxhVg/uxsOQh4zMnS0XuVE3zU1gDU7dJa5el05TSgU62abEozJDzBZCGqbiZo3AG
	hutiILoZRZM5a/bHjo5Gjj5Qvf7TM2P7J9rrw32n/UeywdncSvLFpXAWkzBSAl1V
	f78uDgKwtpC7IYOclEQ7KVY9eSFNyfGDq+Gix9QgFNPG2ecudEWQeF3FXPC+s8bw
	dBinwCYOJEDNlKQhZvR+LyMaIV62R+l9mrd7D0XcoHpq9a3xARjS4X6cXKjALAWX
	xMH8hRXuO6meXe+BpC471dhxvh1M+kgqrt8+nG8PGp7X2rsBDNcDsx2dR8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k492g744-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ee3206466aso11215908a91.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619096; x=1739223896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/NOJiLGgX+K66BZwbw+Ol/19603T6IJWbf/Z2BMZNA=;
        b=S30lNQg4Mog8QBb3KmuorTi4hqKlEujyHgUgcp4SxL0L8wuwzJm5cCkefFCbvA+9QG
         jHNg2VzLMUtrdzYNmkXV646xJXOvMi+NuUlx7jOXwFxvqqpSTK2Mx4YONlXoPHOY5VcJ
         6/EG5vCtYb8mCSFqDPjzuDznCKIOcm1+YSKtCAMBbzqFtZvEQ3IgR8bGSHmRSJZyojLK
         qZAQDD0FxVdQG3rC0Y/RwcuBl+S3I6Rv7DM/7N7ds339st3KXf1YQEZ/Zgh0nq0sZKs8
         JRAlhKCsdB7ZAG44pSjYAfjO3juBh/qciY4fBC39ktfdiOOY18zjC0OVvUNUf0Tjy1BR
         8jOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkaix3haMYVNotC/uYct3g0KAxSW7/dg+m8akuNb9vJz4P0SxmslhAJh8VcD3gqa2wW4AcxQ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO7OaSaEr+3uz6V6vBIMaX2yUE5lDkyy1Re2GZfqBzYfWOh/5o
	yjo7NYN7gy77F1ofB+wTnUi7JoRzYus2H4MUUQwofD3xhHB3ap4X6byFo9Z7SBO2qbJ4P1exY3u
	pe2p0wT9uZwFrxTiQI4FfpdCkxZ76vKpmeZbsZ2q7L7Ai5WIdG5btWEbpKqZn
X-Gm-Gg: ASbGncvVMDuDsuB/WCysjkSaQGQGAxTtB8XaJp4QCXpidNZsD8YSqBRDbV8uo2naECG
	28a11Ha5ajNgKdKN0sXaxpNmf3hqFHnk7bRaP9xuHi6tWTL4fB0rt92AHurbjPyDFaaMR1bNSeP
	hpwIFB+CRp+7A/LRNdf9kWROA/F1y8qlH/VbHfrOGQIqp9FEEAd0j62D4YMxv4A9fLPfYRlvJzj
	blx5EU6U4m/q1X6Tk4qnXiXz4AVyFXgKyCyHPvVrkvws1iFFGRqevFoNHc3lt4dSXeVse1T7Sl2
	NT4kZjbz8YVJdFp+uZIRFoqi1Rfukr0q7nihU0m8y0nv8bXC7pA4ncTQJWCc
X-Received: by 2002:a17:90b:264e:b0:2ef:2980:4411 with SMTP id 98e67ed59e1d1-2f9ba26b850mr1294630a91.9.1738619093406;
        Mon, 03 Feb 2025 13:44:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvvw9gKRxtbE+OTiyqQ5MXN4t+jAbJiFCRohnw3OPyEk4EXFoSxh4aNnCnAzM+P8mNlyM4Mw==
X-Received: by 2002:a17:90b:264e:b0:2ef:2980:4411 with SMTP id 98e67ed59e1d1-2f9ba26b850mr1294610a91.9.1738619092950;
        Mon, 03 Feb 2025 13:44:52 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:52 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 3/5] wifi: ath12k: refactor transmitted arvif retrieval
Date: Mon,  3 Feb 2025 13:44:46 -0800
Message-Id: <20250203214448.1978156-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PLEvXqPjvE3jSF7hzSugD7mjQETJ93ZL
X-Proofpoint-ORIG-GUID: PLEvXqPjvE3jSF7hzSugD7mjQETJ93ZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134457_720676_769C7490 
X-CRM114-Status: GOOD (  18.78  )
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
index e9663c6ac72c..efd155031feb 100644
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
 static struct ieee80211_bss_conf *
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
@@ -1696,11 +1707,10 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
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
@@ -1715,17 +1725,19 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
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
@@ -1782,6 +1794,7 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	int ret;
 
@@ -1812,11 +1825,9 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
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
@@ -7676,14 +7687,9 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
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
@@ -7692,11 +7698,13 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
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
@@ -9074,9 +9082,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
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
@@ -9144,11 +9152,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
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


