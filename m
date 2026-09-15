Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B7FC88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6Da9qaxcg=; b=KLDQ7jWIzgMcGDaLRQ+6Z//Y7V
	NQiKPuKmalEToNANKoaNcN10vfBq8Q3YEDq/DVXEHgqcZBElAZ/GFpQ+88A+ftR7gMrwsevqLuOqS
	4k5mi0aU2/XOd2hE1Iaee9vlcjjVMGr+XSdNSRUOalsUmQPBBHsD5yHhWmhuUCBkknhCpjcJN/PPa
	1/yV5QlyfR3zG3kaZ7CGi63kBZky1S3IRuzBbSdwguGwk6ff4Ufo8b/ir6t4cbNbhdpVxsY09mzue
	G0du4f9Zf1pyhMs4xLN0Hvc2cPvQxwp9mKzucIOPxjRsuM3+lX9+ReryZXROAYC4CkHBrlvupWIkl
	yZiXblwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M4l-00000005JPz-1j0D;
	Tue, 15 Sep 2026 05:51:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M4i-00000005JPH-2EP0
	for ath12k@lists.infradead.org;
	Tue, 15 Sep 2026 05:51:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4u7Up2032154
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 05:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6
	Da9qaxcg=; b=PKMOWUmpqa62H4ib+sh6DQDZCgbjaQBF+a0D9VZhyRKTKqh0r9I
	y7xpAJqoPlceH86r2701uHMvJ8aRAvMsVyel65EJvaNRih4Fn4VJUFE0KXkcyoSp
	N+EeCa2QmfegmO6WF2sHqsn1dGv1b1+/K47ikKAhd8aDbEvWqjkPuCYqAoM95p4f
	xIN1ymcbm2fFrCrl8kGe81r1a2EZmx5NblZRvkoZES89J6D9bQGZRJWHQBAuJcEk
	BOFd8zLCP5n6Meb2p+IcZa5E8YolmoZW3vmselQT+b5Z9+n0WuR35CAbGJmY1uk1
	sR6Lz3O2v0cyM3cPHj43eSG79OZV9qmXs6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye7064n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 05:51:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86261e66700so3613624b3a.3
        for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789451482; x=1790056282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6Da9qaxcg=;
        b=WFZTW7eqg232MAziWBBYPrebOuibm37l+VwforioIAhMLQeR/4f0MeK1YDFUJJxG9W
         u2Qocb0R1cd/qjxP4VE9pLNPwp6JqJ/jwG/R0aH8f6y7B6ZZwUhRpg0edCQN2RLxlB0+
         5MDdUboueTWQgLRKxrlCJ1znOKJU4WRKs4ikobC/euayHgvUC6XG5mITuPqIkWOuqt6K
         yKc8kSeEeYFkSuuLeVPXDDn3ycW6RO90utM7HNfbqO0fukFdELydZ16SIvkUsPcGNCNG
         boXc6Dw48WK81xblQWaZ55HH1mxVfMLbN1wy032Zy7WR5fuld64FPp7bpcaZGB/MICFD
         hJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451482; x=1790056282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6Da9qaxcg=;
        b=2vkvGZ/ZXCtlYrNo/TLhViQAd7AjuOFGcT12vzWb0Lgcu7Sy0oXX30Fwz5G2Fi3Cm0
         lOth7e3/4dT1BwOvAHj1Mqn88i1t5tZ/3lvHuEPytkXuuxfi80vbPc6xt2cIYUnxXr6I
         odMLhYfN8MeNqZmJXkdFS3F1OfI+/dtB8VSujwZ6Rs68iINdYc899irRjP167+LAB79R
         AkJrMAgwSwXl1Pz9p1qFfz6X7Fbq4SYLoco/V4zbEW7iYo1pa7O9uMh4XD6WkZhYj0EH
         ia1ol9GjjklcaZUhAuyvRc76iDlOeTj/YMN/sKlA+EbvH4PYf4M39PQrYhBgOXD5IlnX
         8rlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhynU8TaahFMI+L557LH4zI1iv9SIv5K83oDQXpxnq9KVQPGsTjSF8eNk3irbbPyAOYs8x8eA=@lists.infradead.org
X-Gm-Message-State: AFuF++ly7qQXeBVGtDzqIUE30ofFydaAqqK0odoRQh+pK8CQvSrdUlzd
	EyyweUDKz4e/PlKLUvakaU3eredRIJAqB4VccZ9kTHYisnSbg/pZdveRdYHy314/WPcvEZgONcD
	6moLpRu/v33gsQFli9hd7cEaHacQ/6F2pM7aoc3cCXZpnSfJysT1r+6maO1Oy4vcM
X-Gm-Gg: AYBFou0g3Pw7Tem2nAYFFz4Yo8K9ijkNOll0MvNUcxV6oBcDxsEPSYczixvS7zL9fRt
	t83mBW2rrWG+wYYqJ/dcCirfcFZ3UkPmabi2lO4cYCOkUEajn4dMSZscecQ6TUL/DsUXNrBru+f
	EymkRahpRMqVoBfAGBeIefDXB0Egd9SI7j6kxD223qzJ5zi80V2YS/FNxUqePR89BrBiEoeOwer
	RRLK2jhpvGVKlKqdb3D8cf1TKWbO1pnBT3QRAJAJLiUW/ScfEJ9sF8Cnj4629uo3+jcsv2E2MSv
	bAcT4my1LT7hXtfvZakxs6ctpUs4s9Qtp4/JxTli885RtN5FwUS6v5sHBFgBUMUBZmW4kGPhUdP
	fUH0i/75ldqGD3kr1suCKzHbDJMtLYy7Fg9PHWjaiDmYW5jhB
X-Received: by 2002:a05:6a00:1786:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-86f854fb572mr11572366b3a.21.1789451482138;
        Mon, 14 Sep 2026 22:51:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1786:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-86f854fb572mr11572329b3a.21.1789451481620;
        Mon, 14 Sep 2026 22:51:21 -0700 (PDT)
Received: from hangtian-z2-2004.lan (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb760sm5550274b3a.46.2026.09.14.22.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:51:21 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: set STA EHT MU mode before peer assoc
Date: Tue, 15 Sep 2026 13:51:17 +0800
Message-Id: <20260915055117.546723-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4MSBTYWx0ZWRfX3i6n3m/6DiId
 qFGdLWwxcYpt+bjYImcAuEseF88i/k41EFGfBK6mv/4Y+ERvExJ1Zc66y6cxs95i7diPvy+Q4EJ
 qb+/ctpZQN5KxtrjxTNXuEUlo1BpEUG5xOEhyj00MsSseNgcUBakA8NC+4M4BdWH1J2gQLqGVab
 O5e8t6ZUt1yg9u5Mq6vbrxLxhfdk6sxMWQvKOplYz+GXDAPsFmIjwqGyG6IIrfkZquKp5SLz0xg
 /FjuYjsyDJuq4wl1vk6mY2afPWbGS1FrGqHfNsdctFfQeXWOJDNyQF4QY4ih+oafKQA58DliQe7
 DzzH2mqcPGjTJ6HXSHsT5qLdnb0RNd/Omkqrl59OuHAJxtY3Z6067WKf+29RIjoMwFX+V0oH/sx
 BMUok9vBx3ZiWwd6Xie427vrAxnKW3bzgoiGlRK7w8cXGgj30+galeITixuShGFFIoVWGetK04t
 tXZ447pCp7wQwYfLyiw==
X-Proofpoint-GUID: 6Nla0tpjTAZiux5K8Y6dtCZXf3nUq92R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4MSBTYWx0ZWRfX2qbwQS9xBdfN
 yIw5xdFoYPLavn0LscJPTvHp0jExd3e5zts7Dk5kkXiubDNckhgc/PqTNLEpmifVyUFZSvQC8w7
 x2Rz4oYrEcQNXXXCy76Q5Nved6rcdek=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8dcdb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wW4-qZ-r-tBbmGnQcaQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6Nla0tpjTAZiux5K8Y6dtCZXf3nUq92R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_225124_691083_6B06D5D0 
X-CRM114-Status: GOOD (  15.49  )
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

Currently, ath12k_bss_assoc() sets HE MU mode with
WMI_VDEV_PARAM_SET_HEMU_MODE before ath12k_wmi_send_peer_assoc_cmd(),
but has no equivalent step for EHT.
This means firmware can process peer assoc without EHT
beamformee/OFDMA mode state matching the current peer and bandwidth,
which can leave incorrect beamforming/OFDMA state for 11be links.

Fix this by adding ath12k_mac_vif_recalc_sta_eht_txbf() to compute the
EHT MU mode bitmask from local and peer EHT capabilities and link
bandwidth, and sending WMI_VDEV_PARAM_SET_EHT_MU_MODE before peer assoc,
mirroring the existing HE flow.
Also send WMI_VDEV_PARAM_SET_EHT_MU_MODE with zero for non-EHT
associations to clear stale EHT mode left from a previous association
on the same vdev.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..bc463f759d6e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3780,6 +3780,79 @@ static int ath12k_mac_vif_recalc_sta_he_txbf(struct ath12k *ar,
 	return 0;
 }
 
+static int ath12k_mac_vif_recalc_sta_eht_txbf(struct ath12k *ar,
+					      struct ath12k_link_vif *arvif,
+					      struct ieee80211_link_sta *link_sta,
+					      u32 *ehtmode)
+{
+	const struct ieee80211_sta_eht_cap *peer_eht_cap;
+	const struct ieee80211_sta_eht_cap *own_eht_cap;
+	const struct ieee80211_sband_iftype_data *iftd;
+	struct ieee80211_vif *vif = arvif->ahvif->vif;
+	struct ieee80211_bss_conf *link_conf;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
+	u8 mu_bformer;
+
+	*ehtmode = 0;
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return -EINVAL;
+
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ar->ab, "unable to access bss link conf in recalc eht txbf conf\n");
+		return -EINVAL;
+	}
+
+	if (!link_conf->eht_support || !link_sta->eht_cap.has_eht)
+		return 0;
+
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
+		return -EINVAL;
+
+	band = def.chan->band;
+	iftd = ieee80211_get_sband_iftype_data(&ar->mac.sbands[band], vif->type);
+	if (!iftd) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+			   "unable to access iftype data in recalc eht txbf conf\n");
+		return 0;
+	}
+
+	own_eht_cap = &iftd->eht_cap;
+	peer_eht_cap = &link_sta->eht_cap;
+
+	if (!own_eht_cap->has_eht)
+		return 0;
+
+	*ehtmode |= u32_encode_bits(EHT_DL_MUOFDMA_ENABLE, EHT_MODE_DL_OFDMA) |
+		    u32_encode_bits(EHT_UL_MUOFDMA_ENABLE, EHT_MODE_UL_OFDMA);
+
+	if ((own_eht_cap->eht_cap_elem.phy_cap_info[0] &
+	     IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE) &&
+	    (peer_eht_cap->eht_cap_elem.phy_cap_info[0] &
+	     IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER))
+		*ehtmode |= u32_encode_bits(EHT_SU_BFEE_ENABLE, EHT_MODE_SU_TX_BFEE);
+
+	switch (link_sta->bandwidth) {
+	case IEEE80211_STA_RX_BW_320:
+		mu_bformer = IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
+		break;
+	case IEEE80211_STA_RX_BW_160:
+		mu_bformer = IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ;
+		break;
+	default:
+		mu_bformer = IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ;
+		break;
+	}
+
+	if (u32_get_bits(*ehtmode, EHT_MODE_SU_TX_BFEE) &&
+	    (peer_eht_cap->eht_cap_elem.phy_cap_info[7] & mu_bformer))
+		*ehtmode |= u32_encode_bits(EHT_MU_BFEE_ENABLE, EHT_MODE_MU_TX_BFEE);
+
+	return 0;
+}
+
 static int ath12k_mac_set_eht_txbf_conf(struct ath12k_link_vif *arvif)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
@@ -3923,6 +3996,7 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	struct ath12k_sta *ahsta;
 	struct ath12k_dp_link_peer *peer;
 	bool is_auth = false;
+	u32 ehtmode = 0;
 	u32 hemode = 0;
 	int ret;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
@@ -3977,6 +4051,14 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		return;
 	}
 
+	ret = ath12k_mac_vif_recalc_sta_eht_txbf(ar, arvif, link_sta, &ehtmode);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to recalc eht txbf for vdev %i on bss %pM: %d\n",
+			    arvif->vdev_id, bss_conf->bssid, ret);
+		rcu_read_unlock();
+		return;
+	}
+
 	rcu_read_unlock();
 
 	/* keep this before ath12k_wmi_send_peer_assoc_cmd() */
@@ -3988,6 +4070,15 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		return;
 	}
 
+	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    WMI_VDEV_PARAM_SET_EHT_MU_MODE,
+					    ehtmode);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit vdev param eht txbf 0x%x: %d\n",
+			    ehtmode, ret);
+		return;
+	}
+
 	peer_arg->is_assoc = true;
 
 	ret = ath12k_mac_peer_assoc(ar, peer_arg);

base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c
-- 
2.25.1


