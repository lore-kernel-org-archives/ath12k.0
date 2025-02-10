Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B791C021A1
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0+YrNUgIbCdXYFJgnwFHdYOJYWa1zgH2LNCJBsZAp0=; b=kcbsOEVYv3P0Jd0w0aKoazbG5K
	HUxVof8RknmxFiNA+qS2i7DMiSR9LRaHmeEA1MRIegRf8vOe1XSf/akoSu2rypVKQH7LHJ931QOtX
	5Ma99qS6D2ZZN363XmuIA31jKb/1Gwj/znzSgmFpi9xLgfgCc/mmCWpl+jvlNfU18vCK4tP/PI9s5
	fm1Dr3y561kOUyLhrC5Vs8NRRcc3DEJOAQm8RA9iOLfPCIvSHnzrbU7M3cukQ6E1kK6lJSIiZb9SP
	Nw7WxkAzDjLO5OGOHDXvnWFnv6BenCdB23bKtB97fxJ7NkaB2QGsEBpCWylU3RkVxnbPxj886HrmX
	5mk/UgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeD-00000001AYV-11Rb
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 19:40:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYVC-00000000v51-2lk4
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HlRw001431
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B0+YrNUgIbC
	dXYFJgnwFHdYOJYWa1zgH2LNCJBsZAp0=; b=RqKcs9bF4q+qPQKJRPwh8AeFIYq
	PeZSqo8vxHoRao9eVgd+MvxTvdKUXnbgVNgf5nrrM6k/Cjqp7tFjgLejFRmeRr3Y
	TNzie9mbSjUqEnjtE3b8kNuMVvEzPZlhqGeM3oLonGUGDvsaG/5LKRpHAyrUM3OF
	ch+zXwYokBOrFVPWD7rJkFEApgZauDPJz7qwYo3y4yLuy/nrZj8Ld4JIzh0wgEog
	dc3w5d9j41q01nYw3xbTu99CBdiHFprUXObJp8UAiBoZxmWINPXQFq3JftBiBflb
	uunU0qWsDVWmCLmoXcQKpAVZMZJukXddukehqtyV2d5mql1uZEUsG2Bzb7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxhf2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f6890d42dso87178805ad.0
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212044; x=1739816844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0+YrNUgIbCdXYFJgnwFHdYOJYWa1zgH2LNCJBsZAp0=;
        b=cRUaot6HSHeFKfpBccbg2tFW/tjD+c8DPP4vymE0Cpuf7vjUP3QLYCwq6oqhpiG7Rc
         oELUZOGFePncKdlgtmIQtVVraFbGS7V67c61uVRYMd/+yWEfK5sYMYMWsCk4XVrpju8f
         5buDZ8QWbmazz9154jagcxQkTf1MpvXHhqsArSAI8PRdgDcTA9Hk8Tdz1sD59M1WYMs7
         vK4qkHnJ+/8VQF1XbA1tPuLervFDw0+x7ImiJ6Ix9QYvWB71hKwrVkQ/buNxyPoVC2zT
         XdCiMCHiTqY7rQpchV5blpEZu9rAo9JytLMolcMSXPSCk3rZDgXrsc7twvBpWIw1MHCs
         zU0g==
X-Forwarded-Encrypted: i=1; AJvYcCXj+OeYgbcYuxkpcVBB0Uvc3FbMpnCSODG5Ol/NlZLRuJ3NbUC5a5uaQz+T7/IvLhKSv6pJmAk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFaoJ3hTvMWQC7kU6ALLAMEPMeWxS9ju1NtjnPOhEL/SqoWwCc
	lEZOsPHzyMONXWs2D+MxNblo3A5C1dgxiis0l8Vsa2MOl0glx6B65O01EvtNu1opHnKXNhkoqb0
	8blKMcpX+gj7xm5S1OzfmXC9A7ym4SETHBaHZEUSswtQ9I/hUh4Q+RKrj7R5u
X-Gm-Gg: ASbGncvvtGxgXMl1ETe1ZNph9b4qKOeXuzIH99zxp5W/qdU9Oku+TIDFClK3C4TkkMh
	8Z8OC8z5N8Hf2YSuqUY8fueX0pRuoq1twTVZtaNwNPpMBQS+fhpDB2cFZ1fmseBF4DZvK+6wjYC
	yozPPEec8HlQsHDCB0xgIa4iN8ml3LnWFalgIr+ceP3csxDuRz90p77rHDq77W9llP7e9XIlHTl
	Rz9Jp6a2XLbUWAIFrDRj9AObECLU9CsVjP79a2au1IZV3tpu7AkeWI5LDYjPvC1I1LngssTX1oT
	aDskhSL+gh01i9nZInpeujMeDX9IxgJj+KMDh5G+kW3afPll3TnXvQXCgl6K
X-Received: by 2002:a05:6a21:3386:b0:1e1:c4e4:8898 with SMTP id adf61e73a8af0-1ee038c3d44mr27478647637.0.1739212044469;
        Mon, 10 Feb 2025 10:27:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSzHNPPGnNpkh5hpz0y25jL3Bxofc4K0jGt+mLpYgHZb/NDRO6OjyaDbQpQ9N1Iq+XgaRHMw==
X-Received: by 2002:a05:6a21:3386:b0:1e1:c4e4:8898 with SMTP id adf61e73a8af0-1ee038c3d44mr27478611637.0.1739212044068;
        Mon, 10 Feb 2025 10:27:24 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:23 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 4/5] wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
Date: Mon, 10 Feb 2025 10:27:17 -0800
Message-Id: <20250210182718.408891-5-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iJsaSAsEARu_fAMn8xBHjNyo7QZ2j3KP
X-Proofpoint-ORIG-GUID: iJsaSAsEARu_fAMn8xBHjNyo7QZ2j3KP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102726_816298_BD8EE3A5 
X-CRM114-Status: GOOD (  14.24  )
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
index e642fba2843e..7d9975db5f47 100644
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
@@ -1730,7 +1729,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


