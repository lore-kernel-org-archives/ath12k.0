Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9F6CD98D6
	for <ath12k@archiver.kernel.org>; Mon, 15 Jun 2026 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VlL+ld2zIBTp0Uov30L/svoU5nNy1BEIdafxq1tBX4=; b=Ob9739H70xBXT2PYpNXR4fj+aK
	VLUstpCW7wJaUZEW+hd3PP6VCwimM+3C7Ggk7ZxsV5iIbk/uMp8exxPlhlQWePvoygG+jE4bbwTo4
	+pIhz8Bx93STvkAubaP0kROOtc+WUeoMuqSE34OnN8R97vFDQAWvEuJiQkaEtwrWR8z/nXVDy33js
	5BT+vWmE1zslv1XXqsyQULYLI0W9hSlMpBJNFxCNb1i4xoSq7PYamr6J7avPus95DoA9FfVnlmDzB
	Y4GHmE9WfL4HZQ399G2xdzNrJzTyOHjMqvNeC1x2W7UPLcNQEf7PrWgwaIK6bM+rJcfvgDR8JWkJ6
	hncff89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1m1-0000000Dn9s-2xcE;
	Mon, 15 Jun 2026 07:30:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1lz-0000000Dn98-3PAs
	for ath12k@lists.infradead.org;
	Mon, 15 Jun 2026 07:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781508617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VlL+ld2zIBTp0Uov30L/svoU5nNy1BEIdafxq1tBX4=;
	b=L48kJV4Eyys6gGSKcYyYFpA8Qh69WHG+L+QA4mZS1tu6JsZIynW1eIeCKHkXUx4hrIIixE
	dgtFKjX560lzhit6kowxKjZbqI0bS23gniA2GaEfBNzs7Bz/0cGtuYw9wTwXztKeU6TGUP
	uqjFqTx0BZiUpc78EX2JoTXVPB0DF8I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-uW9eYI_rOsCmZdj76mUXtw-1; Mon,
 15 Jun 2026 03:30:12 -0400
X-MC-Unique: uW9eYI_rOsCmZdj76mUXtw-1
X-Mimecast-MFC-AGG-ID: uW9eYI_rOsCmZdj76mUXtw_1781508610
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5529B19560BB;
	Mon, 15 Jun 2026 07:30:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.61])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF602180056E;
	Mon, 15 Jun 2026 07:30:03 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: helgaas@kernel.org,
	alex@shazbot.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Date: Mon, 15 Jun 2026 09:30:01 +0200
Message-ID: <20260615073001.401330-1-jtornosm@redhat.com>
In-Reply-To: <20260612151749.GA603817@bhelgaas>
References: <20260612151749.GA603817@bhelgaas>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: HbmNIU1JH-WMCRCxlMAWHVXbzkknJkN7jqsxgDHGDck_1781508610
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_003019_928901_247A2124 
X-CRM114-Status: GOOD (  24.32  )
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

Hi Bjorn and Alex,

Bjorn's questions:

> I guess "bus reset" here refers to Secondary Bus Reset being asserted
> by the bridge upstream from these devices?  Seems a bit surprising if
> that doesn't work.  Or is it just that we can't use SBR because there
> are multiple devices below that bridge?

Yes, SBR. The devices I tested are alone on their bus (single device under
bridge), so it's a device-specific issue, not a topology problem. The
quirk_no_bus_reset patch addresses this for v7.2.

> I don't know enough about VFIO, but I sort of expected that VFIO would
> reset devices between reassignment regardless of how a VM terminates.
> I guess that's not true?

VFIO does attempt reset on every reassignment. Without a working reset method,
the attempt fails and the device remains in undefined state. With this quirk,
D3hot successfully resets the device allowing reassignment.

> Since the device claims to preserve internal state across D3hot->D0
> (and it sounds like at least BARs *are* preserved), is this a
> potential leak of state between VMs?  To play devil's advocate, how do
> we convince a customer that none of their data is ever leaked to a
> subsequent tenant using this device?

This is a valid concern. Testing shows device internals are reset despite
NoSoftRst+ (command register cleared, requires driver reinitialization),
though BARs are preserved. Given these devices have no other reset method,
this provides the only viable mechanism for VFIO reuse. We cannot improve
beyond what D3hot provides - the quirk works because despite advertising
NoSoftRst+, D3hot does clear sufficient internal state for clean
reinitialization.

> If we think this is a viable method, it seems like we should use
> pci_pm_reset(), which takes care of IOMMU and device readiness issues.
>
> We would have to change pci_pm_reset() to deal with the fact that
> PCI_PM_CTRL_NO_SOFT_RESET seems wrong on these devices.  Maybe we
> could cache PCI_PM_CTRL_NO_SOFT_RESET in pci_pm_init(), then override
> it with quirks for these devices?

I explored a similar idea in v2 (PCI_DEV_FLAGS_FORCE_PM_RESET to bypass
NoSoftRst+):
https://lore.kernel.org/linux-pci/20260508145153.717641-2-jtornosm@redhat.com/
(Note: v2 used driver names ath11k/ath12k instead of device-specific names
WCN6855/WCN7850, which Jeff Johnson later commented on in v7 feedback.)

Alex provided guidance on both approaches and indicated device-specific reset
seemed more appropriate here:

"Device specific resets are made for this scenario. Look at
pci_dev_specific_reset() and pci_dev_reset_methods[]. The supporting
evidence that this performs a worthwhile reset is still a bit weak, but
heuristically it seems better than nothing, which is what we're left
with otherwise. Reset via D3hot for a device that does not expose
NoSoftRst- is not something we should enable or endorse for any common
use case."

The device-specific approach keeps this quirk isolated to proven device IDs.
But I can revisit the pm quirk approach if you both prefer it.

Alex's suggestion:

> It would be better to extract the core of pci_pm_reset() to a
> pci_do_pm_reset() function that's used both here and by the
> pci_pm_reset() function.

Good point about the code duplication. In v9 I kept it as a self-contained
quirk to avoid modifying pci_pm_reset() and touching core pci.c code, trying
to minimize the change footprint. But I agree extracting a helper function
would be cleaner.

Once we confirm the preferred approach (device-specific vs pm quirk per
Bjorn's question above), I'll send v10 with the appropriate implementation
including the helper function if we proceed with the device-specific approach.

Thanks

Best regards
Jose Ignacio


