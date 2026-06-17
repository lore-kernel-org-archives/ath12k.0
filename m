Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E60ECD98E4
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gcy/EaAZ/pJ1qaeNy3eriBsvPASZl+M9Jg5BLs22CGA=; b=eiOTRVQdmNiuLP1EkQmyfXhoJD
	vILr9hpDkfcZGGhYulsrnwzJHR35TBkG8H403/oChphB18kNmOJ0ZAdwTf9roEN+COyfCjBQFhnEh
	x5q4qnBWSx1C7VTll/R6nOnOmTMLpGsAK/OIQSaxqlrtQ+PGYbutgUNPh0XuvsN18niQDcc3aR8kc
	e9VqJK4/FiqQzHcGvMEzP4KjdAkV4P+NG4/pfFWekEJnWZAYUyErqATtGGkXv8WZ0flpACUikHQFv
	N7BNOJEj38vc39qnsNEdh1NorIBWI/a/G+WKedPn8shoUBoQshOW+XgC1L+pDdlsY7yu99ACrTdeF
	DJltXTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrYn-0000000HUXp-47mU;
	Wed, 17 Jun 2026 14:48:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrYl-0000000HUXE-43KN;
	Wed, 17 Jun 2026 14:48:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1ABFB4347E;
	Wed, 17 Jun 2026 14:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5594E1F000E9;
	Wed, 17 Jun 2026 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781707687;
	bh=Gcy/EaAZ/pJ1qaeNy3eriBsvPASZl+M9Jg5BLs22CGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nu+IipjnxThO/KXMaqoJz6F2xpNAmVTnfMkZOXjRxKvtE9gFfupf6rXNAaomX60F7
	 5nzo4GUh9tYxRjp9dd/C1YD2YXCNY5LUu8MgaMgguQjZmvM+Xt4nfXrOx7yHjSeeEj
	 r3gZwjJoS6LOoxyRXfqN9wqhvMUbOfCV0/PaCD39EpH1uSrLOG3nOj0rWJUBgt8+n7
	 L14QWpOIDCM0BZUKXGWTFDTF5rIxJJ/baN22qjH4ar4zyODmDnXsrqtOdJNsZv61z/
	 nwlpwt55agoKXxja49kLE8IQbgyxHjfyoSPGBkIi2xTUwHdmqxbgwzxNlsDgPw/6Rk
	 A+2Q4Avt+3JUw==
Date: Wed, 17 Jun 2026 16:47:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org, 
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <6nivb5fncfd5dwqkzlxwhtgbsiqvifazcbgpsgukp44iib45ke@65qpwgrvtkgn>
References: <20260612142638.1243895-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612142638.1243895-1-jtornosm@redhat.com>
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

On Fri, Jun 12, 2026 at 04:26:38PM +0200, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - WCN6855 WiFi card (17cb:1103): Normal VM operation works fine, including
>   clean shutdown/reboot. However, when the VM terminates uncleanly
>   (crash, force-off), VFIO attempts to reset the device before it can
>   be assigned to another VM. Without a working reset method, the device
>   remains in an undefined state, preventing reuse.
> 
> - WCN7850 WiFi card (17cb:1107): Same behavior as WCN6855.
> 
> - SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
>   on first VM assignment without proper reset capability.
> 
> Add device-specific reset entries for these Qualcomm devices using D3hot
> power cycling. Testing shows that despite advertising NoSoftRst+, D3hot
> transition provides sufficient reset for VFIO reuse, particularly after
> unexpected VM termination. While not a complete reset (BARs preserved),
> it provides the only viable reset mechanism for these devices.
> 

I checked internally within Qcom and I was told that these PCIe devices retain
the context during D3Hot to D0 transition and that's why they advertise
No_Soft_Reset.

The partial reset behavior you are seeing might be due to firmware handling the
transition as an error state. All these devices use MHI bus and when the MHI
state doesn't match the PCIe device state, then the firmware will treat it as an
error and will try to torn down resources. This could be the reason why you are
seeing partial reset.

Nevertheless, these devices do not support any form of Soft Reset and only way
to reset them would be by doing D3Cold. But that depends on platform support
though. So it would be inaccurate/wrong to assume that these devices support
Soft Reset during D3Hot to D0 transition.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

