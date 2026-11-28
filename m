Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55374606A68E
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HVKiV63A;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=GX5CRug+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uPspllEpba4GJzDMv8SswcqcP0cPwF7UGnWVw7zSJFI=; b=HVKiV63A9FxwXJ
	xPzyiZIph5bh+9P0lSqR4TKfTku2WC3xHkkVS38uRW/yIQv0ydPqkZsmz093x/yxEL/zhyp85Rcc+
	d0iM1NRTLHRIZL8NmpnylAvaYZNlojsQpHUE5cptGXWx5kxvXdPDy1VS3jrmojpuW+ceap9fz412G
	WXUmg0fEeCwMxpPR4qBijgY/d1Hlo8LsEZzL8nSFpcHfPwpqH6xgq2HUVImfopBad0Td0uzoeGISN
	1wf4bjmQBj5JWyRjpyr2NstMMbWK7EIlUuKT9bq0YjGrIw5YyWNvsze8bgzX/+oEbK5IBXvAA2mEs
	5eciSpaQb0VeGnIpoFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM83-000000010xm-09wv;
	Sat, 28 Nov 2026 17:22:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM7w-000000010rp-33aO
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c5198302d38so764891466b.0
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886539; x=1796491339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPspllEpba4GJzDMv8SswcqcP0cPwF7UGnWVw7zSJFI=;
        b=GX5CRug+m1GipmDJqfTx1cu2op3x4qKN6chXpHWjxsHJ2V732V82kY7K3YFdaP3EAG
         WOKUvsil1p09tUkA+OCJd6otKWg8/mKu3qX1ZJgO2DebvRwSmeI3qTSMqjb1rpMH6AxB
         b3XSFLtgKFM9r195I9jEg/Psafi8yt0l94tY1Nc90hDEaNzaOrJXbleJO9nt8/vgYkNn
         /dbTKJjelty6P60qGmFxs4moWv12+OxRCK6/jw+9/DRypitUOeBm8L+FjrpabmGHR3o+
         VyVJssaqUoCY/kOysaWpqI27YOYRyJv83kFVtRZnDd7RhJZPZ5ZmJv5Q+WWcC0gsGJ1K
         Sz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886539; x=1796491339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPspllEpba4GJzDMv8SswcqcP0cPwF7UGnWVw7zSJFI=;
        b=iuxfHClSto+mr2yjhzvFzAxltb26UTLOBwUHDxkMEIyZdQd1ywGyIz35uakQTjZBsQ
         gpSFEmooq6bfcca7eMFs6/0N6wmyj0GejUTafvnmtNTg9u3JRkUEEaoOrEdcJphWmBW/
         FHMbjU1yAreAH6wwtZJywH75Fw0vIvYJO965boFIcif5WUo78Vm39Gw65iqy0Wv+fC3s
         8bCiYxhHumWvHeosYqmbpB9dH85lfURbQMuDckVI6kjMWHDm+vPsgQ9Sumjrdloe2Qml
         ke/EOuy5R/LDOwMg+7oT75pkMTh7x130P9U2MLJU5EY4zW1+vW/EK0ZR/NA412LkRSMy
         5ZMA==
X-Forwarded-Encrypted: i=1; AL+hErGp5hEdY07jPiK5jsIg642q+I9k0KC3MxWAajiQ7tJOtJC4tmoyB5PBA/e7+LM9Bzj7nKAvKCI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+5D4+DoAtf9Br0/zvC/3TozQGwfcFCMqNDjtime9W3MvVpyYq9
	hQ6DLgZUCXdU811VnaVUznJKdUgAV60O6+HxE2caGpb7YaHjUg/j0CJerlKDZNr1oA==
X-Gm-Gg: AZFdTZcDwlj/VauwyLeNaSgmrefBwqySgp177w3e+H/DLOdLOw9Eb1YLzoWL+PNeToR
	0pGKd8WuoqyTxT4HqRLA9vJaIMctJf4Xad/e3gWqxoclIoaCPpdzUSdyosZmnrsZGmXff6GdES8
	AAk6ySJUAKaJO22VYc6t38dELaXEcZaiLpleC+pY2s/1UYkNZq6QZgKIKTeLKfNUYAoPh6HUmiZ
	BwN++N5/04UB4mdupXpUqqa0akKRvx85HoKR+9bw+w4h8IVkSoZFddewPsI1ca2+xcmPKVzCMgz
	wRO4oNiAVfn6ekXvO3zWynuW7vZT0SwKt5QHlCS/gWEs/eWpfmrkamSrluvcfXYFgBr03fMJubU
	7DKPqAriW0w0FzDc0RCEsjFbpz0uXDmQWptjWppMe4sQAvX7y4fdtUSw9X677UVNJbeZBdBS5YX
	1UOoqMDTdzObvKsnyBSs07c2dvHjostIyBuvW9U3TJlYclQjG6dUaQMYyqQMmPsN06KR+9RglTK
	PFAF4wXFH5jTmSBZ4ALvV3nCaER0TotvOJOQKTOObG6AiRnM1WdIsg61WsVPRCiCjMq6mP2TOcl
	6DTPBn7skC1Lar/ZzUcl2zbg8CTtroTS6VIfQ+rEjhR4IhnllCvwEq4Xtrp6k+7rJfFwC9TyQyw
	SjdO8Vh7/SA/qkNOPWs6hEZpUOCVc4N22hbJOViwwNO9g9/bFOWrbwE2W5pJgKpcbgRMBxokiiZ
	uaG/I+nmlpr4L1hAP2GcS5r565ixrRzAI9B7ZJLJbxGDXaLblAEFtEpjTYIotIv5Lrc7dHnt6xz
	e0E5hkgjgT4mkfTaWoQ7bOr3mT9vXxPJ00crRTmssIC08u23Nhp5qvj420Hl8oXkJMnk9Jcc7f4
	EM04D+SFAN8MYg==
X-Received: by 2002:a17:906:c29a:b0:c4c:bff4:200c with SMTP id a640c23a62f3a-c513a893bc3mr1652561466b.32.1795886539042;
        Sat, 28 Nov 2026 09:22:19 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:18 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next v2 1/6] wifi: ath11k: only trust the RX checksum of a frame the hardware checked
Date: Sat, 28 Nov 2026 18:22:15 +0100
Message-ID: <20261128172220.922376-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092220_836513_069E4AA5 
X-CRM114-Status: GOOD (  20.57  )
X-Spam-Score: -2.1 (--)
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

ath11k_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the attention TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, and a TCP or UDP frame whose headers it did not
parse within the first 256 bytes. An IP fragment carries only part of
the datagram its checksum covers.

The descriptor also describes only the MSDU the hardware received. A
frame that ath11k_dp_rx_h_defrag() reassembles from 802.11 fragments
keeps the descriptor of its first fragment, of which only the MSDU
length is rewritten, so the flags say nothing about the payload of the
later fragments. With raw decap (frame_mode=0 or crypto_mode=1) an
A-MSDU reaches mac80211 as one MPDU; when it spans several RX buffers
and ath11k_dp_rx_msdu_coalesce() moves it into a larger buffer,
ieee80211_amsdu_to_8023s() hands that skb, ip_summed included, to the
last subframe.

The stack then skips the checks it would make: icmp_rcv() takes the
checksum as verified, and reassembly keeps CHECKSUM_UNNECESSARY when
every fragment carries it, so a UDP datagram that arrives in IP
fragments is never checked. By the code this holds for every ath11k
chip and frame mode and for any frame an associated peer sends.

The MSDU start TLV carries the flags that say what the hardware parsed:
TCP, UDP, IP fragment, and whether the fixed IP header and the TCP/UDP
header were parsed. Mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, and both headers were parsed, and never for
a reassembled 802.11 frame or a raw A-MSDU;
ath10k_htt_rx_get_csum_state() already leaves a frame that is neither
TCP nor UDP to the stack. The flags sit in a different descriptor
layout on each chip family, so add a hw_ops accessor for the MSDU start
word that holds them.

Found by an LLM review (Claude) of the code.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: also leave a frame reassembled from 802.11 fragments and a raw
A-MSDU to the stack (Sashiko); discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 61 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c    | 22 +++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..a2c359cc8e92 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1860,18 +1860,75 @@ static struct sk_buff *ath11k_dp_rx_get_msdu_last_buf(struct sk_buff_head *msdu_
 	return NULL;
 }
 
+static bool ath11k_dp_rx_h_is_raw_amsdu(struct ath11k_base *ab,
+					struct sk_buff *msdu)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ab, rxcb->rx_desc) !=
+	    DP_RX_DECAP_TYPE_RAW)
+		return false;
+
+	/*
+	 * Neither an MPDU the hardware delivered as several MSDUs nor a frame
+	 * too short to tell is taken as a single MSDU.
+	 */
+	if (!rxcb->is_first_msdu || !rxcb->is_last_msdu)
+		return true;
+
+	if (msdu->len < sizeof(hdr->frame_control))
+		return true;
+
+	if (!ieee80211_is_data_qos(hdr->frame_control))
+		return false;
+
+	if (msdu->len < ieee80211_hdrlen(hdr->frame_control))
+		return true;
+
+	return *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_A_MSDU_PRESENT;
+}
+
 static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 {
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	struct rx_attention *rx_attention;
 	bool ip_csum_fail, l4_csum_fail;
+	u32 info2;
 
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rxcb->rx_desc);
 	ip_csum_fail = ath11k_dp_rx_h_attn_ip_cksum_fail(rx_attention);
 	l4_csum_fail = ath11k_dp_rx_h_attn_l4_cksum_fail(rx_attention);
+	info2 = ar->ab->hw_params.hw_ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
+
+	msdu->ip_summed = CHECKSUM_NONE;
+
+	/*
+	 * The descriptor describes one MSDU as the hardware received it. A
+	 * frame reassembled from 802.11 fragments keeps the descriptor of its
+	 * first fragment, and mac80211 splits a raw A-MSDU into subframes the
+	 * descriptor does not describe one by one.
+	 */
+	if (rxcb->is_frag || ath11k_dp_rx_h_is_raw_amsdu(ar->ab, msdu))
+		return;
+
+	if (ip_csum_fail || l4_csum_fail)
+		return;
+
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check. It checks the
+	 * TCP or UDP checksum of a frame whose IP and TCP/UDP headers it
+	 * parsed; an IP fragment does not carry the whole datagram the
+	 * checksum covers.
+	 */
+	if (!(info2 & (RX_MSDU_START_INFO2_TCP | RX_MSDU_START_INFO2_UDP)) ||
+	    (info2 & RX_MSDU_START_INFO2_IP_FRAG) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_FIXED_HDR_VALID) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_TCP_UDP_HDR_VALID))
+		return;
 
-	msdu->ip_summed = (ip_csum_fail || l4_csum_fail) ?
-			  CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
+	msdu->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
 int ath11k_dp_rx_crypto_mic_len(struct ath11k *ar, enum hal_encrypt_type enctype)
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..096366b85849 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -272,6 +272,11 @@ static u8 ath11k_hw_ipq8074_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.ipq8074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.ipq8074.msdu_start.info2);
+}
+
 static u8 ath11k_hw_ipq8074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -449,6 +454,11 @@ static u8 ath11k_hw_qcn9074_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.qcn9074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.qcn9074.msdu_start.info2);
+}
+
 static u8 ath11k_hw_qcn9074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -626,6 +636,11 @@ static u8 ath11k_hw_wcn6855_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
+static u32 ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.wcn6855.msdu_start.info2);
+}
+
 static u8 ath11k_hw_wcn6855_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -914,6 +929,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -954,6 +970,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -994,6 +1011,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1034,6 +1052,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1074,6 +1093,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_wcn6855_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
@@ -1114,6 +1134,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1155,6 +1176,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..8725e119707b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -249,6 +249,7 @@ struct ath11k_hw_ops {
 	u32 (*rx_desc_get_encrypt_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_decap_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mesh_ctl)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_msdu_start_info2)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
-- 
2.53.0


