Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFD4CDB483
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvRF+149Bwuubx7zpFFxKuUPXG2WUVZbSqZVy9W0qYQ=; b=1BcdYjmSSImnDY
	30YQaIg2uSiEkwa1Bftw3e7N4uAgGop5yvqpTr2L4EFX/iFtXfUESei6MGlBn+a+K/D4wV42FTNL/
	0ViFN0grpSg7LO3mq0522oQhMO62Nx1kKaWVMmk/en7mT/DwVUyr4e0kkrfCaTpbQRKCW2BVAHADp
	cFI3bnmP8Wb6q9DrXyv9T2+OUbahwhWRNuWCopcZ7UE0ap7z5IIZt6jHedSsvD5DbHUT6o/aWjm0q
	YOyFxdvuLw1S5Ly3YJQ1GIobarUPnj8cfcmxXrJPInbW4xU9bPpc+JF+eHuOJtxJCCUvl2F16N8Pb
	5XC8131T6uj1vArkkljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1xK-00E9hF-2A
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 08:31:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1xH-00E9fq-1X;
	Wed, 18 Oct 2023 08:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F09B160FAF;
	Wed, 18 Oct 2023 08:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542E1C433C8;
	Wed, 18 Oct 2023 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697617862;
	bh=DmaIORX38lsk+s8u9A1sNW59yUVMPJkqJEYyV4bNIhY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HBIxPtGUhN/JlZd7seAMtycPXYiSRFWhQXCYyKYdLKpJxh+LujAL0rBktmZ8OJNjK
	 Uf/vRvEIg1V8qOiEFI/Nq3+fyTcORNb77V/qxVNfc2E8eLdMnPeszKtlqEwkTc0oKM
	 C05h5vWMEnLnr0y7WGymgR+VpIIDuZLmjlzcdgA6nzA8aoR97fjzxVDFKnt5HyoeS8
	 FryJn4jKuvHbtc5hdtj9EvmxTuxGpNwL12pvLeRewiw6iXQLPXmZCQE/J7J1fNmAZ7
	 5d0nTXsUNhUhNBZXcpIVLYPDOMuxrAMw0Qg+IKdImFurJWrPZ8a6lEiRGmpcBlGdYf
	 +/QogbGs6uNcA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: Remove ath11k_base::bd_api
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231013-ath11k_bd_api-v1-1-3fefe4629706@quicinc.com>
References: <20231013-ath11k_bd_api-v1-1-3fefe4629706@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169761785908.48072.2555690903765273261.kvalo@kernel.org>
Date: Wed, 18 Oct 2023 08:31:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_013103_557410_8143D615 
X-CRM114-Status: UNSURE (   6.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently struct ath11k_base defines the member bd_api. However, this
> member is only accessed within ath11k_core_fetch_bdf(). Since the
> scope is local just to that one function, remove it from ath11k_base
> and instead just use a local stack variable.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b4f70ac0fa88 wifi: ath11k: Remove ath11k_base::bd_api
2180f7ac0abe wifi: ath12k: Remove ath12k_base::bd_api

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231013-ath11k_bd_api-v1-1-3fefe4629706@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
