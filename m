Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D751DC4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZieGXy2W2RNsFYzvlE4thhjUPgqiStF2Ihyc9LjNzuI=; b=DTaA3Fxbgu+3UfAE21xuEEd1FJ
	LTpKLt28yfjXB+UZXhq7j7sZAQ/fmvecbmOSxwsAWjz1C2oKLrFSCwwz2WK0Ny8obEIsq8axTueuL
	TV3L1tMtV8clSw5Xfj4ShKbm9CtbtC/xcUqBp+uHy33yHy/Z1LIpFK+EYhhBjv0GgS6K2s41Vhm9i
	um6MAWxJzTbYUJGwMyyXDXGY//Alx/0jclB8kkas/uQY9hBG142hLLqUbHHmYfCYPMKUopHk723Dj
	TZ6scZcNBcBQ7hcmaaLtCFCdNYmpNglEw4wa73zWR4+BfemzyK6GwTdRWa1QNvXXuk94x36uz/vgK
	WccAA19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZ69-00000003Wv5-1f16
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 09:39:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZ66-00000003Wty-1lXU
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 09:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A93961251;
	Wed, 24 Apr 2024 09:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C2FC113CE;
	Wed, 24 Apr 2024 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713951564;
	bh=GUIlLkif8keejqDQqKOkW9EQrA1+ijV1H3EyKQjskfw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WNzwHM8gw8qQj5lZ9kTqaCfk+IsJoUwzTwOqm2LQleRnp1evX4zvo7ieb0J7NFL3W
	 rx2YlMTL32rBqESPwHshSYhc6BBYocL3kah1koOKQlCHgfHEj85gRlib3DfVBo54L/
	 n7Bt78Kswcv0jBNPiKcG8lVad/nghY5mJSVUnynz7JjPN2FH9IW7Ez2tJfqEEZRgBr
	 n8yqLp9ihF6LhcdzwvwiN1iau7V+cdYn01Zx5QlgEWKwmEj0oryF4ghGRE5GKf1rbL
	 AT6qwnNvOfOPhh27XQPy9sHVvtRWFNqlvXu1zu/lRhQXo/g/ZJ90FvTP3VIvemdxyH
	 ScPrYPy8znSCw==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
	<20240424065646.1666166-4-quic_periyasa@quicinc.com>
	<517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
Date: Wed, 24 Apr 2024 12:39:21 +0300
In-Reply-To: <517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
	(Johannes Berg's message of "Wed, 24 Apr 2024 09:28:20 +0200")
Message-ID: <87il07t7zq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_023926_558419_151706F2 
X-CRM114-Status: GOOD (  16.00  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2024-04-24 at 12:26 +0530, Karthikeyan Periyasamy wrote:
>> Currently, hardware state is not protected across the reconfigure
>> operations. However, in single wiphy models, multiple radio/links is
>> exposed as a MAC hardware (ieee80211_hw) through the driver hardware
>> abstraction (ath12k_hw) layer. In such scenario, we need to protect
>> hardware state across the multiple radio/link at the driver hardware
>> abstraction (ath12k_hw) layer. Therefore, introduce a new mutex in
>> the ath12k_hw layer.
>> 
>
> It's your driver, but ... it would seem _simpler_ to do locking across
> the hw with a single wiphy model, because everything (except currently
> for ath12k_core_reset and ath12k_core_restart) already holds the wiphy
> mutex. You can probably move those to wiphy work.
>
> I'd avoid doing lock explosion like we had in mac80211, it's going to
> come back and bite you eventually :)

Exactly. Swithing to use wiphy_lock() definitely one of my longterm
goals in ath12k. I already started working on switching ath12k to use
wiphy_lock() but IIRC I got blocked by not being able to call
wiphy_delayed_work_cancel() without taking wiphy_lock. One way to solve
that might be to convert WMI event handling to use wiphy work but didn't
have the time to work on that so I put it on the backborner. I should
resurrect that branch and submit it as RFC.

But for the time being I think we need to add another mutex to ath12k, I
don't want to block Karthikeyan for too long.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

