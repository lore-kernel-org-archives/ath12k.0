Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820E4C4345F
	for <ath12k@archiver.kernel.org>; Sat,  4 May 2024 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0jJPM9XiOynrJ8uRq19Eo5f0LJBVllDscxS0iQPkLI=; b=hCrRW2DZ2v2OezqQw6yp/SWn+l
	8rb5wVJMz2crKla+PhCruE8t9PJszsx+6DCc3iJ3EMYHYQKstVFM3H318Ufx9SmqN5Q4ohWhOXRY3
	75OUjmwmpejk7E1+qy6vTY1/yh2mhFNhBrJHAwLQS9Ywh0sKPoSNt37EZSL2v0tNuBJAabieGJwgN
	491C/QNr3vgVU0npu+8alU2+vl55seGad1lo7RQJ9YBfEGQ+rXeX7FlPr+RIyP6tBm3Pks6Bo+6F3
	fL09iYz+QCFzeWcru62EWWFvVY7r9vdrdcrf193tWh/6n6fopyj3ZFLmyUmf5YaJsGsdbMjkceH3Q
	2ryBGOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3GnY-00000002I2d-0AX5
	for ath12k@archiver.kernel.org;
	Sat, 04 May 2024 14:55:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3GnU-00000002I21-42dL
	for ath12k@lists.infradead.org;
	Sat, 04 May 2024 14:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73264CE1724;
	Sat,  4 May 2024 14:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22B1C072AA;
	Sat,  4 May 2024 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714834527;
	bh=QUcRQ6mxQ61MfWGrSxLhyngIDwmEnF8y4sF93JkujGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRba7BbG3moknVhtkmaeLijB90ehLrcZG82jPnBVZxBXaaJuX4SwbHf+oZVD03weN
	 yCtLVTdcgMmOUNVBUeuI+QzU/umYHJijEK5eOU3AMVYCPUBucWSgQwLsJ7lvNzbasz
	 1i48TW33XAPMlcvLBtK+p9r5tuL/AiKzmOHqvU0Y6CCevkaaL6RaxkLj9gBJBUXmQr
	 6TAatLMCJVn4OfTivmMEfKff1ChEuePmQgTlvLnPnoskSqzpBz+5AkE7iVU9nsPaXv
	 QoA9+TOpIP5t5kfuOcGdyIe8Kxl9opH1CW4ZPonqELk6JwqDnlJiqzLBQ3XyIAsbG8
	 sZZKN0dZjlWfg==
Date: Sat, 4 May 2024 15:55:23 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: ath12k: allocate dummy net_device
 dynamically
Message-ID: <20240504145523.GC2279@kernel.org>
References: <20240503100440.6066-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503100440.6066-1-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_075533_216695_9AC8B427 
X-CRM114-Status: GOOD (  16.04  )
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

On Fri, May 03, 2024 at 03:04:39AM -0700, Breno Leitao wrote:
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
> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> 
> This is *very* similar to the same changes in ath11k commit
> bca592ead82528b ("wifi: ath11k: allocate dummy net_device dynamically")
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

...

> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c

...

> @@ -577,8 +578,11 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
>  
>  		irq_grp->ab = ab;
>  		irq_grp->grp_id = i;
> -		init_dummy_netdev(&irq_grp->napi_ndev);
> -		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
> +		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> +		if (!irq_grp->napi_ndev)
> +			return -ENOMEM;

Hi Breno,

Will returning on error here leak resources allocated by
alloc_netdev_dummy() in previous iterations of this loop?

If so, I suggest jumping to unwind handling which
can be shared with the error path in the hunk below.

> +
> +		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>  			       ath12k_pci_ext_grp_napi_poll);
>  
>  		if (ab->hw_params->ring_mask->tx[i] ||
> @@ -611,6 +615,10 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
>  			if (ret) {
>  				ath12k_err(ab, "failed request irq %d: %d\n",
>  					   vector, ret);
> +				for (n = 0; n <= i; n++) {
> +					irq_grp = &ab->ext_irq_grp[n];
> +					free_netdev(irq_grp->napi_ndev);
> +				}
>  				return ret;
>  			}
>  		}

-- 
pw-client: under-review

