Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3028AC02194
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kQ7aPeifT1xdGGMZlwPvaAdEmOG9nj84TNIl4A91gs=; b=K3lu5ClyMtweYmN8I1a+qMguhh
	Xb9PmQ/AcSRGZkPrJQAD6tUUIL2MVICuK5yYFGDFzCiBP/3jA43YWgPaIASyBKu6fVf3eJB6eoixU
	R/L04VXtIeQShWMO4puT4VVRfuEY3v7JLcHsiQQph7q3hEyXQpbXmtSqr6ifyeNHrg7rktn1diQby
	drOGXTIulx2DTP7fQ4+pRK/tLyplC0xPw+vPSMX4Yl/sXhsyKPKNGU9qJ9P0wtUnzKPjWBFYJm6wf
	LSP9Gyd/01Dhj+6iC2EqSHArZK4mOBehkiB+5wSL+PtJoCrg5ck70M9sGZK8vJ1pfW4UDY2w3yIzT
	7M2O7jEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSOu-0000000AXUb-3ylq
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:44:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgS7p-0000000AU9H-2rVI
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 17:26:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f50895565so15058955ad.2
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 09:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738949204; x=1739554004; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kQ7aPeifT1xdGGMZlwPvaAdEmOG9nj84TNIl4A91gs=;
        b=pdtmflNLL3A/G+ZlgB+sCUmmMUk/n3nP6xA9xFkz83sgoRhUBJ/0P/hV4TZasWiGE5
         o57WUU19PJVG+vocDcn+CP2hBCRuL8sHznXXTMlHrFcn1IfHaFXJZycbQn1A++G2G7o5
         PKaprd/3UNtgtj7wB9eOe4vSfms0kPlqMXB46mmcl9FsSHVfovxfuvFmXf5SO2OekpD3
         r/nZ1rzVGUR72isRZBugiw2RLN5R91kgzytWAC51ks47HxWxrNwSk1QzS39Vu+EUjC1W
         wIlnsqPBoZlkEsmS4YFliS7YzJZo5+r4FWuTBce6cXIBK1vDBE1nOAfevZVMvsSrVM6b
         agXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949204; x=1739554004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kQ7aPeifT1xdGGMZlwPvaAdEmOG9nj84TNIl4A91gs=;
        b=K+al/QPTXhIyCYRZWZ5zXKpObQAPQWFsSmtrZjhMsziETIW+uvlWDXn4Z4fkQ46tW5
         Sh0fqPZBnM0hKl5GWHuc5C+IRzWKUqLJNFVunUpTJNB3LE/x03zdeFVnZYnT/4TjBvyx
         9nlru+B5cocKiGyv6XVNlvf5OcpnWrZAwN1uVq+o13ua6tSYP+zw6bONzombMH2FBlA2
         8dJSJSqfIvjgIgHveYXhzDeyazLnIlFvOVoW9SItifBv3aOv30SZpEvVDkTAzX4GIE/R
         kZr/rpGbBDEuBXDdOquCuMDor7Wwd+BDXfnbW5LYifERSBDLqEo7phTGOQlwETcWWGdi
         rReg==
X-Forwarded-Encrypted: i=1; AJvYcCVAzgxBeUW/Zp5hiGvyCisShKxVC+jJglGjTgBGjyrKvTA9xYFPMcfI0czDnQEj+OMbvhXXpLE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8IBGS3oOAVM8J8WdRLG6DRnryG20oxuDPFKAXucaa/uKX9vb/
	qNzR3msmjmW7dX8mFFCmBM5FyOGAjtXr20X/P1mKO2ny7CUOBdtZPC5ecqkYJw==
X-Gm-Gg: ASbGncumq/Wpyw0sAyOyDsvI4aAKzUKsaw/83dvv6vHrIEs0uj+tSGBxgGDYX8uionC
	1PqojuYUVReiJ3MDspRtZIzRbAi0a5ZLIJ77Hs0G5b2PTR0y2xX/cUb0A/1cS0ofk876ek+1Y+D
	BarwLqktFqDYuwCQEI4wbXiO/4w2VDtnzfTSFw0TKUdIKkjdM5sCWiLM/HpWN66lCPWuj+fJDkT
	Wj5nEF0gplwAC3ZGVJLfhRHUW0q24lBxE1CCXKo8VDnV4ZZfAgfRWMp5Ad2UgOuwktJ6iIkhPJ1
	vfDtW5pfUElVgqDuYCDlaN1JkA==
X-Google-Smtp-Source: AGHT+IGwlMJjAWRYza5p7WJGxEFFQpo89Mjy7QrfQNgroEojUj8PNO092Q8xdIFkP1o8AKidffm+WQ==
X-Received: by 2002:a05:6a20:d705:b0:1e6:509c:1664 with SMTP id adf61e73a8af0-1ee03b6f0ffmr6990656637.39.1738949204454;
        Fri, 07 Feb 2025 09:26:44 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c16222sm3332034b3a.135.2025.02.07.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:26:43 -0800 (PST)
Date: Fri, 7 Feb 2025 22:56:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: kvalo@kernel.org, jjohnson@kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: ath11k/ath12k: Set IRQ affinity hint after
 requesting all shared IRQs
Message-ID: <20250207172640.npoa3ojrdhxg765a@thinkpad>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
 <a8f4f4e7-1c13-44d8-b19e-4ac85b48ee04@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8f4f4e7-1c13-44d8-b19e-4ac85b48ee04@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_092645_723312_39C1F25F 
X-CRM114-Status: GOOD (  19.34  )
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

On Fri, Jan 31, 2025 at 02:21:45PM -0800, Jeff Johnson wrote:
> On 8/23/2024 8:54 AM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series fixes a warning from kernel IRQ core that gets triggered in the
> > error path of QCA6390 probe. While fixing that I also noticed the same issue in
> > the ath12k driver, so added an untested patch for the same.
> > 
> > Finally, I updated the irq_set_affinity_hint() API in both drivers as it was
> > depercated.
> > 
> > - Mani
> > 
> > Manivannan Sadhasivam (3):
> >   wifi: ath11k: Set IRQ affinity hint after requesting all shared IRQs
> >   wifi: ath12k: Set IRQ affinity hint after requesting all shared IRQs
> >   wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
> >     irq_set_affinity_and_hint()
> > 
> >  drivers/net/wireless/ath/ath11k/pci.c | 26 +++++++++++++-------------
> >  drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
> >  2 files changed, 26 insertions(+), 26 deletions(-)
> > 
> 
> What is the status of this series. I inherited it in Patchwork from Kalle.
> 
> It looks like there was a question if the 1/3 patch was actually applicable.
> 
> If we think this series is needed, can you rebase & repost?
> 

Yeah, this series slipped through the cracks. I will respin.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

