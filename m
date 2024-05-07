Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF1BC10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k04Up16rP/5vnkGUyojQtkSmv1wgKlps2LzusSKSQYk=; b=Ny4MEXtF27LtufT5UH3xoXHHvw
	xDXnhvBHBsAu2Q2jLdTzpOtRYv8qbDq5m81nVkKJ6oGh2NIj6ihAigOCgwWYWTyhhL3kqM7G6J/kg
	ISr8zSo0PM2zjOJEYOolz16bvdrzShcBry0urNJr1gIVGyxyypfcZVsHVDTAJfrTqit0weUeHsLPr
	i2fxdnC2Hqdr8g3tKSNR0AxpS2LI/euUajRe+XX0cKr/VQoNzCcIqgYsZ746v5sCEflyLhnOCMODe
	wiJBZNsVacTl+ufkV0dkq23eyEMNF+AsB3HGAEqZpmBa4pvnIGWF5y6RGblsGrSUPZne83rDPDVMk
	bCsLdbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4JIg-0000000AmSv-2H2s
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 11:48:02 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4JId-0000000AmRU-1XbL
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 11:48:00 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59b58fe083so457423866b.0
        for <ath12k@lists.infradead.org>; Tue, 07 May 2024 04:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082475; x=1715687275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k04Up16rP/5vnkGUyojQtkSmv1wgKlps2LzusSKSQYk=;
        b=hGzaYZriLnbjNlCk21ZOpzi3yIGN1Ca3A54JmmGGzdEKBJ2OtJFJDJK64uxF95Kjss
         M9rOqi3mZyd8V3djjsdbx+xJAtnQc+WxLNuEHAKwElgTgWrMQhBFnDuFLy1TYiUGEQKm
         YGilYbtw7l8vSM1HjcC/pgES8Xtl8XX+5b9JtiHc1V0MvUOb0bw0StsuseWBQZmKeXXL
         26bVIhM68nSqYZkM4bZwCFdbDIjz6hRwfRZQIEpn3UUqWHThAFhvsZe6dgvqjFQfWRfL
         sedOg2VSqhzkFp6rmD2uJmhkuWiN20qCyrmbOeCHb8bvuCzss1bBMNC3pn6NBFf+RgjT
         d86Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXe0n9QFIiMr26bR2UsT+Amku8S6xGHqpdz4IMwq+htGDahzEx2IoJYGV/ajF6skaQ1L/IsLGONDA463haU1yexWL+yE+Ytm0WQg==
X-Gm-Message-State: AOJu0Yz8aiPpXRzv6mfB+w9uyMLWFEfaKpZlFSWlooniQBF91HUj5pRc
	U6gFEMQVXIB3TBooy/MV+eSrql+K2no96SxM3AWnfrD/LlGB3GDIebY6Fw==
X-Google-Smtp-Source: AGHT+IF+jRz13mw2CthmQbfiIayM4aAbgQsi5cdBiGDdmT/1uTLoBricrLnfUPg0MRZUBxs4F8x0Pw==
X-Received: by 2002:a17:906:c144:b0:a59:c62c:212d with SMTP id dp4-20020a170906c14400b00a59c62c212dmr4721731ejc.14.1715082475016;
        Tue, 07 May 2024 04:47:55 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-000.fbsv.net. [2a03:2880:30ff::face:b00c])
        by smtp.gmail.com with ESMTPSA id w24-20020a1709067c9800b00a59ad48a8b2sm3852649ejo.0.2024.05.07.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:47:54 -0700 (PDT)
Date: Tue, 7 May 2024 04:47:52 -0700
From: Breno Leitao <leitao@debian.org>
To: Simon Horman <horms@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: ath12k: allocate dummy net_device
 dynamically
Message-ID: <ZjoU6NuVga6PuAK2@gmail.com>
References: <20240503100440.6066-1-leitao@debian.org>
 <20240504145523.GC2279@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504145523.GC2279@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_044759_496924_B20940AF 
X-CRM114-Status: GOOD (  21.32  )
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

On Sat, May 04, 2024 at 03:55:23PM +0100, Simon Horman wrote:
> On Fri, May 03, 2024 at 03:04:39AM -0700, Breno Leitao wrote:
> > Embedding net_device into structures prohibits the usage of flexible
> > arrays in the net_device structure. For more details, see the discussion
> > at [1].
> > 
> > Un-embed the net_device from struct ath12k_ext_irq_grp by converting it
> > into a pointer. Then use the leverage alloc_netdev_dummy() to allocate
> > the net_device object at ath12k_pci_ext_irq_config().
> > 
> > The free of the device occurs at ath12k_pci_free_ext_irq().
> > 
> > [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> > 
> > This is *very* similar to the same changes in ath11k commit
> > bca592ead82528b ("wifi: ath11k: allocate dummy net_device dynamically")
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> ...
> 
> > diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> 
> ...
> 
> > @@ -577,8 +578,11 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
> >  
> >  		irq_grp->ab = ab;
> >  		irq_grp->grp_id = i;
> > -		init_dummy_netdev(&irq_grp->napi_ndev);
> > -		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
> > +		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> > +		if (!irq_grp->napi_ndev)
> > +			return -ENOMEM;
> 
> Hi Breno,
> 
> Will returning on error here leak resources allocated by
> alloc_netdev_dummy() in previous iterations of this loop?

very good catch. Thanks!

> If so, I suggest jumping to unwind handling which
> can be shared with the error path in the hunk below.

Agree. let me spend some time and propose a V2.

Thanks

