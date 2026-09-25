Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8CC98321
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df/rcik3ciH0T5j4zVtm4u/LsbXi8S3iVa1QY4LIHQE=; b=zJId1afTUIy6XzNxFEeBysjJ7Y
	qUkX9gndF3SFTxi+AO5rIaiSpJcR8opPmj3tbrG/kLMClzHWR29NkozNX57jqUn8Z2IcCimeMask5
	/JiLCcQqHBcFQEh4b3x3B4akTlaCjCwCDh6ihtSi3L63WHzuvl3AMZ4By8tRVOG0QwxMJB9p8197R
	jYxFIO8ujy8r921G927zISzYdWyM0LEFsnbbZovZ7LHEFrt0zGv1PaPFOm++4Wxxb/L3j5Nb7jr1g
	rFlmaGyBQHm3I8Ozz+SDGI0Vi1DofzXkzkBJt3jje1Kyxp/u8/8aloSEkEOE33gicJv22kzUImc9Y
	SRP3d3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0aM-0000000CpZg-2rcR;
	Fri, 25 Sep 2026 07:43:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0aK-0000000CpWV-1wAu;
	Fri, 25 Sep 2026 07:43:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D60D843E68;
	Fri, 25 Sep 2026 07:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7481F000FF;
	Fri, 25 Sep 2026 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322187;
	bh=df/rcik3ciH0T5j4zVtm4u/LsbXi8S3iVa1QY4LIHQE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oMGtJMPLxzauwign7hBH0kbYO7Rs6BiU+E95eSjN/pktPpNfn7eG4TpZK0GGBiYBt
	 JIXoXbcRikqA/oUORD+y7kH++JhjcGTf80ieL8d0eFs/Cnd7E8HGZMXkOsd/YqoVJd
	 NImapjQtPbC6ld9pH3NwfkLv6Jh3zL82sOZK+9I/8t6new75tOiA4dRmKcWCM45tLn
	 5fzFaaRzRUUbNfx6N33+THUEst8SVvVkVClpuIvKHrWRQJpuf2qVraIZRSv6kn3z/C
	 Rjz67wlMJ2lQpk/VjC69rdaquOfCfueAtYnjhKwhN/EChzP0GfaVcSvPBUjtCII96Y
	 +YTdFtrHoFcSA==
Subject: Re: [PATCH v3 3/4] wifi: ath11k: Connect to the QMI server belonging
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
 jeff.hugo@oss.qualcomm.com, vasanthakumar.thiagarajan@oss.qualcomm.com
Date: Fri, 25 Sep 2026 07:43:06 +0000
Message-ID: <179032218619.2160803.9998831305142493842@kernel.org>
In-Reply-To: <20260922-qrtr-multi-ep-v3-3-c00831e88957@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-3-c00831e88957@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Asymmetric QMI node-id filtering in ath11k:
  ath11k_qmi_ops_new_server()…

Pre-existing issues:
- [High] ath11k_qmi_init_service()
  (drivers/net/wireless/ath/ath11k/qmi.c:3328-3364) never calls…

--

wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver

This adds a get_qrtr_node_id() HIF callback that returns the QRTR node id
derived from the MHI controller index, and uses it in
ath11k_qmi_ops_new_server() to skip WLFW servers advertised by other
devices.  A node id of zero keeps the previous unfiltered behaviour.

> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 7dc07339b9579..9484b0eee1a9f 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3170,8 +3170,18 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
>  	struct ath11k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
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

[Severity: High]
Should the skip path return a negative errno instead of 0?

The QMI core only discards the service record when the callback returns a
negative value:

drivers/soc/qcom/qmi_interface.c:qmi_recv_new_server() {
	...
	ret = ops->new_server(qmi, svc);
	if (ret < 0)
		kfree(svc);
	else
		list_add(&svc->list_node, &qmi->lookup_results);
	...
}

and include/linux/soc/qcom/qmi.h documents the consequence:

 * @new_server:		inform client of a new_server lookup-result, returning
 *                      successfully from this call causes the library to call
 *                      @del_server as the service is removed from the
 *                      lookup-result.

So with return 0 the foreign device's server stays in this handle's
lookup_results.  The counterpart callback has no node id check:

drivers/net/wireless/ath/ath11k/qmi.c:ath11k_qmi_ops_del_server() {
	...
	ath11k_dbg(ab, ATH11K_DBG_QMI, "wifi fw del server\n");
	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_SERVER_EXIT, NULL);
}

When the twin device's WLFW server goes away (its firmware crash/SSR,
unbind, MHI power down, or a QRTR BYE for its node),
qmi_recv_del_server()/qmi_recv_bye() match the retained entry and call
ath11k_qmi_ops_del_server() on this device's handle, which reaches:

drivers/net/wireless/ath/ath11k/qmi.c:ath11k_qmi_driver_event_work() {
	...
		case ATH11K_QMI_EVENT_SERVER_EXIT:
			set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
			set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);

			if (!ab->is_reset)
				ath11k_core_pre_reconfigure_recovery(ab);
	...
}

Can this force a healthy device into crash recovery even though its own
firmware and MHI channels never went away, with no matching
SERVER_ARRIVE for its own node to clear the flags?  That would leave the
cross-device coupling the commit message describes in place on the
teardown half of the qmi_ops pair.

Would returning -ENODEV here (matching the existing kernel_connect()
failure return) so the foreign svc is never tracked, and/or applying the
same node_id && service->node != node_id test in
ath11k_qmi_ops_del_server(), be the intended behaviour?

Two smaller points on the same hunk: each retained foreign entry also
causes an extra event post during qmi_handle_release() in
ath11k_qmi_deinit_service(), and the silent return 0 leaves no
ath11k_dbg() trace, so a mis-derived node id (no server ever accepted,
device never comes up) is hard to diagnose.  Would an ath11k_dbg() line
on the skip path help here?

The same pattern is repeated in the following ath12k commit "wifi:
ath12k: Connect to the QMI server belonging to the device owned by this
driver"; nothing later in the series changes the return value here or
adds a filter to ath11k_qmi_ops_del_server().

[ ... ]

One more observation in the same file, outside the diff:

[Severity: High]
This isn't a bug introduced by this patch, but ath11k_qmi_init_service()
does not call qmi_handle_release() on the two failure paths that run
after qmi_handle_init() has already succeeded:

drivers/net/wireless/ath/ath11k/qmi.c:ath11k_qmi_init_service() {
	...
	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
	if (!ab->qmi.event_wq) {
		ath11k_err(ab, "failed to allocate workqueue\n");
		return -EFAULT;
	}
	...
	if (ret < 0) {
		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
		destroy_workqueue(ab->qmi.event_wq);
		return ret;
	}
	...
}

By that point qmi_handle_init() has allocated qmi->recv_buf, created
qmi->wq, and created a bound QRTR socket via qmi_sock_create(), which
installs:

drivers/soc/qcom/qmi_interface.c:qmi_sock_create() {
	...
	sock->sk->sk_user_data = qmi;
	sock->sk->sk_data_ready = qmi_data_ready;
	sock->sk->sk_error_report = qmi_data_ready;
	...
}

ath11k_core_soc_create() then propagates the error without any QMI
cleanup:

drivers/net/wireless/ath/ath11k/core.c:ath11k_core_soc_create() {
	...
	ret = ath11k_qmi_init_service(ab);
	if (ret) {
		ath11k_err(ab, "failed to initialize qmi :%d\n", ret);
		return ret;
	}
	...
}

and ath11k_pci_probe() unwinds and frees the containing ath11k_base.

Does this leak the recv_buf, the ordered workqueue and the QRTR socket,
and leave the still-bound socket's sk_user_data and sk_data_ready
pointing at the freed ath11k_base, so that qmi_data_ready() dereferences
freed memory for any datagram delivered to that port?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-qrtr-multi-ep-v3-0-c00831e88957%40oss.qualcomm.com

