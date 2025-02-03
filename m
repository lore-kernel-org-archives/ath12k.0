Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D4CC0219C
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDahZQj7Tg4JSWeS/TSyZQmgNDpEbC9fI2EuhqXABCs=; b=oz81bleBSeEaMABH71mt87GJPn
	T1A6L0MMOg+iOeSCkPPUkjGtmWuBID7GnKXva400osMCEcUPp4OW325Gz1iO15mUmALOuNjoZA23d
	zEysdisc3kBwqOCjO5e3AxjZsw9YSd1lBoVbLX0TsK+pZCTpBJiH5HEfLU8uoXQxfQMPM7HvhFJRF
	8ed+rdoC9yl33/Cp27t6uit5uEu3luPEnkg9mqB0Y+Gp2EFF6GWG0VOKXoWPy/CHsoXrryJR+Ysu4
	IEoTRw4MPqX3Br/w7jtDiuehl2isigHCgVpDjebXx8hVrHpM/D89WaZFtE7j1IeIr3VaTiP1wWpw8
	bdNKS6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Fa-0000000GhrE-0MUL
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 21:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FU-0000000GhkQ-22k6
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GW1w3002478
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDahZQj7Tg4
	JSWeS/TSyZQmgNDpEbC9fI2EuhqXABCs=; b=Qc5fHFvbD4IzSjCyHMpT4Zb2KrY
	S/XjFG+R1ZbZXZWY/AKK/eKlOE+zurBGMKBoZcqumlFB4rKv/nrUCBkEXVOJCTwu
	D8zSXffjCPBQxbQjE50cbNUIh+1WbtD7ORiAM1b62GvyQGwNqFVif8JmdhxXDnrP
	KX/IdSWstsxqnmPigFLmSSM3L9+pTTJtuCkWe2S3/LlbAatTKWjTbUb7U9yqPPil
	LraUnDl7BYa0LMGazOeoOdta9plGRhgyoDNZWcRbhsXNxo8B8xFhI7/RqX4qwh/i
	yxrj4+BiKyAs9wdQ9zoUa6bR/HM0a3+8OYQC9EhWh0AUSyAjWEYru9h817w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k1d9gnh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21632eacb31so69374845ad.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619094; x=1739223894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDahZQj7Tg4JSWeS/TSyZQmgNDpEbC9fI2EuhqXABCs=;
        b=BvUqnp/edLwuDj3JptLxF6Oewt75LZjHPEz5XdKRFceZ7DwN41JgVxRtqERIIAhNKt
         Iug5oTvsvkDgLvGOm1d58Cib6SxB0JIDvhbb8tH3ozsdo4m7zvv43UOS4skKoBp410vj
         h9ugNpWf+soN+JMcbEKh9HuIjeJfSEi+iEYOtB/xAZ57WyWSICE0NVelYpRdWXXXfyWE
         8xsrpUQ5m5ZhXP4Mv9ABeMYnWmIe1ZzONeWvdsSGXXLXBdht/J3K5DHhhyaU/PseLVkY
         xSfRauWN/tp01UdNwpRFlsR0Bb+xlLooCqnDkxpt3WPbNoioMUs8BaFadBbB1ay7/Os5
         9g4A==
X-Forwarded-Encrypted: i=1; AJvYcCX+tnk/PeRj7PQws5/3GqmeS+EG9+2mxWhoEbrj0zxut5y5Zt+ildEllZAiQRshn+jDfSnKPsM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcLvWQvJ7JN2JzSH5sQf5l7TTsDfZ5KKe8cGiPk6Fdai2myioS
	S4WBcStCr8Hm4p+j+G4KOtik35NfwPOwmUFHn2PzQ4M1BIp0ms4WVJ1vQEQNs+SDI+zmHcvZq34
	HWK405oIX2pJV8Bm6bSmEiQD3KG20j/GixAM662dbtHNX5pzyLLiprg6mDNgwDedsvf4i
X-Gm-Gg: ASbGncsLLx0IpEryn0JnybjQmtA1WNEL+qg/Blayij8SWwBhxBGWEloiSGZGANOXW2m
	KEeRLh0rXEi2X4XAKtPCOohK66pG/o8hfhGy2jVwFBq327vPFVzT0nnMzLwoRVd3kMKazbytaOg
	3igfrDiF+LZL+dbWyD3QlHpakIAJfkY2+xygEH5ZDB04aqqilZIZx9gvJiWKcPl/6aNpl41HPPH
	iWk3yRGUV7+vlI4/emeqowWVrpps9rd6X9GdZfvMV6diWW8Q4pVzmfxM44AJz71j+k/ExeIdQmk
	0q+CN3I7Dl03v25WPTgzXPwpknj1OUwSpp6Bk/sg+oWJGk3ByAvm9s28KxEY
X-Received: by 2002:a17:903:247:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21dd7dd5339mr372681385ad.45.1738619094102;
        Mon, 03 Feb 2025 13:44:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGigjZfzxDKHl/nhSzaApNAcEsschatItTybiToZ1tQxWCU7pGocBtA+MUgi/U6h/Pr0vkLbQ==
X-Received: by 2002:a17:903:247:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21dd7dd5339mr372681155ad.45.1738619093749;
        Mon, 03 Feb 2025 13:44:53 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:53 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 4/5] wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
Date: Mon,  3 Feb 2025 13:44:47 -0800
Message-Id: <20250203214448.1978156-5-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P8fdFlTEqWGS13Ic2GkxHxrCUZuroNl6
X-Proofpoint-ORIG-GUID: P8fdFlTEqWGS13Ic2GkxHxrCUZuroNl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134456_631597_980235C1 
X-CRM114-Status: GOOD (  13.86  )
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

Add new input parameter to ath12k_mac_setup_bcn_tmpl_ema() for
'tx_arvif' as the caller ath12k_mac_setup_bcn_tmpl() already
stores it locally. Avoid duplicate retrieval.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index efd155031feb..90823b85b714 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1642,13 +1642,13 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 	}
 }
 
-static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
+static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
+					 struct ath12k_link_vif *tx_arvif)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
-	struct ath12k_link_vif *tx_arvif;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
@@ -1661,7 +1661,6 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1731,7 +1730,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


