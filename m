Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B5CE7A81
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtdYY3Nvlg0oAfVb0yaL0VKpK+uWTDCN37fBSbQFh6U=; b=v2hl6GZo1l5wxLGPQ5DRNYGNft
	gEGm5TTe6/Xa84RDyRG+zWEduqy3EinLwR0Br9jd3/i1hHQVvbSg1xxfZ87aYPxHT9SYcNTgI55aM
	bVAOKOhbJygU8sEbOANRlQIIZyf+9DMUal35MGCFtimkqHRkbHEJNNrn7OyZfKWqofqMt2AOiK4Zg
	a6fX02XjL5Df+JkonzDsmWL/NFLUySJmhIsWbaeUBUucLWvzNpEMWZf37sWH4YOS8zLJB6NMdya0t
	rgYdvZqH9nD5HGwqpNCsXd0JXDmhm0sXQrhCBsuUTFzGkmgriXbi3b3+KEnXl9TwbL/UJRsXp62BA
	5hLJa7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHLq-00000009T7s-1ERP
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 18:37:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHLo-00000009T6C-0K5x
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 18:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13F90A44EDA;
	Thu,  5 Sep 2024 18:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458E0C4CEC7;
	Thu,  5 Sep 2024 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561419;
	bh=5RG0ggpvP+5PHFf3vHKBEk8ik6S2qWzycEu+CA8lSkk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MWcyovTTgoHxWcytmhPvxYDJNAgHa4WXIKpKIkGz6tS3y7LbiHG6IOuPPrI4fJ/Fm
	 Hk3gXpYTZQKXx/F+BQ9klvcLyYeSjUa/Ctu4JQ4p1401cSgFXYryy+YWrCDyGwJEmX
	 EAeWB4JtulvM6CY6qLfsgeChb43cgjQN4RpBiGxomao0HbmUlHNb0lT3HMKz3LYo3g
	 yjD5zVqdG7Yo6Gz788MFXU6XrzWdsts976FsHODUROf/iKAuJDGLEIOySahf+K3VNP
	 X2LICGpBa44wlDOObVSiqycF5azroAWr5OOG0y+U2eGKDSI0eMm/80X608XjCfAqpg
	 FTNKGI9/VxLow==
From: Kalle Valo <kvalo@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Cc: ath12k@lists.infradead.org,  Nicolas Escande <nico.escande@gmail.com>
Subject: Re: Allocating more RX descriptors that can fit in their related rings
References: <ZtigjqSbAWZYU_KQ@pilgrim>
Date: Thu, 05 Sep 2024 21:36:56 +0300
In-Reply-To: <ZtigjqSbAWZYU_KQ@pilgrim> (Remi Pommarel's message of "Wed, 4
	Sep 2024 20:01:50 +0200")
Message-ID: <87zfomgd6f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_113700_207122_7695A8EF 
X-CRM114-Status: GOOD (  17.82  )
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

Remi Pommarel <repk@triplefau.lt> writes:

> As far as I understand a bunch (ATH12K_RX_DESC_COUNT) of rx descriptors
> gets allocated, then CMEM is configured for those descriptors cookie
> conversion and is kept available in dp->rx_desc_free_list pool.
>
> Those descriptors seem to be used to fed two different rings, the
> rx_refill_buf_ring ring via ath12k_dp_rx_bufs_replenish() and the
> reo_reinject_ring one with ath12k_dp_rx_h_defrag_reo_reinject(). While
> the former is kept fully used if possible the latter is only used on
> demand (i.e. reinjection of defragmented MPDU).
>
> It seems that the number of RX descriptors ATH12K_RX_DESC_COUNT (12288)
> is higher than what those two rings can fit (DP_REO_REINJECT_RING_SIZE +
> DP_RXDMA_BUF_RING_SIZE = 4096 + 32 = 4128).
>
> My question is why are we allocating that much (12288) buffer if only a
> small part (4128) can be used in worst case ?
>
> Wouldn't it be ok to only allocate just enough RX descriptors to fill
> both ring (with proper 512 alignment to ease CMEM configuration) as
> below ?
>
>  #define ATH12K_RX_DESC_COUNT   ALIGN(DP_REO_REINJECT_RING_SIZE + \
>                                       DP_RXDMA_BUF_RING_SIZE, \
>                                       ATH12K_MAX_SPT_ENTRIES)
>
> Or am I missing something and this is going to impact performances ?

I don't know why it's so and no replies from others. I recommend just
sending a patch, preferably with numbers explaining how much memory is
saved, and let's see if anyone reacts.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

