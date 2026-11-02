Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EE606A329
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+3kheU6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OUMIVqh7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWOaQrlO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zS6kutx/WsJidhWhliY3FrWRH4DgTRb0PEAupbAX4Q0=; b=D+3kheU6YRaaKp
	TRh6a5PULEijFPYoBTr9rhWKtP58O9m5cvta2P0EotDTaE2hcrXAFHQY5JOh9hHSeqF4ZssvU2uPR
	Fmh3N7o7VY0saFT3Omb1wbKefoslZdGtIm0PcT47HxV8qvFDCioptzbbljfkUbBG2hktaieRxn5Wr
	Wk75UYwvzYQLZcrZQBYzhuMTuLTY+SVVO7CMjVZR+FyVLF+l3VNt+EGDM7EQ7SXWBa0jUXDSVKGHj
	KRZ1js8b8IOQ8n+9BQHS8jAMlYwjYadSZ9FdRPcRs2f34nKyjXzbugN6hHEWioTJopU+r82qiY+Pm
	oTYJmdX3AM1eq1sYaTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh3-0000000Fer6-1ZNP;
	Mon, 02 Nov 2026 06:38:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh0-0000000Feok-2cW3
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:38:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vESo3348756
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zS6kutx/WsJidhWhliY3FrWRH4DgTRb0PEAupbAX4Q0=; b=OUMIVqh7gqSBzHt9
	7lIdLuOSFRs2AbQyYdGUxpL11ebjMo9er+UY1Cyhq2qocJrSfW4IoTLKe4eFrG72
	8Pq8pqP5cWUXLpEXVs1r+JmcRsGrwro+W/D4xclPYjUTwQZVWRzaGMo8YVLA0BbA
	z2Ng+zDPlgr4paDA6RaQpLzkU36mKz0es+GvX8DireWZ/ZF5bXT9ZN7tGhR3acGm
	iQ8bg0c8T/lEW6Ld+dG5tdwuVpRUd3+KQYKPp1ILRyn1+t6lw5vSEr0ABoeJ4uJw
	TdK3WEXiFA+aCnsXsTNsMXz2Lhvv4NySypUUUunFm21L0rHRhx6BZbSMEMShIiDp
	3xp20Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnhyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65285537aso1122647a12.1
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601533; x=1794206333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS6kutx/WsJidhWhliY3FrWRH4DgTRb0PEAupbAX4Q0=;
        b=HWOaQrlO5XXVhNfxFwR83sdu6PMslgZi3V0fF5gRvUX6O4TDwbAEVp2dOZS4KGA7gu
         /3d1fK/hyZed0PuHAnQ2szS24153dT64mCAP1rLIweEjOK/I/rd3YQ63WPfV+Wk2OnIE
         B4ghSkbpRCl8DFJKNmB3CtRLQC5E3JoLfIA4hgh3sB7upNjxZKUtMz7WfIRWIuBWIN5a
         baJif3bvh3Y3ICxTiiARx119qmy1zfLJXmBdtA6vnd/5k96dbWxtpW5WMm6bSFrZeSjj
         WnJQ90IfqO3kasQGhshsFBd0w4edoFxn4JpalAIBjU1F+5ahZsrg9MbEbuGqi+Nha5Hc
         mRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601533; x=1794206333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zS6kutx/WsJidhWhliY3FrWRH4DgTRb0PEAupbAX4Q0=;
        b=IYdttl9G/9eWemK5fitFXpaPKK0tEb15xDpEXnDni3Ro+l9MoeLTEX2Bz6vUh9+52R
         3bI+pKjlkLtPNHHlpZ8QMHXwwpmc0Ouit1vQnOKyDKTIrAI6KQKk4Nj1/jO56cntU6Bw
         79m2nup7CwglsX5JorjXy+tMmy9SYXnJGGZFb7ZWBu1cNI9t9nXOIT0VR3anKETEO+zE
         GtLFMfN7rTxOBdMA/Ff4+p0Xt3860vRcSd4sagZvEUG8493OuFebHMcKXCO+5pj6gJ6Y
         1m9UhZLxUsPOpWN2pKKgh6XC9laQJqkrkzYxkm161N634yIPF8ojkXheM/RdwpOSKjHH
         A3gA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ+DWDIOj4gE2c+sBmIim3FDAJOy8sCMiuEq9dYN/xLAmveVHBbO39bferglqwy/mp2okLo2M=@lists.infradead.org
X-Gm-Message-State: APuU4Z8AA2LKhPY1cBvmcQThlZdw8FKiG3H8GVIQLzfCUuuw3DM7K5FS
	lX4Qbac1ThoagD4eQSBPh1q+eTwrs/3o3dwg02uPBj6uR0VPOFQhE0t191rNSA5koGgMcebps3Q
	QdDF8BMKAGln5RurLSxHvHFMQPDNTLaghyP0PS64aoHBti3GLdDQfRXJo6lOGVmnhfR5HZ5UU
X-Gm-Gg: AYBFou26oPalYPdYOySmU21kERe5hb0tcuV7X9vQkYCmkM8UZLQOrewhpbZhBmKQygP
	Z/EWYUHmkFARUnzKdE6lfJQEixjUlPHpgOqReEc6Mn0IeyvJ67B/frMXcmHcSwOUErqdgo+TSsd
	rcRNQkPT3mURP8OAfcP/llt06jMtynNw3wiam4UWUvXdIgGrrs3VOror1yapzhExjcD2NlEblRN
	C8RaUX9RKX3vup8XuFUj+2zAMmBjk67kxf7A04ffg9FOHnOvpAa03e7g23KuV2HX/xnAy5J9B5e
	+ECGOedzi4aJMeqEfWYdttl48Ns397M4D8Ib12IIE/IJr0KsXCgqQY+7n5IE4su/fF7hgRCyTr8
	mrqqOdYBJ5CCX+XWQWNfbZzS9eRcnXFiU5PGzRPXEDWYXjr8scXwu//Ij4+EEgHak4HqYSFzdSG
	IIFceoLu8MB1EBnzogdAP4lFyIUi8e
X-Received: by 2002:a17:90b:2711:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3ae89819919mr7210314a91.34.1793601532654;
        Sun, 01 Nov 2026 22:38:52 -0800 (PST)
X-Received: by 2002:a17:90b:2711:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3ae89819919mr7210306a91.34.1793601532161;
        Sun, 01 Nov 2026 22:38:52 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:51 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:12 +0800
Subject: [PATCH ath-next v4 03/11] wifi: ath12k: rename
 ath12k_dp_peer::hw_links to link_id_map
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-3-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: g0cBiOiLWF5C7aVxk4GYT-pcPx0-8JBD
X-Proofpoint-ORIG-GUID: g0cBiOiLWF5C7aVxk4GYT-pcPx0-8JBD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXyGoYR47unp85
 ZO83X5NjWF0Gsvgo/ILLzp/XZm0tZa18se5ToxU48ygEEpxZTmKyt7b/BHwQx8AfB1Bh5HBSHIF
 s72rYffXBErNNsZ6iY2OrOZLr3ePH6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXxBeu47Kf/cSo
 i5EmZxxQ6G4wi90Sc7I5OlaVE/2hGCE4dnquBDEJwshKpaU9R2mj8EVDJYUSzReFVVasi1msYMQ
 K5MHhbdDjgGuQ+OISDeRckuEbyyr1vEdNzxNr/xnEbsLaTQFMIYbu4Vb4GCFPy5HCCIqVruMjU4
 4olW0jCprTcRWDz5eCEQDzTc6IV/5VbfI9qnVQUN6l4A2M+k6vmL++izkK/4tQmN/+PUgGxR07t
 yQlDPNWID4YJ+WwRm3Sdud+WyghH7Nnx8jgVhLizYX39/QBiNTFpkO+LGejiHpdLhQ4CO8GtUcz
 90HM7D8shv97kNL6KBq2ig6RqVM1bHYGi0HZRWdrG4C7A50i4dQcaViped7hQSTQe5WQtOqlN3q
 v5SwvGoPPNANAD+taFLtP8YDef0KDethBPtmBNsDEn/L65uDkkER9LPhVfS2i0B8gnUkMzhkFFZ
 V4aG+UYzCVLGq+d6MCA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae82ffd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=niLHlN7IhEeuoKN5US8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223854_807151_AAD9AAEF 
X-CRM114-Status: GOOD (  16.47  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The name hw_links is not clear about what this array actually holds.
It maps a driver link index to the IEEE80211 link id, where the index
is the hw_link_id for QCN9274. For WCN7850/QCC2072 it will be the
logical_link_id, which will be introduced in a later change.

Rename it to link_id_map to better reflect its purpose. No functional
change intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 6 +++---
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 7 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 8dcb07773bd1..2826d6016ce8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -418,7 +418,7 @@ ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id)
 	if (!dp_peer)
 		return NULL;
 
-	link_id = dp_peer->hw_links[dp_pdev->hw_link_id];
+	link_id = dp_peer->link_id_map[dp_pdev->hw_link_id];
 
 	return rcu_dereference(dp_peer->link_peers[link_id]);
 }
@@ -546,7 +546,7 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	peer->dp_peer = dp_peer;
 	peer->hw_link_id = hw_link_id;
 
-	dp_peer->hw_links[peer->hw_link_id] = link_id;
+	dp_peer->link_id_map[peer->hw_link_id] = link_id;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -614,7 +614,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	dp_peer = peer->dp_peer;
-	dp_peer->hw_links[peer->hw_link_id] = 0;
+	dp_peer->link_id_map[peer->hw_link_id] = 0;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index d01ef1aea48b..b9c94d6366fa 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -131,7 +131,12 @@ struct ath12k_dp_peer {
 	int peer_id;
 	struct ieee80211_sta *sta;
 
-	u8 hw_links[ATH12K_GROUP_MAX_RADIO];
+	/*
+	 * Maps a driver link index to the IEEE80211 link id. The index is
+	 * the hw_link_id for QCN9274 and the logical_link_id for
+	 * WCN7850/QCC2072.
+	 */
+	u8 link_id_map[ATH12K_GROUP_MAX_RADIO];
 
 	u16 sec_type_grp;
 	u16 sec_type;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index c8e590e5e250..2a0141157426 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2368,7 +2368,7 @@ ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
 				       struct ath12k_skb_rxcb *rxcb,
 				       struct ieee80211_rx_status *status)
 {
-	return dp_peer->hw_links[rxcb->hw_link_id];
+	return dp_peer->link_id_map[rxcb->hw_link_id];
 }
 
 int

-- 
2.25.1


