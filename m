Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875A3C5478C
	for <ath12k@archiver.kernel.org>; Wed, 28 Feb 2024 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vIk4W+/cFKsCUNWtBHMuxaYBOAQVaQJd0uB2YP3vm4=; b=VtL3hM81oIbP26a3HdRYO1kwjv
	TLUslFCQpfHY5UizW05llOo64c5VP16CYmTaC/ef49vUAWLCP4TDojgwxvlDQ5/Ve5zw61bcIcRpd
	XV44WCLrdc2OunwvHz1/V4Sxu5SDZBE+R1+Vmyka655XGDx9G3z7x3gqKHsSQlqWbF/yahawosFcw
	S2JIKQuhkzHD7O+ks9i+svi7bLAkPgo4O9iQ3weMUk1fXG9FBTHrj3gxrvZIAikg2VrJh3Q7083x/
	f3O/PbPyS9FO9mVyL2t7xmexDqi9Ji9n3eWXsfdZI/Vln2oURpySEGdIfKMwF6flXMjubovM350Qv
	v2bPBbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKar-00000009dOH-15tl
	for ath12k@archiver.kernel.org;
	Wed, 28 Feb 2024 14:07:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKao-00000009dMT-1Vtt
	for ath12k@lists.infradead.org;
	Wed, 28 Feb 2024 14:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B7D960CFB;
	Wed, 28 Feb 2024 14:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C18C433C7;
	Wed, 28 Feb 2024 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709129248;
	bh=aiyNEy+DqcKUBkC8EcCyMAFQ1147rb2bWoj6wm7bHmg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=MYVIlY33eSac1Bs1JhQ7UqCT2J7oN7t8c+b1wxmClgXh/Khw+/hA6/mfjINhfRhQu
	 v8n2h4dMgRfp9LJ6d0qHe2tSYYWvIcgc2fFPUMeCJ88EP1HVzB/LZ/3VENiorLWD5p
	 IJ7NsqH6ygvnqBudaO+vmjVlkkwqxCRwZXHzFqFoodbrIKYCbOMriA4cM1uexengTY
	 q9LwnV5FFaIOMgzMKewpfZf99wcHw3GRoNSF7MO3usAn8BHxyXix14brKSnusl5R1X
	 kWu5xM40AMvV+ttYoMOACRhJJ2bdM/tKhz11TZk0PkO7epVm5GC1i3rmzSSYIiiMli
	 k7hFMjKDwntYA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: add rcu lock for ath12k_wmi_p2p_noa_event()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240223054505.438839-1-quic_kangyang@quicinc.com>
References: <20240223054505.438839-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170912924605.3989537.2614593152654573809.kvalo@kernel.org>
Date: Wed, 28 Feb 2024 14:07:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_060730_483885_0922C90E 
X-CRM114-Status: UNSURE (   7.50  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Kang Yang <quic_kangyang@quicinc.com> wrote:

> Warning will appear when running P2P GO:
> 
> WARNING: suspicious RCU usage
> drivers/net/wireless/ath/ath12k/mac.c:583 suspicious rcu_dereference_check() usage!
> other info that might help us debug this:
> rcu_scheduler_active = 2, debug_locks = 1
> no locks held by swapper/0/0.
> stack backtrace:
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc4-wt-ath+ #4
> Call Trace:
>  <IRQ>
>  dump_stack_lvl+0x82/0xa0
>  dump_stack+0x14/0x20
>  lockdep_rcu_suspicious+0x214/0x3b0
>  ath12k_mac_get_ar_by_vdev_id+0x192/0x220 [ath12k]
>  ath12k_wmi_op_rx+0x2d7/0x1b40 [ath12k]
> 
> ath12k_mac_get_ar_by_vdev_id() requires its callers to have called
> rcu_read_lock(), but in ath12k_wmi_p2p_noa_event() it is called without
> doing so, and hence the warning was triggered.
> 
> Add rcu_read_lock() and rcu_read_unlock() to avoid warning.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 9411eecb60cb ("wifi: ath12k: implement handling of P2P NoA event")
> Reported-by: Kalle Valo <quic_kvalo@quicinc.com>
> Closes: https://lore.kernel.org/linux-wireless/87o7cusyvw.fsf@kernel.org/
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ee3b63586b30 wifi: ath12k: add rcu lock for ath12k_wmi_p2p_noa_event()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240223054505.438839-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


