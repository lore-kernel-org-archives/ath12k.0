Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A48C36008
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fT0PBJM4V672k31BtUIDPwfGo/YSQKm1TpHWc0Gn984=; b=Vpn4D+zyrTQcv4Bin/0S3j6C2r
	tK8bmmiMDj/PDZKA8tspo3NgUREglVgqzf9DIN2PHLVPpJHZRsnmKQkJLNE2mbF/l1r13O1fsqxL9
	VicL5A1v5rlOrN7hFaC81q940i5Ik3+7OlzA9EORUMJNZJ+Q/07bLKdHn3V83fYgU02ccvCmNP4B4
	V+yDluanRdQIPZiVN7+CEM3HBbUZ9+O5TEmO7LjX9km3Dori2HB7FW54lkYFNt3LCEpUoGW0Hmxxg
	pnl7PE6xOJXp4yRkSKtyJblikeYVqKPhKZ+Ks1SQDri9v9Za9gX5VpnUP1JnuQd9tMyVZvt1G/AbV
	Sp/72g9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSbh-00000008qRL-3DB9
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 15:23:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSU7-00000008pAv-0Erm
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 15:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E74075C0210;
	Wed, 26 Mar 2025 15:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F50C4CEE2;
	Wed, 26 Mar 2025 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743002161;
	bh=pRe/Us8yRQHDlKQLHSWJ7A5NovV1DYDJYNZQ7w5XL9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcPsi9EoySYtvkMWBZ/qmmyF65AfxE4JSnKRcZW1k92O3wWKAWwLjQVs/hudWmVou
	 P8g6FZRaaT9Y81y9LPQnEjTtJlnO4is8A/B+eFohIw/1+jshfMrX5RRIYDhEg0Ix4n
	 vPHedi3FUWM1L32RCVgXRYjoT39X08ALaQHahLDXaqSbcsxeS8bPEA/DF6NprCAxmq
	 Qfz+a2RAJGRKA8AQ26x4cIgo10iUZHSBo/vpytMh7Mj6jgp9LJJ8wiwaE2Fi7INwBh
	 /yuw4CKRvsg7pIBJrbbWW7n4Gj5+CyFrUI4TOxWCYbcurZESAcgBjyUwkOBG2nqB6k
	 7Il54AKH9liBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1txSU7-000000007cw-16XN;
	Wed, 26 Mar 2025 16:16:03 +0100
Date: Wed, 26 Mar 2025 16:16:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Message-ID: <Z-QaMwB215vTKSTq@hovoldconsulting.com>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <8edf77d9-1afd-402a-b966-d1b3e5b4ba1b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8edf77d9-1afd-402a-b966-d1b3e5b4ba1b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_081603_160447_28E6CF6F 
X-CRM114-Status: GOOD (  15.46  )
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

On Wed, Mar 26, 2025 at 08:11:11AM -0700, Jeff Johnson wrote:
> On 3/21/2025 9:23 AM, Johan Hovold wrote:
> > Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> > without an iommu (under OS control) similar to what was done for ath11k
> > in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> > DMA").
> > 
> > This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> > Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> > 
> > Note that the mask could possibly be extended further but unresolved DMA
> > issues with 64 GiB X Elite machines currently prevents that from being
> > tested.
> > 
> > Also note that the driver is limited to 32 bits for coherent
> > allocations and that there is no need to check for errors when setting
> > masks larger than 32 bits.
> > 
> > Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> 
> Please make sure to include linux-wireless for all ath.git patches so that
> they are processed by patchwork.kernel.org

Ok, I'll try to remember that, but it seems you need to update
MAINTAINERS to include that list:

	$ scripts/get_maintainer.pl 0001-wifi-ath12k-extend-dma-mask-to-36-bits.patch 
	Jeff Johnson <jjohnson@kernel.org> (supporter:QUALCOMM ATH12K WIRELESS DRIVER)
	ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER)
	linux-kernel@vger.kernel.org (open list)

Do you want me to resend?

Johan

