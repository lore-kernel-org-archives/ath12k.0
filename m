Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01122C02188
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7GyAD+vCSGm60Mo83UiwkZrzF+LzppL5JloceOQESw=; b=nVl0OgBKX0WlWlEOrEGOSDe4XV
	N92jcHU+seu+qwDYOkvftBQbqu4h5JSJAIgHQlhquJnaukfwOfFcAlrdPt9cP2XJEKtXIU71k9Oqh
	/+3IvGkeLlaGSCfgBMqumzx06t6UYAqvCuWk38sPVufW8Op8eayiG7HIraBoy3ouXHPhzRaUknO61
	PxWOgdYp8Mq3XZRyvEwNYTmcIYJCRsAm36gNpKDdirvO9IdBd1rTle4jhA+ZmCqthdleEspI0rj4k
	s13vvsq421O4ePFXCJXZ+R1SqFvWeJ33DdvSzR9uInxAHBubPkGMHNpj1rzcEf5rYstEYFczlH/yb
	1XOwqTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNmd-00000003QR9-2tjC
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 05:23:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNm0-00000003QK0-0NT3
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J5Fre6024698
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N7GyAD+vCSG
	m60Mo83UiwkZrzF+LzppL5JloceOQESw=; b=QdfXgp97iUcJ6+1jU6mjC4QXlne
	qsFPjvsjcXppP9hbdaPcQR9h0hSfoCszDU8MVdIP3FrVCClyZYZhMlDIQ2tDR/xU
	yRDAj2cwHcZQioIfJTc2iBC25WAO2YVxjpx8eemjk0OavLqu19QZdHR/QL65dMJo
	OJ4I36R4OPsFZ3pUo8CCI3R32iK/mfrsVjCckkYG3x5aGGzv31wih3EChJVV3g4h
	1wW+9fBtzcEULDNk7WOnI3fJjK5Nzf7k9XFdn3Sr4SUnu2+gXXrvS4IuZrkLfnxh
	n1W0kXOSOZE898L6z/1BGXE4ua7sIxblZZ512Nmv5Jjs4eozhfCl3zVMPQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44838qsnvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so9795523a91.3
        for <ath12k@lists.infradead.org>; Sat, 18 Jan 2025 21:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264178; x=1737868978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7GyAD+vCSGm60Mo83UiwkZrzF+LzppL5JloceOQESw=;
        b=dsOgEytXqwJrufapn5S8PpUiVNbeve/0evWac4JgAiq7IHUqc2AWeMijySXZ+k/b/k
         9hO7RR+6zNwyVP7xOG3soBGck+Fy6wviRjlV+LQ3FZCPBCr9yC9my10gvtifOONCE6PR
         IMtS6OSG5bt282fq6kOj/PKls9ZdKEfQB6cAMH8Tv6MpQ6iU5dHCj6xAuyRdUUtHGcJI
         v8hafoW0HGhSPZbpH6p30k55LC3Qe9QXHRjwuwyL/cJYb8el2wkbMSpizpovjJ0rIo1C
         GEW+I2QIrc+sR8CBGJnHAXmU+CXLIR9WxUVVeoZ8wE1CZm8X60MJ5dt/BQaI5fUZQbrR
         gKXw==
X-Forwarded-Encrypted: i=1; AJvYcCUMRtZfVv+nJxnxCxpEl263BypBfJJ1ESYACu3e1hVNQ0cIt8i0cK3ImI9alD0JLEgmFtGelIo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyKc8wfKEVQ2bOOg5siBSjdtZxMv36qUQ2pOlDGEwTz8bLfyZs
	vUcuf7+UFlZSoOrSy22Fu6Nr7YpvStbbhR8lcx0OGDoeK/QcIaLSydgF/xaWxhWhGCNyUqeqNd+
	7+lTcf0eYU00hu4icbygpqiiPCzzZZF0BMUxATe0AfjeU0uJzyyihujJWDuc4IDhWH3bk
X-Gm-Gg: ASbGncsl4NdkqRLG2qsmREPJ11+fay1lJg7Si7RDLOxJjoRIXVVVyri+6uzV2gTpDBV
	CoIGBSojjuQUrd1bKDjKJ2cqmEfpgjQypzsiep4IgBQtup8lLyZeU7MpIaAMUHTKtQ4wNfkcofJ
	c0zAtUfY6IOC9i6SCm8RATlwuP36nT/V7EOuq/riesn/gflvfKyiP/EQvG7NkiwAtXOiU7GGgOT
	hA4pVXm50ka4ZPX4Uza9TZ1F6Bc7ZXooQEv4bQU1LyDcJDCPRtZLD7tlLdBdJt0cOqhci/JUGx7
	8IYnD2MX6b41gvHTR4zm6FXhtgEt+ZV2026GOLIZSDBWOdTcZg==
X-Received: by 2002:a17:90b:2d88:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2f782c628bbmr13479375a91.2.1737264178315;
        Sat, 18 Jan 2025 21:22:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExsbmTylEtID6b8ELRkciz1dg3uqWpIv6JoKs+D7h0yiRGLjbKP8ugf7sOsWSJ36M7pOe9yw==
X-Received: by 2002:a17:90b:2d88:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2f782c628bbmr13479359a91.2.1737264177978;
        Sat, 18 Jan 2025 21:22:57 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:57 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 3/5] wifi: ath12k: refactor transmitted arvif retrieval
Date: Sat, 18 Jan 2025 21:22:48 -0800
Message-Id: <20250119052250.3488343-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l6W_m-NieAVKnsyJvuAfdua2fc-p2Vj8
X-Proofpoint-GUID: l6W_m-NieAVKnsyJvuAfdua2fc-p2Vj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212301_019014_11633ED6 
X-CRM114-Status: GOOD (  18.77  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Create a new function ath12k_mac_get_tx_arvif() to retrieve 'arvif'
for the transmitted interface of the MBSSID set. This clean up will
help modifying the same code path for MLO changes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 60 +++++++++++++++------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2d062b5904a8..f189ee008226 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -502,6 +502,19 @@ static int ath12k_mac_vif_link_chan(struct ieee80211_vif *vif, u8 link_id,
 	return 0;
 }
 
+static struct ath12k_link_vif *ath12k_mac_get_tx_arvif(struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *tx_ahvif;
+
+	if (arvif->ahvif->vif->mbssid_tx_vif) {
+		tx_ahvif = ath12k_vif_to_ahvif(arvif->ahvif->vif->mbssid_tx_vif);
+		if (tx_ahvif)
+			return &tx_ahvif->deflink;
+	}
+
+	return NULL;
+}
+
 static struct ieee80211_bss_conf *
 ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif)
 {
@@ -1557,7 +1570,6 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 	struct ieee80211_ema_beacons *beacons;
 	struct ath12k_link_vif *tx_arvif;
 	bool nontx_profile_found = false;
-	struct ath12k_vif *tx_ahvif;
 	int ret = 0;
 	u8 i;
 
@@ -1569,10 +1581,9 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_ahvif = ath12k_vif_to_ahvif(ahvif->vif->mbssid_tx_vif);
-	tx_arvif = &tx_ahvif->deflink;
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
-							 tx_ahvif->vif,
+							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
 	if (!beacons || !beacons->cnt) {
 		ath12k_warn(arvif->ar->ab,
@@ -1616,11 +1627,10 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ieee80211_bss_conf *link_conf;
-	struct ath12k_link_vif *tx_arvif = arvif;
+	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_mutable_offsets offs = {};
-	struct ath12k_vif *tx_ahvif = ahvif;
 	bool nontx_profile_found = false;
 	struct sk_buff *bcn;
 	int ret;
@@ -1635,17 +1645,19 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	if (vif->mbssid_tx_vif) {
-		tx_ahvif = ath12k_vif_to_ahvif(vif->mbssid_tx_vif);
-		tx_arvif = &tx_ahvif->deflink;
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	if (tx_arvif) {
 		if (tx_arvif != arvif && arvif->is_up)
 			return 0;
 
 		if (link_conf->ema_ap)
 			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+	} else {
+		tx_arvif = arvif;
 	}
 
-	bcn = ieee80211_beacon_get_template(ath12k_ar_to_hw(tx_arvif->ar), tx_ahvif->vif,
+	bcn = ieee80211_beacon_get_template(ath12k_ar_to_hw(tx_arvif->ar),
+					    tx_arvif->ahvif->vif,
 					    &offs, tx_arvif->link_id);
 	if (!bcn) {
 		ath12k_warn(ab, "failed to get beacon template from mac80211\n");
@@ -1702,6 +1714,7 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	int ret;
 
@@ -1732,11 +1745,9 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 	params.vdev_id = arvif->vdev_id;
 	params.aid = ahvif->aid;
 	params.bssid = arvif->bssid;
-	if (ahvif->vif->mbssid_tx_vif) {
-		struct ath12k_vif *tx_ahvif =
-			ath12k_vif_to_ahvif(ahvif->vif->mbssid_tx_vif);
-		struct ath12k_link_vif *tx_arvif = &tx_ahvif->deflink;
 
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	if (tx_arvif) {
 		params.tx_bssid = tx_arvif->bssid;
 		params.nontx_profile_idx = info->bssid_index;
 		params.nontx_profile_cnt = 1 << info->bssid_indicator;
@@ -7561,14 +7572,9 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
 					       u32 *flags, u32 *tx_vdev_id)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_vif *tx_vif = ahvif->vif->mbssid_tx_vif;
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_link_vif *tx_arvif;
-	struct ath12k_vif *tx_ahvif;
-
-	if (!tx_vif)
-		return 0;
 
 	link_conf = ath12k_mac_get_link_bss_conf(arvif);
 	if (!link_conf) {
@@ -7577,11 +7583,13 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
 		return -ENOLINK;
 	}
 
-	tx_ahvif = ath12k_vif_to_ahvif(tx_vif);
-	tx_arvif = &tx_ahvif->deflink;
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	if (!tx_arvif)
+		return 0;
 
 	if (link_conf->nontransmitted) {
-		if (ar->ah->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+		if (ath12k_ar_to_hw(ar)->wiphy !=
+		    ath12k_ar_to_hw(tx_arvif->ar)->wiphy)
 			return -EINVAL;
 
 		*flags = WMI_VDEV_MBSSID_FLAGS_NON_TRANSMIT_AP;
@@ -8982,9 +8990,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   int n_vifs)
 {
 	struct ath12k_wmi_vdev_up_params params = {};
+	struct ath12k_link_vif *arvif, *tx_arvif;
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_link_vif *arvif;
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	u8 link_id;
@@ -9052,11 +9060,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		params.vdev_id = arvif->vdev_id;
 		params.aid = ahvif->aid;
 		params.bssid = arvif->bssid;
-		if (vif->mbssid_tx_vif) {
-			struct ath12k_vif *tx_ahvif =
-				ath12k_vif_to_ahvif(vif->mbssid_tx_vif);
-			struct ath12k_link_vif *tx_arvif = &tx_ahvif->deflink;
 
+		tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+		if (tx_arvif) {
 			params.tx_bssid = tx_arvif->bssid;
 			params.nontx_profile_idx = link_conf->bssid_index;
 			params.nontx_profile_cnt = 1 << link_conf->bssid_indicator;
-- 
2.34.1


