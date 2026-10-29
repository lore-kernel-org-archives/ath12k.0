Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E291D606A324
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAweE/wN;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XTA7nR2h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bk+il3Feo1SWvFpZ0KT9JIrHLDIGMsjtf+8THiuKb8E=; b=TAweE/wNJrCgjEXgmtvmgudvaw
	jfmN+VthNrZy2TeOx/QvBmLeQtNrBcniBhHEFceTKEhOC41ruIi/dUke1QN+/O3Q2AYyx+n4ZEf9s
	1yvj9D14LYrhFM6mihqd8Q/+GFG4rmwBbr8aKom2z57mzCB32/PAbYxlUUMTIhslVlngpXMbUQ/Ui
	0aEYlIQwSfV4fdOqIJJHgSkls9x3RtHy8403JyyGX8CbAV0i6MDziVROY9+r3LtmeCk3qoGQMyi+l
	sdUaJzyjGH5Qj1yJIXqlkY81KHEn178pd+9cGSZk9xf53qjeZ71/FyyjWaaRGAc0kSptUP27KTikj
	uRXlz4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQYN-00000009Ray-04mw;
	Thu, 29 Oct 2026 13:52:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQYL-00000009Rad-1gXU
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 13:52:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14D9742AF8;
	Thu, 29 Oct 2026 13:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BFD1F01829;
	Thu, 29 Oct 2026 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793281944;
	bh=bk+il3Feo1SWvFpZ0KT9JIrHLDIGMsjtf+8THiuKb8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XTA7nR2hdQh8w8rEnNFwH8GARaUn/BIkTeQuYaTVHeSPh7LNzoW/xsAl3EJyAuwD1
	 PSQqvFhyKQhs3HT/7gYYgnMGw6TLfnQETZlMga3TUyQ3dV5uWTeZqpTCGAt4RetGzS
	 ooIJY+5ZhU82G00DmiKiUeWnSqaPvMmRLD8vpYqA=
Date: Thu, 29 Oct 2026 14:52:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Yingying Tang <yingying.tang@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <2026102907-ruse-tricycle-be1c@gregkh>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026102919-confound-remnant-f133@gregkh>
 <auNKJ88kK1_QTPTi@QCOM-aGQu4IUr3Y>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auNKJ88kK1_QTPTi@QCOM-aGQu4IUr3Y>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 09:29:11PM +0800, Shawn Guo wrote:
> On Thu, Oct 29, 2026 at 11:14:27AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Oct 29, 2026 at 05:55:41PM +0800, Shawn Guo wrote:
> > > From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
> > > 
> > > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> > 
> > Huh?
> 
> Hi Greg,
> 
> These two commits landed on upstream as a series [1], which doesn't
> apply to 7.3.y, due to missing prerequisite changes below.
> 
>   wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
>   wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
>   wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
>   wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
>   wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
>   wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
>   wifi: ath12k: move dp_profile_params to dp.h
> 
> So I adapted them into one backporting commit. I'm open to suggestions
> how this should be handled.

Backport them all please.

