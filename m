Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10042C27C52
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wUy80PZLGIzw8w84ATAX9AOJriFZZeJymgNTOAxSSKI=; b=MQ7XD+I0yEXeWX
	JKYrUyBwkygfb4SHjxUTZWiqHnKwR1H4gPxB/oOTHaz0NiX0eJ/NdIxnbczw07X/Q27CXP8YcaKcD
	wWnK0jH2xg/dsPn/GgZJqsOPCYsD7AUCG5A2Y2NuLW2fiOSuEJ7PpAIczyn0CGtEu9vN+8rwzj7bo
	6KPyWRtfM6hIlh6pSJKeZveE3IlBS7e8dteggJOFt2H0OMO6k131Hdc8FaW60QBhgXHkr9pIYTFv5
	Vc1GICsZjzAA4DPJj2dp4w3DZYlPks8NifZdOEHNc94cWhdwG2o6g23nUen2nmogBz8BK1SgP6sSd
	ckkJg+O7yBQddjoBd8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEY09-00000003Jk7-3DK6
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 17:31:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEY06-00000003Jhr-0FNw;
	Tue, 04 Jun 2024 17:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1BDFDCE1269;
	Tue,  4 Jun 2024 17:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1568DC32786;
	Tue,  4 Jun 2024 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717522267;
	bh=MQO9fA2pjCBtJWAIS8fIzWfvpeJKsZKwiMGN9E5r8N4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HAqA3qqt2r3b3JsPPw2jdEIKryGHIeu0iRwJU0O404+aOi10JvyzwHhJhqM7TZAGx
	 CbYd/Iy6HwXXNrWPdf/kgTxVWTbqcPNElqm4BliZpQZMRgnscmSEcmYL6IClroZw2z
	 +jAI4Rael4VhgPwNzw3XE01TH6aSWn8HjU81u3lAMq0Oblx+YoIBSz+zdowwYjtEhZ
	 7owGBmyP86kadTlqZWJDA8FGWqpdmW/Lniw/xDo5S5LLRf/yHPr08S+zi7eB8sxEPs
	 Rcmc7ELlwop/d5XKuVELtcZoKr70m2S3t8sdTo7GU5TmN646i7EAeHXDHdXLCAZjNB
	 lsAQJaGMh+ahg==
Date: Tue, 4 Jun 2024 12:31:05 -0500
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
Subject: Re: [PATCH v8 02/17] regulator: dt-bindings: describe the PMU module
 of the WCN7850 package
Message-ID: <20240604173105.GA733043@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-2-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_103110_312270_A94816C6 
X-CRM114-Status: UNSURE (   6.76  )
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

On Tue, May 28, 2024 at 09:03:10PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The WCN7850 package contains discreet modules for WLAN and Bluetooth. They

s/discreet/discrete/

