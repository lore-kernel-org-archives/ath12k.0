Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CD0C36010
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCy+4AA8jR7qMTTERdxgUUTn59jf1v27L5NwUu3dKyg=; b=bxP8wblca0IbIN0cpEfcrcH4YX
	R8WNdFtBICEWZlelhZ4xZk+9voKSVlQMXAHSyrerf0lHVRcZn+4pgFIdbc7a2wNEMywDyd/uam1F0
	atZ2yz/rVdyDQbw7PeG7IKAqKrZfpvCVyd0SSMBuzMzJbPnJUF3YhUlJepCYEeDiZl7Rj7sZrsTFA
	QbJNyF9jfy+c6tqB9smL5yH9DJN6kBFffFU48IgSAy95apyZfqjgSzRtd23Rukgqz2zykL/u4ddND
	sL81yNVBfkGKWzOwJOhK6/ICP11FjCyoHx5ZSv0UaUw2g173AzvhgcEZpgwtXijF/Cc6JvhAVGWap
	cCLNp4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uL7-000000028En-3Dem
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 21:49:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1t6X-00000001yy2-0kYK
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 20:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 014926111F;
	Mon,  7 Apr 2025 20:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8A7C4CEDD;
	Mon,  7 Apr 2025 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744057799;
	bh=0uUkcmMmCH8WwPbyW/FUIokF4YZ8d9l+tAMA/lRdEMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijtN8vE1wTmMMbsno3dXsqAt6uPU8o34qh60buT3USx3lpBJM48f/zHZH81G63+a4
	 kos8PrKFUW4U/GPzv+46aag51ZOiGcJjPOjuLnpMUM2JnFjjAijMLCDNDBBVgzYSvo
	 bztWtGzsRmjKjhZyg2u9m+aXv9DGpYBUXuM0gkRwH9iKBOIzfSQgma/EamUblQNUMO
	 /eCODv3MdScNttANiTxGAHp32lcoHU5X83u5J5H2IoYBlGhWZIKtO1jcKRS/fKpm/C
	 oP3gxjRzrO0K8Fkmmn26dfeTWgM8j/oZQoOofAB6GuV/p52c2whLB+1rYMI66HU/9F
	 nPPJuXAGBw+tQ==
Date: Mon, 7 Apr 2025 13:29:56 -0700
From: Kees Cook <kees@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: ath12k: core.h: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <202504071329.B7BE91F6A0@keescook>
References: <Z8-Snz86Xfwdlyd7@kspp>
 <202504071138.98D5B6E@keescook>
 <620d7c53-e8eb-4816-a9c2-d4bcd44b5d96@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620d7c53-e8eb-4816-a9c2-d4bcd44b5d96@oss.qualcomm.com>
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

On Mon, Apr 07, 2025 at 11:45:15AM -0700, Jeff Johnson wrote:
> On 4/7/2025 11:39 AM, Kees Cook wrote:
> > On Tue, Mar 11, 2025 at 12:02:15PM +1030, Gustavo A. R. Silva wrote:
> >> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> >> getting ready to enable it, globally.
> >>
> >> Move the conflicting declaration to the end of the structure. Notice
> >> that `struct ieee80211_chanctx_conf` is a flexible structure --a
> >> structure that contains a flexible-array member.
> >>
> >> Fix 30 of the following warnings:
> >>
> >> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> >>
> >> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > 
> > Hi, just checking in on this patch. Is some adjustment needed for this
> > to land?
> > 
> > Thanks!
> 
> There is an alternate solution which should land in the next iteration of
> linux-next (I just enabled the post-merge-window flow from ath-next)
> 
> https://lore.kernel.org/all/20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com/

Ah-ha! Thank you! :)

-Kees

-- 
Kees Cook

