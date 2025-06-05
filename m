Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A9EC5B543
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCj6k18OjEPC2jCJiB4p54i+3P5dkLkeDShm3vw8lsE=; b=QVIinNl9g47QmoCPjlLWWOBI9Q
	AjsjWFaASTp0Xgaq2E2bZZH1xUzdNMq4BB3rlyQA711uOfBBIX1jk6MbWO3Bak3YBlWGR8TL2FSCn
	Oln46xpp9luN9rDJsVgx6/S+Xxxlr6nXnMGmup7gyttiv4XZ0pJpnC1V7tdI5v7YI0p8BYHi0q7wp
	Wpg2snLPDI2Nhmi2y3AkH1WkWxUzZ2dpeA9pIc3BMD7F/eh6Agi8KTu3JdyzQBgu0Eq7U4j1ZaTdR
	9Wrd2fhn3ebUqqmg42gp7H/Z6bGAKUCdEj9bsi1JZgvbjEI8qyfTLTMgro0bRBqHC/j3poz8j7F2r
	ZaCPn5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6D1-0000000F5bk-0TKc;
	Thu, 05 Jun 2025 08:44:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6Cw-0000000F5bN-3CR3
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 08:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E3365C4797;
	Thu,  5 Jun 2025 08:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6572C4CEE7;
	Thu,  5 Jun 2025 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749113057;
	bh=lBPuO1YMAGHxrbRVxdgi7NFW6/i2QW0+MHmlw7SzfA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnKPlq/wkIofiLCU7TdIMb9gY/E7MMpIhWZYHFdiVmGDYra2IfjsdTs1X5/iv8x7t
	 lhtv2vQbCI/XMpTJ1PJQhxys2qYC2GSNHaONU3t+Aj030R7aXzrU6x76oaGZL5cxy3
	 oXUXh/8DSp8mRHIGLAUyGwYWjCTrzQdIMC+avYhhh6I0x5uB5302f+6sAzPDPVLJHH
	 tEcMTg596emvT8GS3N9yYyDhd/DLZOgh2rXIdgAhwAqCvzCIcdLSlYYhYTvP58+6//
	 JevDj7vd0nYanHLlJupTt3uuCwSML09ZMrAS9UJPmVD0tbbrlJl0YORQEIqJYrL52j
	 tBh7BNz0SJpHg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uN6Cs-000000007lv-3jMS;
	Thu, 05 Jun 2025 10:44:14 +0200
Date: Thu, 5 Jun 2025 10:44:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] wifi: ath12k: fix dest ring-buffer corruption
Message-ID: <aEFY3iz2gXtF_Dgx@hovoldconsulting.com>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <257bf9e9-f4b2-4ab9-804f-b895243c924d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <257bf9e9-f4b2-4ab9-804f-b895243c924d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_014418_844790_8F569D78 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, Jun 05, 2025 at 04:37:13PM +0800, Baochen Qiang wrote:
> On 6/4/2025 10:45 PM, Johan Hovold wrote:
> > As a follow up to commit:
> > 
> > 	b67d2cf14ea ("wifi: ath12k: fix ring-buffer corruption")
> > 
> > add the remaining missing memory barriers to make sure that destination
> > ring descriptors are read after the head pointers to avoid using stale
> > data on weakly ordered architectures like aarch64.
> > 
> > Also switch back to plain accesses for the descriptor fields which is
> > sufficient after the memory barrier.
> > 
> > New in v2 are two patches that add the missing barriers also for source
> > rings and when updating the tail pointer for destination rings.
> > 
> > To avoid leaking ring details from the "hal" (lmac or non-lmac), the
> > barriers are added to the ath12k_hal_srng_access_end() helper. For
> 
> Could you elaborate? what do you mean by "leaking ring details from the 'hal'"?

The type of barrier needed depends on the type of the ring. If we add
the barrier directly in the caller, the caller would need to know what
kind of ring (lmac or non-lmac) it is operating on, something which is
currently abstracted away in the hal helpers.

> > symmetry I therefore moved also the dest ring barriers into
> > ath12k_hal_srng_access_begin() and made the barrier conditional.

Johan

