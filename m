Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED76C88E77
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 22:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHSVUGtkRDC6pZNJXi4o+weci1RVRC8ikw3ZJdZcWiQ=; b=Cibyo6fhuUbM/W1M100Mt/XsY8
	Pk/TgzTLa5d/BPfBrS5iNzIe428qezIIX9diipbPnf+dORn0scMFZ7ypOp2Aiu4mStaX3mpt1OvKj
	gp/tm+1+kQo3NhpEcPz1V+oEsAAZ4BJz6g9fMcyzdX5LPFcFPa0ntZfQAhdSJH6XPpg27SldgR9Sd
	/iY0Vp1BVyR8u6qi2jfBhWz1222yZgsnGbwU9nrnnSxFJ1vk4QLQ0WVtNFnSPhuq6Kim18y+DkKEG
	swlI5V0e19mfVhwdX0fjwoOZEZKHOL5Cz+i9RIGX+QTVGm67VmELdLdmCshy9m8eDrN3t4t1wzS1e
	FBzk51iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bvi-000000082Hv-2fI5;
	Tue, 15 Sep 2026 22:47:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bvh-000000082Hi-10Kd;
	Tue, 15 Sep 2026 22:47:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BD9D60008;
	Tue, 15 Sep 2026 22:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F761F000FF;
	Tue, 15 Sep 2026 22:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789512427;
	bh=YHSVUGtkRDC6pZNJXi4o+weci1RVRC8ikw3ZJdZcWiQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BKJJf0RhK//lvEjrun0GWME0ibF1neJ2mui5lieiwG1zkmw7WXO4sgBgQ5JisD5cI
	 OvXz1eOXkM9BnyDCayfBWpsuzg6pGfFed/dRuTb8secR2idwtTbvMpntx6P7P7rGeM
	 tCjXoKtciRbAcWQBgx4NFrELcIcOsx+esA02myEi2QbI1RAezWfTw4oB86ZtPyuU6O
	 jqNRK88DMCEp7EX2cN2k+r7qsRnL1L94MgxixuFp0eHVRt2XCvwKdOauZ4Tx3gzCMN
	 Hkk2jY7EH7ND6ztQZw+hgI7QZcWnzawzwthSr8YQjL1nWEeXjDL1+8advWU24pGOva
	 IKPlE/w4gkgCg==
Date: Tue, 15 Sep 2026 15:47:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de
 Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Simon
 Horman <horms@kernel.org>, Mihai Moldovan <ionic@ionic.de>, Denis Kenzior
 <denkenz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Andy Gross
 <agross@kernel.org>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v7 00/15] QRTR Multi-endpoint support
Message-ID: <20260915154705.67cfb94f@kernel.org>
In-Reply-To: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 15 Sep 2026 08:41:52 +0300 Juha-Matti Tilli wrote:
> Subject: [PATCH v7 00/15] QRTR Multi-endpoint support

qrtr usually goes via core networking tree.
Please make sure you base your patches on net-next/main

