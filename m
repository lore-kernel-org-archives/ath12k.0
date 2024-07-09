Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1E9C2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QC5I7G2by0WGX09u+fLGFLR8tKH0MYQOa6mI3KF9aI=; b=n9HDQYBdfuptqLdoOVFb9Gs7Oy
	tHaNKPX/XkmlyIcn9Y/sxMPOUZBv2Hx4+7MQIzOxMalpQwmRJ+yJwOJmraCsrOUSjHUlFEyFITJfL
	7OiGbhKDyqMRWeh4ONSSQfw1XFS2KXqaOCczYAuB6udN9ETL3FOyt/HkIsK1NK5HhjRRLEgJWj8HS
	QQ0/uCrw7RMQuqoA4DqD15KSmohpy46MqsLBIhTSnk5AIfjopJF3b0HoMPqhCmenvDVgeWYvGAxZY
	Sd6YhBDb/X/Cjly7oLAiKxtTl9056RhlPBTpANG8fsV6qPlxPP4NuPmr1xbF0fPpZb/IWLxwZs1lR
	c8Ia1tlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREcT-00000008Ab8-3dum
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 17:27:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREcQ-00000008AYf-1tI6
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 17:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87C12CE127A;
	Tue,  9 Jul 2024 17:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B6FC3277B;
	Tue,  9 Jul 2024 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720546027;
	bh=fRD0QtuTFpWTIbbNvqJ42bfrkfmvGDAk+6WRXY40IxQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PtDY+Xgybjud64Zo0AKzyeiTuQ+p43u9Yf7/WkHV3BQsFFeIsF8Vs83/oJv2uTW1L
	 zc0KjhRqmbrVrGQ7H8l2RwneDn9PCdzIanz3rQRo0vzyKDjOHW5rDAiuHYp10cke9F
	 LX5oYh6KMdk8UbvO5Gi7Q6/IjpEtBSGuBqR5rcgcmCIYDr7Oo/U8UjpYKIv4rV+abg
	 Ob01G2gzGkHi3gLaVjlduy5tiSynXRB2KA/cCgbmlP6ZLGoSA9mz5b4RL5vBlJJfUB
	 m5oXDsBWtaPCZmAZmghAaverqMwGsMxkHKjVyAz68jYmMKzQ/WovxgVukWTuJ+XLyU
	 Mkx8Ej3u5IkuQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2CE02CE0A45; Tue,  9 Jul 2024 10:27:07 -0700 (PDT)
Date: Tue, 9 Jul 2024 10:27:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	kees@kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Subject: Re: [PATCH RFC] wifi: ath12k: workaround fortify warnings in
 ath12k_wow_convert_8023_to_80211()
Message-ID: <241ec41b-c37a-46e2-bf28-9e18130ea4ca@paulmck-laptop>
References: <20240704144341.207317-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704144341.207317-1-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_102710_889680_934BF832 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, Jul 04, 2024 at 05:43:41PM +0300, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Johannes reported with GCC 11.4 there's a fortify warning below. The warning is
> not seen with GCC 12.1 nor 13.2. Weirdly moving the other operand of sum to the
> other side the warning goes away. This is safe to do as the value of the
> operand is check earlier. But the code looks worse with this so I'm not sure
> what to do.
> 
> In file included from ./include/linux/string.h:374,
>                  from ./include/linux/bitmap.h:13,
>                  from ./include/linux/cpumask.h:13,
>                  from ./include/linux/sched.h:16,
>                  from ./include/linux/delay.h:23,
>                  from drivers/net/wireless/ath/ath12k/wow.c:7:
> drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
>   114 | #define __underlying_memcpy     __builtin_memcpy
>       |                                 ^
> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>   637 |         __underlying_##op(p, q, __fortify_size);                              |         ^~~~~~~~~~~~~
> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                        |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
>   190 |                         memcpy(pat, eth_pat, eth_pat_len);
>       |                         ^~~~~~
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
>   114 | #define __underlying_memcpy     __builtin_memcpy
>       |                                 ^
> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>   637 |         __underlying_##op(p, q, __fortify_size);                              |         ^~~~~~~~~~~~~
> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                        |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
>   232 |                         memcpy(pat, eth_pat, eth_pat_len);
>       |                         ^~~~~~
> 
> Compile tested only.
> 
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

(Also compile retested, for whatever that is worth.)

This still shows up in allmodconfig next-20240709 builds.

						Thanx, Paul

> ---
>  drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
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
>  
> @@ -228,7 +228,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>  	} else if (eth_pkt_ofs < prot_ofs) {
>  		pkt_ofs = eth_pkt_ofs - ETH_ALEN + a3_ofs;
>  
> -		if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
> +		if (eth_pat_len < prot_ofs - eth_pkt_ofs) {
>  			memcpy(pat, eth_pat, eth_pat_len);
>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
>  
> 
> base-commit: c1cacb01f35589bd41360cdb7535afc792c08a7c
> -- 
> 2.39.2
> 

