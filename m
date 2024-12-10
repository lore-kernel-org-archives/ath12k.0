Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98925E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cssIiNNjja/wzS9OSn3GEYkEcp6124dnGQDj9fj5NiU=; b=G+S06DznYwziTzE5QI5E+cu4k8
	TAwMc4u/sXVhk6ELGN2cb5CwCl9q6qgdO8pUk1DhAfQKC7udfmhHfiow252Hx4OHm44W6XJ/P/8Nt
	0dsBFitF6F/Fna2oCkG+Ibey1IBxIB9kt5nGG2LYnlDTAtpbMt40hoKtU6VeP07aeHfYWfFW1VsMa
	RpoOygvyIjZpnbh+qlwZhfhdfzAVwz4e+t8V2Vu4D16+0ArA/boWOO3mOsTU63d3Umn7x4B9Lk0ii
	tm9erILsztKu1HZMzR7ectFnaAnsP7OR1HhiijeQoC5hr41YP6vXpGjGEk1yBcd/LeMBcfwDf0Q+u
	eCMrP/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Pz-0000000BoBQ-1cFH
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 14:40:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL18Z-0000000BjxM-3kJp
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 14:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B1E6A418A2;
	Tue, 10 Dec 2024 14:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0E4C4CEDF;
	Tue, 10 Dec 2024 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733840574;
	bh=1RWgk9G1eOyrU3g9qrBP8ENy7MD5pCUWNXT+XuJeSaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSTv52il8/JJIiI9CsqC/dkXpMrQFJJLkwLaPYh2BcmapausCQI30IRiM5aQ+rEMN
	 2IAnWlELS8hwNnyKt03CFvQ9aOPYPJR7O98kUINp7xN0CMQ9y9lj4BnGDO9fW4b3P1
	 j+YnEOaMezzhYplQaCX1lfy5/APowIfXKq4j1jNFQPYC/n3zOGzba5ozhqp0g4hK10
	 vuJGbQ+iHIKo/VE6bbsRUu5CKktEg+LHW/n/JO3s81rA5MnMo24jQ48ziJDY368ma4
	 NUhmSy4L9p1/xsHINy101/9y3ec1z1qT3thaZt+vJLQu3fApEjp+7684PnvYI0BkNw
	 odFDdj5hxj4BQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tL18b-0000000040v-0ZAW;
	Tue, 10 Dec 2024 15:22:57 +0100
Date: Tue, 10 Dec 2024 15:22:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Gregoire <gregoire.s93@live.fr>, Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: Re: WCN7850 disconnects and reconnects in a loop
Message-ID: <Z1hOweEsmXrIZByQ@hovoldconsulting.com>
References: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_062256_011020_077B89C6 
X-CRM114-Status: GOOD (  10.54  )
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

On Mon, Apr 01, 2024 at 11:56:39AM +0200, Gregoire wrote:

> I have a QCNCM865 card with a WCN7850 chipset. I'm running Arch Linux 
> version 6.9.0-rc2-1-mainline.
> 
> I'm experiencing difficulty connecting to any Wi-Fi network; the device 
> connects and reconnects almost immediately.
> 
> Here's a gist containing some logs from dmesg and journalctl related to iwd.
> 
> https://gist.github.com/GreyXor/5e6dc8e610a00c8aab37a1251d36dbc1

I'm seeing iwd repeatedly failing to connect with reason
PREV_AUTH_NOT_VALID with WCN7850 on the Lenovo ThinkPad T14s (and the
Snapdragon X1E CRD reference design).

I first noticed this with 6.10 when starting to work on the Qualcomm X
Elite platform, but never got around to investigating it. I've confirmed
that the issue is still there with 6.13-rc1 and that adding
ControlPortOverNL80211=false allows iwd to connect.

Looking at Gregoire's logs now, it looks like the deauthentication
reason is different:

	(Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)

instead of

	(Reason: 2=PREV_AUTH_NOT_VALID)

but the same control port workaround allows iwd to connect.

Johan

