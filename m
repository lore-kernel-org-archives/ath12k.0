Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61691C5AE59
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPoVJlFpZ+q/VjcMolK8ha9xRxuEfBFCLOJxRLCMi6c=; b=sA0zOGNeoNg3GVhqt3/DSbykiv
	vTqlEomjZwb2KqKjFpCuQ1NaJvpFs2QpOmLPVazhRCl1GAWtSHOx19QlRYP5tDNa5y4te1h4EbZHT
	v+WwpXnwSKdaivEmfTwiDqI7NEf+P4EzJtAzA/pdz5nnOycTj1Nh3t5UG9ooVkkpZQMUtH7QFao68
	nHD8wT+YTsuue25rBEtYKw+o9HMDe2b6bl7kAZDC0BSmnwur1JfiCSCG1U8YT7dfHhLRQ6L9Na2T7
	w3LxuyyK5UgLzAk5OAlR1Kf2DIZDhhNXkZeiwmE2tXLiFaCU94reLLEm3mbJUbGlCJZY9bRmDnhCP
	MXQZ13EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Qe-0000000FDQd-3iyY;
	Thu, 05 Jun 2025 10:02:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7OY-0000000FD9t-3O6u
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 10:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF67D61127;
	Thu,  5 Jun 2025 10:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCC6C4CEE7;
	Thu,  5 Jun 2025 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749117621;
	bh=5Eav7+G7caZZygl7Od69GSqH2G5p51M5I4/DH9iNkvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGEXQI/E3ikPG3TMnj3L1o7OQn1gBi8hj6JUx52U/3rlrwN+n7jsg9Iax58rAQVLP
	 ocQsfyyl0m0VJO+rk+8C4lTmfaa0wMiAs7ZAqrxtbDfhudaGxOKVbAEIH9QqA/ha+5
	 32ZOCTivQ9iI4ynr0DD6wdYByCfrovJyfu+6tgVWap84kn7sfGQvpIbRoF46CmI4QF
	 TkDhNr/9Oh/+1LVvxWuIhucjz8Jsr5zZnd+ok+RfUgZox3qBanmRWV/MoTc3Pe/OOc
	 O/EgOUs5EtI3HavqqB/5Io4BDPcNPZawPoXpJn6lP3IfJ2NHWbZ0OsoUD07k5Pmwy2
	 vV0uNT6dzLp0w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uN7OU-000000000Zb-1mJ1;
	Thu, 05 Jun 2025 12:00:19 +0200
Date: Thu, 5 Jun 2025 12:00:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] wifi: ath12k: fix dest ring-buffer corruption
Message-ID: <aEFqsghEuJc3xxlU@hovoldconsulting.com>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <20250604144509.28374-2-johan+linaro@kernel.org>
 <6f3eb9fa-617e-4434-8fc4-33dd92c4bdd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3eb9fa-617e-4434-8fc4-33dd92c4bdd2@quicinc.com>
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

On Thu, Jun 05, 2025 at 04:41:32PM +0800, Baochen Qiang wrote:
> On 6/4/2025 10:45 PM, Johan Hovold wrote:
> > Add the missing memory barrier to make sure that destination ring
> > descriptors are read after the head pointers to avoid using stale data
> > on weakly ordered architectures like aarch64.
> > 
> > The barrier is added to the ath12k_hal_srng_access_begin() helper for
> > symmetry with follow-on fixes for source ring buffer corruption which
> > will add barriers to ath12k_hal_srng_access_end().
> > 
> > Note that this may fix the empty descriptor issue recently worked around
> > by commit 51ad34a47e9f ("wifi: ath12k: Add drop descriptor handling for
> > monitor ring").
> 
> why? I would expect drunk cookies are valid in case of HAL_MON_DEST_INFO0_EMPTY_DESC,
> rather than anything caused by reordering.

Based on a quick look it seemed like this could possibly fall in the
same category as some of the other workarounds I've spotted while
looking into these ordering issues (e.g. f9fff67d2d7c ("wifi: ath11k:
Fix SKB corruption in REO destination ring")).

If you say this one is clearly unrelated, I'll drop the comment.

> > @@ -343,9 +343,6 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
> >  		goto err;
> >  	}
> >  
> > -	/* Make sure descriptor is read after the head pointer. */
> > -	dma_rmb();
> > -
> >  	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
> >  
> >  	*skb = pipe->dest_ring->skb[sw_index];
> > diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> > index 91d5126ca149..9eea13ed5565 100644
> > --- a/drivers/net/wireless/ath/ath12k/hal.c
> > +++ b/drivers/net/wireless/ath/ath12k/hal.c
> > @@ -2126,13 +2126,24 @@ void *ath12k_hal_srng_src_get_next_reaped(struct ath12k_base *ab,
> >  
> >  void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
> >  {
> > +	u32 hp;
> > +
> >  	lockdep_assert_held(&srng->lock);
> >  
> > -	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
> > +	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
> >  		srng->u.src_ring.cached_tp =
> >  			*(volatile u32 *)srng->u.src_ring.tp_addr;
> > -	else
> > -		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> > +	} else {
> > +		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> > +
> > +		if (hp != srng->u.dst_ring.cached_hp) {
> 
> This consumes additional CPU cycles in hot path, which is a concern to me.
> 
> Based on that, I prefer the v1 implementation.

The conditional avoids a memory barrier in case the ring is empty, so
for all callers but ath12k_ce_completed_recv_next() it's an improvement
over v1 in that sense.

I could make the barrier unconditional, which will only add one barrier
to ath12k_ce_completed_recv_next() in case the ring is empty compared to
v1. Perhaps that's a good compromise if you worry about the extra
comparison?

I very much want to avoid having both explicit barriers in the caller
and barriers in the hal end() helper. I think it should be either or.
 
> > +			srng->u.dst_ring.cached_hp = hp;
> > +			/* Make sure descriptor is read after the head
> > +			 * pointer.
> > +			 */
> > +			dma_rmb();
> > +		}
> > +	}

Johan

