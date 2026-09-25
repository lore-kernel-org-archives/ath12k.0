Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE5BC9832A
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 07:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4wdaguWE/ZqpPdeXzSQfiixTrYmLIJekiR1g9Uc47M=; b=IRRhVxkmbr4mIvvmwTOzBK2CE0
	ZqPPV3ecy9IXQ8n2TQQHpIKWUN84mjLukujGQgRk5tzis8KGxXcRbKHG6FPipR61BKY69ShNg95pL
	sCK3K7wmpxrPfB5xn7d+F7n8nNlSIkC4+uK3/atg0JiQuoZrHvcNVmKiM6lZGpr/0SA/5foTEDEu/
	JonyW2Ruy32Smfm737E2kD75kgAupmGjDYJi00OBOYqp2cIofYnC/l8QTHHM/rWAbMP0Ntuay7Jmb
	jFGVDcq+p3Sz5g6RLe4MFmvICU+9HipNW380Pgm9+JuOpVN9H9x1zajkQpmHCcfl5xQSIExUmMggE
	zpjJ/3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0aP-0000000Cpc6-0VBc;
	Fri, 25 Sep 2026 07:43:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0aM-0000000CpYB-1MNL;
	Fri, 25 Sep 2026 07:43:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCE156025F;
	Fri, 25 Sep 2026 07:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE041F00893;
	Fri, 25 Sep 2026 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322189;
	bh=J4wdaguWE/ZqpPdeXzSQfiixTrYmLIJekiR1g9Uc47M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZNaeOYUARCnFTkJ8RwGy8wachYINCt+qUCQS5bJWdcwyeFetQTq814utR/08JM1mh
	 01xyv0JJioI067Lbp1B1xzh1RLTyxO9VhOAvpItUBEXyW3wniNOMUfaubbxRs1Li1i
	 C/IIoKGPkesLPZ0KwyNss+6DzyyhC3lVEgdcGAq+W6qEIG9E/0+bJqOKUjxWrb8iTa
	 UBdjL6pQqiEMyceB6aoYdIwI6su5pDzhcqa/CdrXPoaf74g6xmWMBQ5ycEKm4wLH1W
	 HPLMfmvo34gFHphnxLn/NgMOxmoWVR5BgkT3VjmS4sE7VJfNk75klCKQWE0JXY5muK
	 zg4kZQyQh042A==
Subject: Re: [PATCH v3 4/4] wifi: ath12k: Connect to the QMI server belonging
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
Date: Fri, 25 Sep 2026 07:43:07 +0000
Message-ID: <179032218792.2160803.6446248222489442159@kernel.org>
In-Reply-To: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Asymmetric node-id filtering in ath12k QMI:
  ath12k_qmi_ops_new_server()…

--

wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver

This patch adds a get_qrtr_node_id() HIF callback that returns the QRTR node
id derived from the MHI controller index, and uses it in the QMI new_server
callback to skip WLFW services that live on a different node. A node id of
zero keeps the previous unfiltered behaviour.

> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 280e50a1f31d8..e1e75cc9d1441 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c

[ ... ]

> @@ -3940,8 +3941,18 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
>  	struct ath12k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to
> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath12k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return 0;
> +

[Severity: High]
Should this return a negative errno instead of 0 for the foreign node?

In drivers/soc/qcom/qmi_interface.c, qmi_recv_new_server() only discards the
service record when the callback returns a negative value:

	ret = ops->new_server(qmi, svc);
	if (ret < 0)
		kfree(svc);
	else
		list_add(&svc->list_node, &qmi->lookup_results);

With the return 0 above, the other device's WLFW service stays in this
handle's lookup_results even though this device never connected to it.

The matching teardown path in the same qmi_ops table has no node id check:

drivers/net/wireless/ath/ath12k/qmi.c:ath12k_qmi_ops_del_server() {
	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
	struct ath12k_base *ab = qmi->ab;

	ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi wifi fw del server\n");
	ath12k_qmi_driver_event_post(qmi, ATH12K_QMI_EVENT_SERVER_EXIT, NULL);
}

and qmi_recv_del_server() invokes it for every retained entry whose node
matches, with qmi_recv_bye() passing port == -1 to match all ports on the
dying node:

drivers/soc/qcom/qmi_interface.c:qmi_recv_del_server() {
	list_for_each_entry_safe(svc, tmp, &qmi->lookup_results, list_node) {
		if (node != -1 && svc->node != node)
			continue;
		if (port != -1 && svc->port != port)
			continue;

		if (ops->del_server)
			ops->del_server(qmi, svc);
	...
}

net/qrtr/ns.c:server_del() notifies every lookup matching service/instance
regardless of node, so device A's handle does receive DEL_SERVER or BYE for
device B's node when device B's firmware crashes or that card is unbound or
hot-removed.

Can that spuriously fault the healthy device? The event worker reacts to
SERVER_EXIT unconditionally:

drivers/net/wireless/ath/ath12k/qmi.c:ath12k_qmi_driver_event_work() {
	...
		case ATH12K_QMI_EVENT_SERVER_EXIT:
			set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
	...
}

ATH12K_FLAG_CRASH_FLUSH makes CE sends, WMI sends, data TX
(ath12k_wifi7_dp_tx()) and mgmt TX return -ESHUTDOWN, and it makes
ath12k_core_stop() skip ath12k_dp_reoq_lut_addr_reset() and
ath12k_qmi_firmware_stop() on a device whose firmware is still running:

drivers/net/wireless/ath/ath12k/core.c:ath12k_core_stop() {
	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
		ath12k_dp_reoq_lut_addr_reset(ath12k_ab_to_dp(ab));
		ath12k_qmi_firmware_stop(ab);
	}
	...
}

The flag is only cleared on a later FW_READY event or on core reconfigure,
so the untouched device can stay in this state indefinitely.

Would returning a negative errno here (so the foreign service is never
tracked), and/or adding the same service->node check to
ath12k_qmi_ops_del_server(), cover the teardown direction as well?

There is a second effect from the retained entries: each filtered
NEW_SERVER adds another node of the foreign device into lookup_results,
so a foreign device in a firmware restart loop accumulates duplicate
entries that each later produce their own SERVER_EXIT post.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-qrtr-multi-ep-v3-0-c00831e88957%40oss.qualcomm.com

