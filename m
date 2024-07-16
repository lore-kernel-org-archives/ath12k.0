Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5481AC3DA49
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xr7MjEG2UBwg+uC7GF18eSh48GTN9vUWYUEC6WKSMyA=; b=SG9TXQ0F8Ayl+H2V3eDN938+/O
	ptzSjMlcXW68z1I/4eJNylKojpcSkrJlOljWFVc2DcIBGCCiWI3EDD5enE4OJHQhOSxEOW4bsg3QH
	Zf97O1xArxDmkjeS/WlMhG1nK+0RF30Fho+XSEXgs4OdyuR/pfqgkwNmRQF6QwrJVFplgjX/XfSBR
	I6TkJQJrep/Pffx7fzMiDhIxP8NnhS8DX5iOvklA80BqMycwOZQYicA5Y2KdbHzS+GgBaVOLBO8aN
	teLHqsNLXq+oJh67Q3pQUhBypozIr7xsRCWfmsuhWgIFnAKffa4wICNV5O//uUZ5ixM9lacgA3igx
	jS2jVDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjfS-0000000Aq3y-0C3d
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 15:00:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjfO-0000000Aq2P-3W8S
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 15:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21BA760E93;
	Tue, 16 Jul 2024 15:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C951C4AF0F;
	Tue, 16 Jul 2024 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721142032;
	bh=uYe9BapfTsJ13P9ZljegPThBOOGzlgPGt1rLPJq/+iA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cOvJDmo7Qo70vfoKH3LCj/Ay/cisN3fWNCwNH0Cd1pillnKj36xafDzm8FuB6/e1+
	 Q5SXcRZIBntMt0ZAPoxnbPUd+90npTYrGvMOg0P7T5aeSVzHJAcUch61tBNIpOMCYx
	 OPs6JPrcihbJDcf6W5hHcrw3AKFiadlgdQzLBsUW0cuIX0EuhbPUQ3bDVQoMd+d1gd
	 PYa15i9dStUmwngKdM0dmNwiMl4EaOkXMZ51bDCTcLt30DInNRJiS/gBaxTNJtgM/h
	 4tB8/IM/kq7gUz1bEWgyq5EhXAELw14P/85v8tW4mDX1Pwn41mCphca2VPkP+KQAQz
	 mUFS6A7NonKYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6616DC43443;
	Tue, 16 Jul 2024 15:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] wifi: ath12k: fix build vs old compiler
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172114203241.4794.15315713329706160319.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jul 2024 15:00:32 +0000
References: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
In-Reply-To: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, kvalo@kernel.org, jjohnson@kernel.org,
 quic_bqiang@quicinc.com, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_080034_981386_F45BE2B2 
X-CRM114-Status: UNSURE (   6.33  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Jul 2024 13:06:39 +0200 you wrote:
> gcc 11.4.1-3 warns about memcpy() with overlapping pointers:
> 
> drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
>   114 | #define __underlying_memcpy     __builtin_memcpy
>       |                                 ^
> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>   637 |         __underlying_##op(p, q, __fortify_size);                        \
>       |         ^~~~~~~~~~~~~
> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>       |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
>   190 |                         memcpy(pat, eth_pat, eth_pat_len);
>       |                         ^~~~~~
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
>   114 | #define __underlying_memcpy     __builtin_memcpy
>       |                                 ^
> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>   637 |         __underlying_##op(p, q, __fortify_size);                        \
>       |         ^~~~~~~~~~~~~
> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>       |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
>   232 |                         memcpy(pat, eth_pat, eth_pat_len);
>       |                         ^~~~~~
> 
> [...]

Here is the summary with links:
  - [net] wifi: ath12k: fix build vs old compiler
    https://git.kernel.org/netdev/net-next/c/b49991d83bba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



