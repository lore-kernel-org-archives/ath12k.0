Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F6C02183
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq02/ijFMWZugmb5HSORKGMnBvWo5mBSnxxuMX0U0Pk=; b=Y1cRwqodm4TLlg1eaavPVKwc+N
	Rh24ApeCVwR8vNrDc2tw2Z8q6Jc75IGxhwXztemn5WrG0SK750Mmln4PxSqVLKUP9QdhbmPAys70I
	6qREx/xk0pas8a34zmrXr0gMA0G7oIo0A2T96/6Guly4RblA1jd9ReIqsOkicO2Hshh+EBPnyrTO5
	CsLTE7CHmv+IHafmmY/cg+KqaFx8Hnpv/2EhG6LO7bPF1P0tSew+kZF+o54IFpBr3ZdioqVUQM1zg
	Mmknk8YxJ3z6A8glZNSxZXfOBnzBRbfoVMB9QHFDyESa+SwiIVpXoSFGM67k/FeIcXfW34Hkajjy0
	ZAcfSiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNmb-00000003QPn-2myC
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 05:23:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNlx-00000003QJ1-1NWp
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J0poVl024774
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eq02/ijFMWZ
	ugmb5HSORKGMnBvWo5mBSnxxuMX0U0Pk=; b=JB0WqZvrBZTyOqjR6GwMRSTRIcJ
	39QDbyplr7swQf5INcaVs4bRFwJEp72SvUBYkXTlkpF5Ps9Jx8yaT4BO/vt9Wka9
	8lNED0IIfirdFUL2TxLQck+iTkw+YYYEzNE+tE4f1B4EA9hFApcn+CnU9lvh5i5/
	7/yHJY1wNN+cNRi//EBBsHZVw+uK5naB13VC8rl7IQHKBEESe1PcfHq2kuXOxNym
	Pr1++Fm92A7CaziAuqpYBJcx2LKPGxZn5a2HyGdJq2eNmX/BdsTf3MaVNggW3DPP
	iuIPHb5HRFJfDLrF6F2sz841/4yZ9+6f0bnytuuzfOiQDMCpLvaBlw14fGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d1guy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:22:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef79403c5eso9570924a91.0
        for <ath12k@lists.infradead.org>; Sat, 18 Jan 2025 21:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264176; x=1737868976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq02/ijFMWZugmb5HSORKGMnBvWo5mBSnxxuMX0U0Pk=;
        b=lUZa5Knp4JX3DU81yoj1ncjjR+e9fYzdQvTK6G2o8jiLamAjD1IAN8O/YvibuUlNKa
         1lKgSAfC1i/eOO2BsVj0IlHDNEtzFoAeiVIvw1OzTM/imhu42ZEY454o4dfvv21G677j
         8oM7HMbm1nS5N5xRRYXTftfVX3Zs5F9ZvfokfVbE2i7wLybCNPkbnhuAoq9a+xxG/8G7
         osuDJl6fSU5lUUnuFrl/hvSYG2BH4w7w9Aw5eCPJNRwx8ZQpDy2izJH819RDrZiGf1eZ
         Zn+HVDGFjQQcObyM+LDkdWQErRL4Cn9hDI73NOLu4wXB6OV6gJojgsekxL9K4IBbMRuS
         HqNA==
X-Forwarded-Encrypted: i=1; AJvYcCXlB7BU0rLk4FtqzT9kHR7GqiFf98VGWGYXKoubX8UCa/zbMOnbHxPvthnd9io/RoBmGY0oNT4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxMGFml0BTmAbV6S2bNaXUVkjRbmdO2LPkO8340dtyJo/fMKfy
	ejZ+b4f2lg5uh+1MJNM/5qFl3x6tTw6iVE6l/qGoFxudr+1cZWnpXflAPgjs+Ov1qX5xEdoC1+P
	JE3dlfqzYg+VCxiERUjsiGfdIfmoQV2g+mDs9x/Cw+7fP8RMrNO18cs8e9Q4XfMFZB5LU
X-Gm-Gg: ASbGncso2Ipq05z0Eg7l5e5Ve12mD+Sl15QXnhIylbbhOJhRdHz9VG/12T4fSY0jnuR
	bmOzuk+kZbtdrjFkTpk62FGHs+xsdyCuyRXCKlOsy1hakAh4v3REBAQbu4UY4Brjl25NtXdL5Wx
	0YOJLvlSxuD5ZrRKT+t0YEiXNGQy3IOnF3QwDPqNjdm9V8G4FIFbBlos5WJ1UE/fkI9La4OmiRt
	UGCbgsHMLLjYyFBSDBGPgP1mgmLHuHT7fzO4GGNflvpIFpYHVCTwnRp9h6KCx+zLRUjLi865tLa
	AMTMkdbID6TlTM7KFblvdesb11r1aYl4XbC7iKjM6hMeW3+/3g==
X-Received: by 2002:a17:90b:4d05:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-2f782c70176mr12864089a91.9.1737264175681;
        Sat, 18 Jan 2025 21:22:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqaegLKQh6AuDwvNiGMCJoINOQ4iJBDckVegsrHB2UM7kNeaA7ZnWUzO4ERyNj64vvODTPwA==
X-Received: by 2002:a17:90b:4d05:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-2f782c70176mr12864063a91.9.1737264175242;
        Sat, 18 Jan 2025 21:22:55 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:54 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 1/5] wifi: ath11k: refactor transmitted arvif retrieval
Date: Sat, 18 Jan 2025 21:22:46 -0800
Message-Id: <20250119052250.3488343-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w0mxy1IPNlC6pm8vGiP2FUsnvUxe6PrQ
X-Proofpoint-GUID: w0mxy1IPNlC6pm8vGiP2FUsnvUxe6PrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=899
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212257_827056_BA680CD8 
X-CRM114-Status: GOOD (  20.66  )
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

Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
for the transmitted interface of the MBSSID set. This will help
modifying the same code path to reflect mac80211 data structure
changes to support MLO. This also fixes an issue in
ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
inside for loop during each iteration.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 39 +++++++++++++--------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1556392f7ad4..b1a79d8f980e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -1529,6 +1529,14 @@ static int ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
 	return ret;
 }
 
+static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
+{
+	if (arvif->vif->mbssid_tx_vif)
+		return ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+
+	return NULL;
+}
+
 static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 {
 	struct ath11k_vif *tx_arvif;
@@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	u32 params = 0;
 	u8 i = 0;
 
-	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 
 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
@@ -1597,7 +1605,7 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 	int ret;
 
 	if (vif->mbssid_tx_vif) {
-		tx_arvif = ath11k_vif_to_arvif(vif->mbssid_tx_vif);
+		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 		if (tx_arvif != arvif) {
 			ar = tx_arvif->ar;
 			ab = ar->ab;
@@ -1674,7 +1682,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				     struct ieee80211_bss_conf *info)
 {
 	struct ath11k *ar = arvif->ar;
-	struct ath11k_vif *tx_arvif = NULL;
+	struct ath11k_vif *tx_arvif;
 	int ret = 0;
 
 	lockdep_assert_held(&arvif->ar->conf_mutex);
@@ -1701,9 +1709,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 
 	ether_addr_copy(arvif->bssid, info->bssid);
 
-	if (arvif->vif->mbssid_tx_vif)
-		tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
-
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 	ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 				 arvif->bssid,
 				 tx_arvif ? tx_arvif->bssid : NULL,
@@ -6330,23 +6336,20 @@ static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_vif *tx_arvif;
-	struct ieee80211_vif *tx_vif;
 
 	*tx_vdev_id = 0;
-	tx_vif = arvif->vif->mbssid_tx_vif;
-	if (!tx_vif) {
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (!tx_arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
 		return 0;
 	}
 
-	tx_arvif = ath11k_vif_to_arvif(tx_vif);
-
 	if (arvif->vif->bss_conf.nontransmitted) {
-		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+		if (ar->hw->wiphy != tx_arvif->ar->hw->wiphy)
 			return -EINVAL;
 
 		*flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
-		*tx_vdev_id = ath11k_vif_to_arvif(tx_vif)->vdev_id;
+		*tx_vdev_id = tx_arvif->vdev_id;
 	} else if (tx_arvif == arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
 	} else {
@@ -7306,8 +7309,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			   int n_vifs)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif, *tx_arvif = NULL;
-	struct ieee80211_vif *mbssid_tx_vif;
+	struct ath11k_vif *arvif, *tx_arvif;
 	int ret;
 	int i;
 	bool monitor_vif = false;
@@ -7361,10 +7363,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
 				    ret);
 
-		mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
-		if (mbssid_tx_vif)
-			tx_arvif = ath11k_vif_to_arvif(mbssid_tx_vif);
-
+		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 		ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 					 arvif->bssid,
 					 tx_arvif ? tx_arvif->bssid : NULL,
-- 
2.34.1


