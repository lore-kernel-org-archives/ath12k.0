Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AB7C25B75
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgQEe+CUrRBQ0AzaDx9yJeDNKcKu1OANs3rWenqByXA=; b=AFEln32RjXIwsDc46nX0Q+RDyt
	nieLwj8uObT5NtqQhC23d+Zy2wGBJDVcdp3JfWwkG05OGDuupv1C6TdMmYetcQBPsJWBTc3nbX67h
	kpiPf3tQiLL7W4uBfqI6UAwpbDxirFQdrVlKZwNW27Gt66EcVoaS4uTPlRfgCjdWkEPUX2jQFw576
	mpfRt5vM7L1YFaUjX1Th0k6NoEv+/e72TF2rA63Bzr6vAH2HjJ+jK7Jj/TCopS8M4t6+aCoNYFKXl
	jO4Rcc8BIgcOt1buYUiKBnmFOSMcXxytmPKTowAUnXTSUWROKogtpjBXPURhjlmdP5+FWi3Z3t/lM
	bshLQDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABcQ-00000006osf-0HAW
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 16:48:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABcN-00000006osC-2gDz
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 16:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A93E162E5E;
	Thu, 23 May 2024 16:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D37C2BD10;
	Thu, 23 May 2024 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716482918;
	bh=9gx+ourYVhlhZCxSr2aEDzAYZlVvSbuxXz0Wj09tqhU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=O7yp5lZ55fsW8KUCIS0u2s1pKeWrmDcW/sTlyyMAvcFVeH24beuybbofggqUnSTkd
	 nl08aLzbcLCElkZi4MzYjjUGA2ySOy+jv95k3Rtl0NkU42wb03y56jDjRrPhNQbpYj
	 TIPjWay4Zj/IhTA5G9COPW8O1r0u61d8BHKiNG9O5l0VMS7RINHzWlb4Q2VIPYrYHI
	 GDk1Wftwhk5pinTJmpLLsc+M8ZlZiTSNjnkqfaPV4SqbT2Mlnh/eNVispJm3v7w57a
	 sYAMVTzSC6VH56YCwCeKcWq338FyD/d90nWI5jmqsMeK7sJ9FBG6RNb7ftjR1wBySZ
	 ctWlQisd7pkvw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] wifi: ath12k: add support for WoW
References: <20240523033143.21677-1-quic_bqiang@quicinc.com>
Date: Thu, 23 May 2024 19:48:35 +0300
In-Reply-To: <20240523033143.21677-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Thu, 23 May 2024 11:31:36 +0800")
Message-ID: <875xv4bhjw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_094839_885792_239D5311 
X-CRM114-Status: GOOD (  10.42  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Add support for WoW (Wakeup on Wireless) funtionalities, this including
> magic-pattern, net-detect, disconnect and patterns, HW data filter, ARP
> and NS offload, GTK rekey offload.
>
> Also enable keepalive before suspend to avoid unexpected kick out by AP.
>
> v2:
>  - [2/7] wifi: ath12k: add basic WoW functionalities
> 	1. In ath12k_wow_convert_8023_to_80211(), change to use 'size_t'
> 	   instead of 'int' to make GCC happy
>  - [5/7] wifi: ath12k: support ARP and NS offload
> 	1. In ath12k_mac_arvif_get_arp_ns_offload(), change to use
> 	   GFP_ATOMIC to fix kernel crash due to sleep in invalid context
>  - rebased on ToT
> 	
> Baochen Qiang (7):
>   wifi: ath12k: implement WoW enable and wakeup commands
>   wifi: ath12k: add basic WoW functionalities
>   wifi: ath12k: add WoW net-detect functionality
>   wifi: ath12k: implement hardware data filter
>   wifi: ath12k: support ARP and NS offload
>   wifi: ath12k: support GTK rekey offload
>   wifi: ath12k: handle keepalive during WoWLAN suspend and resume

I see new kmemleak warnings with ath-pending-202405231313, I'm assuming
it's from this patchset but didn't check. I see a lot of warnings like
below but I can provide more information tomorrow if needed.

unreferenced object 0xffff88814fa4d800 (size 1024):
  comm "wpa_supplicant", pid 11989, jiffies 4296591308
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
    fe 80 00 00 00 00 00 00 02 03 7f ff fe 37 16 02  .............7..
  backtrace (crc 3f321b49):
    [<ffffffff8dbdd8d5>] kmemleak_alloc+0x45/0x80
    [<ffffffff8b573984>] kmalloc_trace+0x284/0x2d0
    [<ffffffffc0e634e2>] ath12k_mac_arvif_get_arp_ns_offload+0x72/0xd0 [ath12k]
    [<ffffffffc0e6b437>] ath12k_mac_op_ipv6_changed+0xc7/0x1470 [ath12k]
    [<ffffffffc077e797>] ieee80211_ifa6_changed+0x1c7/0x3a0 [mac80211]
    [<ffffffff8afeb177>] notifier_call_chain+0x97/0x310
    [<ffffffff8afeb72d>] atomic_notifier_call_chain+0x5d/0x140
    [<ffffffff8d918796>] inet6addr_notifier_call_chain+0x16/0x20
    [<ffffffff8d7f193a>] addrconf_ifdown.isra.0+0xa8a/0x1700
    [<ffffffff8d800895>] addrconf_notify+0x105/0xdd0
    [<ffffffff8afeb177>] notifier_call_chain+0x97/0x310
    [<ffffffff8afeb571>] raw_notifier_call_chain+0x11/0x20
    [<ffffffff8d277e1b>] call_netdevice_notifiers_info+0x8b/0xf0
    [<ffffffff8d28ec33>] __dev_notify_flags+0x163/0x240
    [<ffffffff8d290771>] dev_change_flags+0xf1/0x150
    [<ffffffff8d647406>] devinet_ioctl+0x1116/0x19b0

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

