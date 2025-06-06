Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8F2C5B549
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4b9xbUeGiKHBRs41kVyMGjfZ/GnoNjFw2eqEgH9r2A=; b=oFVefdOa7nBWiMKc5hxZpP4Rnw
	7G9MECA0AKugf8+1VyfLn5Y4QCVTb3/xP9gjJfWU0kcFjB+DmRXztjCkhd7U8X+UlwOBDmMKP3gdk
	zLIE5eqLyNC/M8k7tZTp0zJyz8yyyM3DNz/ZcPoba9JU4B/38mCJFZipXS/c7PYDLVI0CWnfMvNjo
	glAFKI2lmXwrmQM/JWt73NFmSJWMXF4SDHIFYithwJQkVAACcsyZwBBTbLgFVxgFq3KefIBq2rqoW
	1TD0lUErEuvKN2uz6+/LLkt9sGOeaXK0GmcikL6nq14isiKGF11wDqtmDi8hF18RKoytocc7oFrHF
	W7aX8FJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTK4-0000000HWbv-1fPi;
	Fri, 06 Jun 2025 09:25:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTEQ-0000000HVi6-2ohh
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 09:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C17CF61139;
	Fri,  6 Jun 2025 09:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F5FC4CEEB;
	Fri,  6 Jun 2025 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749201561;
	bh=frCW/vBzCrEGCM+6G/qXfkE8FGMEPfIpWzwPqLwytyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNMRrAiK7jsc5fKcq1zGRPDz0tUULP8frmSPSUyrliQr9nTOq9lm/pvPb76qqYiaf
	 5Q2Z88dU8DOOcCdIOeH+4u/AiM895Vcj9u9rlLRTYZtRYIWiFT6+vU4sawpMVSGcyP
	 K+p6ztCNAyQQ+HDKGOq1hSSSc8kXTfW36Zn0QcQxEiinFKsjXMIYf9ebYVt8+2uA2W
	 Ujwh1kzvKNTiHyhsELFWsUFDeqYesP02NwLadObbhMyY/mlQFtDwsZUOJjoam/2mDp
	 1rABr00hoTzQMGi276EpHhGktvXp3tLFFEKBH41LQJ37ditQY1CfG6eV2FT55L+UT+
	 DLtUVRiTiQHPA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uNTEK-000000007mi-1Oin;
	Fri, 06 Jun 2025 11:19:17 +0200
Date: Fri, 6 Jun 2025 11:19:16 +0200
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
Message-ID: <aEKylLhbfLusD3Kq@hovoldconsulting.com>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <20250604144509.28374-5-johan+linaro@kernel.org>
 <a8236639-2448-4552-ac21-db7e7370e23e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8236639-2448-4552-ac21-db7e7370e23e@quicinc.com>
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

On Fri, Jun 06, 2025 at 03:27:04PM +0800, Miaoqing Pan wrote:
> On 6/4/2025 10:45 PM, Johan Hovold wrote:
> > Add the missing memory barriers to make sure that destination ring
> > descriptors are read before updating the tail pointer (and passing
> > ownership to the device) to avoid memory corruption on weakly ordered
> > architectures like aarch64 when the ring is full.

> > @@ -2184,6 +2187,10 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
> >   					   srng->u.src_ring.hp);
> >   		} else {
> >   			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> > +			/* Make sure descriptor is read before updating the
> > +			 * tail pointer.
> > +			 */
> > +			mb();
> 
> Is rmb() sufficient, since MMIO write already includes wmb()?

No, rmb() only orders reads against later reads.

[ The wmb() itself orders reads against later writes on aarch64, but
that's not generally guaranteed and hence should not be relied on in
driver code. ]

> >   			ath12k_hif_write32(ab,
> >   					   (unsigned long)srng->u.dst_ring.tp_addr -
> >   					   (unsigned long)ab->mem,

Johan

