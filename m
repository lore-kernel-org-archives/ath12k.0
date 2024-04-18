Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B551C4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irUjkIwAdFK35e8pd2kE3gp7R4cv4ZLdzTZe6S79L5o=; b=Zdo0Ehm8CASITV4chPYK7S28ao
	yPEzL3/39/WCAt823jJoJjoKOXPqfXhyv0fk/RbMfpyRvHKhcl7y4jWdH1k4I6cXtzgfReBmnUoMQ
	uIFIlyurHAb6PdNYTys2WsGuBN81PtzMFd9rMMBmcRkE0IImrvGxeL5rNtvhVOzPZbiwT8dzJ07ud
	xrUETbj4lw8+tXnUhRuRb0E0/dl11tMGhFNUbwJxkq53p1sOgiNGSpLG9jfh2R+fgILsqloUyDs19
	e052zPY1g9j/UIRuYYVDPdyFhKT2YjUdcZz0vMjGnrCSEHf0IFDt+LRKQ1LsVkk4MAS+aN0dtVQ8F
	dhMeEaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTZc-00000002liZ-0bVJ
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 15:21:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTZY-00000002lhD-17DD
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 15:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53B96CE14E4
	for <ath12k@lists.infradead.org>; Thu, 18 Apr 2024 15:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B75C113CC;
	Thu, 18 Apr 2024 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713453669;
	bh=J43tWxGE4Ftm9L6Xm+zZd/z0nH+wgtacixPnL6lkcyA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Rkpf1/3rSiWpY3X5zVkX3aJ3HnXgiz2PqisdcREJFkjwOM+rDLe6ExTwEE9z4j8pB
	 //It2sSXGCfflIl8ECzPD0Xc/PcER84jTSDaLSTCbZMOopN8oG5Qi8YlRR2Zf+b/5K
	 MTj0m8QuoBlfrl9BDwHCEBtOUAAfgreI1hY5eJvf7hGdHUM2mBm+KyOiBeKcphRHBG
	 y44cs8leGgN5qW/jIlruSF5LXjdo9Y2vsonN8ENPW7FHooOO56yv1VVYjR1y5ON7g+
	 bw4dzbsTLobTsMoxTPyvM7GP1HqKLXzZCQAebLfhor+/+fpUfQzRPCZjAEaWIOVK+U
	 CZ7IrnK0aqNuA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240411165645.4071238-1-kvalo@kernel.org>
References: <20240411165645.4071238-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171345366633.934743.2036599275611507986.kvalo@kernel.org>
Date: Thu, 18 Apr 2024 15:21:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_082112_735778_98840C71 
X-CRM114-Status: UNSURE (   5.30  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> ath12k will support Multi-Link Operation (MLO) in the future but not yet. A
> major change with MLO is that cfg80211 will disable Wireless Extension (WEXT)
> user space interface. To avoid having inconsistent user experience, first
> supporting WEXT and later not, disable WEXT already now.
> 
> Now ath12k claims that WEXT is not supported:
> 
> $ iwconfig wlan0
> wlan0     no wireless extensions.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

03a509740b5d wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240411165645.4071238-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


