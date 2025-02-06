Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBDAC0219B
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtTcWkO4bRVYzIeCJ/JqL9n+9tVD9IOVGume1rdQHzE=; b=oheEu/9n2Fp55PqaP+BWM5RDwd
	LsW5jlnEy4cPjaKyTgVM7Hw922m7EviOLoo2mCbgLO3wznw/gXwQJE8hIci9jAegp9dZWw/liDF0Z
	NMsUV+4+9b5e/9v5JZNz3w3m/b+yPX4iLQIjtVQdikDQbXCni2m02bN/Gk8YSn6MdQlBMa7DDcDrd
	DYMyaXE2J1ZHrcw9XFs55E73fDKxri9OpMZdImEIOCe4wbWBXu433nWoMv0jlXbb9uh7FEeKMHmPU
	F66XlWiXrG145+ziev0Pz51S9D+bp//F4Iss9nWpEb9Q5OxJ52b37QieMT/TJhT4fZFlAGIJmyhVP
	C+8X+9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8WR-00000007UGs-2TLi
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 20:30:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8WM-00000007UFZ-1dri;
	Thu, 06 Feb 2025 20:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27E30A445BE;
	Thu,  6 Feb 2025 20:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8708C4CEDD;
	Thu,  6 Feb 2025 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738873844;
	bh=uxK6tuwuJNODoSeoVxh/I0TT0BWkiYbdCYE2ZBTQroo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TjUQCB9NnCMFgjeaZBVJCXZB98Uf0I1RM72A+/SnqQMYXWpRAa5inRhXSSW0agp3H
	 F1ANqLoQVudCIwyiaMbEBQOGRc4cmIMv6lPw4ArLTrzkTYQ9MbH/y7n89ZU8v2VXmL
	 Pbvkna364mmrM3rXnb0nS6CQB2/KkQ5oo6gp3Qv6Ey4M7/lAxc6P75u+06HpXl87G4
	 NAxp3DYdhZBmEaFrXGluSnotg/fyu9gGNflmw54eW1aPdtOiMeDk+JSlRzJBlMiKZu
	 qcTk2+bmeBFZucLWac6bLTEqvcTVkoyVBR0fTzkIaR8/hp+cw+6IDSdL1elbYEvUt1
	 Etpft2PurSpwA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless 1/2] MAINTAINERS: wifi: ath: remove Kalle
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20250203180445.1429640-1-kvalo@kernel.org>
References: <20250203180445.1429640-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173887384195.28414.6609534484126873119.kvalo@kernel.org>
Date: Thu,  6 Feb 2025 20:30:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_123046_497924_89FCCCCD 
X-CRM114-Status: UNSURE (   5.77  )
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

> I'm stepping down as ath10k, ath11k and ath12k maintainer so remove me from
> MAINTAINERS file and Device Tree bindings. Jeff continues as the maintainer.
> 
> As my quicinc.com email will not work anymore so add an entry to .mailmap file
> to direct the mail to my kernel.org address.
> 
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Jeff Johnson <jjohnson@kernel.org>

2 patches applied to wireless.git, thanks.

0db6b7d49b50 MAINTAINERS: wifi: ath: remove Kalle
b76adb9758f8 MAINTAINERS: wifi: remove Kalle

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20250203180445.1429640-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


