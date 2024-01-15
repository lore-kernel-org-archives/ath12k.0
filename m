Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB83C47258
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/k9fW24pjv7xkHzPBCsLzrUti5nNbkSUEqW1STpC0Y=; b=L260YCY+wGhBH+LBqtnU1OsrUd
	MopAJdnuM/yDSsL1PRY2x3TVscis/f/xX8jQ/DVsrwS/rM46yAQbCDXfCxzXXUwrYsopYuOltVmdO
	QghvubU7uBlr0DVf2jq7DNjdCYwgJY3AkG5z6plP+ynIw3whR4aDGwbj5DE/FI6plJRxbpYg63D5e
	o90G0pPHuP4u54GWUlLE7MR79aGAe50IjTM0LCBR31Ro+lAYGPnAK5vvq3yxNhd5B8Ehss3cn1MYC
	n2auvdHvQkJFz0Rd9+OkG3sDkJhwTFOauZn/8xF2YSZf0pdiK3fXXC88+3GLsw37PW/TQNRYMm18X
	o4S6GPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPWI-009Yxt-0q
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 16:09:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPWE-009YvY-0u
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 16:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00AE5CE095B;
	Mon, 15 Jan 2024 16:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE97C433F1;
	Mon, 15 Jan 2024 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705334926;
	bh=7JwWw9vE0E8HLaR/TPGGpX/7XTNaoCGleSmriAkMXs4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WKWrPwW85JftTLzf4E6iOSz8VdUPsbXPTClItYFAq1JOhvDUgCkLvIYuXBW67f/gD
	 75KkoSOMGQVKxRAaKwqIuvcqXtoBzKtzUuZaKvH1ChodBj8i91rXZF75CXtvVsi/Ae
	 NM4mf0w2nkmv/F3kAEa4G1dQWPekkDkr1WHo7MyyeOYmGLFYN4a9bzAerYwUoHRRO/
	 aYS9cvDZ2tPeP2NYL/BT0WkJgQ8w+YLOC0o88N6jCuh1hVJZh8DA7xGusxCm8YYg9E
	 nQEVcJZ/xf1eJvwWfDvMft9mBwylUwHfArbA6WR9okToCB8LPUVUZ9yv8ZnO/172Ve
	 IVjT0fr1zV7/w==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Introduce the container for
 mac80211 hw
References: <20240112024214.3481840-1-quic_periyasa@quicinc.com>
	<20240112024214.3481840-3-quic_periyasa@quicinc.com>
Date: Mon, 15 Jan 2024 18:08:43 +0200
In-Reply-To: <20240112024214.3481840-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Fri, 12 Jan 2024 08:12:14 +0530")
Message-ID: <87bk9m7f5g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_080858_495986_491FB232 
X-CRM114-Status: GOOD (  13.34  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> To support multi link operation, we need to combine all the link/pdev
> under a single wiphy. This avoids the overhead of synchronization
> across multiple hardware instances in both the cfg80211 and mac80211
> layers. Currently, each link/pdev is registered as separate wiphy,
> tightly coupled with link/pdev/radio (ar) structure. To enable single
> wiphy registration within the chip, we decouple the wiphy data entity from
> the link/pdev/radio (ar) structure and move it under the chip (ab)
> structure with a new data container (ath12k_hw) structure. This approach
> improves scalability for future multi link operation support.

What about struct ath12k_pdev? Do we need it still or should it be removed?

>  static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>  					 struct ieee80211_vif *vif)
>  {
> -	struct ath12k *ar = hw->priv;
> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	struct ath12k *ar;
> +
> +	mutex_lock(&ah->conf_mutex);
> +
> +	ar = ath12k_ah_to_ar(ah);
>  
>  	mutex_lock(&ar->conf_mutex);
>  	ath12k_scan_abort(ar);
>  	mutex_unlock(&ar->conf_mutex);
>  
> +	mutex_unlock(&ah->conf_mutex);
> +
>  	cancel_delayed_work_sync(&ar->scan.timeout);
>  }

Do we really need two mutexes? I don't see any analysis about that. And
even if we do, I feel that it should be added in a separate patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

