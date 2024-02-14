Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20446C48BC4
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi3Xs7CvpqCNzxxb6XTsRLlCiBOaXTGuNmWTsgxzBXA=; b=VgYRUe4/PamkX9/gu/HyhkujXN
	shmMCAKZsUbm+f+hkQbHj2oOS3MVzkmvn3s42leI/b39JJrIrgx+MEuNTkFkkz9B3g1PdjOYK/zEz
	yzLZ3CSEkVDpN11x+S+1d2nTFUH9A+CA+y0A3uFxDmUsYRQfuvhDrAJA4O3Asxm1Hpsa7o1o7v0VO
	N1S2Rl8foK+hFCWwQTjSwLkNo3gZDAnybc0DkBubkLNb14a5wEIcvyWAzLUOvq1LzZgjswuLzgxJo
	rW0On44IHcWrKjelJagqe2WHk70Fup3iOadpgePoEfAO3y97mP0/QFIXA+mc42TZAyZaSHDFVBXhV
	M8D44fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raClG-0000000CZL7-3PYY
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 10:45:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raClD-0000000CZKh-2ddp
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 10:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DEC461886;
	Wed, 14 Feb 2024 10:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F91C433F1;
	Wed, 14 Feb 2024 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707907502;
	bh=c5a5QD1qybAX8sIO7SlkwMh3DXcoPgzluORoGmCH18o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MHd1grYrjnKc6N9SBwHUg+n7lvaoMgaqHzbsWY/uOvBtvyA/Sdh5GG2It2CXBgr+O
	 f6cdD473ETW5ujH6eag47aT9vAFUtzuCDz2Qo3hbR/iKNTJ/nzTfi1eDzuyMui+ma4
	 SMSV86kIPVszpaikgwZmMolujKS0mFjwrO1ZBlfpR2uNg46S5LBdN/EY/clf9ny6t/
	 w1UtIqsz3y+mk73XgXWesN6JXldOrboaDEk/OC0MDo9uacqx3ZHkVSzh9ww4X84cMk
	 KNU4hDcT6ApwBbp0wc6VQdixjI1QQ5UdladLXqrjxpiYZHjQ5XLKeZg98BIMBPUvZc
	 TEhhP98yNTKZw==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>,  "Jeff Johnson"
 <quic_jjohnson@quicinc.com>,  "Karthikeyan Periyasamy"
 <quic_periyasa@quicinc.com>,  "Aloka Dixit" <quic_alokad@quicinc.com>,
  "Wen Gong" <quic_wgong@quicinc.com>,  "Muna Sinada"
 <quic_msinada@quicinc.com>,  "Aditya Kumar Singh"
 <quic_adisi@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: sanitize ath12k_mac_allocate() return code
References: <20240213100912.459018-1-arnd@kernel.org>
	<170790025305.3179441.138152315558305278.kvalo@kernel.org>
	<08ac32ef-610d-479d-a3fd-a3c3b8c4c697@app.fastmail.com>
Date: Wed, 14 Feb 2024 12:44:58 +0200
In-Reply-To: <08ac32ef-610d-479d-a3fd-a3c3b8c4c697@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 14 Feb 2024 11:37:52 +0100")
Message-ID: <87plwze34l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_024503_737853_07D9C0E9 
X-CRM114-Status: GOOD (  10.60  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Wed, Feb 14, 2024, at 09:44, Kalle Valo wrote:
>> Arnd Bergmann <arnd@kernel.org> wrote:
>>
>>> The return code has no initializer:
>>> 
>>> drivers/net/wireless/ath/ath12k/mac.c:8006:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>> 
>>> Make it return -ENOMEM for allocation failures and remove the unused
>>> variable instead.
>>> 
>>> Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> Nathan already fixed this:
>>
>> https://git.kernel.org/kvalo/ath/c/04edb5dc68f4
>>
>> Patch set to Rejected.
>
> Ok, sounds good. Nathan's patch looks fine to me

Great, thanks for checking.

> but I see it's not in linux-next yet as of today.

Yeah, it's a problem that ath.git is not included linux-next builds. The
commits will be in linux-next only after ath-next is pulled to
wireless-next :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

