Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E8C3DA64
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEdKaRIneemqvFiZ/vNw4vIdjyO8P9d0HCSUYM2Xz58=; b=s3qtPi/YUmFCjis1fr/Z9+wQwO
	/XtAmVrs7StXVy5sojfyuQr2UEmp1osY8iN7+8Dl30/+GD4kBk4eqcVlptj1XX7TMHYk+cPfH9xGD
	KLjvD/Q1YLZpzhAlS5sxPtKjPUFou25/hNEddO7HmZjPpf33qLWP40FZogbURRB6C7nZpOZWpOVJ8
	3JxC0/c3PhShJYV8h6h9xYxdDo+cNVu1k3skAZt6oF/ZSuTb71I8U650SBH9Gm82yU8f8PstQ09nL
	d3Y/qdzJHucMinI1tPEOgYnjOhglsauregm0zsqakElQfJryyUE93HAc28X8WADvpiOmurvsDZMeU
	DXI4+8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBxp-00000001pVl-1pSG
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 16:14:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBxm-00000001pV1-2noy
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 16:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 533B3CE1766;
	Wed, 31 Jul 2024 16:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518FDC116B1;
	Wed, 31 Jul 2024 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722442443;
	bh=FI4to2s/kw3JnehGaIGMy9gv9Bjt9lTDL7rbCa8lSBo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=r4fqyeEn6UuM1nr5vTH369N+YnegkQy5R0JFuxZEoFG8HTWG7RVyBtnAwDY0c+b4j
	 EhxxD7O//qobp+G3A5VSFsYv97TFF3+SY1E8E+TKtGE/15rhBPG74sFinIDTBmNwek
	 5nfpzO0j5nwbWZM7cUrudF2nwV94C6CvM1V5qxF6L7ADSMhGoxeGn5tBqpSR0l6kaC
	 pJMD7K6p+L3ywN7FZFro4Owju8QWo/F3LE3orPER1muDlaCyBt7I4RrykNOU8/i5a1
	 4xhTFTD8UikIv6rE9h/Sb6+U+4Jw9hzcCt/kJVVL9frVuOCE5/AnVWFs71WiDNb91g
	 d1mqJJHfm1N7w==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Kees Cook" <kees@kernel.org>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC] wifi: ath12k: workaround fortify warnings in
 ath12k_wow_convert_8023_to_80211()
References: <20240704144341.207317-1-kvalo@kernel.org>
	<202407041551.1DC8C03D@keescook> <877cdvdgpz.fsf@kernel.org>
	<202407081226.94B1FB24@keescook>
	<973f9a20-0807-4302-a286-d3ff6478529f@app.fastmail.com>
	<87v81d9lk4.fsf@kernel.org>
Date: Wed, 31 Jul 2024 19:14:00 +0300
In-Reply-To: <87v81d9lk4.fsf@kernel.org> (Kalle Valo's message of "Wed, 10 Jul
	2024 20:57:47 +0300")
Message-ID: <87r0b98rp3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_091406_931655_231F3809 
X-CRM114-Status: GOOD (  20.19  )
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

Kalle Valo <kvalo@kernel.org> writes:

> "Arnd Bergmann" <arnd@arndb.de> writes:
>
>> On Mon, Jul 8, 2024, at 21:31, Kees Cook wrote:
>>> On Mon, Jul 08, 2024 at 06:51:52PM +0300, Kalle Valo wrote:
>>>
>>> I suspect this won't be the only place in the kernel where -Wrestrict
>>> will give weird results with GCC 11, and there are still plenty of folks
>>> using GCC 11. I think the best option would probably be to version-check
>>> GCC to gate the addition of -Wrestrict.
>>>
>>> Arnd, what do you think? This looks like a more extreme version of
>>> commit f9fc1ec28bae ("crypto: drivers - avoid memcpy size warning")
>>
>> The f9fc1ec28bae patch was the other way around, it showed up
>> in new compilers but not old ones. I don't think I've seen
>> more gcc-11 -Wrestrict warnings during testing, but I'm currently
>> not set up to do a thorough search. If it's the only one, then
>> Kalle's suggested workaround is probably best, but if there
>> are additional warnings on gcc-11, making the warning depend
>> newer compilers is also fine. 
>
> Honestly I was hoping that we could disable the warning for GCC 11 :)
>
> I feel bad making the code worse due to a compiler problem. For example,
> Intel's zero day bot doesn't seem to use GCC 11 that much anymore, so it
> might surprise more people than just us ath12k folks. (The bot said
> everything was fine but Johannes saw the warning when the code was
> pulled to wireless-next.)
>
>> I just don't want to give up the warning for new compilers altogether.
>
> Me neither. I'm just hoping that we could disable it for GCC 11. But of
> course if you think it's better to add the workaround to ath12k, I can
> submit a proper (non-RFC) patch to do that.

For the archives: Paolo found a nicer way which is now commited:

https://git.kernel.org/linus/b49991d83bba

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

