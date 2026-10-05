Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B99CA5FFE
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ACSssUGKie/5eVZn/j7clwXvC4MTmISK/f7AzHTT/3A=; b=qAqkm2a6gWCeY6
	WqN8nSiAv1QlcoxCn6KoaKFZsbEW3cwc73sqHDg89liY/vhZfTgbOLLh5g6vTL0UatKxsBHGiVMjE
	BT+fsMOUp/yqkuiQ4eEV/FUKJ3DdhIGNh0mvtCzua66fdFA5PALXQ3bNAhEHmRbzCyvVS0vfWSkF8
	5/pyFz1TChEzWNINJVXjv+oYaKSaB1mKMaO8b3onl0fAtWFHg3m54iLmwYvv4mGtdlaVJrbwtnDkG
	AWHDyXkbmkNGMv3MNqLFQqi0aIUE3m8lgwmpc2rn9cbw0rD4/i5VFakk9faU9ZSFjomIR0ykG98Y3
	h1MSj2F3FxE1BDkladxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDll4-0000000GqvB-0eTb;
	Mon, 05 Oct 2026 16:41:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDll2-0000000Gqul-2LBy;
	Mon, 05 Oct 2026 16:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75C5860200;
	Mon,  5 Oct 2026 16:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E841F000FF;
	Mon,  5 Oct 2026 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791218503;
	bh=ACSssUGKie/5eVZn/j7clwXvC4MTmISK/f7AzHTT/3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=hmEars6ew5+YbrRD+7XLCHSA9cc1J3iBUUrqtEQ7cEbqkGUIC2ch7qbL8VmiPjUQT
	 XlduUY3JUBTpbVMnZx+7LLH9rETL1YIlR+PwqK2+x1iNA60y3QJ4+sYhvWVFhBKm0i
	 MEkiWKRHfQVXfTW82ZNrJ2R3AfKVdKuHLEdmL7FMpxQVwIkoWT8vPUEOnPLnPCHTjw
	 8Pv+aQmncE1OfyyDaAqYzTbv96s/SCAZh/SviCUvZCmltKHAA0rm0ksnofutqgH2SX
	 cMokhwVuYDjTOFpUKbQSD8k1vKLUskl58yfzGvTyHX+hRbLxdtTqLglJgZEw8KmJZq
	 DwXOhjqIy9FZQ==
Date: Mon, 5 Oct 2026 11:41:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, mani@kernel.org,
	jjohnson@kernel.org, linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 0/2] PCI: Add device-specific reset for Qualcomm
 devices
Message-ID: <20261005164141.GA574887@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005105436.83962-1-jtornosm@redhat.com>
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

On Mon, Oct 05, 2026 at 12:54:34PM +0200, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855, WCN7850 WLAN; SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> Standard reset methods were already disabled for these devices by commit
> 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi,
> SDX62/SDX65 modems") because they were not working (quirk_no_bus_reset).
> 
> VFIO attempts to reset devices on every reassignment:
> - For the listed modems, without a proper reset capability, these devices
> never successfully initialize even on first VM assignment.
> - For the listed WLAN devices, without a working reset method, the attempt
> fails. On clean VM shutdown, the guest driver properly deinitializes the
> device via .shutdown/.remove callbacks, leaving it in a usable state despite
> the failed reset. However, on unclean VM termination (crash, force-off), the
> guest driver callbacks are not triggered, the device remains in an undefined
> state (DMA active, interrupts enabled, etc.), and without a working reset it
> cannot be reused.
> 
> Add device-specific reset methods using BAR-space hardware reset registers
> that exist in these devices:
> 
>   Patch 1: SDX62/SDX65 modem reset via MHI SoC reset
>   Patch 2: WCN6855/WCN7850 WLAN reset via SoC global reset
> 
> These are true hardware reset mechanisms (not power management or firmware
> error recovery), providing proper device reset for VFIO scenarios, allowing
> to enforce isolation between successive passthrough users.
> 
> Testing shows stable operation over 100+ VM crash/reset cycles. Device-
> specific reset is position #1 in the reset hierarchy, so these devices
> will use hardware reset as their primary reset method.
> 
> Jose Ignacio Tornos Martinez (2):
>   PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
>   PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN
> 
>  drivers/pci/quirks.c | 116 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)

Applied to pci/reset for v7.4, thanks!

> ---
> v15: Address Bjorn Helgaas feedback:
>   - Explain the relationship with 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
>     WCN6855/WCN7850 WiFi, SDX62/SDX65 modems") and previous status.
>   - No code changes from v14, only commit message clarifications (Mani's
>     Reviewed-by and Alex's Acked-by retained)
> v14: https://lore.kernel.org/all/20260917071651.14174-1-jtornosm@redhat.com/
> 
> --
> 2.54.0
> 

