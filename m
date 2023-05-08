Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D501DC77B75
	for <ath12k@archiver.kernel.org>; Mon,  8 May 2023 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CifS01m9QNHepjwO/IPcSL5DMdHNqscI1uYHqkRO1c=; b=uGjtjgO77PCKgC
	e47oCdXI2DEmoFVEE+USHZKZVIrwj4DslJYe1r2kNNBV2JfkNDPY6kNc6xkilVJ+MM1OLYOUVhyyI
	KtLw7tGuzKskvcc+DpZzLXNWgJw3w9CniE42/MazbDqeU6qz8+qC91TToVSOPGopAH36C25XnCHbC
	bAAgnWo147c6srsv0Yo/L56YzWfkBQEEIUdLUipwHzoUySBOySVokQlaIX3hP7xYcfZ0aYOnKh241
	lobbFC6xEr3AsAwhBgAWMqq4PJ/bJLv3qp5ByK5c30UCIVxAGrpKAGBx96mAeOEGQ61BRryv9wVZA
	l4P2AOO09mH3atIGELWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw2JE-000oYl-1b
	for ath12k@archiver.kernel.org;
	Mon, 08 May 2023 14:57:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw2JA-000oYB-2B;
	Mon, 08 May 2023 14:57:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09C14616C6;
	Mon,  8 May 2023 14:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E4AC433EF;
	Mon,  8 May 2023 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683557867;
	bh=jpGRNu5+FvMQ20aEk+IlpTRzk8prDExhd+C0AMyLLyw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=anFJPecn/2S9eutk1Qd8p9EpzhLZTKjmEO6uDDAdmhnwqPwjC+Dc649EeATu+fW8r
	 Lg03ejDhC2ypyNUTlQLqxMQyTrheCnxW9JNKqZ/QoLxxtg7k0ApxR63q0W9VEJhWWP
	 m6bkgHqadtNE7lgaBMn+tvwFBbEBknyO1KrWqs1zMw4qkR7JHX/HmVnrfo6f7NDVkR
	 f2i2wP6rKemgcTqz6COJVNofUvu/7lenlrfMXAECq8mpwJMC9uCVAaryQM9yCxUxhM
	 gYP/Q0rVA0VyUYL0rrCee3i1S5oCGtxI7dZ0mXD2A3yR2NTTm1O/IoYkw0kaTkpMYH
	 RnyR+vcJ8SGhw==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>,  "David S . Miller" <davem@davemloft.net>,  "Eric Dumazet" <edumazet@google.com>,  "Jakub Kicinski" <kuba@kernel.org>,  "Paolo Abeni" <pabeni@redhat.com>,  "Johannes Berg" <johannes.berg@intel.com>,  "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>,  "Wen Gong" <quic_wgong@quicinc.com>,  "Baochen Qiang" <quic_bqiang@quicinc.com>,  "Sowmiya Sree Elavalagan" <quic_ssreeela@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Netdev <netdev@vger.kernel.org>,  linux-kernel@vger.kernel.org,  ath12k@lists.infradead.org
Subject: Re: [PATCH] wireless: ath: work around false-positive stringop-overread warning
References: <20230417205447.1800912-1-arnd@kernel.org>
	<87ttwnnrer.fsf@kernel.org>
	<504c5a7d-0bfd-4b1e-a7f0-65d072657e0a@app.fastmail.com>
Date: Mon, 08 May 2023 17:57:39 +0300
In-Reply-To: <504c5a7d-0bfd-4b1e-a7f0-65d072657e0a@app.fastmail.com> (Arnd
	Bergmann's message of "Mon, 08 May 2023 10:52:11 +0200")
Message-ID: <87mt2eoopo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_075748_795261_44DCAC0E 
X-CRM114-Status: GOOD (  17.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Mon, May 8, 2023, at 10:44, Kalle Valo wrote:
>
>> Arnd Bergmann <arnd@kernel.org> writes:
>>
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> In a rare arm64 randconfig build, I got multiple warnings for ath11k
>>> and ath12k:
>>>
>>> In function 'ath11k_peer_assoc_h_ht',
>>>     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2665:2:
>>> drivers/net/wireless/ath/ath11k/mac.c:1709:13: error: 'ath11k_peer_assoc_h_ht_masked' reading 10 bytes from a region of size 0 [-Werror=stringop-overread]
>>>  1709 |         if (ath11k_peer_assoc_h_ht_masked(ht_mcs_mask))
>>>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> This happens whenever gcc-13 fails to inline one of the functions
>>> that take a fixed-length array argument but gets passed a pointer.
>>>
>>> Change these functions to all take a regular pointer argument
>>> instead.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> s/wireless:/wifi:/ but I can fix that.
>
> Ok, thanks!
>
>> In a awat it's a shame to lose the explicit length but I guess there's
>> no other way to fix this?
>
> There might be, but I couldn't figure out a way that works.

Ok.

>> Also I hope you find the time to add GCC 13 to crosstool :) Related to
>> this
>
> I uploaded gcc-13.1.0 binaries last week, but still need to
> update the html page, so it's not yet linked. You can navigate
> the directories from the gcc-12 builds.

Thanks! I was able to find the build[1] but having an issue:

$ ./x86_64-linux-gcc -v
./x86_64-linux-gcc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.35' not found (required by ./x86_64-linux-gcc)
./x86_64-linux-gcc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by ./x86_64-linux-gcc)
./x86_64-linux-gcc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./x86_64-linux-gcc)
./x86_64-linux-gcc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.36' not found (required by ./x86_64-linux-gcc)
./x86_64-linux-gcc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ./x86_64-linux-gcc)

With older GCC versions from your page I don't have this problem. I'm
using Debian 10 still so so is my libc too old?

ii  libc6:amd64          2.28-10+deb10u2:amd6 GNU C Library: Shared libraries

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.1.0/x86_64-gcc-13.1.0-nolibc-x86_64-linux.tar.gz

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
