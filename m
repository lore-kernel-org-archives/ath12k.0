Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C181ECA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 19:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fG/J3vd/B9A0cwpUSTgiyouooSSQ2j/8aAKitxE1DSk=; b=PizDmooGkwOxyWor6zlYW/mK3S
	pFvPcZugh4EBLCU4/UHxX1RcU22ZxAyYtlTl/Cwxh1EzRYuUhDhBvE2PxgTjHa3GXEbs31pm4FMJO
	KMTut3jxZmrQoyXrAgz1/6FmaorEGBeQzv4JDwUz1pJqDKy9oGeXIBlUzpGKkFEd0avngx1YJUbQq
	QAljtNYTpNo97I49kPZj/Dhzs/5q/G8YadlaGPUPGeuFFvUVGRvoE8o8PZizQ7aHlRl9R991Vdtbt
	5tRMm394a+Ewt2h0M44+670lmTY1YUo8ohm3gtujyJiHQf2tUNqKkqmUlTGWszLfSwdkee1GTD92O
	zFtiwBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdbB-00000004NnV-1acF;
	Tue, 29 Sep 2026 19:34:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdb9-00000004NnH-3evo;
	Tue, 29 Sep 2026 19:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E99742E3A;
	Tue, 29 Sep 2026 19:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDEB1F000FF;
	Tue, 29 Sep 2026 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710483;
	bh=fG/J3vd/B9A0cwpUSTgiyouooSSQ2j/8aAKitxE1DSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MSkAu2SgPxb5xXZWx9l7m0CIIvimRdJmk1aorgz+3V5URkU/bootHHdS4ashK/AMC
	 aES4Z14XCg90aWTZWxF4nTE/QDAzxpXgwKDDD6loS4E4o4JUy76AbiXJ4WxfeOBL7k
	 +XRocKkHgEH4wpQGohqSZQQx6pC0ElnIjdbSreC7hH8kTGIBC0pLicRRe1D0PIxwnp
	 nc1KSErgpgcEbf93xW8LWEz/UCDFtaBEtu8kJbjOqANmDJ/6/QYcfT0LnjcVY7tNSF
	 uZb57CLxJnGaYHrzBevh/YDXD8yBLwK5su/N0sTDw/shkZXR/bQV7DmQKnz4vMeUpC
	 pmwTK4TPPbUyw==
Date: Tue, 29 Sep 2026 21:34:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <m657dtesuagn7vdajsuzjb4mfysf5xabsu3s6n6lujj7yb3z4p@m2e7e3n4zyev>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
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

On Tue, Sep 29, 2026 at 08:16:50PM +0300, Juha-Matti Tilli wrote:
> On Tue, Sep 29, 2026, at 20:05, Marcel Holtmann wrote:
> > >> +#define QRTR_NODE_HOST_BASE 0x10000u
> > > 
> > > Can it be exposed with include/uapi/linux/qrtr.h also. There are user space clients like modem manager
> > > which need to calculate modified node id to distinguish same service from multi modem over mhi.
> > > This is same as wlan use case.
> > 
> > did anybody actually looked at the proposal that Denis and I came up with. It was exactly addressing this properly.
> > 
> > It seems you guys came up with some hot fix and want to run with it. After month and month of silence and not bothering to review the proposal, you are trying to push your thing?
> > 
> > If you don’t support userspace, your proposal is broken. Plain and simple.
> 
> I'm still willing to submit a new version of that patchset originally by
> Denis, if the kernel devs so decide that it's the way. For example, the
> "radix tree of radix trees" approach could be replaced with a hash
> table.
> 
> There was also some criticism about a layering violation in storing the
> endpoint id to mhi controller. However, maybe that could be reduced by
> providing a correct abstraction around it, so that other code doesn't
> touch the mhi controller structure directly.
> 
> Other criticism for that patchset by Denis was its overt complexity.
> Yes, it has more lines of code changed.
> 
> This dual-card setup needs to be handled somehow, either by Denis's
> patchset or by Manivannan's patchset.
> 

I wish to go ahead with my series as it is simple and tested across the
multi-WLAN setups. For concern around exposing the nid to userspace, I'll
implement it in next version, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

