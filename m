Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A728606A322
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nKhjDpA;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UwIl5Shz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=; b=2nKhjDpANLOX5tTrlA/gQiqhrK
	Qys8PKVIfgHKYRvbkqLT1aL7mSULhAUv0SdLh4UUS/69eMhfiTBnCTxCGUk0UhNMsF9I0JA7uMUqm
	XBBKJsw/xHpNLIdeRtFhDH4GBGkPpwA+XEtrM1B45AoJlmUFIcwITqrenMDNoRBqzdwZM1I0XE6DS
	YECACFj8QzsM4BkG6EMe1vRYIJcWejdVmY5zFnlywLXR3/xKbP+5KViLTC4wikK4adM+Jv2vdog8M
	inJMhqckeTWQkqwwGqXexsyjOGMgX++MgeXieJtM5fB52cIrVPLziryLrtWtL+mCcQvqgw7qAUlt8
	zTG7FegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTSo-00000009uS5-3bCy;
	Thu, 29 Oct 2026 16:58:54 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTSj-00000009uPV-0pGD
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:58:53 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-93f1e5d7450so198164985a.2
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793293127; x=1793897927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
        b=UwIl5ShzOGS5JSEuaSEPajc53tD/YAenvAczr4mn7MvaMurwAXQuaY7OXkW8QzHP7C
         20n0DlruLDUqlfiEVPtMzfBCG2usQlsnCWKsgShz/bCPdWkYbUTab3hzqdwjdOWA4W3V
         +qBN0nHmOzajK/jgLYKMyVLdgS/GuYNh6aXrLqpUBCmFWsQPPeSiGvLdocSrCO4KDwTX
         EDA0ToArubk51/BByfKP6q/Xnk1+WjkMB8iibeNQ+Si+NJi10L9+8WDlISX27b2ehpal
         orks30mQh7tlQzrGJGUPAWIS6iXRVWPnHJSrQ6y9M1AniiIgKvN5CsgpoTaNRmLxX+Cr
         TVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293127; x=1793897927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
        b=fIio/l1gINjjWeF+Opg2Fp2M2k1UlmVGQ2kqQPixjB1EE2IcAHcMoj3jQ9Mi/4pRMr
         t7Fx4adWuOQYwpis9X0eA5kmAgOcfav1JgSpAUcmn8bJDw4hDaMi4S2o9EiUKdVT4cjW
         N8IPPt8pKLeF0WRNhsjDGVbypgsZD2hsden+zBx3v/vhO7soa2gwnk2V9kyD04X1EmZG
         n2ztoyM8/LbFEhYLM6dFLg/a+c9TOOHC4bQiOj1LiTrIIJhJ5qQ8nXcGiO2c/zm+JTZ/
         A6RejpBS3yJ2T39d/vwGK0tXpPs+a22fcqFmvUQMZq/G3HUmHiE3Sa+ybA0rN9Gr9jCP
         +0RA==
X-Forwarded-Encrypted: i=1; AKwUvBxwbyDKBZywiSTPL/DKtsoh1W6pAX30+mRwtz+DnxF0O1BeOzYOhAY0jCXY8AF/7Q1wDLER6/4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKfkuMglCTeqeKbSlNh4ZaN/2pp6aHgLVELCNeC7hVlcgw2yR0w
	qhe4qWhOaJWiya55wXT4AdGT88H+YHVGlGG340W9ArucQG8DQaTSC3AW+7Ig7R0Ubbk=
X-Gm-Gg: AYBFou1pEjgcjnF5d2ndzsi/u+olrxTzjEWq+ScCJ/0Pb6hMZVw/gyFtO8KDnmJLAbm
	COVJpXfMFBX8WIa8llUJZPUSYkkz6fLNJBMgjcQXOvSMlbYI9gM8nzMujWKHEhQ2YVvj4+cITDr
	sI9v3aD/VNrtbk4VNcD8qzMdtfqUe3CIVDkB7s6Rg/uNRGCOaXsRKNGPaG+Hot62JYbfFzP4VrF
	O6gvys6D3cyYZjqnf+2NUQwKxKfwvAAOnu5RCTf9RVHfD76YbUPtp1uUFcDvCBufJojb37Gl/L6
	cZgb76QuNwPPqHrwhFMPpZRF+/6TUy4nXGr0IZXkHKw+Awq1VUM/7tW2OMcrHTxdFjovakPsBVJ
	3h2X1cSrA7aEd3Ot0eLtygSj6JO2rcxxnlRACZHluSDemTfDhANemz/tmKpo5m2r9QuWXXuj1RX
	KF8zVKeL54BIUD81Y16D05A4CdctMMgXBBs2nG+PHjKFblnkmaNDYd0kuCDPCynD6MVE78cP03S
	dnYtEMSGwRKh6VEzwCbZAWdF9mv7Mlldvep1HA8KynR0zukYj0NfAZZ+0gUZkJWZt4UuoawnSUS
	C01DBegiPPGkIEUBdZGEtRZ5Y2dYcl05uyC3aru581io2llZX9B6uLcqZud4lxSmnZ2zOQXn+p+
	EzdYvLw93Bdcm3aeYekBWttdb2b/jkwQm
X-Received: by 2002:a05:620a:298c:b0:93f:38c7:70f4 with SMTP id af79cd13be357-94408aa100cmr927645385a.26.1793293126718;
        Thu, 29 Oct 2026 09:58:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944209818c7sm8131885a.3.2026.10.29.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:58:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMTSf-0000000G2uI-1sK7;
	Thu, 29 Oct 2026 13:58:45 -0300
Date: Thu, 29 Oct 2026 13:58:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, vkuznets@redhat.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Message-ID: <20261029165845.GQ1685504@ziepe.ca>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
 <20261029163713.1366077-3-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163713.1366077-3-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095849_267127_7200DF3D 
X-CRM114-Status: GOOD (  23.67  )
X-Spam-Score: -2.1 (--)
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

On Thu, Oct 29, 2026 at 05:37:07PM +0100, Jose Ignacio Tornos Martinez wrote:
> Some PCI devices (e.g. Qualcomm WiFi adapters) have firmware that
> programs MSI addresses directly into device BAR registers, bypassing
> the standard PCI config MSI path. When these devices are passed
> through to VMs via VFIO, the firmware programs the guest virtual MSI
> address instead of the host physical IRTE address, causing DMAR faults
> and non-functional interrupts.
> 
> Add a KVM hypercall (KVM_HC_PCI_MSI_ALLOC) that allows a guest to
> request the host's physical MSI address/data for a VFIO-assigned PCI
> device. The hypercall is dispatched from the x86 hypercall handler to
> a VFIO backend that:
> 
> 1. Finds the host PCI device matching the guest's vendor:device ID
>    using vfio_file_find_pci_device() (introduced in a previous patch)
> 2. Reads the host MSI address/data from the device's msi_desc or
>    by walking the IRQ domain compose chain
> 3. Returns the result to the guest via a GPA response buffer

This is not quite what I suggested, this still relies on the host
setting up the msi using the trapped MSI emulation, which is the
primary hack..

Was it too hard to make this an 'allocate msi' operation?

> The VFIO handler is connected to the KVM instance via a function
> pointer (pci_msi_alloc) in struct kvm, set when the VFIO device is
> created and cleared on release. This avoids a hard dependency between
> KVM and VFIO subsystems.

I feel like VFIO shouldn't be involved here, for the purpose of MSI
all we need is to inform KVM what struct pci_device * is at a vBDF and
then KVM can do the interrupt bits. Maybe this is already happening?

> +	case KVM_HC_PCI_MSI_ALLOC: {
> +		struct msi_msg msg = {};
> +		struct {
> +			u32 address_lo;
> +			u32 address_hi;
> +			u32 data;
> +			u32 reserved;
> +		} resp;
> +
> +		if (vcpu->kvm->pci_msi_alloc == NULL) {
> +			ret = -KVM_ENOSYS;
> +			break;
> +		}

Yet here it is called alloc?

Nothing should use vendor/device ID either, it should all be drive on
vBDF.

> +	irq = pci_irq_vector(pdev, vector);
> +	if (irq <= 0) {
> +		memset(msg, 0, sizeof(*msg));
> +		return 0;
> +	}
> +
> +	irqd = irq_get_irq_data(irq);
> +	if (!irqd) {
> +		memset(msg, 0, sizeof(*msg));
> +		return 0;
> +	}
> +
> +	desc = irq_get_msi_desc(irq);
> +	if (desc) {
> +		*msg = desc->msg;

And this isn't alloc, it is some query..

I think kvm maintainers would insist on a complete API here if this is
the direction.

I probably would not have selected this, it is why I suggested
virtio-msi or something that could be optional and seperate from the
core KVM guest ABI.

But maybe there is interest in doing it this way?

Jason

