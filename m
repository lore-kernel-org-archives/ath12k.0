Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB688C02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OL/QcLRIJh0ky121SiQIUudqZdpTL1YzhtN9uKN3Eyw=; b=HQU2RSLqfAiBvSm9vS/GzaEoBd
	xuXVTsUykGkxhnrCJZxLACHrhXdObg8Qq/alJ9ZI0DOmZ9lHoG9KwzcU+CLnp1Dz4onZ23QlZ5wfx
	MRdVKNZ5VgwUiBxOWpNIKI96AqBXWKbdj9F/KYIwJmz010R8ClFN9KXLvxBceebX639SIr0uztvY3
	aNfCXUKjUKeZD9d2P0TeQZTPX/6xuz2hKkNLNbGTuIGgI/ToCiHxeUwdWCnjo5GYr4NZFOVBz8lzI
	DeoSV1F9TkK5UHhNDejkLS5093smnHKxb93nKoTb/CpGX8hpuHkmlgvEyrIcQJEt5ggxHcy/tcCOF
	QysA+zPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMi-000000012Je-1rxv
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMg-000000012He-0d2R
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148WPvu010098
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OL/QcLRIJh0ky121SiQIUudqZdpTL1YzhtN9uKN3Eyw=; b=QPuIK44YH2E+/SjH
	CNBlWWhcTrMxRA6kdQoh8urr66IGa9/MiJCxswKEaxk44ecejCbSARlTDmyXfre2
	hzwcoOQskv2P1+fmNzmsyPo9KB+t6v6G1Tjv4bfTSF+8n4XztTfzni8SVd5/hsH7
	4R1TKIdS2ZPXYCnRfvJbGDBsmtdCCs30ipUaWsL/276wpej5sDBu4ZOHgfYvU674
	bZ0rX4bFWcxotevmFmZaDqQcWfFM+756r/a7YFFckN0W0H1Up546TwI0+dVoEuDd
	YFEPKZShcnig2d3J+yoh1o4Adh4eLuCz1jNedyFDh2sbJFKLI0wk9I6EJwK3++iy
	yMGeRg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kffnh8kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f9c5b046d0so1720658a91.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688733; x=1739293533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL/QcLRIJh0ky121SiQIUudqZdpTL1YzhtN9uKN3Eyw=;
        b=ToD8gXJA9zEgBjQHZaDxukwx63CP9cE82ym4ejsTItLpC5CQx2zz+/gdhKEUlMDVCF
         IPauV3Iy5MY0dQmIQgHvVTaClPoeAJ4ovlapt1DPdjhCHaJsLQWEddwhIp+mQXG5RiAg
         1l3YoLHyZc5s6evEquWsF63d88emuZUfeEecl4p/GxLIOBvHk/L9+FgMzzCUTMwLeBhl
         F20GCu9KOIyuL1neObpKwtRFOrJrYZa2paguscvmqBdbCcySlDS1564L9iSTJnAOzOBx
         PHqiZQsF/oBLmwPnPpn0hZmtHvUlfNJioHurBKvUFMyc3/3H5KO415fhjGY5/CK9onhp
         vvUg==
X-Forwarded-Encrypted: i=1; AJvYcCVls6Wn0KMYRkrl3C/iwn6sVBY3fFmtD8NSvqFya0Qj3/dmjc/uZL3VVYIX19OfQV/2+dre7Eg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywire8zJaDta9xodqISKh7tcGY4AIC9FNav7yfAPXsppSygow0J
	LD3GRBJZUk5gg+wVz6YqE30tRzspN2qaokB35/xdElu92Xvgum1durFwuVpsjFB8H1WP8Q79gmX
	yfG7CCwk50+j2PARG+DJgZVTpJSj5o1RcEXui0oNvt/AvP+eXnB7vOYhtrFzOai5OY/Pl
X-Gm-Gg: ASbGnctPSznDHP8ecuLGfUglt/OWWdhztSX0TaVu9WXK5s5nD8YbETiZtPWPUar1vjx
	fXhmJfojdYuqaUBxM+S3LuB8b5IVjDXIdCT5kI8/OOCm1hmCt0HFF09XkYo29JdDnsx652BWnPX
	W/7WWUEdHvt1Wg12xsB5BUstNCOi1E8ArTe8V5hv05XFLhHiUyZqxGIGuJbkbfG7zZ6O5V5+u+c
	oWTHNRFzoMXIe+6FBEiRGK0JRZChD6U5uNnnFJ7hNGSpCykkxWUiB/IHgDt62jztiFUf6Anzz0L
	MgAMVj8bWNFdY5DCsbDpO0AocuWnSoiaGxzNpN+Ofbtb6bPCVMs9gygTZzSFMxGKj8m6k/20gUZ
	RmkxiYTwYiANHObdjTf9mpuLBBL9fog==
X-Received: by 2002:a05:6a00:18a5:b0:72a:bcc2:eefb with SMTP id d2e1a72fcca58-72fd0bcdb58mr38129923b3a.2.1738688730786;
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMARmptt0ygx1XHCqHB2J4I02VOK37cI/VtiWUK0SRjm18Qm7birg0sl11fNhJ9zPqFGNEgA==
X-Received: by 2002:a05:6a00:18a5:b0:72a:bcc2:eefb with SMTP id d2e1a72fcca58-72fd0bcdb58mr38129749b3a.2.1738688727960;
        Tue, 04 Feb 2025 09:05:27 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:27 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:10 +0530
Subject: [PATCH v2 4/8] wifi: ath12k: remove redundant logic for
 initializing arvif
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-4-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: iHv-JhTEW2wO80CbesXS-SlGsfHLvxkR
X-Proofpoint-ORIG-GUID: iHv-JhTEW2wO80CbesXS-SlGsfHLvxkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090534_197506_6D029A83 
X-CRM114-Status: GOOD (  18.73  )
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

The current logic for initializing arvif is present in both the add
interface operation callback and ath12k_mac_assign_link_vif(). The former
handles deflink initialization, while the latter is responsible for other
links. This redundancy could be avoided by using a common helper function.

Hence, add a new helper ath12k_mac_init_arvif() which initializes a
given arvif.

Since synchronizing rcu is not required after adding a rcu pointer, remove
that now.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 80 +++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7defc2b20fb61dcaec06d0e332c48a1b6cd2f5d6..5f0388002e16c38a834d6c7c6c020b7afa7044f0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3973,13 +3973,59 @@ static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
 }
 
+static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
+				  struct ath12k_link_vif *arvif, int link_id)
+{
+	struct ath12k_hw *ah = ahvif->ah;
+	u8 _link_id;
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	if (WARN_ON(!arvif))
+		return;
+
+	if (WARN_ON(link_id >= ATH12K_NUM_MAX_LINKS))
+		return;
+
+	if (link_id < 0)
+		_link_id = 0;
+	else
+		_link_id = link_id;
+
+	arvif->ahvif = ahvif;
+	arvif->link_id = _link_id;
+
+	INIT_LIST_HEAD(&arvif->list);
+	INIT_DELAYED_WORK(&arvif->connection_loss_work,
+			  ath12k_mac_vif_sta_connection_loss_work);
+
+	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
+		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
+		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
+		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
+	}
+
+	/* Handle MLO related assignments */
+	if (link_id >= 0) {
+		rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
+		ahvif->links_map |= BIT(_link_id);
+	}
+
+	ath12k_generic_dbg(ATH12K_DBG_MAC,
+			   "mac init link arvif (link_id %d%s) for vif %pM. links_map 0x%x",
+			   _link_id, (link_id < 0) ? " deflink" : "", ahvif->vif->addr,
+			   ahvif->links_map);
+}
+
 static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 							  struct ieee80211_vif *vif,
 							  u8 link_id)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif;
-	int i;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
@@ -4006,25 +4052,8 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 		}
 	}
 
-	arvif->ahvif = ahvif;
-	arvif->link_id = link_id;
-	ahvif->links_map |= BIT(link_id);
-
-	INIT_LIST_HEAD(&arvif->list);
-	INIT_DELAYED_WORK(&arvif->connection_loss_work,
-			  ath12k_mac_vif_sta_connection_loss_work);
-
-	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
-		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
-		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
-		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
-	}
+	ath12k_mac_init_arvif(ahvif, arvif, link_id);
 
-	rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
-	ahvif->links_map |= BIT(link_id);
-	synchronize_rcu();
 	return arvif;
 }
 
@@ -8312,19 +8341,8 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	ahvif->ah = ah;
 	ahvif->vif = vif;
 	arvif = &ahvif->deflink;
-	arvif->ahvif = ahvif;
-
-	INIT_LIST_HEAD(&arvif->list);
-	INIT_DELAYED_WORK(&arvif->connection_loss_work,
-			  ath12k_mac_vif_sta_connection_loss_work);
 
-	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
-		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
-		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
-		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
-	}
+	ath12k_mac_init_arvif(ahvif, arvif, -1);
 
 	/* Allocate Default Queue now and reassign during actual vdev create */
 	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;

-- 
2.34.1


