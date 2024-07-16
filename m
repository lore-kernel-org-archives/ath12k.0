Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6C6C3DA49
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YhO5PmbHWyNHl7YcXQS7r1Sj6atSqfCXlt8zI/hAxk=; b=rtjmTue51uUCv9W0j5iFAKLLXP
	kq1kKuxPcHT/F4AG3tyZpj/7UWP/8dTpG8OY1f05ORgupaos4KS+jge/4WygrmcLydIwfAvPWRiPt
	f6ChETeAFHrpoXxMkCe/tn75Nc8prSKZVXP3Cmhyd8LE0+dXnZINOGap3hjPr6FoMuoYibBWR15sA
	kquspT8ROLQoIsnunREHjGNb+AxDCYYZR8Lr8ZOj5nOZxCf1g5i+YlVfjAZpX5CWq62JK1vWHxIt8
	NTpDNwyi9irv4nZSsgv9BGifHSJ1n1pqnWrmO43GF0Rj4yiWeNpFdnAb3F+KlZDI8kQmvGrRAeqc7
	a/VgQpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTkHJ-0000000AvY3-0sOy
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 15:39:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTkHG-0000000AvXb-1iwN
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 15:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7864612E7;
	Tue, 16 Jul 2024 15:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88487C4AF0B;
	Tue, 16 Jul 2024 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721144381;
	bh=C1k0pii6K6mISsN7ikworzl7ytrXnGBw4UelyAmvbWc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pRifRU+Xc+hgTIIzsj8Niih5psN5fJ8f92vDRMRyELzF9g1nEtkXzvSnTQIGcR2pB
	 hdg7LBTYVPJngy4Bu2e9cjVFtjB1q0kgBhMtTpKyQbRGBuWlrBtsl+Ll29hkyH7LeH
	 Fh4qjbFUZwWodMD3luPFQ/Ym7h3H8d5/AVj9dPG9bEuRqNdZ8Xz31nC992fnC84nhk
	 Yw/nQxXQiCfZ7QnXvuGmkjpMIBNam8oiFLKPDo9/26DU+fNbdaMnLM/YYfjusadXKQ
	 hsYZSFx1wXFkkkE+4Fr4BYQY2KKV1Dm/s+fH/SNFTUO9oQobXO39vYx0AS7/ZNnbzL
	 0xQH18MTum5Yw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 269B2CE13CB; Tue, 16 Jul 2024 08:39:41 -0700 (PDT)
Date: Tue, 16 Jul 2024 08:39:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net] wifi: ath12k: fix build vs old compiler
Message-ID: <834dd0b3-6a2c-4af6-9541-27fd4b21d833@paulmck-laptop>
References: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
 <a7950e7b-2275-4b6d-b8e1-4f50d0bc28e6@quicinc.com>
 <93d282fb-4691-460a-aa5b-13e9ef054cdb@quicinc.com>
 <A4FF7C44-06C7-4241-B33E-1E9684A979E0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A4FF7C44-06C7-4241-B33E-1E9684A979E0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_083942_556094_01B253E2 
X-CRM114-Status: GOOD (  20.48  )
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
Reply-To: paulmck@kernel.org
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Jul 16, 2024 at 07:36:40AM -0700, Kees Cook wrote:
> 
> 
> On July 16, 2024 7:03:55 AM PDT, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> >On 7/16/2024 7:00 AM, Jeff Johnson wrote:
> >> On 7/16/2024 4:06 AM, Paolo Abeni wrote:
> >>> gcc 11.4.1-3 warns about memcpy() with overlapping pointers:
> >>>
> >>> drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
> >>> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
> >>>   114 | #define __underlying_memcpy     __builtin_memcpy
> >>>       |                                 ^
> >>> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
> >>>   637 |         __underlying_##op(p, q, __fortify_size);                        \
> >>>       |         ^~~~~~~~~~~~~
> >>> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
> >>>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
> >>>       |                          ^~~~~~~~~~~~~~~~~~~~
> >>> drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
> >>>   190 |                         memcpy(pat, eth_pat, eth_pat_len);
> >>>       |                         ^~~~~~
> >>> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
> >>>   114 | #define __underlying_memcpy     __builtin_memcpy
> >>>       |                                 ^
> >>> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
> >>>   637 |         __underlying_##op(p, q, __fortify_size);                        \
> >>>       |         ^~~~~~~~~~~~~
> >>> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
> >>>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
> >>>       |                          ^~~~~~~~~~~~~~~~~~~~
> >>> drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
> >>>   232 |                         memcpy(pat, eth_pat, eth_pat_len);
> >>>       |                         ^~~~~~
> >>>
> >>> The sum of size_t operands can overflow SIZE_MAX, triggering the
> >>> warning.
> >>> Address the issue using the suitable helper.
> >>>
> >>> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> >>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >>> ---
> >>> Only built tested. Sending directly to net to reduce the RTT, but no
> >>> objections to go through the WiFi tree first
> >>> ---
> >>>  drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
> >>> index c5cba825a84a..bead19db2c9a 100644
> >>> --- a/drivers/net/wireless/ath/ath12k/wow.c
> >>> +++ b/drivers/net/wireless/ath/ath12k/wow.c
> >>> @@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
> >>>  	if (eth_pkt_ofs < ETH_ALEN) {
> >>>  		pkt_ofs = eth_pkt_ofs + a1_ofs;
> >>>  
> >>> -		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
> >>> +		if (size_add(eth_pkt_ofs, eth_pat_len) < ETH_ALEN) {
> >>>  			memcpy(pat, eth_pat, eth_pat_len);
> >>>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
> >>>  
> >>> @@ -228,7 +228,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
> >>>  	} else if (eth_pkt_ofs < prot_ofs) {
> >>>  		pkt_ofs = eth_pkt_ofs - ETH_ALEN + a3_ofs;
> >>>  
> >>> -		if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
> >>> +		if (size_add(eth_pkt_ofs, eth_pat_len) < prot_ofs) {
> >>>  			memcpy(pat, eth_pat, eth_pat_len);
> >>>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
> >>>  
> >> 
> >> Duplicate of https://msgid.link/20240704144341.207317-1-kvalo@kernel.org ??
> >
> >Let me add Kees & Paul to see if they prefer your solution
> 
> Heh, yeah, that works too! Avoid the overflow via saturating addition.
> 
> Reviewed-by: Kees Cook<kees@kernel.org>

Tested-by: Paul E. McKenney <paulmck@kernel.org>

I have no preference between the two, but it would be really nice if a
fix were to hit both -next and mainline sooner rather than later.  ;-)

							Thanx, Paul

