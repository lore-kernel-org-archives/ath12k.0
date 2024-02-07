Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B76C4828D
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlRPdvHa5Hmi+2+vmMoo2vGBFo+9I9Qg+aIo1X/DXpw=; b=Wdiph2RbEXQazvdxNggt/t6p1n
	MRVpml3cF+68WrKJPJqUWil7wBXsocNYSRM9iuSTknvjKV5AwnNhymYww9UTNd4wjBKahZMNFUHv2
	b/Mj86WC+A/4EdP7fBUeAEDPzKhKaKtYDPzhlUsxOpv3wu+wxEbcao60pgz/jpNv86WKEtrC0Deyb
	81cl+xcxCkDirjmwFEKtJH4YnR733KTdCd+MGzV+epKZ16XN02MQacZPLDJ1ZvvUEb19s35qPMUkL
	aUBfHCmLb3TT10B2XPL0ompMyGSWVYRPs7JP3oYPRRK7NHZSoNfGkKL1WYuj0VeVQY21ssJOhrYfE
	YtunjA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjXA-0000000B2W9-2Q3W
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 15:08:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjX7-0000000B2V7-0uPs
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 15:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A449C6188A;
	Wed,  7 Feb 2024 15:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB68C433C7;
	Wed,  7 Feb 2024 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707318496;
	bh=y/x282TGyBYCjdhcKYKHYG/kynm2rucyoPS3V5ieUbM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VD+Ura7ktRstWIYsHIa0uBGaRlrylJuQiMb0G/Z1Ou/klx3BKPrNCku8O1PnAr1UU
	 rvp/vWbyITQnsJpu6D0bAB2etGy+Jbz1Sg0TxzhabyHBx3/EM1OHrG3m36ha5EumsV
	 S+Q/7b38B4inl0Pw3jRCNOqCHK4PYZcb0e7lmHvDjw4GFKD7rPTj+AcLx5BupeHXCH
	 Uc+/e8h83XnknucKPCfn4oFURhl7giw8RzjKTPTXLYp9kBcXEluB06St/WY5frZlcO
	 h5tm2ekwL3m/MMf/j+w6iLZp9qqcgCYebibORvCinj+uiNxqiF3sAJyp0Abj9RvDlR
	 HNfC1dJlP4NTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized use of ret in
 ath12k_mac_allocate()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org>
References: <20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: quic_jjohnson@quicinc.com, morbo@google.com, justinstitt@google.com,
 quic_periyasa@quicinc.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170731849247.2220494.17976129376947521581.kvalo@kernel.org>
Date: Wed,  7 Feb 2024 15:08:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_070817_348349_9E507C1C 
X-CRM114-Status: UNSURE (   8.99  )
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

Nathan Chancellor <nathan@kernel.org> wrote:

> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/net/wireless/ath/ath12k/mac.c:8060:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>    8060 |         return ret;
>         |                ^~~
>   drivers/net/wireless/ath/ath12k/mac.c:8022:9: note: initialize the variable 'ret' to silence this warning
>    8022 |         int ret, i, j;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> Commit 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211
> hw") added a completely uninitialized use of ret. Prior to that change,
> -ENOMEM was returned to the callers of ath12k_mac_allocate() whenever
> ath12k_mac_hw_allocate() failed. Assign that value to ret to make sure
> it is always initialized when used and clear up the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1989i
> Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

04edb5dc68f4 wifi: ath12k: Fix uninitialized use of ret in ath12k_mac_allocate()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240205-ath12k-mac-wuninitialized-v1-1-3fda7b17357f@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


