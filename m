Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E9C3ABB2
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWgSl42p1+eshqQr8ge0SX6xNezPkF+8jrvTXn4Fs6E=; b=pCUODn9RRgm9B4/dh6mSL188eA
	Kd+fUgIwVkl4NLvFMon+OxTkXF/41U/EoSTcpVJTfvdg4OAt8fgk+PNiCVk1+yqb5BaJtQGjYBMKP
	J25J/iBevUSZjUTfZ8p9aoGINkCdbRkyEqS5BaS+5z5M1ekMgLXLkTPgzBnxkQAAaUNZXEaF5Lkxs
	X1jJy++GGGNvHB4wTGlIgGUdpAzdhkrJ3ehcnf2Iq1p0vlNlyvejQZtdK7XlrZSjSQ3bjLLQfzCNP
	4lsQ9GFFZJMde1fzvBYN0uujtZck/4Udfn95CkMUx5QwphxE48UpDUdAnX/9cAoBF+BzT9YaLNKQ4
	zwILl4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIcU-0000000DXlW-1YUq;
	Wed, 28 May 2025 15:23:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIaB-0000000DXNv-3Onw
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 15:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94370A4CBBF;
	Wed, 28 May 2025 15:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A02C4CEEE;
	Wed, 28 May 2025 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748445642;
	bh=IKr9+MA+9okWN9C27pDp8r5LvWkD4PL2yqXr+lVANRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVZ1X7nezOONOzxwXJ4Jdfc2Yk0JQun9rCt2edmcL3rVjPxz0hnrI9pG+xnIcvYO8
	 ss8dHII66vsCm/5VO8XIs726R2SJaoL5Ooz8dju4OPMiJLSMAK8628jH5x60B1EMyb
	 30uVeteOTPKJYkS8s35y2yXFr9fi/oHe8MvFm0R/LyZffSZzrXcDruJagkh1ipnkaZ
	 C8KGf1wcG/dgeUPUDV4dunSNmj8Ks+Bdpp2YbPDnWX5BNeqdcOvcrBo6TltutzdSOS
	 azYusE9XfQo6S4DMfRXPwbGD6jvjgq2vODUC06z6noP3Recru20KnxlLYnYgCfljIk
	 Ux1UzdRi8o8Mg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uKIaD-000000002xI-1Lic;
	Wed, 28 May 2025 17:20:46 +0200
Date: Wed, 28 May 2025 17:20:45 +0200
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
Message-ID: <aDcpzTI-Bjry144Z@hovoldconsulting.com>
References: <20250321095219.19369-1-johan+linaro@kernel.org>
 <aC8-mUinxA6y688X@pilgrim>
 <aDRR5oYBU0Z-DaWr@hovoldconsulting.com>
 <aDRli6uIbnuQK3nN@pilgrim>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDRli6uIbnuQK3nN@pilgrim>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_082044_053159_3BAD7804 
X-CRM114-Status: GOOD (  28.18  )
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

On Mon, May 26, 2025 at 02:58:51PM +0200, Remi Pommarel wrote:
> On Mon, May 26, 2025 at 01:35:02PM +0200, Johan Hovold wrote:
> > On Thu, May 22, 2025 at 05:11:21PM +0200, Remi Pommarel wrote:

> > > Why not move the dma_rmb() in ath12k_hal_srng_access_begin() as below,
> > > that would look to me as a good place to do it.

> > We only need the read barrier for dest rings so the barrier would go in
> > the else branch, but I prefer keeping it in the caller so that it is
> > more obvious when it is needed and so that we can skip the barrier when
> > the ring is empty (e.g. as done above).
> 
> Thanks for taking time to clarify this.
> 
> Yes I messed up doing the patch by hand sorry, internally I test with
> the dma_rmb() in the else part. I tend to prefer having it in
> ath12k_hal_srng_access_begin() as caller does not have to take care of
> the barrier itself. Which for me seems a little bit risky if further
> refactoring (or adding other ring processing) is done in the future;
> the barrier could easily be forgotten don't you think ?

Yeah, that would be the argument for putting in the helper. Big hammer
vs adding it where needed after reviewing the code.

There actually is a new ring being added for 6.16-rc1 I noticed after I
posted the latest series. That would require a follow-up fix with the
barrier-in-caller approach.

> > > dma_rmb() acting also as a compiler barrier why the need for both
> > > READ_ONCE() ?
> > 
> > Yeah, I was being overly cautious here and it should be fine with plain
> > accesses when reading the descriptor after the barrier, but the memory
> > model seems to require READ_ONCE() when fetching the head pointer.
> > Currently, hp_addr is marked as volatile so READ_ONCE() could be
> > dropped for that reason, but I'd rather keep it here explicitly (e.g. in
> > case someone decides to drop the volatile).
> 
> Yes actually after more thinking, the READ_ONCE for fetching hp does make
> sense and is also in the patch I am currently testing.
> 
> Also for source rings don't we need a dma_wmb()/WRITE_ONCE before
> modifying the tail pointer (see ath12k_hal_srng_access_end()) for quite
> the same reason (updates of the descriptor have to be visible before
> write to tail pointer) ?

Yep, the source rings need explicit barriers for the LMAC case, but
there are further issues here too.

And that may also suggest adding the barriers in the start/end helpers
for consistency (i.e. use the big hammer).

I'll try to find some more time to fix the remaining bits next week.

Johan

