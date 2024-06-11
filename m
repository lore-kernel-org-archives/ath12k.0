Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE1DC27C65
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+0HvxGNPcKdmPw6ULIPR7se3Rz0WHKWAjOyRDct1v6k=; b=uOfjBIU0ujpYn1
	elcSm9KrQ4QGudVN+oWPpGzWy3vh//VS+B82IkRTnPdk7upsaE/vZVZbZ4f1umTjzz8QMs5l6pxSG
	pP2NoMw9ggctmc8f1i4atrYLiSvEPL0qmx1EcFJOmeA6WxH171HV0FMI735Hp/x/FWJxN7tUAHMwy
	6exU5P5kUm4WmisYgrNj0QVRUoAmDijIflq8TLgWh57w4hBFVsH5tBkpnFGB5g/ZkSyQSx0nYZ+G9
	n/6WRT9YmwQm836J7KZzdclTYkeqFvxzdtOHKORrtTRamr6hwkhYt9YEe/j6c7MzaoRFPsgNIeVF0
	8pKd5LHOn+zn+NLAlv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAPs-0000000ASGP-2eCv
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 22:56:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAPp-0000000ASER-1OwE;
	Tue, 11 Jun 2024 22:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2BEA1CE0CEF;
	Tue, 11 Jun 2024 22:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36142C2BD10;
	Tue, 11 Jun 2024 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718146590;
	bh=qnNWTWk0UrgyhvUjk0j87kljyjnbkKARlOWolh0T5tw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BA2Cs6I1BYbjUh7E1G9n4X7oIKQ+SDHio2B3ehBM9+FfN7UHRGYljUoeXk41tmjBk
	 ker4TmT/a0IKRWDRVXOeVZYzqwh7Ka/WsKnyALVe4mTtvhMF2FdPI8j7ZrBsR1M3LO
	 Nx+NkX7AcMkh7smKLa6WylB9wPJg059VPN84hJmPVZRHjxubr6oMsd6Rp4xPSruIDM
	 MGAJdOSGevzLQR/qcHvMxEjoSlTbS9pFhBP6hjAgFnuXPw2WZtX7d3MWBySJG3l08c
	 MOWQrcBACAq9HTplPxxxswYW+awMscqOryBFh0i2sGUoSLae74mqPiFXFJt2OnypTU
	 edN/9Z3wjCixA==
Date: Tue, 11 Jun 2024 17:56:28 -0500
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
Subject: Re: [PATCH v8 14/17] PCI/pwrctl: create platform devices for child
 OF nodes of the port node
Message-ID: <20240611225628.GA1005877@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-14-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_155633_781181_05367CA8 
X-CRM114-Status: GOOD (  22.21  )
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

On Tue, May 28, 2024 at 09:03:22PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In preparation for introducing PCI device power control - a set of
> library functions that will allow powering-up of PCI devices before
> they're detected on the PCI bus - we need to populate the devices
> defined on the device-tree.
> 
> We are reusing the platform bus as it provides us with all the
> infrastructure we need to match the pwrctl drivers against the
> compatibles from OF nodes.
> 
> These platform devices will be probed by the driver core and bound to
> the PCI pwrctl drivers we'll introduce later.
> 
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With s/create/Create/ in subject,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/bus.c    | 9 +++++++++
>  drivers/pci/remove.c | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> index 826b5016a101..3e3517567721 100644
> --- a/drivers/pci/bus.c
> +++ b/drivers/pci/bus.c
> @@ -12,6 +12,7 @@
>  #include <linux/errno.h>
>  #include <linux/ioport.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/proc_fs.h>
>  #include <linux/slab.h>
>  
> @@ -354,6 +355,14 @@ void pci_bus_add_device(struct pci_dev *dev)
>  		pci_warn(dev, "device attach failed (%d)\n", retval);
>  
>  	pci_dev_assign_added(dev, true);
> +
> +	if (pci_is_bridge(dev)) {
> +		retval = of_platform_populate(dev->dev.of_node, NULL, NULL,
> +					      &dev->dev);
> +		if (retval)
> +			pci_err(dev, "failed to populate child OF nodes (%d)\n",
> +				retval);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(pci_bus_add_device);
>  
> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> index d749ea8250d6..910387e5bdbf 100644
> --- a/drivers/pci/remove.c
> +++ b/drivers/pci/remove.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/pci.h>
>  #include <linux/module.h>
> +#include <linux/of_platform.h>
>  #include "pci.h"
>  
>  static void pci_free_resources(struct pci_dev *dev)
> @@ -18,7 +19,7 @@ static void pci_stop_dev(struct pci_dev *dev)
>  	pci_pme_active(dev, false);
>  
>  	if (pci_dev_is_added(dev)) {
> -
> +		of_platform_depopulate(&dev->dev);
>  		device_release_driver(&dev->dev);
>  		pci_proc_detach_device(dev);
>  		pci_remove_sysfs_dev_files(dev);
> 
> -- 
> 2.43.0
> 

