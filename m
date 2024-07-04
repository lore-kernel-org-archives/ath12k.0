Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3819AC30653
	for <ath12k@archiver.kernel.org>; Thu,  4 Jul 2024 23:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI4lzQjU4loFYpZsrcIAuL5Su0OKtCq8BMiLiN3bz54=; b=zWWllgHhoXQa3N6fdDqf3PGh6n
	J6DEPKtx79schEccnfA0ab0Sfx0TpgTEkBBNWrjMlZExlBYgda/prMK/GtQNS+56fa81mMlQcWiCM
	8XfuM59hlblwHsaxcgxguU+ErrF/2Lb9C6ZlQAXM6PK5CPWz2+DQcNdxUBVeqxoM2FSk6mVzpis0q
	9AnD8TrJcM5Va5J9jKCwKpwTGowbsK8o/ZdArqNJrWglM6/rOdaRiTqGnze41USKFCGTi40rBcVgF
	QOM6coPKNe7TUVpTDIYk5yt3wLhdFLU+uD5Q2yay/iF4bEhb06Eie1EqIY8Vya4O5Ho0mM2JhmHij
	i65tZ+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPVp8-0000000EXux-3VUM
	for ath12k@archiver.kernel.org;
	Thu, 04 Jul 2024 23:25:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPVp5-0000000EXuS-2HHb
	for ath12k@lists.infradead.org;
	Thu, 04 Jul 2024 23:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1CD3ECE3282
	for <ath12k@lists.infradead.org>; Thu,  4 Jul 2024 23:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D23C3277B;
	Thu,  4 Jul 2024 23:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720135504;
	bh=h/MhLT48xCMPodi/QfEIU2H8ZaCUdDmFDJhZGxscQw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMY9OE+YBKmII3oiZLlmhKJuwEya5BjSfhAMfeQoUj9UzeanyfjO0yQcrc7dxSCl2
	 6hKiPb/dS/dVWO8vcxHPguE4i6N/DCMni7SfThs4k6P3qy37woRZVl9wAsOvSeE5rJ
	 p5zuwut+XosjVlrYQLNcOJpNKD7zxnfHg5ikOe0UPIIrIxVDDO9Cl4/tI745nxGAe0
	 HDw/Xwv14HrWbEAWku7HKZJ5J6mS41QtSMJL2cxrrcwVIOGS/bob0frJXrKIB3+KD9
	 sGlJxiOCTcQs9tdVXzkrmQJIid7CE4bEibxeVoJLe/ff5ORFwa7php5N/WriA8umZ9
	 y+VHa+xIVvvDA==
Date: Thu, 4 Jul 2024 16:25:03 -0700
From: Kees Cook <kees@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC] wifi: ath12k: workaround fortify warnings in
 ath12k_wow_convert_8023_to_80211()
Message-ID: <202407041551.1DC8C03D@keescook>
References: <20240704144341.207317-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704144341.207317-1-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_162508_076474_150D0EFC 
X-CRM114-Status: GOOD (  21.92  )
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

On Thu, Jul 04, 2024 at 05:43:41PM +0300, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Johannes reported with GCC 11.4 there's a fortify warning below. The warning is
> not seen with GCC 12.1 nor 13.2. Weirdly moving the other operand of sum to the
> other side the warning goes away. This is safe to do as the value of the
> operand is check earlier. But the code looks worse with this so I'm not sure
> what to do.

FWIW, this isn't fortify, but -Wrestrict. I would expect the same
warnings even with CONFIG_FORTIFY_SOURCE disabled. Regardless, it's
worth figuring out what's going on. It looks like this is GCC's value
range tracker deciding it sees a way for things to go weird.

I suspect they fixed -Wrestrict in later GCC versions. It might need to
be version-limited...

> In file included from ./include/linux/string.h:374,
>                  from ./include/linux/bitmap.h:13,
>                  from ./include/linux/cpumask.h:13,
>                  from ./include/linux/sched.h:16,
>                  from ./include/linux/delay.h:23,
>                  from drivers/net/wireless/ath/ath12k/wow.c:7:
> drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]

These huge negative values imply to me that GCC is looking at some
signed values somewhere.

> [...]
> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
> index c5cba825a84a..e9588bb7561c 100644
> --- a/drivers/net/wireless/ath/ath12k/wow.c
> +++ b/drivers/net/wireless/ath/ath12k/wow.c
> @@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>  	if (eth_pkt_ofs < ETH_ALEN) {
>  		pkt_ofs = eth_pkt_ofs + a1_ofs;
>  
> -		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
> +		if (eth_pat_len < ETH_ALEN - eth_pkt_ofs) {
>  			memcpy(pat, eth_pat, eth_pat_len);
>  			memcpy(bytemask, eth_bytemask, eth_pat_len);

Both eth_pkt_ofs and eth_pat_len are size_t. ETH_ALEN isn't, but it
would be promoted to size_t here. The value tracker should see that
eth_pkt_ofs could be [0..ETH_ALEN). eth_pat_len is coming from an "int",
though, so that might be the confusion. It may think eth_pat_len could
be [0..UINT_MAX] (i.e. the full range of int within size_t).

So [0..ETH_ALEN) + [0..UINT_MAX] < 6 might be doing something wrong in
GCC 11.x, and it's not actually doing the size_t promotion correctly,
or deciding something has wrapped and then thinking eth_pat_len could
span a giant region of the address space, which freaks out -Wrestrict.
i.e. it's seeing that for the "if" to be true, eth_pat_len could be large
enough to wrap around the addition (though this shouldn't be possible
for 64-bit size_t).

So I could see how [0..UINT_MAX] < 6 - [0..ETH_ALEN) would make it
happier: the right side is now [1..6], so eth_pat_len becomes [1..6).

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

