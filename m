Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F73C27C54
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gcbyaKuYMl6yQmGCT3WQRQ+BCc69GlwnZD/6ez4bFn0=; b=rTxLyevRJkLb6n
	drYcBsXTf53cBdjMEdVe9qMI7rpDM0EH7sCbCfOn4k8gfshyQ1jAC2ld+OipMNwBbV/oUy4GcIRia
	Vg3eQX9z5vn5lpRb3z/wa9U7bpskGvlEU/oLpkL75RGARkg1UNvorXotULJPWZkqrnHupXbK/sm7Q
	uOmsyoeOKoTXTO0W/Zaemgu0XHYAOjsLh3/8zlbhc4V6pCS8gY0o4s2xOuaSH7rySpt96RrMmoNx5
	jCRSUH5EUQI6/ezph5pF9NgO1fJ4tOg8ZvM8w6JvcTtpdM0IDvlvzW3r7BW90QNhE2iykTBqT+7mx
	6znHtPJV/MnGmyznu38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEg9z-00000004QhD-1rQh
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 02:13:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEg9v-00000004QgJ-4AG5;
	Wed, 05 Jun 2024 02:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B2E4CE1132;
	Wed,  5 Jun 2024 02:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A75CC2BBFC;
	Wed,  5 Jun 2024 02:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717553628;
	bh=xaa7l1NfnZNvrR1Y11Ee4Az8s1RlaLtd+KTNnjfYqG8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Q03Z8iZEAuY+QpAQHiYOYDag25Z34ERDCiAYcBkiKQdauJxt5+QKHpAgoc8HAD8IF
	 dD/nXOcaTCagWd/1XZXh8gzjyqR5OtebZ2lNNGU9a+SoyRVKfJ8cVBxiUwNwPHruKT
	 Q+7IugR43QmE4UrgtdS2LdWlyfCnrzCizKvWzFyTLqqsNVW+kwhZwehbx7zvfljAU4
	 ZLr/yL5pnsAh//MMHcnQnrkXaDnxnxbKvBEQBoxbvQqgiAaaO73CgbyeBAc5Xx80mk
	 1EilMt/qEfeXAjM0hBw1bsbOcS2glyUzslXYlj0apDfdpLZUeP/3hoKSjIgQcVlyqZ
	 84+Oi2MPblg7w==
Date: Tue, 4 Jun 2024 21:13:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20240605021346.GA746121@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpomPLQmQbW8w3_ms_NMKHoSPcqBa7f2OhNTTOUSdB+9Eg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_191352_439559_B4B711DE 
X-CRM114-Status: GOOD (  29.55  )
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

On Wed, Jun 05, 2024 at 02:34:52AM +0300, Dmitry Baryshkov wrote:
> On Wed, 5 Jun 2024 at 02:23, Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, May 28, 2024 at 09:03:24PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add a PCI power control driver that's capable of correctly powering up
> > > devices using the power sequencing subsystem. The first users of this
> > > driver are the ath11k module on QCA6390 and ath12k on WCN7850.

> > > +static const struct of_device_id pci_pwrctl_pwrseq_of_match[] = {
> > > +     {
> > > +             /* ATH11K in QCA6390 package. */
> > > +             .compatible = "pci17cb,1101",
> > > +             .data = "wlan",
> > > +     },
> > > +     {
> > > +             /* ATH12K in WCN7850 package. */
> > > +             .compatible = "pci17cb,1107",
> > > +             .data = "wlan",
> > > +     },
> >
> > IIUC, "pci17cb,1101" and "pci17cb,1107" exist partly so we can check
> > that a DTS conforms to the schema, e.g., a "pci17cb,1101" node
> > contains all the required regulators.  For that use, we obviously need
> > a very specific "compatible" string.
> >
> > Is there any opportunity to add a more generic "compatible" string in
> > addition to those so this list doesn't have to be updated for every
> > PMU?  The .data here is "wlan" in both cases, and for this purpose, we
> > don't care whether it's "pci17cb,1101" or "pci17cb,1107".
> 
> These two devices have different set of regulators and different
> requirements to power them on.

Right, but I don't think pci_pwrctl_pwrseq_probe() knows about those
different sets.  It basically looks like:

  pci_pwrctl_pwrseq_probe(struct platform_device *pdev)
  {
    struct pci_pwrctl_pwrseq_data *data;
    struct device *dev = &pdev->dev;

    data->pwrseq = devm_pwrseq_get(dev, of_device_get_match_data(dev));
    pwrseq_power_on(data->pwrseq);
    data->ctx.dev = dev;
    devm_pci_pwrctl_device_set_ready(dev, &data->ctx);
  }

I think of_device_get_match_data(dev) will return "wlan" for both
"pci17cb,1101" and "pci17cb,1107", so devm_pwrseq_get(),
pwrseq_power_on(), and devm_pci_pwrctl_device_set_ready() don't see
the distinction between them.

Of course, they also get "dev", so they can find the device-specifc
stuff that way, but I think that's on the drivers/power/sequencing/
side, not in this pci-pwrctl-pwrseq driver itself.

So what if there were a more generic "compatible" string, e.g., if the
DT contained something like this:

  wifi@0 {
    compatible = "pci17cb,1101", "wlan-pwrseq";
    ...
  }

and pci_pwrctl_pwrseq_of_match[] had this:

  { .compatible = "wlan-pwrseq", .data = "wlan", }

Wouldn't this pci-pwrctl-pwrseq driver work the same?  I'm not a DT
whiz, so likely I'm missing something, but it would be nice if we
didn't have to update this very generic-looking driver to add every
device that needs it.

Bjorn

