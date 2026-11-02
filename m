Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332F606A337
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BkKmugMF;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N3JtG6cI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CJbWBTkQs4ODLU2SOn+Ys6gLyVwtafR2qeYrx5uFG3c=; b=BkKmugMFxywd8JoGBGVhadoCAt
	O9lbVTbb1Cxy1KLD6pD3bsGUrMLdAMTJX6PNLMPNvu1wd8O8yEhX1AWa0Hm1KGSkcBDs/VpbZQKNM
	F+8NIScmhv3F585q4bgTo3jhw40sneYOHRKSjyDyXFWbU9a2+FPvACC8pu97dCgMlYpzhnPkIzrM5
	FJiNZ+4YRxGrjHUni9BZ8+emEtgYfK+MxzFwcRpjTMOIqLIBnDhxDCphfoCbXpSIWpexGUrWRgkOn
	bSZ/CCP5lAtXU94BQkPnQY6IxkOOCRat8Ob/pOQbcyq7A8LIGVH6EQTH20UHuLKcn+IJaHPMn+14h
	Vgwkorpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmlG-0000000FmbT-0LAO;
	Mon, 02 Nov 2026 07:47:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmlC-0000000Fma8-0jEE
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 07:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793605635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJbWBTkQs4ODLU2SOn+Ys6gLyVwtafR2qeYrx5uFG3c=;
	b=N3JtG6cIc380sBg058YlQ12WEJQo63Q55YO+K0Wb9YnKyhELyqQdyCJ2mSjjj3Cb7laVlt
	VkUhOcCNSvBuOJV7Mof2lhZmCvaLE7xF3p04qWhApNjH0Mw14BUVlqERnOCN/X3Bhu1efy
	fj7go+3dfYeVclFAqoSZVzpjE8xf4Vs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-FF4iaEjJOfe4njgd1da7Zw-1; Mon,
 02 Nov 2026 02:47:11 -0500
X-MC-Unique: FF4iaEjJOfe4njgd1da7Zw-1
X-Mimecast-MFC-AGG-ID: FF4iaEjJOfe4njgd1da7Zw_1793605629
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8AA331964CD0;
	Mon,  2 Nov 2026 07:47:06 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF1751956087;
	Mon,  2 Nov 2026 07:46:58 +0000 (UTC)
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
	kwilczynski@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	pbonzini@redhat.com,
	robh@kernel.org,
	seanjc@google.com,
	vkuznets@redhat.com
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Date: Mon,  2 Nov 2026 08:46:57 +0100
Message-ID: <20261102074657.27715-1-jtornosm@redhat.com>
In-Reply-To: <20261029165845.GQ1685504@ziepe.ca>
References: <20261029165845.GQ1685504@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: _2ozKQjKEame3iiYvAjQNPsfmnCX1CKeAdGvAYpxVPs_1793605629
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_234718_282423_58ACE60A 
X-CRM114-Status: GOOD (  18.63  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This is not quite what I suggested, this still relies on the host
> setting up the msi using the trapped MSI emulation, which is the
> primary hack..
>
> Was it too hard to make this an 'allocate msi' operation?

I tried this approach as a simpler mechanism to just read the necessary
info from the host side. Ok, I will explore a true allocate operation
for the next version.

> Yet here it is called alloc?

> And this isn't alloc, it is some query..

You are right, the naming was misleading. The implementation was
a query, not an allocation.

> I feel like VFIO shouldn't be involved here, for the purpose of MSI
> all we need is to inform KVM what struct pci_device * is at a vBDF and
> then KVM can do the interrupt bits. Maybe this is already happening?

> Nothing should use vendor/device ID either, it should all be drive on
> vBDF.

I appreciate the hint. I will explore the vBDF-based approach
without VFIO in the MSI path.

> I probably would not have selected this, it is why I suggested
> virtio-msi or something that could be optional and seperate from the
> core KVM guest ABI.
>
> But maybe there is interest in doing it this way?

Since there was no feedback from KVM maintainers, I will try to
follow your guidance more closely for the next version.

Thank you for your help

Best regards
Jose Ignacio


