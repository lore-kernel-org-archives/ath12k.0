Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD91C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96Gt05m6I7x5tIjLBQue5PC//ka+PdxH44ahG5H6QBg=; b=qFq5iCA/Zqk3b8l4M9tIG/nOpl
	dBL6vd+VM+Jo0LmOMSFbiKoHXzREk2bZaeXpmxfcde80PZtUzM2ET7fl73ZhYVmHA7THxkKdV6bj2
	0NFEvxH6feAEall20pggqh0CYLwWXP0nNAxWkGZLSHv25L/qsPEriWfs3SNVASTFDtr+c3gzR57PX
	WZg3z+Do3mWBeYwb/Rw6UidZXoU9xhAetnlRYHfbzptbnQaF7uqO7tkbABvbkMwk73uYBBH0yNwrB
	Zulahed/Nire5Z1m9CtuClTRq4wEdfzPgrK2mXkPu+uKhqO2gAMDO2LPWStbYJmFBYxi5XNBLR5qp
	isloCcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6z-00000006hJK-0B5V;
	Tue, 15 Sep 2026 13:22:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6w-00000006hGk-4785;
	Tue, 15 Sep 2026 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=96Gt05m6I7x5tIjLBQue5PC//ka+PdxH44ahG5H6QBg=; b=AjKpv25ZU0oKtMwj9lOxI3rfAY
	SLDZOLwW4HSZVbaHDbZWgrQ9c+Z+xPax5xLRgbGIEwV8J55l3POhMN8LhRrSUg+h44UfuWEhoNkLs
	9M6ib/wfCdJVK2i/kKcDvSwcRBQ9dgw8/SchMI93uz5uRiclHUl58WrZQIibGsRdOgwnReU/imqpf
	OOpxtsQ5bHr/t32adtGzGMnWy0P0y/41xooGthnFg7Oz0xq2c2Ie7nDdkxoaAsIWqnCx+g9b+idZl
	xpVrGDcC3vdV4IHcKw0DJNJfKou82Q7g02jPfY0oEAAEke28MkmVL0cjmqHrfK3xPFJ/JTdW3beYd
	lJXxSIYg==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6T6s-00000006oID-2Ca3;
	Tue, 15 Sep 2026 13:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=96Gt05m6I7x5tIjLBQue5PC//ka+PdxH44ahG5H6QBg=;
	t=1789478526; x=1790688126; b=KcSZOiIh4UKzthaWGp0aguTcHRMMWqPsEbQ9arhC8bALZPI
	woU/P5Rl0Ah40a91KYgUG2jP0Bse49qoxovAwIcak/q5aXEYyTpL9f/LrmZuMqyGqLWUTh+2i+bk6
	ZCKSZEEtfo7OqCPgxKzLduxa+79/RaiYPEdjOXJ27cg7OlKq2OZV9UbCPKFkoyI+WrIQRDplZnhrs
	yj0GQLcy6IQrdXGowsxl9ueNVfr/MCgQQrtRDTGBYqkwwnXZFqrxxAVFGYS3o+CyEwJwPjMvfckVU
	DwXpOGJTMLPfLLTzaOLlne3TmlXNa7jdqzmmeXJ25cG9UtTp5l/YF+nEkB2yDYQQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1x6T6k-0000000H08V-2A3k;
	Tue, 15 Sep 2026 15:21:58 +0200
From: Benjamin Berg <benjamin@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH wireless-next v4 5/8] wifi: cfg80211: add attribute for TX/RX denoting there is no station
Date: Tue, 15 Sep 2026 15:19:31 +0200
Message-ID: <20260915151925.f12af80b1972.I4cfd3db83ba3dc0267575f919ba613ea5d10abd5@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915131925.1780764-10-benjamin@sipsolutions.net>
References: <20260915131925.1780764-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_142206_756893_36396AA0 
X-CRM114-Status: GOOD (  19.56  )
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

From: Benjamin Berg <benjamin.berg@intel.com>

For MLD stations, userspace may need to explicitly transmit a frame to
a specific link address. In that case, it needs to ensure that no
address translation happens.

In the reverse case of an RX, userspace may need to know the link
address for a frame. By passing the information whether a STA is known
for the frame, userspace knows whether link translation happened and
can do the reverse lookup when needed.

This is important for flows where a STA is still registered but the
connection has been lost and it is returning again.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>

---

v4:
- Change name to NL80211_ATTR_FRAME_NO_STA and use reference for
  NL80211_CMD_FRAME in documentation
---
 include/net/cfg80211.h       | 4 ++++
 include/uapi/linux/nl80211.h | 7 +++++++
 net/wireless/nl80211.c       | 8 +++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6461a7bd0169..9aa7d2d4a184 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4009,6 +4009,7 @@ struct cfg80211_update_ft_ies_params {
  * @link_id: for MLO, the link ID to transmit on, -1 if not given; note
  *	that the link ID isn't validated (much), it's in range but the
  *	link might not exist (or be used by the receiver STA)
+ * @no_sta: set if the frame should not be transmitted using an existing STA
  */
 struct cfg80211_mgmt_tx_params {
 	struct ieee80211_channel *chan;
@@ -4021,6 +4022,7 @@ struct cfg80211_mgmt_tx_params {
 	int n_csa_offsets;
 	const u16 *csa_offsets;
 	int link_id;
+	bool no_sta;
 };
 
 /**
@@ -9501,6 +9503,7 @@ void cfg80211_conn_failed(struct net_device *dev, const u8 *mac_addr,
  * @flags: flags, as defined in &enum nl80211_rxmgmt_flags
  * @rx_tstamp: Hardware timestamp of frame RX in nanoseconds
  * @ack_tstamp: Hardware timestamp of ack TX in nanoseconds
+ * @no_sta: set if no station is known for the frame (relevant for MLD)
  */
 struct cfg80211_rx_info {
 	int freq;
@@ -9512,6 +9515,7 @@ struct cfg80211_rx_info {
 	u32 flags;
 	u64 rx_tstamp;
 	u64 ack_tstamp;
+	bool no_sta;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 32553cacf988..510102febc26 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3185,6 +3185,11 @@ enum nl80211_commands {
  *	The aggregated message always precedes the per-link messages for the
  *	same station within a dump sequence.
  *
+ * @NL80211_ATTR_FRAME_NO_STA: Valid for @NL80211_CMD_FRAME to denote that
+ *	the kernel had no station for a received frame or should not use a
+ *	known station to transmit a frame. This is relevant to know whether
+ *	MLD address translation happened or to disable it when sending a frame.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3785,6 +3790,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_STA_DUMP_LINK_STATS,
 
+	NL80211_ATTR_FRAME_NO_STA,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index b081eeaf7016..e77a4c81d031 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1097,6 +1097,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_NPCA_PUNCT_BITMAP] =
 		NLA_POLICY_FULL_RANGE(NLA_U32, &nl80211_punct_bitmap_range),
 	[NL80211_ATTR_STA_DUMP_LINK_STATS] = { .type = NLA_FLAG },
+	[NL80211_ATTR_FRAME_NO_STA] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -14873,6 +14874,9 @@ static int nl80211_tx_mgmt(struct sk_buff *skb, struct genl_info *info)
 	    !(wdev->valid_links & BIT(params.link_id)))
 		return -EINVAL;
 
+	params.no_sta =
+		nla_get_flag(info->attrs[NL80211_ATTR_FRAME_NO_STA]);
+
 	params.buf = nla_data(info->attrs[NL80211_ATTR_FRAME]);
 	params.len = nla_len(info->attrs[NL80211_ATTR_FRAME]);
 
@@ -22042,7 +22046,9 @@ int nl80211_send_mgmt(struct cfg80211_registered_device *rdev,
 	    (info->ack_tstamp && nla_put_u64_64bit(msg,
 						   NL80211_ATTR_TX_HW_TIMESTAMP,
 						   info->ack_tstamp,
-						   NL80211_ATTR_PAD)))
+						   NL80211_ATTR_PAD)) ||
+	    (info->no_sta &&
+	     nla_put_flag(msg, NL80211_ATTR_FRAME_NO_STA)))
 		goto nla_put_failure;
 
 	genlmsg_end(msg, hdr);
-- 
2.55.0


