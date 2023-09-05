Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2430CC83F33
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RaWXcLdh6e1hJYZ+OxQKZmt3fq4Bzw15KZwRIlT89M=; b=Ny7GouKqSMnq20
	IaKr3Wx02LXT29WxFYp1I21T5rsNKwnh5ybjjBydSZhoD8pval/EWVho+7OzHyWQGtNWoLxMDjKl5
	0TNrqIU8gQXClU3JdcmaZvC3gJrFRf4kuEgtHvKQKmY38tATnZNJNsE4a/noRNvIf049Ttv6xuosT
	rGoHuxBYG0NnrXR8RLFt0Ffwj6KSPnchio468WPYC+72bfGJvQQ+joglxV4b/JENPUmrOk9hYQW4/
	0VMoBS1yNn3UgJCYguo70qqxOAziS8YgTgDlZuXG16umD3pXEjB8fZtVEcQeoUVQDjV2OFBA1umvf
	zQTItYKHYz09sZa0dqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW58-0065rz-2g
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 13:27:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW54-0065qs-2v
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 13:27:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E68FD60909;
	Tue,  5 Sep 2023 13:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60620C433C8;
	Tue,  5 Sep 2023 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693920415;
	bh=nYwFMATp/Xv5PYiiX2QDNP7K3dchpHCAjLpN24WxQGc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GQmgTiu6wrrRFXqICJpsFftcxLlb5MXLKyijTpg11pIibfO+inyFyHGGdbFoqmsZy
	 FGeABNYmGRK729Ncbh2/0Sgp0GIKlttf7aQTxqb6bTxNNmloNixWNrXRgf/bI01g7F
	 Emskw0Z52zdq4T60squ6dHKml7pj8fIYaza0dKrGXPGpZHdpOuzEXv1EDoz7dM1hmn
	 1NAQs/2Hz7ufzjOu9EdVa78Dz7qtjPccQU5i63GWkDEzUOeaVM/ch6hPVfAOl6RQxt
	 gGMdMbQQKptFo2lnAYfG8ZwbsrYQqvLI2SXBmV2zXaRVY0PxheB6JhBnIHAugMKLSL
	 v+80OWF9sjseA==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Ignore fragments from uninitialized
 peer
 in  dp
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230821130343.29495-2-quic_hprem@quicinc.com>
References: <20230821130343.29495-2-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Harshitha Prem <quic_hprem@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169392041226.3610046.3872550352211944428.kvalo@kernel.org>
Date: Tue,  5 Sep 2023 13:26:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_062659_631439_C8DB1ED6 
X-CRM114-Status: GOOD (  11.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Harshitha Prem <quic_hprem@quicinc.com> wrote:

> When max virtual ap interfaces are configured in all the bands with
> ACS and hostapd restart is done every 60s, a crash is observed at
> random times.
> 
> In the above scenario, a fragmented packet is received for self peer,
> for which rx_tid and rx_frags are not initialized in datapath.
> While handling this fragment, crash is observed as the rx_frag list
> is uninitialized and when we walk in ath12k_dp_rx_h_sort_frags,
> skb null leads to exception.
> 
> To address this, before processing received fragments we check
> dp_setup_done flag is set to ensure that peer has completed its
> dp peer setup for fragment queue, else ignore processing the
> fragments.
> 
> Call trace:
>     PC points to "ath12k_dp_process_rx_err+0x4e8/0xfcc [ath12k]"
>     LR points to "ath12k_dp_process_rx_err+0x480/0xfcc [ath12k]".
>     The Backtrace obtained is as follows:
>     ath12k_dp_process_rx_err+0x4e8/0xfcc [ath12k]
>     ath12k_dp_service_srng+0x78/0x260 [ath12k]
>     ath12k_pci_write32+0x990/0xb0c [ath12k]
>     __napi_poll+0x30/0xa4
>     net_rx_action+0x118/0x270
>     __do_softirq+0x10c/0x244
>     irq_exit+0x64/0xb4
>     __handle_domain_irq+0x88/0xac
>     gic_handle_irq+0x74/0xbc
>     el1_irq+0xf0/0x1c0
>     arch_cpu_idle+0x10/0x18
>     do_idle+0x104/0x248
>     cpu_startup_entry+0x20/0x64
>     rest_init+0xd0/0xdc
>     arch_call_rest_init+0xc/0x14
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

bbc86757ca62 wifi: ath12k: Ignore fragments from uninitialized peer in  dp
d48f55e773dc wifi: ath12k: fix undefined behavior with __fls in dp

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230821130343.29495-2-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
