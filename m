Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73CAC35FF1
	for <ath12k@archiver.kernel.org>; Mon, 10 Mar 2025 20:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxCnj6Zj5VRO/FPhZdIDI/wmFlKcODkCa+QWZkj1+Zw=; b=P8kiG9iGOx/sStlN9U88khvmbn
	ncGza+u2A5bG+9F/ZdhjDuv77oovFZ1nRhGY2h+QZCg9057mSDWseDQVKbn7REGQk9GV25DCiukHf
	ToSRaymUFlVZH+GLNRc9muIkIw7KOI033f3ZAL2HuJWxmcYpYWs9RYpGHz4BkMxqzA+WBCUm000yo
	ePBmJEowD8Gau+o6rz0uCwpFSD5XvadQND+GFFY0vl1WGDl1E2jKkKgFEWomPS89tiMeWllzwsmU9
	l0uv9cGeglHs3JLd8/ZOfJJbdh57cZnx6qiaJpFQDkPiha0Y9RSIW/NsgCzFDudJCNbMs1qMIWTY0
	2gJ6C5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjV9-00000003pOK-1W6R
	for ath12k@archiver.kernel.org;
	Mon, 10 Mar 2025 20:13:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjKn-00000003nlO-1yAe
	for ath12k@lists.infradead.org;
	Mon, 10 Mar 2025 20:02:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9gHw0029833
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 20:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CxCnj6Zj5VR
	O/FPhZdIDI/wmFlKcODkCa+QWZkj1+Zw=; b=RH+a65gf3igh27enEED6eEC6Jof
	GqB21+cIFcdQ4pfSxzMCXNCWzqRRwJE3jMP9ifyvv+XE/xGRCmDtGS4ByumoLA6N
	urPZK73JxJ5pJVItFgdLdUYCOcSVBFk9UG8GKqJHlFE7X4sU6zG/u9RvQTzsqqQe
	kyRk5J4AXAYkF7ExdbFacvUIFeuNDc+SMv9WEhcUvXp7j4O8IZZajgo+2/0Y4c/z
	RaI+821MltoW3VpwBjTQHoiF5zeBQI6cd6EPN9buCAIxkbWjfKpr3w5SBbwR0a4u
	JnaBxb4mUroFEtXu7Fjn4gQsPV6yV57fHTADq4cjCJBK0E/OqoMIHAguLuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eypdxwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 20:02:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241ae15dcbso96547165ad.0
        for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 13:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636964; x=1742241764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxCnj6Zj5VRO/FPhZdIDI/wmFlKcODkCa+QWZkj1+Zw=;
        b=LlvB9XqW+OL/LRGONkrY0f/ROa66ZSLcFQE2pOgkaph/PdBhiokW+m6xByXk3Ckhe7
         upWpJGRlfbMXLib9BBBETGQcZOGNPbmd0Dh/3CV8z/A011Byz9ScurAW2zBkKru+zBAG
         sXqw3pA5T3Z3iCnyWepkp+g/KpMMrGnIbM7zVZ9FjCx5Xk0jDobKaeuxybDqQLya7Ucn
         0Mu2LuZloynzTzxsnz3Ri8j7OyiTT1ZaNJlbem+osFE3v/AxXatYMufpTTSfpSROXTEY
         dxASnO+KQxVToP0GnpF4XFXbfLOZ5pa3A5/qedgTl1voYhaPTSNxAY/QUFT+zXmL6FgG
         ZD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL9GWM4tvu4Te8lbE0l+knz9Z1GJpdK60Jr/ufOiJBHWmft4vyfRMKMMd5w0l3rtdFftWDok8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSUCPkICUiya4oZpMLikaNhIarilXVW08GGvnEHqvyTrj9QGyM
	FO4X0prah2PK7nawRbLtnN2GUPbWCh80KEROJs4CP9S1jY9tEH42hQVeJftCKXDKdgrndD3pVUJ
	MJk0xTCLeweXwsZwTCXYOGN4qlquekZd1QSdLdVFAHAUgC8GSj4kMHWgQLVqC
X-Gm-Gg: ASbGncsEzJxgGXTaASb4iidITmaL5rhAv4irTdyDy9tRJgh0AAIoDk65wXBDjgJbMT0
	ArXL9Zkfdq7ofhTPH+/Rux4iQdsJfuMaMFVOHaZESY1gM62aMGsYGVusQxaz5Zhy8A09n4Ar8JK
	0XsF6tPjWTUt/+d9AJwLN3cBBCuvgYzxhuBslmsyv1kqsdnwBlkhwo4h2l3VMi0T8bxkwEE2lKH
	SIVZeLF680y1FLL2/bz2HjXtCo0DQw2y4uVbJgDG7lWzleagqsqGl5G5x0cwbLMDnn2lFvIdmgR
	NUD5y7SRDsrRQjXu0Ed4Qv81HSUbiKsHFhBgNa5ghQsTDQ3xUWL4SXWEiOny7IMCa9fDYk0=
X-Received: by 2002:a05:6a00:4b11:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-736aa9fe534mr21641343b3a.11.1741636964173;
        Mon, 10 Mar 2025 13:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvidx5KJkTSjAEJB9ZDmQS2NOn+ARs6ZuQieF+UAKqF8f27/e5SRU3C4Z9miHp/2u6CPhRxQ==
X-Received: by 2002:a05:6a00:4b11:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-736aa9fe534mr21641314b3a.11.1741636963771;
        Mon, 10 Mar 2025 13:02:43 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cbe3fb3fsm3730419b3a.83.2025.03.10.13.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:02:43 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 3/3] wifi: ath12k: pass link_conf for tx_arvif retrieval
Date: Mon, 10 Mar 2025 13:02:37 -0700
Message-Id: <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67cf4565 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=66aBALrjW5AsI7a0044A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zILp2Lz73JwJTQouRu3NPTsEpc7Tt6T7
X-Proofpoint-GUID: zILp2Lz73JwJTQouRu3NPTsEpc7Tt6T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=840
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130245_520773_E09AFD3D 
X-CRM114-Status: GOOD (  15.44  )
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
index 84da77bf245b..200a2a8ff166 100644
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
@@ -1729,7 +1723,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 	if (tx_arvif) {
 		if (tx_arvif != arvif && arvif->is_up)
 			return 0;
@@ -1799,6 +1793,7 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ieee80211_bss_conf *link_conf;
 	struct ath12k_link_vif *tx_arvif;
 	struct ath12k *ar = arvif->ar;
 	int ret;
@@ -1831,7 +1826,15 @@ static void ath12k_control_beaconing(struct ath12k_link_vif *arvif,
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
@@ -7868,7 +7871,7 @@ static int ath12k_mac_setup_vdev_params_mbssid(struct ath12k_link_vif *arvif,
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+	tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 	if (!tx_arvif)
 		return 0;
 
@@ -9322,7 +9325,7 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		params.aid = ahvif->aid;
 		params.bssid = arvif->bssid;
 
-		tx_arvif = ath12k_mac_get_tx_arvif(arvif);
+		tx_arvif = ath12k_mac_get_tx_arvif(arvif, link_conf);
 		if (tx_arvif) {
 			params.tx_bssid = tx_arvif->bssid;
 			params.nontx_profile_idx = link_conf->bssid_index;
-- 
2.34.1


