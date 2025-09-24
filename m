Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A5CAC5A5
	for <ath12k@archiver.kernel.org>; Wed, 24 Sep 2025 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZ9wQGPf+KSohIWXGXa6QigUi1qxy4uiKfvXrU6/Dgw=; b=24Tu+ey3VcwQJH4V2tpBssYffs
	PN1jQl5/OrXLRMBSbspEejuYlW8HgsgVMi+fFwMrYsvhN9q6LJ1GA1skXgiF2abWgu1twgJUCUKZJ
	rifpyQ35mLSJi1dzi/mmPaEA+eRuhQRCMk0SnNKjiorAo3K8jxWpQxXG9ipmw0AOblxQY4bJOlNfa
	Wd1JZkjRdrv7Vjh/aXNFpDLpWSlOWOhegx8WOubGTWNcizyhtyb1NSb6pvzXvUtODDrue8DFYXgUH
	OGshqQW8J2GzzkhSSMSDrTvJpSEFtleJKceQzEPkcSGxRMOJuLpsSrAiKa6bLA4gQjaRiHhs71zh/
	/EIbYB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pmi-00000000KIc-1w9E;
	Wed, 24 Sep 2025 13:43:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pmf-00000000KFw-3LFo
	for ath12k@lists.infradead.org;
	Wed, 24 Sep 2025 13:43:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODGTeO018069
	for <ath12k@lists.infradead.org>; Wed, 24 Sep 2025 13:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=dZ9wQGPf+KSo
	hIWXGXa6QigUi1qxy4uiKfvXrU6/Dgw=; b=kIKx5L/lcWUrALkGObLJ/WzZ2Kk0
	Zxi+07p3Z4ZThVZeX4yUGNtq1zbHsj8NQLEHMLb5OOtvmvvXrYPn42xV8/mCDyHa
	j4ivSwZJ4Cmzo/PuRWFbjPdMvJKuuEu68Gdti6mSjvMT91wdvj6dpWVaw1Clok3H
	cxeuqtm7Tgcb4FPLM+rUSJBCa1Agx9WKcSRuqYhLWIYvwsVL9uAJFn37nAQmcvt8
	Pp8R5LyxT45TB1g5KrKOuIprtTh6KceSyomLn37kQIfIGbx+QWgSFAgKfxn2gjBB
	Kb5KudxVJt9FFfc28r68TE+0Npd2drqe8wgMd8vpelWCu4TIwVk0aPkhOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk8efp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Sep 2025 13:43:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso46939465ad.0
        for <ath12k@lists.infradead.org>; Wed, 24 Sep 2025 06:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721426; x=1759326226;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZ9wQGPf+KSohIWXGXa6QigUi1qxy4uiKfvXrU6/Dgw=;
        b=FkNM2ZB2K6Ti9quFi1AeADVf1+92Ru1Yt+1pwAx1CRwBlWr1g7fp99yB4efPjQAbeT
         uZ0gSzADB1RMVNR/uQo0/QVtwG4qRHnnuqsFjFd0m0b8SkUdLRH2w4vWG31ci8SMPevP
         0S6lPf66ah0HOB5Ce9rYcfsgJkFxFFCJpBb3y7PHIs8feABYjVdtygL8i1+zNDHejF6D
         BqatE5zP/3UHY5Ywy2vUIa4ng8fkWeutq/0LqoW1ClwiSS6oeyRXtR7pV3amALdNJC4P
         ULpLXCwI9mMX0BGJfD2/hiDmiBXUXiSTdC7+5eOSUErjaWXqC2ZwtzTYMm68J6JWSF9U
         E1Kw==
X-Gm-Message-State: AOJu0YxpzpmGL7AEgWczwQVga6o1CSl7A0d0qTqkdBZNATrZ5bB/b7nK
	iiKTf3QOm0tPVqEHFSAhRCr+Dm12JYYgh4FnM6b8L6jte0+XuPOb1n0rk2dboOfwlqiGQMWGxsS
	SwdR5lTiGftPGe2vTccJ5rfFd3Qy5llIRv5vXEkPTspEiIuCHUlvNMB1qec1f0fw6HZOjJAzr
X-Gm-Gg: ASbGncsfnDXKiIUEmb/eEiclBNXXF13lP7MaFhc0xB+A9oqdZJp53e2dhQux1SQMQay
	VYib/Te0MHFyshTAJZHmhXFu7SM1y4pxrioQ4pte2x+D856aUdfCxy/wQJdNI9gMakDi2XMlRGk
	KDrkMmhLsmXteZxi+QU+kxVJt3GPWpB3ILckKZPzSesJt8SeHlXxpXTA6v2ch7oeDBGnudIWvYs
	2XTX/TfWSprAoatNTOcPaUkHrifSF8cyQ4UB+yDjVROX20G+DreKf8SSTYkwzPyIE8/62lWCF0N
	Tcbbit+VaNUg2528hn2JQoQY/WGSEKSTuucaR3RrR5T44Wi2qOldY3oS26tGpq29qkj3oUM9y5L
	LMyD4Xl4=
X-Received: by 2002:a05:6a21:32a0:b0:2e5:655c:7f86 with SMTP id adf61e73a8af0-2e5655c80a3mr861151637.39.1758721425517;
        Wed, 24 Sep 2025 06:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEomo9mq4FaL/FwAxsbFJPIsuMpf16D3GpuEBhT12E/HRSTGA3k0wgUzpYoDkNFNWIKDVSpEg==
X-Received: by 2002:a05:6a21:32a0:b0:2e5:655c:7f86 with SMTP id adf61e73a8af0-2e5655c80a3mr861110637.39.1758721424956;
        Wed, 24 Sep 2025 06:43:44 -0700 (PDT)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff413ba1sm17448360a12.39.2025.09.24.06.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:43:44 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon
Date: Wed, 24 Sep 2025 19:13:36 +0530
Message-Id: <20250924134336.888-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: XKbPRDWDK_loJXqwsxBGAF0ZE6IQKULN
X-Proofpoint-ORIG-GUID: XKbPRDWDK_loJXqwsxBGAF0ZE6IQKULN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX/iQ6s4su/tVB
 6Fp2NFfUZ+fkuKbJzajeeKrT8Eataim/KDJg6n3E0UJIB720btnTcarDAqiHSzozrUFtCdil1FL
 /9/ZFY45bWpyoui7gz0VnxQaUH9IFWcyRDh9nptiLqwizY3iMi/Z3Uwp4nTMTktG6sx4rMI8UkF
 5ueT6MWc8OToOSWO8OVoCUpjs9i1n+RFB9qJQ4FrPnAp5WS9WUL0HsKCAtzPVZlOVA1gTbv9sv3
 NCOZDr13D1bj0NxowZajujztWrF4S7La/SwUo+9y6s/8KzaiTj2C4udaONXrR4+C1mdH4SHKD87
 UOLUKbSFmh5tutqu3MWmp6WctacTAWiWlYq0Lf224J9FPWOhtKspu5bQ0ri4Fw7wuOuYZKvhJkh
 Cfu6B4yD
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d3f593 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ne_Weq33sHSohhLfQcAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_064349_954761_1CAB84EE 
X-CRM114-Status: GOOD (  23.48  )
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

Mac80211 schedules CSA finalize work twice during a channel switch: first
during the reserved switch phase and again during the finalize phase.
The beacon content is updated only during the second schedule, which occurs
after the reserved switch completes. However, the ath12k driver attempts to
bring up the VDEV during the channel switch callback
(ath12k_mac_update_vif_chan()), which leads to premature installation of
stale beacon templates before the updated content is available.

This premature VDEV bring-up causes outdated beacon information to be
broadcast, which can result in updated channel parameters during the
transition. In MBSSID scenarios, this behavior is particularly problematic
because the transmitting interface's beacon must be updated before
non-transmitting interfaces are brought up. Failing to do so can lead to
beacon mismatches across interfaces.

Introduce a is_csa_in_progress flag to defer VDEV_UP until CSA finalize is
complete. Set this flag during the channel switch callback when CSA is
active. In bss_info_changed(), check this flag and issue VDEV_UP only
after the beacon template has been updated.

Ensure that in MBSSID cases, the transmitting interface is brought up
first, followed by all non-transmitting interfaces. This ordering makes
sure correct beacon propagation and avoids stale beacon installation
during CSA transitions.

Additionally, move the call to ath12k_mac_update_peer_puncturing_width()
before VDEV bring-up during CSA handling. This ensures that the puncturing
bitmap and bandwidth settings are applied before the VDEV is brought up.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Fixes: 8c6faa56bfb2 ("wifi: ath12k: add MBSSID beacon support")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 90 ++++++++++++++++++++++----
 2 files changed, 79 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3d1956966a48..630f5dd56eb0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -355,6 +355,7 @@ struct ath12k_link_vif {
 	struct wmi_vdev_install_key_arg group_key;
 	bool pairwise_key_done;
 	u16 num_stations;
+	bool is_csa_in_progress;
 };
 
 struct ath12k_vif {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1d7b60aa5cb0..84473dbf22e1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4221,6 +4221,30 @@ static bool ath12k_mac_supports_tpc(struct ath12k *ar, struct ath12k_vif *ahvif,
 		chandef->chan->band == NL80211_BAND_6GHZ;
 }
 
+static void ath12k_wmi_vdev_params_up(struct ath12k *ar,
+				      struct ath12k_link_vif *arvif,
+				      struct ath12k_link_vif *tx_arvif,
+				      struct ieee80211_bss_conf *info, u16 aid)
+{
+	struct ath12k_wmi_vdev_up_params params = {
+		.vdev_id = arvif->vdev_id,
+		.aid = aid,
+		.bssid = arvif->bssid
+	};
+	int ret;
+
+	if (tx_arvif) {
+		params.tx_bssid = tx_arvif->bssid;
+		params.nontx_profile_idx = info->bssid_index;
+		params.nontx_profile_cnt = 1 << info->bssid_indicator;
+	}
+
+	ret = ath12k_wmi_vdev_up(arvif->ar, &params);
+	if (ret)
+		ath12k_warn(ar->ab, "failed to bring vdev up %d: %d\n",
+			    arvif->vdev_id, ret);
+}
+
 static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 					struct ath12k_link_vif *arvif,
 					struct ieee80211_bss_conf *info,
@@ -4228,6 +4252,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
+	struct ath12k_link_vif *tx_arvif;
 	struct cfg80211_chan_def def;
 	u32 param_id, param_value;
 	enum nl80211_band band;
@@ -4236,9 +4261,9 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 	u32 preamble;
 	u16 hw_value;
 	u16 bitrate;
-	int ret;
 	u8 rateidx;
 	u32 rate;
+	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -4271,12 +4296,41 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 				   "Set burst beacon mode for VDEV: %d\n",
 				   arvif->vdev_id);
 
+		/* In MBSSID case, need to install transmitting VIF's template first */
+
 		ret = ath12k_mac_setup_bcn_tmpl(arvif);
 		if (ret)
 			ath12k_warn(ar->ab, "failed to update bcn template: %d\n",
 				    ret);
+
+		if (!arvif->is_csa_in_progress)
+			goto skip_vdev_up;
+
+		tx_arvif = ath12k_mac_get_tx_arvif(arvif, info);
+		if (tx_arvif && arvif != tx_arvif && tx_arvif->is_csa_in_progress)
+			/* skip non tx vif's */
+			goto skip_vdev_up;
+
+		ath12k_wmi_vdev_params_up(ar, arvif, tx_arvif, info, ahvif->aid);
+
+		arvif->is_csa_in_progress = false;
+
+		if (tx_arvif && arvif == tx_arvif) {
+			struct ath12k_link_vif *arvif_itr;
+
+			list_for_each_entry(arvif_itr, &ar->arvifs, list) {
+				if (!arvif_itr->is_csa_in_progress)
+					continue;
+
+				ath12k_wmi_vdev_params_up(ar, arvif, tx_arvif,
+							  info, ahvif->aid);
+				arvif_itr->is_csa_in_progress = false;
+			}
+		}
 	}
 
+skip_vdev_up:
+
 	if (changed & (BSS_CHANGED_BEACON_INFO | BSS_CHANGED_BEACON)) {
 		arvif->dtim_period = info->dtim_period;
 
@@ -10862,9 +10916,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   int n_vifs)
 {
 	struct ath12k_wmi_vdev_up_params params = {};
-	struct ath12k_link_vif *arvif;
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_base *ab = ar->ab;
+	struct ath12k_link_vif *arvif;
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	u8 link_id;
@@ -10925,6 +10979,28 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			continue;
 		}
 
+		ret = ath12k_mac_update_peer_puncturing_width(arvif->ar, arvif,
+							      vifs[i].new_ctx->def);
+		if (ret) {
+			ath12k_warn(ar->ab,
+				    "failed to update puncturing bitmap %02x and width %d: %d\n",
+				    vifs[i].new_ctx->def.punctured,
+				    vifs[i].new_ctx->def.width, ret);
+			continue;
+		}
+
+		/* Defer VDEV bring-up during CSA to avoid installing stale
+		 * beacon templates. The beacon content is updated only
+		 * after CSA finalize, so we mark CSA in progress and skip
+		 * VDEV_UP for now. It will be handled later in
+		 * bss_info_changed().
+		 */
+		if (link_conf->csa_active &&
+		    arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
+			arvif->is_csa_in_progress = true;
+			continue;
+		}
+
 		ret = ath12k_mac_setup_bcn_tmpl(arvif);
 		if (ret)
 			ath12k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
@@ -10945,16 +11021,6 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 				    arvif->vdev_id, ret);
 			continue;
 		}
-
-		ret = ath12k_mac_update_peer_puncturing_width(arvif->ar, arvif,
-							      vifs[i].new_ctx->def);
-		if (ret) {
-			ath12k_warn(ar->ab,
-				    "failed to update puncturing bitmap %02x and width %d: %d\n",
-				    vifs[i].new_ctx->def.punctured,
-				    vifs[i].new_ctx->def.width, ret);
-			continue;
-		}
 	}
 
 	/* Restart the internal monitor vdev on new channel */

base-commit: 32be3ca4cf78b309dfe7ba52fe2d7cc3c23c5634
-- 
2.17.1


