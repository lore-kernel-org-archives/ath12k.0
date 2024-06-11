Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E315BC27C65
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 22:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cYHTv+h+1UsSvEa4km5zLBd2NSwT44Y7Dxj9evrCJ/4=; b=kwkwD+VJKvLBsv
	KIrZaWkC0gT3gCyPfsjKeyBgYuTZqqAVEoRIBJQejP6ZP6W6logvBJnVLUQDeVGyUPXzKpPXU7msP
	HaBldPbV4psBZqvTBAtep3yZbMAHJu5sqot8xtMCDgbE+5JCEzYvhgnTb5fQXkwFgWi0u4gpfapPL
	GYpyG12/x2/wv3gJj43ta3ZRb5chgyq2y1hMUCeFSzCqu9WOdqlVSvHyqQPwyLxdrUNpPuQu+JFwO
	9uYFpoDpcLGIFCId9y0aLd7dN4nFUX+ZXCW80jCtvYFSCesbOUOCzKsi8ed0fLfq+m4wdjMAK/uzX
	cOptuVC18YCr9yZOj36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAP6-0000000AS1Y-2GZk
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 22:55:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHAP2-0000000ARzS-3NfM;
	Tue, 11 Jun 2024 22:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D47ED60E88;
	Tue, 11 Jun 2024 22:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0C9C2BD10;
	Tue, 11 Jun 2024 22:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718146543;
	bh=tfmwzXhu9BMvZdNucjHAIFq8O+nZOSTOqKttExZG0P0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A7pxdhgDNwl0CRAVasMm9Q18XFML4ebWwMMtwSRB078ntHxIYEfNrp+4t38McKEym
	 9Mbu/3WwIfhYbMrZlqu3YigWp9p6tLAcrQ8t8fNDVsrNom4keCoxM5P2uaoc3BisfH
	 Tv1NvrM/CehSzwVFu7gHEYo1MtWv8/9ofoqWcwm7ZwZWCaMHSTgriGAA44d3oC9/l7
	 xfGAWXlG8hZSKHlh+CZUcvtc3MgVBnyhPwXZyg9L3FuzoLkKbLX0T6yyh1Iyx8D2xA
	 1r/7dxQE3RbzF2CaEURzoqsdakZBbpuAmP7pxyBtCIwFhtSV5lL1BUgyKr8wESuNwO
	 493hSgD34nxaw==
Date: Tue, 11 Jun 2024 17:55:41 -0500
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
Subject: Re: [PATCH v8 12/17] PCI: hold the rescan mutex when scanning for
 the first time
Message-ID: <20240611225541.GA1005771@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-12-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_155544_917255_EFD0155E 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, May 28, 2024 at 09:03:20PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With the introduction of PCI device power control drivers that will be
> able to trigger the port rescan when probing, we need to hold the rescan
> mutex during the initial pci_host_probe() too or the two could get in
> each other's way.
> 
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With s/hold the/Hold the/ in subject to match history,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/probe.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 8e696e547565..604fc96b1098 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -3072,7 +3072,9 @@ int pci_host_probe(struct pci_host_bridge *bridge)
>  	struct pci_bus *bus, *child;
>  	int ret;
>  
> +	pci_lock_rescan_remove();
>  	ret = pci_scan_root_bus_bridge(bridge);
> +	pci_unlock_rescan_remove();
>  	if (ret < 0) {
>  		dev_err(bridge->dev.parent, "Scanning root bridge failed");
>  		return ret;
> 
> -- 
> 2.43.0
> 

