Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3685FC982FD
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 05:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CV947oCj29sewSGsEDqooakkY2hwELR8yILNnpJi/q8=; b=PFrdB1rmjIrbvHpp0ojxibfP22
	Yy81H7BYgy7I0J01JNYCrMyCoWl53QtmnLVTh0ArSUTac+bXPd4jBL1X3YoI8ydtXIxxD5VBwIYiG
	eS4QDRcM85PrC+qAX+fCslZdOUPieKfb1bUkXFNA2cqNtHAr36NQfxRDNTN6nwsqI6VdVaLNCzmIM
	6tXNRadlSpuwbl9URoZx7r62vV7nvGxeftDtt6Lpww2QNpkn+Yeu9UQNpLURFrA7OUqK9xI8vI3x/
	QZEl9YS84RfKTyUrlkKLZWtkxv5KI5kqcgGJSy4IYI/kPDeyo191Wjmi/MU67GQMVKTkVqAvHGpwt
	pTKrxgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9byH-0000000A2k7-3lJ9;
	Thu, 24 Sep 2026 05:26:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9byG-0000000A2jG-3tKY;
	Thu, 24 Sep 2026 05:26:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5629600AA;
	Thu, 24 Sep 2026 05:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22BE1F000FF;
	Thu, 24 Sep 2026 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790227571;
	bh=CV947oCj29sewSGsEDqooakkY2hwELR8yILNnpJi/q8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GEu6Ngl+Uwj6evBu6oN5+NArD9CbnCwqolILCqpsaS0/zbuYbMl6Kt7tYSqWDkbAW
	 sm14X2cqgM+8FGr+LgsoFV6/4XOfRyJHUJl2rkDrsoQr+RPYUTGT7JPga5/8vMrgz8
	 LeS77u6bo34fBVVZ9dF7U6lFkxnMut5UazlD+93LUgk9SfgXgI/82sJbqo13dJBir9
	 tRtM+t+LOdYfhCrW8niDGKvPN2j3IZ6gyK51yoH2cENtQUotZVoQrUM27V6bhprL5w
	 DBmiYGSGW6NRtyxcrv+yTxd5y9jLIjSO+xyBRvUNJDQGtxiheIJe9FIdEnzr76zBAx
	 AVh7iGOIZzs2g==
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
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
Date: Thu, 24 Sep 2026 05:26:10 +0000
Message-ID: <179022757024.2160803.11193951828167501969@kernel.org>
In-Reply-To: <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] TX flow-control (QRTR_TYPE_RESUME_TX) breaks for MHI endpoints:
  the flow is stored under a key built from the host-assigned node id,…
- [High] The new header asserts an invariant that nothing enforces: 'The
  offset is chosen carefully to not collide with the node ids allocated…
- [Medium] The QRTR_EP_NID_AUTO sentinel (-1, i.e. 0xffffffff ==
  QRTR_NODE_BCAST) can now be emitted as the wire destination node id of…
- [Medium] qrtr_endpoint_register() reports success even when the
  requested host node id was not published in the qrtr_nodes lookup tree.
- [Medium] Node-id reuse races against the deferred removal of radix-tree
  entries, silently leaving a re-probed MHI endpoint unreachable.

--

net: qrtr: Assign unique node id for MHI endpoints

This adds include/net/qrtr.h with QRTR_NODE_HOST_BASE (0x10000) and a
qrtr_host_node_id() helper, then switches the MHI QRTR endpoint driver from
QRTR_EP_NID_AUTO to a host assigned node id derived from the MHI controller
index.  It also adds the new header to the QRTR MAINTAINERS entry.

[ ... ]

> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> new file mode 100644
> index 0000000000000..745d51b4a6ba6
> --- /dev/null
> +++ b/include/net/qrtr.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _NET_QRTR_H
> +#define _NET_QRTR_H
> +
> +#include <linux/types.h>
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u

[Severity: High]
Is the "All the remote nodes use node ids in range 0 to 0xffff" statement
enforced anywhere in the receive path?  The v1 parser in
qrtr_endpoint_post() imports an unrestricted 32 bit value:

	cb->src_node = le32_to_cpu(v1->src_node_id);

and the NEW_SERVER branch hands a fully wire controlled id to
qrtr_node_assign() with no range test and no nid precondition:

	if (node->nid == QRTR_EP_NID_AUTO || node->nid == cb->src_node)
		qrtr_node_assign(node, cb->src_node);

	if (cb->type == QRTR_TYPE_NEW_SERVER) {
		const struct qrtr_ctrl_pkt *pkt = data + hdrlen;
		unsigned int server_node = le32_to_cpu(pkt->server.node);

		if (server_node != node->ep_nid)
			qrtr_node_assign(node, server_node);
	}

qrtr_node_assign() then discards the insertion result while still
committing node->nid:

	spin_lock_irqsave(&qrtr_nodes_lock, flags);
	radix_tree_insert(&qrtr_nodes, nid, node);
	if (node->nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->nid, nid);
	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);

So can a remote (firmware on MHI device 0, or a qrtr-tun endpoint) claim a
key in the new host range, say 0x10001, before the controller with index 1
probes?  When that controller registers, radix_tree_insert() returns
-EEXIST, it is ignored, node->nid is set to 0x10001 anyway, and every
qrtr_node_lookup(0x10001) returns the squatting node instead.  In the
reverse order the squatter's packets get rewritten to appear to come from
another device's host id.

Since the host ids are now derived from probe order, they are predictable.
Should ids >= QRTR_NODE_HOST_BASE be rejected on receive, and should the
radix_tree_insert() error be propagated?

> +
> +/* Compute host node id from a per-device index. The index must be unique
> + * among the host assigned endpoints and smaller than QRTR_NODE_HOST_BASE.
> + */
> +static inline unsigned int qrtr_host_node_id(unsigned int index)
> +{
> +	return QRTR_NODE_HOST_BASE + index;
> +}
> +
> +#endif /* _NET_QRTR_H */

> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 3990da1a65dc4..c920ab61f8487 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c

[ ... ]

> @@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	if (rc)
>  		return rc;
>  
> -	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +	rc = qrtr_endpoint_register(&qdev->ep,
> +				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));
>  	if (rc)
>  		goto err_unprepare;

[Severity: High]
With a host assigned id, node->nid (0x10000 + index) differs permanently
from node->ep_nid (set from the wire, 0..0xffff).  Does TX flow control
still work in that configuration?

qrtr_node_enqueue() keys the flow on the host assigned id:

	confirm_rx = qrtr_tx_wait(node, to->sq_node, to->sq_port, type);

qrtr_tx_wait():
	unsigned long key = (u64)dest_node << 32 | dest_port;
	...
	flow = xa_load(&node->qrtr_tx_flow, key);

but the same enqueue path rewrites the wire destination to ep_nid:

	/* Put back the endpoint's own node id */
	dst_node = to->sq_node;
	if (dst_node == READ_ONCE(node->nid))
		dst_node = node->ep_nid;
	hdr->dst_node_id = cpu_to_le32(dst_node);

so the remote is addressed as ep_nid and names itself that way in the
RESUME_TX payload, the same way the kernel's own qrtr_send_resume_tx()
does with pkt->client.node = cpu_to_le32(cb->dst_node).

On receive, only NEW_SERVER, DEL_SERVER and DEL_CLIENT payload node ids get
translated, RESUME_TX is passed through untouched:

	if (cb->type == QRTR_TYPE_NEW_SERVER ||
	    cb->type == QRTR_TYPE_DEL_SERVER ||
	    cb->type == QRTR_TYPE_DEL_CLIENT)
		qrtr_node_rewrite_ctrl(node, cb->type, skb);

	if (cb->type == QRTR_TYPE_RESUME_TX) {
		qrtr_tx_resume(node, skb);

qrtr_tx_resume() therefore computes key = ep_nid << 32 | port:

	u64 remote_node = le32_to_cpu(pkt->client.node);
	u32 remote_port = le32_to_cpu(pkt->client.port);
	...
	key = remote_node << 32 | remote_port;

	flow = xa_load(&node->qrtr_tx_flow, key);
	if (flow) {

Doesn't that xa_load() always miss the flow stored under the nid based key,
leaving flow->pending never reset and no waiter woken?

After QRTR_TX_FLOW_HIGH (10) data messages to one remote port,
qrtr_tx_wait() would then sleep in wait_event_interruptible_locked_irq()
until a signal arrives or node->ep is cleared at unregister, which stalls
QMI traffic to the endpoint.  Should RESUME_TX payloads also be translated
from ep_nid to nid?

[Severity: Medium]
Can this rc check ever observe a failure to publish the requested id?
Passing a concrete nid means qrtr_node_assign() no longer returns at the
"if (nid == QRTR_EP_NID_AUTO) return;" guard, so radix_tree_insert() now
runs at probe time, and its return value is dropped while node->nid is
written unconditionally.

qrtr_nodes is RADIX_TREE(qrtr_nodes, GFP_ATOMIC) and the insert runs under
spin_lock_irqsave(), and keys >= 0x10000 need tree extension, so -ENOMEM is
possible, as is -EEXIST.  In both cases qrtr_endpoint_register() still adds
the node to qrtr_all_nodes, schedules the HELLO work and returns 0, so the
probe succeeds with an endpoint that qrtr_node_lookup() cannot find, and
sends to its id fail with -ECONNRESET in qrtr_sendmsg().

Nothing retries later, since the receive path only re-assigns when

	if (node->nid == QRTR_EP_NID_AUTO || node->nid == cb->src_node)
		qrtr_node_assign(node, cb->src_node);

and neither condition holds once node->nid is 0x10000 + index while the
remote reports its own low id.  Should qrtr_node_assign() return the
insertion error so qrtr_endpoint_register() can propagate it and the
err_unprepare path here can run?

[Severity: Medium]
Can the QRTR_EP_NID_AUTO sentinel now reach the wire as dst_node_id?

qrtr_endpoint_register() sets both ids to the sentinel and then publishes
the node immediately, because nid is no longer AUTO:

	node->nid = QRTR_EP_NID_AUTO;
	node->ep_nid = QRTR_EP_NID_AUTO;
	...
	qrtr_node_assign(node, nid);
	...
	schedule_delayed_work(&node->say_hello, 0);

So qrtr_node_lookup(0x10000 + index) succeeds, and node->hello_sent can
become true, before any packet has been received, i.e. before

	if (node->ep_nid == QRTR_EP_NID_AUTO)
		WRITE_ONCE(node->ep_nid, cb->src_node);

has run.  A sendmsg() in that window reaches

	dst_node = to->sq_node;
	if (dst_node == READ_ONCE(node->nid))
		dst_node = node->ep_nid;
	hdr->dst_node_id = cpu_to_le32(dst_node);

and writes 0xffffffff (QRTR_NODE_BCAST) as the destination node of a data
frame handed to ep->xmit().  Previously the node was not reachable through
qrtr_node_lookup() until the first receive had set both nid and ep_nid.
Should the enqueue path check ep_nid against QRTR_EP_NID_AUTO before using
it as a wire value?

[Severity: Medium]
The MHI controller index is recycled, in mhi_register_controller():

	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);

and in mhi_unregister_controller():

	ida_free(&mhi_controller_ida, mhi_cntrl->index);

Does that race with the deferred removal of the radix tree slot?
qrtr_endpoint_unregister() only clears node->ep and drops a reference:

	mutex_lock(&node->ep_lock);
	node->ep = NULL;
	mutex_unlock(&node->ep_lock);
	...
	qrtr_node_release(node);

while the slots are deleted only in __qrtr_node_release():

	radix_tree_for_each_slot(slot, &qrtr_nodes, &iter, 0) {
		if (*slot == node)
			radix_tree_iter_delete(&qrtr_nodes, &iter, slot);
	}

qrtr_sendmsg() holds the reference from qrtr_node_lookup() across
qrtr_node_enqueue(), which sleeps in qrtr_tx_wait(), so the final put can
land after MHI remove() has returned and the index has been freed and
handed to the next controller:

CPU0 MHI remove
  qrtr_endpoint_unregister()	/* slot for 0x10000+N still present */
  mhi_unregister_controller()
    ida_free(N)

CPU1
  qrtr_node_enqueue() -> qrtr_tx_wait()	/* still holds old node ref */

CPU0/CPU2 new controller gets index N
  qcom_mhi_qrtr_probe()
    qrtr_endpoint_register(ep, 0x10000 + N)
      qrtr_node_assign() -> radix_tree_insert() == -EEXIST, ignored

Until CPU1 drops its reference, lookups of 0x10000 + N return the dead node
(node->ep == NULL).  After __qrtr_node_release() deletes the slot, is the
new endpoint permanently unreachable, given that the receive path only
re-assigns when node->nid == QRTR_EP_NID_AUTO or node->nid == cb->src_node?

With QRTR_EP_NID_AUTO the id was re-derived from every incoming packet, so
a collision healed itself.  Should the slot be removed synchronously in
qrtr_endpoint_unregister(), or the insert error be checked at register?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-qrtr-multi-ep-v2-0-27dd80d841a0%40oss.qualcomm.com

