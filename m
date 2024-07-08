Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9DFC3DA41
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmS3xDt1jE8OLaJNseKOJqJrHrwKkrthpTLDYKUaNVA=; b=gIcPhp0XnVxL+taX5wBJ/zNWcw
	mGHGevxyR8EKwcvIKCgtXJzEn0q8K/CEWBzETSo5VjyMl/fwrHS4b6N/hOLWfh74+ivbF4lxDOcML
	F5sQ8brG5q3zgAZMoAZAoLnFdkSqJc6P1ybc2Vbj+VPwTH/nZGojsbGHiX7Gm5n1TMEUxtZQhhUeL
	7xN6ngtG/gx/sgbDxQlf2rOLRTbcXVvow3Sm8ZcaBExcjWf3+TLmXrTxAVbe3uPBypO41m9CjAgh6
	+8cg4+Qr+76XS4mcW+0esUTHDPBuNrXOuz4lKcEf1yja2fqxZN8zEIQQtYoCA649DthkElqTgdK+R
	eMpQVGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQu4w-00000004plC-3yWM
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 19:31:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQu4s-00000004pkT-1Fxw
	for ath12k@lists.infradead.org;
	Mon, 08 Jul 2024 19:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56DD0CE069F;
	Mon,  8 Jul 2024 19:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42C8C116B1;
	Mon,  8 Jul 2024 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720467066;
	bh=xWIqjEKJWV+KQU2fz3X7SNlmN3/sS27O+Ruv3Ju/x2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBjcWO8Rxw/AEVgfarlNbrRjEQBAGkMfnwdomr6ihG/k8OYy83SAafO7mxx/uDWiX
	 TsTFnDCqVVdyd84BAPNZl6zMmcdo8m3KICTUYgxNVkVXndaWy34DLpcderCOqzbpTB
	 tgLi3qYTY+uR7GjZu4KxVbsPRXCIeC4SkkigMfWO5IrmcG/7NInLgQXJJJbaV02WB4
	 xSnc0Bny1SjcNpOiHb4ZrZITSlbCUGzE0oSfT+fatcNr1aeFvR0yiU713oKjVT5BiV
	 QrC+79JrWF4C+SrXcxJg8vXcQnpiMMRZhS+SMZEhxfh/Sti78jb2DS8GINPp/bxNpf
	 nkguuUaTpLIDw==
Date: Mon, 8 Jul 2024 12:31:06 -0700
From: Kees Cook <kees@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC] wifi: ath12k: workaround fortify warnings in
 ath12k_wow_convert_8023_to_80211()
Message-ID: <202407081226.94B1FB24@keescook>
References: <20240704144341.207317-1-kvalo@kernel.org>
 <202407041551.1DC8C03D@keescook>
 <877cdvdgpz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cdvdgpz.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_123112_855411_3F18A2BA 
X-CRM114-Status: GOOD (  41.62  )
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

On Mon, Jul 08, 2024 at 06:51:52PM +0300, Kalle Valo wrote:
> Kees Cook <kees@kernel.org> writes:
> 
> > On Thu, Jul 04, 2024 at 05:43:41PM +0300, Kalle Valo wrote:
> >> From: Kalle Valo <quic_kvalo@quicinc.com>
> >> 
> >> Johannes reported with GCC 11.4 there's a fortify warning below. The warning is
> >> not seen with GCC 12.1 nor 13.2. Weirdly moving the other operand of sum to the
> >> other side the warning goes away. This is safe to do as the value of the
> >> operand is check earlier. But the code looks worse with this so I'm not sure
> >> what to do.
> >
> > FWIW, this isn't fortify, but -Wrestrict.
> 
> Ah, thanks for correcting. I just saw fortify-string.h and made the
> wrong assumption.
> 
> > I would expect the same warnings even with CONFIG_FORTIFY_SOURCE
> > disabled. Regardless, it's worth figuring out what's going on. It
> > looks like this is GCC's value range tracker deciding it sees a way
> > for things to go weird.
> >
> > I suspect they fixed -Wrestrict in later GCC versions. It might need to
> > be version-limited...
> >
> >> In file included from ./include/linux/string.h:374,
> >>                  from ./include/linux/bitmap.h:13,
> >>                  from ./include/linux/cpumask.h:13,
> >>                  from ./include/linux/sched.h:16,
> >>                  from ./include/linux/delay.h:23,
> >>                  from drivers/net/wireless/ath/ath12k/wow.c:7:
> >> drivers/net/wireless/ath/ath12k/wow.c: In function
> >> ‘ath12k_wow_convert_8023_to_80211.constprop’:
> >> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’
> >> accessing 18446744073709551611 or more bytes at offsets 0 and 0
> >> overlaps 9223372036854775799 bytes at offset -9223372036854775804
> >> [-Werror=restrict]
> >
> > These huge negative values imply to me that GCC is looking at some
> > signed values somewhere.
> >
> >> [...]
> >> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
> >> index c5cba825a84a..e9588bb7561c 100644
> >> --- a/drivers/net/wireless/ath/ath12k/wow.c
> >> +++ b/drivers/net/wireless/ath/ath12k/wow.c
> >> @@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
> >>  	if (eth_pkt_ofs < ETH_ALEN) {
> >>  		pkt_ofs = eth_pkt_ofs + a1_ofs;
> >>  
> >> -		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
> >> +		if (eth_pat_len < ETH_ALEN - eth_pkt_ofs) {
> >>  			memcpy(pat, eth_pat, eth_pat_len);
> >>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
> >
> > Both eth_pkt_ofs and eth_pat_len are size_t. ETH_ALEN isn't, but it
> > would be promoted to size_t here. The value tracker should see that
> > eth_pkt_ofs could be [0..ETH_ALEN). eth_pat_len is coming from an "int",
> > though, so that might be the confusion. It may think eth_pat_len could
> > be [0..UINT_MAX] (i.e. the full range of int within size_t).
> >
> > So [0..ETH_ALEN) + [0..UINT_MAX] < 6 might be doing something wrong in
> > GCC 11.x, and it's not actually doing the size_t promotion correctly,
> > or deciding something has wrapped and then thinking eth_pat_len could
> > span a giant region of the address space, which freaks out -Wrestrict.
> > i.e. it's seeing that for the "if" to be true, eth_pat_len could be large
> > enough to wrap around the addition (though this shouldn't be possible
> > for 64-bit size_t).
> >
> > So I could see how [0..UINT_MAX] < 6 - [0..ETH_ALEN) would make it
> > happier: the right side is now [1..6], so eth_pat_len becomes [1..6).
> 
> Earlier I did some testing and I noticed that this if test also gives a
> warning:
> 
> 1 + eth_pat_len < ETH_ALEN
> 
> But this doesn't have any warning:
> 
> 0 + eth_pat_len < ETH_ALEN
> 
> And I stopped my investigation there :)
> 
> > Reviewed-by: Kees Cook <kees@kernel.org>
> 
> So you think this should be applied? It's not really logical so I would
> prefer to avoid taking it if possible. Or should we just ignore the
> warning? It only happens on GCC 11 anyway.

I suspect this won't be the only place in the kernel where -Wrestrict
will give weird results with GCC 11, and there are still plenty of folks
using GCC 11. I think the best option would probably be to version-check
GCC to gate the addition of -Wrestrict.

Arnd, what do you think? This looks like a more extreme version of
commit f9fc1ec28bae ("crypto: drivers - avoid memcpy size warning")

-Kees

-- 
Kees Cook

