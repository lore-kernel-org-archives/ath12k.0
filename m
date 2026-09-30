Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA17ACA5FC7
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=; b=b30t3c7gx5AM4ySdCvo69pBo5n
	CLC1H1tYyal97Tqz+seIP7/zerrwrI+AZiU//H6IMjEh4+HrhslwwIAp57WKHqYgLMTYsIvLB8Jii
	cja0wA6stC0vdevEzK286wRfo0Br019D8lWvHZsdebMOkjBzyCmuQcHZ/LbKTOJPJld5XE2XKQzDf
	97LszS+VUnQ9avVcquFgtbHGyK+vGvUcrMhiUplWpFuwDX24anvlmYYwdmje4R6hn2VkjbnI+xuMo
	Fo/UDhPr0krK4OngyQEDJhH9ssGvNi7W9N/ZL5poIDVwJyRRSObR1SPInZgSEJty7ctw5XxHrQ6Uk
	Sy5aCreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvz5-00000006RhK-1i1Q;
	Wed, 30 Sep 2026 15:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvz3-00000006RgO-1FLW
	for ath12k@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=; b=YOSrRbc/oV9G8QOejvRM8Q06CL
	Rj8bTV9pbb1fz6oXH5f/Kub9uktPhznJKzkTpexdlYyBgScuDr7r6C7uVb8QMb06q2DJPy07+lDWp
	GU6MJUnb98Wz1qUulX17eJCMDTibRiM1fEmN1EcACsKSRsSejAGrlfD43dIF3t84GfKJYdsORXPgH
	G55tU7RI0SHYZ+VM9FM0UxlDy/YHpflLj5JkLSWet/6nTq3V+5qB4kKt/OOcDoPws3b12vet5AiQW
	SitYyfUzkE9l2v8rzsAqmGjuC7H5rR1oKyVrAUaie76XOInPvkRWRtj8sdCWqoARdYK0AArx4kBtt
	0W4EFKQg==;
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvz0-00000003yQQ-1MkN
	for ath12k@lists.infradead.org;
	Wed, 30 Sep 2026 15:12:36 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c3b639adbcso5291500b6e.1
        for <ath12k@lists.infradead.org>; Wed, 30 Sep 2026 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790781152; x=1791385952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=;
        b=gRcBsUL9GouC2ujqD/qZgC1OK+OQGZ+iUIrdncFg6hoQ4AcVhk9Hmj/pdq2yxrJmw2
         p+LPEP9Wi+3pMvsLer1Biu5ZBDVicvlZBEuuIJo2iRQr4Shq+Q7duJ5HnrdggJ6ZdZ2p
         el+yBuj+tOfn6et3g9BLKIDrExSKhrvtlZ2WduyZjk9YI4OZY4mtFOwPwp6TQVdzSMKO
         /icJH4qoHO7sddE0iAoklv4FBlVJJwCJgFGFJlH0FFUMoBWB0vfi9ckt0toQG3FJca0y
         /HhNDq+jSD8LpsrowgZCN9xUXGJMLCdiL0HfTYLFrvvyjTBbGkeFSA6aG9IZf7UkylkC
         vS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781152; x=1791385952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=;
        b=h9ihw+FaIUOkqE4ShK/vtiWPCdxTLI4Z9xKBrOQf9ClOxqb3gMxC14THc0N72tcmqN
         hZzU0kfCKvR0N7Vh+buROCswliYCi+k/NZU0eAIeOVfB/9hOXAbQmRH+nwJS1OowCnOy
         K2AjdCc+/h0pK701G3mQEJxEyJa8XxbHI4n7br3mN4JAbtAkjzXTe9x9zFkIpaoPWYsg
         Bj6QBiIGMPd5hSCU2NV0xVZ4eZULp/N3nOq4CEHErEb7QFWFoepfGLprsVPjYH0sWue3
         A3/rwDE6yNNYBdu71t/FsFsb7cnnBX9w63qlPyWtvGarADFRVL/Wmbx+ZZ18Sp0erd66
         XOWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmcRyrjpQ2KbnP++xQF7z9ka5WNwwUofdd03A0nLMkQ/Fgvxj3AQ1xVvN1S2Fvh7i8tlESoHw=@lists.infradead.org
X-Gm-Message-State: AFuF++kL9o3e2RuDZ1FZdwxqP+v3uHhLYuDQPhT8ltSQof//5d7w8IfI
	rr6qt+FapJhT8p3kg7bwbcd7ZEoOFupw83HvpzOPahopsOi3f9ABNLX2YhCk/FWYivU=
X-Gm-Gg: AYBFou3lxfKy58qFnW+a0KL9SMj7kAMO+890g3nlFgbYlZHsajgVOMm7JgJCxZ1kqcz
	UKD7uopeU0ow5jQWV8UJNAqDuI6q5xOq4Fr1xCFNP2qgegqOiYNmwEecEG5V3E/yYcVdaO1qh6i
	WkXd0foThu4b97LKnDa4GburapfMkGMiyxCkvKJsMY5qeMzxlaJUJg7ZppJjH0lcIpcg6XIQy2M
	/XJB+PiflyIhhN4n/dJMxOhI9WYwxPQkMwpe+a3Tk90uKp+sZgAlyY2MrHnnf1vh3EWwCzXUCy5
	stWpUGOdp640j8Sx2Tk45IWAqNsurQ1gJDfg8H+s1Tdk+R3GxTpQ6gmYfxiJn0hyXnd8emxbVDP
	+IrlOorzsx40Y6ucjV/Kh7tZ5XVBR2MFlKt/eicRaxLaEa6PgfpgGa9IKnAoWuHk/7mGQY34O4r
	r1idbqLfGdSdpHOCCHaRYwvXNBdsJbTV1JwGm12LriKgvB
X-Received: by 2002:a05:6808:23cd:b0:4d6:90d3:e187 with SMTP id 5614622812f47-4f1b9a4dd1fmr1463609b6e.48.1790781151901;
        Wed, 30 Sep 2026 08:12:31 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f1b61be7d8sm1076055b6e.17.2026.09.30.08.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:12:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBvyv-0000000BwZW-3H3V;
	Wed, 30 Sep 2026 12:12:29 -0300
Date: Wed, 30 Sep 2026 12:12:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org,
	johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
	skolothumtho@nvidia.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] vfio/pci: Add qcom-vfio-pci variant driver
Message-ID: <20260930151229.GR163130@ziepe.ca>
References: <20260930140833.576941-1-jtornosm@redhat.com>
 <20260930140833.576941-4-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930140833.576941-4-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161234_613524_C6C7D45A 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, Sep 30, 2026 at 04:08:29PM +0200, Jose Ignacio Tornos Martinez wrote:
> Add VFIO variant driver for Qualcomm PCIe devices that require
> MSI address passthrough for VM operation.
> 
> Qualcomm ath11k and ath12k WiFi devices have embedded interrupt
> controllers that require physical host MSI addresses programmed to
> device registers. In VMs, the driver only sees virtualized guest
> addresses, causing firmware initialization to fail.
> 
> This variant driver:
> 1. Caches physical host MSI values after allocation
> 2. Writes them to extended config space with magic signature "QMSI"
> 3. VM drivers discover and use these values automatically

You should probably explain a little be more here

1) Linux VM driver fills up the normal MSI-X table
2) HW has some non-MSI-X table registers
3) Linux VM driver pokes into the interrupt layer and extracts
   one of the MSX-X table entries addr/data pair
4) Linux VM driver now programs that copied addr/data pair into #2

This is, of course, all wrong. These days it should be using one of
our mechanisms to allow devices to have their own private MSI
registers.

I forget if this is the right way for PCI, but the driver can call

  platform_device_msi_init_and_alloc_irqs()

And directly program the MSI registers with their own special
interrupts vectors, no copying from MSI-X.

If the driver is fixed to work like this, as it should be, then it
fully breaks the scheme you propose here. That's not good.

The problem here is not really a qcom problem, and treating it as a
qcom quirk is why it keeps being stuck, IMHO.

The real issue is that this device MSI scheme does not work in VMs at
all. It does not work because the VM IRQ design requires the VM to
trap and modify all the MSI addr/data pairs at the register write.

The technically clean solution is to redo the VMMs so they don't
require that, ie use interrupt remapping so the VM's view of the
addr/data pair matches physical. That's super hard and will probably
never happen.

But! Now that we have these device MSI domains I wonder if there is
some half option to provide a hypercall so the device MSI domains can
call out to the hypervisor to get the true physical addr/data pair to
program?

This is fundamentally an irq layer issue in Linux, not a qcom one.

Jason

