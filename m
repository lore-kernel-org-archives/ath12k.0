Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6902DC3DA4A
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3k00E0ZAyejCQbuNZ6reASVxJSUQ4aiLO7htHc371Mw=; b=v0KW4dCyOL5doyArITZq/efmoI
	vZM/N6L5oju9rf4WW95izojzTfjqKVXa6iFpBW4Xw9XRLBPRR6jh5HKhB4i3vrkpxB8qfTPUebyLR
	k9Q1pHJs/7hl+EalSlktux+J/le67M9MEu+jYnZbZQ3Tr2TwfxeJhjH/12eD9J6TWcrbnXQRAzVWE
	/Vg1Lm/3AaaKKZJQv5REb+SRr370KGusYtTJF/pJ5ogD+chAOj61wmOXhLkDwm/XWIcRoRcmVWz/+
	kNhT48BTmxalMC6rkScPcLk+nGPzklkbu2ne1VwTFexFvxMBhJoUxi8yHl/IRZTub6YFLPeE6wzR/
	xjq0/q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXSc-00000005o2m-0USC
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 15:11:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXSY-00000005o1N-3v6V
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 15:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 118816288B
	for <ath12k@lists.infradead.org>; Thu,  1 Aug 2024 15:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E272C4AF09
	for <ath12k@lists.infradead.org>; Thu,  1 Aug 2024 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722525077;
	bh=Q8bqQ9rPYgjuWyh8m3PzSZAaVusZ6YzHDst3uL9o18U=;
	h=From:To:Subject:Date:From;
	b=qQ55LgCMZ7MKcvBjwJqKXe2cJ/JRVyf1vPy6KYvfNsK2z+pc7udI38C9YLLvwL76b
	 sqZYJnJr74FNDO0lSB6uQIB+X823bRBX9ywApZ9vNaxn0kcOPlPV3lMYpgx6LoHyA3
	 7MlrutMDYejDgND8c+2pnjdKPi+Q3ec5KvTOLHl1isbtjvYqQMiCEl0f1yY4H6Zm9L
	 VYhftPNK8VHX67LDGw2A5TU4ipxzWGCPnYF6BQzg9wtRlZnLGoZy44dJGFAA1BNtV1
	 lYFSbQ/mYW9JNSwGd3EWe/sz8rl5XoXw43b98B+apsKbQ1b3/v+P0Arse2Z+cax1Se
	 9hNry5P1coWnQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Subject: New warning in v6.11-rc1: BUG: using smp_processor_id() in
 preemptible [00000000] code: rtcwake/2121
Date: Thu, 01 Aug 2024 18:11:15 +0300
Message-ID: <87a5hw8ei4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_081119_059640_7D769248 
X-CRM114-Status: UNSURE (   5.40  )
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

Hi,

Just to make sure everyone is aware. I just updated the ath.git main
branch to v6.11-rc1 and I see a new warning in our suspend tests:

[  546.233940] BUG: using smp_processor_id() in preemptible [00000000] code: rtcwake/2121
[  546.233960] caller is debug_smp_processor_id+0x17/0x20
[  546.233970] CPU: 5 UID: 0 PID: 2121 Comm: rtcwake Not tainted 6.11.0-rc1 #1685
[  546.233975] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
[  546.233978] Call Trace:
[  546.233981]  <TASK>
[  546.233985]  dump_stack_lvl+0xa4/0xe0
[  546.233991]  dump_stack+0x10/0x20
[  546.233995]  check_preemption_disabled+0xce/0xe0
[  546.234003]  debug_smp_processor_id+0x17/0x20
[  546.234008]  hotplug_cpu__broadcast_tick_pull+0x20/0x280
[  546.234017]  takedown_cpu+0x197/0x410

There's a fix already which hopefully will be in v6.11-rc2:

Subject: [PATCH] tick/broadcast: Move per CPU pointer access into the atomic section

https://lore.kernel.org/all/87ttg56ers.ffs@tglx/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

