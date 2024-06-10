Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD1C27C5E
	for <ath12k@archiver.kernel.org>; Mon, 10 Jun 2024 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JnB07D/JNKvOV/MPNAnj0iPsSJy4NdKAc2/XhOkXTQ=; b=IBVfN/icKSDoa8IBvA1GX/to1j
	XnM1as2tKfftSpsM1mfvYqfg1PCcoZ4B9MWdX6M4Bsbh1Jhwc8ZBNV3vFK1ES952v/5P5A6m76mxM
	feATyEms9+kMHzyiGOpIfn5t/lSowMcBiHYaBjB6fEEfbZno52FxEvuqRhK8Q74xgA4+mfk2P51pt
	D7PsB/giOehdgB1g8voBdisetQBdUTttmsAClhhVIgO84ymPk2PFGi+Caxpx+yloxG8hiQOLcEZTm
	+PP57nvPZNt4T43gIka/AHVQgk/eWiqRCkp/GIZcFX/9P6Z5VGR2OQpPUkwKgY+mNTb5ETc747ijl
	8FzSoWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGiXU-00000005wWv-1TGB
	for ath12k@archiver.kernel.org;
	Mon, 10 Jun 2024 17:10:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGiXR-00000005wWM-3tRZ
	for ath12k@lists.infradead.org;
	Mon, 10 Jun 2024 17:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1D570CE16CD;
	Mon, 10 Jun 2024 17:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39B6C2BBFC;
	Mon, 10 Jun 2024 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718039430;
	bh=grP4NaktoAdLLafbOG3p1B0ZjNIfETFhaDCcjcytV7w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mKI8bjW6ye94YnKrVep3fgICKQ3i3KxA0sQGil0h4G2GQeUCRVnh3ELyf1ZZOPG42
	 ZWTuptvG+QxZRaXtw1DvXJh7u5bOuMhQR1wB770fCBAmJh0uP5wXjXirzByBfXtgFf
	 TvMUQfwCZvvdTymEhqGfCrUWXdoRfDCpTDitLPEbsp2/qEZddDStHRz3XXGJMRTIMy
	 bf9gfxhQm7257NPO/8Mkt8rnCOz8yv4hRHEfL2TvdMyo8qbqgY/Bua7p/V4vdDoyao
	 g56Sc3HK0mfNtQ0VNlUkwBlW5CEUy5g8k9WUe7mAfyudC79vpgssLpNZXl848mRYEy
	 rg3cDW0gzHzfw==
From: Kalle Valo <kvalo@kernel.org>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Fix WARN_ON during firmware crash in
 split-phy
References: <20240529034405.2863150-1-quic_aarasahu@quicinc.com>
Date: Mon, 10 Jun 2024 20:10:27 +0300
In-Reply-To: <20240529034405.2863150-1-quic_aarasahu@quicinc.com> (Aaradhana
	Sahu's message of "Wed, 29 May 2024 09:14:05 +0530")
Message-ID: <87v82goha4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_101034_273222_05293FE3 
X-CRM114-Status: UNSURE (   7.84  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> writes:

> Whenever firmware is crashed in split-phy below WARN_ON triggered:
>
> ? __warn+0x7b/0x1a0
> ? drv_stop+0x1eb/0x210 [mac80211]
> ? report_bug+0x10b/0x200
> ? handle_bug+0x3f/0x70
> ? exc_invalid_op+0x13/0x60
> ? asm_exc_invalid_op+0x16/0x20
> ? drv_stop+0x1eb/0x210 [mac80211]
> ieee80211_do_stop+0x5ba/0x850 [mac80211]
> ieee80211_stop+0x51/0x180 [mac80211]
> __dev_close_many+0xb3/0x130
> dev_close_many+0xa3/0x180
> ? lock_release+0xde/0x420
> dev_close.part.147+0x5f/0xa0
> cfg80211_shutdown_all_interfaces+0x44/0xe0 [cfg80211]
> ieee80211_restart_work+0xf9/0x130 [mac80211]
> process_scheduled_works+0x377/0x6f0

This is just the stack trace, not the full warning. If you send me the
full warning I can add it to the commit message. Also it would be always
good to identify what warning it is exactly as line numbers can change
etc.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

