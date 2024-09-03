Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA0CCD3448
	for <ath12k@archiver.kernel.org>; Tue,  3 Sep 2024 16:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Um7fNBDYaqkyPc70x4oJbYjoKYzbyGO5fJTA4gycLkI=; b=vjjGwi2oYMzqkNKh/2O4aDrf2a
	NRgqlyP/qJwahLMy3O9qkrAiLwgu5pasjbvmo67tJLNROp3dY8vo7hFWJb7mKBXLh9oBTSneN65AH
	b9fIzgJ5LVegnKU7Vyo3s31xPwFQgrFamtrKnUffUnjyabWPW8EojIHPLb3q1W0Hl2NzN7Q7bP6xz
	SGgM1W2Pk4VA+M5deFStqbDh5FJR2NFPpx9pAsVGHFwFbpOguiWdlPJbAthD12WMdmgTIhARQVHBz
	ZNo09Y6+MQ3kueKQ7pFJEpzkCBfLp61JnUoIGprvPxWU0Pv/Lvm/051XPkDi6oIBiVgW+SQ9diVoQ
	yK+sl8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWo4-00000001D5U-0gZ2
	for ath12k@archiver.kernel.org;
	Tue, 03 Sep 2024 16:55:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWo0-00000001D3o-13K3;
	Tue, 03 Sep 2024 16:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF2AAA4269E;
	Tue,  3 Sep 2024 16:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30150C4CEC4;
	Tue,  3 Sep 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725382498;
	bh=7x+YrA8eBSCwHO38MdsmJ0ad5kmlhnw1+vLAFBPFl4o=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=f4fp8a5DSCUzZA6OLozVL5Vq0o0ttbuBEuruPREnT2ln3KFQazSb2Rk68yXYrTSzP
	 Hj5svlhqs3Pz8rcMcXYJQRFx8jW8p/pnyzsA2XRYcCS1l4IJZPk14+Bc6Q2ja9YWAR
	 7LB1S5pqHATXbW2lM8V4YZPfOqfwTkpmqHXocoSfHH141WCgBAweO/EPyQZwcSoISC
	 b5IkyemjLZFWep88hG+bJuYXxUj43N0HeSkhIytvnOGYIM6db2E3ja7ioHWCmWPNEg
	 RKrFecCz/K5ciqEjsj9bGJ5bWgbmaHRn8aVJJ6mgccHZWKPj5Qpu3rwDNGxDhZLPzB
	 AbkfVjmC9ARUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-current-20240903
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <8a9375eb-3205-4a78-a8c1-bd85df106ec9@quicinc.com>
References: <8a9375eb-3205-4a78-a8c1-bd85df106ec9@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
 <quic_jjohnson@quicinc.com>, <quic_kvalo@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172538249548.948898.11503528023921018995.kvalo@kernel.org>
Date: Tue,  3 Sep 2024 16:54:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_095500_390023_2C3373E9 
X-CRM114-Status: GOOD (  16.79  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The following changes since commit 38055789d15155109b41602ad719d770af507030:
> 
>   wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850 (2024-08-05 12:28:07 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20240903
> 
> for you to fetch changes up to 2f833e8948d6c88a3a257d4e426c9897b4907d5a:
> 
>   Revert "wifi: ath11k: support hibernation" (2024-09-02 19:33:00 +0300)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.11-rc7
> 
> We have three patch which address two issues in the ath11k driver
> which should be addressed for 6.11-rc7:
> 
> One patch fixes a NULL pointer dereference while parsing transmit
> power envelope (TPE) information, and the other two patches revert the
> hibernation support since it is interfering with suspend on some
> platforms. Note the cause of the suspend wakeups is still being
> investigated, and it is hoped this can be addressed and hibernation
> support can be restored in the near future.
> 
> ----------------------------------------------------------------
> Baochen Qiang (3):
>       wifi: ath11k: fix NULL pointer dereference in ath11k_mac_get_eirp_power()
>       Revert "wifi: ath11k: restore country code during resume"
>       Revert "wifi: ath11k: support hibernation"
> 
>  drivers/net/wireless/ath/ath11k/ahb.c  |   4 +-
>  drivers/net/wireless/ath/ath11k/core.c | 115 +++++++++------------------------
>  drivers/net/wireless/ath/ath11k/core.h |   4 --
>  drivers/net/wireless/ath/ath11k/hif.h  |  12 +---
>  drivers/net/wireless/ath/ath11k/mac.c  |   1 +
>  drivers/net/wireless/ath/ath11k/mhi.c  |  12 +---
>  drivers/net/wireless/ath/ath11k/mhi.h  |   3 +-
>  drivers/net/wireless/ath/ath11k/pci.c  |  44 ++-----------
>  drivers/net/wireless/ath/ath11k/qmi.c  |   2 +-
>  9 files changed, 49 insertions(+), 148 deletions(-)

Pulled, thanks.

e88b9ed3e03a Merge tag 'ath-current-20240903' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/8a9375eb-3205-4a78-a8c1-bd85df106ec9@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


