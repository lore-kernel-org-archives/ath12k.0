Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2776FC27C53
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=EQlrPHDDXQUzPADkAYVT6+V3iLzv9Sd6chxCRGLI8/Q=; b=T/CdC+2kmnYpcZ
	jtxkKfAXh6tPmuTSsFYyzAz9xRx3Ffk2K/g/G4S5Ei6iD7QsUGkYadZulIVPFrBbFyQWW9+qiDQ1q
	58b14RE8nCkyfae7VQGHfF4eBgI32cilNfT5qm4EMSBAOGHDrqf0pLLileAGglPBAPxQghEaTYmWN
	a1F3A4xVSSuY61R7mCOs1Xmj3t1sBbhEqXmUWc/dnr6086EeEVc7OuPRPa8HZWLptrrqAhE0f4z5B
	uZ5Jz8oLdnR4VWJjzU+1gz4YCDLZGX3Ce0XpG7IsVdA2G068DK7cxrOxRgEKnvJN+rf1M/Cc0lb13
	nCsu6cOAOwoWwq3SSMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXzT-00000003JLP-36KG
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 17:30:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXzO-00000003JHR-1uk4;
	Tue, 04 Jun 2024 17:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31D26CE0FD1;
	Tue,  4 Jun 2024 17:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2066AC2BBFC;
	Tue,  4 Jun 2024 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717522223;
	bh=kqXj1o9Fsay7aIOaaJ/crMyXrglXA8LEVq/ukbMHfR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F6kbkbrya+2QdXaJJxhMiNJEmPq6RWdGsdKv5Wt8MKfQPpRWECv0VxJIXccPoTR9K
	 JBP4aE+hxN7XKqav4/IiGnpp8KCM5EJVVVBq9b/OovAlL62hMnzOBnNDerMmKONKcy
	 45i9TGTWAO2jQ4cKDpSLbIlaiNIC1JLFgvUV4aZ9jOyh/xBQmRvMaXEqmF5m3yIyDJ
	 oE2X/FaMRR0V8QHBtM/DxaLSeFdn1lMIj6ckCem+zUxamxNWjVNe0jEmdnj3ETnWDL
	 ddlBOn4kunY2LkQjfLUOTc8cE42hWGoap49ZsdowxT92uOERhNiWaFrQgkTpuaYljK
	 +SJVeajyY0vSA==
Date: Tue, 4 Jun 2024 12:30:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 01/17] regulator: dt-bindings: describe the PMU module
 of the QCA6390 package
Message-ID: <20240604173021.GA732838@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-1-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_103026_880481_DAFC513C 
X-CRM114-Status: UNSURE (   8.71  )
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

On Tue, May 28, 2024 at 09:03:09PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The QCA6390 package contains discreet modules for WLAN and Bluetooth. They

s/discreet/discrete/

> are powered by the Power Management Unit (PMU) that takes inputs from the
> host and provides LDO outputs. This document describes this module.

LDO?  Again below, but maybe this is obvious to everybody.

"This document describes this module" seems possibly unnecessary.

> +description:
> +  The QCA6390 package contains discreet modules for WLAN and Bluetooth. They

s/discreet/discrete/

> +  are powered by the Power Management Unit (PMU) that takes inputs from the
> +  host and provides LDO outputs. This document describes this module.

> +  vddpcie1p3-supply:
> +    description: VDD_PCIE_1P3 supply regulator handle<S-Del>

s/<S-Del>// ?

