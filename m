Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B993C3DA4A
	for <ath12k@archiver.kernel.org>; Thu, 22 Aug 2024 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMRAsqICLHhv32pMR9Zo6O5Mn64AxYbaUd6b8roaUrk=; b=MmVP4EZd+rbicfJUZXsY5NExzd
	F+BX/bdmUuYtE5FanwhqkvQapF/umPdqQF/F4rhUSFqIEr93ky4DkZa7Cxb0N6ZYM3kMc0dhlHAWU
	8VPM+OUzk2qmzqm/PEwJB/V0F2aE5Z9YVJRw4Vw6W6UmRwEO02/6I1cndDCeJ/6Y1muGGVYBcySfo
	VJ7rjGUxLjKChS7KzgxAwdOn2m+NO0uBPnXZJoe2Ik0xIeaF/9sJxGWhxv8M413CKwbtWj0MmoCL7
	slze1VwzEfzJFF+zGyosNttXtpp+V1FFaQKixFjtRRnoK/ri7YjY5E6hzkmTVWQEK8UN4MCIDCstu
	6viwkOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shB1e-0000000Dg1G-0cAD
	for ath12k@archiver.kernel.org;
	Thu, 22 Aug 2024 16:51:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shB1b-0000000Dg0n-3cXa
	for ath12k@lists.infradead.org;
	Thu, 22 Aug 2024 16:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B50360F5A
	for <ath12k@lists.infradead.org>; Thu, 22 Aug 2024 16:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A308C32782;
	Thu, 22 Aug 2024 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724345463;
	bh=oozyVpdqLg6UHIZBhIKffWsUV8pmA0nK9tulXciIyK8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DQy3dlB31CAuPdwkMLz/PLgQhB931WCGc6mXcX3DCanpioX+jGPbMA2G9XR84yeg6
	 +OvzWQ94nUaIBtwwHQSBJkkrtxfpv/V7uZaTUiTGRGVbfvkxkmqNdwOxfUWYgYKuEh
	 QMhOZSArqVvqZpsBTR9KM7B25O+VVTrhNPS+iTL7HNC4p13BIvYOTYN3MK9sVBC+U0
	 p7jcozUZTZ3twDD8XgCjRWLGs8ArL0y0ETAczuPqaq+2aHCF3TcG8fjlxKaiR/4y8X
	 uVPOw4FniZylRw/jI94ZeUThHEfMHspfx3Y+2Fi5D6U4owgXz7TJ0ngPxlomra2MoW
	 5bclU1bDdrVsg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][next] wifi: ath12k: Avoid -Wflex-array-member-not-at-end
 warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZrZEuxJihMzAaTVh@cute>
References: <ZrZEuxJihMzAaTVh@cute>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172434545943.2469785.15733185765753701476.kvalo@kernel.org>
Date: Thu, 22 Aug 2024 16:51:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_095103_979076_81D2383B 
X-CRM114-Status: UNSURE (   8.20  )
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

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the structure. Notice
> that `struct ieee80211_chanctx_conf` is a flexible structure --a
> structure that contains a flexible-array member.
> 
> Also, remove an unused structure.
> 
> Fix the following warnings:
> drivers/net/wireless/ath/ath12k/core.h:290:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/net/wireless/ath/ath12k/dp.h:1499:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Should I add a similar comment as with the ath11k patch:

https://patchwork.kernel.org/project/linux-wireless/patch/ZrZB3Rjswe0ZXtug@cute/

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/ZrZEuxJihMzAaTVh@cute/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


