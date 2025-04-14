Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22964C369A2
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 19:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=; b=Bozonj35evkG8KvaWwYTbAIOE5
	EsxDFwUMBFoPEfJmAOn0Gr91N8pLbW5fphmSkVsIQ1QTAb7zRFSiMpMHYI43/80BgHyig9AyuET24
	EyQSVyLFHakGF2Gj2ScK5WPFgn/FbMbFtqwdDcyvWUEH7W554ksDaWH69eZWiaxAxNe6xVDAvkIev
	n3TnDwW3fRJrMoVHYeKuQIBIR7BlaRFRJJDZgGtdJVZDCX66DpxITiZWMQpTdXuAXkLzB7mD2lkUD
	8j+E8w6NzeoSWw2TYFsKW82iBN7SjBCLymLWWNdXAMyD9dCMV4tw6PwJBwdGuInpCrUzvxA1RsgIC
	LTCMxnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PD8-00000003EoR-3dmt
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 19:11:14 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OnG-000000039YV-0OaI
	for ath12k@lists.infradead.org;
	Mon, 14 Apr 2025 18:44:32 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso3665272a91.1
        for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744656269; x=1745261069; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=KNDb+73A5TzuqB4z0jvGdsjDjmmCbYFKmN1im6jhxImSRfVtn9d+V6WZtJ5AXTsp/Q
         ZiU1nrwTM/4jYiokNwLN/DUiFUK7t2BGJS/irKRmBDlmdd4hgNmNnju+/ZOeJWBaGa4J
         jbEE1LY77wrfSSe96otTWAsNDnz5NPBJs5y5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744656269; x=1745261069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=DdVFqMvMkU2QMIQqIU9mXwjvWCftiVZbHRpFLzj6BRcff+askDBIdw4Tezf4wEUTOg
         EoPU9RYQm9D87wGrnKTUsIw4Venahy/RpPjYamEib4fmNbl/ttdxqgMgpcSbJ5NvX/aQ
         3A/GsiI3IHmbi8Gq+qLz5y3/ru9nR8qRDgEJRZh86VSATXtCVxhPrp8BvP/sduHL6bnr
         wjsZW3XusHUBu/rExGESEdH94vpZEL2yWyRJJpRB5GvHKaAMsAdEhOeQmglRqBtEKbOs
         AwawZN4OcOAY2uC/8zrwXNx66pGPg3Xa1cfNEhz3n3aGrDMyxZXY5HC0bxitdM2wuAt5
         AH1A==
X-Forwarded-Encrypted: i=1; AJvYcCXEFcJz/68f+b9kv0TKG1K0zr3qqgEAn2ojVK8KrihzBZN4/rl/lgbWy8qSKimrvtXCFQldUWA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyV9pc9XcVnmEL+t/y+nfIFUiVmLFEbNb5C557bAMc2UpzqMYV
	E82gLskDF+KZJ/svZeTSdHizVzJRgEc40C+DnZTgx0OUaHDj0kH9WSSAIRK02w==
X-Gm-Gg: ASbGnctTxKHYXWH7hmTUva21mGi1YYSK2MmWe/4NXCVkztKOQfv52k28rcOtfNm04Xz
	1ztMEBPt1DCezvsgYzt19wMFo7Oa2mNy6pOQMxnvLe/OCMyDYJwbPfF/DfCYE54pD2uLFYYMgIa
	4U4ZQHsToNMrgdlojr6BaWODxz8rDURzSdBm1ges5wr/R8AP67JPhd4wprM64ee+JPJmXfhq5jj
	N2Ykj/K7mAhjZqFzNGx/a4cRZzuLVm0dziwFBWKLF2FH+MReNTxjT935vKLk0UQHXyVHehqJdkW
	xxjnbVu6xAfjzaWbVi/b9taCbWwxcoBOOhFUCDK1mC9NPrvF8iAwrrAZdk7C9QMcvkJCQvmyfUh
	BXQ==
X-Google-Smtp-Source: AGHT+IHRnGevNVFCEzzLtuARDY+GV3b1ySMboNdXjtt9nCxP859MMeYdEqvd7RpkkuyGR22MEOT6ZQ==
X-Received: by 2002:a17:90b:2752:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-308237ba788mr18304386a91.27.1744656268888;
        Mon, 14 Apr 2025 11:44:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cfd0:cb73:1c0:728a])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-306df082327sm11386410a91.15.2025.04.14.11.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:44:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:44:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
Message-ID: <Z_1XiNY2ujreEo69@google.com>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_114430_137945_17BE94F2 
X-CRM114-Status: UNSURE (   9.22  )
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

On Mon, Apr 14, 2025 at 10:26:01AM +0200, Thomas Weißschuh wrote:
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk().

Is this really true? Documentation/admin-guide/sysctl/kernel.rst still
has a section on kptr_restrict which talks about dmesg, CAP_SYSLOG, and
%pK, which sounds like it's intended. But I'm not highly familiar with
this space, so maybe I'm misreading something.

(I do see that commit a48849e2358e ("printk: clarify the documentation
for plain pointer printing") updated
Documentation/core-api/printk-formats.rst.)

In any case, even if the advice has changed, it seems (again, to an
outsider) a bit much to say it was "never" meant to be used through
printk().

Brian

