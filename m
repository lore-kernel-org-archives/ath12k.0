Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80374C44539
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9beRhF2jjJvFTZCtXWpywAw5rE3wHDEFmzE5t7fnUw=; b=GoQrZGot0lkPO9yX44Xn14dynN
	lgGIwRta+S7e5tnpNfrBivxh8gvDDr52Q1cSrj28QJgvHp5IRC4sxpGRs2v5RXEUQioXJ/AdXICct
	7xLinE4CVbpYY6OjcIOYJrrTfoLcu+IQZLWnZmPFFyPuj4csuAb6/CD19JUBiqxicBLY6fTvi6mo7
	3up2iIiEjxehkbpE4azWRiV9YoYVlw9rJHYSlAE2Pq4N852L5skyEBmUnMA4SDvEugDIyJz0Pp5bm
	oQoqYxSQwayJri1e6JC/mQm5YWwAKxkKta9dtJ/2vnwNOg9NG35fmNSbjG09n9zDgbmJVLU4817sJ
	xIDvGTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVsy-0000000BjTJ-3lsA;
	Wed, 22 Jul 2026 12:17:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVsx-0000000BjSv-23x4;
	Wed, 22 Jul 2026 12:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCA92600AB;
	Wed, 22 Jul 2026 12:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA1B1F000E9;
	Wed, 22 Jul 2026 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722634;
	bh=T9beRhF2jjJvFTZCtXWpywAw5rE3wHDEFmzE5t7fnUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IcsfQpRJs3YyBJzWUl/mvMT93RQ+AQOaw5S7BCqTxuIzAca8N+vOiQ/LeUOWs0haJ
	 6KYGyMBWt7MLsUJ9kEvvdXPCsoYFWAH/9YekTepHuPEcfse7rKv0Oe0lmY+NIw6guW
	 OfkCxTlNFKfuoJsjsQTqD757G6G3wNRD2sXMKaYcNJcZUrMxFYw0VqftePis0GmZDJ
	 H1su9VHuHVfhyrIVQa4Z3CQtZkfR59j18cbSdVgaKFN3qm1JH3s2zzjiVsUu3YPJKp
	 RmMgKeb0DB4BCmsP+zGknbmheuwekrcgAWiGP6qfXzexK3CfOc6uoBWy2z9D+9hiTs
	 8vgfgNkPiaCww==
Date: Wed, 22 Jul 2026 14:17:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, jjohnson@kernel.org, linux-pci@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <d35ftvppjovbyb3va5ok3yy2l5ng2jliqidqa4szp7hrgalrf4@rbhj2ehrff3l>
References: <20260721082933.7B5A41F000E9@smtp.kernel.org>
 <20260722112813.33153-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722112813.33153-1-jtornosm@redhat.com>
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

On Wed, Jul 22, 2026 at 01:28:13PM +0200, Jose Ignacio Tornos Martinez wrote:
> > [Severity: High]
> > Will this sequence of ioread32 flush reads and
> > read_poll_timeout trigger Master Aborts on architectures
> > with strict error handling?
> >
> > The SoC global reset explicitly drops the device PCIe link.
> > Performing ioread32 flush reads immediately after asserting
> > the reset, and then actively polling the disconnected MMIO
> > space with read_poll_timeout while the link recovers, can
> > result in Unsupported Request errors.
> >
> > On strict platforms like ARM64 or x86 servers with APEI/GHES
> > Firmware First error handling, these can escalate to fatal
> > Uncorrectable Errors and cause a host kernel panic when a
> > guest VM exits.
> >
> > Should this avoid MMIO flush reads during these reset
> > sequences and instead use fixed delays to safely bridge the
> > link-down period?
> 
> The SoC global reset at 0x3008 does not immediately drop the
> PCIe link. The flush reads execute while the device is still
> responsive - the actual reset takes effect during the
> subsequent msleep. The ath11k/ath12k drivers perform the same
> register accesses during this reset sequence, including on
> ARM64 Qualcomm platforms, without issues.
> 

Yes, Qcom devices supporting SoC reset have a mechanism to keep the PCIe link
alive (in L0/L1) when the reset gets triggered in the device. So the register
access is available throughout the reset cycle.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

