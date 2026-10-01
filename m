Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1068CA5FB3
	for <ath12k@archiver.kernel.org>; Thu,  1 Oct 2026 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Bmie9JTdC7GvOREgQKIaVbNDMTF41K5ZHDK/CLSZFA=; b=Bfj+F/zHVX2iZncyEeJD0Xx0Jm
	VM6VWzkiemCI+D5PYdHvD/ZTKdbtzpZXJyE2MJiyqgS/jZYcYFjEZRNHP/tMf2s5t7gVc7ee8rKqK
	m6CwRi7SJpoh7TUDTyIMouncx5bRufiGu6RlulaWl+I9v08RQRTdKgjEr+SBM6+5VCXBx2f1whY9t
	eesIogQxl6xmUdyiElzjIPWt6u+5MP1bUzzFz06dI31PpzdA9ZaA38io+mCrpoMAS26NjchIpMGUU
	ur6okB5Bc6F+Cm0LYNjQmrIMuw2JR43A5ud+gw8niGMvmBTlLCM4RNw3AOuJMZszzz2T7BqzL6I1p
	dCjVz6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB5H-00000007ytw-3q7v;
	Thu, 01 Oct 2026 07:20:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB5E-00000007ysH-3OcC
	for ath12k@lists.infradead.org;
	Thu, 01 Oct 2026 07:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790839199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Bmie9JTdC7GvOREgQKIaVbNDMTF41K5ZHDK/CLSZFA=;
	b=W71QLNoP8PRCn9eZga+q3//ONdcHsXDwsnVqsxGa7bLoJxam8tivlN4eevqkVwJuDdOFhq
	n7dpvC6r280Hxo6FIquAMaiVYCU9TV9/+f967wmggNbDHPvVtWf5A5YNqBOp+TD7cnzspX
	jnzdMJnKXSFcfl8/1zZ+01GbqfpDjRs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-3KcQEm1XMWOnIp_ceFAq8Q-1; Thu,
 01 Oct 2026 03:19:55 -0400
X-MC-Unique: 3KcQEm1XMWOnIp_ceFAq8Q-1
X-Mimecast-MFC-AGG-ID: 3KcQEm1XMWOnIp_ceFAq8Q_1790839193
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 502561953977;
	Thu,  1 Oct 2026 07:19:52 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59D061956089;
	Thu,  1 Oct 2026 07:19:47 +0000 (UTC)
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
Date: Thu,  1 Oct 2026 09:19:45 +0200
Message-ID: <20261001071945.83116-1-jtornosm@redhat.com>
In-Reply-To: <20260930151229.GR163130@ziepe.ca>
References: <20260930151229.GR163130@ziepe.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: khBOAYi2FKciuoqr3c2Cbb8AGbJQfctCxLtc6ZlZCwc_1790839193
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_002000_933636_521FB963 
X-CRM114-Status: GOOD (  17.48  )
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

Thank you for the review.

You're right that the commit message should better explain the current
driver behavior. The flow today is:

1. Linux allocates MSI-X vectors (standard PCI MSI-X table)
2. The Qualcomm firmware has its own interrupt controller with
   private registers that need to be programmed with MSI addr/data
3. The ath11k/ath12k driver extracts the addr/data from the MSI
   descriptor and programs the firmware's private registers
4. In a VM, the driver only sees virtual (IOVA) addr/data, but
   the firmware's private writes bypass the IOMMU, so they need
   the physical host values

I'll improve the commit message.

Regarding platform_device_msi_init_and_alloc_irqs(), I agree that
moving the driver to device MSI domains would be cleaner on the
driver side. However, even with that change, I think the VM problem
remains exactly the same: the device MSI domain in the VM would
allocate virtual addr/data pairs, and the firmware's private interrupt
controller still needs the physical host values. The problem is not
how the driver allocates MSI vectors, but that the firmware writes
to its own registers bypassing the IOMMU.

Also, the VFIO variant driver scheme would not fully break if the
driver moved to device MSI domains. The variant driver caches host
MSI values from the MSI descriptor, regardless of the allocation
method. The hook point may need adaptation, but the fundamental
approach (host caches physical values, VM reads them) remains valid.

Regarding the hypercall idea for device MSI domains, I think that
would be an interesting direction worth exploring as a generic
solution, but that's a multi-subsystem effort that will take time to
design and land. If there is any existing work or design discussion
in this direction, I'd be happy to look into it and contribute.
In the meantime, the VFIO variant driver provides an immediate path
for users with deployed hardware, using an established kernel
pattern. For now, it could coexist and be replaced later on when
everything is ready.

I completely agree that this could theoretically affect any device
with private MSI registers. However, in practice, I'm only aware of
this specific behavior in Qualcomm ath11k/ath12k firmware, where the
device's interrupt controller requires the host physical MSI
addresses to be programmed directly. I haven't seen this in other
devices, which is why I think a device-specific approach seems
appropriate, and the VFIO variant driver pattern fits well for this,
following the same pattern as mlx5-vfio-pci and nvgrace-gpu for
their own device-specific needs. I'd be happy to incorporate any
ideas or suggestions to improve the approach, make it acceptable,
and allow finally to use these devices from VMs.

It's also worth noting that the PCI reset support for these devices
has already landed in linux-next (commit 290153d46d1a "PCI: Add
device-specific reset for Qualcomm devices") [1], solving the
device reset path for VFIO passthrough. This MSI series is the
remaining piece, with both in place, these Qualcomm WiFi devices
would be fully operational in VMs for the first time.

[1] https://lore.kernel.org/all/20260721081301.205374-1-jtornosm@redhat.com/

Thanks

Best regards
Jose Ignacio


