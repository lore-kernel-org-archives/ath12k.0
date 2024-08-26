Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B40DC5321E
	for <ath12k@archiver.kernel.org>; Mon, 26 Aug 2024 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VG/saQQ5iHGoFIIQv7ApO+CzdPsxdfU6dBnZhjjs/f4=; b=EsG7xrna7x5jaeaP28+wvWUEfF
	9fCgvOc137oAZvdZcT+5DAoAbgYCJt1u1JzNA/bCA9fra6lE/7XPbnE2qh2Ibt06i1oQm1hg4EQYA
	TxgFlvG4Dz7iX12A/0HeDktK+YLxQtuBZnN1gD0kfU3Zf9QwwKpMIkdj95RFDy43kohPgs8FMlnk6
	likYIOmwXvLjvKghJBnzbXFFz7nLxQZ/aezt/Lm0i9+BEdPgKzdxzLU1wjqVuBdMKddEd67b5dLq5
	UIhofelwAK5zaiY3s8xhXMYoASTMbSZcCXUYixqG9pNKEd/2xZ0DJHdeP4SHFNNnX9ylLV2l0JgDP
	ZLLE2ZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTjr-00000006ASr-0p9B
	for ath12k@archiver.kernel.org;
	Mon, 26 Aug 2024 07:02:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTja-00000006AOH-0fm0
	for ath12k@lists.infradead.org;
	Mon, 26 Aug 2024 07:01:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71431524f3aso3115291b3a.0
        for <ath12k@lists.infradead.org>; Mon, 26 Aug 2024 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724655709; x=1725260509; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VG/saQQ5iHGoFIIQv7ApO+CzdPsxdfU6dBnZhjjs/f4=;
        b=ZV9uknMxpAVOjNwxm0Fd9TXAFzmnGlkEGeWKnZghttTFth8CiXr2edVsLj0Ev13fzV
         6J4RS/UDicYT70Er3M7z+vpUXPZ2z/DspnvkPdagA4viagD8DlEVFXCqLHhlql+8/TJk
         yjR7pybH2dR2gW8WQt8Qi0K10LbT9cFe8PMbtXs9q0AMgXXs8BqzTdtME2AX+38CWA7a
         8/2O8bAAwdmMww59WPQ6Ey1UqxGDMDO4S3j8zPBMu8xVt+Xxr5kcHZed5cxt+2OGUhSD
         WDQh6951W6kE1u3C8/iCmn/kfYu5MXxpMiGeWV+3+w6KJQ3eFYys4sjVTfLCZf329NA0
         MEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724655709; x=1725260509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VG/saQQ5iHGoFIIQv7ApO+CzdPsxdfU6dBnZhjjs/f4=;
        b=iBxnA7KqJh0WJbBk/Amz5QFpbLACHcWtO7jo5mGXmYb/cZKwgrQVBHLU4fdsfWhqOU
         ieEJNZeGFlNGOfAAGgu2s+UKlnLLilEir/saU+eYfCIFyzFxbaWZrR80ubXjqudo/cWT
         2SdAFpfmszAGIZRiiOFkTwsx7QFoCmfuNtDLvLi+Mp+EEajW5vHDVZR6X9Z0qUb+OT+z
         PjgTUP/+Jvjk8k+brwNpU7ui/tXxYWtDtLzWmKBhqNVEupeV4iVWpnZJtrurcPkpoFNZ
         pwszViF2LOdbMmz2rWEGiyHhSlGqgoUOprH6qlHfoZFg9+yhYor+Fpb7Krb0+BBR895U
         /0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnAgQypgHT6HcrbsTWrx2FHLdjCZlN03+K+BtoroZrieV5mc7Y/zp/+zCnJWQLFztfe3UaEq0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeQ6nGZEhTEuzHDe/RtNcU1CjM9HsbmsIEfzxp78/LuqDhC9vn
	abgSH5YP//EBHuRn/7iSjX0H07x1utfcwELsl7wy9ZSPvX5nPRuOLVC/xwBnVA==
X-Google-Smtp-Source: AGHT+IFGIR6y4xQ2gR1n7QV7ZGej510G4EA/KhOh+F8qAhhrMZfBhUIO3179V98yc6fCEadsR5WUKg==
X-Received: by 2002:a05:6a00:918b:b0:70d:2b95:d9cd with SMTP id d2e1a72fcca58-714457d35c7mr9989372b3a.16.1724655707102;
        Mon, 26 Aug 2024 00:01:47 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434230696sm6740544b3a.10.2024.08.26.00.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 00:01:46 -0700 (PDT)
Date: Mon, 26 Aug 2024 12:31:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: kvalo@kernel.org, jjohnson@kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: Set IRQ affinity hint after requesting
 all shared IRQs
Message-ID: <20240826070143.ejd6vuorseogmdfe@thinkpad>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
 <20240823155502.57333-2-manivannan.sadhasivam@linaro.org>
 <d3ceaead-5619-4413-acce-64567c08fb27@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3ceaead-5619-4413-acce-64567c08fb27@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_000150_234783_3BFDAB96 
X-CRM114-Status: GOOD (  27.72  )
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

On Mon, Aug 26, 2024 at 11:04:41AM +0800, Baochen Qiang wrote:
> 
> 
> On 8/23/2024 11:55 PM, Manivannan Sadhasivam wrote:

[...]

> > The warning is due to not clearing the affinity hint before freeing the
> > IRQ.
> > 
> > So to fix this, let's set the IRQ affinity hint after requesting all the
> > shared IRQ. This will make sure that the affinity hint gets cleared in the
> > error path before freeing the IRQ.
> if you check 39564b475ac5 ("wifi: ath11k: fix boot failure with one MSI vector") you would see that the hint is set before requesting any IRQ for a purpose.
> 

Ok, thanks for sharing the history. However, commit 39564b475ac5 looks confusing
to me. It asserts that changing the IRQ affinity changes the MSI vector
programmed to the device, but I've never heard of that behavior. IRQ affinity
change is supposed to only change the CPU mask for the IRQ.

For confirming my suspicion, I added the debug print in pci_write_msg_msi() and
I can see that it is only getting called once during pci_alloc_irq_vectors().

Moreover with my series, WLAN is working fine on QCA6390 with a shared vector:

213:       6766          0          0          0          0          0          0          0   PCI-MSI 524288 Edge      bhi, mhi, mhi, ce0, ce1, ce2, ce3, ce5, ce7, ce8, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EX
T_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ

So I think the issue fixed by 39564b475ac5 should be reinvestigated.

- Mani

> > 
> > Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> > 
> > Cc: Baochen Qiang <quic_bqiang@quicinc.com>
> > Fixes: e94b07493da3 ("ath11k: Set IRQ affinity to CPU0 in case of one MSI vector")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> > index 8d63b84d1261..0c22e18e65c7 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.c
> > +++ b/drivers/net/wireless/ath/ath11k/pci.c
> > @@ -886,16 +886,10 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
> >  	if (ret)
> >  		goto err_pci_disable_msi;
> >  
> > -	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
> > -	if (ret) {
> > -		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
> > -		goto err_pci_disable_msi;
> > -	}
> > -
> >  	ret = ath11k_mhi_register(ab_pci);
> >  	if (ret) {
> >  		ath11k_err(ab, "failed to register mhi: %d\n", ret);
> > -		goto err_irq_affinity_cleanup;
> > +		goto err_pci_disable_msi;
> >  	}
> >  
> >  	ret = ath11k_hal_srng_init(ab);
> > @@ -916,6 +910,12 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
> >  		goto err_ce_free;
> >  	}
> >  
> > +	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
> > +	if (ret) {
> > +		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
> > +		goto err_free_irq;
> > +	}
> > +
> >  	/* kernel may allocate a dummy vector before request_irq and
> >  	 * then allocate a real vector when request_irq is called.
> >  	 * So get msi_data here again to avoid spurious interrupt
> > @@ -924,17 +924,20 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
> >  	ret = ath11k_pci_config_msi_data(ab_pci);
> >  	if (ret) {
> >  		ath11k_err(ab, "failed to config msi_data: %d\n", ret);
> > -		goto err_free_irq;
> > +		goto err_irq_affinity_cleanup;
> >  	}
> >  
> >  	ret = ath11k_core_init(ab);
> >  	if (ret) {
> >  		ath11k_err(ab, "failed to init core: %d\n", ret);
> > -		goto err_free_irq;
> > +		goto err_irq_affinity_cleanup;
> >  	}
> >  	ath11k_qmi_fwreset_from_cold_boot(ab);
> >  	return 0;
> >  
> > +err_irq_affinity_cleanup:
> > +	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
> > +
> >  err_free_irq:
> >  	ath11k_pcic_free_irq(ab);
> >  
> > @@ -947,9 +950,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
> >  err_mhi_unregister:
> >  	ath11k_mhi_unregister(ab_pci);
> >  
> > -err_irq_affinity_cleanup:
> > -	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
> > -
> >  err_pci_disable_msi:
> >  	ath11k_pci_free_msi(ab_pci);
> >  

-- 
மணிவண்ணன் சதாசிவம்

