Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54475C3DA42
	for <ath12k@archiver.kernel.org>; Wed, 10 Jul 2024 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMR0+Nqp8/pr/39H9jGS3q31+RjxVbuhes6M+549Es4=; b=li/3iQmedLwzxbrly2fCZ0l6Cv
	z0mqoYEvTN3MLroUU0RpnzzN4sRMSQQ+WhDGnRTvJQg4RCLVakp3omwNZFkPOS7XDj4T8FOlNUKVo
	tCIfV8t+r6tF9QOasC2fw4qIQ2whx+/T7qQIfz6ZqJGS7hdfOVC83oLfoU7svtxxj4oC+oWIXW4N2
	uXeebpxpj3Ngii+36aiQTMyDOKGq7STcKmSzDUgWcykuTOl5SEStrBjCI6NMqQT2WzTN0Kfbrq1J2
	0fYLaRBQUOXyvFzc1KY6y/bD8i1E7Jj/ddLxdx+bJuZJvxWICA/WTLXrATTCC9yZLg9GcXqxEyKPH
	LZAzGnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRbZo-0000000BMrU-0Hmi
	for ath12k@archiver.kernel.org;
	Wed, 10 Jul 2024 17:58:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRbZm-0000000BMrL-1PAL
	for ath12k@bombadil.infradead.org;
	Wed, 10 Jul 2024 17:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NMR0+Nqp8/pr/39H9jGS3q31+RjxVbuhes6M+549Es4=; b=E4Ip6RZaec/WVbV8PMyielbKgC
	NEDSNMkGATjxDhh1JMTux5l6gWSDwED5ukJE1bRRLWNwdXg8Ku0UFh0PhlXqyCydrVtTHuW0xbQ84
	AOaqrjmoQJ1nBLg55qSWpXuH8eCjQkCtcWhQCHiY9V3i3G9em/F0bPEmibwaj0cQWUuTKcjFzg4Gm
	9vefZrpjHLW2GT4Y4E/c1zFrmLpJg1QNRh/vQenDrF8J28wNjf2rMq1GryUwU+AUWpk4bCxRbgX3t
	Kh20m5H7G0gSu6/upiHfTP2q7v50CvdGiNICkRfaOJqg/wlcYcxV8iNZ+g6ETeQTbpPVcBNGAsKrm
	CzGCAjNQ==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRbZi-00000000wia-3lPj
	for ath12k@lists.infradead.org;
	Wed, 10 Jul 2024 17:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A65BCE175C;
	Wed, 10 Jul 2024 17:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1829C32781;
	Wed, 10 Jul 2024 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720634270;
	bh=gdLqjCpDLwxbDF582YXqZlohACs8bz6oUymsKUdbgG4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DVs7nBHddK/GKjqTkSLRYtWLisEIEh3vZZZfKCFpDc0uHXZ7cXVwRNZa9mppcEW92
	 brpydQZjPolQiKrsmlnMuV1LwOtoaLoQkqkCMlgExgzXCopNfvKuLy//l1ogeuuFSH
	 +w0S/XfaC7cj5uNawweHZSldVk5pDaHozNkyeM1nlP7/W9qqcUex7qy3soUtCqh4xw
	 IdcWCG83l1MZmd1FqpcUsts5+fma+OEGPHw5VvxvIdZ/WHgfI7wlZTLFGV/Um7dvkO
	 81xT7dhBmETe3d57H2UrJ61okbfOGSrN4OazJW2E5n5L+17Tt8ZdDtV+0e4FCy+Dxk
	 yx5S0RZFG7xiw==
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
Date: Wed, 10 Jul 2024 20:57:47 +0300
In-Reply-To: <973f9a20-0807-4302-a286-d3ff6478529f@app.fastmail.com> (Arnd
	Bergmann's message of "Mon, 08 Jul 2024 21:47:44 +0200")
Message-ID: <87v81d9lk4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_185755_338383_749E779D 
X-CRM114-Status: GOOD (  20.37  )
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

> On Mon, Jul 8, 2024, at 21:31, Kees Cook wrote:
>> On Mon, Jul 08, 2024 at 06:51:52PM +0300, Kalle Valo wrote:
>>
>> I suspect this won't be the only place in the kernel where -Wrestrict
>> will give weird results with GCC 11, and there are still plenty of folks
>> using GCC 11. I think the best option would probably be to version-check
>> GCC to gate the addition of -Wrestrict.
>>
>> Arnd, what do you think? This looks like a more extreme version of
>> commit f9fc1ec28bae ("crypto: drivers - avoid memcpy size warning")
>
> The f9fc1ec28bae patch was the other way around, it showed up
> in new compilers but not old ones. I don't think I've seen
> more gcc-11 -Wrestrict warnings during testing, but I'm currently
> not set up to do a thorough search. If it's the only one, then
> Kalle's suggested workaround is probably best, but if there
> are additional warnings on gcc-11, making the warning depend
> newer compilers is also fine. 

Honestly I was hoping that we could disable the warning for GCC 11 :)

I feel bad making the code worse due to a compiler problem. For example,
Intel's zero day bot doesn't seem to use GCC 11 that much anymore, so it
might surprise more people than just us ath12k folks. (The bot said
everything was fine but Johannes saw the warning when the code was
pulled to wireless-next.)

> I just don't want to give up the warning for new compilers altogether.

Me neither. I'm just hoping that we could disable it for GCC 11. But of
course if you think it's better to add the workaround to ath12k, I can
submit a proper (non-RFC) patch to do that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

