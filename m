Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3215CC98304
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 05:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aa+X7OW5Qo3QiXoTwB67lDNGuw71uFdUI3jhShzYbc=; b=1iqij03zz5mMV8sBzAgM0BVBVA
	QEqG4+jgV9RBrDo6cxxwwSPaWH78KhZ9PNfCMQIZyWdzKs5YkP2eBxvdEilZfKCPYrgYCRanDO8fN
	eNq5r8W6xbGFYNYqNLAby2ojYDQ+MhsL6pDP2XmqMWFt82T3SI8hvjt4Vqk+meybzOXJ939Sx9+6c
	03e6G634LD2JEVGZBRAT7wcw37rG6PgiWd5aPLdzp7WpU/Bq98b51+FjIop7pOLPG0OwyfgwVeWBl
	dLZQyVAYO5mAOJygtw4A3GP8/Lg4KliLuBocxImCto0LvPpDjosze2vSDfKw50BNrNpeGIIE2/BeY
	w9fSHxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9byG-0000000A2jL-1pqF;
	Thu, 24 Sep 2026 05:26:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9byE-0000000A2ip-3KTZ;
	Thu, 24 Sep 2026 05:26:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EE1B41942;
	Thu, 24 Sep 2026 05:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F404E1F00893;
	Thu, 24 Sep 2026 05:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790227570;
	bh=9aa+X7OW5Qo3QiXoTwB67lDNGuw71uFdUI3jhShzYbc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JeQ8LM1R+8wSwiy5ilLkr6kJ9ENAQzecTY+o53tO1R1EK20yWpWKhkVpjrz7QErzs
	 OhCasWIWxCFPLKWhqAaxgSspyoZvwTKUnLTJieSFagk/9EyQaI68gDoX0m8/VE4xCd
	 E6/yyxAn8rcNsBRHgBDdWMr8O5n60rchNNt5yJU/IdMk9JS+k6mPSYf41OygD68tUO
	 7dq12UAT0zFqXqX4nENy6j+VFGzhuX41TGs+ZxZQQ8JpbmnEUqrymxeTV0E+r4jhdm
	 4dp6nEMwmqMw2aDlUdXRfLP+SXLOxgJOp0Ggjus3D7lEjD8sKYw+ZCewnLx/BRsFzC
	 Fe6f/yfMkHWvQ==
Subject: Re: [PATCH v2 1/4] net: qrtr: Allow the host QRTR to assign a unique node id
From: netdev-bot+sashiko@kernel.org
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, jjohnson@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com
Date: Thu, 24 Sep 2026 05:26:08 +0000
Message-ID: <179022756849.2160803.17145163366235218595@kernel.org>
In-Reply-To: <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 3 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete node-id translation: QRTR_TYPE_RESUME_TX payloads are
  not translated, so flow-control credits returned by the remote are…
- [High] Lost routing entries for bridged (distant) nodes.
- [High] The host-assigned node id is not validated and the
  radix_tree_insert() failure is ignored, so the very failure mode the…
- [Medium] node->ep_nid is latched unconditionally from the first
  accepted packet's src_node (af_qrtr.c:567-568) with no requirement…
- [Medium] The QRTR_EP_NID_AUTO sentinel ((-1) == 0xffffffff, which
  include/uapi/linux/qrtr.h defines as QRTR_NODE_BCAST) can be…
- [Medium] Unsynchronized one-time initialization of node->ep_nid.

Pre-existing issues:
- [Low] (Assessed as a false positive / hardening note only.)
  qrtr_node_rewrite_ctrl() returns without rewriting when skb->len <…

--

net: qrtr: Allow the host QRTR to assign a unique node id

This patch lets the host assign a unique node id at
qrtr_endpoint_register() time and uses it as the qrtr_nodes radix tree key,
while the id reported by the remote is kept separately in the new
qrtr_node->ep_nid field. Received control packets and headers are rewritten
to translate between the two ids when they differ.

A few questions below about the translation and the routing changes.

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 78347c937af76..ad62f3caede8b 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c

[ ... ]

> @@ -347,6 +349,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  {
>  	struct qrtr_hdr_v1 *hdr;
>  	size_t len = skb->len;
> +	unsigned int dst_node;
>  	int rc, confirm_rx;
>  
>  	mutex_lock(&node->ep_lock);
> @@ -369,10 +372,14 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	hdr->src_node_id = cpu_to_le32(from->sq_node);
>  	hdr->src_port_id = cpu_to_le32(from->sq_port);
>  	if (to->sq_port == QRTR_PORT_CTRL) {
> -		hdr->dst_node_id = cpu_to_le32(READ_ONCE(node->nid));
> +		hdr->dst_node_id = cpu_to_le32(READ_ONCE(node->ep_nid));
>  		hdr->dst_port_id = cpu_to_le32(QRTR_PORT_CTRL);
>  	} else {
> -		hdr->dst_node_id = cpu_to_le32(to->sq_node);
> +		/* Put back the endpoint's own node id */
> +		dst_node = to->sq_node;
> +		if (dst_node == READ_ONCE(node->nid))
> +			dst_node = node->ep_nid;
> +		hdr->dst_node_id = cpu_to_le32(dst_node);
>  		hdr->dst_port_id = cpu_to_le32(to->sq_port);
>  	}

[Severity: Medium]
Can the QRTR_EP_NID_AUTO sentinel end up on the wire as a unicast
destination here?

qrtr_endpoint_register() sets node->ep_nid = QRTR_EP_NID_AUTO and inserts
node->nid into qrtr_nodes right away for an explicit-nid endpoint, then
schedules the HELLO work. node->ep_nid is only filled in later, by the
first inbound packet in qrtr_endpoint_post().

In that window a local sendmsg() to sq_node == node->nid reaches the data
branch above, matches dst_node == READ_ONCE(node->nid) and emits ep_nid,
which is still (-1). net/qrtr/qrtr.h has:

    #define QRTR_EP_NID_AUTO (-1)

and include/uapi/linux/qrtr.h has:

    #define QRTR_NODE_BCAST		0xffffffffu

so the destination node id transmitted is the broadcast id. Should both
branches skip transmission (or defer) while ep_nid is still the sentinel?

Also, node->ep_nid is read here with a plain load in the data branch while
qrtr_endpoint_post() publishes it with WRITE_ONCE(). Was the missing
READ_ONCE() on this read intentional, given the CTRL branch just above uses
one?

> @@ -441,6 +448,32 @@ static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
>  	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
>  }
>  
> +/* Replace the node id in the control packet with 'node->nid', if both are
> + * different.
> + */
> +static void qrtr_node_rewrite_ctrl(struct qrtr_node *node, unsigned int type,
> +				   struct sk_buff *skb)
> +{
> +	struct qrtr_ctrl_pkt *pkt;
> +	__le32 *nid;
> +
> +	if (node->nid == node->ep_nid)
> +		return;
> +
> +	if (skb->len < sizeof(*pkt))
> +		return;

[Severity: Low]
This isn't a bug introduced by this patch, but the minimum-size check in
qrtr_endpoint_post() only covers two types:

	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
	     cb->type == QRTR_TYPE_RESUME_TX) &&
	    size < sizeof(struct qrtr_ctrl_pkt))
		goto err;

so an undersized QRTR_TYPE_DEL_SERVER or QRTR_TYPE_DEL_CLIENT takes the
early return above and skips the rewrite while still being delivered.
The truncated payload fields read as zero in qrtr_ns_worker(), so the
outcome matches the pre-patch behaviour, but would it be worth rejecting
undersized DEL_SERVER/DEL_CLIENT the same way NEW_SERVER already is?

> +
> +	pkt = (struct qrtr_ctrl_pkt *)skb->data;
> +	if (type == QRTR_TYPE_DEL_CLIENT)
> +		nid = &pkt->client.node;
> +	else
> +		nid = &pkt->server.node;
> +
> +	/* Rewrite only the endpoint's node id, not those of bridged nodes */
> +	if (le32_to_cpu(*nid) == node->ep_nid)
> +		*nid = cpu_to_le32(node->nid);
> +}
> +
>  /**
>   * qrtr_endpoint_post() - post incoming data
>   * @ep: endpoint handle
> @@ -531,16 +564,29 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  
>  	skb_put_data(skb, data + hdrlen, size);
>  
> -	qrtr_node_assign(node, cb->src_node);
> +	if (node->ep_nid == QRTR_EP_NID_AUTO)
> +		WRITE_ONCE(node->ep_nid, cb->src_node);

[Severity: Medium]
Is there anything here that ties this first packet's src_node to the
endpoint's own node, rather than to a bridged node the endpoint carries?

If the first accepted packet has a bridged source B, ep_nid becomes B for
the lifetime of the link, and no later path corrects it. After that,
qrtr_node_enqueue() addresses control packets to B, data addressed to
node->nid is rewritten to B, and packets from the endpoint's real id E are
neither translated (E != ep_nid) nor inserted into qrtr_nodes by the new
guard below. Should this latch only accept the id seen in the remote's own
HELLO?

[Severity: Medium]
This is a check-then-set outside any lock, while the sibling field is
written under qrtr_nodes_lock in qrtr_node_assign():

	spin_lock_irqsave(&qrtr_nodes_lock, flags);
	radix_tree_insert(&qrtr_nodes, nid, node);
	if (node->nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->nid, nid);

qrtr_endpoint_post() is entered without serialization from
net/qrtr/tun.c:qrtr_tun_write_iter():

	ret = qrtr_endpoint_post(&tun->ep, kbuf, len);

Two concurrent writes to the same /dev/qrtr-tun fd can both observe the
sentinel and both store, with different src_node values.

There is a second ordering question: ep_nid is published before
qrtr_node_assign() sets node->nid, so can a concurrent caller see
ep_nid == E while node->nid is still QRTR_EP_NID_AUTO and then execute

	if (cb->src_node == node->ep_nid)
		cb->src_node = node->nid;

delivering src_node 0xffffffff, or have qrtr_node_rewrite_ctrl() stamp
0xffffffff into a NEW_SERVER/DEL_SERVER/DEL_CLIENT payload?

> +
> +	if (node->nid == QRTR_EP_NID_AUTO || node->nid == cb->src_node)
> +		qrtr_node_assign(node, cb->src_node);

[Severity: High]
Does this stop learning routes to bridged (distant) nodes?

Previously every src_node was inserted into qrtr_nodes unconditionally, and
qrtr_node_assign() inserts the key regardless of node->nid:

	spin_lock_irqsave(&qrtr_nodes_lock, flags);
	radix_tree_insert(&qrtr_nodes, nid, node);
	if (node->nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->nid, nid);

With the new guard, once node->nid == E a packet with src_node == B
(B != E) inserts nothing unless it happens to be QRTR_TYPE_NEW_SERVER. Then:

  - qrtr_sendmsg() replying to sq_node == B hits the
    qrtr_node_lookup() failure path and returns -ECONNRESET
  - qrtr_send_resume_tx() for confirm_rx data received from B does:

	node = qrtr_node_lookup(remote.sq_node);
	if (!node)
		return -EINVAL;

    so the bridged sender never gets its credit back

  - the name service cannot answer NEW_LOOKUP/DEL_* traffic from B

This path is reached with the existing endpoint drivers that all pass
QRTR_EP_NID_AUTO, since node->nid is set from the first packet. Does that
match the commit message statement?

    Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the
    'nid' during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same
    and the functionality is not changed.

>  
>  	if (cb->type == QRTR_TYPE_NEW_SERVER) {
>  		/* Remote node endpoint can bridge other distant nodes */
> -		const struct qrtr_ctrl_pkt *pkt;
> +		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
> +		unsigned int server_node = le32_to_cpu(pkt->server.node);
>  
> -		pkt = data + hdrlen;
> -		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
> +		if (server_node != node->ep_nid)
> +			qrtr_node_assign(node, server_node);
>  	}
>  
> +	if (cb->src_node == node->ep_nid)
> +		cb->src_node = node->nid;
> +
> +	if (cb->type == QRTR_TYPE_NEW_SERVER ||
> +	    cb->type == QRTR_TYPE_DEL_SERVER ||
> +	    cb->type == QRTR_TYPE_DEL_CLIENT)
> +		qrtr_node_rewrite_ctrl(node, cb->type, skb);
> +
>  	if (cb->type == QRTR_TYPE_RESUME_TX) {
>  		qrtr_tx_resume(node, skb);
>  	} else {

[Severity: High]
Should QRTR_TYPE_RESUME_TX also be translated here?

qrtr_node_enqueue() keys the flow on to->sq_node, i.e. the host assigned
node->nid:

qrtr_tx_wait():
	unsigned long key = (u64)dest_node << 32 | dest_port;

but it puts node->ep_nid on the wire as hdr->dst_node_id. The remote echoes
its own view of the destination back in RESUME_TX, which is ep_nid; the
host does the same thing in qrtr_send_resume_tx():

	pkt->cmd = cpu_to_le32(QRTR_TYPE_RESUME_TX);
	pkt->client.node = cpu_to_le32(cb->dst_node);

RESUME_TX is not in the list above, and qrtr_tx_resume() consumes the raw
payload:

	u64 remote_node = le32_to_cpu(pkt->client.node);
	u32 remote_port = le32_to_cpu(pkt->client.port);
	...
	key = remote_node << 32 | remote_port;
	flow = xa_load(&node->qrtr_tx_flow, key);

With node->nid != node->ep_nid the lookup uses ep_nid << 32 | port while
the flow was stored under nid << 32 | port, so flow->pending is never
reset. Once QRTR_TX_FLOW_HIGH messages are outstanding, does every further
send then block indefinitely in qrtr_tx_wait()?

	ret = wait_event_interruptible_locked_irq(flow->resume_tx,
						  flow->pending < QRTR_TX_FLOW_HIGH ||
						  flow->tx_failed ||
						  !node->ep);

There is no timeout, and flow->tx_failed is only set on transmit failure.
This would be hit by ordinary QMI bring-up traffic to an MHI endpoint once
that endpoint registers with a host assigned nid.

> @@ -646,6 +692,7 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
>  	mutex_init(&node->ep_lock);
>  	skb_queue_head_init(&node->rx_queue);
>  	node->nid = QRTR_EP_NID_AUTO;
> +	node->ep_nid = QRTR_EP_NID_AUTO;
>  	node->ep = ep;

[Severity: High]
Now that the host supplied nid is authoritative, should the insertion
failure be propagated out of qrtr_endpoint_register()?

qrtr_node_assign() drops the return value and commits node->nid anyway:

	spin_lock_irqsave(&qrtr_nodes_lock, flags);
	radix_tree_insert(&qrtr_nodes, nid, node);
	if (node->nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->nid, nid);
	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);

radix_tree_insert() does not overwrite, so on -EEXIST the key keeps
pointing at a different node while the new node believes it owns nid;
-ENOMEM behaves the same. qrtr_endpoint_register() then returns 0 and the
driver is never told its requested id was rejected.

The colliding key can come from the remote: a packet with a matching
src_node while node->nid is still AUTO, or a NEW_SERVER payload whose
server.node matches, both of which are full 32-bit values from the v1
header:

	if (server_node != node->ep_nid)
		qrtr_node_assign(node, server_node);

After that, the new guard

	if (node->nid == QRTR_EP_NID_AUTO || node->nid == cb->src_node)
		qrtr_node_assign(node, cb->src_node);

prevents any later recovery insertion, so qrtr_node_lookup(nid) keeps
resolving to the wrong node for the endpoint's lifetime. Isn't that the
same silent-drop failure mode the commit message says this change removes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-qrtr-multi-ep-v2-0-27dd80d841a0%40oss.qualcomm.com

