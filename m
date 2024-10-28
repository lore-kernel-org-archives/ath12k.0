Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B3ED13588
	for <ath12k@archiver.kernel.org>; Mon, 28 Oct 2024 07:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtlDqn10nY/PCUCJOrJgkjN9aWcVFRaWxM+qmf/CF2c=; b=2m0OBeWb4Osu9e99uSQvO2GHwy
	xFCSSrqwTjIYsnJ1Hijd8Aq5R+M/r4KizPbufcjI1Mcc2SRfY4P3HMyYJnl0Olgdi6IXUsergKHRm
	HMaArZlJZaMVZP4aA7cnUSWTRCkPPVv5C2N75D+Y45IIpAYzeeVp4iiNJ7kjcyCWDFheudmkZupGF
	emof/OaKxtJ4IwCQi4aZ9IPTCCpUKBrG2+6d0T3cr2EvTPk6MHcE99VtS92IimltizT58bKpHeCWN
	zC/mZuPUOEJGsbYYTBFJ1Qds5st/m+A/XbpE/JNhRw6BizsSM0NmFrOOI8PKVubcdh+0NNHLKkN0e
	kSJIVqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jyw-00000009pcG-3vPw
	for ath12k@archiver.kernel.org;
	Mon, 28 Oct 2024 07:16:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jyu-00000009pbt-0PhV
	for ath12k@lists.infradead.org;
	Mon, 28 Oct 2024 07:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D92B5C5416;
	Mon, 28 Oct 2024 07:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C955C4CEC3;
	Mon, 28 Oct 2024 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730099763;
	bh=YCRiX6rCWlGtVs+1+GRhTAz+TnHmt3RhD1bC9kdiZ8g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PzBAOw8WZHWerVyYt1bO7dGJjZe/suu/11O5OGB8TI5y6vxe7tcofmj0uDfRs0mZK
	 wg9Tw2vQLfzRIBmJLOkdjRifY4D4k8f/q0VmvpFkmy5tcPL0CTVeme0ucaMOd1XAPV
	 Wpr1HAZ3/eDDI7ctj6bnaSDlBNLbgJpQcCbaNqy/z+6dsnBq13rFXUmQziPfjYgXo8
	 cRw0/CUDEmfAHqXsSFAHHFFsPyJLjvjp2jKoE47K2t//uF8ds88iOBQtECEG4mbEoT
	 59xxz0M+8E/csGlH12mGX6dzTgUsLBTSOYDkMjeWKTFsamuHqVurBdOmfbm2G4Slpj
	 hjQ7A99xwaiOg==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 03/11] wifi: ath12k: fix struct
 hal_rx_ppdu_end_user_stats
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
	<20241016065700.1090-4-quic_kangyang@quicinc.com>
	<875xplrgj5.fsf@kernel.org> <87sespq1pa.fsf@kernel.org>
	<a0a3c468-6f6a-4236-9b09-45534ac51c37@quicinc.com>
Date: Mon, 28 Oct 2024 09:16:00 +0200
In-Reply-To: <a0a3c468-6f6a-4236-9b09-45534ac51c37@quicinc.com> (Kang Yang's
	message of "Mon, 21 Oct 2024 17:32:08 +0800")
Message-ID: <87cyjk3dfz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001604_349262_C5F1BDA6 
X-CRM114-Status: GOOD (  10.17  )
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

> On 10/21/2024 4:50 PM, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>> 
>>> Kang Yang <quic_kangyang@quicinc.com> writes:
>>>
>>>> Current struct hal_rx_ppdu_end_user_stats in hal_rx.h is not matched
>>>> with hardware descriptor definition.
>>>>
>>>> So update this structure and related code.
>>>>
>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>
>>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>>>
>>> What about QCN9274? The commit message doesn't mention anything about
>>> that.
>> I have the same question for patches 3-6. Also I would like to
>> understand the backwards compatibility with older WCN7850 firmwares.
>
> For QCN9274, we reuse the same struct for them.
> WIN team already checked them during internal review.
>
> The struct definitions in patch 3-6 are hardware descriptor
> definition, won't be affected by firmware and host. They are fixed.

Please always include this information to the commit message so that we
know that you have done the research properly and the patch is not
breaking other hardware. ath12k is not only about WCN7850.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

