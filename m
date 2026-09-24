Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8BDC98312
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 05:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mcb9L3lJWShw32hnPivU4U8fBXyRc17xUv4CFb97zk=; b=XkyirqKS+LM5kGIQng1vsSqFDK
	jpMygxFboB0mON1OzH/vDe6w1E4fEU92etdeLeWh+uHaRCqpcZL51REdUJFRcFmYMrcERuVaLXNp7
	tNFqezNfQAT1gbp/6b27XScTarFc7XM6tRsbDaVD8of112NsWvUMzjhGg1EWx18pW/2pmGbC+ITkQ
	n/P+Y6ROrloCk7CoTSTbTbdoT+ddifcaZGddpMAQ7d+XW5iTFgI+OJUS9YIlqbbIjuHjVO+2qHeMk
	knBCWjZ9NOe7dizxZZyXbuOBsSef7FpavMy3shYMhNVq5/UGwbodd7bTXCFjJW4JuYAlQydwduzSY
	k5hpJsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9byM-0000000A2np-0oCw;
	Thu, 24 Sep 2026 05:26:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9byH-0000000A2jp-3IBD;
	Thu, 24 Sep 2026 05:26:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A05443A02;
	Thu, 24 Sep 2026 05:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478431F00898;
	Thu, 24 Sep 2026 05:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790227573;
	bh=/mcb9L3lJWShw32hnPivU4U8fBXyRc17xUv4CFb97zk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MJu52kUa+bHCSqIEtpiQSjOnL0vs8+IahaPQ/7XqlXtzCFXyfx3l8eBSiK9wQIpHA
	 /kTCGO3HjuKwPlXgVeIQ1yqVLF8kzEuXduQqxraZ3nnUApZsgrkeQLEbOGf8uNgE7S
	 j41LuowTxxg+0KV+AYw+p9yYOiTytS//nL9RORYStno6n4khs8breNfcu7FV3rIz67
	 w7TnM0/mhZpjOuIc0HNLtBzjYxlxYxWPhVFCWuwhsHOFscyZNKDq2qWIjpM8/UJ4v2
	 JsHvsSgeyIbfwEMuAbGvkd9i3nIwWXl/lpdEdpW1ViEAsM2pkIzJbxN0wAjPSqG5Zu
	 tocgVuBrpR8+Q==
Subject: Re: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
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
Date: Thu, 24 Sep 2026 05:26:11 +0000
Message-ID: <179022757180.2160803.15859987957675595749@kernel.org>
In-Reply-To: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: ath11k_qmi_ops_new_server() returns 0 (success)
  when it decides to skip a WLFW server that belongs to the *other*…
- [Low] Concern that the commit fixes a real user-visible multi-device
  initialization bug (identical ath11k PCIe cards connecting to each…

--

wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver

This adds a get_qrtr_node_id() HIF callback returning the QRTR node id
derived from the MHI controller index, and uses it in the QMI new_server
callback so a device only connects to the WLFW server running on its own
node. A node id of zero keeps the previous unfiltered behaviour.

[Severity: Low]
This isn't a bug, but the commit fixes a user-visible misbehaviour (two
identical ath11k PCIe cards connecting to each other's WLFW firmware) and
carries no Fixes: trailer.

The fix depends on qrtr_host_node_id()/QRTR_NODE_HOST_BASE in
include/net/qrtr.h and on the host-assigned node id plus the
NEW_SERVER/DEL_SERVER node rewrite from the preceding net/qrtr patches, so
a Fixes: tag pointing at the original ath11k commit would invite stable
tooling to pick this up without those dependencies.

Would it help to say so explicitly in the commit message, for example
"depends on the preceding net/qrtr changes; not suitable for stable on its
own", instead of leaving the tag out silently?

> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 7dc07339b9579..dadf78f30b897 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3170,8 +3170,18 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
>  	struct ath11k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to
> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath11k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return 0;
> +

[Severity: High]
Should this return a negative errno rather than 0 when the server belongs
to the other device's node?

The QMI core only drops the service record when ->new_server() returns a
negative value:

drivers/soc/qcom/qmi_interface.c:qmi_recv_new_server() {
	...
	ret = ops->new_server(qmi, svc);
	if (ret < 0)
		kfree(svc);
	else
		list_add(&svc->list_node, &qmi->lookup_results);
}

So returning 0 here keeps the foreign node's WLFW service on this handle's
lookup_results list, even though we deliberately did not connect to it.

When that foreign server later goes away (sibling firmware crash, unbind of
the other card, or its MHI endpoint unregistering), net/qrtr/ns.c
server_del()/ctrl_cmd_bye() call lookup_notify() for every lookup matching
the service/instance, which reaches this device's handle:

drivers/soc/qcom/qmi_interface.c:qmi_recv_del_server() {
	list_for_each_entry_safe(svc, tmp, &qmi->lookup_results, list_node) {
		if (node != -1 && svc->node != node)
			continue;
		...
		if (ops->del_server)
			ops->del_server(qmi, svc);
}

ath11k_qmi_ops_del_server() does no node filtering and posts
ATH11K_QMI_EVENT_SERVER_EXIT unconditionally, which in
ath11k_qmi_driver_event_work() does:

		case ATH11K_QMI_EVENT_SERVER_EXIT:
			set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
			set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);

			if (!ab->is_reset)
				ath11k_core_pre_reconfigure_recovery(ab);

Can this drive crash-flush and recovery on the healthy device whose own
firmware never went down?  Since the new filter also rejects the foreign
node's re-announcement, no matching SERVER_ARRIVE follows, so does that
adapter stay stuck with ATH11K_FLAG_CRASH_FLUSH and ATH11K_FLAG_RECOVERY
set until the driver is reloaded?

Would returning a negative errno here (so the core frees the record), and/or
adding the same node id check to ath11k_qmi_ops_del_server(), cover the
del_server side of the cross-device confusion as well?

>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-qrtr-multi-ep-v2-0-27dd80d841a0%40oss.qualcomm.com

