Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C86E9A05E
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=; b=iuSkpLyhDTwqtiJhPbLteMWKMR
	6eLLzlAE7h8RjmDf2GdI+k8wZGdAkMNbMQfJVnX7BCuIoN440yZbm70shs2B8U8sE3pyL9lv/5hFN
	LN58swaOyMH4iMU0ORcFkFGOOpDIZcuG1iX7g3Zi2A68U5N1oRWlBM0Ig0R4UHt17tky4WFncqXdd
	+9GItvbxetzBAqqcrRqvpisZrGnZqjgaOxIO1ScZVo5BdBOmxxKGEUsfuxgWSzSNcb3KfsLNdTQOI
	ZNKmem5qne1DX1ccqsaGI20Uco1xr4YquZInwQIeoV8ytmqvKctqSO/bxS1SRSzXWYzC39xx3EyA2
	SBo6G6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vW-0000000BriV-2AsQ;
	Thu, 19 Feb 2026 19:43:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vT-0000000Brds-0wxK
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 19:43:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JEX9Kp3319511
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 19:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=; b=P49TaiinQnf3Zapr
	kl0aQrMx7MQCzXDWhzNBGjFa4GzzO/I4lQvuwv3gn7t/7dpgnEnkeel3bzzDzUg4
	pLJSxmJrd4JCG/HxHovQxHBl3sphHqMcvXyngw+pFxISyHvk5VEqmmRJewTGRgHc
	VLqDrcUcqo68tT0NYr26VQc1dR/U0X0HKfIbTO6hXpj/Ikr/Os1OuMpojd8N6Yr9
	0AkfS0F3ztsEz43MAlkJ0hwqQXloESXfWNiiOe8YFnGejoSCV4D+6I0b+oNlTebv
	igMzu5rkmODUW1b+cOLY66Yw7bCZje5NqJfSsxF+iS0O0fvo8v68jFu4m/ADArv1
	Qnn0tw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv38agwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 19:43:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec176so13412745ad.2
        for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 11:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530182; x=1772134982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=;
        b=a7AQtAknyzkzENFn/A81UdjTP6y3BaMlJePmve1HlGO7u9BJk5iS0+l2IztbhYyVHw
         MO0ACMHlJoYIbJWgeZIdwrjGb3gsNh/2yGCDmC++t5U5bpQj6zh4mtOe9DSPfn3KtjqP
         fQ+eRBLzdfTKQ9CA4qPX56H4rvE3f5dI2CH1F5KL+7SlK0X4684ubBEuw/S8cBJqykbL
         x82soj7WGv4SeA7l4ZPJ/Js4rthBPG5DlzUen6fwXJNeYDZRFVSr/41qNBxj7fkq3pv4
         9dWhSp/37S9hM5eQHQMeyCQVCNKQKqFkrc1Tm3l/v7y/gvICbfplUhWaq8qeHvPiiZyT
         GhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530182; x=1772134982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=;
        b=uutlD36+OD/uH/2tvczAPYtWjhZqOT2x1euMf7KrGuQwOH6UwnH1S9D7i9JTHmhKpA
         Wlo7DREVe/9mfFvMH93Qwv4K19iktUhYD5PBjuxXhWQp661cHqwt9UG4uqoRrRzwjnnL
         6kWsfVedvA+DdKRNaTz7tacw5GW7nI7g/2hO+ehHEm2t6gYSi5vEPvFMDYGTqrBQg6iz
         A8Dn9q4CaESjG/zoQgeK3vjiXxB8M/WqPccjh3avhktjeNJGlik2ySx/aRsIK/Y7rJmB
         xTIn3uET6D3c0t2CsEOHBvakbJhueAleORnWVeXiJ0AVpwRaRkOVVDQSZcyt2jBD6rjI
         N96w==
X-Forwarded-Encrypted: i=1; AJvYcCXUxjKW7KFBYmSyLIb6qisvltGIcO/Q0Dg7RivQ/MGhgZsvulPyfhSSUQrCDCfdIVunegwSq7U=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqbyYUObIp9Nnj4GBL+Bh5OrjGC4C7gx+tXpcjAcfzAHPQf92A
	AqVTHxx6kJQRh0apn9NdUdJkNHU3M3vZTg2HAoaLDSx6QAbHkN5mgtdrRCURlG8b/+L8yG1qc0+
	9whfB2pKaIyuNLL+V1ggeEskDRNn2pfFnoabGL/3PGIKk8hPmNGgm/MdibBStxECd
X-Gm-Gg: AZuq6aKhHNn9GfUmA11zU9KOeM0bnleFVbaA7GMzmEIaHsRfi3hyjAHsR7dFizG9+ir
	JttfpmXH7o7Y9nQTu9W8vE+Cbxoa1kvvWMpCy73xzOZ/nUc+JC9kcvQ69g5mf9EMcSk3RHn0vzO
	I3q/FpWpWvyAOQpF0Ya/q/Xo2M0PJijgE0xIWzY88XFyPm+j/SXMSCkwdgSIEDna4s/ltRmPHR8
	5zcTrXXS5ID7kcm2pZ2E9vGsgQM/C1i0Fi7A4ppU3gY7+DfSGfZVTV+4bt5QxOIrTHkedwUjpXA
	xNPL6+Hiv14evRE+Ex/f+fOHpdrod5Es0Ckg7f2RLNyJVcP2JJTpitl+1deY1FwwZXRw5vM0WM6
	yreLkfvyD1tNlMuefSy65FIPsDBSKF9/DoAAbkrySWC1KGgvtbb0FgYCFr+28WTSzO6lDmTsbPT
	id90hTW7UB/mIoS9nzTgx+SZaFwxO3zir7Qi2u9uQ=
X-Received: by 2002:a17:903:2ec3:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad5b144c92mr33071715ad.44.1771530182054;
        Thu, 19 Feb 2026 11:43:02 -0800 (PST)
X-Received: by 2002:a17:903:2ec3:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad5b144c92mr33071375ad.44.1771530181608;
        Thu, 19 Feb 2026 11:43:01 -0800 (PST)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a712ed9sm264404225ad.20.2026.02.19.11.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:43:01 -0800 (PST)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 01:12:42 +0530
Subject: [PATCH wireless-next 2/2] wifi: mac80211: fetch unsolicited probe
 response template by link ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-fils-prob-by-link-v1-2-a2746a853f75@oss.qualcomm.com>
References: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
In-Reply-To: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=699767c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVayKBx9Dmlhv4CN5F0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BHe1rs5SS0CD_CyAUvjl3IRDPmOQ4sEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX5ihigik+2J1J
 bCExIZyGJ+Ag0Fsk8CWDerkNvlvB6FH1VdeS+8XS97a/llQWnz3QRRkdggMfaeCc7ebbCmOoTFZ
 TDlf4o9RGB1fcqFAs4YJ9RmGTq4Toh5zeqUdOm0PRPWCGiPlDp/ECASpVuviqSBi2CHlIqnctkN
 Cc+CS8qzEPsm9MG3Hi5yg3OgF2Gi6jrfQmLl7gnsJiOWIQTdffGKvvh5Wnl4oQSzLPdrrxYsTSn
 MSmoiC6ogTk8rYCvkIYn+53Vyye4ica2SkyvH4IeT3ZnLgq5NjCM38IuB/jk0aqSHH3IlZUjYyj
 TmJtq7EHbDlTOzzUsrriDs6slRbuK7pEBSd6H7N1UI12rqx+J2XYUqjnsYNAN9Hn+jWfSY9BXoX
 EAIrCT/7POIfZiKhwf1FfLNF040hb7FLB3ASnCoDQfpxQUlEzu3IYa5Ifga+2tfAv7JEAV63S5R
 fjoXuLmBL7ryXx1e5gg==
X-Proofpoint-ORIG-GUID: BHe1rs5SS0CD_CyAUvjl3IRDPmOQ4sEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114303_332657_DD5CDEFA 
X-CRM114-Status: GOOD (  19.84  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Currently, the unsolicited probe response template is always fetched from
the default link of a virtual interface in both Multi-Link Operation (MLO)
and non-MLO cases. However, in the MLO case there is a need to fetch the
unsolicited probe response template from a specific link instead of the
default link.

Hence, add support for fetching the unsolicited probe response template
based on the link ID from the corresponding link data.

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c           |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c           |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  3 ++-
 include/net/mac80211.h                          |  4 +++-
 net/mac80211/tx.c                               | 20 +++++++++++++-------
 6 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4776bb6fc889..d9b5eac6c7bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3314,7 +3314,7 @@ static int ath11k_mac_fils_discovery(struct ath11k_vif *arvif,
 		interval = info->unsol_bcast_probe_resp_interval;
 
 		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(ar->hw,
-								 arvif->vif);
+								 arvif->vif, 0);
 		if (tmpl)
 			ret = ath11k_wmi_probe_resp_tmpl(ar, arvif->vdev_id,
 							 tmpl);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 34f82cda4197..b281f81039fb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4320,7 +4320,8 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
 		unsol_bcast_probe_resp_enabled = 1;
 		interval = info->unsol_bcast_probe_resp_interval;
 
-		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif,
+								 info->link_id);
 		if (tmpl)
 			ret = ath12k_wmi_probe_resp_tmpl(ar, arvif->vdev_id,
 							 tmpl);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 83ce06857a1e..2d2f34aa465d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1981,7 +1981,7 @@ mt7915_mcu_add_inband_discov(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
 		   vif->bss_conf.unsol_bcast_probe_resp_interval) {
 		interval = vif->bss_conf.unsol_bcast_probe_resp_interval;
-		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif, 0);
 	}
 
 	if (!skb) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 795a294fa904..c3cb4a33cb3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2868,7 +2868,8 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
 		   link_conf->unsol_bcast_probe_resp_interval) {
 		interval = link_conf->unsol_bcast_probe_resp_interval;
-		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif,
+								link_conf->link_id);
 	}
 
 	if (!skb) {
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d36c14a86c8a..89027e94ba5c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -7781,6 +7781,7 @@ struct sk_buff *ieee80211_get_fils_discovery_tmpl(struct ieee80211_hw *hw,
  *	probe response template.
  * @hw: pointer obtained from ieee80211_alloc_hw().
  * @vif: &struct ieee80211_vif pointer from the add_interface callback.
+ * @link_id: valid link_id during MLO or 0 for non-MLO.
  *
  * The driver is responsible for freeing the returned skb.
  *
@@ -7788,7 +7789,8 @@ struct sk_buff *ieee80211_get_fils_discovery_tmpl(struct ieee80211_hw *hw,
  */
 struct sk_buff *
 ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
-					  struct ieee80211_vif *vif);
+					  struct ieee80211_vif *vif,
+					  unsigned int link_id);
 
 /**
  * ieee80211_obss_color_collision_notify - notify userland about a BSS color
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index f547cfb27666..9f2363a34511 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -5874,21 +5874,28 @@ EXPORT_SYMBOL(ieee80211_get_fils_discovery_tmpl);
 
 struct sk_buff *
 ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
-					  struct ieee80211_vif *vif)
+					  struct ieee80211_vif *vif,
+					  unsigned int link_id)
 {
 	struct sk_buff *skb = NULL;
 	struct unsol_bcast_probe_resp_data *tmpl = NULL;
 	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
+	struct ieee80211_link_data *link;
 
 	if (sdata->vif.type != NL80211_IFTYPE_AP)
 		return NULL;
 
-	rcu_read_lock();
-	tmpl = rcu_dereference(sdata->deflink.u.ap.unsol_bcast_probe_resp);
-	if (!tmpl) {
-		rcu_read_unlock();
+	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
+		return NULL;
+
+	guard(rcu)();
+	link = rcu_dereference(sdata->link[link_id]);
+	if (!link)
+		return NULL;
+
+	tmpl = rcu_dereference(link->u.ap.unsol_bcast_probe_resp);
+	if (!tmpl)
 		return NULL;
-	}
 
 	skb = dev_alloc_skb(sdata->local->hw.extra_tx_headroom + tmpl->len);
 	if (skb) {
@@ -5896,7 +5903,6 @@ ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
 		skb_put_data(skb, tmpl->data, tmpl->len);
 	}
 
-	rcu_read_unlock();
 	return skb;
 }
 EXPORT_SYMBOL(ieee80211_get_unsol_bcast_probe_resp_tmpl);

-- 
2.34.1


