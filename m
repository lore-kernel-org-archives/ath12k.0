Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DADC54FB3
	for <ath12k@archiver.kernel.org>; Mon, 26 May 2025 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2BddTyHG9Uw/IHh1D/1cAmtTnsv3is0bt3XJGih1cc=; b=1BY21bLfSi+5+HHodWuDSKe532
	vi1HPpbayEYrGx+mx7zAiI1e0siu+I1ThQ0tCE7JiplmwJg2EFkMsZb9JsRyOrpMbndpg6jioaXoK
	GtpH371fmsMfpl2YwoH2UgmJ2FMwfGUjhSma4RNm4z1JV2Q5yUWY7L+kagVZ9szH9af7PrMrfl57P
	n0vD5vITnyZlV9Z7bTdcp9mIr0IceeT6kB8M3Udbfmc2qKXS9UI8i78J0hLXSIBNA9GiObhTyhODP
	nXlRIp8EberEQpoVqbb7c8n/WEgh0zGcOWiU4bXzckhIV6FzWUvCC0issGhs1oHDNA6nPI+1SBU9g
	O/n0aYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJW6k-00000008iB3-2vnm;
	Mon, 26 May 2025 11:35:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJW6i-00000008iAh-0jf9
	for ath12k@lists.infradead.org;
	Mon, 26 May 2025 11:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3FCDA4E466;
	Mon, 26 May 2025 11:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB06BC4CEE7;
	Mon, 26 May 2025 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748259302;
	bh=5SkZ27MFt+s5gbVQg3eH6ITCcs8U+KTTQskKya4Ci2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gG1noKS+2rYdiUxvikU5MDWDqnSdzxnC9pj6g76zAGYnk1dcH6cnfbBUQgOsDClG+
	 GUpED1jEpKKy5Te/ypi2RuF822sr2UMZX50rQRtwMktVq8Vqcj9Bjz0s4uPhX1JMSf
	 Jo4fIK1u2alLzFlyrie5kSUgfwgVwtS4K25V1aGH6IIYKEUmGmA2XEjYxD2/1FsfHk
	 yXqubXIUIXoXcRXZ2AEFBWiOxX8DeXGI14kqOrW04n+pU+MoXURCJM7DcMdrMQAYAd
	 uy/yRH4aR8OzcuaiXIky6inPYCq4VcYdM6fvZc8ReXgddoXcwS6QbjqkItVNpXCpTU
	 5Bvzd3q9bASjg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uJW6g-000000000GJ-1m26;
	Mon, 26 May 2025 13:35:03 +0200
Date: Mon, 26 May 2025 13:35:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Clayton Craft <clayton@craftyguy.net>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Nicolas Escande <nico.escande@gmail.com>,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix ring-buffer corruption
Message-ID: <aDRR5oYBU0Z-DaWr@hovoldconsulting.com>
References: <20250321095219.19369-1-johan+linaro@kernel.org>
 <aC8-mUinxA6y688X@pilgrim>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC8-mUinxA6y688X@pilgrim>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_043504_358772_68E7BC56 
X-CRM114-Status: GOOD (  31.61  )
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

On Thu, May 22, 2025 at 05:11:21PM +0200, Remi Pommarel wrote:
> On Fri, Mar 21, 2025 at 10:52:19AM +0100, Johan Hovold wrote:
> > Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> > breaks and the log fills up with errors like:
> > 
> >     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
> >     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> > 
> > which based on a quick look at the ath11k driver seemed to indicate some
> > kind of ring-buffer corruption.
> > 
> > Miaoqing Pan tracked it down to the host seeing the updated destination
> > ring head pointer before the updated descriptor, and the error handling
> > for that in turn leaves the ring buffer in an inconsistent state.
> > 
> > While this has not yet been observed with ath12k, the ring-buffer
> > implementation is very similar to the ath11k one and it suffers from the
> > same bugs.

> > Note that the READ_ONCE() are only needed to avoid compiler mischief in
> > case the ring-buffer helpers are ever inlined.

> > @@ -343,11 +343,10 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
> >  		goto err;
> >  	}
> >  
> > +	/* Make sure descriptor is read after the head pointer. */
> > +	dma_rmb();
> > +
> 
> That does not seem to be the only place descriptor is read just after
> the head pointer, ath12k_dp_rx_process{,err,reo_status,wbm_err} seem to
> also suffer the same sickness.

Indeed, I only started with the corruption issues that users were
reporting (with ath11k) and was gonna follow up with further fixes once
the initial ones were merged (and when I could find more time).

> Why not move the dma_rmb() in ath12k_hal_srng_access_begin() as below,
> that would look to me as a good place to do it.
> 
> @@ -2133,6 +2133,9 @@ void ath12k_hal_srng_access_begin(struct
> ath12k_base *ab, struct hal_srng *srng)
>                         *(volatile u32 *)srng->u.src_ring.tp_addr;
>         else
>                 srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
> +
> +       /* Make sure descriptors are read after the head pointer. */
> +       dma_rmb();
>  }
> 
> This should ensure the issue does not happen anywhere not just for
> ath12k_ce_recv_process_cb().

We only need the read barrier for dest rings so the barrier would go in
the else branch, but I prefer keeping it in the caller so that it is
more obvious when it is needed and so that we can skip the barrier when
the ring is empty (e.g. as done above).

I've gone through and reviewed the remaining call sites now and will
send a follow-on fix for them.

> Note that ath12k_hal_srng_dst_get_next_entry() does not need a barrier
> as it uses cached_hp from ath12k_hal_srng_access_begin().

Yeah, it's only needed before accessing the descriptor fields.

> > @@ -1962,7 +1962,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
> >  {
> >  	u32 len;
> >  
> > -	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> > +	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> >  	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> >  
> >  	return len;
> > @@ -2132,7 +2132,7 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
> >  		srng->u.src_ring.cached_tp =
> >  			*(volatile u32 *)srng->u.src_ring.tp_addr;
> >  	else
> > -		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
> > +		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> 
> dma_rmb() acting also as a compiler barrier why the need for both
> READ_ONCE() ?

Yeah, I was being overly cautious here and it should be fine with plain
accesses when reading the descriptor after the barrier, but the memory
model seems to require READ_ONCE() when fetching the head pointer.
Currently, hp_addr is marked as volatile so READ_ONCE() could be
dropped for that reason, but I'd rather keep it here explicitly (e.g. in
case someone decides to drop the volatile).

Johan

