Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264BBC9830E
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBGeYaT7U7Oeqkdin5+zXLHvnMbkDCbYA00G5ZSA5N4=; b=yI7eEPPlDtmifag+H4Vn469zeW
	Eb40FV08InO8SK1LSSSXNfDzRrvfMHYfTsoM6QXy6rlqOMBOl5S6iUXdjSgV4iiOgziqQHpFYFyky
	h5UARyDrSB23Z/BcmxJFmQ6fmhMDCq8/52fE4TqKJ0TIZAZJQwwBph8iiLFeVra5/hMWvqkDGMSou
	t9rjLZD01cr23jLWnzM9o4qETMHHh1PGst88G8xS1W3u8mVVCUQvFq8yzk6yv6jMu0E8XB/p3otEb
	6HUf+zJCioiMpAT4x8y1oaB5g4/7ThhJS8JSuuO7XsX8r/zIPzJ7yxWBO9byskEX4g0s5ahURtR5B
	CEXaUBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kQs-0000000BGEU-36v0;
	Thu, 24 Sep 2026 14:28:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kQr-0000000BGED-1XE4;
	Thu, 24 Sep 2026 14:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2F604392E;
	Thu, 24 Sep 2026 14:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B2A1F000FF;
	Thu, 24 Sep 2026 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790260096;
	bh=oBGeYaT7U7Oeqkdin5+zXLHvnMbkDCbYA00G5ZSA5N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ldrv+j6p5LSbs0gKXl3lUpryj2GVrvXfQO7w+yzvHX/puIJe0SyT2ixY6Ap283/Bl
	 THdzBIvSOpZCHKDOA8Fwv7K4xEopkOXLy0g2nAC9C73cfnX7EGgIAW+dEHxWG6Egvm
	 s7HqMhQWyHuDI+J6rxjPNtVx81CBA9lHlkRBmnIQsmC3IUb3XLxD/9Zl/YwSd4DAzc
	 0/iLXDyhvwte6ZknHWkveUdAN7+kc1MhgyKsoAuh+u2QkZC/hGeOb1vY11up9VBiHl
	 x0GuQY5UbLGW0KvGyHnCNZghAEI4VZ7fhAs3Ph5xyPrer9Z+nTvmYwshBUCybdMpWy
	 X1zzWPWNykrSw==
Date: Thu, 24 Sep 2026 16:27:57 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <qu6bdcvaueap22snis66orodtwx4cwhkxfzk7kpr7laqbr2hxg@2iilvscjqtcx>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
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

On Tue, Sep 22, 2026 at 06:14:21PM +0100, Youssef Samir wrote:
> 
> 
> On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > +
> > +/* The offset is chosen carefully to not collide with the node ids allocated by
> > + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> This assumption does not hold up for QRTR V1 headers where the node ids are 32bit.
> QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely larger than
> 0xFFFF.> + */

This is true. I only considered the v2 devices. Will fix this comment and the
code.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

