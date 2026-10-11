Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA245CA9EC7
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=; b=adaPH8fZBMNFRrUzXbEJ0I3alA
	oNDxkS++FaVz9oAJBhHx2PvdpMaegdKNDQDeNEAlJ7aV8S8ivSdDaRIEpkv5IQaDKMKiqFvDFsob/
	pK0aOEl3Vm9tZ02Wv7W7LA7YJxU3jxavjpM051YqN+3IS1EXJp2OWejyLhFHVgd1etvXHUG7F7zty
	rE7M8OSipghqLOhi9f36aT514QJDm2SXqoCQGwtqhO/nLubMAV6pgfQtawVF3NiSlf93mpM+qEIL0
	/aj9vdk8bU3kqywhiG0NgSFihMYJOYa1ceAOxtLTtR/0vj6C64CszxR3H7hFZ0DF2vnKPv9HJKlLb
	Nria9TsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtZ4-000000093MN-2KiS;
	Sun, 11 Oct 2026 13:26:10 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtYv-000000093K6-1adv
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 13:26:04 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5338f65913dso13523471cf.2
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791725160; x=1792329960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=OaK0V2IqNv4RJxv8tMAQih6lBd55XVZGWr+a+P8Rt6VGn2M+O3OUi/ravhEQAVlVlE
         U0vl60fPWz0NOWZXUdQXFw2dbRK9lfpDu8AOCUHXLfU7BR4YiWaNR/6con5FB/q8cSvL
         4HFN9DOWOwe1H5S89AnGZ+lSxlcLG7g0TRYaNFg4QL8nIUDX2qhk7mHfgWyr9TeJf9PG
         WOnDcPrZ1kHozF5D9GEEZfj71fXywp6zxxTVLuFaloWDNUONfgnOPdXaYVnwHkqYmnQB
         6GKhJJiipl95H5K+Uq59hbwmSXC/VFcxX5clRlvfT+uhMu6x9AOqdjat+0yNXx7mUW78
         /shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725160; x=1792329960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=OXUM+QPp+A+pjc5X36PdKpcZejHZXitZ4CAfU6I+8CGaZvkTPI+osLig/FBUrugfGm
         gzgpl4yRyVqAsCLKU6d3TVmGZ4nu3zSSk5oiOmE1WwCSUo/QweZDKJguQyG1YfNyma4f
         71M56f2UMdLn1WgTY/TPVH7+aL4ZoctsmvzMa7GAo6v0s+kWdR3rhmuerH+virkNI//a
         JFb8TCC6JZBjqr11JewTY7pp3gYhgjSncxCIVGWHns87ZIC18pXaAHpV9majSmwUjHk+
         9/9HeM8rmkyetfF9w89PZbZzS15oA6Nz7cF1ZYgtNRCnAdzm+pbNt/J7a0MIymX/vmXe
         0uLg==
X-Forwarded-Encrypted: i=1; AKwUvBx6m5ZpGIEQ9zlReKCWJ3+vDL9SCOgl0h6oC55fLJ0U30ZRzEcN9N/LhDbVByxIJPZl06xQc04=@lists.infradead.org
X-Gm-Message-State: AFq9FYKusHHoLKiZG076q5Py+RA0T25WAADIUwloxdKMTEAOy3+2LJPL
	kotLBDLjmdDXqzy5OHiHqvUaaEeX6j9znpXuMBk1RQFLgMQKwsgP7JDOtViIxPEWqdU=
X-Gm-Gg: AYBFou34ETYFjRR+ywZynPI5+vgW+G/zk+J1HtbCDTrnXzpkarR7nfMipBNWs+16ZXx
	p9hRta1oyyOhgKyGcsh1dAVz2YRlX9NGh+TGapRm825gFMOQuIIGayE51oi32tTg+HCeqQq9d0G
	epXsfxeLejZW/dt32vxOGZv8JAua0wmnGTnvgvdAFlUptI+5gK4qBejacCp/xv414Fel0BxKWK5
	g4Aknt5YDEreqvyaamhPQZEGfQNp2arhOq4XO76K2nSen8C2Zt8uwSkKLPrvkRaL1fujAGTRzIy
	rpI53jUyeFSKRfmkakoLiTFfKey3ERxs+1CtfOu11iQosVQWWg6PWSHjO7CBS3bHHRRariTLzPT
	miQZaDiFuw92L/YVXLbWLPdsGh8tRX9xH7+FJeMrFCwgoDScMgqY3qpwwzDp13SALP9c+B6DdgU
	Lh+NNcE+eo1U5sc5QDgLFajeygQyUI0saGICp4wb19h3EEpEPCHG1F5TGqnyuOAVqsfEAQ/eF2i
	zLnDcOkQAxmV9Ssa7mNMV3J3NeuO/zRKdMsnYt/p0VJtwyBbnR3dfREGvmrZpYW3J14
X-Received: by 2002:a05:622a:e111:10b0:535:a5f9:752e with SMTP id d75a77b69052e-535a5f9789bmr75892511cf.77.1791725159958;
        Sun, 11 Oct 2026 06:25:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e80353sm71122656d6.1.2026.10.11.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:25:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFtYs-00000003FEK-1U1k;
	Sun, 11 Oct 2026 10:25:58 -0300
Date: Sun, 11 Oct 2026 10:25:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, bhelgaas@google.com, jjohnson@kernel.org,
	johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
	skolothumtho@nvidia.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261011132558.GD14213@ziepe.ca>
References: <20260930140833.576941-1-jtornosm@redhat.com>
 <20261011075425.516927-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011075425.516927-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_062601_574151_2C1D7500 
X-CRM114-Status: UNSURE (   9.64  )
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

On Sun, Oct 11, 2026 at 09:54:25AM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi,
> 
> Since no further feedback was received after the last discussion,
> I proceeded with v2 addressing review findings (Sashiko):
> https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/
> 
> I remain open to suggestions and happy to iterate further if needed
> to get this acceptable.

IMHO this is not OK, building a new crazy hypervisor interface that
only works with the broken driver design we have today is not OK. This
is not some "quirk", it is a permanent new ABI between VMM and kernel
that has real compatibility implications.

Go tell an AI to convert it to
platform_device_msi_init_and_alloc_irqs() and then solve for that so
at least we are not getting trapped into a completely broken ABI by
all the hacks here.

The whole "MSI Caching" concept is fully wrong to be an ABI to a VM.

Jason

