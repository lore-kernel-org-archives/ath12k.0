Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9EAC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=; b=wsHNG2xuADcU2hicdXykMPPwDg
	yMTPbcEFHw4lXSc1XzqIr0D/xjvH5a6zOmMqGKW1/5+hPbetV4IEl7DQYDAM3ckCdfXJ23yBsGo9M
	/MGSqeTVC02gL7BqkO3xR2gohR6L44Y0iRvjNIVB8iSyPsejSaTnwvK6p3fKlHJPpXqIVampqGYvl
	rwx5vNbA0bbqPxE/i1YRheE9doJpd1b0UWgrU23zoODud/2XKKKoIOChUaJfZE2Ban/m+ks2Kwcon
	8YLpJBNMAQ4rRZsSpqordS+ng8EEW9KYIgBNouxn+WYjOMompnvCoSbwuHjxWVSKleQsAQvwduoHf
	PGOVkAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7g-00000008Pmj-40bU;
	Mon, 13 Jul 2026 07:30:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7e-00000008PmC-13gB
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkvR668636
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=; b=Z3yXckExHl7Blhag
	/e/bJSIi21EIaK1wvQfZS0DmM6kqTOuk4ktR5AtvMk3FPvEYwDJM87tiTELryVkJ
	TXimhEeCO61lW/gnOuQVVc7QD0XXTBzJb7zxDFhoZNIs28k/ILcyFNO9bhTUVDUw
	z43qTch+4BXD6kqo5G/fGI2jWfOWDFUpmkCg5Yyqj+IIraLXIxJciFxlROOUR73q
	qlG/EtKsEgBLRl3NkeK2OrGiEW2xpRVCKQP++61EnjM2GEGAMnhgNHK1wTro/Bct
	z/jHGCHlqMNnZRDRA6I6rKY2Q2wB4BU2zKN76F3eJ1RIQ4GVqalDpXJZ6eKh1qpe
	oK9WUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1eb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894391f000so1634727a12.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927837; x=1784532637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=;
        b=btm/xLDOcbwknT+6yVCorZokgUvxfc9psa44Fh/szoLYeidVkrauTkFvIZjPjg/3Z9
         xBju621tnupW0Zbok5DHUvhMRxOOQ6nhXAgxwrqp6y1i788gqECBIoMCfrZUKroi49F9
         Uqtx7aZSXY2kg1s6/Yc/GYzGQ7/6GVwyurF145I7dfGK7Hil0bS2cqrY6wsRImw8A+8s
         yHRQaCfya+9jN0hAs0DP3cgNCnpoe33Qmcrnsy7tHJ1qON9mKHXrMNqQGAe1gp7SUKVY
         2uHErbceFTTyNi/PAULZkB0yDLu/8Cm5LgSdzH6IW+B/Hb8FhJjUYrn4Onn4aGTMDZmx
         RwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927837; x=1784532637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=;
        b=H9RAdrmvmOSn7ewOEP+7f2Za1QaWEDIuL1KVHKVHS6bGrygwzZIopasBJMxuitG8N5
         BUPcfjzcy4xFgWLNWuddqlxKUa0176pZdweoe5QOQju0JjRfyirD4rp9hoXmfX1IZZzJ
         MwPMNolIDnaUu8Iiq1yOxh9hSGq9VweL2LabXKhTDcB8fmdEAHUiU3cEHoSuaJZ/wbyT
         1DM2dM1KYEoJTuZLojqQ0BwmlmOiiWEGTONTF5d100jKI0xktJVjG7QtWmtuiGicVpxL
         iBSshu7HD4aQgv9CbWGCiP4yoyYBk/uYyglkzvMdtkxHSoh+jdJwSit4gseKfYX6+wd3
         XByQ==
X-Forwarded-Encrypted: i=1; AHgh+RpS7GoQTAIBX3i70Q879bQMQhQSz5po+6MtnLvrjRBCg+/rm6r9ZqAIC2V0GyYsW2/DhiXG8/8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVN6dZdLJxlQSW0CxLL9mIdxQ1B37CDuyQqL7W5lsP4PvzqroJ
	IHagqKTCobaOvwj6ZgTthxHDOGIgGHxYhWrp+fdFXIwIT7bbLxFp3356ei6vj+o7gHzWcCg8ZDD
	N04fgDj5lQOGX6AcCBWPDT49K0vfFNw0+eg+YrGcQstP4AEok37cR8pCAxniMRkML
X-Gm-Gg: AfdE7cnRfYnJB5QlWAw/rHDJgryv7THymSaeOxw1MobYugaX6vcwzQTmYMyk59y11FC
	iNH/i5N7zxR9uqg1x5n9AQ+7SUu0V4w0cED5QC5PEV7tSf0BRDAkNj4ah4HKofFvt10WbckJsIw
	NOYIKs06JwAYHCckeSEbVsGgTbQoEbG4X+whE/C5nCfgAmL7GrCNjeHE2vTyFAHgJyeVMymn4lH
	611pUTQhD2ZZUO3SQ2yk3tsL0IQkJBIYASeHO+g2ZCcgk9mZz1PJKs/2w55I9+Sd7XyAAXyVPz4
	1UIbth9W6bbGsovTaQHu/y4dDccoKwUqyJ/aVMkV5D0zwExqtsjDtBxknHboEpYVlomESo7dGQ/
	3h6iSQkM4JtJGhbfV9ZHA2M+aukc9JmpswdocnYo7+0Yzvm0+ZE6SlTMkULoJ2vKb
X-Received: by 2002:a05:6a21:1b81:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3c110009b82mr8842528637.12.1783927837206;
        Mon, 13 Jul 2026 00:30:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3c110009b82mr8842495637.12.1783927836680;
        Mon, 13 Jul 2026 00:30:36 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:35 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:55 +0800
Subject: [PATCH ath-current v6 3/8] wifi: ath12k: keep
 ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-3-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: WJbCnWMBPwxPty0QFeQ1xMh3KZJYN4Fp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX11uNsgzW3ncx
 yXo2kd9+/bTN2NclMk+tJrNKmrHSC2TP0WIrZNWICffVrcVpyr1KtR2jGI+6AK1O5vAL5MJif/3
 r3UiyeOj5U9iAvVCNfJsyZDbA4HblUMws+rBZWomTG8mzJC2hQP1+EVOmi2uukV1E2WGo2vcSXM
 U1TiFCZ5iXoff5r3HVLGZrMLDvsVFRgjT8/VGEKMFf9DQzuU0maCZ0hWwgtFzqwHAcpA2RyoebN
 lIOEUxdnLa/F9MaSffTcLGit3b0EeZCJ4WOCDprJ6bRPhDEU9eW12d+JMRiDb/i1F3ixTm4KkSk
 53HuxMbWlfk0cwLbmraEk+y6utFwZ61vtyGku87N3Ppq2kgMv4iDeUlPn6SKZMrMW+bIjLf3rpL
 n9+M2ecN9m71onBlZfA+MGCHCCzkPJvgOTvh33wApqi0XuFTQ84p62TVHu0HtN5eNBSzKEcgKKr
 HvXAg/kppj6njNyBm9Q==
X-Proofpoint-GUID: WJbCnWMBPwxPty0QFeQ1xMh3KZJYN4Fp
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54941d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MLhnoK1rgViGvFeMoKUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX9jOYRaAQFJdx
 0PTisfZ8yqh0OxAlgcKRr8JIAS0g+inYiuCBr9Iw4/bgva6qg1fyvnYBkdRwGGwWJ2U78bKbkN2
 O+nVE42RmmaszybXH6P+xqmioikO1ic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003038_303593_1E5539D1 
X-CRM114-Status: GOOD (  20.16  )
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

Several pieces of host bookkeeping for MLD peer IDs encode the
same fact in different ways:

  - ath12k_sta::ml_peer_id stores the raw ID in [0, ATH12K_MAX_MLO_PEERS);
  - ath12k_dp_peer::peer_id, ath12k_dp_link_peer::ml_id and the index used
    on ath12k_dp_hw::dp_peers[] always carry the ATH12K_PEER_ML_ID_VALID
    bit (BIT(13)) when the ID is real;
  - WMI_MLO_PEER_ASSOC_PARAMS::ml_peer_id sent down to firmware is
    raw, without the bookkeeping bit.

The mismatch leaks into call sites that have to remember to OR
the bit in (ath12k_peer_create(), ath12k_mac_op_sta_state()) or
remember not to (ath12k_peer_assoc_h_mlo()).

Make ath12k_sta::ml_peer_id carry the VALID bit when valid, the same
way ath12k_dp_peer::peer_id and ath12k_dp_link_peer::ml_id do:

  - ath12k_peer_ml_alloc() OR-s the bit in once on the way out;
    the internal bitmap stays raw [0, ATH12K_MAX_MLO_PEERS);
  - ath12k_peer_create() and ath12k_mac_op_sta_state() drop the
    explicit OR;
  - ath12k_peer_assoc_h_mlo() masks the bit off when populating
    the WMI ml_peer_id;

While there, introduce ath12k_peer_ml_free() to mirror
ath12k_peer_ml_alloc(), which helps avoid code duplication.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c  | 27 +++++++++++++--------------
 drivers/net/wireless/ath/ath12k/peer.c | 17 ++++++++++++++---
 drivers/net/wireless/ath/ath12k/peer.h |  1 +
 3 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3e3b06e15f80..7d0d7d5fbf53 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1278,16 +1278,15 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	struct ath12k_dp_peer *dp_peer, *tmp;
 	struct ath12k_dp_hw *dp_hw = &ah->dp_hw;
 
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
 	INIT_LIST_HEAD(&peers);
 
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
-			struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(dp_peer->sta);
-
 			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
-			clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
-			ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
+			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
 		}
 
 		list_move(&dp_peer->list, &peers);
@@ -3547,7 +3546,11 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 
 	ether_addr_copy(ml->mld_addr, sta->addr);
 	ml->logical_link_idx = arsta->link_idx;
-	ml->ml_peer_id = ahsta->ml_peer_id;
+	/*
+	 * WMI_MLO_PEER_ASSOC_PARAMS expects the raw ML peer ID without
+	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit.
+	 */
+	ml->ml_peer_id = ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID;
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
 	ml->eml_cap = sta->eml_cap;
@@ -7264,10 +7267,8 @@ static void ath12k_mac_ml_station_remove(struct ath12k_vif *ahvif,
 		ath12k_mac_free_unassign_link_sta(ah, ahsta, link_id);
 	}
 
-	if (sta->mlo) {
-		clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
-		ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
-	}
+	if (sta->mlo)
+		ath12k_peer_ml_free(ah, ahsta);
 }
 
 static int ath12k_mac_handle_link_sta_state(struct ieee80211_hw *hw,
@@ -7739,7 +7740,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 			}
 
 			dp_params.is_mlo = true;
-			dp_params.peer_id = ahsta->ml_peer_id | ATH12K_PEER_ML_ID_VALID;
+			dp_params.peer_id = ahsta->ml_peer_id;
 		}
 
 		dp_params.sta = sta;
@@ -7876,10 +7877,8 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 peer_delete:
 	ath12k_dp_peer_delete(&ah->dp_hw, sta->addr, sta);
 ml_peer_id_clear:
-	if (sta->mlo) {
-		clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
-		ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
-	}
+	if (sta->mlo)
+		ath12k_peer_ml_free(ah, ahsta);
 exit:
 	/* update the state if everything went well */
 	if (!ret)
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index c222bdaa333c..ae93731b4177 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -230,7 +230,7 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		/* Fill ML info into created peer */
 		if (sta->mlo) {
 			ml_peer_id = ahsta->ml_peer_id;
-			peer->ml_id = ml_peer_id | ATH12K_PEER_ML_ID_VALID;
+			peer->ml_id = ml_peer_id;
 			ether_addr_copy(peer->ml_addr, sta->addr);
 
 			/* the assoc link is considered primary for now */
@@ -276,9 +276,20 @@ u16 ath12k_peer_ml_alloc(struct ath12k_hw *ah)
 	}
 
 	if (ml_peer_id == ATH12K_MAX_MLO_PEERS)
-		ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
+		return ATH12K_MLO_PEER_ID_INVALID;
 
-	return ml_peer_id;
+	return ml_peer_id | ATH12K_PEER_ML_ID_VALID;
+}
+
+void ath12k_peer_ml_free(struct ath12k_hw *ah, struct ath12k_sta *ahsta)
+{
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	if (ahsta->ml_peer_id <
+	    (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID))
+		clear_bit(ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID,
+			  ah->free_ml_peer_id_map);
+	ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
 }
 
 int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_sta *ahsta)
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 49d89796bc46..0f7f25b8e89c 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -26,4 +26,5 @@ int ath12k_link_sta_rhash_add(struct ath12k_base *ab, struct ath12k_link_sta *ar
 struct ath12k_link_sta *ath12k_link_sta_find_by_addr(struct ath12k_base *ab,
 						     const u8 *addr);
 u16 ath12k_peer_ml_alloc(struct ath12k_hw *ah);
+void ath12k_peer_ml_free(struct ath12k_hw *ah, struct ath12k_sta *ahsta);
 #endif /* _PEER_H_ */

-- 
2.25.1


