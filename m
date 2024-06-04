Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF21C27C52
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fTxZKo59VuhSEl2atqCiUwr/W4JZ8eAUaCauJcbzZ18=; b=z0fwgRPMxulcjI
	kd0Gf3xgMocp/L0GNecB+VlUM7byBhMSHfSdw2oxefVb1tIfh8iM6vQkix2SqCHoPO9PGFOyjLwQW
	Jxz4vGQMKzX1pwMcZX27xHhFxKhKe17FDzcz+Ysn9V45vu94ejgcikRcPI/GtHPgWebBe4R2szC3r
	JqPwdTI9iHOlBH8Fb9jQDJFiwAblH4mqJVyTCo2CegYyIW7AZWmgq3HH9Q+pENX8HowGiuaoTj3sO
	N9K44Cw2LgBaFAApkqZ1MhFxtOVVd2+jaYTTqz1M5HKEzCnrio+oSbEqF1oLtxfEOGKCY7xDXobBV
	8gsaVCv8YnNZQT/s4LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYLF-00000003O3z-0ptR
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 17:53:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYLB-00000003O3B-2N5v;
	Tue, 04 Jun 2024 17:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8994613F7;
	Tue,  4 Jun 2024 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DFAC2BBFC;
	Tue,  4 Jun 2024 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717523576;
	bh=Hqqr9yw/DX0Mf6mIuq2bE9GcOEl92STqqaD9QVg7U3M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Pv7WYyK7Hiq+yltDhy7NyOgEtjKRjY5Ej2YyO02NzMaZOtQRZQpA7vFcOXpQimV9I
	 F9aOGaZLP5RX+2C1osztVl33qlRA2Ji5DTxA8vZ2/aLutg2fMuE0ISpEANn5R/aDox
	 alnSOFX4Vnt1BIVb0GJD1ICdnJYQKzSl1YSA9Bb5tSsh349vXSupVQFPggj3oHCAkr
	 EOXKkMAQwPht04HvLVa6Xt0tW9QMWXLKGmKN46xJ1JLEmisA3NxfxWFb3lkyd52KaA
	 Jb9quboEAhH9pThmE/C1yYV6hshYQBD27cnnWIZ0UfjecuG4NtGJjC6x2iyMitct0E
	 10JusfzF1w0Ow==
Date: Tue, 4 Jun 2024 12:52:54 -0500
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
Subject: Re: [PATCH v8 11/17] power: pwrseq: add a driver for the PMU module
 on the QCom WCN chipsets
Message-ID: <20240604175254.GA733438@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-11-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_105257_802047_063AE26F 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, May 28, 2024 at 09:03:19PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This adds the power sequencing driver for the PMU modules present on the
> Qualcomm WCN Bluetooth and Wifi chipsets. It uses the pwrseq subsystem
> and knows how to match the sequencer to the consumer device by verifying
> the relevant properties and DT layout.

> +config POWER_SEQUENCING_QCOM_WCN
> +	tristate "Qualcomm WCN family PMU driver"
> +	default m if ARCH_QCOM
> +	help
> +	  Say Y here to enable the power sequencing driver for Qualcomm
> +	  WCN Bluetooth/WLAN chipsets.
> +
> +	  Typically, a package from the Qualcomm WCN family contains the BT
> +	  and WLAN modules whose power is controlled by the PMU module. As the
> +	  former two share the power-up sequence which is executed by the PMU,
> +	  this driver is needed for correct power control.

"needed for correct power control" suggests that this fixes an
existing problem, and I assume everybody with this kind of device
wants this, and they will see some benefit from enabling it.  But it's
not clear what that user-visible benefit is.  Could be useful both
here and in commit log.

> +struct pwrseq_qcom_wcn_pdata {
> +	const char *const *vregs;
> +	size_t num_vregs;
> +	unsigned int pwup_delay_msec;
> +	unsigned int gpio_enable_delay;

Seems like it'd be nice to have a hint about the units of
gpio_enable_delay (apparently ms) and last_gpio_enable (apparently
jiffies)?  Maybe even use the same units for both, but I'm sure you
have a reason for this.

> +static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
> +				 struct device *dev)
> +{
> +	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
> +	struct device_node *dev_node = dev->of_node;
> +
> +	/*
> +	 * The PMU supplies power to the Bluetooth and WLAN modules. both

s/both/Both/

