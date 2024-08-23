Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D514C52D7C
	for <ath12k@archiver.kernel.org>; Fri, 23 Aug 2024 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIGDnb5A+GtrVAQeuej4pnC1dpMb2EWNsJHPeGHtTlI=; b=mftPzDs9SOUZHDEVX3rUEN5H/E
	MRxRkjqhd6kiFl2VaYfyln9ENltm0QbQEeU6fnyLWq5xLN4ioOOsV1T6C0unJDcp1k2YQ3q97sYxh
	jiik0L21e1nM46vp0XQIPl3WLz/KmBKL2oozJ4dQlI+L9hzXuZPvtmprxdBAkCb5KREju/iiq22Yb
	5YDjQgrbPgDapckeWPzAbmzHL1WhBW3jRbNYTZNWmAQGjdRQ5uxEfYJBrmqUgVUtopFKMHgdkOat8
	g9NLRNaRFQzi+iwWyo4bDAssSHZwwneZUwo8tkdo+Hi5ez/wXr1lixzbzYF0jhXdiWjzI2nGg2ViP
	FzcsKXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWgx-0000000HQjf-3tfH
	for ath12k@archiver.kernel.org;
	Fri, 23 Aug 2024 15:59:11 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWgv-0000000HQiu-0hQk
	for ath12k@lists.infradead.org;
	Fri, 23 Aug 2024 15:59:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7142014d8dfso1812153b3a.3
        for <ath12k@lists.infradead.org>; Fri, 23 Aug 2024 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428747; x=1725033547; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UIGDnb5A+GtrVAQeuej4pnC1dpMb2EWNsJHPeGHtTlI=;
        b=jhI620b++ULTIk4UgGw7FdISO4lFv2lYWPqyZPooaupVFuPUXBQ23GwsjmzBUREl05
         FE8rJTIDmbVxhMYY4VRdaH21MpzTa4X4hJ//2JMSkqonoy5y9UaUECYhR7fmgMsrYgNi
         /qKQ8//KhLkntZWv0i7dH/mbpG1o2jRJDNZl0MFf89RmyWPZSY6Ae/fy09V5a9dr9o38
         rVSxP7NTMEUwJELPJWBSNiHjtM6xc/5zkozAlzMAYkekbH2vDG8HQ0K8II0NclM7MSKW
         WH/700KuaWV70w94vRi6juId/e9pEUB/hv02RYcD37+wWNHouGzQaNzYeAt6HuJ6ud02
         1VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428747; x=1725033547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIGDnb5A+GtrVAQeuej4pnC1dpMb2EWNsJHPeGHtTlI=;
        b=SGXmOxjmWgrEfEGE7MliKbn4ZPSnIpTcAW3l9qElDdPADNoawuVA6wGLBGE5+tTkRQ
         cxAlWjbc+sQuEZ3f0nvyEg0aDX17xuKpn7+5ipWX2wbrh99+NxyWck8e/pAq1tUO40sw
         ZALBlq9LDMeZn+F4J/RtLku6PGh8B+hT85JQobEIhLEpNLmEvZ4uPhHYeTYAMG8I968R
         L8jrhgWMORs7g59130x5MN0xrkjaTWSRg9eP1CueJdYB8ivrw64GXdOcA2GKNXTCsqCI
         yblL/4KDweknaZg5ltNLh3t5EcPHUO/zGoCDYPdGm4NDqdDn7CLSgZ757SpGsGXlQG4k
         ji5w==
X-Forwarded-Encrypted: i=1; AJvYcCWbUp+GfcQN24VVM9qJy27EN6ll9CEV2L7Izz032EXudKWTcLiuOciFRd5pMf+EZ5kK7pTsXnM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmzgUGjuudk+xb3UHlf5uUj7Tq/90mrTt1PfZs8pFZQxvoUoba
	8YUMsN2nIYoVoNM1Ps0cXwQHRKP3biIkpkUpQXtxv24ukidDjHVF9HLQNWnhMw==
X-Google-Smtp-Source: AGHT+IH+oOTSFwrhIWkuhR20LUl8VdF/2I2KKHEVR/Ox6j4FQ8Mp23CMn5lXfDqRfKQW0VyKmRnOvQ==
X-Received: by 2002:a05:6a21:4603:b0:1c4:a1f4:3490 with SMTP id adf61e73a8af0-1cc8b5d8f90mr2850586637.39.1724428747347;
        Fri, 23 Aug 2024 08:59:07 -0700 (PDT)
Received: from thinkpad ([120.60.50.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e2194sm3188056b3a.126.2024.08.23.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:59:07 -0700 (PDT)
Date: Fri, 23 Aug 2024 21:29:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kvalo@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] wifi: ath12k: Set IRQ affinity hint after requesting
 all shared IRQs
Message-ID: <20240823155903.eqswl5ds4h2eynhp@thinkpad>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
 <20240823155502.57333-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823155502.57333-3-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085909_241145_3992E09F 
X-CRM114-Status: GOOD (  24.49  )
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

On Fri, Aug 23, 2024 at 09:25:01PM +0530, Manivannan Sadhasivam wrote:
> If a shared IRQ is used by the driver due to platform limitation, then the
> IRQ affinity hint is set right after the allocation of IRQ vectors in
> ath11k_pci_alloc_msi(). This does no harm unless one of the functions
> requesting the IRQ fails and attempt to free the IRQ.
> 
> This may end up with a warning from the IRQ core that is expecting the
> affinity hint to be cleared before freeing the IRQ:
> 
> kernel/irq/manage.c:
> 
> 	/* make sure affinity_hint is cleaned up */
> 	if (WARN_ON_ONCE(desc->affinity_hint))
> 		desc->affinity_hint = NULL;
> 
> So to fix this, let's set the IRQ affinity hint after requesting all the
> shared IRQ. This will make sure that the affinity hint gets cleared in the
> error path before freeing the IRQ.
> 

Apparently, I missed adding the fixes tag:

Fixes: a3012f206d07 ("wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector")

- Mani

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 9e0b9e329bda..f265c1b8ce4e 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1446,16 +1446,10 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto err_pci_msi_free;
>  
> -	ret = ath12k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
> -	if (ret) {
> -		ath12k_err(ab, "failed to set irq affinity %d\n", ret);
> -		goto err_pci_msi_free;
> -	}
> -
>  	ret = ath12k_mhi_register(ab_pci);
>  	if (ret) {
>  		ath12k_err(ab, "failed to register mhi: %d\n", ret);
> -		goto err_irq_affinity_cleanup;
> +		goto err_pci_msi_free;
>  	}
>  
>  	ret = ath12k_hal_srng_init(ab);
> @@ -1476,6 +1470,12 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
>  		goto err_ce_free;
>  	}
>  
> +	ret = ath12k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
> +	if (ret) {
> +		ath12k_err(ab, "failed to set irq affinity %d\n", ret);
> +		goto err_free_irq;
> +	}
> +
>  	/* kernel may allocate a dummy vector before request_irq and
>  	 * then allocate a real vector when request_irq is called.
>  	 * So get msi_data here again to avoid spurious interrupt
> @@ -1484,16 +1484,19 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
>  	ret = ath12k_pci_config_msi_data(ab_pci);
>  	if (ret) {
>  		ath12k_err(ab, "failed to config msi_data: %d\n", ret);
> -		goto err_free_irq;
> +		goto err_irq_affinity_cleanup;
>  	}
>  
>  	ret = ath12k_core_init(ab);
>  	if (ret) {
>  		ath12k_err(ab, "failed to init core: %d\n", ret);
> -		goto err_free_irq;
> +		goto err_irq_affinity_cleanup;
>  	}
>  	return 0;
>  
> +err_irq_affinity_cleanup:
> +	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
> +
>  err_free_irq:
>  	ath12k_pci_free_irq(ab);
>  
> @@ -1509,9 +1512,6 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
>  err_pci_msi_free:
>  	ath12k_pci_msi_free(ab_pci);
>  
> -err_irq_affinity_cleanup:
> -	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
> -
>  err_pci_free_region:
>  	ath12k_pci_free_region(ab_pci);
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

