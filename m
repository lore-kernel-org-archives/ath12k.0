Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4F0CA1017
	for <ath12k@archiver.kernel.org>; Mon,  8 Sep 2025 01:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuSiT6IHKC8eyHl1HYGERUP1bY+x7+xWSlh+LrRLgK4=; b=31Qp/BFFDvgRydmsc4jSkE4Y7C
	sh+hk3MaqR3QaKrNPJc1A8Ai953qF2Awk+3OGh9xcxEGle6jpnjIVSF3/RvRDf58XXpaIbMC1P4Vd
	uSz7uJHMZIjASnGWnEg0JWTjD8/YU0zhF4qn0CYSRgDy1n2jfgeN0mcd1SsKX7DIwXjV0GOEycfFe
	TAc6Kb4fkrEURFu3CUnnzczutWjzFzuuGEWoKAfZccsM1t/Y6pq3Wpue61gmkMPxwRSTlzoUtdO3V
	6mkLHlc0SCFw+hdCZWcfFjtQfeD2W8yiGoXlkHqqyq3rjE9f04xT+PpDOb23bTJAP9su2wdw+lWwk
	hovlb1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvR1v-0000000Ds1f-2bVg;
	Mon, 08 Sep 2025 01:50:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvR1t-0000000Ds0Z-0cto
	for ath12k@lists.infradead.org;
	Mon, 08 Sep 2025 01:50:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587L020S013523
	for <ath12k@lists.infradead.org>; Mon, 8 Sep 2025 01:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tuSiT6IHKC8eyHl1HYGERUP1bY+x7+xWSlh
	+LrRLgK4=; b=niZo6xw0r3VTz3xU4co+n4AKQ8v8ypE+hhtXlSbtess9LT0yvof
	tWubFj4w6dUZ7xXIYAQwyN28VTuYxsP4x1a5uvG6ADY0g2lH5BmUahYEsjp3CIQ/
	pN3I7VwmC/Q5o9SnioXYcZ9uBL9D0eU9u20BnSTjM31skMIwzre0PqUVP+cMsIeB
	pt/Ra6acb676xPc4wH3jnObwm2FXVTr5MurHJ9lgkbWItiH07gF3GQIYAp2HGKfq
	JueX1BmCEfZhum6D7z6sHx/rxs74NtF4g6KWD1JXV+X2ZPSpNgHyC46kFa53dhq2
	lKikHAuF5KGtJLq3FZz/S394K+sM+xQg0qg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqftu3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 01:50:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24456ebed7bso57689265ad.0
        for <ath12k@lists.infradead.org>; Sun, 07 Sep 2025 18:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296246; x=1757901046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuSiT6IHKC8eyHl1HYGERUP1bY+x7+xWSlh+LrRLgK4=;
        b=qWlWWVNiveiCIt21ESTZoBEkE0VtfIKxhoA3OmL9yCoM+PRa9vSfNjCa7WGAYDzJ9n
         O5pgugZaNg2/Ec+yWcRNKf0loPQM+gBNs3CzC14l7Mou3VFeuhz8w2CtqX9OXi53ddzf
         8hTCx5IlmGGykp8sa5+jycixgSeRfI5PshobMCsJCPp3kk4icBy3gg/OMfH57f0UP3rU
         cfOcTIDv+yVwhSrFlVWXmQyXd3Rm/IY1Sqb7qCW6894ShRgGSurMMIg6NUjs6aRHB4Kc
         0UM1HpzxAkYQyPWe8p/bPm0G2ePcAQ/d2zKu/O6wUVR3/E/vBdvXGKZLWDckRI462Pfe
         /Cvg==
X-Gm-Message-State: AOJu0YyojYzXSDgIBdJ26yCpVeQA34AoIPdcQh7jYktTXzu+3QP65Vtp
	lz6oFwIeTwY8N+MJy+rI0NyipHmLPd1CKMUTwu197o1qXKxUUohCbRiyVKxczOB9VNZEDRxsfWK
	PXgkyckEAJJ2Was3kPddeY2g2H6MZVh5iu8wqRI76PY52h9R5MpfVgDp8OTINhz4n7ZsxRaig
X-Gm-Gg: ASbGncuFi09nlaZ09ja7GaZ8GCVmT3S7UhRRiBMPX5JV9O0zp/hBnm6uyyKJprYjj/z
	4elqXbNqtamS0mYqRqedjeFyqUR7/sKklgeZC3bFwPGAQNsbLSMxOScAAJjRcrEczGjY16BFMS5
	yP2GotBhJ0SSLenrZMwaEAis6o5GAB3XKUPK6WixUR9TGXYcsxVnm1snmPqcypxj/ffv/0ht96v
	ErTsFqj0JGstSVeQM43TThNjue9OWWYpkgFQTNPqyfsfLUjLDViTDS98kCjIOi2mS2UrqeNzF7B
	filV6MNoDhdxfCWMswl3UyFRV79+pvKiMLLYpwComVi69Af2uCw3+a5J1rSH0Sxr+EDzfp9vWV2
	LgVl8V/9zlWz+t3RTi/BXlvY=
X-Received: by 2002:a17:902:d4ce:b0:246:571:4b51 with SMTP id d9443c01a7336-2517a7dc8d1mr88578915ad.29.1757296246222;
        Sun, 07 Sep 2025 18:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/66tg8rllQbakUBONUB+tBZD9yFBmoJbh2aMvQlKw0BACgvAH43//KwIRgdKS5/R/InyMbg==
X-Received: by 2002:a17:902:d4ce:b0:246:571:4b51 with SMTP id d9443c01a7336-2517a7dc8d1mr88578715ad.29.1757296245655;
        Sun, 07 Sep 2025 18:50:45 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2527e7a49a2sm41861815ad.14.2025.09.07.18.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 18:50:45 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: Fix missing station power save configuration
Date: Mon,  8 Sep 2025 09:50:25 +0800
Message-Id: <20250908015025.1301398-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: umcQQX0ii9x5ibstj1i8yNJh5NO1JtyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX5o4WYyzxqVsP
 gu0n3IfucjOxodYKN7K/X/7kmWLXNC7NeAhWMK/6e9BWvi29NYa44AlSdt2D36or2IqLjLlaPDC
 arLRXRnxsOxbediWmSfLfUK84Pep3TH+PKD7iqU+zToHYw0SJynGeakVWP8mKoIGuzcX0OJgNQG
 IQJJaWSY9o6r2DlPKJe9Scw7Zpw8I7/lCXhWB+0vbZZ9AFS9QNJYejb2TrKGGUBCgDVUTqPWcvg
 6cBMmWa7PD+i4adXjYsgZBmAsielkiouDbc/K4o0Z4g5bHDndUi+EpnVOaAmzVeJIt51Uy7xt76
 UI5p2ymsW2p6/C5BcvJEl3rwUYN59c6bVxxfXcP79SmQGyUxaF7MSqi1dGx5LugPUnEbwyUW4oY
 A8P7Oalg
X-Proofpoint-GUID: umcQQX0ii9x5ibstj1i8yNJh5NO1JtyJ
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68be3677 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=L_1LzjPufVM5mkcSVOQA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_185049_193624_239CA355 
X-CRM114-Status: GOOD (  17.29  )
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

Commit afbab6e4e88d ("wifi: ath12k: modify ath12k_mac_op_bss_info_changed()
for MLO") replaced the bss_info_changed() callback with vif_cfg_changed()
and link_info_changed() to support Multi-Link Operation (MLO). As a result,
the station power save configuration is no longer correctly applied in
ath12k_mac_bss_info_changed().

Move the handling of 'BSS_CHANGED_PS' into ath12k_mac_op_vif_cfg_changed()
to align with the updated callback structure introduced for MLO, ensuring
proper power-save behavior for station interfaces.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: afbab6e4e88d ("wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 122 ++++++++++++++------------
 1 file changed, 67 insertions(+), 55 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd1ec3b2c084..3a3965b79942 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4078,12 +4078,68 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
+static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
+{
+	struct ath12k *ar = arvif->ar;
+	struct ieee80211_vif *vif = arvif->ahvif->vif;
+	struct ieee80211_conf *conf = &ath12k_ar_to_hw(ar)->conf;
+	enum wmi_sta_powersave_param param;
+	struct ieee80211_bss_conf *info;
+	enum wmi_sta_ps_mode psmode;
+	int ret;
+	int timeout;
+	bool enable_ps;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return;
+
+	enable_ps = arvif->ahvif->ps;
+	if (enable_ps) {
+		psmode = WMI_STA_PS_MODE_ENABLED;
+		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
+
+		timeout = conf->dynamic_ps_timeout;
+		if (timeout == 0) {
+			info = ath12k_mac_get_link_bss_conf(arvif);
+			if (!info) {
+				ath12k_warn(ar->ab, "unable to access bss link conf in setup ps for vif %pM link %u\n",
+					    vif->addr, arvif->link_id);
+				return;
+			}
+
+			/* firmware doesn't like 0 */
+			timeout = ieee80211_tu_to_usec(info->beacon_int) / 1000;
+		}
+
+		ret = ath12k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
+						  timeout);
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
+				    arvif->vdev_id, ret);
+			return;
+		}
+	} else {
+		psmode = WMI_STA_PS_MODE_DISABLED;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
+		   arvif->vdev_id, psmode ? "enable" : "disable");
+
+	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
+	if (ret)
+		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
+			    psmode, arvif->vdev_id, ret);
+}
+
 static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
 					  struct ieee80211_vif *vif,
 					  u64 changed)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	unsigned long links = ahvif->links_map;
+	struct ieee80211_vif_cfg *vif_cfg;
 	struct ieee80211_bss_conf *info;
 	struct ath12k_link_vif *arvif;
 	struct ieee80211_sta *sta;
@@ -4147,61 +4203,24 @@ static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
 			}
 		}
 	}
-}
-
-static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
-{
-	struct ath12k *ar = arvif->ar;
-	struct ieee80211_vif *vif = arvif->ahvif->vif;
-	struct ieee80211_conf *conf = &ath12k_ar_to_hw(ar)->conf;
-	enum wmi_sta_powersave_param param;
-	struct ieee80211_bss_conf *info;
-	enum wmi_sta_ps_mode psmode;
-	int ret;
-	int timeout;
-	bool enable_ps;
 
-	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+	if (changed & BSS_CHANGED_PS) {
+		links = ahvif->links_map;
+		vif_cfg = &vif->cfg;
 
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return;
+		for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+			if (!arvif || !arvif->ar)
+				continue;
 
-	enable_ps = arvif->ahvif->ps;
-	if (enable_ps) {
-		psmode = WMI_STA_PS_MODE_ENABLED;
-		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
+			ar = arvif->ar;
 
-		timeout = conf->dynamic_ps_timeout;
-		if (timeout == 0) {
-			info = ath12k_mac_get_link_bss_conf(arvif);
-			if (!info) {
-				ath12k_warn(ar->ab, "unable to access bss link conf in setup ps for vif %pM link %u\n",
-					    vif->addr, arvif->link_id);
-				return;
+			if (ar->ab->hw_params->supports_sta_ps) {
+				ahvif->ps = vif_cfg->ps;
+				ath12k_mac_vif_setup_ps(arvif);
 			}
-
-			/* firmware doesn't like 0 */
-			timeout = ieee80211_tu_to_usec(info->beacon_int) / 1000;
 		}
-
-		ret = ath12k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
-						  timeout);
-		if (ret) {
-			ath12k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
-				    arvif->vdev_id, ret);
-			return;
-		}
-	} else {
-		psmode = WMI_STA_PS_MODE_DISABLED;
 	}
-
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
-		   arvif->vdev_id, psmode ? "enable" : "disable");
-
-	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
-	if (ret)
-		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
-			    psmode, arvif->vdev_id, ret);
 }
 
 static bool ath12k_mac_supports_tpc(struct ath12k *ar, struct ath12k_vif *ahvif,
@@ -4223,7 +4242,6 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
-	struct ieee80211_vif_cfg *vif_cfg = &vif->cfg;
 	struct cfg80211_chan_def def;
 	u32 param_id, param_value;
 	enum nl80211_band band;
@@ -4510,12 +4528,6 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 	}
 
 	ath12k_mac_fils_discovery(arvif, info);
-
-	if (changed & BSS_CHANGED_PS &&
-	    ar->ab->hw_params->supports_sta_ps) {
-		ahvif->ps = vif_cfg->ps;
-		ath12k_mac_vif_setup_ps(arvif);
-	}
 }
 
 static struct ath12k_vif_cache *ath12k_ahvif_get_link_cache(struct ath12k_vif *ahvif,

base-commit: 27893dd6341b929f87d45fc4d65c5778179319dd
-- 
2.34.1


