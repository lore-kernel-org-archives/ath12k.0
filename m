Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A15E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8+CzsmVwj+okNKuPtdqXBFkChnAkF5Ug7O/Hb1u7nM=; b=WMEErZWnCQ+iWdUSVtvT7HNpIw
	IGFuCNFwv0oRs4PRTDBvQBifLwMUPHZ+N+qeb+NbkvbC1tsMT3CdB4trHOcm8E3M2R9Bz8vD0LXjb
	cdizXLtTVEen+RNTcgoJ/CKOnMWmyl9Yo1+e3rjxiFBxSGhSiO0j2UbmXeyPp+bAfhTcAPjJ/K9p7
	nXKLRgML346aRR1Y5OUp7v5vU+qCfurjDnz50hJSkzGT00QvaS4lnOKUMRZSUzbH6QKFHOeEkzrKK
	P2cBkyLaBIk9XqGU3J6sgffLNEgWUSj+ljG1bsbXFCjkgSp/lPCZo0zjqdunbnBNcla33agNdkple
	iQ/MOypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGZg-00000001wP3-1r9A
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:28:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGZe-00000001wNs-2pFb
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 437FDA42574;
	Thu, 19 Dec 2024 13:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DC1C4CED0;
	Thu, 19 Dec 2024 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614897;
	bh=aFuHqXV4I1COIteKiVGjzl7LIxkFC3/grQk59KK7cuA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mi68ooMeO8Y6wvx2Z/2cdbIKYqyakCHjblB4WxETas9pk9ShFYg43Fj5B4+zmJPFU
	 O52bMx7hOMAbPRsRc/puDBPuHk+ncbVfD/PuKvgQfbHQdkyv8N4rH/MzyA9xh5wnba
	 h/FOcD7Z6JukkSbzjUz9eOPdIH07GpQVS2K4id+LnW5dngGIIpR/7fewqeK9vpbTGo
	 2DKt3NIxC6d0rgKgd1jCe9b6qxi4SwkpFLLDigUVde9NJOg90EIUfTbHeOfE65Bh2b
	 oSqGxifoCwymLiexql+RhDJ6oohUgnr0A1mqN6ZkUTvnC/thpOEq20GiPtgV8/sfAx
	 2cOb0rNuyoLKw==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath12k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: fix CAC running state during virtual
 interface start
References: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
	<20241218-ath12k_mlo_dfs-v1-2-058e783bcfc7@quicinc.com>
Date: Thu, 19 Dec 2024 15:28:14 +0200
In-Reply-To: <20241218-ath12k_mlo_dfs-v1-2-058e783bcfc7@quicinc.com> (Aditya
	Kumar Singh's message of "Wed, 18 Dec 2024 09:11:33 +0530")
Message-ID: <87a5crhkep.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052818_783876_854C91F2 
X-CRM114-Status: GOOD (  13.84  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> Currently, the DFS CAC time and the usable state of the primary channel in
> the channel definition are used to set the CAC_RUNNING flag for the ath12k
> radio structure. However, this approach is flawed because there are channel
> definitions where the primary channel is not a DFS channel, but the
> secondary channel is. For example, in 5 GHz band, channel 36 with 160 MHz
> bandwidth. In such cases, the flag is not set correctly and hence places
> where this flag is tested will not operate as expected. For example, Rx
> packets will not be dropped.
>
> To fix this issue, use the cfg80211_chandef_dfs_usable() function from
> cfg80211, which returns true if at least one channel is in a usable state.
> This will ensure the CAC_RUNNING flag is set properly.
>
> Additionally, update the CAC running debug log message to include the CAC
> time in milliseconds and also print the center frequency segment 1.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

