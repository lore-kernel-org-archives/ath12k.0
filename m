Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A469BCA5FF0
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAKmTovVzb87d5A8hUeHQhkh9HG4yeL7dyz+l+PJrmo=; b=SAoXMpUcYsvB7TbXsjB3v3L5te
	UaPH5F10lXjGfXcAXGE5U0JBRhpZ7W80fkfDshW97F/eyl4Ua4diJ6R1wqozB3TBOWnKYtr8qNFTY
	Y9axxS8J10lcIraFX0cUFxHiO4ZirjgF7bp/fPR+h37mISgb6uGUzGWzForMBhKOtiVxQpQqZ9A5T
	bzybl5gwhSi23ZfSyQy+2rEBN8vepR+8A3VZ2VNJcHomths5RPV8rs9gHxN1O7W3uoLvrggIW/kET
	CnhIO1DvOxAZPC9B13Cygx5ONdGEWqDHAfJsQYuYiuaNFf2jyP1Hv/Q3KZ49wesph0jH91btQlA6r
	Rdh1nL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgS1-0000000GGNS-1TU7;
	Mon, 05 Oct 2026 11:01:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgRz-0000000GGMh-0rg6
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 11:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791198102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAKmTovVzb87d5A8hUeHQhkh9HG4yeL7dyz+l+PJrmo=;
	b=dogFo0VV2bbGgHz/vqwy25/dmQznuZnssBey5F68lhpvQuLoY1Tgto2t7H/R7ZGrwSxouC
	WjRS91aae0BZ5B8yJkBCh4nbPpqPcDfAWxy9JNMw+jTUiTFqlR8w96HRMk9gaigduzRTLv
	oQXuUTf/lwaSu5G8BvPUtZQMRHw9cgk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-uq9_KcWuNnGBqTT2Pu5KUw-1; Mon,
 05 Oct 2026 07:01:39 -0400
X-MC-Unique: uq9_KcWuNnGBqTT2Pu5KUw-1
X-Mimecast-MFC-AGG-ID: uq9_KcWuNnGBqTT2Pu5KUw_1791198096
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B6521801220;
	Mon,  5 Oct 2026 11:01:36 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A51F23001D2A;
	Mon,  5 Oct 2026 11:01:32 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	skolothumtho@nvidia.com,
	yishaih@nvidia.com
Subject: Re: [PATCH 3/7] vfio/pci: Add qcom-vfio-pci variant driver
Date: Mon,  5 Oct 2026 13:01:31 +0200
Message-ID: <20261005110131.84545-1-jtornosm@redhat.com>
In-Reply-To: <20261002171046.GA32083@ziepe.ca>
References: <20261002171046.GA32083@ziepe.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: QLkYru2kibrzOkGVjwaANhhVz3tVC5mtZXcYCeUfqoY_1791198096
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040143_313080_0AA2A425 
X-CRM114-Status: GOOD (  26.61  )
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

Hi Jason,

Thanks for the follow-up.

> It breaks because VFIO will only cache *actual* MSI-X table entries,
> it does not have visibility into anything that
> platform_device_msi_init_and_alloc_irqs()

You're right, the current hook is on SET_IRQS which is tied to standard
PCI MSI allocation. If the driver moved to device MSI domains, this specific
hook would stop working.

However, and I was referring to this, the variant driver is a
self-contained module, it doesn't prevent anyone from moving
ath11k/ath12k to device MSI domains. If that work happens, the
variant driver can be adapted to hook the new allocation path, or
replaced entirely.

> The only reason this works for you at all is because the driver
> hackily copies the vectors from the real MSI-X table so it can look in
> the "cache" to find their true physical versions.
>
> Which is my general objection, I would like to see the driver to use
> platform_device_msi_init_and_alloc_irqs() and don't want to get stuck
> unable to do that because it would break this.

I understand the concern, but I haven't seen any active work on
moving ath11k/ath12k to device MSI domains, and the VM problem would
remain exactly the same after that move (as you acknowledged). It would
mean waiting for a refactoring that has no active work or timeline yet,
while users remain without a working solution.

> Yes, but it does actually solve the problem in all its forms..

From my research, there is currently no existing work on device
MSI domain virtualization in KVM. Building it would require
coordinated changes across multiple subsystems (KVM, QEMU, VFIO,
IRQ core, guest drivers, arch code) and several maintainer trees,
and there is no KVM hypercall that bridges to VFIO, so the
architecture would need to be designed from scratch.

In the meantime, the variant driver provides an immediate solution
using an established kernel pattern, for users with deployed hardware.
It can coexist and be replaced when a generic mechanism arrives.

That said, I'm open to restructuring the current approach as a more
generic VFIO mechanism for exposing host-side device metadata to VM
guests, where MSI address caching would be one quirk type rather than
a Qualcomm-specific driver. This way the framework would be reusable
for any device with similar needs. Would that direction be more
acceptable as an intermediate step?

> Everyone else seems to know this stuff doesn't work for
> virtualization and doesn't try to do something like that.

The firmware is what it is, and the hardware is deployed. The kernel
regularly supports devices with non-ideal firmware designs through
quirks and device-specific drivers, and this is what I am trying to
do with the VFIO variant driver pattern (as it was previously done
for other drivers).

> Why do people care so much about this? I always thought it was a bit
> odd?

WiFi passthrough to VMs is useful for network function virtualization,
security isolation (running the wireless stack in a separate VM),
edge computing, and development/testing environments. These are real
use cases with real users who have this hardware deployed today.
Qualcomm wireless cards are widely deployed, perform well, and could be
actively used in these scenarios.

Thanks

Best regards
Jose Ignacio


