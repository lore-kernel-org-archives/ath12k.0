Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E9606A33D
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJImYkJO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvfnQzc5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpN6dG+9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=; b=JJImYkJOFtgEaU
	9cWbrb8njagP8uzhP6/WP7Ta9oSpJIczBUUa3/7eE9xej1lq+TyYt8/Fp/cYb2lW0aMf1HYVOxGd7
	QeaQll9kuKGHyRz1XPjxCARGcos+LG+0cQRCQvNYcPc4pRym6gu965SgtUVIA4d8gazuZFvxKfOow
	56FGWFCWTzFacN9+4qAnZm/sVDxuiz5WZbzSQyK/a6OKv5GXM86VJQujEH2cq9FwRdHJlUC7tc5/m
	WmOEtFZvz7XPbY/UY6JBrJu69uVW5KmuGuR16vRYzgdQpuO31+XvZcl2r5l6p6Mg8MzJL8XF1Cx0y
	L+DHFjVgM/2wgAIH8pbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtm-0000000Br5Y-2uwF;
	Thu, 26 Nov 2026 02:07:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOth-0000000Br2a-3ZJ0
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgWD91138012
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z2t65+X6bE5
	g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=; b=RvfnQzc5PTyXzRIxb60sbMdeVYx
	vgOwpaaCkax6zHTH3+bth5WtsxaugXvhqyTom1/yX3jNBQzZK7NGCIVzmHKvgZE6
	+2iqFDQm+u36/uhBTL/KcnCFVF4EOSMFkiDfOCrkXPXAvugrXb7qd2QFtblDtX57
	TblLmrMF7pad/Q2Uazihfiob1iXZQtElPQpSp2Q2uZHVf5smxY8VdbeklS0/Il4m
	ibAyJaffNQZ3ytC3cxr+qo8h4DwrvyLjgibsZXk0f3iCwH4lJed84KA3l2sYfwRk
	ZEZpHdXd/POVjpX1j8vEQptAaJG7YycUc1WQgI0xkxXEpIwJ5JhXKr/5jMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s8yw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cde75c957a7so3299034a12.0
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658861; x=1796263661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
        b=QpN6dG+9x3mvV0+iG4EZpDr8u9S8aQK8KgXFT/Fm4R98zfhhijcbNC6lYTSrmwceb9
         +EyDoHT4orHbTLAu+HPQgBoCpaSZeYANDwtVmKJWe+0d37Y09sLFeQ2r43HuC87wD9mn
         P+p8lA76NQ9xF+scrDOWSgZnGMsn9+h3ubovVKWYZHNeMtwrW+0VNEzGD8e7tyqLD6mz
         +S2TuDMdrBPgY+Nxlie5YyeIQTbpOZ+IafxfBs6Qnnml4GjZtp/jYa1bSrU9r9SQM5JI
         71uhPUgyltkidFD7kxjqlFzSKvxGwrS+l7Gu9Rcvzs5IwndA8uFXCoopYaX2DRy47zrO
         btew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658861; x=1796263661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2t65+X6bE5g+Fc6Tg7IbK2g1t2NNkQ7zYkTkIeL4DU=;
        b=ID193LuOQrbuJPRodW3P1pxAOd9IDJ0SuD3rrGQ+QM0U/YPcjYaiAbJWtdZ/9ZIkKT
         9Jb6AHpclqjNwHxbQSCgziirH+KahDDOQvRdIzgA7BC5+/4bFKcZnSCot1zBXyOLRjH6
         eilebeoFwiJxtEIpBI1tJmOvxtuHjI99Nfk8QRIhmIGmEbB+GcyHIY1s0HS3OxOuFTIn
         DdqnwQAwOZDu/Y86dVc24gChPkRp2LaGN9ISq7P84+1nauaTRzvFnoM8X6nn35zW66k6
         TBYdeaIHDslQ/ub+WHu/2lK/tfg88mCr5XWw0ajRMymXQa1+5IIBhz1e0NpTPvP6Qznx
         HK3g==
X-Gm-Message-State: APuU4Z+KoeAjzoYQBBq2RIEGutAoI6shXpRaaWce82S46mAWCY2c9y4n
	2LfaRYsTxAJRcHCjFbRyOtbiFhJhjt8LGdHfLvkDn/bEL9OtteCKxA+eThAtAefgEkBLhZCATRs
	e8qF/PwhEGr8WR5DseqpRVjQAd6f4D5241W0IbunPspCTW9jrOwzZ0lVKHrLUTR7+
X-Gm-Gg: AZFdTZcTMCZ7GPC3/5BljJizfpNLS0pf5YmCNsmZMrSfBRnRTo5a7L4PZ5mYTH3OSJl
	2G4g623aK42y6P/yO7oEq6bN8Jihzfpf7r9zvlec0eRIO0uHQATDU7nWpNsUHf/umYN0y0fDqLu
	tvFwziOFmY0XtbgBhrUs/D41ksjY/LkCosFMZI+4Wwkr+5HOAFyDQeszfWW0gTHMOuU/EXJoig1
	a2SV6XWd4NLjGY1jsxqcp034lqFNpOfceGoKXsFHc5PyhdAUVO6moQgXYqbrWhscflNKHllHKxf
	8oyr2Riedu+Kx0RfESJy5RyeFBLUu1UqvWNXcqPLNt2KeKlxkAocfUHsYXG5vw6FQdYZLT7b/q5
	evB6WsGe28BYm2J+FGKvyd/apczSCA4JlXyZqlQZ8fMNUQgolVDV/GdELIjxnqWE/Qsp51PgxW+
	92DZmfPZY7mtd53jrOrh9Fa++Qjq8BihU1Q98+
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr13102296a91.24.1795658860374;
        Wed, 25 Nov 2026 18:07:40 -0800 (PST)
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr13102266a91.24.1795658859644;
        Wed, 25 Nov 2026 18:07:39 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:39 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 3/6] wifi: ath12k: initialize per-wiphy MLO iftype ext capabilities
Date: Thu, 26 Nov 2026 10:07:24 +0800
Message-Id: <20261126020727.3273337-4-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07946d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PHNU0lTNFGNsHSJflXwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ZigOwTRcPO7XJuk09RYWgJ0Iww2LWyT5
X-Proofpoint-ORIG-GUID: ZigOwTRcPO7XJuk09RYWgJ0Iww2LWyT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX/0nnyRzIpVY8
 rMACurNopSVWhzZqO2hqb/rWZoDqLwBD7QozWuOCLm6ItweXw6iEwMd/j1MSEl9Gu4Tiqt7YFoI
 636DxwH/chIdOLXhuns5tUagOXCs22h7+2iS8a0lAgNX1IWgiUNSYs063v+cEF/0YBixHVIawpt
 mpUGO5V/tgE5a7SMwnbQA+asgsd7cCZeDyVc06E4FcbW0MsUkLkdllwMX8p+r0j8Q20yWTzHuZ3
 2M61proAGX3nP+hXUBC8Hq87lT9znt1fZF95mTEGb+uulQMY/qcCFq4xaCHYr1Fm0PegRGfE2Ci
 l2+san6LRY5XWX62t218DV8sWWvW3W7ZfmAcG4Bh5lWas/Z8Nc7LxtXdS2akmv9KsvfWLyeFm9O
 TKrrtTg9VQ/OAN1G2pAM4aLYbcqntvbIEneIMk5bJW8KKbMTIJiQ3IpknQF4h76yDTw8N6WL0UU
 42Y2Hx2xXn1L9Pr/Eww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX9v4l8T3ktMQX
 HtnEgD6PMPIUTsT9Pg5MD+/pGjRfKXQTbFSam9BuV5Xv8E3AbwMM0Aeom9DSV2c/Omvg+N1YKZZ
 af21URr+BUAPsrb7u2xLA/9BmM3h5So=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180742_088827_3728153E 
X-CRM114-Status: GOOD (  19.66  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MLO iftype extended capabilities are currently stored in a single global
array ath12k_iftypes_ext_capa, shared by all ath12k_hw instances.
When more than one wiphy is registered, ath12k_mac_hw_register() on a
later wiphy overwrites firmware-derived EML/MLD capability fields used by
earlier wiphys, because mac80211 points all of them at the same storage.

Fix this by keeping iftype ext capability state per ath12k_hw/wiphy:
copy a read-only template into ah->iftypes_ext_capa during registration
and point mac80211 at the per-wiphy array.

Rename ath12k_iftypes_ext_capa to ath12k_iftypes_ext_capa_template to
make the data flow explicit: the table is immutable source data, while
ah->iftypes_ext_capa is per-wiphy capability storage.

ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX is set to 3 to represent the per-wiphy
entries ath12k publishes and updates: one generic entry
(NL80211_IFTYPE_UNSPECIFIED / iftype 0) and two role-specific entries
(STA and AP).

For MLO-capable wiphys, initialize station and AP entries from the
normalized firmware capabilities, preserving the existing capability
source.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d33bc467e832 ("wifi: ath12k: advertise MLO support and capabilities")
Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  4 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 28 +++++++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..82aead52fcaf 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -42,6 +42,8 @@
 #define ATH12K_TX_MGMT_NUM_PENDING_MAX	512
 
 #define ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI 64
+/* Generic, station, and AP entries in ath12k_iftypes_ext_capa_template. */
+#define ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX 3
 
 /* Pending management packets threshold for dropping probe responses */
 #define ATH12K_PRB_RSP_DROP_THRESHOLD ((ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI * 3) / 4)
@@ -812,6 +814,8 @@ struct ath12k_hw {
 	struct completion peer_ml_id_done;
 
 	u8 num_radio;
+	struct wiphy_iftype_ext_capab
+		iftypes_ext_capa[ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX];
 
 	DECLARE_BITMAP(free_ml_peer_id_map, ATH12K_MAX_MLO_PEERS);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3b..e78c711b7832 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14758,7 +14758,8 @@ static const u8 ath12k_if_types_ext_capa_ap[] = {
 	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
-static struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
+static const struct wiphy_iftype_ext_capab
+ath12k_iftypes_ext_capa_template[ATH12K_WIPHY_IFTYPE_EXT_CAPA_MAX] = {
 	{
 		.extended_capabilities = ath12k_if_types_ext_capa,
 		.extended_capabilities_mask = ath12k_if_types_ext_capa,
@@ -15051,12 +15052,25 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	wiphy->features |= NL80211_FEATURE_TX_POWER_INSERTION;
 
-	/* Copy over MLO related capabilities received from
-	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
+	memcpy(ah->iftypes_ext_capa, ath12k_iftypes_ext_capa_template,
+	       sizeof(ah->iftypes_ext_capa));
+
+	/*
+	 * Copy over MLO related capabilities received from
+	 * WMI_SERVICE_READY_EXT2_EVENT if mlo_capable is set.
 	 */
 	if (ab->ag->mlo_capable) {
-		ath12k_iftypes_ext_capa[2].eml_capabilities = cap->eml_cap;
-		ath12k_iftypes_ext_capa[2].mld_capa_and_ops = cap->mld_cap;
+		for (i = 0; i < ARRAY_SIZE(ah->iftypes_ext_capa); i++) {
+			enum nl80211_iftype iftype = ah->iftypes_ext_capa[i].iftype;
+
+			if (iftype != NL80211_IFTYPE_STATION &&
+			    iftype != NL80211_IFTYPE_AP)
+				continue;
+
+			ah->iftypes_ext_capa[i].eml_capabilities = cap->eml_cap;
+			ah->iftypes_ext_capa[i].mld_capa_and_ops = cap->mld_cap;
+		}
+
 		wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 
 		ieee80211_hw_set(hw, MLO_MCAST_MULTI_LINK_TX);
@@ -15083,8 +15097,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->cipher_suites = cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
 
-	wiphy->iftype_ext_capab = ath12k_iftypes_ext_capa;
-	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ath12k_iftypes_ext_capa);
+	wiphy->iftype_ext_capab = ah->iftypes_ext_capa;
+	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ah->iftypes_ext_capa);
 
 	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
 	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
-- 
2.25.1


