Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CFAC02194
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW6HwO/qyQ8ldqkF8vmg7N3AHYrGXs/JkvKQvxQSsz8=; b=WqScM18b/54jDWLCgZ6JvsDiVu
	Ia2vYMBzowzqo1gzNJFhNl2nQuL6ByuujyW3mQfAgO2i1DYARyzyW6SrG+1vYwPpVo8T1IWiD7aMz
	kISHfdpDcW/9rSPxQK37K038bd/TispbtGpWeOC3r2oHaUQLPHliBfoVStXFAbNIskCvtBZUmiiwQ
	+YqOg2K7Y61TgDOM3HJ8KyFbfNnfwOS/NIdivOaCeXzaR1o1Q1AFuowa/ZEKUgOW+u1rAFEGLtchN
	ct9gTe+4G22x9UPE7vZIH0af9gM7+l0p6aa1w2C3newnTt2AI0k0cA7Iz951il97p72PlX8N6PSJj
	/j2SQ2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Fa-0000000Ghrv-3Ukt
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 21:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FV-0000000GhlI-2M2P
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IpqZu006198
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jW6HwO/qyQ8
	ldqkF8vmg7N3AHYrGXs/JkvKQvxQSsz8=; b=Y5DEUB5wxzU/ErLzIpcWu03BLp0
	+BGR2FhT7SYgex4bcSADug7Wm1iSjs0C1tGD6oH/ozx4AyP30PhWLaTm/6ky+5WC
	cL47sPJxSAnZuayo6873UPjJZqwVvquQbuSpPkfp5LMw8uVEZkP+4FkAvQTsEkyo
	7cYcsNL+OPtlCAUzdlY8se0AR+QRm0D3RrL/v2RH7mREkbMG9TeR4P0JkP0+Gn78
	gyp1/GAa6VAxCTAC3WmF5UUqb3tDba27xJxSAiSLk1Gv9YlRE4VPaDdGjDKOqjun
	/utwRy8HmHhXRYiX3LHaBnUFy0HCFrjD6vFirJDYxnZAAOl+YkghmP3gYmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex0b3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so13671297a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619095; x=1739223895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW6HwO/qyQ8ldqkF8vmg7N3AHYrGXs/JkvKQvxQSsz8=;
        b=JnueMBThdJs2YJUNIqsJF474O9pswhvU4E9tooHhyV3yLvc+SidTKP9eIFzNrpLqyX
         4pBikmJX+vc+d0hoW3uwx0XvGe8hYra0QsFFFWGW93KfBZCjyhfRQlKY5a7R0mH6lTEw
         isbCpBzzBZsuNLM1HegPYWHcFS5ztiBtdcztufrnFR1sAy8i0tK2HaZ5cUc7cYarID4h
         wVnS45/DHjaU1rwVuBJIHvM2tu7XuM4eYygk14Df2uzO34u0m0tifztQs3eCRQMKkE6V
         c1IyfRcKTaNNN0OoDaoZgT8AzlSx1cNwzF6hXdlsYQgH8biVUFe3tpjfXJwHLfS/d0BE
         GIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmOpjWMU8C98c8vSFtoQgxo4I6OX2ghectUSwTyP2yiQRP0zakiTR+fYZZZLBOqNK9buDOYrk=@lists.infradead.org
X-Gm-Message-State: AOJu0YywRDQ0k+rX4iQc1Xip6ZoMxDuWwZg+MA1qdAwK2GTLVEwqugRP
	Jm66LSZ8/zNfxtLmOQou+/73asCMddlFh+njHMKn3THgrFD9CpYf7YFKyw1eTV8ONC0nrncS4Zd
	HVqU1YSc9f1tK7XdPNH6Z8nuvcxia8AkaFbPIWt9tQpmHDMdknG2g4b+sLdxz
X-Gm-Gg: ASbGncvnzQO3uROUzHFCdGzla4gfX9fR8Ixd2MA3DtN2eAnVQfx5DYTOwXOiwIv6d7N
	nQqbM1K3ZcwSVtsDQ4loKiHnlSwRiGg+146ntMrVCCkvyZj1TMy4U9oM7LEIwtZMAEzWlpo9+oB
	Zhna8h4o7tnUshKkNJuwAUtv/Wsa9csg+rt/WMzZ/R9v1pqVwOXuM21tOdfM3BAuPZ3cYukOk3D
	Bda/PZJJr8JD3vDpcProgaCUSj76MCh4dEi4VpPVfeFsEL4WHPgZn0hNmMrsoYrJOlujKVPcMcC
	kjoN/WcM9I0fqrlCFyugDTFLtB2l7fDXhf5A5U8T/M6q4PWHqbo+a/blE5RY
X-Received: by 2002:a17:90b:53c4:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f83abd7ccfmr36001578a91.9.1738619095128;
        Mon, 03 Feb 2025 13:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwJd39vaZmazZzFpg8uh7/VVetZSQp/x673t3NGMiSgjrhKf3+jKS8K40tSAFiD6P8umYlEw==
X-Received: by 2002:a17:90b:53c4:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f83abd7ccfmr36001555a91.9.1738619094789;
        Mon, 03 Feb 2025 13:44:54 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:54 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 5/5] wifi: ath12k: pass BSSID index as input for EMA
Date: Mon,  3 Feb 2025 13:44:48 -0800
Message-Id: <20250203214448.1978156-6-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tlT0zaIM5nMrNvtKgqAnWg5MOte-zIkG
X-Proofpoint-GUID: tlT0zaIM5nMrNvtKgqAnWg5MOte-zIkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134457_730069_B12E5604 
X-CRM114-Status: GOOD (  15.14  )
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

Function ath12k_mac_setup_bcn_tmpl_ema() retrieves 'bss_conf'
only to get BSSID index which is an overhead because the
caller ath12k_mac_setup_bcn_tmpl() has already stored this
locally. Pass the index as an input instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 90823b85b714..5ec82c881b3e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1643,24 +1643,15 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 }
 
 static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
-					 struct ath12k_link_vif *tx_arvif)
+					 struct ath12k_link_vif *tx_arvif,
+					 u8 bssid_index)
 {
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
 
-	bss_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!bss_conf) {
-		ath12k_warn(arvif->ar->ab,
-			    "failed to get link bss conf to update bcn tmpl for vif %pM link %u\n",
-			    ahvif->vif->addr, arvif->link_id);
-		return -ENOLINK;
-	}
-
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1676,7 +1667,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	for (i = 0; i < beacons->cnt; i++) {
 		if (tx_arvif != arvif && !nontx_profile_found)
 			ath12k_mac_set_arvif_ies(arvif, beacons->bcn[i].skb,
-						 bss_conf->bssid_index,
+						 bssid_index,
 						 &nontx_profile_found);
 
 		ema_args.bcn_cnt = beacons->cnt;
@@ -1695,7 +1686,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
 	if (tx_arvif != arvif && !nontx_profile_found)
 		ath12k_warn(arvif->ar->ab,
 			    "nontransmitted bssid index %u not found in beacon template\n",
-			    bss_conf->bssid_index);
+			    bssid_index);
 
 	ieee80211_beacon_free_ema_list(beacons);
 	return ret;
@@ -1730,7 +1721,8 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif,
+							     link_conf->bssid_index);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


