Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A30C3DA7F
	for <ath12k@archiver.kernel.org>; Mon,  5 Aug 2024 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R39Gtk2tQV8j0yEVZ6n/oEFmNQduz8huRMsZZGjYa4A=; b=Ie509nG9G1VumDKyd4Hlynbwbb
	ATiSCeTD99vTZ/lI7QoirW/ZLnkecKG4hzP6f2rV8MEynagkekVwenmw6anuQL72atQreV0e7L/uP
	Kh9iKzACw4Kq0BNHOgaypTfS/QR0a/NuoE1MfVK1sckftQPyJxnuSuqP7+Weo7drI3iy63Vjm7nzL
	2Ot7rwMkVwBRLleGDCI+bub12iVKhyyIwrO5jSBzKbX9sFJF+sZRV11ASH1jQ4bFoYaMQuAOsyCZV
	lbMtdXKQiZ9Qp8LjvKbuGj/lFwkonZxMW2V2hdjnZ2ESPkUik0B2ANDIXs3+iNP0oeKd61fAHkmJc
	V2SNaRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saui7-0000000FRrB-0Dem
	for ath12k@archiver.kernel.org;
	Mon, 05 Aug 2024 10:13:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saui4-0000000FRqV-0I8T
	for ath12k@lists.infradead.org;
	Mon, 05 Aug 2024 10:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 45301CE0283
	for <ath12k@lists.infradead.org>; Mon,  5 Aug 2024 10:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30430C4AF0D
	for <ath12k@lists.infradead.org>; Mon,  5 Aug 2024 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722852777;
	bh=jfxjGz8is33+86QNks83S2Bzsvqyk3zxBFQlSuCI2Dg=;
	h=From:To:Subject:References:Date:In-Reply-To:From;
	b=EY56ZBmq1G+aj1d8jMR6FSb+QKh2jJQ5gqP3yOKbwrNEMrBnzqo1nSn3KILgdZV61
	 UEIOjoQCjBXuRm/1ydjEKEGotLu/9CZUQqpHG8eYXf8Aa3ZRyGho6ClkPFwJMeRYrl
	 paaALNoxcE3/jA7hEydWFD3OmcNb3UbQf6SuAZWTTMPK1jtMt51i0c9fGk8ID3ZTtp
	 1z3oxH807W8anshhcU9Z0ObAEGTuDgw/yoh+ubKTHlhaKG+BEHaVc1I8ZLQ4U0NV1O
	 EdFTZ0QJDsG732pa2mkfj72lHd0wjP1FNJ5/PII6gofSG2lRabB7SdDYET9sPi4acO
	 H13mN1AeIXMIA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Subject: Re: New warning in v6.11-rc1: BUG: using smp_processor_id() in
 preemptible [00000000] code: rtcwake/2121
References: <87a5hw8ei4.fsf@kernel.org>
Date: Mon, 05 Aug 2024 13:12:55 +0300
In-Reply-To: <87a5hw8ei4.fsf@kernel.org> (Kalle Valo's message of "Thu, 01 Aug
	2024 18:11:15 +0300")
Message-ID: <87bk276zx4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_031300_309304_38E47AED 
X-CRM114-Status: UNSURE (   9.20  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Hi,
>
> Just to make sure everyone is aware. I just updated the ath.git main
> branch to v6.11-rc1 and I see a new warning in our suspend tests:
>
> [ 546.233940] BUG: using smp_processor_id() in preemptible [00000000]
> code: rtcwake/2121
> [  546.233960] caller is debug_smp_processor_id+0x17/0x20
> [  546.233970] CPU: 5 UID: 0 PID: 2121 Comm: rtcwake Not tainted 6.11.0-rc1 #1685
> [ 546.233975] Hardware name: Intel(R) Client Systems
> NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
> [  546.233978] Call Trace:
> [  546.233981]  <TASK>
> [  546.233985]  dump_stack_lvl+0xa4/0xe0
> [  546.233991]  dump_stack+0x10/0x20
> [  546.233995]  check_preemption_disabled+0xce/0xe0
> [  546.234003]  debug_smp_processor_id+0x17/0x20
> [  546.234008]  hotplug_cpu__broadcast_tick_pull+0x20/0x280
> [  546.234017]  takedown_cpu+0x197/0x410
>
> There's a fix already which hopefully will be in v6.11-rc2:
>
> Subject: [PATCH] tick/broadcast: Move per CPU pointer access into the atomic section
>
> https://lore.kernel.org/all/87ttg56ers.ffs@tglx/

I now updated ath.git main branch to v6.11-rc2 and the issue is fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

