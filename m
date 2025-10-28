Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD494CCF9E0
	for <ath12k@archiver.kernel.org>; Tue, 28 Oct 2025 06:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YFQernyphzUokXIV/+I70uHICPm/RP+xKMym6taPSU8=; b=bwYIp6/4DXVjvhkC+cvN6eE9CY
	TQGfrwmC37IzOrSm57EzDuilpOIsNGbmnF5eUypDQHcf5YwWwbQuhQBnWZIhyz04ECiCm5O/+NXCs
	qUEIzsJ6NsPcXU+EzjBg5xJM2aN45/UrJxYzZD2PCpCYIvshJxG9s8EI7UY4+PVprpReFnY6IfwRI
	Ftkns9SPk/YdGe4ZiB9q9L7N3AnGAfevZrUOPzI7vyvr3aGTMNYvuUdXsGtVPZTD/m4RMYg2jU/xJ
	aNYr8NsAU/58HYHBx30ikjQXhqFsb2ZY/hXZddD2IS1WjtoFgOmtlQGW9gYa1W5xfBfjzCucDldTP
	FBJrp1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcsV-0000000FJPV-1FvK;
	Tue, 28 Oct 2025 06:08:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcsR-0000000FJOh-3iyc
	for ath12k@lists.infradead.org;
	Tue, 28 Oct 2025 06:08:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKa6SF2546712
	for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 06:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YFQernyphzUokXIV/+I70uHICPm/RP+xKMy
	m6taPSU8=; b=AHGNaB9pEUoM29BMQpWF6/trsZW1rS5KDocyjzV8W/vz2j4q31H
	ESPuVsfd68gX/V4mkTkOL9wgY4lCXzbJ0aV4Ub810hB/4P7nsPLk+KjdVdgQFkE8
	0KTFCwyUCwd6ZwLWs14EZTyorviFMDvmzOMFjz7lfpwqJ82AxbC54C9mW2wl9Zxp
	o99XC+/nZ1KwF6BKoFFEvRwx++MypnucKh/XX9q/eikQwcFuSQn0J93lkXsWD6zB
	S8lTfhGAGLW73wU91vZ94ai/Ol8RCs21NeMA4+umq7WTZLv60aALwT374kLQqAyj
	BcZNbgVasZGCp886nqiBa2Xtc//dyLT+Zyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2k002-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 06:08:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810289cd5eso12207521b3a.1
        for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 23:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761631693; x=1762236493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFQernyphzUokXIV/+I70uHICPm/RP+xKMym6taPSU8=;
        b=tWCksVkOf4RcC4XQqOBNRzrhYVB26CSHJJ9JVYsmTSx5ICe28F01Jalv+wreX3ELCj
         Wf5F6XBZL4skup/SFAAqGrxjzpxU22O60aukiXMJURaX/7QdTRwl6CQ4uHie8D2LkLxy
         eIqxZdQU7hJMPL7vXZqxV3lN+EG5uqRcMgiQmucAZJ8c96guBXRXhXlocamolPgaE8sf
         mSJBckGwfrCaD7Pjnw8t5XVwVlfrdhe0IX25RYSeU2k8EyAtwcSUL/5F4M5IQC7FxgdW
         6IF6mNhr21pUGSjUsgE6xMBOuk9/ZeQFdblj7JKI0des4GZz470pjx4RXlstiKkB+QLe
         cY7w==
X-Gm-Message-State: AOJu0Yzp+DWGz2U4VBa8RiqDhdM0dPelEirYCFD++jdENAteu5yydHFm
	IrvdSjxcowkWi0VC0vhAIPtbaYHIQ0EniNLXMpra4rolBrKN6hJ9SukTk/w+DeinLXVx7DKleTa
	tpR1f9iE1V1+QTWKbRRwmiKhMg2D3ejRbHCEP/81JLlC1wxsVGzrsZ5acMeoR7Suf
X-Gm-Gg: ASbGncs9FUS6s2hZha5pyCGmjHd8LhRS16PN7DbBn7bR2k5H1V3GnlzC3E5lSbSOcPW
	H7C0bf1DuHYbydsIQOJiWB9lu7QESFLgDrMtCgmEVZmsNnhpFziZdeaLXFwqPfcDLT6mAUeHez0
	gBAe4QdvKGJJlC7P5Z0IF3aiWliOkhpt7y1Z33cLXM6+89tSTj5loi4io4Z7fqQ6iUcuGzfJCTG
	onQ9+e9XY/2tXu0Ewk8WPrae+nJobDgRXAAz49iQ5wyC+OGairajVYMxP/S6MVmrO85ucEYiCwy
	4n5k6uSsYvtcwzlVBADIKuPNE2p0WTywe+VMTSfbjo+np41T88nt0JINqR4zyNZIiyQ2WIvUavY
	mJ9iMlOa03jKVTGqB09jz5dKj1P4hb1znQ4q762qbvETqA9JEAkmEDXBWAg==
X-Received: by 2002:a05:6a00:9281:b0:7a2:721b:adb6 with SMTP id d2e1a72fcca58-7a441c47627mr3120288b3a.28.1761631692849;
        Mon, 27 Oct 2025 23:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5IdZmG+yfCiDsulIMrTHpgRc/xNK0DVqnVio5NHUD8R1SXXmWIe+eXbbrig1qqDs8Z+/EJA==
X-Received: by 2002:a05:6a00:9281:b0:7a2:721b:adb6 with SMTP id d2e1a72fcca58-7a441c47627mr3120253b3a.28.1761631692335;
        Mon, 27 Oct 2025 23:08:12 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414011acdsm10204566b3a.13.2025.10.27.23.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:08:11 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Ross Brown <true.robot.ross@gmail.com>
Subject: [PATCH ath-current] Revert "wifi: ath12k: Fix missing station power save configuration"
Date: Tue, 28 Oct 2025 14:07:44 +0800
Message-Id: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2wUYENtfujrkhU7mzm02znR9wTVacIoi
X-Proofpoint-GUID: 2wUYENtfujrkhU7mzm02znR9wTVacIoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1MSBTYWx0ZWRfX0UvD0+4mEoSM
 oQFNgvJkYf5Sk51NjdBHsEApSa0UwcGtTEhIrChS+7Ww2RYHSLCoNC/S498Y2BTsiRyuH5eNaeU
 0yxWZAUevU5Y0cR/sxDWASemb5eg48vMe98FT0t9G+aqOGXEpX1VDZZNHKq/vPdhoGohUWytsos
 JeNdV6WAntgILyTvwElP0OMWCho5tkseQa1HIkg9xilp3i4k/PYm+mABTLJVB+uSZ9Z8wpaRvSO
 U335XPr0cmGMMY8OrbQBZ87SJvsFiEZctqlW/yfnEP+s3JuBW7iomjaQyBMMohGrLMbD0GzH3y3
 vKBrZAo+szAISMy9eYNnfVRt64HfSFq+sV9EsrvdM0OIkz9RdmsbbDvkRGCFkbyV4ft840aSGVg
 j4VgsMuuDCepzs81iwyjRc5AS4VuYw==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=69005dcd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=rFrEXt6fRIhDJ_V8PpwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_230816_051963_F7F65177 
X-CRM114-Status: GOOD (  16.32  )
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

This reverts commit 4b66d18918f8e4d85e51974a9e3ce9abad5c7c3d.

In [1], Ross Brown reports poor performance of WCN7850 after enabling
power save. Temporarily revert the fix; it will be re-enabled once
the issue is resolved.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 4b66d18918f8 ("wifi: ath12k: Fix missing station power save configuration")
Reported-by: Ross Brown <true.robot.ross@gmail.com>
Closes: https://lore.kernel.org/all/CAMn66qZENLhDOcVJuwUZ3ir89PVtVnQRq9DkV5xjJn1p6BKB9w@mail.gmail.com/ # [1]
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 122 ++++++++++++--------------
 1 file changed, 55 insertions(+), 67 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eacab798630a..db351c922018 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4064,68 +4064,12 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
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
-
-	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
-
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return;
-
-	enable_ps = arvif->ahvif->ps;
-	if (enable_ps) {
-		psmode = WMI_STA_PS_MODE_ENABLED;
-		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
-
-		timeout = conf->dynamic_ps_timeout;
-		if (timeout == 0) {
-			info = ath12k_mac_get_link_bss_conf(arvif);
-			if (!info) {
-				ath12k_warn(ar->ab, "unable to access bss link conf in setup ps for vif %pM link %u\n",
-					    vif->addr, arvif->link_id);
-				return;
-			}
-
-			/* firmware doesn't like 0 */
-			timeout = ieee80211_tu_to_usec(info->beacon_int) / 1000;
-		}
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
-	}
-
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
-		   arvif->vdev_id, psmode ? "enable" : "disable");
-
-	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
-	if (ret)
-		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
-			    psmode, arvif->vdev_id, ret);
-}
-
 static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
 					  struct ieee80211_vif *vif,
 					  u64 changed)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	unsigned long links = ahvif->links_map;
-	struct ieee80211_vif_cfg *vif_cfg;
 	struct ieee80211_bss_conf *info;
 	struct ath12k_link_vif *arvif;
 	struct ieee80211_sta *sta;
@@ -4189,24 +4133,61 @@ static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
 			}
 		}
 	}
+}
 
-	if (changed & BSS_CHANGED_PS) {
-		links = ahvif->links_map;
-		vif_cfg = &vif->cfg;
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
 
-		for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
-			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-			if (!arvif || !arvif->ar)
-				continue;
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-			ar = arvif->ar;
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return;
+
+	enable_ps = arvif->ahvif->ps;
+	if (enable_ps) {
+		psmode = WMI_STA_PS_MODE_ENABLED;
+		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
 
-			if (ar->ab->hw_params->supports_sta_ps) {
-				ahvif->ps = vif_cfg->ps;
-				ath12k_mac_vif_setup_ps(arvif);
+		timeout = conf->dynamic_ps_timeout;
+		if (timeout == 0) {
+			info = ath12k_mac_get_link_bss_conf(arvif);
+			if (!info) {
+				ath12k_warn(ar->ab, "unable to access bss link conf in setup ps for vif %pM link %u\n",
+					    vif->addr, arvif->link_id);
+				return;
 			}
+
+			/* firmware doesn't like 0 */
+			timeout = ieee80211_tu_to_usec(info->beacon_int) / 1000;
 		}
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
 	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
+		   arvif->vdev_id, psmode ? "enable" : "disable");
+
+	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
+	if (ret)
+		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
+			    psmode, arvif->vdev_id, ret);
 }
 
 static bool ath12k_mac_supports_tpc(struct ath12k *ar, struct ath12k_vif *ahvif,
@@ -4228,6 +4209,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
+	struct ieee80211_vif_cfg *vif_cfg = &vif->cfg;
 	struct cfg80211_chan_def def;
 	u32 param_id, param_value;
 	enum nl80211_band band;
@@ -4514,6 +4496,12 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 	}
 
 	ath12k_mac_fils_discovery(arvif, info);
+
+	if (changed & BSS_CHANGED_PS &&
+	    ar->ab->hw_params->supports_sta_ps) {
+		ahvif->ps = vif_cfg->ps;
+		ath12k_mac_vif_setup_ps(arvif);
+	}
 }
 
 static struct ath12k_vif_cache *ath12k_ahvif_get_link_cache(struct ath12k_vif *ahvif,

base-commit: 2469bb6a6af944755a7d7daf66be90f3b8decbf9
-- 
2.34.1


