Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B763606A897
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oQ7KnmvY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/ok9eOa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtkHdf7Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=; b=oQ7KnmvYuoGb62
	8bbf9atlcM12ByJqWiz9T7jYU6vGbBsK1vDCJw2D8GuPr5H2WODUvGqSbUVzq8BLaaSJbGvXmidX0
	XH1+kaM1qKA34vLRnmv11Jk5akPUMp2txb5I4imd/1CEcioCyoHX6m8BMK3ApkS5ayd3TcwFzhsF7
	Qz7MhMV1t/B3e+Cywnu1cy43r+8juRBDLM5hV7Bg6O2lT9fw635KZPQQvv+v6KPTd2wGtiNnVXWbl
	xHWq2JZUxPVqKCGvtvR4CGulfi9qz1+b+SNwL2ygNL2b0ey0zTMNe+ofKFix7sOuOoHBh65ph3KFN
	skOiU1j8b6r9ff1rxE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqC-00000007ZD9-41y5;
	Wed, 18 Nov 2026 02:56:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqA-00000007ZBn-2igu
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtQQ1959667
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sEL7nqXI9Qd
	0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=; b=T/ok9eOaVHZOSaObsnv1EDiZf9W
	YZPCVauwFEdEDRFsaEm99+aQhh28WDR1O9OHHFFNiSPgmKNgMGG8HUVpUU2I1ULa
	05JHm9r22JjrH4sp33uGQiDQHh9YsIneGUgs6Tql2C//VIPuc+LniKvf/HHrgP0e
	dKlDEvJs/roybV368AcXKFYM4XM91UbMD8IL70ZdJMWBxVJadCrOR4d7iRdCLeQB
	zW2Zjk0LLCOj4k8sQ6i9s7lZZTfdOYL9Nq3ugkQlC+sq4PLLiJSYc4ylI/8uZ7U4
	i5VQ4js2iGfcoJxmQlDTqd9+5F/BzB6GKdOHJ960IykSLNbFPuUgGrSJpnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9gthw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee184a2474so4177515ad.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970565; x=1795575365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
        b=OtkHdf7Y0m8v7AYXm+pzNAcHA/g7bFE0PNbaMWoNaKoeWWdx7MhAV57RitADi6qwSA
         c54ljajzVE6exgZHD6db8gRQH+6rod95E0LwDzNmmlGUUZUb4on4Vbgnc/CP+3T+C+0Z
         wnq5OepMn0xZm6qUoOaE2uMF++Zc/t2UxmgP8Ttf63F1SFDm4jtIFmom+TIAJFlgKZZn
         GNs3Qefs9gmuEUYE6cLja9OhSIrVWgJbAggVnSJbJkaKp3Wd3o3yVdK7zFtVYR0X6qbh
         mclteZ8JtL4raCYctfV9ZQADHUsBo9tYuldpNxT75tUX364L/pdmwtdkrHxRc7xZ9pPv
         jC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970565; x=1795575365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
        b=B+j1WNaWb7RwJNaswubPNwQDA8Z0ektocPnJMEtncAR4mbWDgB+RCXTBnjJntSGIBE
         iMXTD68shM+epA+bqAIm7ekBSgi51Y8lhU3hR2vZURoJgHd1pKTEOXP2UMwbWoF1bEtf
         sVzcVkWhHFPAMsPW2Uywz853Puso2zGe8iMjk79ZZKaWaH0obCPNpaTAi4V5hiuxu6p1
         pR1SGjBKtKhBDIdq20FhBz0B025ZChg9wKhFt7QKovb+1Qar1lMb0UB784sPJlWRie6E
         WqlUPK20JKxrZ7kIQ2+M8eE5Yabigfofuw7aBOXz1DP/y9AfSPc5IKDmLccYznwMyssI
         B3Sw==
X-Gm-Message-State: APuU4Z9BIm7H6n7q1ODU7qw7lipGApjsO/HJRFcpYMF6Q+JOL1lsfZsG
	aMO2P3k81yusUgrLIIl4zYMJqrhGG89Ba18b/unY1XpcAEuX4ObkAGGyBbiWPeGxarR4HvB+h7x
	qkV516PDhOv8ysAZSENU2F6b3U94q4pb8hu7DnYn5pTcPJZg7eAqzFKAErEtjF/G4
X-Gm-Gg: AZFdTZd9VizI0keGAe7b1ALNyAfHcryngukOABb7yCgrl3xuUMrB2aUmaPtKo5j0pla
	Xs4uwhaZYWTf6bwtN834orw9usETv7m6gXmSQAnj8wg92D78PnL0w1EIPTN/Gdck2ngSbNrwMrG
	lBefbKsmDfyiyyZpYxX870BPQer4uY3CWD4QlJN/ut71U2amJkd0GGypwWAiBzMn4+b+BYE1k0R
	qjYsBaIGzu4xUyP0OSe3sZRdsZQCQHqRHeffnqOZEDE2DYywo/hv3rzfIVTvfAEf2WkSPOQAZVl
	xzLc70x5hWa5pCLBFNNiT8m10G8uGllihI87X6W/tiZTlV7mcThdsVYPvaF1IA6DSIrhX5m3a5e
	PpjhdBAgv0NbFiV3W7FUHuo8b/t0mltyr0yO8VSH8CXSa/tZgN6sVLWAFLAVeDkX9KA34vofqzl
	4Z7pVI2T6yMw7DST9mADAqj747948Led8=
X-Received: by 2002:a17:902:db0b:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2eff72e5ef3mr12527425ad.16.1794970565442;
        Tue, 17 Nov 2026 18:56:05 -0800 (PST)
X-Received: by 2002:a17:902:db0b:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2eff72e5ef3mr12527215ad.16.1794970564992;
        Tue, 17 Nov 2026 18:56:04 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 3/7] wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link updates
Date: Wed, 18 Nov 2026 10:55:16 +0800
Message-Id: <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd13c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ns_Jbl9W-MFJWGn9c5UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: RVo7vlMF5gYd9zufwsUulOuB1NVKfD8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX00uJYvq0wn0r
 lEGlxO9fzUyaf04Sx+iAUPvamBzLC5Fs2EW+pBVNkZtx9qCl4LlU2OVEOkutwWhfsn3j4QLmiza
 CClFEwjPzcGtePzyHf33NLtB6Tg+sS8Pwh1+ey3B2XZt+zalNt+jPM1bugRbtuHrDwxiAqkPX8F
 Y9emF+S+a3x+1pPc9WeLvVSOvjn35/ihOwQ+bN1Rc6RHHRf5UFGUhZEZK6Mhaf71QCRVI6kfLvh
 xrNPXKXrachJ5XUSmgPmL0njHJvT3Qw0aUTYiF/SJkkvRMGo8HXJefzrhNkXw9pNB4sR+nf5rJR
 BMMSgKKArrW8dcUeLyqORXcWlBLkHD05LXQk9XLMEy1aVdi+X+xuScdw6LgW/9G8abS/f1wmcfb
 SFSZvDkL/cXjz9PjSgjOfbCw8SCb3gIgGndJPmtcfozkj1QnH8Km/RBrRFvho2OFtgO5D6m0Q0o
 +kF8VupvafcUs+EvWlw==
X-Proofpoint-GUID: RVo7vlMF5gYd9zufwsUulOuB1NVKfD8k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfXxXVic7+wnMq6
 J5AJYmtMiICUNPDTb5UwpHA2l7dOKaMZUBW7Tlan+d6mIR6sTtAaoY5pdbzAtt/yzQzqmNSerIy
 DWDHo5HR8dY1Mk4X4CR2RR9MIhmr6XQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185606_693505_D1261ABE 
X-CRM114-Status: GOOD (  17.90  )
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

Currently, ath12k_mac_op_change_vif_links() derives the links to add and
remove from the old_links/new_links arguments: it creates a link vif
(arvif) for each link in ~old_links & new_links and frees the arvif of
each link in old_links & ~new_links.

However, mac80211 invokes drv_change_vif_links() both when the valid
links change and when the active links change. In the first case
old_links/new_links are the valid links. In the second case they are
only the active links, while vif->valid_links is not modified. A link
that is deactivated is therefore reported as removed, although it is
still a valid link of the MLD.

To fix this, derive the arvif lifetime from vif->valid_links, which
mac80211 updates before calling the driver and which an active-link
change leaves untouched. Create an arvif for each link in
valid_links & ~links_map and remove those in links_map & ~valid_links.
A link that is only deactivated keeps its arvif. On disconnect
(valid_links == 0) every remaining arvif is removed. The WARN_ON() for
adding a link that already has an arvif is dropped, since links already
in links_map are not selected for creation.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3f106ac6141c..28cb549b1f46 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	unsigned long to_remove = old_links & ~new_links;
-	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long to_remove, to_add;
 	struct ath12k_link_vif *arvif;
 	u8 link_id;
 
@@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
 			   vif->addr, old_links, new_links);
 
-	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		/* mac80211 wants to add link but driver already has the
-		 * link. This should not happen ideally.
-		 */
-		if (WARN_ON(arvif))
-			return -EINVAL;
+	/*
+	 * Link objects follow vif->valid_links, which mac80211 updates before
+	 * calling us. old_links/new_links only describe the active links and
+	 * must not be used to decide object lifetime.
+	 */
+	to_add = vif->valid_links & ~ahvif->links_map;
+	to_remove = ahvif->links_map & ~vif->valid_links;
 
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 		if (WARN_ON(!arvif))
 			return -EINVAL;
-- 
2.34.1


