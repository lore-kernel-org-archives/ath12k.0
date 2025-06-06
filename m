Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82862C5AD49
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbJQzrfAn4nFkras67QlyTVX8f3GCXuLgNmnawQjp74=; b=FtV7lj/K9P6J8KY3rKK962jOYi
	6dedU4ihagTMez6+pOJMm/My6D3OCuTBBqqWt5v4N1qk/prYzjVV8qmOpUMhnLTLg8si1TliuBTJD
	6uqC3gzIc9w7PQr5NbCIc4hpytXixo5hVvlusqiBtR4e2ev0YRkMYOEqG1kYJGcRdPB4hjBy1ZSA0
	IdGmhvflpH+QQI7L8UYqSuNr4vOIpxZi9XdL42v5K6oqnxD0h2P0LvYzXHoApmdWUH9il7xgjPMfr
	Elbf/jxIblcfZZFOIagZt1WgCTljHntirlvxeFPVk8LL/A2XNLeKw60xUcMDW5V8sRygSPmEjAIMB
	DuP2jtyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTcs-0000000HYqX-0lWU;
	Fri, 06 Jun 2025 09:44:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTVq-0000000HXzq-0Dw1
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 09:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1307A506CF;
	Fri,  6 Jun 2025 09:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49711C4CEEB;
	Fri,  6 Jun 2025 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749202640;
	bh=a9Zg/DhoRqaLyi2gmTsRz1QWED8HUHhMKVYw0b0MLaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rebNEyMvMYlywgjkjaA5J0/uuXWIXSLc6zgj/dGdlsiZosql0U8UEzlkhGdOrCVNX
	 QCXkyKhmNvG2S2OOL06l1ptZqqFIXan8fEZRpHD0UUDEIo8GaWElcz1dbOSkCQvV9b
	 Z0JnD890NNQllDqryXTiJTi+U2FJbDWB1aTIG/oNWpi2I7S5YkS/qxJDnlVS/CbUx8
	 bVrW39gEB8/2iP+ubx8Z87KowkPOKTbscLbefMienA/R00FgW4FJK57I8QNsXlfKDc
	 dIfs1B1R+N+4fSeymzZK+RCQQLjqZNhRA/LGfCoNIT9cUlIbSO1esjVy75z3tw5l5t
	 HreKk1oTkY6WQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uNTVj-0000000039m-1X7v;
	Fri, 06 Jun 2025 11:37:16 +0200
Date: Fri, 6 Jun 2025 11:37:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Remi Pommarel <repk@triplefau.lt>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] wifi: ath12k: fix dest ring-buffer corruption
 when ring is full
Message-ID: <aEK2y8mMSQtbsKq2@hovoldconsulting.com>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <20250604144509.28374-5-johan+linaro@kernel.org>
 <a8236639-2448-4552-ac21-db7e7370e23e@quicinc.com>
 <aEKylLhbfLusD3Kq@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEKylLhbfLusD3Kq@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_023722_160398_B8831B34 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, Jun 06, 2025 at 11:19:16AM +0200, Johan Hovold wrote:
> On Fri, Jun 06, 2025 at 03:27:04PM +0800, Miaoqing Pan wrote:
> > On 6/4/2025 10:45 PM, Johan Hovold wrote:
> > > Add the missing memory barriers to make sure that destination ring
> > > descriptors are read before updating the tail pointer (and passing
> > > ownership to the device) to avoid memory corruption on weakly ordered
> > > architectures like aarch64 when the ring is full.
> 
> > > @@ -2184,6 +2187,10 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
> > >   					   srng->u.src_ring.hp);
> > >   		} else {
> > >   			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> > > +			/* Make sure descriptor is read before updating the
> > > +			 * tail pointer.
> > > +			 */
> > > +			mb();
> > 
> > Is rmb() sufficient, since MMIO write already includes wmb()?
> 
> No, rmb() only orders reads against later reads.
> 
> [ The wmb() itself orders reads against later writes on aarch64, but
> that's not generally guaranteed and hence should not be relied on in
> driver code. ]

Sorry, I meant to say: an rmb() would order reads against later writes
on aarch64 (but that's not generally guaranteed and hence should not be
relied on in driver code).

Johan

