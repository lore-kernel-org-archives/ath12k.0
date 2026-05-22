Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F91ACD5BB0
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PHJH6x443Ki4p9DJOp/htAz5X1XhDK/9Cuy3YGaq0h8=; b=Om+DREhnEZcFvoji6Sv3rR9aPk
	8BbY4/Dcg8EsZHZNlheNh1UqPypBV26ICDhgtyLdE9Qz1/gkWp0W4x7+8aO62D3ljOiQnp1MAOkyk
	CCo5AqfQj9RMZTThHKsBwlUIhGm8EdMA3cCuRFseARSEGChMIf+ODeczlPYsbtiZAyQc3gdkVxOKF
	3qKLspEdVi68AluwuuvDg33RNBv8quB2rMyuPyX+1Wa6qgJbVKyZSTk91o35WdggT7YYhtP3QTNWE
	KuLEGuIOJ26P28uvugsMWuoHOIF1MpMECX8Ql9nCsp/Ow9ow5J7T+7PaepCsTOp+trlwtZJl9gcuL
	Mi/O+A8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLvl-0000000AI2I-0a9D;
	Fri, 22 May 2026 09:12:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLvi-0000000AI1G-1J8w
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 09:12:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M5EtQh312917
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 09:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PHJH6x443Ki4p9DJOp/htAz5X1XhDK/9Cuy
	3YGaq0h8=; b=NwoSN47UJSHu2XX87ZDbCHlFCCeJzzys28Nm1icpKohBaC0zHyI
	NB/8Zfklm1fXtLucTKdl9IT23OZsnSlHvHbHj0ABW52ISmJCsu/PGKdn67RSSNUC
	3oHV4q//k4bP+CB45CZrToLGGAvUJST7v94vV7MS01KNjMtQ91ECFYqMp3HBKAqG
	WSrH/sGR/D0H208imfdkCdndZk5vY9nhn+zH0fRrAPYmZ9weaPWjmGVbpJ6b3SFk
	bPJIpAN7h2PA/Sn8Q4VKqd+hreUAR93wDRZTop2oj/bPkBuedoNR3yChOa/bxftk
	kRSJFrDUKtRE1dmtElQQB2GF/AddZCdbY1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea883324t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 09:12:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so49057255ad.1
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441148; x=1780045948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHJH6x443Ki4p9DJOp/htAz5X1XhDK/9Cuy3YGaq0h8=;
        b=JrBPVqKL/gl4zdiKQULo4/llStM6Gk2CL3CW+maaur+k/UyLVU6f0sGQg0gZHFX+ft
         Xyrk/S23cHdaT7ViCMn8HLQVnvgHh654iHs8/o1uMXEQwE3Ly2tuoJM0iX1LqUPAV3Pf
         b9nzKsJpL3dqO5BBLLtbm6sEql2oucyoGBwvWu1tgjQZQj81iInzu88P2rO/qItdWGSh
         kWKacobKfiQ2wyCNTpE1oVaddo4o3E5XqGuZlxEjCCqdjJIEGxlkvG1QbaMP2m+IY4iO
         4mstlHuSCY3jEoZb0qepQ9TvvoW6ujd1VFWN/NGh2bCLTh3szmP7/ZtdTD1BxJ29RU//
         yCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441148; x=1780045948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHJH6x443Ki4p9DJOp/htAz5X1XhDK/9Cuy3YGaq0h8=;
        b=hgnSxyZZm+rrByI228YLiLkmOCAU2gJGCPs3uaG34D+47oq76IbblOo8zRcscTf8KK
         yKOa4AjJaDa2fr20iWaxgF9nRl12dJ0xu3UjFwtjH0Duptz4IaiCYZVp5CFQNZX1YC76
         SmOSDtDsw7lqTHMo7x2poKBZadKTMQO3qwZc1ryYKqLZkSib5mWrClZvUc9aYN60N+EJ
         MOEr1e3svY8CSoTR7g2kPjV4Ubv1UW6J2/csyVGPLDsAxfl+QKEsZQVyLIxrDuzDYrly
         5PSB/PXBfrLFr76xS7OKNkdSxIV5kDnW3D+3WiFVZ/al4Ci0W0TkS0aabx+s+hNlJyAO
         wVCg==
X-Gm-Message-State: AOJu0Yw/tV/Oa6uDNoDJsr5+O1kp8jF3n3hLycdMwNqjNEzz26jmOaFN
	S59BqhicgDVktYKv0tAjro5t+C9WjKopR5uImlbxnT7u/OBCxUPO50BQBg4h4WQNNlde6aG1U3k
	QONkFUAw4kwA0NLkAfhnKBC20eOcZPOYolwMvMGasBIdziMSOiUfluVbKQY2c66PyNwxllO3W
X-Gm-Gg: Acq92OEY1NtwJQ97a6o9DCdauFBnaaB+hWQdD0wD8rUsHNC9m1IQE0I8Sy/QvdjxI/h
	Slf9y79scqJ6L7KTvj1JeEG5xPzSKl1ioDNHVz2nMhh7UGH2Y35dnS0Yefo+67iiq9KytTaqZYt
	eaDYKRMj1ZeUDNsB4LaXUG8Rv4oPW/wLbP+Q/D27TE1sbYtiAKv4mPm+3B4iYogDJV7Q785vhow
	yP6KjYowhsLP+aKvSeUhqFVIoNUCFn5T6F9IYr02bLGV5bB6hCrWklToHl22Uroy61IatIZnIgB
	Ib2mStKZQgqWuae78dJxEhD0jTNwNDKNysnCxT1P1p8wdH95J27bG4RCEJKJITh9EE6h6u/IKWN
	BkkXThDh0ZwdfB//MLNVcDMzremHRaMfDvQNFjd7NEMGP45bMNByPgQG0NnUUVRYJE/3w0lEOoY
	gqgOHUBPr6atbOqzFLSFo20ukUaJjxi9b4/EGgwAwIyDDbdDTYinE=
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr29301155ad.38.1779441147758;
        Fri, 22 May 2026 02:12:27 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr29300765ad.38.1779441147283;
        Fri, 22 May 2026 02:12:27 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm14958485ad.79.2026.05.22.02.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:12:26 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Prevent incorrect vif chanctx switch when handling multi-radio contexts
Date: Fri, 22 May 2026 14:42:00 +0530
Message-Id: <20260522091200.3179640-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MSBTYWx0ZWRfXxbEJM1t6CF6B
 ctnSmUYUfszA7QijeuGRoiZbRhk+zgt1H3xKjs36umKdlPQNTVl/iC8o2mWVg0GG2Km312rcysl
 3r8DEFrGoBZHcL0j98T2OSuVN1mbQbAu/7I0IySmfi7+bkFMc9amO7sFJXjwIWS2OPC1QyIDbqZ
 a32xm5w6YaUme2rzKhVI/KDOZIYWWlDk4r98BPx3rmchCYHwWgpJkKNt4vZ8B+0WqKYhgT4Xg/8
 wZadG+rzGKeRNmZoyLyrov/vvcq7eDegEKTuEAE5SYIqxTEr7F2HVbLXQDPAiw78G8TSpevwCPh
 QP2YMmvIRrxkAcRa+0OjpgD0e+B++aUkpUyBR/NAyoKWFoGxbA5jQYMMDt9ypj7LG0cVD4INAGg
 ghCEbSd1Cb4JAoOo4QodvWVzEFAHyh9Z90CSaYmGePPsocB6UYbrL/960ba1ai0bUvBsNccHm0K
 iVo6gJGRFKYq+SpgL3g==
X-Proofpoint-GUID: ThutIJwEw8Qcyjt8Z-Ej3IPKW2hRSQ5E
X-Proofpoint-ORIG-GUID: ThutIJwEw8Qcyjt8Z-Ej3IPKW2hRSQ5E
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a101dfc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=W-UYK7jDyllEtgm6_WIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_021230_479180_BB33887C 
X-CRM114-Status: GOOD (  19.17  )
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

From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

When multiple links switch channel contexts around the same time, mac80211
may complete CSA for several links together and invoke
ath12k_mac_op_switch_vif_chanctx() with an array of vifs spanning more than
one underlying radio in a single-wiphy configuration.

The driver currently assumes that all entries in the vifs array belong to the
same radio and derives the radio context from the first element. On multi-radio
hardware, this can lead to incorrect vdev selection/updates and may corrupt
driver state when the number of vifs exceeds what a single radio supports.

Fix this by validating each vif's switch request and then processing vifs
grouped by their associated radio. For each vif, ensure the band does not
change across the switch and that both old/new channel contexts resolve to a
valid ath12k device. Reject attempts to move a vif between radios (not
supported for now) and return -EOPNOTSUPP to upper layers.

Then, iterate through the input vifs, collect all unprocessed entries that map
to the same radio, and invoke ath12k_mac_update_vif_chan() separately for each
radio group. This removes any reliance on mac80211 providing the array grouped
by radio or sharing old_ctx pointers across vifs.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 87 +++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 54081beb9a5f..5c8e25d40a98 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11476,6 +11476,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			continue;
 		}
 
+		if (WARN_ON(!arvif))
+			continue;
+
 		ath12k_dbg(ab, ATH12K_DBG_MAC,
 			   "mac chanctx switch vdev_id %i freq %u->%u width %d->%d\n",
 			   arvif->vdev_id,
@@ -12267,23 +12270,85 @@ ath12k_mac_op_switch_vif_chanctx(struct ieee80211_hw *hw,
 				 int n_vifs,
 				 enum ieee80211_chanctx_switch_mode mode)
 {
-	struct ath12k *ar;
+	struct ath12k *curr_ar, *new_ar, *group_ar;
+	struct ieee80211_vif_chanctx_switch *v;
+	int i, j, count = 0;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	ar = ath12k_get_ar_by_ctx(hw, vifs->old_ctx);
-	if (!ar)
-		return -EINVAL;
+	if (n_vifs == 0)
+		return 0;
 
-	/* Switching channels across radio is not allowed */
-	if (ar != ath12k_get_ar_by_ctx(hw, vifs->new_ctx))
-		return -EINVAL;
+	struct ath12k **ar_map __free(kfree) = kzalloc_objs(*ar_map, n_vifs);
 
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-		   "mac chanctx switch n_vifs %d mode %d\n",
-		   n_vifs, mode);
-	ath12k_mac_update_vif_chan(ar, vifs, n_vifs);
+	if (!ar_map)
+		return -ENOMEM;
+
+	for (i = 0; i < n_vifs; i++) {
+		v = &vifs[i];
+
+		if (v->old_ctx->def.chan->band != v->new_ctx->def.chan->band) {
+			ath12k_generic_dbg(ATH12K_DBG_MAC,
+					   "mac chanctx switch band change not supported\n");
+			return -EOPNOTSUPP;
+		}
+
+		curr_ar = ath12k_get_ar_by_ctx(hw, v->old_ctx);
+		new_ar = ath12k_get_ar_by_ctx(hw, v->new_ctx);
+
+		if (!curr_ar || !new_ar) {
+			ath12k_generic_dbg(ATH12K_DBG_MAC,
+					   "unable to determine device for the passed channel ctx\n");
+			ath12k_generic_dbg(ATH12K_DBG_MAC,
+					   "Old freq %d MHz (device %s) to new freq %d MHz (device %s)\n",
+					   v->old_ctx->def.chan->center_freq,
+					   curr_ar ? "valid" : "invalid",
+					   v->new_ctx->def.chan->center_freq,
+					   new_ar ? "valid" : "invalid");
+			return -EINVAL;
+		}
 
+		/* Switching a vif between two radios is not allowed */
+		if (curr_ar != new_ar) {
+			ath12k_dbg(curr_ar->ab, ATH12K_DBG_MAC,
+				   "mac chanctx switch to another radio not supported\n");
+			return -EOPNOTSUPP;
+		}
+
+		ar_map[i] = curr_ar;
+	}
+
+	/* Group vifs by radio (ar) and process each group independently. */
+	bool *processed __free(kfree) = kzalloc_objs(*processed, n_vifs);
+
+	if (!processed)
+		return -ENOMEM;
+
+	struct ieee80211_vif_chanctx_switch *group_vifs __free(kfree) =
+						kzalloc_objs(*group_vifs, n_vifs);
+
+	if (!group_vifs)
+		return -ENOMEM;
+
+	for (i = 0; i < n_vifs; i++) {
+		if (processed[i])
+			continue;
+
+		group_ar = ar_map[i];
+
+		count = 0;
+		for (j = 0; j < n_vifs; j++) {
+			if (!processed[j] && ar_map[j] == group_ar) {
+				group_vifs[count++] = vifs[j];
+				processed[j] = true;
+			}
+		}
+
+		ath12k_dbg(group_ar->ab, ATH12K_DBG_MAC,
+			   "mac chanctx switch n_vifs %d mode %d\n",
+			   count, mode);
+		ath12k_mac_update_vif_chan(group_ar, group_vifs, count);
+	}
 	return 0;
 }
 EXPORT_SYMBOL(ath12k_mac_op_switch_vif_chanctx);

base-commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0
-- 
2.34.1


