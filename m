Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBA8C48BEB
	for <ath12k@archiver.kernel.org>; Wed, 21 Feb 2024 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I79nBzwV+DGOFYWmVvZfc/TFubiREZmX/BfIloex9Ko=; b=IrGbArEO0efzUGRLohqCXCka1D
	XvnL8f+TnychKZsNwLTjPdxzNl5oNvF2samoVCkQhI1DI/cfKbRB2mLLmXi538Xc9H2FFYgxD3vkP
	KUmtIud2B4y+TfKyrJ+KLkaXYKK3sKcazUPjQ3SEqQdmhC2stLaptUyKypfYWS86koSkiofk9Dqby
	U2eRlJTRSFYJeKTuiR9w8QjUqvjjJCdmtPlvDonK71QbXiWBrc1pq/27RmSBJrT88qrWFVO5lvLFy
	e0wsJJth+kNYeSUeLQ+vrpibhH7pg6HE09PQIKJqrJaAmLTbQsnC814q60RlP2/JYDKhW90ePIDpb
	1T+1gLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqtK-000000020bI-3ETE
	for ath12k@archiver.kernel.org;
	Wed, 21 Feb 2024 18:00:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqtH-000000020an-3n9p
	for ath12k@lists.infradead.org;
	Wed, 21 Feb 2024 18:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D346FCE1E42;
	Wed, 21 Feb 2024 18:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEF5C433F1;
	Wed, 21 Feb 2024 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708538415;
	bh=jxZwS9DN/zj+74jkA+Tojl38QtgkRwQ4DpNjiGFaawA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2ualo2McOjkeWFt8Ny1g5JkA0rbFsfW+tHcf5qM2Hny6sF5bRCZiPEFjlT237Jq5
	 2GTE/Em43/ZGYALhEcStY5oPj5DfA9MgfgKGUK0nzb0GYQdeNzMh3PuXipYfgWUYr6
	 C0YC6sD/+4gZcufJszBiMpW2zpoRlQtmz4OjYrKepJhFgHWyIgXNdgNf0X4E8IdZ2y
	 fwbJC66YKfHBeAvJSt7KEBRcq/N8OrHKKftTGy7NfHQTRKTePhqcKY7uPrldc4enSd
	 vNSr+BdMXVhca85/8/GJnkWsi4vy5MGHOlu42USDa+jUpz1p0UtPOAF+NiRkZ25kDu
	 a3iVVkVNck4iA==
Date: Wed, 21 Feb 2024 11:00:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: quic_jjohnson@quicinc.com, morbo@google.com, justinstitt@google.com,
	quic_periyasa@quicinc.com, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized use of ret in
 ath12k_mac_allocate()
Message-ID: <20240221180013.GA2074929@dev-arch.thelio-3990X>
References: <20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org>
 <170731849247.2220494.17976129376947521581.kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170731849247.2220494.17976129376947521581.kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_100020_148960_8A0A0416 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Kalle,

On Wed, Feb 07, 2024 at 03:08:14PM +0000, Kalle Valo wrote:
> Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > Clang warns (or errors with CONFIG_WERROR=y):
> > 
> >   drivers/net/wireless/ath/ath12k/mac.c:8060:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> >    8060 |         return ret;
> >         |                ^~~
> >   drivers/net/wireless/ath/ath12k/mac.c:8022:9: note: initialize the variable 'ret' to silence this warning
> >    8022 |         int ret, i, j;
> >         |                ^
> >         |                 = 0
> >   1 error generated.
> > 
> > Commit 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211
> > hw") added a completely uninitialized use of ret. Prior to that change,
> > -ENOMEM was returned to the callers of ath12k_mac_allocate() whenever
> > ath12k_mac_hw_allocate() failed. Assign that value to ret to make sure
> > it is always initialized when used and clear up the warning.
> > 
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1989i
> > Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Patch applied to ath-next branch of ath.git, thanks.
> 
> 04edb5dc68f4 wifi: ath12k: Fix uninitialized use of ret in ath12k_mac_allocate()

It doesn't seem like this tree or branch flows into -next on its own, so
this patch is not present in and the build still breaks on
next-20240221. Can this be fixed so that this warning stops breaking our
builds?

Cheers,
Nathan

