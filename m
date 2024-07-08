Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36843C3271E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnUyJnv0qJ+6nqlmkKB87PTawhIRWzws1aKJS83rAIo=; b=dTNBpCMQxSHhufxiiPfNbfgbOj
	wuzal5EfslHTsCRiEB4kU21sp5gcULcbzd8Rbs/TBQwH/QMsOB6flEZhZ7x+bjow0xNQvyAV6HyDm
	dzrWC69qdj45xPrhIA+xCg+8K6hrQc54OHOFNQr6xZnDQCyeTgUBPmgJdJ5WoCE8wNJCQGCkAK8/G
	PO1sEtCinUBcXeR4B5DkKe6HLkW6vdBmkdWF7q0lxapa8qPo1M3fkQFyN/16qyvi1jmoQLhXI8APr
	1N9E21iK5HoYcX4jri60rMSFQfgqcyPwHjerMrNlQoywZVbQgLTYVtPG6uiVawma9o411h9eMd5M+
	K+M9ObkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqek-00000004INt-2vFu
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 15:51:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqei-00000004INE-0wTW
	for ath12k@lists.infradead.org;
	Mon, 08 Jul 2024 15:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6403460E2C
	for <ath12k@lists.infradead.org>; Mon,  8 Jul 2024 15:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A098C116B1;
	Mon,  8 Jul 2024 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720453915;
	bh=VGT2Ll0BJ6zWJMZY1Uv8uMUUvBNnE0W8cZ1/Ln03WAc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G53aqs6pvr+E27anDXTsc3DQ93BiQ/wQUgGNZbayBnD8ooU5VY7HB9wYDSNp3Dyxo
	 vtviRHLFubYLrGXG5rwG2001IifslRPTGwfI8CSZlbB1TLW3+dlV/6nzHt9y/RVO3X
	 u14+U7Ydyaj9STh8ztCxv09L7F9eSgltA7dDcHlIhXaIHQP4Hfm3JJsY76e7P2Hco9
	 YMzb58CNm2jsdklDwqWZoDQSNAIqDa4Fie6uja54Kp+20J/xPtr46dYZ5E0T166HQP
	 jry23opEmjq0BOhURoApRLaDbmPtiV+orK7A436vvfGT/LAT8VHUgd3mRtIdYssREv
	 6Nct1iy8eMO+w==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC] wifi: ath12k: workaround fortify warnings in
 ath12k_wow_convert_8023_to_80211()
References: <20240704144341.207317-1-kvalo@kernel.org>
	<202407041551.1DC8C03D@keescook>
Date: Mon, 08 Jul 2024 18:51:52 +0300
In-Reply-To: <202407041551.1DC8C03D@keescook> (Kees Cook's message of "Thu, 4
	Jul 2024 16:25:03 -0700")
Message-ID: <877cdvdgpz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_085156_419872_824531D0 
X-CRM114-Status: GOOD (  30.09  )
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

Kees Cook <kees@kernel.org> writes:

> On Thu, Jul 04, 2024 at 05:43:41PM +0300, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>=20
>> Johannes reported with GCC 11.4 there's a fortify warning below. The war=
ning is
>> not seen with GCC 12.1 nor 13.2. Weirdly moving the other operand of sum=
 to the
>> other side the warning goes away. This is safe to do as the value of the
>> operand is check earlier. But the code looks worse with this so I'm not =
sure
>> what to do.
>
> FWIW, this isn't fortify, but -Wrestrict.

Ah, thanks for correcting. I just saw fortify-string.h and made the
wrong assumption.

> I would expect the same warnings even with CONFIG_FORTIFY_SOURCE
> disabled. Regardless, it's worth figuring out what's going on. It
> looks like this is GCC's value range tracker deciding it sees a way
> for things to go weird.
>
> I suspect they fixed -Wrestrict in later GCC versions. It might need to
> be version-limited...
>
>> In file included from ./include/linux/string.h:374,
>>                  from ./include/linux/bitmap.h:13,
>>                  from ./include/linux/cpumask.h:13,
>>                  from ./include/linux/sched.h:16,
>>                  from ./include/linux/delay.h:23,
>>                  from drivers/net/wireless/ath/ath12k/wow.c:7:
>> drivers/net/wireless/ath/ath12k/wow.c: In function
>> =E2=80=98ath12k_wow_convert_8023_to_80211.constprop=E2=80=99:
>> ./include/linux/fortify-string.h:114:33: error: =E2=80=98__builtin_memcp=
y=E2=80=99
>> accessing 18446744073709551611 or more bytes at offsets 0 and 0
>> overlaps 9223372036854775799 bytes at offset -9223372036854775804
>> [-Werror=3Drestrict]
>
> These huge negative values imply to me that GCC is looking at some
> signed values somewhere.
>
>> [...]
>> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireles=
s/ath/ath12k/wow.c
>> index c5cba825a84a..e9588bb7561c 100644
>> --- a/drivers/net/wireless/ath/ath12k/wow.c
>> +++ b/drivers/net/wireless/ath/ath12k/wow.c
>> @@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>>  	if (eth_pkt_ofs < ETH_ALEN) {
>>  		pkt_ofs =3D eth_pkt_ofs + a1_ofs;
>>=20=20
>> -		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
>> +		if (eth_pat_len < ETH_ALEN - eth_pkt_ofs) {
>>  			memcpy(pat, eth_pat, eth_pat_len);
>>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
>
> Both eth_pkt_ofs and eth_pat_len are size_t. ETH_ALEN isn't, but it
> would be promoted to size_t here. The value tracker should see that
> eth_pkt_ofs could be [0..ETH_ALEN). eth_pat_len is coming from an "int",
> though, so that might be the confusion. It may think eth_pat_len could
> be [0..UINT_MAX] (i.e. the full range of int within size_t).
>
> So [0..ETH_ALEN) + [0..UINT_MAX] < 6 might be doing something wrong in
> GCC 11.x, and it's not actually doing the size_t promotion correctly,
> or deciding something has wrapped and then thinking eth_pat_len could
> span a giant region of the address space, which freaks out -Wrestrict.
> i.e. it's seeing that for the "if" to be true, eth_pat_len could be large
> enough to wrap around the addition (though this shouldn't be possible
> for 64-bit size_t).
>
> So I could see how [0..UINT_MAX] < 6 - [0..ETH_ALEN) would make it
> happier: the right side is now [1..6], so eth_pat_len becomes [1..6).

Earlier I did some testing and I noticed that this if test also gives a
warning:

1 + eth_pat_len < ETH_ALEN

But this doesn't have any warning:

0 + eth_pat_len < ETH_ALEN

And I stopped my investigation there :)

> Reviewed-by: Kees Cook <kees@kernel.org>

So you think this should be applied? It's not really logical so I would
prefer to avoid taking it if possible. Or should we just ignore the
warning? It only happens on GCC 11 anyway.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

