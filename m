Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED5C0219E
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAbeSvzzDSRfK4FglCkwrWyMnTvLJKDNWwTPCreQNEk=; b=IetuIaCjywgrQpAyBk6s57A1Su
	AFl5xTbwUfhs5m4YwmjduhCSYwyl4H0atUtj+TfKn2tOcJ+b90UHjmITgsSa2exMvm4l0jyeGP8Cf
	ZQk8H3hodGTyJdY9LdPfY+EPUvfOzKLUIJsWcyvRBrmHvP3ONKiGCAIIaVbRLVLiXyiJYwZvr73MO
	lqoOeoEaw5FAWkaZjEBf9LVK96afGGMaeSGZK53Nmg/GwNtnA+Nx0J7QubjX0Hec8Ia8fGpcEwHwa
	5w0NQy/2QuiprvR6PgYxKndWroi5toxU4iuopb3zJwD6e64WcFuQSUM+0Krc/kC/wggRYDhkqk+hV
	kmA0s0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYfp-00000000xHl-2lIw
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 18:38:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVA-00000000v3p-36kW
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AAbA6u011114
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fAbeSvzzDSR
	fK4FglCkwrWyMnTvLJKDNWwTPCreQNEk=; b=dP1oZgKAZtmQiVKlHICG2oUIMXp
	WRX97QuVLKEujuszqVVLSnLdlGcTq+IBmvaCIHFnhvQqdnnjabp8IOX8/EtcFwis
	NsJQX5iOr4TFPLqQmrk53kHzLm6vI6NijI3VDY0IOR13t6TOg9c8YPXglCKV5tLO
	vD39FZxejQiXwpEHwEFudFmjnkc6d5cIKijpqzs5CFFqfrdht+5jFrPUe5qvVhLJ
	fO1dcbEoR3TEaDWARctqODix+WKpcnfks6vua1Yt9f+50lBRBXTFoaqz/JtjUWEf
	h9AS60rCHAm/iFZWSYe93+F0qlIi5FdTXCJh/gX9pjfYj7kZ0zJKS8c1pyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44q8kyafjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa9bfea46aso660263a91.3
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212043; x=1739816843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAbeSvzzDSRfK4FglCkwrWyMnTvLJKDNWwTPCreQNEk=;
        b=RJW5QOpJu9FFUR24HA9AWPkdfRPTwkUiXvn3qAxq/eSySU/lFZPA9TxVVmH7LlYf3U
         A+SyQLa5tevPFJsRjMj0qUskf98KZdkkIOwhDBYL7PZea1L9bJ+c4F4Maq3ebQ8LNCVt
         9R5mooKz7LfcoVIwKST9XzO2R1BZK0Bfr7KTuWkA1yhpDEzQC5VSVMY2fBiKm3f9Wpef
         sxrfen01MwBDB+wovxWpaw49aiqVALl0UeC7dFqnGgpDO4Q4B9FxPv7ftWy6Ei8xIBMv
         g7FXYJZWtPt36SYLlOOuYtNTJRP+G9ynj8iHgHXnMAjiwGf2sKqrXhHDwn1nZqP/LULz
         xBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsEmhODK4/YcBQ1aZ5iAb8+eagA/+soxY7Ov5IAFO0RAOcY8HPsBYdVMAXj1zCrgneCJGsf1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwG73RxmVS9JY7uCYMkuEyRHUKzUyI6RqD8F9HIQ/xFR5k7iTH4
	NjQzAJjU6TLSqKt29fhjbesc/hvJcfh+uPixqYiLXuiEZVUqTIQt8/r03AWNqNZuCyB/MWZdLPD
	koxbvf9RzaCjup/o8XJF/3DTTr70dXst0+wJKqJTR+QqNN83517bG2hy1f5HP
X-Gm-Gg: ASbGncu2EqKwQaIGEiGZ8pkMdZq28IOUsqdnw7jURA5/w/QtJe5kMYxRyBbLUKymR7Z
	PAWyng+AL/nNn8/YW0dYhgjLqx60/OR9n3DViBWqjcph79Tol3JTd4pqhBZ/jhODORI9OkQyS3P
	ygjQ55xev9CGM0Hd91QXSqMjTMPNuRWWmYu0v5AMvdV2kdeCFqhNMHGI/hhnmYeNwtjzTJfA4l7
	a6QJsuywH0XJco1wj6gYglaq6//y+aWJsgSo94wLOkP9cQVM+oc7/2FVanpqTFPj9+PIJJOgNK1
	MKXRvoigjZOSXNYzZ9p9cdMf2osmJb379v0PEC1LExGIyK2dvZfDZFdf8FZu
X-Received: by 2002:a05:6a00:f07:b0:730:8e2c:e53b with SMTP id d2e1a72fcca58-7308e2cff04mr7494884b3a.5.1739212042817;
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl6HApPA5o/SXwLPe8SFpai7AOw0KUzZ5vMElwGSGjqDBkSWO7oTOcmETRxasiZPyDWmGWUQ==
X-Received: by 2002:a05:6a00:f07:b0:730:8e2c:e53b with SMTP id d2e1a72fcca58-7308e2cff04mr7494841b3a.5.1739212042353;
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
Date: Mon, 10 Feb 2025 10:27:15 -0800
Message-Id: <20250210182718.408891-3-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TlM6OU7iuL59h_6pP83odnuT4vAMiCXt
X-Proofpoint-ORIG-GUID: TlM6OU7iuL59h_6pP83odnuT4vAMiCXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102724_786852_36416903 
X-CRM114-Status: GOOD (  16.98  )
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

Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
the same pointer. Instead store the pointer and pass it to the
latter two functions. Compile tested only.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 466a314b938b..97816916abac 100644
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
-	struct ath11k_vif *tx_arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
-	if (tx_arvif && tx_arvif != arvif) {
+	if (tx_arvif != arvif) {
 		ar = tx_arvif->ar;
 		ab = ar->ab;
 		hw = ar->hw;
 		vif = tx_arvif->vif;
-	} else {
-		tx_arvif = arvif;
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


