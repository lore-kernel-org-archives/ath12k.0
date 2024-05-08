Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA141C04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq4wnW0UkvLT8skf34Tyw1i//9g3vjp4GrRh900Yz7c=; b=0CX38AiR6YrjNCYztwi2P/tlUz
	wYQDc3aXAjyNulh+VWnmEIe3C1qAakxCLXg9BNjhDRTNHBYXmrRriTZsDzNjPoSRDdCJL7wayMxwI
	pOQemNSPb3fuLy7rgBkxmr47XG6Ddcw3hgeAFz0Bwfa5qn/BRTCg9wE4d6zVpmc0D1mAYiG2Nz8wo
	x5UKoWA1Q1WAPZy+gxcG+jgPRGhDbpCsbDYM4KDRmpFAxl3HrRs63CXDRrNgNJ31VzwyTP1R0f9GI
	sze5D4/cYs7yltFom+I1c30QFbMxoRn/gRIsZISxaNBIwbE+UjhthNlbFwtDSNNBBkEfBKiSXjryd
	ljgbcyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ixd-0000000FxyX-2AKD
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 15:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ixT-0000000FxuT-24A6
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 15:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29FEA61C35;
	Wed,  8 May 2024 15:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DA4C2BD10;
	Wed,  8 May 2024 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715181109;
	bh=vikwuTwMkABdES9wzg7+bp3LS1APlhsRz9rgvZ9XVt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TyK/6sxK5ZGUQqv0U91OuTojVQ4jqgAwXQLfi20bKBNBNBnsfqp7sU2GT1PTQFU0o
	 0OgCBSGbvRfZkT6KcIJdWyDdxWM9eJxmTuN6Tz9JeK4YHnc/e7Z6mQ9i5ll5uMxtCr
	 W1XM0f6tchzFPrnxAJQzx4qG5fovQD2PhGsqzKWB/c5ZnuMJ6MbordKrRQglmJSnAb
	 3VvqZ+Pq7fJ3uuVsY+mN+kdKyytNNtbZnpj/H/NI6Xji6mMaxdtUJb/Dl5bsLEUS0u
	 3j0kbZRrTUBpVIxhMzmyvS7hj5j1EnB11y8gJRjTKvyClwHr2xm9QkfcFd3DENaeWt
	 kuGHSQt6WLuWQ==
Date: Wed, 8 May 2024 16:11:45 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next v2] wifi: ath12k: allocate dummy net_device
 dynamically
Message-ID: <20240508151145.GG1736038@kernel.org>
References: <20240508095410.1923198-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508095410.1923198-1-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_081151_734669_FB45D186 
X-CRM114-Status: GOOD (  10.29  )
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

On Wed, May 08, 2024 at 02:54:09AM -0700, Breno Leitao wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_device from struct ath12k_ext_irq_grp by converting it
> into a pointer. Then use the leverage alloc_netdev_dummy() to allocate
> the net_device object at ath12k_pci_ext_irq_config().
> 
> The free of the device occurs at ath12k_pci_free_ext_irq().
> 
> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changelog:
>  v2:
> 	* Free all the allocated dummy devices if one of them fails to
> 	  be allocated (in ath12k_pci_ext_irq_config()), as
> 	  pointed by by Simon Horman.

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


