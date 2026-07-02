Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390CFC43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf72hkVbbdWwb9P5XxaucOhOUznb7Z4SYShC8Uf5GQw=; b=2O8lahlTo4JtuJV4+O8fD74hMd
	g9/havXlpEnaFt/xhZALjIW2NUfTqI0WAXcuhuFRClZ/N8HmcJX6VsqdkZ3u48/LM0/WYs+65DXnQ
	L1eoKvQGaCjRqD+KlcWrysPOxG2s9peS2OfFbt2KoSktl3DUNUwI/8LmdzBlERmINm9F8A8Fkl5Q2
	lrzX67egBoR/ABlUE4rGCx8qbnrvB1pFJcLsvRQnjecTfgh4MGDP7+1SshCeFzUAn1+JymqDxQzrw
	TCIw53U2qCS3lEUK810XwkIfqpTLzhJF2aAwftAEWyhxkq1kYmN7tY/5WjW0vdRhKQBLW8v3UinPG
	OfhvbTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDHb-00000003wZU-4BhI;
	Thu, 02 Jul 2026 09:00:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDHa-00000003wZ4-1APm
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 09:00:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-474303f3c72so1020781f8f.0
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782982828; x=1783587628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rf72hkVbbdWwb9P5XxaucOhOUznb7Z4SYShC8Uf5GQw=;
        b=l/zWnFpDicBQxrhFq3gHh5q/2E/wOLtYttxMrNTDXndxYFAGvSLQU9DWIEK6IiOFsV
         RaiiOeB3MUeOMhvT/m85AsiBiD2S2oVXh+RUnY3Q83iz/5FJNIQEXUHTh1fN5vs55icn
         H41VewxDQzZOPyIpyOaHk671h26ri727afB1igP+ji9eSm9YEVwn1Du+FF4RYcxoXA0k
         dKdvl8vmFufGfdXgUC3JVxVGetq27jhElvl6eaEjWWUSBif/eMDbye8lfFkm4/XU9t3H
         2VUsfaP3XpkQWW+CvFS7MSzS6DWtzMOwP75I6k45eWApJAa/Lg6TM6lFjDZdKqzMLtY+
         D3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982828; x=1783587628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf72hkVbbdWwb9P5XxaucOhOUznb7Z4SYShC8Uf5GQw=;
        b=FoHZp6FHMnbL8tjkeujvDWeymqN7vXsL43yoWsDzl50V67IljQhO/9IAvc46qmc0Z3
         x1wnl6mEGttCbwoP4sCsY67oKEPoOaKCpbSu8nQI+e81UGgIITH8bKdjJmfuNNMrADXe
         4NOBo417UQePgJHe2LB40ln4gYWNZMoUwrlzN2mSn1+MbD/a0SNcOpLd/FXsEDACd1VA
         PtAGUSlxHv1CwgVVEsq7nKmJlTkbGXA/x3Mm0jDdBMQFN7P8kQ+j2plfplzwuRcEUSpU
         q6tttlOHZcjmvFn5JWMRCW/tKGXsksToqckfMW7sS7NPjAywZSP9u73/TKGEbp08LziG
         yZAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVwrwkJgFloe2oR97NTcrC+v9DkxNanAEzi+2lPk7xChONgdTp3wEAPTVe9rZNSV8DL8NPKpg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJPZaDOcrrn0BV8ELclHS4l7ZGvONpjDDDCNkfD1pO6tdVvCYV
	4vyVF+fXzVyMrjA1u9w5m+PwjILpX2q4I2x49kThmm53GNWzxdc9dyjC
X-Gm-Gg: AfdE7cnQwAc8qPng9YxpHsHBcdHG0gQMvoFJKmFBv4lF/4EeVyYcWr5le6tV1GUOBMj
	p46Nr/+bCU7nPSkoP88dpGsG5H4MLYX+wY0kr74s/RW5+EpLPzLClI2tP9anozlSNbRmwbnfgbS
	b92+V0grn/CXZAck8JfjxH/9qbYqNTD4svocjIOjHeTs+rIcI6H32ktm2bbEY8mtQw9g+J7gjWY
	pxpskjZtRLx0frM92/niSLzEIkB6C2bdmbdgo2Kv36UN54Arx7Qh9Vs/ggL78gGgAQzDWMa75J+
	Bm9KTL5BHF1aKOPiJkTfZoAcD72KMdIWODAmr6Q1k2C12hjZVZF5sieLHf4XQCncNe9jJWTh1H8
	mESQxhpTb0LQ0rbF8w8ZbcVML7SIwPsc7zqu6FbokeZq1qdZnwgcVKmGDicQqM7pCAECZiIZSeW
	uJy+L7pnZoEWdOlGOmF8wvwJdaP1w3V3uY1/xwgwlqf9LvLoPECcSR1OXAfHraNjxshj9hwgtaj
	UevxBLrOGrNxUUvfUVAu0iFTw8=
X-Received: by 2002:a05:6000:2087:b0:475:f100:360c with SMTP id ffacd0b85a97d-4775a6d52d5mr8157295f8f.59.1782982827830;
        Thu, 02 Jul 2026 02:00:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd46asm6934267f8f.36.2026.07.02.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:00:26 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:00:24 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Andrew LaMarche <andrewjlamarche@gmail.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH] dt-bindings: wireless: ath12k: allow calibration variant
 for WCN7850
Message-ID: <zglhxxu6txw2xvz4vcyu32v6722hqppcfvntan5ho32ak2y6tw@2mvfuaoxcvss>
References: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
 <20260702-beneficial-hopeful-binturong-a0bee9@quoll>
 <a0cb02e3-0566-4294-b41c-3b156ecda5e0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0cb02e3-0566-4294-b41c-3b156ecda5e0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_020030_333175_B36231BD 
X-CRM114-Status: GOOD (  19.85  )
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

On Thu, Jul 02, 2026 at 10:29:51AM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 10:27, Krzysztof Kozlowski wrote:
> > On Wed, Jul 01, 2026 at 05:42:24PM +0200, Ernest Van Hoecke wrote:
> >> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >>
> >> qcom,calibration-variant selects board-specific calibration data for
> >> systems where the bus and device IDs are not unique.
> >>
> >> This is not specific to WSI-capable QCN9274 devices. The WSI binding
> >> already allows the property, so allow it in the WCN7850 PCI binding too.
> > 
> > Why? You need to provide reasons WHY do we want this.
> > 

We (Toradex) have SoMs with the SX-PCEBE from Silex, which uses the
WCN7850. Silex provided multiple board files for this to deal with
separate regulatory regions. Thus, we need a mechanism to select which
one to use even though the PCI ID and machines are the same.

> >>
> >> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > 
> > Where is any user of this?
> > 
> 
> Actually I missed your link in changelog section. I still however do not
> understand why these are separate. Separate means they are completely
> independent and thus my question about the user stays.
> 
> Best regards,
> Krzysztof

I agree that they could be one patchset and considered replying there,
but felt it easier to discuss this with the relevant patch already
attached. As the other binding already validates this property there is
no real dependency or ordering problem, and I thought this would ease
review.

Kind regards,
Ernest

