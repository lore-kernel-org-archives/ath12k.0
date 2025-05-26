Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B546EC54FB3
	for <ath12k@archiver.kernel.org>; Mon, 26 May 2025 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCQX/iHwVwMSyQkT6uzynKqPiPAsHTR2j6atuwHYfoU=; b=M4RqDUmZvp/1swmtXHxNV/0ZW1
	53XYUsZODjG7ZLwaH3pJ3yYEr/eY8+9a2qstANG+PuaQfblctsIc4sEia7yoE8I96Z07CagUYMG8t
	fBcQ3Wt9mVfw0BcZBTFtIZDEmwV8htIxq3nqUxeUNHx4OuHGBBbZKsur2X8V7y5u75BOKpDZ0f+hb
	KlggZvy185BSc8u+j30mEr2NYISg0WiMzavHvbzPdTy7ZigIBgPqFLDg9TNGm7p0m8gi5U9W0LNVv
	WIujWRlIBfGB3eb1aCdD0kulNHSVQiT5S/vhKeLRhooM7LfLy3VxK9Z6Wo8jRHLP3J3IBKzueUfZ6
	PLGXUOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJXYX-00000008rYD-1cur;
	Mon, 26 May 2025 13:07:53 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJXYU-00000008rXq-1gyI
	for ath12k@lists.infradead.org;
	Mon, 26 May 2025 13:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1748265768; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=SCQX/iHwVwMSyQkT6uzynKqPiPAsHTR2j6atuwHYfoU=; b=lXHNImCwGybRFZb5MOOprhb3vS
	kQAyxphMMqmFnJgn+5NJzBD6l8nvZJnuugAWoweY6x7U1EGKM+3ftgKnku62AevPi9OMRCnnOh18O
	CLn0OEkVg49BJFXqN7pfxC9mR7jul0QDkSIyygnXdhtoDIrX7GyP/rLwItnov6YTcwEkPn9knvc2q
	ugaYYXrOxhnyJSfZRZDtQSpt42KTW5RLBNC7rb9rwSo4+dJwPgFSHiJINS2urytl+LNoFVHxlKBmY
	co81T7Xoksk3cUZMsLKWgAUJoD1XD0PBFZM12OIGyKogEoJgfWpJjnbX4NpKL5QPNW2wCcvEq6uAl
	z94r0zng==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1748264868; h=from : subject
 : to : message-id : date;
 bh=SCQX/iHwVwMSyQkT6uzynKqPiPAsHTR2j6atuwHYfoU=;
 b=CCtVwGvARUA+I2vUe1sKaIkepjp0hsG+Hz8rGdXA7db6Hi/P8zBU3upW0UZkBPV0rNLYb
 UhCdmCv8MCivzZ54pgDu15jZXE2mbHGyJQM0qYq2pYpB+FyiW3XXhFFK6dq3C/qKFM4DkdA
 THCYhrdyR4AZMlj3om6e8a8TirmVzLS8kiewQx0HYRBGqWUSWkgBAfXmdRf/iuVmTrWOFRf
 +xLV9/cIk5EfMXb186pTMP95oa8jEAiuEc1h+4S8cYYWnPRmsWalBY/2hBf/YqkR4xuWAO0
 QUgSkHPho/6Vxut8oBix9FdrtLlux61QPdnRDcH7hrus1eRmlceQny7VJYlQ==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uJXXn-TRk1Hq-CS; Mon, 26 May 2025 13:07:07 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uJXXn-AIkwcC8xzUn-GnHM; Mon, 26 May 2025 13:07:07 +0000
Date: Mon, 26 May 2025 14:58:51 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Miaoqing Pan <quic_miaoqing@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, Clayton Craft <clayton@craftyguy.net>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Nicolas Escande <nico.escande@gmail.com>,
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix ring-buffer corruption
Message-ID: <aDRli6uIbnuQK3nN@pilgrim>
References: <20250321095219.19369-1-johan+linaro@kernel.org>
 <aC8-mUinxA6y688X@pilgrim> <aDRR5oYBU0Z-DaWr@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDRR5oYBU0Z-DaWr@hovoldconsulting.com>
X-Smtpcorp-Track: etJ8ewEP5cF0.nODmAECzhLvm.QXwcqwSfK8h
Feedback-ID: 510616m:510616apGKSTK:510616sQ6vhuulVJ
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_060750_887501_128658C3 
X-CRM114-Status: GOOD (  42.31  )
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

On Mon, May 26, 2025 at 01:35:02PM +0200, Johan Hovold wrote:
> On Thu, May 22, 2025 at 05:11:21PM +0200, Remi Pommarel wrote:
> > On Fri, Mar 21, 2025 at 10:52:19AM +0100, Johan Hovold wrote:
> > > Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> > > breaks and the log fills up with errors like:
> > > 
> > >     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
> > >     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> > > 
> > > which based on a quick look at the ath11k driver seemed to indicate some
> > > kind of ring-buffer corruption.
> > > 
> > > Miaoqing Pan tracked it down to the host seeing the updated destination
> > > ring head pointer before the updated descriptor, and the error handling
> > > for that in turn leaves the ring buffer in an inconsistent state.
> > > 
> > > While this has not yet been observed with ath12k, the ring-buffer
> > > implementation is very similar to the ath11k one and it suffers from the
> > > same bugs.
> 
> > > Note that the READ_ONCE() are only needed to avoid compiler mischief in
> > > case the ring-buffer helpers are ever inlined.
> 
> > > @@ -343,11 +343,10 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
> > >  		goto err;
> > >  	}
> > >  
> > > +	/* Make sure descriptor is read after the head pointer. */
> > > +	dma_rmb();
> > > +
> > 
> > That does not seem to be the only place descriptor is read just after
> > the head pointer, ath12k_dp_rx_process{,err,reo_status,wbm_err} seem to
> > also suffer the same sickness.
> 
> Indeed, I only started with the corruption issues that users were
> reporting (with ath11k) and was gonna follow up with further fixes once
> the initial ones were merged (and when I could find more time).
> 
> > Why not move the dma_rmb() in ath12k_hal_srng_access_begin() as below,
> > that would look to me as a good place to do it.
> > 
> > @@ -2133,6 +2133,9 @@ void ath12k_hal_srng_access_begin(struct
> > ath12k_base *ab, struct hal_srng *srng)
> >                         *(volatile u32 *)srng->u.src_ring.tp_addr;
> >         else
> >                 srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
> > +
> > +       /* Make sure descriptors are read after the head pointer. */
> > +       dma_rmb();
> >  }
> > 
> > This should ensure the issue does not happen anywhere not just for
> > ath12k_ce_recv_process_cb().
> 
> We only need the read barrier for dest rings so the barrier would go in
> the else branch, but I prefer keeping it in the caller so that it is
> more obvious when it is needed and so that we can skip the barrier when
> the ring is empty (e.g. as done above).

Thanks for taking time to clarify this.

Yes I messed up doing the patch by hand sorry, internally I test with
the dma_rmb() in the else part. I tend to prefer having it in
ath12k_hal_srng_access_begin() as caller does not have to take care of
the barrier itself. Which for me seems a little bit risky if further
refactoring (or adding other ring processing) is done in the future;
the barrier could easily be forgotten don't you think ?

> 
> I've gone through and reviewed the remaining call sites now and will
> send a follow-on fix for them.
> 
> > Note that ath12k_hal_srng_dst_get_next_entry() does not need a barrier
> > as it uses cached_hp from ath12k_hal_srng_access_begin().
> 
> Yeah, it's only needed before accessing the descriptor fields.
> 
> > > @@ -1962,7 +1962,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
> > >  {
> > >  	u32 len;
> > >  
> > > -	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> > > +	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> > >  	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> > >  
> > >  	return len;
> > > @@ -2132,7 +2132,7 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
> > >  		srng->u.src_ring.cached_tp =
> > >  			*(volatile u32 *)srng->u.src_ring.tp_addr;
> > >  	else
> > > -		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
> > > +		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> > 
> > dma_rmb() acting also as a compiler barrier why the need for both
> > READ_ONCE() ?
> 
> Yeah, I was being overly cautious here and it should be fine with plain
> accesses when reading the descriptor after the barrier, but the memory
> model seems to require READ_ONCE() when fetching the head pointer.
> Currently, hp_addr is marked as volatile so READ_ONCE() could be
> dropped for that reason, but I'd rather keep it here explicitly (e.g. in
> case someone decides to drop the volatile).

Yes actually after more thinking, the READ_ONCE for fetching hp does make
sense and is also in the patch I am currently testing.

Also for source rings don't we need a dma_wmb()/WRITE_ONCE before
modifying the tail pointer (see ath12k_hal_srng_access_end()) for quite
the same reason (updates of the descriptor have to be visible before
write to tail pointer) ?

Thanks

-- 
Remi

