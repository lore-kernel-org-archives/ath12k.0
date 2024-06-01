Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDAC25B76
	for <ath12k@archiver.kernel.org>; Sat,  1 Jun 2024 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2L8JqRgsNXQ4iLAOjOyP62kdDzzqMsK1S/4VG5J/vU=; b=EYXATcE5gwy2lJlvHr5uELuwtE
	NeoZagqKYrS31dfepvhrIjQLVH7Rxxfsqd+yrbbmG8D7gd3M9KXEo8XqMeqdvLd9Op7Serw9DJCiJ
	9w6zTTeS0ax5vlKy3Pc9kMUaHI8Q46okeLr1QR+76s2geD/CQ7ICp3S1JW7qTK25XHI5EUWeiyK81
	pacatGDr1sCiD1KGGxkmvOX8r3eWVp0f50nAjhMtHFNhvEibXteSHI5/tV7WDIDJMyzAwwR0wSekX
	3K9TzmbmCqeF7Cnsrh9hXmakOKK5sffN2PfsoYCRR+Iov1AeTMzk34x3dmJaQqP9punroTIWie12/
	+yWgIGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDLV7-0000000CJ9D-1C9Z
	for ath12k@archiver.kernel.org;
	Sat, 01 Jun 2024 09:58:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDLV2-0000000CJ8T-2qq3;
	Sat, 01 Jun 2024 09:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C60D4CE1ACC;
	Sat,  1 Jun 2024 09:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92D0C116B1;
	Sat,  1 Jun 2024 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717235879;
	bh=ABPZwTl98JqWjY9l5L1A3Pf6ulH1Xx1AiunqIWYybpw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nUEVUUm7eSNS5laRl59xNobBEKQP0WW2fCspCPBBM9SDbjXRDElexohcHagse0Dz4
	 mcaLPiGc7LkdxgynDO7uhGBoYOx+aoqGpdTnwmlyrr4E8jCtX3vL4uipXK+Dm1kuxf
	 siPiLDzBRKBaLZA+/YP7naIWhEsFdzXUcsQUpp78tpVNufEl1feSWL4fMdgpY/DgCh
	 XK9rqSHiptRdzorr1PleYuOzpTHhNYykLQ4K+c/zPpZsb6Nonhm7o5T4kdZjqeJujw
	 eKJeNg/Kjh8cP77a3D5HUDh/21qKJUrN7c6T1vi2Km41a+A5eRwSvfBFSflkD7IpkJ
	 fFtPzm3pxSaSA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-current-20240531
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <87ttidvrup.fsf@kernel.org>
References: <87ttidvrup.fsf@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 quic_jjohnson@quicinc.com
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171723587573.967328.5470768065737630382.kvalo@kernel.org>
Date: Sat,  1 Jun 2024 09:57:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_025808_942387_5EF5B405 
X-CRM114-Status: GOOD (  11.38  )
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

> Hi,
> 
> Please pull, more information in the tag below.
> 
> Kalle
> 
> The following changes since commit 1d60eabb82694e58543e2b6366dae3e7465892a5:
> 
>   wifi: mwl8k: initialize cmd->addr[] properly (2024-05-07 15:08:14 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-current-20240531
> 
> for you to fetch changes up to 6e16782d6b4a724f9c9dcd49471219643593b60c:
> 
>   wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP (2024-05-23 15:45:52 +0300)
> 
> ----------------------------------------------------------------
> Merge ath-current from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> 
> ath.git fixes for 6.10. Two fixes for user reported regressions in
> ath11k. One dependency fix and one error path fix.
> 
> ----------------------------------------------------------------
> Baochen Qiang (1):
>       wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP
> 
> Breno Leitao (1):
>       wifi: ath11k: Fix error path in ath11k_pcic_ext_irq_config
> 
> Carl Huang (1):
>       wifi: ath11k: fix WCN6750 firmware crash caused by 17 num_vdevs
> 
> Dmitry Baryshkov (1):
>       wifi: ath10k: fix QCOM_RPROC_COMMON dependency
> 
>  drivers/net/wireless/ath/ath10k/Kconfig |  1 +
>  drivers/net/wireless/ath/ath11k/core.c  |  2 +-
>  drivers/net/wireless/ath/ath11k/mac.c   | 38 ++++++++++++++++++++++-----------
>  drivers/net/wireless/ath/ath11k/pcic.c  | 25 +++++++++++++++-------
>  4 files changed, 44 insertions(+), 22 deletions(-)

Pulled, thanks.

10bc8558b59a Merge tag 'ath-current-20240531' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/87ttidvrup.fsf@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


