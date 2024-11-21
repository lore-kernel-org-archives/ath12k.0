Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D39AD6ED02
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8WH1STX4w5rLXfj6lqv4zH3+f3VB7fWS+Q8tBuiyCE=; b=x3m+5WaLzF59T0VrtJY4NveaX9
	Vk/jtiX4Hb7ouDl6O8ev5QH5MikKPc0cWma+Y1iamgifQ497BJj51sWvAOQsIYaQiTE+urnZCUHtP
	lEZ8ovMg3rDr5MsZCqviKtHvUhRoWnZr3hX4urmP0f2FMP8+ZlwiRdsulDFp9KuWrGJCXi1XYV8h7
	8ZRmqwwp61NQT0Z2lPXm7CgQ8dDSVQeZ7coKwrBe1ayPkE8LwM0/NUf30jZg1ckT3j+xi7cLR5LJS
	x9JuWs4EC7qEmz2g+G2ROi6iIUl8wDS/5YbTJ7AcITJqVi3kS50o2zunbOikHNeLT/JWs27soDLuI
	YdlFtXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4p0-0000000HPAF-0i8J
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 10:54:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4oy-0000000HP9t-2yWk
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 10:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 002015C56AE;
	Thu, 21 Nov 2024 10:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF189C4CECC;
	Thu, 21 Nov 2024 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732186439;
	bh=qnEmZ1q4aRHhC+DGzQ0EUXHnh+YiuLzBeV4gA2ljTxE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=O95CaL+cxyAAtsbKvuiMvRAmrGJf3dQrQ3hN1YBYrhoqmbNpi2b40mVRcvb1R/ihv
	 aqXWy7HevZUafV8FpiGWCdgK20gmRHtlhMxsF5u1uhoT0FVMnLyhRPxf0PWzIp7Bgb
	 xag3welmWiAjz5S3kFZYUVC8M0XUPIuldC0PqN+GZWIYLsQ5xWGmb3ev7i0ywEVrB/
	 ZeImhmlNEAas4O3B3AIDyRHWFs+ckdyKyfmFgrzx0RvdDzVCcikJfiw91onvHtfg6s
	 xsXqPKCn3SEzvHsCZwsxIcF4+SVvR13C2Inv1siC3BQ+GLQF5q0+BcNx0mNYb09GHI
	 hVhz6bOWfmsfQ==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Fix inappropriate use of
 print_array_to_buf_index()
References: <20241118035722.1755373-1-quic_rdevanat@quicinc.com>
Date: Thu, 21 Nov 2024 12:53:56 +0200
In-Reply-To: <20241118035722.1755373-1-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Mon, 18 Nov 2024 09:27:22 +0530")
Message-ID: <87serkyi0r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_025400_788547_A1D5A414 
X-CRM114-Status: GOOD (  10.81  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> Currently in ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv() the
> htt_stats_buf->ul_mumimo_grp_best_usrs array is printed using
> print_array_to_buf_index() with a stats_index of 1. This is meant
> to convey the semantic that first entry in ul_mumimo_grp_best_usrs
> is associated with user 1. However, unlike some of the other "usr"
> arrays which have that semantic, ul_mumimo_grp_best_usrs does not
> have that semantic. Instead the first entry corresponds to user 0.
>
> Fix the issue by calling the API - print_array_to_buf(), instead of
> print_array_to_buf_index().
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

