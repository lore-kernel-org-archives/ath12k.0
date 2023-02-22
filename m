Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D72C6379F
	for <ath12k@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBPfiLP1USelKFR1UKr+ZuMfvw+57uFnD1u2XHXI8CY=; b=Fd6D1hsuomr4Xy
	poKIzqjSC197d3G2WB3kWLCzlmRPIoBGnKE15DSuTLEV819Rdli1KU3UXI+CRY8AB0Asv1+AZe0Bb
	IYcBi3wD/m1bu6UFPAk7TiOz+ySpN31fDCaLRVRT4K9TaV+T00L3rqc9M2FLN4x3X3JvpXRvaUGSx
	F9u5iN9qIZoBb/rvgdeSkLIYZ69VlxuzKBYQRkcp33eDFaIAjVMGdwo+EimZtEFyESoUrJ+nGeEss
	qkMl25BJ5tms1mMYMXp+AdSNvUoE7Qbn/bMfyHmTIzZfmbc67M+7+fNsZGldDl0WEz1p3Iah/C++K
	OWES0LUdtJmKlmKyMlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmNZ-00Bvto-Ge
	for ath12k@archiver.kernel.org; Wed, 22 Feb 2023 10:29:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUllA-00Bc9k-SK
	for ath12k@lists.infradead.org; Wed, 22 Feb 2023 09:50:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4616612A1;
	Wed, 22 Feb 2023 09:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71167C433EF;
	Wed, 22 Feb 2023 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677059399;
	bh=Zy/AB927e7zLKu8tj4qqSZ2Xc8kOQYgoE8Tdr5LY5KY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HBa6Rt3WEcuoSAyKUw4BrluCsWSbStnifO6Ce3RPYV1bWohYp3ToV6Ej/tHYJJ9EN
	 tyRobhrHBBedoSag7pS0MOxjGVLT1NgAAwxKflm5MxxBJBNrIZo/Md9jJNijb1R24G
	 RZLIA2+BvkHyqUCDpj2uiIKj5gZd6juycblroldtsYLKmeN+ovTWzisZe00OQgituj
	 1daEOy6DCaQlOeBe3bdgtjAOB8Sd+EL3iUqzv51NYXQ0EhwRRge7IwCz5/mdRw6ssD
	 B6Z93XjVEhBB+FunhiM/rkFKZo9M5bk3GVDE6Bq1c41niWxjHjcjXKaz+m2Ce3X/Yn
	 +5D8fX9/i+aLw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Handle lock during peer_id find
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230122014936.3594-1-quic_rgnanase@quicinc.com>
References: <20230122014936.3594-1-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167705939219.25767.17573630915379659088.kvalo@kernel.org>
Date: Wed, 22 Feb 2023 09:49:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_015001_057958_44688EAC 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> ath12k_peer_find_by_id() requires that the caller hold the
> ab->base_lock. Currently the WBM error path does not hold
> the lock and calling that function, leads to the
> following lockdep_assert()in QCN9274:
> 
> [105162.160893] ------------[ cut here ]------------
> [105162.160916] WARNING: CPU: 3 PID: 0 at drivers/net/wireless/ath/ath12k/peer.c:71 ath12k_peer_find_by_id+0x52/0x60 [ath12k]
> [105162.160933] Modules linked in: ath12k(O) qrtr_mhi qrtr mac80211 cfg80211 mhi qmi_helpers libarc4 nvme nvme_core [last unloaded: ath12k(O)]
> [105162.160967] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W  O       6.1.0-rc2+ #3
> [105162.160972] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0056.2019.0506.1527 05/06/2019
> [105162.160977] RIP: 0010:ath12k_peer_find_by_id+0x52/0x60 [ath12k]
> [105162.160990] Code: 07 eb 0f 39 68 24 74 0a 48 8b 00 48 39 f8 75 f3 31 c0 5b 5d c3 48 8d bf b0 f2 00 00 be ff ff ff ff e8 22 20 c4 e2 85 c0 75 bf <0f> 0b eb bb 66 2e 0f 1f 84 00 00 00 00 00 41 54 4c 8d a7 98 f2 00
> [105162.160996] RSP: 0018:ffffa223001acc60 EFLAGS: 00010246
> [105162.161003] RAX: 0000000000000000 RBX: ffff9f0573940000 RCX: 0000000000000000
> [105162.161008] RDX: 0000000000000001 RSI: ffffffffa3951c8e RDI: ffffffffa39a96d7
> [105162.161013] RBP: 000000000000000a R08: 0000000000000000 R09: 0000000000000000
> [105162.161017] R10: ffffa223001acb40 R11: ffffffffa3d57c60 R12: ffff9f057394f2e0
> [105162.161022] R13: ffff9f0573940000 R14: ffff9f04ecd659c0 R15: ffff9f04d5a9b040
> [105162.161026] FS:  0000000000000000(0000) GS:ffff9f0575600000(0000) knlGS:0000000000000000
> [105162.161031] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [105162.161036] CR2: 00001d5c8277a008 CR3: 00000001e6224006 CR4: 00000000003706e0
> [105162.161041] Call Trace:
> [105162.161046]  <IRQ>
> [105162.161051]  ath12k_dp_rx_process_wbm_err+0x6da/0xaf0 [ath12k]
> [105162.161072]  ? ath12k_dp_rx_process_err+0x80e/0x15a0 [ath12k]
> [105162.161084]  ? __lock_acquire+0x4ca/0x1a60
> [105162.161104]  ath12k_dp_service_srng+0x263/0x310 [ath12k]
> [105162.161120]  ath12k_pci_ext_grp_napi_poll+0x1c/0x70 [ath12k]
> [105162.161133]  __napi_poll+0x22/0x260
> [105162.161141]  net_rx_action+0x2f8/0x380
> [105162.161153]  __do_softirq+0xd0/0x4c9
> [105162.161162]  irq_exit_rcu+0x88/0xe0
> [105162.161169]  common_interrupt+0xa5/0xc0
> [105162.161174]  </IRQ>
> [105162.161179]  <TASK>
> [105162.161184]  asm_common_interrupt+0x22/0x40
> 
> Handle spin lock/unlock in WBM error path to hold the necessary lock
> expected by ath12k_peer_find_by_id().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-03171-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

95a389e2ff32 wifi: ath12k: Handle lock during peer_id find

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230122014936.3594-1-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
