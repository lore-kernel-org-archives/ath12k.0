Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8AFECE577
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/s9/ItOtUXVy2kPVBb/QZYtrfsy0tm8Cw4SMpupcLlw=; b=BhZWgneWMxxVTeh36+pzwtd2Rh
	EC7azr1loh8ABEkJsIvAb6zd4byxaVcJYte/CIAiuLmD6AwOH8BHx65aGoa/TcntX45FSjwbZ9caY
	4fA8txxrHdYXP7nniRYdOt17awLI765FcHoIGGiL3xc0m56t95MopFU9R7a3ovzqqOEB/nia3GAH3
	wZqZ/EDqEVZzyHIZVg2FbTmezpI5MoLSEiJooJSc6K2Te64OtHdxUpGXLuUBNiGwoq+Kz8DU9re+7
	0xdTfC6OpUFhMVPb1QRy1+DGiRGg4/Qp6yEVbAINZQllAz5koKM+vedwnuqlMhi/WbK3c4yN7iuvy
	/4O0nGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sniNq-00000002tHA-3ndr
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 17:41:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sniNN-00000002tAg-1LwW;
	Mon, 09 Sep 2024 17:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 480925C032D;
	Mon,  9 Sep 2024 17:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7F7C4CEC5;
	Mon,  9 Sep 2024 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725903632;
	bh=AtmZVGQ1z32CRVXcR1nEktBUb28OAe2Lo7zj4Sh7yw0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HKm1U9H0EHhag0g5R13J65bO/jr33meW90Ak1eN73Dzsxh5eYMGFN8+dixJQH9I0r
	 Qf5U4qmWbuAxYKY/CL7nVBsXC72hvT4WcKutBw9jMsh28mE1rfBoMXKeWmijSPFEN0
	 PHWqJCsNou61Sdn/mRzN7FE7sBcWfDUzb5RNOqKtdgyh7vmwOIxhstws5b08vu6KW9
	 KGv6wiSQ3Cxx3Y/LlprFalQGvqn1SCfebYyfsRfKW9Mw3nDDan+nALJgk6rc/Vh7I+
	 ipoUyJJFmbNF9Jjzc2dUFOdLYl1o9AW42oEcG6OpewyKda4kVXkAlGMHW4z8x/ohFi
	 BtF0oZicOV8/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull-request: ath-next-20240909
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <13914e4d-92d4-4ccd-a7d5-86c5a17426e8@quicinc.com>
References: <13914e4d-92d4-4ccd-a7d5-86c5a17426e8@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
 <quic_jjohnson@quicinc.com>, <quic_kvalo@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172590362906.2257202.15489777283532077082.kvalo@kernel.org>
Date: Mon,  9 Sep 2024 17:40:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_104033_425698_289A6B2F 
X-CRM114-Status: GOOD (  12.28  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The following changes since commit ae98f5c9fd8ba84cd408b41faa77e65bf1b4cdfa:
> 
>   Merge tag 'ath-next-20240812' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2024-08-13 12:58:32 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240909
> 
> for you to fetch changes up to 02f454f9aa6255d99611d6a4e37edd08812878df:
> 
>   wifi: ath12k: Avoid -Wflex-array-member-not-at-end warnings (2024-09-05 19:20:21 +0300)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.12
> 
> This is once again a fairly light pull request since ath12k is still
> working on MLO-related changes, and the other drivers are mostly in
> maintenance mode.
> 
> ath12k
> 
> * Fix a frame-larger-than warning seen with debug builds
> * Fix flex-array-member-not-at-end warnings
> 
> ath11k
> 
> * Fix flex-array-member-not-at-end warnings
> 
> ath9k
> 
> * Fix a syzbot-reported issue on USB-based devices
> 
> ----------------------------------------------------------------
> Gustavo A. R. Silva (2):
>       wifi: ath11k: Avoid -Wflex-array-member-not-at-end warnings
>       wifi: ath12k: Avoid -Wflex-array-member-not-at-end warnings
> 
> Miaoqing Pan (1):
>       wifi: ath12k: fix the stack frame size warning in ath12k_mac_op_hw_scan
> 
> Toke Høiland-Jørgensen (1):
>       wifi: ath9k_htc: Use __skb_set_length() for resetting urb before resubmit
> 
>  drivers/net/wireless/ath/ath11k/core.h   |  8 ++++-
>  drivers/net/wireless/ath/ath11k/dp.h     | 23 --------------
>  drivers/net/wireless/ath/ath12k/core.h   |  8 ++++-
>  drivers/net/wireless/ath/ath12k/dp.h     | 12 -------
>  drivers/net/wireless/ath/ath12k/mac.c    | 54 ++++++++++++++++++--------------
>  drivers/net/wireless/ath/ath9k/hif_usb.c |  6 ++--
>  6 files changed, 46 insertions(+), 65 deletions(-)

Pulled, thanks.

fe57beb026ef Merge tag 'ath-next-20240909' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/13914e4d-92d4-4ccd-a7d5-86c5a17426e8@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


