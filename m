Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E52C07E8E
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flrLT2KXYZN9G7QzeSNth6PGpz0QD4KxDFgpP/x601I=; b=NheapuRgjlrBUwQ7qjgdE1uyru
	ah1dEw1TkV5YBsYUGbZCwXquOY+DXp2+cRDDU+TajYnMJ7srD7U+kWHIbFzsak418nxn89hdNRjtF
	imIubcIf38HiyMoCCnHiurjT7FMy8PWFbV5/++EArd8jAbu3eQc0b51SY4L4CjDl4p6SbF3Pm//N/
	9gMvoCLuTQwKaU+zGJ+7UFpGzO3a7A5fZXhVdeXrjDEUezvvU7Bz9tLWX8v837xBQR9vviYoldxzH
	LRLTiQFxIBQy6Bf0SPEz8yxe6l/SDX9dL21R0XKDmI2aVygw7p4a48yUNsyEJf3RNzGkVEkbU3Yxt
	QEETRzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZGw-00000003Ysk-3tHe
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 09:50:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZGr-00000003Ypc-3l3M
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 09:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D872CCE0FB1;
	Wed, 24 Apr 2024 09:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E43C113CE;
	Wed, 24 Apr 2024 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713952231;
	bh=ZgfWCv5rt80c3R+V8piEBul82k/vEs/F7mBFn4S+wkw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=llcj1PHGQFl1TegzZ1jT8kMTyxj4uiHiuqqxKXlub/wKhhTO5qDQf1d/oWmc1vtEm
	 vr4uefpCgCDESei1wzG8fh16xyVSRCpOdqDucEnwxohZq+BCBMgn40MgSt3F+McMn/
	 jCakuyskNLNiuWmLOkrUKnxmk9M607mZWVRuQa6h2z2I6ACZhqayCOqTWbp/Csb/1l
	 +TFtYzu2Pr2IOhsPs7zNNBr+HtJWWci8soVosb6XpWgssVi2YI9neyJjALY3t11ybK
	 n1IGyTYPKdeuihY9ckOtD1BaEom/hs4L+edVg8kyNQoy2v/RFK+RRzrGnzMlkeDlyY
	 jKbiKW75HAq0g==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 3/3] wifi: ath12k: Add lock to protect the hardware
 state
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
	<20240424065646.1666166-4-quic_periyasa@quicinc.com>
	<517caf852d37b3803bcf087a6b575f2ecdb5ba10.camel@sipsolutions.net>
	<87il07t7zq.fsf@kernel.org>
	<3dc4339f5c3f603027c2214058e7e3251652a7f0.camel@sipsolutions.net>
Date: Wed, 24 Apr 2024 12:50:27 +0300
In-Reply-To: <3dc4339f5c3f603027c2214058e7e3251652a7f0.camel@sipsolutions.net>
	(Johannes Berg's message of "Wed, 24 Apr 2024 11:43:58 +0200")
Message-ID: <87edavt7h8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_025034_195355_A138F696 
X-CRM114-Status: GOOD (  12.82  )
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

> On Wed, 2024-04-24 at 12:39 +0300, Kalle Valo wrote:
>> 
>> Exactly. Swithing to use wiphy_lock() definitely one of my longterm
>> goals in ath12k. I already started working on switching ath12k to use
>> wiphy_lock() but IIRC I got blocked by not being able to call
>> wiphy_delayed_work_cancel() without taking wiphy_lock.
>
> That's because I didn't want to have an async version, but theoretically
> we could have a version of it that just cancels the timer. If you don't
> hold the wiphy mutex already you could even wait for it to finish. It
> just adds more complexity there, and I was trying to make it all a lot
> more obvious :)

Yeah, understandable. I think changing ath12k WMI event handling to use
wiphy_work makes sense, running them in tasklet context feels overkill.
I just need to write the patch :) But after that I hope we can switch to
using wiphy mutex.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

