Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB0606A31A
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nj/Nfbj0;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=LZ7bVsG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kZAWfOVV6szfbsnxGNpL1TPV/6g7LyK5WV+tYnXzkHs=; b=nj/Nfbj0L8+aad
	4RL6Zy3vHpuSKMDseyAALCbWLeFYZ7BWfxUjONT3WcPoPSvS7Qr/dKWC7EgjDIXJE1Ivi0W11iVvg
	N1MZSUHr6Kz5CwHhWgM80hMOABdAhjvoqg+mHILFVcPyzrB9ucpm/TF8TtrzBrPEQu+4G8Z8pXWJI
	K1xEOXO7AnRzGCPLBBZ3oWAjwlbS6z3PfCay1XPxBaZqd0Tu4WpFXHd1ADhF9GSavTOsOx9j9Hhse
	tzf/15uVIXA+DvQ72B3lhELQ8VenIvnkE/qb81mjbTCC593et9RGOjUJcgEFMhUygXRo/hm3yc197
	TgRe7dWVMizYar6NI4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUR2-00000003dMU-3djP;
	Mon, 23 Nov 2026 13:50:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUQy-00000003dI1-2OsX
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 13:50:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so4047534a12.2
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441815; x=1796046615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZAWfOVV6szfbsnxGNpL1TPV/6g7LyK5WV+tYnXzkHs=;
        b=LZ7bVsG5U+yphhK5LmR8uj5F8Si8C9TZvMrhkN0Qdz4DkNw1J8JPfRVpGpxeKSummu
         BUPZGodNZN/pI0Jc0m64aDe5c5GnI630DKOLdKXVyWmA6pdEGTn/KgHyi6p1vL/4k99q
         HF5cdWwmDHGwnyaUpdWuEznJGZL17DyWqQ7c3lNw55ryd3RoYalxyWrd/NJbDdmwNpRf
         bf+9oI6JrwqRDC/+L35ZEh0GRObRn0aCZ2L24UkN5IbYJwv5FcJI5Eh5M/gbyAfv8kBm
         8MkMSVnkq0V/dx6ILcdluDaEEfcguzuMraADQBCVmPGPtOWRbB7UNG4Ht/vL66mqp6AC
         KLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441815; x=1796046615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZAWfOVV6szfbsnxGNpL1TPV/6g7LyK5WV+tYnXzkHs=;
        b=L8Ji4Nbqq4CBzZ7c8M0C/5n5SH9ZGd8NU8XEQWx+7sZYRjicSz9X4dPAbRuuDJuUU1
         Sd59NzPR416yvc9LZQbALZfWmofW/yTznnc+r9EGG9V/zxoTZh3rE9Q87KcqtcitwSpQ
         Hcroh2j6V8JHOcjaZWgdT6IijeQM+YNGW2L3rHgu+nZLz8aMnbdrIxc7OftpnqBmrVQ6
         Ya40T8hIfW900D3N2uaRHA0BZi+LeKwyU/oRd0NUDVeZqLU+ShwtaCfNfQy+pNRsm4Jr
         HIBGSkmgQ42vBfAe+O+CfI9NXotgBsKkEWf8y05RGHxSbvqfOpx0mUsoRsKThsJSl7B0
         CmCA==
X-Forwarded-Encrypted: i=1; AL+hErHLO56O9MLQOP1YTF79ZU0ELJ3O2K3B1/VzbkcTUucfh/qZlNuxU2olpAw9vmR9B12f7yQ+rkA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/NbQwCTvQIcnxaboRnYPBpB195woZfBxb30palg6MZJf9US4wk
	hN/kxGlPQ9yMZGBQ1XSt3/vZsekXEhKKuu9jUopSpA3y3acxN1BMZHYRHKFT+OxJBA==
X-Gm-Gg: AZFdTZcRKHUN1Wn2Rr2u05ya7dP2De5rZWNFRtZX46xs086zN3IgJioJXxAeeyqH6Mv
	rvq5fV+F0hpzQT9+EhoGETBPLFR7WBFzcpNPWtylH54N7U62sok8FNWK6WgRDWhUjxen/rI1U/X
	zJStZGnii4fSkRtvHMt3vappEQ6+OPpKGXbjSpUBP9dc4TUOh655chZOjUzdmep0Gm707xTrLU+
	PkjojjqEHVJM12Lac3t6jRfjBk+J9XzIj1W62sW4ot8dagtKfQoz+9kotRbDrbY/TVMUlcwoTAz
	IByUb/URf00Pb4P0litYDkay8K3ERuY8Kiff2/p+hVjj0x1Ut18tBDbuY8gvYQo3NWVxP/j0+qM
	fVtzXkkWgq4iVIDSEvM2Sufbspxn+4yo8l1gpnc/Pz2qUectGSNGqHZ0roxiZ+SIsqFpl3N5SZ8
	3e4hm5tL4DnDmSvOj0gO5YyxuWYvjG+XjWIq6AQeSD1+fgPGnC1PM3LyrcUJVYMexl94I5wJkRU
	lJ5EhEBD1gZuR4SY1eWTw00z2Rt25PL53U7F43hyuXE/Ksa4Ly0ixqzyRmbZGrGetNi3OHdJSOk
	cyB7kKBRRhnJWKZmEAmbv99t8gq7Ib4Mj1IeWo9LWxFCczh3IZKnUVG0MiH2pzD2zv2ZI7jYG4X
	uv8yX0tw8sNO4JMPcib4fiJ3KPKk+N8vR920uaRL7ujVkkPVl79gKZh/7PlCDgQh5VlgnnzAWqJ
	GN5QP+r0fCU67IvzozW+CuSPOmw97b3sdzZ1n2z81qiVSsemrivS3Ylhgyj/iXb5OQpw49nnhA1
	w39vRpP2++lZQ31Hd8qPUSheJ+37DqWw/25Bn2yilW+lBhg+saAL2UBvZU+fPAX4wjk+pXa/+8Y
	zrk9DYRetCDSKmKH3Y01mtNGhEqPRPCbTI5nHLkUyfvFCOLhEj9eOWog1217MmGvjGscDSCOCym
	4bED2koPiyW9/vByb5Ds=
X-Received: by 2002:a05:6402:1941:b0:6ba:7bee:e0b0 with SMTP id 4fb4d7f45d1cf-6ba7beee4dfmr4339768a12.8.1795441814619;
        Mon, 23 Nov 2026 05:50:14 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:14 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 3/3] wifi: ath11k: merge the TCP segments of a station in a REO reap
Date: Mon, 23 Nov 2026 14:50:10 +0100
Message-ID: <20261123135010.721107-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055018_038807_F65C8477 
X-CRM114-Status: GOOD (  27.76  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every MSDU the REO ring hands over goes to mac80211 on its own:
ieee80211_rx_napi() runs the 802.3 receive path for it (the station and
its fast_rx, the station and netdev counters, the control port check,
the internal forward lookup) and passes it to napi_gro_receive(), where
the TCP GRO of the netdev parses it again and merges it into the
aggregate it was building. For a TCP upload of one station at
850 Mbit/s that is about 70,000 frames a second through all of it. In a
profile of such an upload routed by an IPQ8074 (one run), the GRO
functions (dev_gro_receive(), tcp_gro_receive(), inet_gro_receive(),
tcp4_gro_receive() and their helpers) take 7.9 % of all samples and the
mac80211 802.3 receive path 5.2 %.

Merge the consecutive segments of one TCP stream of one station and TID
of a reap in the driver, as GRO on the netdev would merge them, and
hand the run to mac80211 as one GSO frame. A run is opened by a plain
ACK segment, and joined by the next segment of the same stream with the
same receive status, Ethernet header, IP and TCP headers but for the
ID, sequence and checksum; any other frame ends the run before it is
handled itself, so the frames of a stream keep their order and no frame
waits behind another stream's. The run ends at a segment that pushes, a
short one, the GRO size of the netdev and its segment bound, and at the
end of the reap; nothing is held across reaps.

The checks that decide how mac80211 takes a frame stay per MSDU, since
the run is built from MSDUs after ath11k_dp_rx_process_msdu() and
ath11k_dp_rx_h_mpdu(): only a frame that goes the 802.3 path to a
station on its own merges (Ethernet decap, unicast, a peer with a
station, not EAPOL, not of a 4-address station, one buffer, a checksum
the hardware verified, no FCS or MIC error), and the PN and decryption
status every segment had is the one of the run, which is the same for
all of them. Every segment has the Ethernet header of the run, so the
source address mac80211 sees is the one each segment carried. A mesh
interface has no decap offload in ath11k and is not merged. mac80211
counts a GSO frame as its segments.

The form is the one GRO on the netdev the station's frames reach would
build, so nothing after it changes: none with GRO off or an XDP program
there; a frame list when the netdev has rx-gro-list and no socket of
the host takes the stream, as tcp4_check_fraglist_gro() and
tcp6_check_fraglist_gro() decide; else a frame with fragments, whose
segments give their buffer to the head through skb_try_coalesce() and
free their skb. GRO takes a frame list it is handed whole and a TCP GSO
frame as its segment count.

The station of a run is used within the NAPI poll that looked it up,
as ath11k_dp_rx_deliver_msdu() uses the station of its frame. Frames
take the 802.3 path only with Ethernet decap, the frame_mode=2 module
parameter; with the native Wi-Fi default nothing is merged.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h    |   3 +
 drivers/net/wireless/ath/ath11k/debugfs.c |   4 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 444 +++++++++++++++++++++-
 3 files changed, 450 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 6b05b2e4d926..d1fdc0593d38 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -903,6 +903,9 @@ struct ath11k_soc_dp_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
+	/* runs of received TCP segments merged into one frame, their segments */
+	u32 rx_merge_aggs;
+	u32 rx_merge_segs;
 	struct ath11k_soc_dp_tx_err_stats tx_err;
 	struct ath11k_dp_ring_bp_stats bp_stats;
 };
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index b936101d6fa5..870e00ec7569 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -705,6 +705,10 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 soc_stats->hal_reo_error[2],
 			 soc_stats->hal_reo_error[3]);
 
+	len += scnprintf(buf + len, size - len,
+			 "\nReceived TCP runs merged into one frame: %u, their segments: %u\n",
+			 soc_stats->rx_merge_aggs, soc_stats->rx_merge_segs);
+
 	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
 	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a85edaf19bfb..062281dfbae6 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -10,6 +10,8 @@
 #include <linux/kernel.h>
 #include <linux/net.h>
 #include <linux/skbuff.h>
+#include <net/inet6_hashtables.h>
+#include <net/inet_hashtables.h>
 #include <net/page_pool/helpers.h>
 #include "core.h"
 #include "debug.h"
@@ -2854,8 +2856,9 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 		   !!(status->flag & RX_FLAG_MMIC_ERROR),
 		   !!(status->flag & RX_FLAG_AMSDU_MORE));
 
+	/* a merged frame has only its first segment's bytes in its head */
 	ath11k_dbg_dump(ar->ab, ATH11K_DBG_DP_RX, NULL, "dp rx msdu: ",
-			msdu->data, msdu->len);
+			msdu->data, skb_headlen(msdu));
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
@@ -2987,6 +2990,439 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	return ret;
 }
 
+/* The headers of a TCP segment in an Ethernet frame. */
+struct ath11k_dp_rx_tcp {
+	struct ethhdr *eth;
+	union {
+		struct iphdr *ip4;
+		struct ipv6hdr *ip6;
+	};
+	struct tcphdr *th;
+	u16 hdr_len;
+	u16 payload;
+	bool v6;
+};
+
+/*
+ * A run of consecutive segments of one TCP stream of one station, merged
+ * into the first one's skb as its fragments, or chained on its frag_list
+ * with their headers when @flist, and what the next segment has to be to
+ * join it: @status is the receive status every segment of it had, and a
+ * segment that does not join ends the run before it is handled itself.
+ */
+struct ath11k_dp_rx_merge {
+	struct sk_buff *head;
+	struct sk_buff *last;
+	struct ieee80211_rx_status status;
+	struct ath11k_dp_rx_tcp t;
+	u32 next_seq;
+	u32 max_size;
+	u16 last_id;
+	u16 mss;
+	u16 segs;
+	u16 max_segs;
+	bool fixedid;
+	bool flist;
+};
+
+/*
+ * Whether @msdu takes the 802.3 path of ath11k_dp_rx_deliver_msdu() to a
+ * station of its own, on its own: a unicast frame of the Ethernet decap type,
+ * of a peer whose station ath11k_dp_rx_h_mpdu() found, not EAPOL, not of a
+ * 4-address station, in one buffer.
+ */
+static bool ath11k_dp_rx_merge_ok(struct ath11k *ar, struct sk_buff *msdu)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+
+	if (!rxcb->sta_valid || !rxcb->sta || rxcb->is_mcbc ||
+	    rxcb->is_eapol || rxcb->is_frag || rxcb->is_continuation)
+		return false;
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rxcb->rx_desc) !=
+	    DP_RX_DECAP_TYPE_ETHERNET2_DIX)
+		return false;
+
+	return !READ_ONCE(ath11k_sta_to_arsta(rxcb->sta)->use_4addr_set);
+}
+
+/*
+ * The headers of @msdu when it is a TCP data segment of an IPv4 or IPv6
+ * frame that carries nothing a merge would lose: one buffer, a checksum the
+ * hardware verified, no VLAN tag, IP options, extension headers or fragment,
+ * a length that is the frame's, a unicast destination, and the flags of a
+ * plain acknowledgment that may push.
+ */
+static bool ath11k_dp_rx_merge_parse(struct sk_buff *msdu,
+				     struct ath11k_dp_rx_tcp *t)
+{
+	unsigned int len = msdu->len, thoff, thlen;
+	u8 *d = msdu->data;
+	struct tcphdr *th;
+
+	if (skb_is_nonlinear(msdu) || msdu->ip_summed != CHECKSUM_UNNECESSARY ||
+	    len < ETH_HLEN + sizeof(struct iphdr) + sizeof(*th))
+		return false;
+
+	t->eth = (struct ethhdr *)d;
+	if (is_multicast_ether_addr(t->eth->h_dest))
+		return false;
+
+	if (t->eth->h_proto == htons(ETH_P_IP)) {
+		struct iphdr *iph = (struct iphdr *)(d + ETH_HLEN);
+
+		if (*(u8 *)iph != 0x45 || iph->protocol != IPPROTO_TCP ||
+		    (iph->frag_off & htons(IP_MF | IP_OFFSET)) ||
+		    ETH_HLEN + ntohs(iph->tot_len) != len)
+			return false;
+		t->ip4 = iph;
+		t->v6 = false;
+		thoff = ETH_HLEN + sizeof(*iph);
+	} else if (t->eth->h_proto == htons(ETH_P_IPV6)) {
+		struct ipv6hdr *ip6h = (struct ipv6hdr *)(d + ETH_HLEN);
+
+		if (len < ETH_HLEN + sizeof(*ip6h) + sizeof(*th) ||
+		    ip6h->version != 6 || ip6h->nexthdr != IPPROTO_TCP ||
+		    ETH_HLEN + sizeof(*ip6h) + ntohs(ip6h->payload_len) != len)
+			return false;
+		t->ip6 = ip6h;
+		t->v6 = true;
+		thoff = ETH_HLEN + sizeof(*ip6h);
+	} else {
+		return false;
+	}
+
+	th = (struct tcphdr *)(d + thoff);
+	thlen = th->doff * 4;
+	if (thlen < sizeof(*th) || thoff + thlen >= len)
+		return false;
+
+	if (!th->ack || th->fin || th->syn || th->rst || th->urg ||
+	    th->ece || th->cwr || th->urg_ptr)
+		return false;
+
+	t->th = th;
+	t->hdr_len = thoff + thlen;
+	t->payload = len - t->hdr_len;
+
+	return true;
+}
+
+/*
+ * Whether segment @t of @msdu, received with @status, follows the run's last
+ * one as GRO on the netdev would take it: the same station, TID and receive
+ * status, the same Ethernet header, IP header but for the ID, ports,
+ * acknowledgment, window and options, the next sequence number, an IP ID
+ * that goes up by one or stays with DF set, and room under the size GRO
+ * stops at. A frame list takes no segment that pushes, as GRO's does not.
+ */
+static bool ath11k_dp_rx_merge_fits(const struct ath11k_dp_rx_merge *g,
+				    struct sk_buff *msdu,
+				    const struct ieee80211_rx_status *status,
+				    const struct ath11k_dp_rx_tcp *t,
+				    bool *fixed)
+{
+	const struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	const struct ath11k_skb_rxcb *hcb = ATH11K_SKB_RXCB(g->head);
+	const struct ath11k_dp_rx_tcp *h = &g->t;
+	unsigned int optlen;
+
+	if (g->flist && t->th->psh)
+		return false;
+
+	if (rxcb->sta != hcb->sta || rxcb->tid != hcb->tid ||
+	    memcmp(status, &g->status, sizeof(*status)))
+		return false;
+
+	if (t->v6 != h->v6 || t->hdr_len != h->hdr_len ||
+	    t->payload > g->mss || ntohl(t->th->seq) != g->next_seq ||
+	    g->head->len + t->payload >= g->max_size ||
+	    memcmp(t->eth, h->eth, ETH_HLEN) ||
+	    memcmp(&t->th->source, &h->th->source, sizeof(__be32)) ||
+	    t->th->ack_seq != h->th->ack_seq || t->th->window != h->th->window)
+		return false;
+
+	optlen = t->hdr_len - ((u8 *)t->th - (u8 *)t->eth) - sizeof(*t->th);
+	if (memcmp(t->th + 1, h->th + 1, optlen))
+		return false;
+
+	if (t->v6)
+		return *(__be32 *)t->ip6 == *(__be32 *)h->ip6 &&
+		       t->ip6->hop_limit == h->ip6->hop_limit &&
+		       !memcmp(&t->ip6->saddr, &h->ip6->saddr,
+			       2 * sizeof(t->ip6->saddr));
+
+	if (t->ip4->tos != h->ip4->tos || t->ip4->ttl != h->ip4->ttl ||
+	    t->ip4->frag_off != h->ip4->frag_off ||
+	    memcmp(&t->ip4->saddr, &h->ip4->saddr, 2 * sizeof(__be32)))
+		return false;
+
+	if (g->segs > 1)
+		*fixed = g->fixedid;
+	else
+		*fixed = ntohs(t->ip4->id) == g->last_id;
+	if (*fixed)
+		return !!(t->ip4->frag_off & htons(IP_DF));
+
+	return ntohs(t->ip4->id) == (u16)(g->last_id + 1);
+}
+
+/*
+ * Gives the run what the TCP GRO of the stack gives its own aggregate: the
+ * length of the IP packet, and the size and number of its segments; for
+ * one with fragments the pseudo-header sum its checksum is finished from by
+ * whoever segments it, while a frame list keeps the checksum of each segment,
+ * which the hardware verified.
+ */
+static void ath11k_dp_rx_merge_complete(struct ath11k_dp_rx_merge *g)
+{
+	struct sk_buff *skb = g->head;
+	struct ath11k_dp_rx_tcp *t = &g->t;
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	unsigned int thoff = (u8 *)t->th - skb->data;
+	unsigned int l4len = skb->len - thoff;
+
+	if (t->v6) {
+		t->ip6->payload_len = htons(skb->len - ETH_HLEN -
+					    sizeof(*t->ip6));
+		shinfo->gso_type = SKB_GSO_TCPV6;
+	} else {
+		__be16 len = htons(skb->len - ETH_HLEN);
+
+		csum_replace2(&t->ip4->check, t->ip4->tot_len, len);
+		t->ip4->tot_len = len;
+		shinfo->gso_type = SKB_GSO_TCPV4;
+	}
+
+	skb_set_network_header(skb, ETH_HLEN);
+	skb_set_transport_header(skb, thoff);
+	shinfo->gso_size = g->mss;
+	shinfo->gso_segs = g->segs;
+
+	if (g->flist) {
+		shinfo->gso_type |= SKB_GSO_FRAGLIST;
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+		skb->csum_level = 0;
+		return;
+	}
+
+	if (t->v6) {
+		t->th->check = ~csum_ipv6_magic(&t->ip6->saddr, &t->ip6->daddr,
+						l4len, IPPROTO_TCP, 0);
+	} else {
+		t->th->check = ~csum_tcpudp_magic(t->ip4->saddr, t->ip4->daddr,
+						  l4len, IPPROTO_TCP, 0);
+		if (g->fixedid)
+			shinfo->gso_type |= SKB_GSO_TCP_FIXEDID;
+	}
+	skb->csum_start = (u8 *)t->th - skb->head;
+	skb->csum_offset = offsetof(struct tcphdr, check);
+	skb->ip_summed = CHECKSUM_PARTIAL;
+}
+
+/*
+ * Hands the run to mac80211 as one frame with the receive status of its
+ * segments; one of several segments as a GSO frame, which mac80211 counts
+ * as those segments.
+ */
+static void ath11k_dp_rx_merge_flush(struct ath11k *ar,
+				     struct napi_struct *napi,
+				     struct ath11k_dp_rx_merge *g)
+{
+	struct sk_buff *skb = g->head;
+
+	if (!skb)
+		return;
+
+	/* complete before the run is let go: it reads g->head */
+	if (g->segs > 1) {
+		ath11k_dp_rx_merge_complete(g);
+		ar->ab->soc_stats.rx_merge_aggs++;
+		ar->ab->soc_stats.rx_merge_segs += g->segs;
+	}
+	g->head = NULL;
+
+	ath11k_dp_rx_deliver_msdu(ar, napi, skb, &g->status);
+}
+
+/*
+ * Appends segment @t of @msdu to the run: its payload as a fragment of the
+ * head, which takes the buffer it was received in and frees the segment's
+ * skb, or the segment whole to the frame list. A segment that cannot be taken
+ * is left as it was.
+ */
+static bool ath11k_dp_rx_merge_join(struct ath11k *ar,
+				    struct napi_struct *napi,
+				    struct ath11k_dp_rx_merge *g,
+				    struct sk_buff *msdu,
+				    const struct ath11k_dp_rx_tcp *t, bool fixed)
+{
+	u16 payload = t->payload, id = t->v6 ? 0 : ntohs(t->ip4->id);
+	u16 hdr_len = t->hdr_len;
+	bool push = t->th->psh, fragstolen;
+	int delta;
+
+	if (g->flist) {
+		/*
+		 * Chained as skb_gro_receive_list() chains a segment: its
+		 * headers stay in front of its payload, where the network
+		 * header names them for whoever cuts the list.
+		 */
+		skb_set_network_header(msdu, ETH_HLEN);
+		skb_set_transport_header(msdu, (u8 *)t->th - msdu->data);
+		__skb_pull(msdu, hdr_len);
+		if (g->last == g->head)
+			skb_shinfo(g->head)->frag_list = msdu;
+		else
+			g->last->next = msdu;
+		msdu->next = NULL;
+		g->last = msdu;
+		g->head->data_len += msdu->len;
+		g->head->len += msdu->len;
+		g->head->truesize += msdu->truesize;
+	} else {
+		__skb_pull(msdu, hdr_len);
+		if (!skb_try_coalesce(g->head, msdu, &fragstolen, &delta)) {
+			__skb_push(msdu, hdr_len);
+			return false;
+		}
+		kfree_skb_partial(msdu, fragstolen);
+	}
+
+	if (g->segs == 1)
+		g->fixedid = fixed;
+	g->segs++;
+	g->next_seq += payload;
+	g->last_id = id;
+	if (push)
+		g->t.th->psh = 1;
+
+	/*
+	 * A segment that ends a write ends the run, as does a short one, and
+	 * the bound on its size.
+	 */
+	if (push || payload < g->mss || g->segs >= g->max_segs)
+		ath11k_dp_rx_merge_flush(ar, napi, g);
+
+	return true;
+}
+
+/*
+ * Starts a run with @msdu, unless GRO on the netdev its frames reach is off
+ * or has an XDP program there, which see every frame alone. The run takes the
+ * form GRO on the netdev would give it: with frame lists on a frame list,
+ * unless a socket of the host takes the stream, as tcp4_check_fraglist_gro()
+ * and tcp6_check_fraglist_gro() decide, else a frame with fragments; either up
+ * to the netdev's GRO size.
+ */
+static bool ath11k_dp_rx_merge_open(struct ath11k_dp_rx_merge *g,
+				    struct sk_buff *msdu,
+				    const struct ieee80211_rx_status *status,
+				    const struct ath11k_dp_rx_tcp *t)
+{
+	struct ieee80211_sta *sta = ATH11K_SKB_RXCB(msdu)->sta;
+	struct net_device *dev;
+	struct sock *sk = NULL;
+	int iif, sdif = 0;
+	bool flist;
+
+	rcu_read_lock();
+	dev = ieee80211_sta_rx_netdev(sta);
+	if (!dev || netif_elide_gro(dev)) {
+		rcu_read_unlock();
+		return false;
+	}
+
+	g->max_size = min_t(u32, t->v6 ? READ_ONCE(dev->gro_max_size) :
+				  READ_ONCE(dev->gro_ipv4_max_size),
+			    GRO_LEGACY_MAX_SIZE);
+	flist = dev->features & NETIF_F_GRO_FRAGLIST;
+	if (flist) {
+		iif = dev->ifindex;
+#if IS_ENABLED(CONFIG_NET_L3_MASTER_DEV)
+		if (netif_is_l3_slave(dev)) {
+			struct net_device *master;
+
+			master = netdev_master_upper_dev_get_rcu(dev);
+			sdif = iif;
+			iif = master ? master->ifindex : 0;
+		}
+#endif
+		if (!t->v6)
+			sk = __inet_lookup_established(dev_net_rcu(dev),
+						       t->ip4->saddr,
+						       t->th->source,
+						       t->ip4->daddr,
+						       ntohs(t->th->dest),
+						       iif, sdif);
+#if IS_ENABLED(CONFIG_IPV6)
+		else
+			sk = __inet6_lookup_established(dev_net_rcu(dev),
+							&t->ip6->saddr,
+							t->th->source,
+							&t->ip6->daddr,
+							ntohs(t->th->dest),
+							iif, sdif);
+#endif
+	}
+	rcu_read_unlock();
+
+	if (sk) {
+		sock_gen_put(sk);
+		flist = false;
+	}
+
+	g->head = msdu;
+	g->last = msdu;
+	g->flist = flist;
+	memcpy(&g->status, status, sizeof(*status));
+	g->t = *t;
+	g->mss = t->payload;
+	g->next_seq = ntohl(t->th->seq) + t->payload;
+	g->last_id = t->v6 ? 0 : ntohs(t->ip4->id);
+	g->segs = 1;
+	g->fixedid = false;
+	/*
+	 * GRO ends a frame list at 64 segments, and a frame with fragments
+	 * takes one per segment but the first.
+	 */
+	g->max_segs = flist ? 64 : MAX_SKB_FRAGS + 1;
+
+	return true;
+}
+
+/*
+ * A frame ath11k_dp_rx_process_msdu() has made ready for mac80211, with its
+ * receive status @status: merged into the run when it is the next segment of
+ * it, else the run is sent and the frame starts one, or is left to be sent
+ * alone. The frames of a stream leave in the order they came in, and a frame
+ * never waits behind another one's: a frame that does not join ends the run
+ * before it is handled.
+ *
+ * Return: true when the frame is the run's.
+ */
+static bool ath11k_dp_rx_merge_rx(struct ath11k *ar, struct napi_struct *napi,
+				  struct ath11k_dp_rx_merge *g,
+				  struct sk_buff *msdu,
+				  const struct ieee80211_rx_status *status)
+{
+	struct ath11k_dp_rx_tcp t;
+	bool fixed = false, ok;
+
+	ok = !(status->flag & (RX_FLAG_FAILED_FCS_CRC | RX_FLAG_MMIC_ERROR)) &&
+	     ath11k_dp_rx_merge_ok(ar, msdu) &&
+	     ath11k_dp_rx_merge_parse(msdu, &t);
+
+	if (g->head) {
+		if (ok && ath11k_dp_rx_merge_fits(g, msdu, status, &t, &fixed) &&
+		    ath11k_dp_rx_merge_join(ar, napi, g, msdu, &t, fixed))
+			return true;
+		ath11k_dp_rx_merge_flush(ar, napi, g);
+	}
+
+	return ok && !t.th->psh && ath11k_dp_rx_merge_open(g, msdu, status, &t);
+}
+
 static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 						  struct napi_struct *napi,
 						  struct sk_buff_head *msdu_list,
@@ -2995,6 +3431,7 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 	struct sk_buff *msdu;
 	struct ath11k *ar;
 	struct ieee80211_rx_status rx_status = {};
+	struct ath11k_dp_rx_merge merge = {};
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -3020,8 +3457,13 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 			continue;
 		}
 
+		if (ath11k_dp_rx_merge_rx(ar, napi, &merge, msdu, &rx_status))
+			continue;
+
 		ath11k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_status);
 	}
+
+	ath11k_dp_rx_merge_flush(ar, napi, &merge);
 }
 
 /*
-- 
2.53.0


