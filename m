Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A72C47258
	for <ath12k@archiver.kernel.org>; Thu, 25 Jan 2024 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/KXDtoAjpCoolBNq4ZIT7ma8bSh7Ud0+bB81eOF/nc=; b=S4WhRjoVakGc8bRjvqvNF81JXJ
	NSnibzOBKpzWe3HFiB8cdGqxHgwiw5iLsnSgaj17s6qo7e/HpRgzp96KoPGhl/UotT8u63ZSHYlaq
	Q6EhcfB/L5Wr9WUngvnaIttJ+n/7l0KnIWkhXAI9Y7GtotLO/y4TZ+rKtPwyO8BHexWpgmRCuKV/D
	YgnttWE/t8KsXUWwua7XpovQ7WH9j0YyGyQJgeP4tPnYjFOoJmlO42A4nRCJLSfdp1ljB+ngpxvtV
	Zc/WiVClZ2FbNE08K37FiIl4oEZFuKqFRG/chAtDgfihsLO8CO7J4QXuoVbPatn87U/+RyafmD3AU
	dtqEAiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0yM-00000000QBM-3TrO
	for ath12k@archiver.kernel.org;
	Thu, 25 Jan 2024 14:44:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0yJ-00000000QAj-2VBg
	for ath12k@lists.infradead.org;
	Thu, 25 Jan 2024 14:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0ED96221F;
	Thu, 25 Jan 2024 14:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C5CC433F1;
	Thu, 25 Jan 2024 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706193889;
	bh=BL3lUnsRqGCbUnIu/uOKwxG8uQe+l2907he7WcNy65Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FeYDH+SKaC9jBPyQELTIBCbfyPETkmzHRmX+zqQjRRILV6i0NeoCrJoz+2kKouE96
	 wM9OIa2YKBzpd8UnQHcftwFJEDuIWVyRzU3i8tfReuFMBJgFubznbqHEm2vWU7hucK
	 Ioo2GjiOZIwtSWmAo8gxPrWvSb2oKub4Zlr3doeGq9ThwCj17Vd2FgxaM2gmi4t4Tr
	 wRjBGjgyyDtRu6Qls24OxUzR3svZ72s4ak0ZICFYFzBHUwDojyk/b2DxT6Fc6BUmua
	 mCNZnWxMHMwpsjtS4a8AdZkmU0yvvIdoXW7yl37v9lZ1XoMTZKkZfuMeJAH/vjsYB1
	 Ep/NXEVEjJFpw==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 00/10] wifi: ath12k: P2P support for WCN7850
References: <20240122113904.8938-1-quic_kangyang@quicinc.com>
Date: Thu, 25 Jan 2024 16:44:46 +0200
In-Reply-To: <20240122113904.8938-1-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Mon, 22 Jan 2024 19:38:54 +0800")
Message-ID: <87cytp1nhd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_064451_766064_9F899A58 
X-CRM114-Status: GOOD (  11.00  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> Add P2P support for WCN7850.
>
> Kang Yang (10):
>   wifi: ath12k: change interface combination for P2P mode
>   wifi: ath12k: add P2P IE in beacon template
>   wifi: ath12k: implement handling of P2P NoA event
>   wifi: ath12k: implement remain on channel for P2P mode
>   wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
>   wifi: ath12k: allow specific mgmt frame tx while vdev is not up
>   wifi: ath12k: fix broken structure wmi_vdev_create_cmd
>   wifi: ath12k: move peer delete after vdev stop of station for WCN7850
>   wifi: ath12k: designating channel frequency for ROC scan
>   wifi: ath12k: advertise P2P dev support for WCN7850
>
> v3: rebase on new ath-tag, use ath12k_ah_to_ar() get ar(Karthikeyan).
> v2:
>     1. add Tested-on tag of QCN9274.
>     2. update copyright in patch #1, #2, #4 and #10.

I have not been able to run any p2p tests yet but during rmmod with
WCN7850 I now see:

[  136.260660] ------------[ cut here ]------------
[  136.260909] UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/mac.c:6005:38
[  136.261008] shift exponent 255 is too large for 64-bit type 'long long int'
[  136.261096] CPU: 1 PID: 1993 Comm: rmmod Not tainted 6.8.0-rc1-wt-ath+ #1262
[  136.261180] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
[  136.261261] Call Trace:
[  136.261343]  <TASK>
[  136.261427]  dump_stack_lvl+0x82/0xc0
[  136.261513]  dump_stack+0x10/0x20
[  136.261597]  __ubsan_handle_shift_out_of_bounds+0x13f/0x300
[  136.261711]  ath12k_mac_op_remove_interface.cold+0x17/0x86 [ath12k]
[  136.261941]  drv_remove_interface+0x215/0x4a0 [mac80211]
[  136.262102]  ieee80211_do_stop+0xfe4/0x2390 [mac80211]
[  136.262258]  ? trace_contention_end+0xe2/0x110
[  136.262359]  ? ieee80211_del_virtual_monitor+0x60/0x60 [mac80211]
[  136.262507]  ? mutex_lock_io_nested+0x1260/0x1260
[  136.262610]  ? debug_smp_processor_id+0x17/0x20
[  136.262702]  ? trace_contention_end+0xe2/0x110
[  136.262792]  ieee80211_sdata_stop+0x4d/0x70 [mac80211]
[  136.262961]  ieee80211_stop_p2p_device+0xd/0x10 [mac80211]
[  136.263127]  cfg80211_stop_p2p_device+0x18e/0x580 [cfg80211]
[  136.263282]  cfg80211_shutdown_all_interfaces+0x10c/0x190 [cfg80211]
[  136.263434]  ieee80211_remove_interfaces+0xc7/0x8f0 [mac80211]
[  136.263611]  ? __wait_for_common+0x42f/0x6d0
[  136.263702]  ? ieee80211_sdata_stop+0x70/0x70 [mac80211]
[  136.263881]  ieee80211_unregister_hw+0x4f/0x380 [mac80211]
[  136.264045]  ath12k_mac_hw_unregister+0x7a/0x250 [ath12k]
[  136.264155]  ath12k_mac_unregister+0x7f/0xc0 [ath12k]
[  136.264265]  ath12k_core_deinit+0x2e/0x130 [ath12k]
[  136.264372]  ath12k_pci_remove+0xad/0x1a0 [ath12k]
[  136.264478]  pci_device_remove+0x93/0x1b0
[  136.264567]  device_remove+0xbf/0x150
[  136.264662]  device_release_driver_internal+0x3c3/0x580
[  136.264746]  ? __kasan_check_read+0x11/0x20
[  136.264836]  driver_detach+0xc4/0x190
[  136.264924]  bus_remove_driver+0x130/0x2a0
[  136.265012]  driver_unregister+0x68/0x90
[  136.265095]  pci_unregister_driver+0x24/0x240
[  136.265177]  ? find_module_all+0x13e/0x1c0
[  136.265267]  ath12k_pci_exit+0x10/0x20 [ath12k]
[  136.265372]  __do_sys_delete_module+0x32d/0x540
[  136.265454]  ? module_flags+0x300/0x300
[  136.265708]  ? kmem_cache_free+0xea/0x3a0
[  136.265795]  ? __fput+0x404/0xa50
[  136.265887]  ? debug_smp_processor_id+0x17/0x20
[  136.265983]  __x64_sys_delete_module+0x4f/0x70
[  136.266064]  do_syscall_64+0x66/0x130
[  136.266149]  entry_SYSCALL_64_after_hwframe+0x46/0x4e
[  136.266256] RIP: 0033:0x7efe74591c8b
[  136.266347] Code: 73 01 c3 48 8b 0d 05 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d5 c1 0c 00 f7 d8 64 89 01 48
[  136.266435] RSP: 002b:00007ffea9c34cb8 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
[  136.266550] RAX: ffffffffffffffda RBX: 000055db95b4c7e0 RCX: 00007efe74591c8b
[  136.266679] RDX: 000000000000000a RSI: 0000000000000800 RDI: 000055db95b4c848
[  136.266808] RBP: 00007ffea9c34d18 R08: 0000000000000000 R09: 0000000000000000
[  136.266934] R10: 00007efe7460dac0 R11: 0000000000000206 R12: 00007ffea9c34ef0
[  136.267062] R13: 00007ffea9c36ebf R14: 000055db95b4b2a0 R15: 000055db95b4c7e0
[  136.267221]  </TASK>
[  136.267390] ---[ end trace ]---

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

