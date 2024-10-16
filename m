Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DED3D1AD48
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQSFPeENDoENYpbyNxZoNIhCobJqeAT8wBO30SKoc+M=; b=Hs1edzU10aCJSsYkAM1p0fHvGP
	2eXYfsFNQhgGACfON6KxrfXDd5BDfAbvGSahVwZ7LlsnPChgOuuALfB221ZnrOgAf//zaN3A3GRps
	Q7C6L4ysNysA+yz+KWSHbXNpwMHtT2S10JB9RuQudVtAbma31C/k4oJGa8x7TqL1tzpXeZ5NanmRF
	AtPB6/qfd9djcT89EomczB0HRJBsqOq9d7bq0J8HfR0Dj2IYbrOJ9OuwDYK0NrloMjTGh5grtt5Ry
	ubpjQXHF3BWs6WSX9Zvty9MIuMneoQnsX0aaOEBfMllnUFYv2BzPqzcdiRsTxfRZ6Kl9NGl0yxlRd
	thAo7pGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12TI-0000000BcdQ-2gxp
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 11:45:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11IT-0000000BSFz-25HY
	for ath12k@bombadil.infradead.org;
	Wed, 16 Oct 2024 10:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iQSFPeENDoENYpbyNxZoNIhCobJqeAT8wBO30SKoc+M=; b=eXG+r33KUGD75vmdk4tToYAtSj
	LDLMZjrPCpwvHzFIpbgZqqiuhQhYp6Odkm37xeGn/bttfHUAtqy9sg/I6d9cvQ7zuGgI7T49Snzfh
	Kw9hEMkblu+cgGXsbu3CsZ83HMRUdE2m2QNx8NtJmY8whtKPOC9LzmCbe2jqJpw3YmuKT/dSCYsw1
	RFFqi7LWAS1A7riTJLrIGH9cXRxiCKdiBTvUNAFt980hXaSMV06mTP/riDMTJ3lKy0MKRV4d39zJ2
	bn7VseAf59r4G/zAZ4/S4gd2OWm4PgmxIyTpkDUlifM36287yXEKRKmgmTdQKW41csfFIB1hNIfNS
	6IoeBMsg==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11IQ-00000006lzU-0BB1
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 10:30:28 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e3f35268so4831746e87.3
        for <ath12k@lists.infradead.org>; Wed, 16 Oct 2024 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729074622; x=1729679422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQSFPeENDoENYpbyNxZoNIhCobJqeAT8wBO30SKoc+M=;
        b=me/n+s22LIFZ16wax9B/csDSSzH/dsIix+imL4WfRynnu/opuweI2+mKO4zz4DQXUV
         kQhCwZ9Xmz6h5hoiKE/k8pP7OdPEzCvPmlTq/pybQ7TJg19bLYDsBvGVtXv2sqv3kr40
         lhAqbd/CUqTLlIR5/sEYQQjIHtLLrdnoQx3UEdgLgHEI9Z88HAjan/SqHXW62r5/hhbb
         yXxsFLtYHFMyV40+PcquO24NjEOCbSSTjCDkd+KGouxtoShRzJJ2iTDdnhFhnrNTs+SU
         z8Ifj8TZi4tBoEYpdX1MZDEvT26ndfXRE+9R8Pe59mix0n+o7r/WF0tnV9YHJDWmbdLY
         8zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074622; x=1729679422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQSFPeENDoENYpbyNxZoNIhCobJqeAT8wBO30SKoc+M=;
        b=Vjn4AsvWrXjlWLwqc14cfgO52RjbrIBKVd2CmoUzu+M5BXMDJMOSQAmsLMoTHZYpl1
         7X2FfXW/V6eqbIZLO7DjqxagWC6XwkoHj1pINMd03EqT9EbdaG1zLwzcyiVcxIzj0ZYt
         WAIdGTNqigsb0DMUyo7rlwb+9qvl5G+mynUY/KRMVH10NCfen2b7LN3ag18Gya6QCG2A
         7NI3B2ngHfQtD4we1IYopxGjdeLELb4BtlEm88u4Sm+0w19vY9maOljtbxXY7j8tenSG
         Q9/zF1hVKjJQXZtgKXJ5T7e6CLtCe2W8Lf1Z6MABeErhiD/3mmNsXN6K2LuKL8XF8Wx8
         HFBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ehB0rDLm0+k8j1pLFNTYruq8s7CQB08Z6cYeMGn2qBZszaD/AdVtj8iLXbanrYeLLg+AosQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy39FgCR2KUrs4f7ySarEyub/m2VMREyGO0GHGcyDoNSk+lII2g
	po5XalbPIo5mva9EiYY/YaE40QlctoFikv/oZbNUNJeeDX3fgvRbEzYEExrJM34=
X-Google-Smtp-Source: AGHT+IFZU+MCWROhLS2WtO9kRlICAepTgZYo1pzmmsjqkteB1I5eUAuhrTa7pnapdJgkfLAB/FLp8Q==
X-Received: by 2002:a05:6512:a8e:b0:539:a924:74ba with SMTP id 2adb3069b0e04-539e574c7b6mr7157088e87.56.1729074621644;
        Wed, 16 Oct 2024 03:30:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa9441sm418092e87.56.2024.10.16.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:30:21 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:30:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: add wifi node for IPQ5332
 based RDP441
Message-ID: <gnv7i3m5ooxtyi4ywgq4q5sq3wj6j7xtjx6puuixoulypeiwjo@65wfj657x5ug>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-3-quic_rajkbhag@quicinc.com>
 <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_113026_331133_B0FDD575 
X-CRM114-Status: GOOD (  11.99  )
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

On Wed, Oct 16, 2024 at 08:58:25AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 15, 2024 at 11:56:17PM +0530, Raj Kumar Bhagat wrote:
> > RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
> > device.
> > 
> > Describe and add WiFi node for RDP441. Also, reserve the memory
> > required by IPQ5332 firmware.
> > 
> > Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> 
> Don't send one DTS patch in 22 patchset targetting different subsystem.
> Imagine, how wireless maintainers are supposed to apply their bits? 21
> commands instead of one command?

Huh? b4 shazam -P 1,3-22 should work. Or ideally the DTS should be the
last one, so applying all other patches should be obvious. As a reviewer
I find it troublesome to review bindindings / driver without an actual
DTS snippet.

-- 
With best wishes
Dmitry

