Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2BAC369A7
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0zGC39nAfRUYoPg3aOmlDwHuUcoNloqjSgKMRMWL4s=; b=k2NJjC/IGJK2FP4y9R2/cB2Mjj
	GbE9yCLrdQ5HF/o+tnAnptlX8pA2NJDGka3Xdar5g6m/aIVRqrPCer35uoDrb9IYaChJXaDJpKvpD
	SJR1R1JfskapLdBtgy4ySdh6jJtJES68amWCUyMcoeYM8F5JAhuzyusLYqc/fK2qQ1kxHPhWnEY4c
	voArGanqQEFc9nVS2fSEAwwlYY2krXbcNhg+oU7naGRV73aHsRyeW9QBzt4E56Uhm2g26MQQegpXX
	jV0QoMl8KO5tP6ltne190CmwAKeBbi/7++ZEE0V8Bb5JVKifG8AB7bHdoUEeBHGtym6TXN0QDH4cp
	Bk3KDMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F4y-00000005Hcq-1zeM
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 19:57:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dwa-000000059De-2Rio
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 18:45:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BgbDc032633
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 18:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V0zGC39nAfR
	UYoPg3aOmlDwHuUcoNloqjSgKMRMWL4s=; b=GRIKm0U6JijuRPBUjhnrfOzQ0VK
	aYSAHJOesdFcAP3DukJWAx3d4OLhliyckt9HxBLq6U9XOimNSekUWE8euon0BUZX
	iBCQGygWQM2YSnbOipbM7ArrMX++aRB3jZOCRsYoZt97XXAciRivuKvJsH/H3YxB
	JIS+nmT+tzITavQWA76Auwl2iTxSYaed+koqu2sZcfpA+ExFzEfUMqc/Hy/AOfz9
	3F51zwFcRVUjqVqbKwIawBoTA+KSWUpopTW5Vzqnq8aKa8TM6woboQw7EcqAMR6W
	7FqT2Vj77vImqphb+fRo2Co9AfYtrKQzG3gQNfNPOEKx1L212fdPq1sQW/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkgrrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 18:45:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241ae15dcbso69004895ad.0
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 11:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137906; x=1744742706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0zGC39nAfRUYoPg3aOmlDwHuUcoNloqjSgKMRMWL4s=;
        b=ShASLjtGEmZksl+8MBZJH1ZMvv597TecbdPz9nPKWYYw/LGesC6tczZp15KExcyT9M
         kYYOeNpgNYc7wYxat+/5RPFa5fFCZ/OoK3UUd93VvEK3/SFVNyeIoOTWcsL772mMkhRj
         9VWb16e7baTaHUAk3R9+nuOU3DsAVoxjdr92E7BD6tEnlqE9C7tduS4RNyLqLrtyfOPI
         oELXgHYp7ItGtOfC2PH3CBQaSYq77mzS+c0irQLk4y/0+QFvyqktmIAbuS0/Vz5TVddm
         u/LYc9SLtGVDXPM8pqEV4h91vth+iWmtfmBmln24wF+yxlzxz2NQIrC2iuwu0LM895Bs
         tzbg==
X-Forwarded-Encrypted: i=1; AJvYcCXf7Ki7n7C+8gg0L9VU/hG9XsVEJhY+c1RTB6hpCAyw8xQXu+AktOpEMwr/pP4AK9mFoyj/OX8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK9dmYwF/XyfiDrZVrA7o0jcILnMJ5WVfNuTRO5dFO49AQAE0n
	UrUYhWZeK+ruklpwldSMZXx4hr+5gczVRLXgJl7qu+eaWSWxFEmSfsJ+qp4mZL/ffIMio14KGNb
	jaJ4e/6FjWT6KHXpze6R+2sRG77k3AbbCcJbMLPaD/kSF0c4TD3t01tnV+VLM
X-Gm-Gg: ASbGncv4YUKPcXtLyinJH/dMya1PTTOzIlmYIpkdLAOr+vGS7dEgCnkRs5PTBBGPLum
	zQy07Zw5dpOfz/YWbBlXJJamrxImEpGBT0nYMePv3BjVFAKo8WWYbrx/gPHeZ33A0H7VtLvCe/v
	O7w2lqMVlhXVrkwtg0vFnOnFgZY6Nk/uULwLfJ29xuc1UD9+/XX4n1eZrrj3kRXiwM2W/Oj6Y0B
	dtsFST1JsM3BkDuSbYM0Z8mV7Xj5dA7cb0ru2eRit5ouS+EUdOsYLu+0r3SwEujS9ZjT5YcwO2w
	6uZGXsUEMNHqJSXmkDVdVLU01qVmpqWmTKNEFLh2/ziWqLXvmhmmKgIy5c6A9PX+d5Id/7I=
X-Received: by 2002:a17:90b:270e:b0:305:2d9b:f8d1 with SMTP id 98e67ed59e1d1-306dbc23bcfmr414947a91.24.1744137905982;
        Tue, 08 Apr 2025 11:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaU3DhJgD9mFlpz+3pt/knEhqaVCDrmHUL3p4sYGxtpbfvJJ4wuIl+C1Isb4VWBwFOCCpiIA==
X-Received: by 2002:a17:90b:270e:b0:305:2d9b:f8d1 with SMTP id 98e67ed59e1d1-306dbc23bcfmr414917a91.24.1744137905639;
        Tue, 08 Apr 2025 11:45:05 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb9500dsm12882212a91.47.2025.04.08.11.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:45:05 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Subject: [PATCH ath-next v5 3/3] wifi: ath12k: pass link_conf for tx_arvif retrieval
Date: Tue,  8 Apr 2025 11:45:01 -0700
Message-Id: <20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q8ofU2MzZWcmU67qWoowmhSEIGkIlLro
X-Proofpoint-ORIG-GUID: Q8ofU2MzZWcmU67qWoowmhSEIGkIlLro
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f56eb3 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=66aBALrjW5AsI7a0044A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=844 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_114508_737491_151DBF6E 
X-CRM114-Status: GOOD (  14.90  )
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

Three out of four callers to ath12k_mac_get_tx_arvif() have
link_conf pointer already set for other operations. Pass it
as a parameter. Modify ath12k_control_beaconing() to set
link_conf first.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fe4a22362000..15ee1f4b5193 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -580,22 +580,16 @@ static int ath12k_mac_vif_link_chan(struct ieee80211_vif *vif, u8 link_id,
 	return 0;
 }
 
-static struct ath12k_link_vif *ath12k_mac_get_tx_arvif(struct ath12k_link_vif *arvif)
+static struct ath12k_link_vif *
+ath12k_mac_get_tx_arvif(struct ath12k_link_vif *arvif,
+			struct ieee80211_bss_conf *link_conf)
 {
-	struct ieee80211_bss_conf *link_conf, *tx_bss_conf;
+	struct ieee80211_bss_conf *tx_bss_conf;
 	struct ath12k *ar = arvif->ar;
 	struct ath12k_vif *tx_ahvif;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	link_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!link_conf) {
-		ath12k_warn(ar->ab,
-			    "unable to access bss link conf for link %u required to retrieve transmitting link conf\n",
-			    arvif->link_id);
-		return NULL;
-	}
-
 	tx_bss_conf = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
 					link_conf->tx_bss_conf);
 	if (tx_bss_conf) {
@@ -1623,7 +1617,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 	if (tx_arvif) {
 		if (tx_arvif != arvif && arvif->is_up)
 			return 0;
@@ -1693,6 +1687,7 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	int ret;
@@ -1725,7 +1720,15 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 	params.aid = ahvif->aid;
 	params.bssid = arvif->bssid;
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ar->ab,
+			    "unable to access bss link conf for link %u required to retrieve transmitting link conf\n",
+			    arvif->link_id);
+		return;
+	}
+
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 	if (tx_arvif) {
 		params.tx_bssid = tx_arvif->bssid;
 		params.nontx_profile_idx = info->bssid_index;
@@ -7938,7 +7941,7 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 	if (!tx_arvif)
 		return 0;
 
@@ -9526,7 +9529,7 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		params.aid = ahvif->aid;
 		params.bssid = arvif->bssid;
 
-		tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+		tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 		if (tx_arvif) {
 			params.tx_bssid = tx_arvif->bssid;
 			params.nontx_profile_idx = link_conf->bssid_index;
-- 
2.34.1


