Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54AAC28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctkJhtxKsp7SbmROJ/NcWvcFC2gk/L3/qKRnLMhq/34=; b=iK022v9cu8/xEk5++yuLcXaP3e
	8mcWSATjn6J7Dd9V0oP/LPaOOe1xdMA1QQF4djhxEKbMAOtQXdM/8Lk9iwfaZfmHjSKNwVSpwG8cM
	Gm4CIRkfJ1FnkCHHVdUzlrayaUvAg0TUXi/0jJwqfAIEHhGtzeindbmlU3XQq+oQiZYq6Zge+ODWj
	uapRLkxCr0f/yt/Ni9p2KJSG3d9EOSpYWx1FOCk8+swPsto8qgTNhvKBkoxh3FGm9z7g2l3Psr89Z
	ekQQXmnXXCJTkFqFLnPytMWPhLIDrGsxgUST5c3K9CFZmv6ArXGP34NlFKUED4ihgA8dueL5LbFjg
	o5Eypsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzt2G-00000005Sx3-2aa6
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 08:01:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzt1d-00000005SpJ-0lyh
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 08:00:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so11203213a91.2
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580840; x=1744185640; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctkJhtxKsp7SbmROJ/NcWvcFC2gk/L3/qKRnLMhq/34=;
        b=msf7Req0zJ1Uw8g2qPEq1JtuTe+xPVnAzCG27Bjqe5ejY8Byz+9k4ZcB2f4BIMVdM9
         8upe+TkDEufZXRJZH9NqU3I1UvuA3blZCvviIV5eC5tnXQ/tvwEcEe9i5PrrgYOgYUo/
         IfFOB0dlKHjXImE9begSFxvJwpUuhf0UylXUOqaoF4cQEXNGsMs8BJUnft9A4BT20e98
         hpd/LDB/0NyVCU1f4ivPzSl8WmlSxPPMOlju3BeF025I/qreiY8eyou7lZjZVBbkK07f
         3JwfQ1sKb12tYboI2vtNlNfyC+2eZdCLQfGO5SBxtMwklMptwsY+R08Dpo+3vN17CzE+
         qEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580840; x=1744185640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctkJhtxKsp7SbmROJ/NcWvcFC2gk/L3/qKRnLMhq/34=;
        b=bm9EaPz5uNab20zpj8COP1tIJk1N1ILjqc98yv6hVM/ASM78Hzc1Dg3TKGyh9RJ3Mg
         FZl7UVzvdrxySaajVnUjlK9oREYv/OgubCkMjgkfk9YWhP506DPpfU748qd+WnOGIxHA
         h/bfP9/CwnpOqSjr7vYzsZqJuYv6Wl1lu8X2QLVyYEJjUmCt0yU1XdVcMB7Tmjcn0dNF
         QekpoXusE+ZJEXl2kqfTB0FMT6xJWEgLwwll83GH3i7BVpvnr/gStel5uSm4kUTCbxgI
         om/g5Un0mgpyH2AvE4nt4hiB2HBMwzbTHkRF5I7qxjXJ+MFjAN0Y3IhNxnkqJx2A4Lj7
         UlMg==
X-Forwarded-Encrypted: i=1; AJvYcCUvHteNJPnUZPCp6sroJ97GgU1hCGDTJex6+QiRJBYLA4aIE86wxLpBm3seFYxlbK6qeNHUttg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww5njh0T7KQNtB6e0J36M2CdiYvqo5qYPp85sp6fZrt5KLzvsu
	R2ztKoo5ty+tPbr21/qNza7w9eIaYVbpIsNjw0Hx4Cfcswhqbl8gXGuP7p8uew==
X-Gm-Gg: ASbGncthC2/HddSqOFY7OyP/0z3f9XnVE1Cp75D2C4jAd54SxTz9t8dJuK5frJWJLcj
	xZXTY3nhbTQ2fu87lhUhevpeu+g8YwgyCDODOhgISEI68roxsHH1ym90flfKoiW2tcn0jYED09A
	aNU4q9OLb+DMF+uQ+iiCRWGXy2iqHNhdRpVNDM9TF6TrbmVr756c3pwK6WIm5DzKDE94KBsZvsb
	GtdZnA/RZQPFeuHKvTY2QsS+DiWSXyjnhfN9m9e4r504rN6c0e/1DfVvMpiXPDBOfBT87NKdWGO
	XtkQUd1DN9bJCgUyfMzY6zblIOAFSo+FF1dwMjJno1pec7bkh/DhNwGG
X-Google-Smtp-Source: AGHT+IGTopCX2yplsS8GSpqfdGC18AVuR2urMTzElNFnwCLQ4BxN3uKkDEM1puu2xMXe8rc89mguVQ==
X-Received: by 2002:a17:90b:1f92:b0:2fa:15ab:4dff with SMTP id 98e67ed59e1d1-3053215b176mr5797036a91.31.1743580840354;
        Wed, 02 Apr 2025 01:00:40 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f979d6fsm1010122a91.45.2025.04.02.01.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:00:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:30:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig
 symbols
Message-ID: <bsk4s5tlbpnvds73uxeasqxydcxolxpxvmtladtejhbi65yxob@4h5gy5srxlrr>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_010041_219584_B7EC9BAD 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, Mar 28, 2025 at 03:36:42PM +0100, Johan Hovold wrote:
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> 
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
> 
> Let's rename also the Kconfig symbols before this gets any worse.
> 
> The arm64, ath11k and ath12k changes could go through the corresponding
> subsystem trees once they have the new symbols (e.g. in the next cycle)
> or they could all go in via the PCI tree with an ack from their
> maintainers.
> 
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists so we may need to keep deprecated symbols for a release or two.
> 

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Johan
> 
> 
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   arm64: Kconfig: switch to HAVE_PWRCTRL
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
> 
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 28 insertions(+), 13 deletions(-)
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

