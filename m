Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74BAEE4996
	for <ath12k@archiver.kernel.org>; Tue, 22 Aug 2023 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bA6gUYOxjkJflW88DVk9+BXDa6UaMPRTl9gkghsWEEE=; b=KicoTka5SHWGUg
	4f2hTzV9BfAAwFdFKcFQ6wMoN/T6Z/szLqYwMxbfW+VF4nnJD6jsnCFOqc1ZGsBA8kJj1RlDunN2I
	q4zG9ZLZNcFzoFMHGWCrG/qMnHUyDmqUPn6OLeP4Kk3nHMllhUyYJgj9FYWROR4U9oyz59VfFbsMF
	P7XMOwbIgLkSkM4sd5d4KjgqK7zRwiPNE4dQtXcr0EdBfjZ0r0IWIEAGaEWB/WYO84xwFo4OPry54
	lbLg7ATfFz0/dUKZl5LS/3+XaVhmOF7sUzhmomvvwDYteFw7tU6Jhqd600CdP5+87puYHiZILIsnK
	HC8Gqe9Vw4fIgCp+vqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU5Q-00GTRF-1d
	for ath12k@archiver.kernel.org;
	Tue, 22 Aug 2023 16:18:32 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU5N-00GTPh-1R;
	Tue, 22 Aug 2023 16:18:29 +0000
Message-ID: <768de9a1-b186-c296-e9b9-d83cee1997a6@infradead.org>
Date: Tue, 22 Aug 2023 09:18:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] wifi: ath12k: Fix a few spelling errors
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
References: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
 <20230822-ath_spelling-v1-3-8e2698759564@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230822-ath_spelling-v1-3-8e2698759564@quicinc.com>
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

Hi--

On 8/22/23 07:50, Jeff Johnson wrote:
> Fix a few issues flagged by 'codespell'.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h      | 2 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c   | 2 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c   | 2 +-
>  drivers/net/wireless/ath/ath12k/mac.c     | 2 +-
>  drivers/net/wireless/ath/ath12k/rx_desc.h | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 0f2af2f14ef7..dbaf033c2527 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -6771,7 +6771,7 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
>  			/* After trigger disconnect, then upper layer will
>  			 * trigger connect again, then the PN number of
>  			 * upper layer will be reset to keep up with AP
> -			 * side, hence PN number mis-match will not happened.
> +			 * side, hence PN number mismatch will not happened.

The fix is good, but preferably also s/happened/happen/.

>  			 */
>  			if (arvif->is_up &&
>  			    arvif->vdev_type == WMI_VDEV_TYPE_STA &&

-- 
~Randy

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
