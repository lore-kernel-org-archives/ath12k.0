Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D85C25B78
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 23:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZtMqxBC20X1z0XvIi37HlJafdjrmxOUmyatDjBpBcrg=; b=y332bxDw+sShG4
	3kXDioNez9vPAaZuecxEiGVxeYsInt25iu4crinBE79KpHsPs+5yZp4ZpbAb73TS3vSr9xdpz8lNF
	DoxzAE4isz25UQEPiht5pPLyha3cTSYuD1Vic7tamaXxPrpxRwUhv2BKi9Dnv/bnvO4N82juG9oRT
	raeAWvrovFHgWEMKSBFf7Y/7jhRd+/KMPE7ZjymiN7xVUoJLUpygpfeIpotONc6x+g3ZzOjqOStCn
	nhohG03vhxTYwNLYV8akbAe/868aG5ffZRvukA3yDDntCaaopUxNGwN4xsHBw5p/Eccdd5dds3MX4
	iaP9cbtePOB68tMdhiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdVS-00000004A4b-16W3
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 23:23:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdVP-00000004A45-0sCT;
	Tue, 04 Jun 2024 23:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1875C61313;
	Tue,  4 Jun 2024 23:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E83C3277B;
	Tue,  4 Jun 2024 23:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717543429;
	bh=TcM91AOH5mARdOX+sC1EAXIn04cXXNDDk3iF8SmOPds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HLiPBDnKEroIafHmkKhjL6ZMtwQGyKIKNbO+TcKl/05kSJIwg0yO1zoMMQbmOFtv3
	 BPwiExtk5Je89Q0RCvCcP3KlX4Gh/9Y/96+4Th9xJSJREAr9tGTnYtD0hKHOUVm8i0
	 rjrBa1hjbTsB2cAxnsTkD0mIW0nAt1HupIBiC4A3ABFImA1myBc45JQ3fI68abpMiw
	 FrSRmzcAkYkvGQ9Cux3ZCT6BXB2Q07caU5VI5TY6DxiGtNCxTfI+3q8uT3jeG6ugDG
	 bMO4Zbad0NPDHHGrNKyQfl8QS8RH9L5uVpcBiiwcQRkGeBpZCcqKAFD5AbiCUxhYJc
	 Hrn3BtBW16vpg==
Date: Tue, 4 Jun 2024 18:23:47 -0500
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
	kernel@quicinc.com, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v8 16/17] PCI/pwrctl: add a PCI power control driver for
 power sequenced devices
Message-ID: <20240604232347.GA740032@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-16-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_162351_341574_AD3FBA53 
X-CRM114-Status: GOOD (  14.17  )
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

On Tue, May 28, 2024 at 09:03:24PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a PCI power control driver that's capable of correctly powering up
> devices using the power sequencing subsystem. The first users of this
> driver are the ath11k module on QCA6390 and ath12k on WCN7850.

Can you add a little detail here about what benefit we will see from
this driver?  E.g., something that doesn't work correctly now, but
will work with this driver?

> +static const struct of_device_id pci_pwrctl_pwrseq_of_match[] = {
> +	{
> +		/* ATH11K in QCA6390 package. */
> +		.compatible = "pci17cb,1101",
> +		.data = "wlan",
> +	},
> +	{
> +		/* ATH12K in WCN7850 package. */
> +		.compatible = "pci17cb,1107",
> +		.data = "wlan",
> +	},

IIUC, "pci17cb,1101" and "pci17cb,1107" exist partly so we can check
that a DTS conforms to the schema, e.g., a "pci17cb,1101" node
contains all the required regulators.  For that use, we obviously need
a very specific "compatible" string.

Is there any opportunity to add a more generic "compatible" string in
addition to those so this list doesn't have to be updated for every
PMU?  The .data here is "wlan" in both cases, and for this purpose, we
don't care whether it's "pci17cb,1101" or "pci17cb,1107".

