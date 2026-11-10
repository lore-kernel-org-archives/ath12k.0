Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FC606A325
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YufBM0RQ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bHs951Mi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyG8RFuY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=; b=YufBM0RQkAJSE2
	HKmb6M5Fpc/j8VOKaKrt6Mqxb9bYpjLQ27YMShw8k3iJ9QBvxRPxmQbCwo9bXKY9l9NxoZCalp2vu
	dFC0137/hs6dZGCMQhidO0DQjfgLsiFUVr/GdFm2uNV91g7AEMDlLp9//6waia3FpGFbcHosYpRJI
	7HOhXlcMy8h2siFLeDvzyPiZZaLuQwXpwLMgNAiAmF9CdrLFamjubR7OJFxabBK3DMKV00aO+vOKC
	wyCx3lOz3oyYTxsN+i0U8lB1Nbmb77zVtzy9lCMI4ogo6bFwSIbCubALMG3h1sVRIKBi7XnQNWSlU
	uGLBWvfRAyJkiznMNHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXC-00000002fmw-2bzB;
	Tue, 10 Nov 2026 06:40:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXA-00000002fky-2VnW
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A8cd2919626
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=; b=bHs951Miik1fGahd
	oDy/CkkZo/OHv95BW3jzPOAoZ2HAcHvpmUrDa7gdZ1Z/EhXwbBODgeEjn/O0lXA8
	M/16Qs8lBjybWKgyn5xV0cGLXf5dtBJNyf2lB83kCubm960Uk9KHn1esWzap9sPr
	3GSxt3PiN7NSi2B6eAdZQ7tdIf1O4a21YWyoMB39zRyv7QRvq8VKij68OerpPRnm
	2QVrDtTcfuskJiZDCVYvi7vCm+XvET0Ez2xzPXcrPfH5uJvZSybyt5cG3IJtQBhm
	nZYFbPvZ03QADGRPmf7g1MdacW2Fi2wuBDXnR1+uY5DWH9I2birU9vo0QdJkKYK6
	9Mr4hw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg24hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2464828a91.2
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292843; x=1794897643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=;
        b=MyG8RFuYMXbUAuyubwO6CsRewhW3tnuBfAmmASHCkOPi7s3pMf/xLFw3tQX2ZvGhZz
         SpPKCWyaJu4c4Xnk9DPW1Wa/D3+dAGhCdLWn9QUccyQw6Tylg+24jg9NI7Hg1FXIpqjc
         GR068FdbPrnShmMJYFSskZVIBsAlowsJ/6WA3skttldrjYnf0aXrK6hngXP+Rh9sBult
         XSvBJ8/o98iBU/mdKL+4mAZ6r+ukAeR55VtWfEYld0oVXvAgLrn0YXjB+1OgHXEKrhlc
         7DNzUP+37AqZGGL51PK0iSGIP3syf4z4J63rsLNeE7oR5oVAxMoylDWurzGJZSGMlH7H
         9iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292843; x=1794897643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vP1FKz476qPEgMnSbLfHx95rUyOQAsNt3V053hzd6o=;
        b=nYbAWNx71Xd7B0NnNRYM69wt0yC2GKmQQD6Xtu8bBycOuLlbcR0rULvi/o7QtE/6I5
         X/JspX8Z3g4RagwkIMhUFsvcutXmNUK47x5QzxTauqOPYtqBgPs3cebfQ8GF51PbQ0HI
         vcnvXh+y7kZkcrO3/JyzzZ7wy8ASNODMthL75RyBbTy5erPjiILmEn2NCUH98mnHHMac
         Ms1agWdIR6AZT8J9wkyCc8Z/Rw1BSb9lOAG/0/0HwuHOyvfYL54zHOgWmz2MGnv6qoqH
         OOZwoj01kGoO1nrsSq1oITnzj+SwgqfiVQggKWzNSC055fVOOPx103AH6XWZDSp1AS8E
         fXGg==
X-Forwarded-Encrypted: i=1; AL+hErGuVNfBUXpG3Y1U8Atwz3NKRCvLJFoPOhp27b+RTX6c98wDHeO6X3R4dWG8MqbF+aOXM7smRak=@lists.infradead.org
X-Gm-Message-State: APuU4Z82MJNqcxRrribluYMstAWlUr6i3cQN6OfoyNJ7ugteoOY+RDRy
	K3SFPkAb3Ag1gg0s3+rmSmwJLgq5o3peG6ZS9QSbR4BOkIwpXnP/6fIWxMjfzvQt9fLmVwMVUQ9
	15s9GX6/NBVUT3WtbGnIk5uUy/JA1mlbBOIb5znv6EbA/jHXdytaz5/MJB32Ullc/
X-Gm-Gg: AYBFou2KtcyuJo3003D6c5X1qDaJ4gjw9i9NyfCQISx/wgxxXj8IKBvhqk4Giz15y0h
	v4kBJYttIaWVXtZWEKOOohm7W9Ubau635sFXYrRLv/YNEE073uhMuQ1VqV1BYxT7upcoH1KOsr6
	vYWxaJWu3ovE42dOBw8Y6r/2TIa7tMEZY/bhxw1rqUc6vPipaXjQaQ9ZWVdcHoMyTGpGIrt7vf5
	NhADL1O61txGfA5n+245Im1plNWvWJ0n0/W7Q4n6PpJ0glvb42OZ/4N2uCDi/xCKIbebGwb97F1
	wHD/DZeLYehP6g+sW1VZpRtiMSMMURRbbwswyvibVvjx3u8Y4EbdjAS0DPMH6fD4M0N97KkXN7C
	egnklzpFkw6OPY1ZIFJtLUX5pAVcO94eFoBALtVFphtoYlCHO9OLgDTHXXQ97CUjWlOGv8Pr4Ng
	/Nf680lezaytzC1TqgA1yi7RUU6DuPlw==
X-Received: by 2002:a17:90b:1c90:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b166cdad2bmr2202494a91.51.1794292842561;
        Mon, 09 Nov 2026 22:40:42 -0800 (PST)
X-Received: by 2002:a17:90b:1c90:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b166cdad2bmr2202481a91.51.1794292841989;
        Mon, 09 Nov 2026 22:40:41 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:41 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:24 +0800
Subject: [PATCH ath-next v5 03/11] wifi: ath12k: rename
 ath12k_dp_peer::hw_links to link_id_map
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-3-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXzz2FV8M+6lXK
 1G0OrJqg6mJmY6sZRnOxNh8ZgRlRAl+eAO8uXeAGqZZCwt2nzCgjkoBzfE1pJzpOucz8dDBQ8eg
 NpC/S4x+m2iMVIRureDqkjpjGxAfL0xX1YidrjfPuWzPpTKFkD5F6+yi2u8chIvBy+c4l47sKA2
 VrqNtWY9M0qQ7EeY4rQEjf1b4JQ6+Jxc9cZ8iiJdFypJ5sJy8byzBWgdF1z256SBq5HfiVcI3kT
 YeM+qwMIUVxS1G08PEC5mLJQ8kwnKN5O/aoDB9owyyYcuG15oGtpKztHSMsoR5Qe3G2Zh4jTbiN
 jQ6tgeaQQ7F2REcKZo9Zp3Nl7CebfzbMYRMDiyatiXUMyf8SA75H3pJQK3OSoLBooMpcN4s2V3W
 zObGBu2lgnVJXy7TCCzxuc4rWp2eT/u00WnNUdH6tfODTknVvWCm/XTcDi0fQZuyg8JnsUYTiIc
 oi421fCCraQ2z9YPIag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX3jJzF15PiJ2F
 gGXaosSKVCWO15HUYk4z/nbwC8pV7NF5j3T2qr9lWwhjuZNh+5/xHfZCHbsacGmegseUjurw6U9
 6C1n1qfjsc86gJlDBLCD3o9FS/mYRX8=
X-Proofpoint-GUID: YTGqnO585c7Z8mBvCz_Ra_085G3bUE1t
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2bc6b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=niLHlN7IhEeuoKN5US8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: YTGqnO585c7Z8mBvCz_Ra_085G3bUE1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224044_764796_4CE0156C 
X-CRM114-Status: GOOD (  16.60  )
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

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 6 +++---
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 7 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 102e67109ab0..aec30e010de5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -418,7 +418,7 @@ ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id)
 	if (!dp_peer)
 		return NULL;
 
-	link_id = dp_peer->hw_links[dp_pdev->hw_link_id];
+	link_id = dp_peer->link_id_map[dp_pdev->hw_link_id];
 
 	return rcu_dereference(dp_peer->link_peers[link_id]);
 }
@@ -545,7 +545,7 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	peer->dp_peer = dp_peer;
 	peer->hw_link_id = hw_link_id;
 
-	dp_peer->hw_links[peer->hw_link_id] = link_id;
+	dp_peer->link_id_map[peer->hw_link_id] = link_id;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -613,7 +613,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
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


