Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DADC9830D
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVHTqP8zfo0aIiUJzfx87sJgU+I1m7auf3WAygPSkaI=; b=lXnvzpxg9djiESryI9BeutR0Me
	RTBEPlz5ZO5l4z2pyPhdkpxj38o9SGuJnzrCeBoGlx6AeB2mq3RMkAbrvESzXbDeTby0itflNpF9h
	XGzd0mhRQWZx9Cx2S/yrgFmaLhjOsEeiGbuurVzOYkyYIW+N2eUFeBsdfORslYcAmjUHgu80YE8Th
	bZBWA525ScKx9xcrNajfw3sx44sBEOzXltYDAwicHChIw13KguZAoit6igHK15h+zHp7Cp0buUEeq
	I3FZAP8NO/5ekjmacMd70QfFfiCv75I0p45AYG+qNZr9Fj+U/WrXgbee0AX/STK3WIdj0BNsGD7/B
	OHLLIOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yD5-0000000Cfpi-3Eub;
	Fri, 25 Sep 2026 05:10:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yD3-0000000Cfof-1pUo
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 05:10:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z3GK1194765
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wVHTqP8zfo0
	aIiUJzfx87sJgU+I1m7auf3WAygPSkaI=; b=fCIB1si8FDu+06SeCamYHf0lbe/
	NgbW3vFl+uJ2dN/xO2WXZsg13gA6+hDhME7lLPGReDWd1SELQLF8G9bakIvJdYHL
	L0WqkkqUeKAcnyx0LtNFkGMStHkQTI85Yb+IF/h+zf/veJjoB5gCJNGj9aajCXgk
	IZbr+3m2opJ3C1yWzrPAIZnN4FeEk9/tKQwiDe9/mMCK6hPTD/4SEflGU3VH4Wsu
	E9mYdngnr9Tl7TVxeIn1F3v1dmBvZSBcTM017Kwg3EctOSHJpq1qSmaChBcRYeLu
	M/XQU+1YDn4U0gcK1D62mLeOSOnHM3FLU613djmbEIoMAb5d9qy/ARkSn+g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874j3cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:10:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so848691eec.1
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 22:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790313056; x=1790917856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVHTqP8zfo0aIiUJzfx87sJgU+I1m7auf3WAygPSkaI=;
        b=LnTz5JW1SiezxVF9utEHTVlZRH1c1n1WwB7kLhq2C35qUr2e5GeWILOr3bB3AY4sGo
         /BPWmNm/VKg3oVGncahvEwD4tGTcqAuy+oWaOvskGBTwKx8DTv/0B7tsB5cc58wQOGWE
         0lU+9mMYtxyzrKGV7Dr1IdXP2UUFYRJcT/p4sa4QJk/khJB60jxLoF3GQh+3dDaF+cIP
         n4k9ZmmuNIhYjf5pUh0h1gEQJN0BLJxx60kkS3L7TcbfZxn40Ty4al0mwqhYwQB+uXZg
         g88rx/rMYVxTHbz8H89C6uEXDeEb+sCWrOLPsX2MbFgwugBUbcXV695d7YxZFxgjfm0z
         CGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790313056; x=1790917856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVHTqP8zfo0aIiUJzfx87sJgU+I1m7auf3WAygPSkaI=;
        b=i9LXCI9XPgurg4eVgIWPj5aRBEFKH65rcoIj+YED5RGnmbLS3lpFIaggTryd+SjivE
         w7wtyR4+bXedA9jF6PQjsJeLPWIGHtGABwcFQSkgN5/abnWmBdDMNFJbwLdhWOx0vgPs
         h1q0W5TBzsiFCCkwn2nDsqM5vpW2WkFAzQKyyjCApWJL4QKNIKnsuhgHjqHWlXs7UyZD
         TZIQOQAOgsrDI3UNeZCQqFi5aebNjtWhzxYWg6tJH1Q6JdTaSUT1HZ0MKhj1EodUQ/TN
         UC6OXzh3nVw9/wvBzCoCfOqszNPcIxR0a5xwggYX+pYhAkEHBVVStUBn2GWlenkV1Fxs
         YGwg==
X-Gm-Message-State: AFuF++lPIT56KPK4qWakM4u7xvvbhTSP6BXuZnrjoI02EjkgXKwbMo2k
	SzlK/Md+afjyxTNyPh2oHIn7/JLg36nCFzN087FKm6NOm1DmawSCXjxlws9f4iv2NgT9NUzvr76
	QrLgW6ByzaPiifDEI3gh+adXYe1TFW7qnvkpcEi/4mqrDMa/wtHemivnzThd1kFN/9ZKOjhPQ
X-Gm-Gg: AYBFou1LHDxT2q/V3vpL4GdGD3hR5hBhQ22vr2Oa9yeomD0pj+MoJGzEuRSUSjMHoYo
	whdqOLv3se9fEWF4DHSXoXPQy3NkPOq3ewFhSlCGbjR/d4NEGgT3Q3RdViKzeJftel8ZCO5KUMh
	8BJnOL4gWn8ma/CS56Te4QHrW3EFHHqFOktbhmvlegPDmmEyM3KQFNQZ5tirBhxciLh/t2s9Z03
	noBWTuqG6Tf/pPpAffLMoBmAa+TOjoEiuTRPPQGEAl2lty41IPnLFNqrBvJxooBNP24b0N22bWz
	w9jqhaS7V25xTOW8a2C6EQ4CQnmskzuaC9jJM/Mm9kz3YFCM3pcCUuyGXEmCps1fif6CzGXhZ7H
	hBxVjhYL5LP3H9jer2PyMnYrDAE+nHUBuII1KS5PHhEr8F4q/GZS4GgIwV6ba11xcJTrZkvET36
	8z3n7sz1VxWzpsLg==
X-Received: by 2002:a05:701b:4286:10b0:143:2968:564d with SMTP id a92af1059eb24-14503fde4dcmr3781998c88.27.1790313053927;
        Thu, 24 Sep 2026 22:10:53 -0700 (PDT)
X-Received: by 2002:a05:701b:4286:10b0:143:2968:564d with SMTP id a92af1059eb24-14503fde4dcmr3781901c88.27.1790313051374;
        Thu, 24 Sep 2026 22:10:51 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm2955163c88.5.2026.09.24.22.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:10:49 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: store station pointer only in dp_peer
Date: Fri, 25 Sep 2026 10:40:35 +0530
Message-Id: <20260925051036.2838210-2-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
References: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NCak4TC5XgjX_mP74TESdJhE8-29Bi_Q
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab60260 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5RRWBY4WAAAA:8 a=cu01E5ucpjk0LvgyI4cA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=drtMOSl5Q_Tsf-UZi3mY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMCBTYWx0ZWRfXxgbA9l1pj54F
 +zQZI7D2KWaFyJYDvxexl21mpyQ80//Ctw1VILtRaUXaU9cbyfGVfcF4Ja1tZtx6tKYxLdh4CDd
 5t15/z1SXI81P41WFTKvjQRuGXBTKbsWE/aZgT/b77m+OloxTnkfQk4CjBWRAQWFTKhXNdU9XhC
 Vp204GUCr9BGT4c8u1rGycDh6rQs1vK3GoILIDULt+2FTxfbwR9xWHjZ5z0beBNt4xc2Q0fLn84
 HPOnaVLejjJjFt5b0q9P3zQVDjsQVtfxq3QNMvOSJe0p9fpNU+i/+WiAaDvjOzS/3IDjQ0QnzS6
 zC2iEDMvjUAidOPUBUtMPYZVU71fvM0IRIuiPSyyMaXhM6PBrfzOPtWLixpbQbismHQqWzMvDfU
 4VX3HcWQ93+H1GZ+Yt9ErFapIxWYkSGvPyNcgARnF+ZwiUeWi1/guTpLwmCT21gZiA+g+YoAv23
 J4pwH2vnkTEr6ljxvOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMCBTYWx0ZWRfX5n4qiuqlt3ku
 MEtyJP2pfdrf0UB4Ts0xbSX4Q7EX6mg+zOD8v5yOt7DnAGO/PDgltnHfR54zh/tDlJTDfkkaejX
 ln3oj9ZJMMgWz0OApD4A9JMZn6EWs90=
X-Proofpoint-GUID: NCak4TC5XgjX_mP74TESdJhE8-29Bi_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_221057_496702_162360C5 
X-CRM114-Status: GOOD (  18.59  )
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

The station pointer is currently stored in both ath12k_dp_peer and
ath12k_dp_link_peer. Since the station association is peer-wide rather
than link-specific, keeping a copy in the link peer duplicates state
without providing additional value.

Remove the duplicate pointer from ath12k_dp_link_peer and access the
station through the dp_peer instead. Add helper accessors and
update the remaining users accordingly. Remove the unused
ath12k_dp_link_peer_to_link_sta() helper as well.

This consolidates peer ownership information in a single location and
avoids maintaining duplicate state.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 -------------------
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 16 ++++++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 11 +++----
 drivers/net/wireless/ath/ath12k/peer.c        |  2 --
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++++-----
 8 files changed, 30 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 68968f96b4f1..72069640bd38 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -276,7 +276,7 @@ ath12k_update_per_peer_tx_stats(struct ath12k_pdev_dp *dp_pdev,
 	rcu_read_lock();
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, usr_stats->peer_id);
 
-	if (!peer || !peer->sta) {
+	if (!ath12k_dp_link_peer_get_sta(peer)) {
 		rcu_read_unlock();
 		return;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index bb5341b4251a..06f6eccfb574 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -195,35 +195,6 @@ void ath12k_dp_link_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_
 	spin_unlock_bh(&dp->dp_lock);
 }
 
-struct ath12k_link_sta *ath12k_dp_link_peer_to_link_sta(struct ath12k_base *ab,
-							struct ath12k_dp_link_peer *peer)
-{
-	struct ath12k_sta *ahsta;
-	struct ath12k_link_sta *arsta;
-
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "ath12k_dp_link_peer to ath12k_link_sta called without rcu lock");
-
-	if (!peer->sta)
-		return NULL;
-
-	ahsta = ath12k_sta_to_ahsta(peer->sta);
-	if (peer->ml_id & ATH12K_PEER_ML_ID_VALID) {
-		if (!(ahsta->links_map & BIT(peer->link_id))) {
-			ath12k_warn(ab, "peer %pM id %d link_id %d can't found in STA link_map 0x%x\n",
-				    peer->addr, peer->peer_id, peer->link_id,
-				    ahsta->links_map);
-			return NULL;
-		}
-		arsta = rcu_dereference(ahsta->link[peer->link_id]);
-		if (!arsta)
-			return NULL;
-	} else {
-		arsta =  &ahsta->deflink;
-	}
-	return arsta;
-}
-
 static int ath12k_dp_link_peer_rhash_addr_tbl_init(struct ath12k_dp *dp)
 {
 	struct ath12k_base *ab = dp->ab;
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index 3503840b0329..256fc79d714e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -70,7 +70,6 @@ DECLARE_EWMA(avg_rssi, 10, 8)
 
 struct ath12k_dp_link_peer {
 	struct list_head list;
-	struct ieee80211_sta *sta;
 	struct ath12k_dp_peer *dp_peer;
 	int vdev_id;
 	u8 addr[ETH_ALEN];
@@ -159,8 +158,6 @@ ath12k_dp_link_peer_find_by_ast(struct ath12k_dp *dp, int ast_hash);
 struct ath12k_dp_link_peer *
 ath12k_dp_link_peer_find_by_pdev_and_addr(struct ath12k_dp *dp, u8 pdev_idx,
 					  const u8 *addr);
-struct ath12k_link_sta *ath12k_dp_link_peer_to_link_sta(struct ath12k_base *ab,
-							struct ath12k_dp_link_peer *peer);
 int ath12k_dp_link_peer_rhash_tbl_init(struct ath12k_dp *dp);
 void ath12k_dp_link_peer_rhash_tbl_destroy(struct ath12k_dp *dp);
 int ath12k_dp_link_peer_rhash_add(struct ath12k_dp *dp,
@@ -183,4 +180,17 @@ ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id);
 void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer);
 int ath12k_dp_peer_fixup_peer_id(struct ath12k_base *ab, const u8 *peer_addr,
 				 u16 peer_id);
+
+static inline struct ieee80211_sta *__must_check
+ath12k_dp_peer_get_sta(const struct ath12k_dp_peer *peer)
+{
+	return peer ? peer->sta : NULL;
+}
+
+static inline struct ieee80211_sta *__must_check
+ath12k_dp_link_peer_get_sta(const struct ath12k_dp_link_peer *link_peer)
+{
+	return link_peer && link_peer->dp_peer ?
+		link_peer->dp_peer->sta : NULL;
+}
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 41ac0a4072ae..af3b861aae02 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1383,7 +1383,7 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	peer = ath12k_dp_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
 
-	pubsta = peer ? peer->sta : NULL;
+	pubsta = ath12k_dp_peer_get_sta(peer);
 
 	if (pubsta) {
 		if (pubsta->valid_links) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..c04b4e2709b3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1232,7 +1232,7 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 	spin_lock_bh(&dp->dp_lock);
 	list_for_each_entry_safe(peer, tmp, &dp->peers, list) {
 		/* Skip Rx TID cleanup for self peer */
-		if (peer->sta && peer->dp_peer)
+		if (ath12k_dp_link_peer_get_sta(peer))
 			ath12k_dp_rx_peer_tid_cleanup(ar, peer);
 
 		/* cleanup dp peer */
@@ -7012,10 +7012,9 @@ static void ath12k_mac_station_post_remove(struct ath12k *ar,
 
 	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id,
 							 arsta->addr);
-	if (peer && peer->sta == sta) {
+	if (peer && ath12k_dp_link_peer_get_sta(peer) == sta) {
 		ath12k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
 			    vif->addr, arvif->vdev_id);
-		peer->sta = NULL;
 
 		ath12k_dp_link_peer_free(peer);
 		ar->num_peers--;
@@ -13299,6 +13298,7 @@ ath12k_mac_validate_fixed_rate_settings(struct ath12k *ar, enum nl80211_band ban
 	bool eht_fixed_rate = false, he_fixed_rate = false, vht_fixed_rate = false;
 	const u16 *vht_mcs_mask, *he_mcs_mask, *eht_mcs_mask;
 	struct ieee80211_link_sta *link_sta;
+	struct ieee80211_sta *sta;
 	struct ath12k_dp_link_peer *peer, *tmp;
 	u8 vht_nss, he_nss, eht_nss;
 	int ret = true;
@@ -13328,8 +13328,9 @@ ath12k_mac_validate_fixed_rate_settings(struct ath12k *ar, enum nl80211_band ban
 	rcu_read_lock();
 	spin_lock_bh(&dp->dp_lock);
 	list_for_each_entry_safe(peer, tmp, &dp->peers, list) {
-		if (peer->sta) {
-			link_sta = rcu_dereference(peer->sta->link[link_id]);
+		sta = ath12k_dp_link_peer_get_sta(peer);
+		if (sta) {
+			link_sta = rcu_dereference(sta->link[link_id]);
 			if (!link_sta) {
 				ret = false;
 				goto exit;
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 80edebf0e364..0e894408e97f 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -266,8 +266,6 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	}
 
 	peer->pdev_idx = ar->pdev_idx;
-	peer->sta = sta;
-
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		dp_link_vif->ast_hash = peer->ast_hash;
 		dp_link_vif->ast_idx = peer->hw_peer_id;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index ded7d56cd79b..eb69fe70c2b4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -3367,7 +3367,7 @@ ath12k_wifi7_dp_mon_srng_process(struct ath12k_pdev_dp *pdev_dp, int *budget,
 
 		rcu_read_lock();
 		peer = ath12k_dp_link_peer_find_by_peerid(pdev_dp, ppdu_info->peer_id);
-		if (!peer || !peer->sta) {
+		if (!ath12k_dp_link_peer_get_sta(peer)) {
 			ath12k_dbg(ab, ATH12K_DBG_DATA,
 				   "failed to find the peer with monitor peer_id %d\n",
 				   ppdu_info->peer_id);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 7c12dba4cc51..449984adc20a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -559,13 +559,12 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_dp *dp,
 	}
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, peer_id);
-	if (!peer || !peer->sta) {
+	status.sta = ath12k_dp_link_peer_get_sta(peer);
+	if (!status.sta) {
 		ath12k_dbg(ab, ATH12K_DBG_DATA,
 			   "dp_tx: failed to find the peer with peer_id %d\n", peer_id);
 		ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
 		goto exit;
-	} else {
-		status.sta = peer->sta;
 	}
 
 	status.info = info;
@@ -634,7 +633,8 @@ static void ath12k_wifi7_dp_tx_update_txcompl(struct ath12k_pdev_dp *dp_pdev,
 	int ret;
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
+	sta = ath12k_dp_link_peer_get_sta(peer);
+	if (!sta) {
 		ath12k_dbg(dp->ab, ATH12K_DBG_DP_TX,
 			   "failed to find the peer by id %u\n", ts->peer_id);
 		return;
@@ -642,7 +642,6 @@ static void ath12k_wifi7_dp_tx_update_txcompl(struct ath12k_pdev_dp *dp_pdev,
 
 	spin_lock_bh(&dp->dp_lock);
 
-	sta = peer->sta;
 	ahsta = ath12k_sta_to_ahsta(sta);
 	arsta = &ahsta->deflink;
 
@@ -759,6 +758,7 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	struct ieee80211_rate_status status_rate = {};
 	struct ath12k_dp_link_peer *peer;
 	struct rate_info rate;
+	struct ieee80211_sta *sta;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -853,7 +853,8 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
+	sta = ath12k_dp_link_peer_get_sta(peer);
+	if (!sta) {
 		ath12k_err(ab,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
@@ -861,7 +862,7 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 		goto exit;
 	}
 
-	status.sta = peer->sta;
+	status.sta = sta;
 	status.info = info;
 	status.skb = msdu;
 	rate = peer->last_txrate;
-- 
2.34.1


