Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C9C54F30
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2TvCpip0CrqCqITqzlimsG2guCnMFbygY5osCfo4tw=; b=Kafc9x9BY5gsPCezeIepQG204Q
	Xbb03kYS6GFinBcSOCj8hIiv1MY7ye79AINAZS2X/lz3mm37hTFXcCwkcJokd/F7YwgX1aiM6rGPR
	LJMB969+jj5DtSWwvB/IrUk6vXkobWtChQChtDHRHxqSvXYeMAUuVQ8O4yec/BWIuLSXirQEaUugX
	B8BlIJtHsCmxQ8V2yOSmI2SLG5DzmX1jqc2DjYtiEx64E+VtMhjuqOOkKZRb+fmdsJ5HR+IoungTe
	hRG6trQkvMdET5Jg9GyyPG3BwBumILbDLHg+U0chYSPJMnZX7jJU/h7RijB8f9oRZMRvJ840uX+22
	W0xUi6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqsu-0000000H8mC-0TQa;
	Fri, 30 May 2025 03:58:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqrh-0000000H8QI-05Jp
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 03:57:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1feIW024022
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 03:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O2TvCpip0Cr
	qCqITqzlimsG2guCnMFbygY5osCfo4tw=; b=Dx+E8FAmkWNAJcnz8s28H0spAKy
	Sh85BmRomhx2XUxufrCcHW1lAn58vyPFMKcT/3viiouc4C23pOCHW6E1ltEcIfYX
	An5Y3A9GeN0u+EXiZmu1tcZqRToEmUC4fAP/JymxiFJqgPUVx+hnoMPETBJn0s2X
	DCzR/yUGE5yPKzmUXd3cFypb2iIpIFQSXdv4zjge4U8BW9vPu+4/YDa6luze8b5z
	SFd1dtxEFoMQFna29bMfezto7VH1oRTscyyI1ajOPvT1643+TlPw1vP2CY9Mz2nt
	30E5dGIqoZmdL0cLy2uWxSA6Vp9iOWhKPOsaG+I0X+zsNTXIp6ubD025Wkg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7cd0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 03:57:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e0fee53eso1057451a12.1
        for <ath12k@lists.infradead.org>; Thu, 29 May 2025 20:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577423; x=1749182223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2TvCpip0CrqCqITqzlimsG2guCnMFbygY5osCfo4tw=;
        b=rRy2YHi/h3398/rzsT/1QTY+mR+7khWJ/Dm+SSC4qTMuCtpHdMwVGFrss5Tc4H8hft
         hxTrlt7WtVtL9nxoivEwgNUEUGCh7tOqI+7WAjIVxvTEXKJkN76LlxDHP2XgyESR1G3B
         /oPNGYo6XgOetCbAlmRzajXYnedZI/vOzFfwor5aHzpGpahQFfPCu5cJRv2P3IMJ/WQF
         +a5ibL9dH9hhfKdkyPX7rJh3T2inzCh+zJcdFH1sWrg6niBpaXWXj3GlVr3UgtTJg9JG
         vR1cDAU0W/+fZbS0WKIwY9HmoAEFum3pXRCscCfju9Ly5gO3GQznxiIqFMuLfTZIXhqJ
         Svpw==
X-Gm-Message-State: AOJu0YyKpQ6G5n7YQgWNtcQybmOQpVyZfhg/QCIAFXeJkOlVnAcEWSuc
	8tr6RQvzjcw6LAl5UxmzvRlAqO4gIlL8K2SHKkBtxWL23wZ266s7mPREhZ7f/mC23YsRljfzz1D
	6TUCbA5whPBPRNJswpeOpswaEYADc6Pn3DTplRFGqUn9JM5GRVbPcRhuLrqmT3kGJVFfCzpUl
X-Gm-Gg: ASbGncudjjGGrgPyqZL1WU0Qm2L4Ni2hMiHT2SmCzObWWGUfXtnwTnmwSkujrYNgO+B
	vwNTt5zc4AN+oluHx3+BkonAtVOxUAdsffgXEMOH3jWmaxqhrXcheTcJOjS6SQ4ZaIcVuq2U2zI
	THrWDnwqxiy15zA+IBy1/uX1cN3tVOEKHzBjGA7ljWuFhZ6RnetHNh0Ybmh9yxD2a7bn8WaJJP3
	2Dk3t0lQ6AbuyuRe083wog0qhoGQNA8uJr/3xT2pMiKmCIC1YjCnC/kwYPJinf3fGbgLOfJ+Oqz
	xaW40S6p4odDjtGPQgQQvd9t71PLmCdhdtjaCp60xxcpSJMfuWvaR1myshcWbBM00fHw743JErt
	4hfWKBz4imMVxkhUNsviOlziH2OsGcUpSkzjbIZDs
X-Received: by 2002:a05:6a21:164e:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-21ae00cb8f4mr1353550637.37.1748577422722;
        Thu, 29 May 2025 20:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Ys6z2ZaIbTrs7CD+VukkSzOR1QvFbAFkqlN0+Mh2P+eXY7rsEymMBjaAumbvVPHsjLFu1Q==
X-Received: by 2002:a05:6a21:164e:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-21ae00cb8f4mr1353516637.37.1748577422315;
        Thu, 29 May 2025 20:57:02 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb96fe8sm705274a12.59.2025.05.29.20.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:57:02 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Fix beacon reception for sta associated to Non-TX AP
Date: Fri, 30 May 2025 09:26:15 +0530
Message-Id: <20250530035615.3178480-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AAhZzIm_lBdWY-8tw1lGlK0jK-bg7z4B
X-Proofpoint-ORIG-GUID: AAhZzIm_lBdWY-8tw1lGlK0jK-bg7z4B
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=68392c90 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6IJaJU3SOiTWtuUPfpcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMCBTYWx0ZWRfX/yXmfCt5bIWI
 OzE+Fk+4yhdqRSRIWSd7fBJGGJEw9NV7Jhk52BsmWmBAd9q54m8dNmkwan+k6rBQ0G/jv2LBPkj
 mOa9C+wMVZTJHec2j/dbW7t1n9GP8gCCoxVQ2RVonea53feFvum9VTxhqDeQPk30XLExevIDgzi
 4inaDj8OOOVIvVf7F425BccQUvjioTvkWmvi/d/hRM/maKHpF/Yu7RNGXQjnd9iQM/+Wvc8hJnK
 YUAL7/9Pjmf9zCmk3QrEJczBv7OSqqR2/I3FJr9Ck8PIGmnhe4nE3ytwdzH0z428esYFE3cPNuT
 yI8HM4C6MUKrYev/gfFUPH+wsbjcWqBmQosDcy9IASyRs12mKF8clR70y6iaQ7s94hQVh30Yes1
 mhHmW7qu+a80oGFNiH/2Lbw16aR/R4x2EOVPa62BRGgcrIL8zMaXqopLlu9m3BYAeJwEpcUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_205705_183777_1A7D317D 
X-CRM114-Status: GOOD (  17.00  )
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

Currently, when a station is associated with a Non-Transmitting BSS of an
MBSSID set, beacons are not frequently received from the firmware. This
results in missing events via beacons, such as channel switches, leading
to the station not switching to new channel as the AP does, eventually
causing a kick out event from the firmware. This issue arises due to
missing configuration of Non-Transmitting BSS information in station's
vdev up command.

Fix this by filling information such as the Transmitting BSSID, profile index
and profile count in vdev up command of station.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 56 ++++++++++++++++++---------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5183a7e43e51..320ff76f33f7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -602,6 +602,33 @@ ath12k_mac_get_tx_arvif(struct ath12k_link_vif *arvif,
 	return NULL;
 }
 
+static const u8 *ath12k_mac_get_tx_bssid(struct ath12k_link_vif *arvif)
+{
+	struct ieee80211_bss_conf *link_conf;
+	struct ath12k_link_vif *tx_arvif;
+	struct ath12k *ar = arvif->ar;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ar->ab,
+			    "unable to access bss link conf for link %u required to retrieve transmitting link conf\n",
+			    arvif->link_id);
+		return NULL;
+	}
+	if (link_conf->vif->type == NL80211_IFTYPE_STATION) {
+		if (link_conf->nontransmitted)
+			return link_conf->transmitter_bssid;
+	} else {
+		tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
+		if (tx_arvif)
+			return tx_arvif->bssid;
+	}
+
+	return NULL;
+}
+
 struct ieee80211_bss_conf *
 ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif)
 {
@@ -1688,8 +1715,6 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_bss_conf *link_conf;
-	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	int ret;
 
@@ -1720,18 +1745,8 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 	params.vdev_id = arvif->vdev_id;
 	params.aid = ahvif->aid;
 	params.bssid = arvif->bssid;
-
-	link_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!link_conf) {
-		ath12k_warn(ar->ab,
-			    "unable to access bss link conf for link %u required to retrieve transmitting link conf\n",
-			    arvif->link_id);
-		return;
-	}
-
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
-	if (tx_arvif) {
-		params.tx_bssid = tx_arvif->bssid;
+	params.tx_bssid = ath12k_mac_get_tx_bssid(arvif);
+	if (params.tx_bssid) {
 		params.nontx_profile_idx = info->bssid_index;
 		params.nontx_profile_cnt = 1 << info->bssid_indicator;
 	}
@@ -3261,6 +3276,11 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	params.vdev_id = arvif->vdev_id;
 	params.aid = ahvif->aid;
 	params.bssid = arvif->bssid;
+	params.tx_bssid = ath12k_mac_get_tx_bssid(arvif);
+	if (params.tx_bssid) {
+		params.nontx_profile_idx = bss_conf->bssid_index;
+		params.nontx_profile_cnt = 1 << bss_conf->bssid_indicator;
+	}
 	ret = ath12k_wmi_vdev_up(ar, &params);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to set vdev %d up: %d\n",
@@ -9585,7 +9605,7 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   int n_vifs)
 {
 	struct ath12k_wmi_vdev_up_params params = {};
-	struct ath12k_link_vif *arvif, *tx_arvif;
+	struct ath12k_link_vif *arvif;
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_vif *vif;
@@ -9657,10 +9677,8 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		params.vdev_id = arvif->vdev_id;
 		params.aid = ahvif->aid;
 		params.bssid = arvif->bssid;
-
-		tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
-		if (tx_arvif) {
-			params.tx_bssid = tx_arvif->bssid;
+		params.tx_bssid = ath12k_mac_get_tx_bssid(arvif);
+		if (params.tx_bssid) {
 			params.nontx_profile_idx = link_conf->bssid_index;
 			params.nontx_profile_cnt = 1 << link_conf->bssid_indicator;
 		}
-- 
2.34.1


