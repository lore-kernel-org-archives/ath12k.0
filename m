Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A6DC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=; b=Yfk8fqqyueJmHh3Wp7DspXso5w
	oRN7YpvzJTxHp6Jjh5u48VgSJfWczrGLuw3YDrlQw3Re8leLm9A76m458qdXKN4BIqFAjDI6eVigz
	tCZG8763zXWdxb6IpuGY7JYyGprlnTaV0T/AUwbhLc6PBsyGUfiqVqoD8LraaWybqPOmSEcQYAA0p
	Uyg0DF5R6ws3j0mcidIE+d9CWz6gx/Duk1ELNzKdJyQLAcETMsVWjOQdNfgyhUDLV1FeyJWNHvEoq
	M6ICon1owQkiynguib5SxV+lv0UwZqtb2cS0Rcu3w0948xLZ0B4LcHLnILXcrA9BFpPkjP74261+E
	XUFjw8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAs-00000008Qyl-0uO1;
	Mon, 13 Jul 2026 07:33:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAq-00000008QwE-0Qi0
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nhds507010
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=; b=iGqlsnluhoOIfl5f
	XILsxaPlmlDKGOQZhdWDpPLus00IznGZXH/csquldyWTGEnyINoeqRfDHHEmHRA3
	/mRrDMQOsBZJu7nmBi/M5HyQXe9//Z+ycNNj5fibTded5zO7t4PPyRb66vlK+uKx
	V58Dz6l/i4kDx4b6hj4dBeDofv9luu9OMxFJ3Lfn5hUSJMCd0y+rNnOqDlIfpulY
	jDFk4c9vKgMP1HYjiJ9BhDP2rBx29wlhADgUXPb2EATP2KO8cFhLwqoo/5gFRAmq
	w99nyefMcZWx2j4xw+92GOqLJ9iH3EV84562bT6CIcZqFaO8MMMcRjkPgj0pqhGe
	Qerm1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gd1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso38860155ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928035; x=1784532835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=;
        b=LTh5eoNdMaGe4zPyKe1I2rT+xqG5+LuxD1xdCWx+v44gIdq+DUgeAWR0pIm3eBG0SX
         ifqN6WiXXOdxjABuVNhd5HegCA7kR+Epxwb3LG0o4LQvbC48Uwk6s5fZTD3ErxdJcTDC
         DqzynEJ6tZGdxurAO+udwaL4ZVoW4l3ZfM4W9/HDyq86tCyGCGIG+lo11nMPZQCsSvVr
         RRWkvX6gbCDW5wRXel3V+AOPruJfYybPfR73+H5NGGSVDUYtnw+mjIcQrhMKSA97P5nK
         7rZxReZ21uQHV8qYpYtxeEmc96PwJxewav4j2wcD03V6bV2o3VIjsXeWBNLYgiopyXUR
         cRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928035; x=1784532835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0az8tsVR7zS2GhqdLGHW1f/gmLg6FxiIQXtaw3jsQc=;
        b=sZK5rNxcPS55e5TzruZYLb4RlvjjN/Oi+AUhqRyKztZmH0wYjSTyIIwUSeQPRIFe95
         i4edEXlvuEkwScjF+rrmg2i3zdf5eDAqVp5z+ExqVkzRnL2UzIg1CaMbeStk/ZvFGYSg
         Ds0AiTcRRr0G4mREgcr0xzyncpTiOo+/OHUWUf00huCRsXOnBjbYAdp0wfsmaPUCvS2q
         LxbWJ+EpV4ekrHbFo+6gUd3NiKduskVVZX8P1XMPCfRQGycveVMSd0QFy0S8H3Pu+Wi4
         qHgTs2nXeXv7SRdhckRbZERLfu1Uj8E0nc5wm5lbGtrhdXe3bRIrVzhGgenHdw+L4GZo
         Ahvw==
X-Forwarded-Encrypted: i=1; AHgh+RqPfs9cC9iJu5bABODWiiJaC3Mwc9LhbiRvh/g0WEmpiCx87IkxDbomawaNTT/vt8xFj8nf18U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVxj8ocPdpGNIuxq/qw5KN7tXUz5h8OkwILC3BKZFNi+KcPsiW
	bOWp9kuZLPbiQwCSzcJ+clspX+8bekAucwcmi6nIVyAexmxAbH9icxv8hkO2H9fJop9V91JSxFU
	gTeFNWM3e3UEc1hlMoQEHOosXOAfg1X0OrGslgxOedbxhJv+x7tiw3cOQFlJRQkMpiB3bw7MFIr
	c=
X-Gm-Gg: AfdE7ckiBrUkRNDGZi/V/wE6L1OmXv1j0okIpGaKcul2fTqSFob7D5uJaH9YHtjS0az
	XrHy1idlSBBOWfhMt923Cmgor77UcV1g7zuWBjU3xWqRSdkecl8BCaDssm8joL2ix2C2zQJnDWC
	ztlDtJ0hfp/ijzfRpWGRcJ7g4iDx6T0Sso/3nIyT9svgLlyHPTWGiXgJMLw3t3AzbUiG9n3iyqr
	P5uD7UmoOrE+nZL58tH8ouvZze0BYzaCT54ufPkL7UUzhlOEBGRnifajYA4QeU0lJCQhzcoyhmn
	FYQm0CnEItvFSa2sZ5PTv/k6OvWpTdVqftFHXcyX5Fd56d13k4Vjp9FnXMy6lbUzXfszMi0QmvA
	HLQiui8DK1uIUYNt8Ad45grxcQ2CipPGI5HMBxRUm6h2q7geIwHRUEtDgJ5qj5UXr
X-Received: by 2002:a17:903:38c3:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2ce9f05dfb6mr72596155ad.37.1783928034728;
        Mon, 13 Jul 2026 00:33:54 -0700 (PDT)
X-Received: by 2002:a17:903:38c3:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2ce9f05dfb6mr72595975ad.37.1783928034137;
        Mon, 13 Jul 2026 00:33:54 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:53 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:22 +0800
Subject: [PATCH ath-current 7/8] wifi: ath12k: defer dp_peer registration
 when firmware allocates MLD peer ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-7-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: brhPbDZ4y7XBh53hRtfXm96cwO6lVMSW
X-Proofpoint-ORIG-GUID: brhPbDZ4y7XBh53hRtfXm96cwO6lVMSW
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5494e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DmUR2gHJotVURrrF6hgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfXwAkTH5CXKYBw
 op52mWKbiVd9RlLPMCYmRM794IhCTSpOKWM2e0crwD6LINlK6/LsjDHxtTZnpwtMR4SdEczRnsl
 Bcc19rT9GKa8oXxTdkWEgzDwKYFIm6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX4yfJnF6sWJ8Y
 vqNc5oquHRLXBv7Q5Tp0QgMAZcIHjppDz88Hl8SeihfZJcJdJ/jWuCy/LsOWLMQc2yqKb3TO1cy
 a6yQ26Fpr7h6qnrvdn7SgPo1xQc1HaRuS+Mrue2vVQiXHQQjLlpblhnhz4w8wq0C1Ss/QJyXQsQ
 jJHL9DJWBVRwFpa7p1XT2oL/hWvLSUWEfNsoAOd8sc9C9hxI9rtPxveLaynnS3rpF5IfMAeSCds
 bkPcmrzaG9WJiehS9BHjmrul+6NnODAkd2DSULYiLGahAX7/41hHjivf+ASBoBazClyWiN3orH9
 RrTMj1jcrU1KwV4hUPuJbI7snliYk5JEjPbQGikYF3ZDp4MwddEcoBwSdWG+OGRJperXhtX3VdK
 OtaPqkd5CakmY4xXebJtMkhby8VDEMtQFdcMr+1WZ4M1zgq4TSKCISx6mDPxCqCCWiJODOb1Ckm
 oJyqMojAONLdnSKFaqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003356_171593_DD96A2E3 
X-CRM114-Status: GOOD (  25.37  )
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

For chips with host_alloc_ml_id=true (QCN9274 etc.), the host allocates
the MLD peer ID up front; ath12k_dp_peer_create() publishes the dp_peer
into dp_hw->dp_peers[] using that ID immediately. WCN7850/QCC2072 does
not work that way: the firmware picks the ID and only tells the host
afterwards via HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP, so the publication has
to be delayed until the event arrives.

Introduce ATH12K_MLO_PEER_ID_PENDING (0xFFFE) as a sentinel for "is_mlo,
but ID not yet known". On the firmware-allocates path:

  - ath12k_mac_op_sta_state(NOTEXIST->NONE) skips ath12k_peer_ml_alloc()
    and stores PENDING in ahsta->ml_peer_id and dp_params.peer_id;
  - ath12k_dp_peer_create() skips dp_peer registration until a real ID is
    known;
  - ath12k_peer_create() leaves peer->ml_id at INVALID so consumer sites
    do not treat PENDING as a real ID;
  - ath12k_peer_ml_free() and ath12k_mac_dp_peer_cleanup() skip the
    dp_peers[] write and the free_ml_peer_id_map clear when
    host_alloc_ml_id is false or the ID is still PENDING.

The HTT handler change that resolves the PENDING ID is added in a
follow-up patch.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_peer.c | 23 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.c     | 22 ++++++++++++++++------
 drivers/net/wireless/ath/ath12k/peer.c    | 20 +++++++++++++++++---
 4 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 1f56474efbea..8769b41f5db5 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -72,6 +72,7 @@
 
 #define ATH12K_MAX_MLO_PEERS            256
 #define ATH12K_MLO_PEER_ID_INVALID      0xFFFF
+#define ATH12K_MLO_PEER_ID_PENDING      0xFFFE
 
 #define ATH12K_INVALID_RSSI_FULL -1
 #define ATH12K_INVALID_RSSI_EMPTY -128
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 47d009a0d61f..2a2eae194007 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -472,7 +472,9 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->is_mlo = params->is_mlo;
 
 	/*
-	 * For MLO client, the host assigns the ML peer ID, so set peer_id in dp_peer
+	 * For MLO client, the ML peer ID, either known or PENDING, needs to be
+	 * initialized here since the following logic depends on it.
+	 *
 	 * For non-MLO client, host gets link peer ID from firmware and will be
 	 * assigned at the time of link peer creation
 	 */
@@ -488,13 +490,17 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
 
 	/*
-	 * For MLO client, the peer_id for ath12k_dp_peer is allocated by host
-	 * and that peer_id is known at this point, and hence this ath12k_dp_peer
-	 * can be added to the RCU table using the peer_id.
-	 * For non-MLO client, this addition to RCU table shall be done at the
-	 * time of assignment of ath12k_dp_link_peer to ath12k_dp_peer.
+	 * For an MLO client whose ML peer ID is allocated by the host, the
+	 * peer_id is known here and the dp_peer can be added to the RCU
+	 * table using it. For an MLO client on chips where the firmware
+	 * allocates the ID, peer_id is ATH12K_MLO_PEER_ID_PENDING and the
+	 * RCU table publish is deferred to the
+	 * HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP handler. For a non-MLO client
+	 * the publish happens later, at the time of assignment of
+	 * ath12k_dp_link_peer to ath12k_dp_peer.
 	 */
-	if (dp_peer->is_mlo)
+	if (dp_peer->is_mlo &&
+	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], dp_peer);
 
 	spin_unlock_bh(&dp_hw->peer_lock);
@@ -515,7 +521,8 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 		return;
 	}
 
-	if (dp_peer->is_mlo)
+	if (dp_peer->is_mlo &&
+	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
 
 	list_del(&dp_peer->list);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8cd5e9b15db5..818eb3aa919e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1285,7 +1285,9 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
-			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
+			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
+				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
+						   NULL);
 			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
 		}
 
@@ -7746,11 +7748,19 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		/* ML sta */
 		if (sta->mlo && !ahsta->links_map &&
 		    (hweight16(sta->valid_links) == 1)) {
-			ahsta->ml_peer_id = ath12k_peer_ml_alloc(ah);
-			if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
-				ath12k_hw_warn(ah, "unable to allocate ML peer id for sta %pM",
-					       sta->addr);
-				goto exit;
+			if (ah->host_alloc_ml_id) {
+				ahsta->ml_peer_id = ath12k_peer_ml_alloc(ah);
+				if (ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID) {
+					ath12k_hw_warn(ah, "unable to allocate ML peer id for sta %pM",
+						       sta->addr);
+					goto exit;
+				}
+			} else {
+				/*
+				 * firmware allocates the ML peer ID and notifies
+				 * the host via HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
+				 */
+				ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_PENDING;
 			}
 
 			dp_params.is_mlo = true;
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index ae93731b4177..25e4b79f11d6 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -230,7 +230,16 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		/* Fill ML info into created peer */
 		if (sta->mlo) {
 			ml_peer_id = ahsta->ml_peer_id;
-			peer->ml_id = ml_peer_id;
+			/*
+			 * For chips where firmware allocates the ML peer ID,
+			 * ml_peer_id is ATH12K_MLO_PEER_ID_PENDING here. The
+			 * MLO_RX_PEER_MAP HTT event handler fixes up
+			 * peer->ml_id once the ID is known.
+			 */
+			if (ml_peer_id == ATH12K_MLO_PEER_ID_PENDING)
+				peer->ml_id = ATH12K_MLO_PEER_ID_INVALID;
+			else
+				peer->ml_id = ml_peer_id;
 			ether_addr_copy(peer->ml_addr, sta->addr);
 
 			/* the assoc link is considered primary for now */
@@ -285,8 +294,13 @@ void ath12k_peer_ml_free(struct ath12k_hw *ah, struct ath12k_sta *ahsta)
 {
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
-	if (ahsta->ml_peer_id <
-	    (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID))
+	/*
+	 * Only devices that allocate the ID on the host own a slot in
+	 * free_ml_peer_id_map.
+	 */
+	if (ah->host_alloc_ml_id &&
+	    (ahsta->ml_peer_id <
+	     (ATH12K_MAX_MLO_PEERS | ATH12K_PEER_ML_ID_VALID)))
 		clear_bit(ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID,
 			  ah->free_ml_peer_id_map);
 	ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;

-- 
2.25.1


