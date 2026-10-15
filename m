Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3738CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrZ7pS6mbpk4r0IGtTFGbpHRa6q6oKGx2PFvB8mp39Q=; b=LXoFq0WmLQR9hdxT67kNKrl5r1
	F0e9QG9ZDGyA68LwuRaPztsgxKPGwSL/Y2NAC/ca0M9JJhDmsJHkAe1iwcjTsUj3NKauoptqVt1dG
	bqi1GVZMFl09euWE3+lwJVqXnDQwgQgs3LBJfneMv+4GG4GC40466qne9ju+Qo9ImyvrT2ZkO2rs0
	tC4iTgcCG+fNDwVnhlzv/MNVUu05VxPja9dIJDwZVz48p2A8vRrsC2H/nfKoVcMItuKyC2uqEFJZ5
	QR+u7u/I7wzPne3YhF1YhudJyDBrteYSgqH+xlcADgeobgZ7mEX+XY0RnKb7qngcyKLqP1c8H+v9c
	IEX0uM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERB-0000000GtsD-02HC;
	Thu, 15 Oct 2026 05:55:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHER6-0000000GtqZ-1K1g
	for ath12k@bombadil.infradead.org;
	Thu, 15 Oct 2026 05:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NrZ7pS6mbpk4r0IGtTFGbpHRa6q6oKGx2PFvB8mp39Q=; b=bshLCgYIQgP63WrTAMvX1ceUWq
	PULQxEJbwk7QrbZn8oGpf5bcfCgARjXkgQ0nUGyzOZ5YAh3KG407dSz5xZCZNYg+aETNZDZqYmsqR
	/tuxex85PtBJ0CUu74GjZbv6Mml4Jam6aIDOiYnyVuHe2GAgBbiavua2NZBgNrm24y9vBKzXhe3w7
	TizoZCGwx9b6vqFVqQQlVix8KK1o1jym/MgZmrkhvQnq3fD7Zt1vytYtwEcn4UC0QCJ5lIdevBuhv
	zyP+rGqxpovi5Z/Y9B1G1OTn7cYMFOEx/1VCuVPKZWNHPw9mtUuMAgzIYyjExK4MmgXIU4XY1ko+X
	TxnzyXiA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHEQs-0000000HVKE-1191
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:55:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENRJXU586430
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NrZ7pS6mbpk
	4r0IGtTFGbpHRa6q6oKGx2PFvB8mp39Q=; b=C5Gmhn7apcIWjmDrVfTFQLLrq/0
	TztHmmRIPyBtpyy6veAa0Z1GRo+6EN8RtzPqffnxcpjPbc5OabTZHF3Xr9+E/NxF
	p/Y5zYD2ECexg+gfZrImFi8y5fT2Q0rt4V2FPKuq5JPkOEFKCxoHqom0wPl5fXq1
	eypHjCFlB0lgIaAGyLq5M82mYv723H9ry2g3b/6pbZJMDdypP4dzwLzQ8fZShkga
	wSp6D0jDEPojzfj7WZT3n4rdMnFAxLhB0DRTRpt5fGYO27tuWFSTIXsn5BNe2xD1
	uyBlzzlQmFZqTrseFaaTkQQTotxkb1ovPb/FLAdJDR1M8bz8JD5Oh+h6KEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdes64w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so3319396a91.0
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043712; x=1792648512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrZ7pS6mbpk4r0IGtTFGbpHRa6q6oKGx2PFvB8mp39Q=;
        b=KEsgj6CItghUbsn9Ssd4nXY4IoCQ1N5SqHOmymsu1Bost2ruJc/w1DELUrLjCVEOH1
         cQsusbfaurOED+ro3+ccvk+8LQUS1/eDpCn+5IodskRgbwYRpkt39NyUoVBlHpYW6Eyi
         QqdtHpd0EkvVn2hIM2iQnng92Y3RVlcToiyGMheKp9Z1mAYjSX73Tr6RK85QWpjOEsU0
         wuU7w5nPSaqk4BUTLYJlRU6wNyK7JkkfNi3hFaoMZubOp0lEyhHZiHl+Pr3Ti18f72Lh
         Psz334jhs3jwbLcHvbgS68rA3CjtaPZLKgeywTC/IKhRhSlTYLx9M/idAw4TUf/fKlZW
         oAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043712; x=1792648512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrZ7pS6mbpk4r0IGtTFGbpHRa6q6oKGx2PFvB8mp39Q=;
        b=1uG7+64cLqyTObNJGu11AnQ6quzkLjc29CRtnggtCG6OUs4gu7GuQV1/k9du0TgvCI
         FZTxC8Ah4NAq0Mm9ApAm95YgMUjRBVDXUlGJoM9QK2IbnPD+BqP+2mjHr5ny2JkCgcwk
         WKJPHienb/Btpjlw0jTI5a4I1FxEO2E/emyBDotzTKinVMUOCTfGBsgkGjX7M3s3hXcv
         nv5WORcY+RavPju0BuuqUxRbJcnPa2jAdAbPb6X50ys5/Chan7PGHVZ2Ig/FB1aMISDW
         XGveV/QNZRorUrvmqyiKWGdipAGYgGiv0bd6/doOF+bQG5gCPQerEsE+COm2nh12fo81
         kWOQ==
X-Forwarded-Encrypted: i=1; AKwUvByaze5FMGc7JlF63lXqynqjLfE1IYJQPiAwRPrcDAKC+BwdZ5vtf5tktXhLCm5lGmoHdSsPg5w=@lists.infradead.org
X-Gm-Message-State: AFq9FYIFs/37LGjHVTfa+NLG453tqAMZhmucL7QylJbGjQtQXlVX6DMJ
	gJ/2CgbogayTKxtyGzuF5Bl36wr5TdyuZU+IcmEiJ1qIogZtuWZSyCaIiKro+T0dDGQXFBKyLZa
	y0Cqhqah4D+1rpvf1U4VFAUfLrqBOQJ7pWlxlVBq0weqLtDhnif+3jOaQqAvAaoh/nOwoI6jj
X-Gm-Gg: AYBFou3hgeFGRBnpLOkQPODEkbgmjTqFPlvMEdZxlR00XpSpziWSif2RgSKt/jlJZsa
	V78HAAYyj45ySWr124wobHiSXil3s5+sbtxqP2lXzxDpEPbrmRVSnPZBAz90l/6v/f+jsq/vXyJ
	qRBK+WQPbNe/gaQifiT4zOAZ3U1KMEqNt+X9Wx8XXeO4Ed2EQLb1DCYdYDYAmigslcT5rKOnQ3g
	xmibFwuh3h7ekg6Z0wGyPntZPfA/etSsxsIKfymDzbD5tAXooS3DVIay31vpfwzD0nknB6n88ni
	aVKrGCDDnE2UTcn7vYxWIGQ/FT6EJhNqrY/E3NdfKnuYU1Tjg3kwVXmUa9LZodxlxOoJRdxT9O9
	/2r2elVsELobINvyal332IEjDHGodLH5Y9CE4/HFh4jqCVfFrtojUXoQK/pcmx+s3nCORMw/OJ2
	mZCyredG/HA0qm
X-Received: by 2002:a17:90b:5343:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ab3a94f0dcmr14760155a91.14.1792043711377;
        Wed, 14 Oct 2026 22:55:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ab3a94f0dcmr14760142a91.14.1792043710825;
        Wed, 14 Oct 2026 22:55:10 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2629054a91.15.2026.10.14.22.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:55:10 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 6/7] wifi: mac80211: map SCS packets to configured TIDs
Date: Thu, 15 Oct 2026 11:24:40 +0530
Message-Id: <20261015055441.680588-7-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
References: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad06ac0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DUI1IGLppgL3m5rRpvMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 73py985BG21AcZ3rnR4pW1bBuZUaYflV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX6Zq0C1iBnfiM
 hdQWnELeAPx6fOOLs97QpXKbjB3jj7xPggArrN6FaQTQguoNGN85PU+MnYV5fSDEr3AxujHSn++
 78drrnROs3ezKhIPbQkhnkTXtITDHbqHE7JLwiglRCTbWM30Uwf7GfWsx+5/w6V9RNsU9UDZlpZ
 KHTBpTj+l+d1fxlgbBrMxxJemTcqXu5c+gaNOlCW3vbrdGeNNFllOrcxXIDD+eOw4mFTUa4AI5l
 4lbzFxJCXP0ibDZg9EzyUgKlt8bOjVra0kTbXj0UJw5C34fjRrla7YGBnDAvcKUiZ9t/BW8N7xf
 kvLUbbAaSKEpWuHii3u3qVBii/tfCOl/pirFffVdfsQzOyi5SW9JxjkECVe9ojQgHxiETsDhQ73
 3B67O0Pm7AXR8sjvbYM1qAUDHSlOg1C9zNh8P8HK2Oqe00yVD9/z988GceCs3sCluARJm+9A2op
 TiZrKgpQ4v3NaGQMLnA==
X-Proofpoint-GUID: 73py985BG21AcZ3rnR4pW1bBuZUaYflV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX9kDv0/hFYz/d
 QeBjbPnfD4tnpQjxTf3E29qSdjrblx3ory1e6V3Pt2NvIIr2tel/O6TeEPT0cEFr51Z1MXAk0sv
 s6kbtCzIeKImmrA25kA9vA0sU4xCm1M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_065520_202522_D77B5814 
X-CRM114-Status: GOOD (  18.01  )
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

Use the negotiated SCS descriptor-to-TID mapping when selecting the
transmit queue for packets carrying QoS Management metadata.

The low 16 bits of skb->mark are used as private QoS Management
metadata. Bits 0-7 carry the IEEE Std 802.11-2024 element ID for the
respective QoS Management descriptor: WLAN_EID_SCS_DESCRIPTOR (185,
0xB9) for SCS and WLAN_EID_EXT_MSCS_DESCRIPTOR (88, 0x58) for MSCS.
Bits 8-15 carry the negotiated SCS identifier.

During transmit queue selection, look up the negotiated SCS state for
the station and apply the corresponding TID mapping.

SCS identifier zero is reserved and is rejected before accessing the
RCU-protected per-station QoS state.

hostapd programs nftables rules on the netdev egress hook to maintain QoS
Management metadata in the conntrack mark and to copy it into skb->mark
before packets reach mac80211 transmit queue selection, for example:

 nft add rule netdev qos wlan0_wifi_qos meta mark set ct mark

This nftables rule copies the conntrack mark (ct mark) into skb->mark on
egress, allowing the negotiated SCS state to be applied during transmit
queue selection.

The conntrack mark is restored into skb->mark at the final egress hook,
after earlier L3 policy-routing decisions have completed. mac80211 first
checks the QoS Management tag and then validates it against the
per-station state, so SCS metadata is used only when SCS is enabled and
the marked SCS ID is active. Packets without a matching tag or active
descriptor, including ordinary non-SCS traffic, are ignored by this
path.

Intra-BSS forwarding requires per-station peer isolation to ensure the
SCS mark is preserved at transmit queue selection.

This implementation depends on the corresponding hostapd and nftables
configuration that populates the conntrack mark with the QoS Management
metadata.

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 include/linux/ieee80211.h  |  1 +
 net/mac80211/ieee80211_i.h | 14 ++++++++++++++
 net/mac80211/wme.c         | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 66f9ebe79c61..f235059cbebd 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1821,6 +1821,7 @@ enum ieee80211_eid_ext {
 	WLAN_EID_EXT_SHORT_SSID_LIST = 58,
 	WLAN_EID_EXT_HE_6GHZ_CAPA = 59,
 	WLAN_EID_EXT_UL_MU_POWER_CAPA = 60,
+	WLAN_EID_EXT_MSCS_DESCRIPTOR = 88,
 	WLAN_EID_EXT_EHT_OPERATION = 106,
 	WLAN_EID_EXT_EHT_MULTI_LINK = 107,
 	WLAN_EID_EXT_EHT_CAPABILITY = 108,
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 63391a1fd9c6..aa36289b3ae4 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -80,6 +80,20 @@ struct ieee80211_mesh_fast_tx;
 #define IEEE80211_DEFAULT_MAX_SP_LEN		\
 	IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL
 
+/*
+ * TODO: Synchronize this skb->mark encoding with the userspace application
+ * (hostapd). These values reuse IEEE element IDs, but their use in skb->mark
+ * is an implementation contract between hostapd/nftables and mac80211.
+ */
+/* skb->mark bits [7:0] carry a QoS Management protocol tag. The values
+ * match the IEEE Std 802.11-2024 element IDs for the respective descriptors:
+ * WLAN_EID_SCS_DESCRIPTOR (185) and WLAN_EID_EXT_MSCS_DESCRIPTOR (88).
+ */
+#define IEEE80211_QOS_MGMT_TAG_MASK	GENMASK(7, 0)
+#define IEEE80211_QOS_MGMT_SCS_TAG	WLAN_EID_SCS_DESCRIPTOR
+#define IEEE80211_QOS_MGMT_MSCS_TAG	WLAN_EID_EXT_MSCS_DESCRIPTOR
+#define IEEE80211_QOS_MGMT_ID_MASK	GENMASK(15, 8)
+
 extern const u8 ieee80211_ac_to_qos_mask[IEEE80211_NUM_ACS];
 
 #define IEEE80211_DEAUTH_FRAME_LEN	(24 /* hdr */ + 2 /* reason */)
diff --git a/net/mac80211/wme.c b/net/mac80211/wme.c
index 1601be576414..4d1bad27a8d6 100644
--- a/net/mac80211/wme.c
+++ b/net/mac80211/wme.c
@@ -113,6 +113,41 @@ static u16 ieee80211_downgrade_queue(struct ieee80211_sub_if_data *sdata,
 	return ieee802_1d_to_ac[skb->priority];
 }
 
+static void
+ieee80211_qos_mgmt_set_priority(struct sta_info *sta, struct sk_buff *skb)
+{
+	struct ieee80211_sta_qos_rcu *qos;
+	u8 qos_tag;
+	u8 qos_id;
+	u8 tid;
+
+	if (!sta)
+		return;
+
+	qos_tag = u32_get_bits(skb->mark, IEEE80211_QOS_MGMT_TAG_MASK);
+	qos_id = u32_get_bits(skb->mark, IEEE80211_QOS_MGMT_ID_MASK);
+	if (qos_tag != IEEE80211_QOS_MGMT_SCS_TAG)
+		return;
+
+	if (!qos_id)
+		return;
+
+	guard(rcu)();
+	qos = rcu_dereference(sta->qos);
+
+	if (!qos)
+		return;
+
+	if (!qos->data.scs_enabled ||
+	    !test_bit(qos_id, qos->data.active_scs_id))
+		return;
+
+	tid = qos->data.scs_id_tid_mapping[qos_id];
+
+	if (tid < IEEE80211_QOS_MGMT_MAX_TID)
+		skb->priority = tid;
+}
+
 /* Indicate which queue to use for this fully formed 802.11 frame */
 u16 ieee80211_select_queue_80211(struct ieee80211_sub_if_data *sdata,
 				 struct sk_buff *skb,
@@ -179,6 +214,7 @@ u16 ieee80211_select_queue(struct ieee80211_sub_if_data *sdata,
 	qos_map = rcu_dereference(sdata->qos_map);
 	skb->priority = cfg80211_classify8021d(skb, qos_map ?
 					       &qos_map->qos_map : NULL);
+	ieee80211_qos_mgmt_set_priority(sta, skb);
 
  downgrade:
 	return ieee80211_downgrade_queue(sdata, sta, skb);
-- 
2.34.1


