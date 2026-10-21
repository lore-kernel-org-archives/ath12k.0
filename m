Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9F606A31B
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hW01k3Ia;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAuON3Sh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkX0db4m40DGwuOP5Wxaheolr6mMnrhzfPJ3IEdQt68=; b=hW01k3IayMDxT7OEBZ0S9n5/4I
	VzHdAZhVvOsAaEqWRxSfawcNO2zrbc+i7PJsiJ2G4GIgDTlVJRosNdVT33uwLvsUspNnLYTVTxn91
	sn0E+zj44nlkqLOSEKlIrT67j6bOaKWhB7DHEhWZhZR6uyDzAo3o3zcnlL5QNSWPS8o9noX8WUS4L
	P0Zs7Oqc4xviOo3ESuIYMsvFvXsAQmTnyzG20fVqosQkv6VcIGLYHi6NTqW03hTW2Lnuqk+ratbUV
	CqPBCdKxwSquL1+RDh1YxkwS3Ol+3TTwaVeFpMXRH48iHJi+p7qDf3i/QpWKDVk89EHCI0Aur3IjH
	065NKb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOZ5-0000000B4ht-0VHR;
	Wed, 21 Oct 2026 05:08:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOZ3-0000000B4hL-1lSZ
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 05:08:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C95760098;
	Wed, 21 Oct 2026 05:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D111F000CE;
	Wed, 21 Oct 2026 05:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792559316;
	bh=QkX0db4m40DGwuOP5Wxaheolr6mMnrhzfPJ3IEdQt68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cAuON3ShW2wBA2gcnkl7H4wIdlmQH0gfJo8zFiGjopvTEQF0v4/2jKDmQmvvU1Ywu
	 gGc5fVTJoSUrA733BvZsMnAM+Lmt4LpCW4OHoCNVM/OQPw90v/9c2F25Dn1xNN7fSl
	 Gfk7ZjX+bttaxZlGhiEojpJlrc1udHDC8i9mMnAiGqpP40GhW5ih+HLMRNPqUbRoVz
	 XHL2EkDcQaIXl6GQxM1mXGmYo/TUnPtruTkrCnYc2qtzWu6iTAC3Mfp5n9PPmvjPiu
	 KbkMzgXVHCYRGXVrQ8bUnnHxss7C06HvmWHzTHhYHnUz303empsFAUUkr4iQQ7GjSa
	 JonhXcFMqk7NA==
Date: Wed, 21 Oct 2026 07:08:19 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Yingying Tang <yingying.tang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <5ygj4wgwd7tvuma4f4cmvc46cw2lhabmruk2nxeh44iktn3owg@cxzsmik52fh2>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+ Jeff

On Tue, Oct 20, 2026 at 04:53:03PM +0800, Shawn Guo wrote:
> + linux-arm-msm
> 
> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> > For WCN7850, MAC buffer ring size is updated to 2048 in
> > 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> > to increase peak throughput.
> > 
> > But during the RX process, a phenomenon can still be observed where
> > the throughput drops by about 30% from its peak value and then recovers,
> > and this behavior repeats during RX.
> > 
> > After increasing MAC buffer ring size to 4096, the data rate drop has
> > gone.
> > 
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> > 
> > Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> FYI, in case someone else runs into this: with this change (merged in
> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> working with the older firmware that Debian trixie still ships
> (firmware-atheros 20250410-2):
> 
>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Probe and firmware download succeed, but every WMI command times out
> once the interface is brought up:
> 
>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> 
> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> reverting it on v7.3 brings WiFi back with the old firmware.
> 
> Unmodified v7.3 works fine after updating to the current linux-firmware
> image:
> 
>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> On Debian trixie that one is available from trixie-backports
> (firmware-atheros 20260916-1~bpo13+1).
> 
> So nothing needs fixing on the driver side. I'm just leaving this here
> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> kernel upgrade knows to update the firmware first.
> 

Thanks Shawn for reporting this regression!

Jeff, this is unacceptable in two grounds:

1. Driver change *must not* break userspace, in this case the old firmware. The
driver must maintain backwards compatibility even if the data rate drops with
the old firmware. This is the promise, kernel strives to keep up from the
start.

2. The offending patch didn't mention anything about the firmware
incompatibility, which is too bad. How does the users be notified of needing a
firmware update?

So I'd suggest reverting this commit and come up with a new change that
preserves the backwards compatibility with the old firmware while fixing the
throughput issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

