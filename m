Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD777C54E60
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnwpKpwKx9KdhFvB3QLx3XVovWP0wXBEVvHo6zQuw6I=; b=RCnGBO0qjw0TQZ/G5Wl7723I8N
	TxBs1OzyRr3sLLgk3pv6ZCDZZ76OGOsEb1fyivkqBUaxZQOOPLn4vKJfpUPHmmmEIdbr8bWluNh5j
	vYcEmGiud8GBXaGt9YGuNB34DpKvkdpz01iMUckY9hSIwGAHuJnRSk3C20eT43AwcN1zZThJzmS1c
	sP28DV375kFOfsNGSrbH6K+JR9WUsC7FriIhtp8PPUVhSvtsNRHCUiDEUM8e+tj5pCi+BTtJ/4zhr
	PDzlPgUUT3y8Ib+su9EdosvcQrTcJeNwuaXMnhGOx1zf//xkeP85FkPzUPQtPsQcMLHoVIQz0g0PO
	aDiDCmWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmS3P-0000000BLSV-29Lp
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 05:30:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmS3N-0000000BLR7-1N7K
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 05:30:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e04ac4209eso782375ad.1
        for <ath12k@lists.infradead.org>; Mon, 18 Mar 2024 22:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710826222; x=1711431022; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnwpKpwKx9KdhFvB3QLx3XVovWP0wXBEVvHo6zQuw6I=;
        b=kqMMJRR3Odx0bg5xh4l2g73qCfEI91kBzzPsBi0XfkvI6O3nBm+QGd07aXRQBTyJfM
         JCA7WN3ucDVTVwRMkRMaCwwEuEWlz6X1t0WPB1X2OgR7Dx4Y9nlEQp3ONwg8HEX+5N5/
         DL4qOgNQDbhRKm6gA25swuf0zotjHQThgbHSd2/bOgUUoMu/Q2flLXLi/ZzqRmfFvdGe
         kz4xXvJs7RjiztSfWohhPJ7RTRAINHhtaujTUff/J7RsxEhnw+YJDExugV9zt0/G6bDx
         AHXIOpV4kQWabr/3MkeFVU/QQ3481B0+XttU4wOe4Uo5PwzGCvam+nS12Md+LotEzt+o
         E1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710826222; x=1711431022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnwpKpwKx9KdhFvB3QLx3XVovWP0wXBEVvHo6zQuw6I=;
        b=wS5hL4ZJOuXem0vNkDUdDJ9+RUX872/CH8MkMkO0W4Rymoj/hxavHYnx//sj85wHa/
         7BJRvUSdf1ht/9U7ObJUXgU4JqSAHzgNG5cyb96fvWsQ2PdrG6Q8XOKuqWNOHcEXt3Tq
         APCaRfKuKqks1vT56SjQ6eCRdX8HckzHU9vC/fvH8DX4OhrhQ3kvc3fGV3a2clZJp4LR
         0OxG/euyvXGtA4ovxpnNJHYutsPRVGOo7l/b2tjjLaU3bWr/5coFVJSJ38rBPGRotuNS
         mipH4rbmaxiJ+faZOJxLURdF18O9a25QdYXX4OIXT5dV8tdrZEixdgfW9O55GgcTHK2A
         QfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJPO+m5+1YR0L6qi776qlK90P+EMWvV8gb/39W9QjVYFrz41q3C8Or3vFp19x11RgWowsCdmzk8eszo8XnZ7mG0VwxMgjpTDhLhg==
X-Gm-Message-State: AOJu0Yyhg2ZLtlwadEOr0uuvNuCWUCAIOhvrytJ7T5k90sHCu6bGoryQ
	lPgaSfMsDGoNCjZ1wUCBtoiu/xS1DXxGBmTfAcdDhG8fORQ5FZTFYbQh7KN6yA==
X-Google-Smtp-Source: AGHT+IGN8R7MWpCbvVRQ7TfvAKvaHU/nPUlE3mp9WAGQLbKs8Dgg89mzcNJ3YQ+u7aDG0ydXOSA8NQ==
X-Received: by 2002:a17:902:f812:b0:1dc:79e3:c8ed with SMTP id ix18-20020a170902f81200b001dc79e3c8edmr11683809plb.31.1710826222014;
        Mon, 18 Mar 2024 22:30:22 -0700 (PDT)
Received: from thinkpad ([120.138.12.142])
        by smtp.gmail.com with ESMTPSA id j9-20020a170902da8900b001dddb014624sm6180788plx.54.2024.03.18.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 22:30:21 -0700 (PDT)
Date: Tue, 19 Mar 2024 11:00:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Vladimir Mesh." <owen.mesh@gmail.com>, ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Subject: Re: ath12k: driver does not allow the system to switch to
 suspend/sleep mode
Message-ID: <20240319053018.GC52500@thinkpad>
References: <CAHohoUjBQ43aX8qvT6WAK5AK3PnOyU1g3eFLuCL1f-UMjnNnwQ@mail.gmail.com>
 <9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_223025_399521_F9581B86 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, Mar 18, 2024 at 08:51:04AM -0700, Jeff Johnson wrote:
> On 3/18/2024 5:15 AM, Vladimir Mesh. wrote:
> > Dear Sirs, 
> > 
> > I have a problem using ath12k driver with wcn7850 adapters.
> > ath12k driver does not allow the system to switch to suspend/sleep mode.
> > Please fix it! 
> 
> This is a known issue both for ath11k and ath12k
> https://bugzilla.kernel.org/show_bug.cgi?id=214649
> 
> There is already a proposed fix for ath11k that requires changes to other
> components (MHI & QRTR) that is pending approval from those maintainers:
> https://lore.kernel.org/ath11k/20240305021320.3367-1-quic_bqiang@quicinc.com/
> 

Just to clarify. There is no 'pending approval' for MHI/QRTR. Both patches are
reviewed and pending to get merged.

I will merge the MHI patch once merge window closes. If Kalle wants, we can do
an immutable branch between mhi and ath11k trees. Otherwise, ath11k patches can
get merged for 6.11.

QRTR patch should go through netdev.

- Mani

> Once that is in place, ath12k can also be addressed.
> 
> /jeff
> 

-- 
மணிவண்ணன் சதாசிவம்

