Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A87C02188
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtwpAc6bTYOZp2y9MNdtJ/nCT7pbm01eyDD9XK50KFQ=; b=NN3ZBbm6GQ3ejhAQsllq1UeQ+5
	y48+KGoq6gV9n5uKSe7KBpSMLpdqBEmusx9SPxPk4JygBDqzns77tXa/W3HaSmbXMtrGechXr7FyA
	Z8Od4xv1ndAwEcoCloSNndG5D3T6XjuqLMp0ERFQbNMY/mSkLeP1EzMnyqYidh+F0T8S/wafxBfgJ
	7DjNvY+qUlLDiaCzCUBOLc9eDtCvp1B9sYrlOtpTGy/knpuf0UHoTcw+QIaKdAtKAgOq/YgFTEGiQ
	gPx52kAseazdGC6soUu//mWuacsHPpHHXheUV0+Sp7yIRzpG+/UvPQUDSE72krzgl8S06c3VcOiGA
	uG63ZR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNmY-00000003QP1-2vli
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 05:23:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNly-00000003QJf-0z6w
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J3v0IG001809
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZtwpAc6bTYO
	Zp2y9MNdtJ/nCT7pbm01eyDD9XK50KFQ=; b=oImtoWZbx2aaHYXVfYmKDe+mh1F
	fs0UTXyhmpUxdCk+T1F6mBLKFmF6iOMyTKUmOuayAhV3X38eTTiGvLqNkwo9LDPG
	Qh8hkTaZHGwPn4438MKCmAr/yJcaf/4PdHN7ae611rG23usgRD30i9wu5YP3vdwA
	B50gNauxKByw9nW9hVJw6+lgw2b+FDjY8fkWWPAlre8iEm0Ge3B5gl6cVr6DEIcQ
	h5N5AI4NIqBzWQnCmiEATwE3+99j3ymlW/VpnoUhan3DpT3git2chquEWcHMBApt
	2sEZEjpI7CxYbmFM2DgSZZ/wrcaopCQLCC9gTaw3vy9clbTVYMhfBTfG4MQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4485fhsg1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee46799961so9807290a91.2
        for <ath12k@lists.infradead.org>; Sat, 18 Jan 2025 21:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264177; x=1737868977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtwpAc6bTYOZp2y9MNdtJ/nCT7pbm01eyDD9XK50KFQ=;
        b=KGHKB6etxx21cUK+Q2xU3zR+xQJ8l5EzuulTgp5ln5dllWDhJvrdCrrUnsv7BkMq+k
         Od738l9+HfN7qAc68NSKn+e45BaPA9mzFoIOtwpuVZkrrtgLSHSaVmoAkfuAnWop8UaA
         aO+qLQdBP6cj1fdMTbf5zFFIF5vuVOCXeKCCOR1oRvHyS/8XPPdJpmzpEVA/3teB2Bxm
         5wZrA6DbURRlO8cismbUCnRYQv/xrwQxf6IdbKruk2+0mtp9TWN4VJuGu3aV+xaR/PU9
         RJDFYx4/aoZ/LRjBcAA5aGG9O8NzF3ukAFbrJnR8ZByI5nBkve6pW0kgXy7eO9xwo/rO
         zevg==
X-Forwarded-Encrypted: i=1; AJvYcCVc4S8i+V4UEs9ZzOiE8Z69I7x/I0pwHj/yd6/3F8iXPU9MMZFbPbgxlyqyUBaxVZ+6vgpS12o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfm0mUV3yVjGuRm0s7uB/KVEjT0+p17YlyTCbaTYfzeh0EsMM
	SNAO8wuW2fvaqC2IbG7AlRcV2lfkvDMB3rdClAYrdgE5Sav/+mZb7NCeMPT8ByJSuW9eYd+bwKK
	V28AP2syHeFWM/6HF1FE/eWqWjnidcacx+8pBZnnoMgYIolsJqKUQMbP7AF60
X-Gm-Gg: ASbGncvqk6REedJO+ggZ+Mh2ob4WAP1SZ8CIetuJFrHq5HBXcWK26XjB0ZDbYR//6Jr
	ODWhD94UQEpURc2a0vp8ylV5XdeEjGYKiyPF7OxivdGN6Fs8x0Vtcj5kUFXbCp1okotJ1Z2L2Ul
	uIQuj6l54baXs4LdambiwaaAqpEh3J0zqMJ6Lkou6RDCwwEGNaCorSJVmQh2IVcYvVXMQgHPaIk
	UwYF+STt7x8wMehxh+f1t6JuM70nLvS7MgpLsVNOsvJdF2QdRifst/sUIB5fsnlppy12eNwyqk2
	BhJEjut6lum5yRdFd225GcjrY/nQS6DG4yutycEw7G04nZK/Dw==
X-Received: by 2002:a17:90b:258b:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f782cb092dmr13280282a91.15.1737264176974;
        Sat, 18 Jan 2025 21:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6SYzua+L9zOXH7ZMjBP2BXe/Zm+CgoCUSMQWNJge1vtZEYocFxke10dX6xubn0KCvA3fnFw==
X-Received: by 2002:a17:90b:258b:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f782cb092dmr13280265a91.15.1737264176605;
        Sat, 18 Jan 2025 21:22:56 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:55 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
Date: Sat, 18 Jan 2025 21:22:47 -0800
Message-Id: <20250119052250.3488343-3-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9OnaJn2rQc250WoXMQX3iHokuq24F_e5
X-Proofpoint-ORIG-GUID: 9OnaJn2rQc250WoXMQX3iHokuq24F_e5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212258_278291_52F6ABAE 
X-CRM114-Status: GOOD (  16.87  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
the same pointer. Instead store the pointer and pass it to the
latter two functions.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b1a79d8f980e..67f733aac759 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1537,17 +1537,15 @@ static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
 	return NULL;
 }
 
-static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
+static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
+					 struct ath11k_vif *tx_arvif)
 {
-	struct ath11k_vif *tx_arvif;
 	struct ieee80211_ema_beacons *beacons;
 	int ret = 0;
 	bool nontx_vif_params_set = false;
 	u32 params = 0;
 	u8 i = 0;
 
-	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
-
 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
 	if (!beacons || !beacons->cnt) {
@@ -1593,25 +1591,22 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	return ret;
 }
 
-static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
+static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
+					    struct ath11k_vif *tx_arvif)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *tx_arvif = arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	if (vif->mbssid_tx_vif) {
-		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
-		if (tx_arvif != arvif) {
-			ar = tx_arvif->ar;
-			ab = ar->ab;
-			hw = ar->hw;
-			vif = tx_arvif->vif;
-		}
+	if (tx_arvif != arvif) {
+		ar = tx_arvif->ar;
+		ab = ar->ab;
+		hw = ar->hw;
+		vif = tx_arvif->vif;
 	}
 
 	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
@@ -1640,6 +1635,7 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->vif;
+	struct ath11k_vif *tx_arvif;
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
 		return 0;
@@ -1647,14 +1643,18 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 	/* Target does not expect beacon templates for the already up
 	 * non-transmitting interfaces, and results in a crash if sent.
 	 */
-	if (vif->mbssid_tx_vif &&
-	    arvif != ath11k_vif_to_arvif(vif->mbssid_tx_vif) && arvif->is_up)
-		return 0;
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (tx_arvif) {
+		if (arvif != tx_arvif && arvif->is_up)
+			return 0;
 
-	if (vif->bss_conf.ema_ap && vif->mbssid_tx_vif)
-		return ath11k_mac_setup_bcn_tmpl_ema(arvif);
+		if (vif->bss_conf.ema_ap)
+			return ath11k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
+	} else {
+		tx_arvif = arvif;
+	}
 
-	return ath11k_mac_setup_bcn_tmpl_mbssid(arvif);
+	return ath11k_mac_setup_bcn_tmpl_mbssid(arvif, tx_arvif);
 }
 
 void ath11k_mac_bcn_tx_event(struct ath11k_vif *arvif)
-- 
2.34.1


