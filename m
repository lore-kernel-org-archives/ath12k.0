Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5688BC4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn/erYRy9sYIQ4csSMXt8UgomqDlfwJZMPVhKZCvquI=; b=lDaA8+tX5XHbx5FndmusdRogB6
	wvpvfZ+sZGoKhl6vkD8YrjXsFk2W6IxXOras8lqRJMpO708+DMuOe/YEtn4U347AN+XuqS5t/kDQ/
	M/2Dx9m7ful+8M/a4A0W7kL7/6qCxrq/i0HkU8IedNlvSzO7SlRtcXx73tTVxHwtU1NhduvSvOaUx
	V+Ma2iAvKnLqInlqRwrXZ0uBYtIFZ56fM0OAtxMJ2OdUhBs9ZanZuWTwTv1jiWQsTryZlEkcosRcE
	21jSiZBN5ksU5GZOFrrPbnn3NFVj6uBmkXH6Wa38iowra6C3ld5n9TsflVmc4qTBPLVe8BfdmuISG
	/J5eaV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LYM-00000001qSK-0E8S
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 07:35:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LYJ-00000001qRA-05W9
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 07:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C78F960B9A;
	Mon, 29 Apr 2024 07:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF4CC113CD;
	Mon, 29 Apr 2024 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714376153;
	bh=AT28jAxeKMLr+S30R7py8Pa+K+hP1qri16uSK2Ye/0Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dqJoR5QTgRNNA7SGYVy9KVfLqBdiiTmciMXqJi3i+I5PzttfIU9UiLG+ySZvkFd5v
	 RCoK+FABPFqRESkUZm0NzQp4eZvC+ajvfDqUDL06k4/tD7p7PQxMfstfoBqsQCu3Oy
	 5noGWsJL3O8X/FLMisJUP0+vrTq5HLlwPye9ecE9gDe65M1AOn07GlBTMFeMePqqt6
	 BJk5jmk47YciB8tjuTzMqCpDWpTqA7EFumKN/gsXuHHuCO12pEEGp/sTMA36HH0XCE
	 zRKhM8JcAQqP1UFh1xPgkgr7cI8nsxlWAUobndfDGR/gMieg6zCiOpHYL5nDhW0Xjr
	 T0dME1uG7hzFw==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] cfg80211: Allow pre-CAC for self-managed wiphy
References: <20240429042723.2847389-1-quic_hprem@quicinc.com>
Date: Mon, 29 Apr 2024 10:35:50 +0300
In-Reply-To: <20240429042723.2847389-1-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Mon, 29 Apr 2024 09:57:23 +0530")
Message-ID: <87mspcr57t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_003555_130659_08B20293 
X-CRM114-Status: GOOD (  12.38  )
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

Harshitha Prem <quic_hprem@quicinc.com> writes:

> Currently, to allow pre-CAC it requires both driver's regulatory domain
> in wiphy and cfg80211 local regulatory domain to be same, along with the
> region to be in ETSI.
>
> But, for self-managed driver, some countries have mismatch between these
> two regulatory domains and it would not allow for a pre-CAC. For example,
> in ath12k driver (self-managed), country Sri Lanka (LK) is classified as
> FCC domain as per cfg80211 local regulatory database but as per ath12k
> driver it falls under ETSI domain then because of this mismatch, the
> driver might not be able to do a pre-CAC.
>
> Hence, add changes to allow pre-CAC based on wiphy's regulatory setting
> if it is a self-managed wiphy.
>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

"wifi:" missing from from title but I suspect no need to resend just
because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

