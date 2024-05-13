Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B551C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7hefxAk8SXTOllndNBwGlrwNJLYft8iZmgjH3bgHCw=; b=Hh771RlzlrPGWGNc9+z4PiBmAn
	XLZLYwO6nLIXN6sp8ooG75rQWizr5J8yPKoxkteEguusoQy5KEnsgrXWgCR+l8Pta5Mfm1oVkzodW
	L3cZYwcNAbMsaMml0qFMvOQ8xiegfMsKbhTII8WPddNJLh6a169gnw6TFRAF7YaiuNE0g0F6MpKa/
	QsOgn/Ilqv8Q0I8QB6G8frAUIG5minFbFZ6i0BBlShp6ziudQEwcco6cWVJ2K6xSANXPd2mG48Nzh
	NQbYsVYU966rOJhfLtY6uDemu0ee+/iOLiaq52b/+BmVHk9++jg+IITjnLyanDOEpAKY4qy1w4ETv
	FfJzNi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WWY-0000000DAPm-0gmS
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 14:19:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WWV-0000000DAPH-1Dff
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 14:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10D4460E07;
	Mon, 13 May 2024 14:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27401C4AF0C;
	Mon, 13 May 2024 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609965;
	bh=Pf4Q+gCnCQVUE/TMvKBTjzV2HO0RZrZsRGNbNFuqenk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Qp+CnAu9cV1NVsPOJZrdK2r5V2/KW5LKZZ4h3j1wNWkbL1zeOGfNtY99cAXgB9Qdm
	 gkkWDYxRtB+zzxwUIcB44CKCX0YCNg7+6xnva9IBstu2ONYpO1H1BbNrV83K1U4R5m
	 XzShutYjN6avTokYFSuCunZwAjr6qRqnO1Hjox71mfDTnxU80aGXV/LY6MkloISZ73
	 ArH3fXcGeeI1LJA1XXaa4Ef5dXXF4fEJ31lA6kV4qYpllbTM8hf2DkvhrtZzcC62mn
	 L00e2sqf/0r2olLmt15a4FXC/HcB0OKs9qmJr4NudhuTVAV3UOmffxaXAIzezJk0mz
	 aL56uKufFmopQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless-next v2] wifi: ath12k: allocate dummy net_device
 dynamically
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240508095410.1923198-1-leitao@debian.org>
References: <20240508095410.1923198-1-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: horms@kernel.org, Jeff Johnson <jjohnson@kernel.org>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
 ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER),
 linux-kernel@vger.kernel.org (open list)
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171560996218.1732161.18068750430706487082.kvalo@kernel.org>
Date: Mon, 13 May 2024 14:19:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_071927_532912_B746144F 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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

Breno Leitao <leitao@debian.org> wrote:

> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_device from struct ath12k_ext_irq_grp by converting it
> into a pointer. Then use the leverage alloc_netdev_dummy() to allocate
> the net_device object at ath12k_pci_ext_irq_config().
> 
> The free of the device occurs at ath12k_pci_free_ext_irq().
> 
> Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4f9206e8c2c1 wifi: ath12k: allocate dummy net_device dynamically

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240508095410.1923198-1-leitao@debian.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


