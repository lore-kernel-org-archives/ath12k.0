Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2343EC27C79
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WeWY5EYSyRTtVxqmHVyRh0DLGsJX6o+nhbwxLU4W1Ys=; b=i2t55X5Ao1AqWi
	+dHEjs5DI4L26zExtD0i/Wr7XuYf53rVJolUP5kxmQEamug6NsV3L8ZnbrYyLiBKYQLp4JfrRueP2
	ZFIWSboyo5NaS7YwcU07PLTMQdIKlte+2+fCRXcncpVFAJA9rEfhBju8lQVc4Qjzv5X4l0mRsEjTG
	NfJBlzXtVOB4fca0dFyAUMtcbfei6e0H0gPyplYWi4qSQmrzNlqI+jmLgZc2cl4/xniTVM2irCVLO
	9x1De7IZSclYec9Nbmgw6m0EVPMRzdF3JYiV0AtqICfGtyxxNeywPdqYprcWDtBcYOtrd04VN0oYj
	XJZK85oK/iaEcVa4pXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAPU-0000000AS8q-3QiT
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 22:56:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAPR-0000000AS7T-0spw;
	Tue, 11 Jun 2024 22:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADF41CE137D;
	Tue, 11 Jun 2024 22:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F39C2BD10;
	Tue, 11 Jun 2024 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718146565;
	bh=e+yEenAa0DBKBAH1JDI7Art8IiR8vko+Q5ejQxwgRgI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OvG5hfJPF+ZFKDXc8gWwryQhBayku2+B8u+fC9uzzr7nfGli565gerUMIqyvQ8xhh
	 D4McVRpS+rqeHTb+xEsXa+HUgAq8qWuH5JZ5NSjWP7kvetD0rpu0Eg7lwgZjjjabw6
	 YMZ2z4sY4N3Cit6Po1fzGzJevdjLZcddYtqShxtwAvYzkFXaSqWQvdzP+omZjjDbV6
	 Azwun9MqTlLj0iNAPVD8FT3Hyy/bzNe0znsk1fSHnNkJAPz/YqmS9BV+Rau6GhdoP8
	 yqy9SCNAiPsSajUpCwQJgO23bSjU7ufbAu1nLTbf2Yx6jE7ZVJMqvjdJq9dKEFqxc/
	 PCWkwc/rUH6BQ==
Date: Tue, 11 Jun 2024 17:56:03 -0500
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
Subject: Re: [PATCH v8 13/17] PCI/pwrctl: reuse the OF node for power
 controlled devices
Message-ID: <20240611225603.GA1005810@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-13-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_155609_637652_8DD19AFA 
X-CRM114-Status: GOOD (  19.62  )
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

On Tue, May 28, 2024 at 09:03:21PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With PCI power control we deal with two struct device objects bound to
> two different drivers but consuming the same OF node. We must not bind
> the pinctrl twice. To that end: before setting the OF node of the newly
> instantiated PCI device, check if a platform device consuming the same
> OF node doesn't already exist on the platform bus and - if so - mark the
> PCI device as reusing the OF node.
> 
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With s/reuse/Reuse/ in subject to match history,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Would be good to get Rob's ack as well.

> ---
>  drivers/pci/of.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 51e3dd0ea5ab..b908fe1ae951 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -6,6 +6,7 @@
>   */
>  #define pr_fmt(fmt)	"PCI: OF: " fmt
>  
> +#include <linux/cleanup.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
> @@ -13,6 +14,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
> +#include <linux/platform_device.h>
>  #include "pci.h"
>  
>  #ifdef CONFIG_PCI
> @@ -25,16 +27,20 @@
>   */
>  int pci_set_of_node(struct pci_dev *dev)
>  {
> -	struct device_node *node;
> -
>  	if (!dev->bus->dev.of_node)
>  		return 0;
>  
> -	node = of_pci_find_child_device(dev->bus->dev.of_node, dev->devfn);
> +	struct device_node *node __free(device_node) =
> +		of_pci_find_child_device(dev->bus->dev.of_node, dev->devfn);
>  	if (!node)
>  		return 0;
>  
> -	device_set_node(&dev->dev, of_fwnode_handle(node));
> +	struct device *pdev __free(put_device) =
> +		bus_find_device_by_of_node(&platform_bus_type, node);
> +	if (pdev)
> +		dev->bus->dev.of_node_reused = true;
> +
> +	device_set_node(&dev->dev, of_fwnode_handle(no_free_ptr(node)));
>  	return 0;
>  }
>  
> 
> -- 
> 2.43.0
> 

