Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BAAC88E5C
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 07:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtbMstdSsxsrcHglRSS47mfL0CBM0tMluc7NdE73fNc=; b=MBoLvvvhiQB2rdmMZ8wioPHx3J
	52ZCIlTNvXzkb9qBTiJXp0Tiz1s/Kr343AtJgbS3othP/8gaxb+rfhIA0NhXgyL+p6bWwRWMQjbw/
	mk99Ei17v2BHiAR/Fir4eC7+wsuNtWTG1AJHtz/4YFp1YipAasdsUxAGbOD8u4PSQ4lUjqVzvqyc0
	0f8L7P47wh/wLEoHtPDNeIqugnjO07XdLgn2bJ7cHXB3roxwEm50rwzX1Bp+K96ZpC12csmf8kXD9
	KQp6QoS+/J/hJK/xROKGOGQ3vHbVR4zubOMNTCAPoY1jHX8TCygeR9JzqtqERjjAKyHXktvBn7TdH
	AE4lqVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jeX-00000008Xua-1W8B;
	Wed, 16 Sep 2026 07:01:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jeW-00000008Xu9-1iI6;
	Wed, 16 Sep 2026 07:01:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D907A41B52;
	Wed, 16 Sep 2026 07:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32E71F000FF;
	Wed, 16 Sep 2026 07:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542115;
	bh=AtbMstdSsxsrcHglRSS47mfL0CBM0tMluc7NdE73fNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ETpOXFmlT7btJY32ZMUu7DeLGxPK5xXTD5xrjD1rZVtlKZg3CbM7mmlHSNcnE18Zi
	 sFBKwBstQiLxCJszrz03+2scS1iQkH9mOaoEI86AqddGQ0T/Ompn2S+aezzWd6rcvi
	 D16R6u/JeCB+NQBKou/G2qC/0T3zjGD4FY6as8IdXQeHtMazhMKMlkTzl1ifnZc7Ib
	 j+d+rp99wMYb+Eu0jeQ6PcKgWBLG/4hxnTjpFT2vNWbjOwO2DEaSSHaA43HCfpoYch
	 xI+ycYCOPz9joePsLbjn4O0FExSlfbxxerRlvTJlw0auZBtYJfWQpRMqWfM1Y8bh3W
	 a0CwFWYeANchQ==
Date: Wed, 16 Sep 2026 09:01:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: linux-arm-msm@vger.kernel.org, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Mihai Moldovan <ionic@ionic.de>, 
	Denis Kenzior <denkenz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v7 03/15] net: qrtr: fit node ID + port number
 combination into unsigned long
Message-ID: <bjfwy4usrfbrabmcp4xsr65nqwdpuryvmrb6tzp6k2ckmdx27h@kvf7idvsugsm>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
 <20260915054207.2513877-4-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915054207.2513877-4-juha-matti.tilli@iki.fi>
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

On Tue, Sep 15, 2026 at 08:41:55AM +0300, Juha-Matti Tilli wrote:
> From: Mihai Moldovan <ionic@ionic.de>
> 
> The flow control implementation uses a radix tree to store node ID and
> port number combinations and the key length is hardcoded to unsigned
> long.
> 
> The original implementation shifted the node ID up by 32 bits and added
> the port number to the lower 32 bits of the unsigned long value to
> create a key.
> 
> Unfortunately, since both node IDs and port numbers are defined as u32,
> this will overflow on platforms where sizeof(unsigned long) < 8 (which
> are most 32 bit platforms) and essentially just drop the node ID part.
> 
> To fix this, build the key in a generic way, using half of the unsigned
> long space for the node ID and the other half for the port number.
> 
> This will be transparent to platforms where sizeof(unsigned long) >= 8
> and fix overflow issues otherwise.
> 
> The caveat, of course, is that, for platforms where
> sizeof(unsigned long) < 8, the supported amount of node IDs and port
> numbers will be severely limited - to half of sizeof(unsigned long),
> which typically will be 16 bits. Needless to say, we have to check if
> both values fit into this limit.
> 
> This limitation is probably not going to be an issue in real-world
> scenarios, but if it turns out to be one after all, we could switch from
> a radix tree implementation to an XArray implementation.
> 

Documentation/core-api/xarray.rst says:

"If your index can be larger than ``ULONG_MAX`` then the XArray is not the data
type for you."

So the fix is to not make XArray work, but switch over to some other storage
mechanism instead of XArray, like hashtable.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

