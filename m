Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E1DC982D2
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=thptWvz4OVCspoERVZ766KnGJOYRQWL/l9e0wco26zk=; b=xgcQrOBP9FCTfy
	Ex4aMJrFOEFn870jwT5+Vxsl1ZgSa0yYVZMSYl7iSqNuFoDWfiH9+ku4KSFQOeR0b9OT3+nPvohyV
	+YDU9PcAgiuE6XhrjVwrdo0HVOdEJaM98DAdn62xQcsVOYSlztTs8HyNVdTWBr3kBzKtP4B3ITaVv
	KdJzYMIUo9re5LQuOGoMhKlgqjDuQGhWoLxIAYUOEm37uLXscYU2N5QnB6kBNH//U6bWA7v0673m2
	eDcnnqr4bgTfgEfArJySg5SsBB4cGWNAp0xh+wNm2Ki+52wb2TeeUq33meoYfMCK7o9sXbtCGJ9T8
	H8cFRsg2Kpqm92XqiW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FZM-0000000C2WD-49gZ;
	Thu, 17 Sep 2026 17:06:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FZM-0000000C2Vu-0BlT;
	Thu, 17 Sep 2026 17:06:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA8A340281;
	Thu, 17 Sep 2026 17:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0DF1F00893;
	Thu, 17 Sep 2026 17:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789664803;
	bh=thptWvz4OVCspoERVZ766KnGJOYRQWL/l9e0wco26zk=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=gHGHTvtJa8ZqJi+mpWrczyhU8V7irl79da3wZEEQ6mBacP/g+M0kfS2fcL7yoNgmW
	 wNbOs/ErLHpxxyG/ePxupieQ8pcFwj+9LCqG1SSeymQERPmWKLpt6j76+Vb5QeJf27
	 EHi+hhIFnIHHgxTb0d25dU9hYPQzKhumhLBNtBMH0xxhpX5izYp+6IT/+CB7mLy0KC
	 z9G1HMag6QDCmRNw6fsMzhju2O/5PR08BA2F9tBmVDWn5TjqITo4/5A204EBIPZ5/n
	 9UU90blkT6hDsIw34wj5yJ0NPKIIjsjDoYTPyqzxhKmdom91s6/7B7jw48MpPqGeNh
	 SmQGtSb+a/rDA==
Date: Thu, 17 Sep 2026 12:06:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <20260917170642.GA1026691@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917065918.13357-1-jtornosm@redhat.com>
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

On Thu, Sep 17, 2026 at 08:59:18AM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Bjorn,
> 
> Thanks for the review.
> 
> > I guess you are saying that some kind of reset *does* work
> > fine in normal, clean VM termination?  If reset works fine
> > for normal VM termination but not for VM crash, do we have
> > any idea why they are different?
>
> It depends on the device:
> 
> - For the modems (SDX62/SDX65), without a proper reset
>   capability, these devices never successfully initialize
>   even on first VM assignment.
> 
> - For the WLAN devices (WCN6855/WCN7850), the reset fails
>   in both cases, but on clean VM shutdown the guest driver's
>   .shutdown/.remove callbacks properly deinitialize the device
>   (stop DMA, disable interrupts, etc.), so it ends up in a
>   known-good state even without a successful reset. On unclean
>   termination (crash, force-off), the guest driver callbacks
>   never run, the device stays in an undefined state, and
>   without a working reset it cannot be reused.

Ah, so this depends on the previous VM tenant to clean up after itself
instead of the host kernel enforcing the isolation?

That seems important to mention and potentially unacceptable to
tenants if an issue in the tenant's kernel may cause their data to be
leaked to the next user of the device.

> I will try to clarify this better in the commit messages for v14.
> 
> > Since these basically copy code from other drivers, is there
> > an opportunity to remove it from those drivers and use this
> > instead?
>
> Yes, that could be a follow-up after this lands.

Sounds good.

