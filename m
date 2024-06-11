Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A961DC27C79
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 22:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EBqNYT9tMpq8aw05jSRDe2me24mEsp4wLcEycUytSPA=; b=MAvKuu4TYc8GLsiM9L0yXTbV2o
	BAXv4+OO3dWJZBzdhaI/hUgHWepNZj+Djea+BKLFPzj17hFrVrSjKUmKXNV5tcOzZv1hPVa4BpezG
	1lkC2OtoEQMAoyhh0Hcjtj0UFoHas+rRNLzUYNwdEhlanY00qfMDlvkgisqE9TYdEPXXuIDM1r/2v
	75tYnYk1POq64DPTgoM8a++f+pcvYgAxEU9Tl/M9gPKdbRvIcP0ZIrhXQIp7kkWhRLDi9GL1nZ5NM
	eKcuQVT7ebqqHFSVN4ifB3yg5bgTfh1BHGpUiwpaw2d1cUGJ2HBqNvM/1K2YCj3V2NgkwpE2q63uG
	xkuhKGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAQ1-0000000ASJf-1Qhs
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 22:56:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAPx-0000000ASIB-3wDe;
	Tue, 11 Jun 2024 22:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CFEDCCE137D;
	Tue, 11 Jun 2024 22:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A8FC3277B;
	Tue, 11 Jun 2024 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718146599;
	bh=fTTmy82roNHgpHAIircnr4I4sFYZNjPs3kLCDpI1ztE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oEPS95VptOeiB1acpH1GE+ebcl2vKNI2aPXlHGGBxogzerUzv4LasE1Sssg9UskoH
	 Qv9gl1YoLzDIQwKXyBI5DlmQ+dpttpicGgKUvOEGB3T/lEHAqSeIu1QXPqA8PxIUW9
	 QzvHTaFml4rhw/Tlq/vwsedAxaGIJ1bU3YFamBZOXnU2FQkuSIQeGvt9dT4nTT2PWF
	 lm3I2QJF5yF1JzzgpPPF7lLZc7hdrmIKc80kYyol9cZn1s350kzC5uXwQeDFy1Y08M
	 yyH3EtpAkyLHcpCwIwGFD928yyBIQ1VNrIW2n5jc0Bux851JF/QN8iqD6vXw4y1VIG
	 ihNf06lncAslw==
Date: Tue, 11 Jun 2024 17:56:37 -0500
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
Subject: Re: [PATCH v8 15/17] PCI/pwrctl: add PCI power control core code
Message-ID: <20240611225637.GA1005953@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McKD=ZhGzRUeLezT3oKfreDWQeKBvuousf8zsQjJb1QMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_155642_367827_5E9A9FA0 
X-CRM114-Status: GOOD (  18.10  )
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

On Wed, Jun 05, 2024 at 08:05:06PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 5, 2024 at 7:58 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, May 28, 2024 at 09:03:23PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Some PCI devices must be powered-on before they can be detected on the
> > > bus. Introduce a simple framework reusing the existing PCI OF
> > > infrastructure.
> > >
> > > The way this works is: a DT node representing a PCI device connected to
> > > the port can be matched against its power control platform driver. If
> > > the match succeeds, the driver is responsible for powering-up the device
> > > and calling pcie_pwrctl_device_set_ready() which will trigger a PCI bus
> >
> > s/pcie_pwrctl_device_set_ready/pci_pwrctl_device_set_ready/
> >
> 
> Ah that's a leftover from when it was PCIe specific. Thanks.

With that typo fixed and s/add PCI/Add/ in subject,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> > > rescan as well as subscribe to PCI bus notifications.
> > >
> > > When the device is detected and created, we'll make it consume the same
> > > DT node that the platform device did. When the device is bound, we'll
> > > create a device link between it and the parent power control device.

