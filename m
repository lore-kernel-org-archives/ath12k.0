Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8B4C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=; b=HBhplpB9Zq3vRSyziM+6y/2/Ss
	Zrf6NZ/kZbyhHr6roujsDXdzQsBqvtFMKsQLdsTXIZswLTAM0YsFwZBZoHQA1NB7ouuwIQywI6xf6
	pwUDER3WeKF4zPjhQUubJO2I3ODG/2gH9p21iDNyzOZKDXOYfnSLGAmtferHRuuEj9GRKXbZn5ZgC
	f+IQqFlHiWgdNGCIt6N8K/3A3ta+9aXRwQW3ZAeC0+OJL8Xb1TOKKFInlmccU6HFuQqscLORnr6Rc
	XkZAYYT+2bv7bqhO/s6RZ/w8yLUc1niO5tPmjhbSr1EdE1CqHQ5tY40xz+ktozRw4O7U6vbu53Prm
	W/GNbXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAk-00000008Qs7-2wuz;
	Mon, 13 Jul 2026 07:33:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAh-00000008QqE-3cff
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NqLr507366
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=; b=CENFKJ41nlah8lln
	OoZAFKAkIY0mwSuikKUrqvnnD/hSLjbFQ3yGfkxHQH8MO84qv66viNuxcnbpqVEw
	YX+RqbInX+Y7SMwFtuw2fSK9Tix+Coq7pH0EPj90VxZUh1NOztD7qpZBgGAIgPwX
	tPwIVgnMEFk+WNeBMriFZlH5Rhsy0/uf6I1eGsjfg/iexOFaMQb8eCi59LSrPu6r
	XnXI5dwAn6F94OOTjQBYAKG9LOPE8PH2ZWhe+FybEAimRgq4IVxUc8sVr5ZtLqra
	rYC+U5epz6vUwoAxcf4+rYCON59Wil0ns7d4r8li2WuOiydZ3nUlQ5bSFSobifdc
	63kh8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gd0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so22819585ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928026; x=1784532826; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=;
        b=g4hAZpE3UZ6MQoLbdE+fiUvbP1gnoKo0CxrQHiSOEL31gYkgrdwjPzA0LXGnzqWVoQ
         whnSxk/WxnDl14gS+hILt/OiilvRQlB1MYkISdeyYUtsEh2lFdfLfWigKbYU3g9oaBTD
         logHUleYhOFXG3EOhh4POqulnptGhMfCEqRFmpcP87q4WZk7zjyY4uRaRmtHseteLbF5
         ok5R8l5Ft8jEzoiQB//T2rwptde5Y5GkIvG/fGRPrImumjXdALnEbfs6pQXOCXDBZyNR
         fpOE+oPQXw8HKa4yjXwaiDmoqFefyBfoG9USt1RjWhnAVGlpL6JvZHpQ4UwdBdnK4OD1
         WoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928026; x=1784532826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbntze55jigljzoUT73kZ+mmGEEM5eO3u1lu+cENJLU=;
        b=rDaQjo2Em23070gvco4jzaQOYy5+b9+J3myIUw7UySuAqM1FMNFTIZ4ugUdj7cH3J0
         0LL0J96dCEPbVrkp/Guvlbr4WJJzuh15fa4GA+d22J9gZoYYNxKandRJqYsYY34GeMUj
         F4GH8jIj9nbMT3iXeK8hJqSDcSEfHpO0GZLkHvrEYNtWxM1OdKDOEVUA8JYNkMmmd3M4
         s4LzPSEjloddex7GqX978RBq0MbDm6keYc+Ns+p90ew878/wUiqUJgU/t4WHohd2fsSP
         EPvFFrF/kDPGhD1/ZxhcPl1vPcIiDDQPKKKVYF53BtkfcuL2oAcETneQ3EQjr9OpFwbe
         YHWA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5XgJgrVPt3pbuVSWhOI2uv1ItSx079ZW9IEhlBvpJPMvczCJrmtn9blLDBq+ri+G/eO7hkDQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyihHUBsGysPDgLMrMj1tCiv/RqYVOVSJScXY6s1EH4gfUYTiJf
	wYF/DI2wRfvfqGqas+f4MEKR/1T8byxj7aa7bq+0+Zd+y5HsTX5lLRLqkXBn07yn3Asdtu9sKMZ
	Mf8cS7yNg4Htc3jTXCcYmPLdrgGb0L9ru9Y5Kn1WSkeEo7sEkTP9LFtlhpFojqtW4
X-Gm-Gg: AfdE7cmuDoCFD7tcBEknYG0512QTIJR55UbhXsp/KJ0uqmm4mpcydMmuBhrQqGId+96
	J4KzYOlpRpFhiX7C0+3ZxXCUILUvLEzhRbOIxqm08oZgy34RcyO5xeEH3CUo+Z4Sah6DYIeMv31
	R9FAP+hj/SkID8jqA/aKNIL4t1w2DPSO9ZdqZ8Nmu+JlfjHh3Ix93o6yztsx1CHhN6QzdBSpoZV
	awvJXYRl3U7Y7kP1DktScFBH176fo1PIQqWnnB6yGBQDRcECDJscgqUEwEUgmYJaMMOMlLkV3XU
	4hj1prH5xaelIUdTmfz9Bv8bZZkmKfIIek5H7IvU8xrsqDhgKNIR7hNktfpY7TAvmn5l1IfV8p+
	UBbiyJQ3l6epdsditqXSIdfkmKCzJbBOIbfiCiB2Q+p+z1q211xxioVF/UrG90nDD
X-Received: by 2002:a17:902:f641:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2ce9f2876ddmr76988955ad.43.1783928026309;
        Mon, 13 Jul 2026 00:33:46 -0700 (PDT)
X-Received: by 2002:a17:902:f641:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2ce9f2876ddmr76988725ad.43.1783928025830;
        Mon, 13 Jul 2026 00:33:45 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:45 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:18 +0800
Subject: [PATCH ath-current 3/8] wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID
 set in ath12k_sta::ml_peer_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-3-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: yTQ-ARb5zbEWsR_KVLPy_u6pcekcOOaa
X-Proofpoint-ORIG-GUID: yTQ-ARb5zbEWsR_KVLPy_u6pcekcOOaa
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5494da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MLhnoK1rgViGvFeMoKUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfXyY4bkJ5gN2T9
 lO9QE6AyCcJ0iG/8schY2TCrHEhOzLb3HtQRbOK1xen9T7g48W25vFocWU9GMhozlz/xh5MInuT
 5ei0yX10WjyhmxFde/8/a7ScGOnlSSE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfXzdvPmiWFA5K9
 mJtqY15dDFrApI8LOpkvOCfu4oI6VGbcjIspt91DmTOlyrRomDsx/uuIiD/aNYX81jdZ/gQFclE
 J6d51UY5KvWd9ASUaCYlK1XVaifQ6O7rh9XNy6by2S/niWmLBUGOFE/2zP//LECuP+3wFfLWWeL
 jqG9LaNc8B2JluqAEzsMNCIWJrSM96xSeHctF4FQKbRXYVqLixfqIESa+945wj5OwA9V0f5kfaW
 g32OYG8NSelXCODptiu3e9+1/1g3qpaRdb5QLNKKlWoJsbR/td/2GkSILQDxOJPlBoTjP1elm4z
 xzV6dWDnQ92OPXC+3LYbaaBJJs34UCLuSQ9b8q1BOyzwY5x4UxfAczC1J2JbXvjWeNJrHn8IaYQ
 djl8klQtCzAc1Ngfc7FR55eodOJtcfIdXHhmC4nI/apBvuQGb7bEKinL0XK/bXSVYbvUjJy3gO9
 PeqeOQQD66MTEI6IhQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003347_906420_908D52D4 
X-CRM114-Status: GOOD (  20.27  )
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


