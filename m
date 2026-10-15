Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE83CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVkyH5fBnno8rvF+QGON+Gu3ek/3SzX0muTsSYISQOE=; b=Vk2FgTPmTDPrV4+4buLQN83OYq
	yOMnF70ips2P7QTXFoR99BJI6MLCmBY+n2So8X/lWJSlvJBrkc/UFB8g200OKNx+N/5rsQvxTQ6KJ
	I9EPr2GUDV5jIrf/I3fO5vIPo2H36+XOFB3lxzka99k6bnXFnn3mGg35cfRQ03NimFNLH2ZXWkc0R
	7oyyMWCf/lz4pvT71RHjmQ2NNwADhtHz7YFJOqe3soDUH/QVz29aFvQwM4v2OvaKgfbdlleFZ0RnG
	VB322iJzyS2dPssbbHyonOmrW4nyUDjryXDDI3h/tyAp8t7UFk4YxIyDkLPl7d14CzTKPnjQqtmho
	TTAhpsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERK-0000000Gtwx-3uGv;
	Thu, 15 Oct 2026 05:55:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERI-0000000Gtvd-1ybl
	for ath12k@bombadil.infradead.org;
	Thu, 15 Oct 2026 05:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HVkyH5fBnno8rvF+QGON+Gu3ek/3SzX0muTsSYISQOE=; b=gMQ90PeV/MklnlTKmL8RL8KiTJ
	dargW6rm8TER4Jt3YBRIT06tPiinEJGEvA8NEDJxVon457icV9kq87g/KJHvQxTsGh4YfAaZmkDPr
	/a8xFA6QItU3QvsTrkSS+Bvw8t4MJ8KCmgJiUyb5XnJPj2FyCi+cXDsHQ7dDOrpKyvJubaxd/wqWQ
	IfmG9mRUkiLqiV7yRyWmpVoCAZoJeGNSNgKP+TMph9VzlpdBe4K0d74VMrR1b8qoQLcUHdEKbSNe/
	Dvf+1j0SyC1SF3yE7/hYDs6KOBN+Hz9Qu9gVhVGbhafygJlTKPvLV0NInaughpiRXiXjlBeJpXgyo
	gdO6o3Ww==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHEQy-0000000HVKV-3RiK
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:55:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1OoGC1707508
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HVkyH5fBnno
	8rvF+QGON+Gu3ek/3SzX0muTsSYISQOE=; b=NhLHR6MCbb0mNC1wLub/2DsJD8t
	hOEip//8Geedm4GOf5AAb4Q/biI8yalrfoycj8nzAwDZDBbiPaJua60ipy6uMmab
	rWvVxU3j66+MYvB9BDivljk+rfpzGsNpEoTnhXx0C4cJtOClBHssRQZFMPiJDP+f
	5PvSPcT2IaOwq5CfYupuRxahQPGGszYaGwQlpt+0fMqB9v5MDLDxIF8uKX7IHl1u
	ksPcspjP1w7TxY6FxH6aUIMGfhXT2SsmDsJ/axxJfZ6Q39ClolE+UwnODkA71pwx
	DKFzLNzp32GJ+8Ws+gu2OVa9YMt/JHj/bJ0oUQKYhva61wKtvFpBvajSjJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54rv6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2342922a91.0
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043715; x=1792648515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVkyH5fBnno8rvF+QGON+Gu3ek/3SzX0muTsSYISQOE=;
        b=PZWNuslynYdfmTzkEGVHfPqBfoFP0vpTBfaTmVmqiSHwf9SyH7yZFdqitKmTwGDyfo
         44ZMJ+KyiWoFFSyGPLG/nfgWc7DfipLuAe/CQiGFnxSNreFmbsSlKKtw56OxlDmFcF9p
         ozhdU4axQqs698dba7uaHotGXxCTsNheBwjVUcLObmqD/J5FA/Yv6kIegYZGXp72Xhkc
         r7gg9fqxQgE1f30uTT5+kHWm3RajnukmrofxTcBp2UxvbrYmEjvTOWTs4g7YI1t65Jvj
         eeGVV6wIXhGyuzNT++whO248Fkvj3HlcfCwchz40e+iBG7zDT0ndutwDRA1+Ey3OCzzO
         7dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043715; x=1792648515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HVkyH5fBnno8rvF+QGON+Gu3ek/3SzX0muTsSYISQOE=;
        b=P7ovCnmsfEqjPFq8Q0+Ec84U7pQ5tfgPBKs3VG1EN2Z5Fk5RJoAxtSaWZYwb4ySwNk
         bgt64TCBNSBUrwY1p9LycVR24SwlJx8UCPCXAjf5E9I4G4ujPnYIl94SNzo9ExgC71K2
         RLsK1+PAYB+iwLlUbvXa1T7P5QEQQT3cFu5mHX/AbNAHLuW9AXQW3u9TuDC5/opNjJjG
         G8Qgh1TZA1Sbvfmw8BocJZEZOOhcJNMvBQArw93Axb1/vvbJe3xmtwWy5wJsJKWaV4X8
         CegbdCrBmhSSDtGsgmZqxEMkfosBL9bH7Z1usFse1fFc6AUKrh4Ow1GjlLoyMCtrRj6e
         DIDg==
X-Forwarded-Encrypted: i=1; AKwUvByt2TpriHbeQLi0N4aqKdrCoO54ZVUe4UIuROd1CY6U3Mg0N9go4JxhJKxAmDwAoyTQRoB/Pbo=@lists.infradead.org
X-Gm-Message-State: AFq9FYLydeLEM4cC2+ZyWsYU/wSc9HQE81yCDoZhflwHGVMXaiXv9jTf
	jdAE8GqvACQTz0R0Bfx/ATKMk+W1GsCaAbxdvKmvErDBZUe6AKti4r0nHsQgoPXvlP6bNmvlh4O
	9DaTbmgcJXZnUl8fn9rHTjjqAilrzp+9AfuDIeeIfF342vmOwItjBWvzgFs2ubcHE
X-Gm-Gg: AYBFou2jN1nKFSQq4iIcX7879oKjXgiVAArGwVspkgAFN6brlTRLURd32w7g7y2Pgbn
	SswyV+lyj6Nmd7zoUrbClTZcgCAaSIOFNg1Pt4SQ2fFg1z7SX9pVj3Vw1RrO+eX860a5rYvu05U
	Htr6QKsUKVhvGUrUpsUDtl/hSUneCY8KcZOU+W68edccq2OWs3zhUINGQCmEUZ4wXP78ns/s0Nv
	KsjOg/n8xVO6TBN2+NtHqt1qy6iFtDHSZWXDtyDMqoChdP9SleyjuKsq3oaG/iPy+sEhk9DsP6Q
	NFV6FbjceQ27pTUfCG5+M9kZXRVdb40uLBhElsB7gIOL36pR/WoY1chMlY9G4GCYfExuG3vkc27
	YNJKx4egf5g9m1j4LxPImZ9aUV6cSz5wadY/0AHdrDDSmM6i6rxkB/bi4DhM6cuWBy29GNO5JD0
	qsnjePYfl6CRr5
X-Received: by 2002:a17:90b:3b41:b0:3ac:9f24:44df with SMTP id 98e67ed59e1d1-3ac9f24469dmr752584a91.2.1792043715096;
        Wed, 14 Oct 2026 22:55:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3b41:b0:3ac:9f24:44df with SMTP id 98e67ed59e1d1-3ac9f24469dmr752561a91.2.1792043714598;
        Wed, 14 Oct 2026 22:55:14 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2629054a91.15.2026.10.14.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:55:14 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 7/7] wifi: mac80211: add MSCS packet classification
Date: Thu, 15 Oct 2026 11:24:41 +0530
Message-Id: <20261015055441.680588-8-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
References: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad06ac4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5lvf6Gdja_tK7i9YIxMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX6GCEUVZbfu/h
 6PrgHthavAD7MgqSdg3xY6kcMK5c1WL6Gew4RZuZL7x+YRzC0t6ox4TeKxIU+BN1B8dOIEoGWBn
 6SrNjBVcy4vbI86PD7YsuFndWjJCLHYmVvoWDnlO7xXWjWIAiiWxIbs8VM1JLH+pHTqcnNxljtI
 Pk40BsLJsm12ZHviOt6AUJ9+ePsyi1p3uEMLN2JH35AzrFX2TWjsa2USzpaHtF6AANQz4G6viEL
 paH07F2pIMTXNg8VO7W+mxe7WhaylJcNZqZOkZSi1KnzH3ZeLhZOZb6C7+vvF7Ch9Yaf09Czee/
 0tLl3S5F+bGFMbL5CCrg4sOGMu8qJrWzfsM20vl7M7QxsHE49120A8v/QwxbRz0lc8sCi5NbRmd
 9/8vAyB0SxpLTrafmt6WI8L3InAFkhJLVVnPuAmy6STY1x4ZD9h5QwM4BUyB7Aa/rm6JvidlYI8
 jfYX5dD3hMno5YXOmDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX0vtwPOPxH2Lj
 psCBzUkSDewuWcjgEFQnm9kB5l6GM+oojDmYFRC5ykO8gOs1R3j1hDp5w0oy/ocx489AABM2oq7
 /GGOKm0yt2G+l2FBBvecdcyesvuVro0=
X-Proofpoint-GUID: 6MujF-dunvQHjnvbQ--xFUDR5Jx3IURr
X-Proofpoint-ORIG-GUID: 6MujF-dunvQHjnvbQ--xFUDR5Jx3IURr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_065521_671691_0FFB2829 
X-CRM114-Status: GOOD (  17.70  )
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

Use the negotiated MSCS configuration to classify uplink traffic and
enforce the configured user priority limit during transmit queue
selection for AP-forwarded packets.

For packets received from an associated non-AP STA, the RX path checks
the received user priority against the negotiated MSCS user-priority
bitmap. When a match is found, mac80211 records an MSCS tag together
with the received user priority in skb->mark.

The received user priority can be associated with a connection by
copying skb->mark to the conntrack mark using nftables. Since the
conntrack entry is shared by both directions of the connection, the
stored metadata can later be restored into skb->mark for corresponding
downlink packets. When such a packet is forwarded to mac80211,
ieee80211_select_queue() consumes the metadata from skb->mark, applies
the negotiated MSCS user-priority limit, updates skb->priority, and
normal queue selection maps it to the transmit TID.

Intra-BSS forwarding requires per-station peer isolation to ensure the
MSCS mark is preserved at transmit queue selection.

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 net/mac80211/rx.c  | 29 +++++++++++++++++++++++++++++
 net/mac80211/wme.c | 23 +++++++++++++++++------
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index ecee9348c70d..930de5b412c5 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1003,6 +1003,31 @@ static void ieee80211_parse_qos(struct ieee80211_rx_data *rx)
 	rx->skb->priority = (tid > 7) ? 0 : tid;
 }
 
+static void ieee80211_qos_mgmt_mscs_set_mark(struct ieee80211_rx_data *rx)
+{
+	struct ieee80211_sta_qos_rcu *qos;
+	u8 tid;
+
+	if (!rx->sta ||
+	    (rx->sdata->vif.type != NL80211_IFTYPE_AP &&
+	     rx->sdata->vif.type != NL80211_IFTYPE_AP_VLAN) ||
+	    rx->seqno_idx >= IEEE80211_QOS_MGMT_MAX_TID)
+		return;
+
+	tid = rx->skb->priority;
+
+	qos = rcu_dereference(rx->sta->qos);
+	if (!qos || !qos->data.mscs_enabled ||
+	    !(BIT(tid) & qos->data.mscs_user_priority_bitmap))
+		return;
+
+	rx->skb->mark = u32_replace_bits(rx->skb->mark,
+					 IEEE80211_QOS_MGMT_MSCS_TAG,
+					 IEEE80211_QOS_MGMT_TAG_MASK);
+	rx->skb->mark = u32_replace_bits(rx->skb->mark, tid,
+					 IEEE80211_QOS_MGMT_ID_MASK);
+}
+
 /**
  * DOC: Packet alignment
  *
@@ -3333,6 +3358,9 @@ ieee80211_rx_h_data(struct ieee80211_rx_data *rx)
 
 	rx->skb->dev = dev;
 
+	if (!port_control)
+		ieee80211_qos_mgmt_mscs_set_mark(rx);
+
 	if (!ieee80211_hw_check(&local->hw, SUPPORTS_DYNAMIC_PS) &&
 	    local->ps_sdata && local->hw.conf.dynamic_ps_timeout > 0 &&
 	    !is_multicast_ether_addr(
@@ -4996,6 +5024,7 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	stats->packets++;
 
 	skb->dev = fast_rx->dev;
+	ieee80211_qos_mgmt_mscs_set_mark(rx);
 
 	dev_sw_netstats_rx_add(fast_rx->dev, skb->len);
 
diff --git a/net/mac80211/wme.c b/net/mac80211/wme.c
index 4d1bad27a8d6..feca08f28185 100644
--- a/net/mac80211/wme.c
+++ b/net/mac80211/wme.c
@@ -126,10 +126,11 @@ ieee80211_qos_mgmt_set_priority(struct sta_info *sta, struct sk_buff *skb)
 
 	qos_tag = u32_get_bits(skb->mark, IEEE80211_QOS_MGMT_TAG_MASK);
 	qos_id = u32_get_bits(skb->mark, IEEE80211_QOS_MGMT_ID_MASK);
-	if (qos_tag != IEEE80211_QOS_MGMT_SCS_TAG)
+	if (qos_tag != IEEE80211_QOS_MGMT_SCS_TAG &&
+	    qos_tag != IEEE80211_QOS_MGMT_MSCS_TAG)
 		return;
 
-	if (!qos_id)
+	if (qos_tag == IEEE80211_QOS_MGMT_SCS_TAG && !qos_id)
 		return;
 
 	guard(rcu)();
@@ -138,11 +139,21 @@ ieee80211_qos_mgmt_set_priority(struct sta_info *sta, struct sk_buff *skb)
 	if (!qos)
 		return;
 
-	if (!qos->data.scs_enabled ||
-	    !test_bit(qos_id, qos->data.active_scs_id))
-		return;
+	if (qos_tag == IEEE80211_QOS_MGMT_SCS_TAG) {
+		if (!qos->data.scs_enabled ||
+		    !test_bit(qos_id, qos->data.active_scs_id))
+			return;
+
+		tid = qos->data.scs_id_tid_mapping[qos_id];
+	} else {
+		if (!qos->data.mscs_enabled ||
+		    qos_id >= IEEE80211_QOS_MGMT_MAX_TID ||
+		    !(qos->data.mscs_user_priority_bitmap & BIT(qos_id)))
+			return;
 
-	tid = qos->data.scs_id_tid_mapping[qos_id];
+		tid = min_t(u8, qos_id,
+			    qos->data.mscs_user_priority_limit);
+	}
 
 	if (tid < IEEE80211_QOS_MGMT_MAX_TID)
 		skb->priority = tid;
-- 
2.34.1


