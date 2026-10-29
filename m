Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAAB606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4fNZSshp;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kzqM+nj1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZD/qDGi1O6nHsAaexh1x5wdETQZTzQoYlRWPgZIsXpY=; b=4fNZSshpzUzqXzdxcr81/I0PHp
	zXFoF3NvLAqsnv47nQBtcrWNiO2AijgaWoYm9N0Jl/MbYbESK91kkYX+tb9QPRKmvfinN8g31YdnX
	s+AvpnyhCJVTP+pqh+0ZL6Vnqn/tXt2qsm3Wm8UXRmQhKSrSSZceVYt3q83QBUF8ky2UJWi+sTZST
	WP6GfW6fB2czyiWeCxwqchnJFhISM4hZB9LHrE7oqaNMU9ndpq+H6AB/D3Jc007A6gpLQhDlOOEF0
	mdm+26IDJP+PTiDM6Uxs+ZwC+MPJOjPvTo2jqjjV0YWevFMuCdMHzDfOdJc5UDNAUbMKmKHtmbi2x
	J6QNwygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTUg-00000009utp-2yXI;
	Thu, 29 Oct 2026 17:00:50 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTUd-00000009urG-3hjN
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 17:00:49 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-91c75267b0fso26709656d6.3
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793293246; x=1793898046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZD/qDGi1O6nHsAaexh1x5wdETQZTzQoYlRWPgZIsXpY=;
        b=kzqM+nj1Faxguwq6v31hxZkHbU3zgpCJgS7Gt3J0XaHjsgZFPm7P4rgstF8YKmS+a8
         f0xnZPMdGHu73BwB+mAFg5x73yaCuw4MsjwD5ZjCHcvwkRBmqjuRNRv/qwkeIxvv94pL
         TdCyU27yEHXfx4eP350jH7naG7IQXEn+Ld+GcycEog3YpwevSQknSnrSfh18J7wRxmho
         Zt9QCKzgB+yR4GPYCFFF1OGpru0deuLmSZAzT5dlUBNxk9WQB7cKdTnTGfQDhwgFn8oA
         0LAe1vDTEC9FwPGm8XnnH2tjisCCF4MifA5awht9ifyaXBSG1YsoaKaGSo+W/wHDjgWS
         Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293246; x=1793898046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD/qDGi1O6nHsAaexh1x5wdETQZTzQoYlRWPgZIsXpY=;
        b=GoRkQXUtsunkg+RiH73otJz8ujjwj4XwGYWKngfLQreWbjoTsoKH2t8sx0r/lqFdfu
         O4sCi6gC9qG0NltkPdEJ+FjmyulDRFKyrVklkBxHDU3x1nU7EBR5LRL08kyGRd8luEhJ
         SZOUwGRUZVMDvJJMeCwezh3r8eCuXM2J4PWncAsnrmfstIfHa9iLicdRxZPRxlh6cU19
         SQwTcMwC7hX48xIXLTkKwZsnwMhHc6Nt/+7FO7K3BNOcQlYT4Dp8d5C5fRRigv3Wq1RP
         cB/0Z+JycKXNzwNvo1S9m+e+1NPwfK4in2vKu5vUwMjPXuqxjOFbFyQxquSLAgvw5b68
         fYBQ==
X-Forwarded-Encrypted: i=1; AKwUvByIsDgoxLYEqMYRECyzDw3i2vMs3dFC7domkeVWVIZy8YCB5GZkHaw1gzzxQjUqSsJDYChxhBI=@lists.infradead.org
X-Gm-Message-State: AFq9FYIG38TYBjUlWsYtlj6uju3N/AmY9Ofsue3Wqs7qS2q0LsNhfMKt
	+IS3+kZ7txFd+Pk2d0ec7+GVGp8o4PaMo5RrgFxQ+ajVf3eKwMl0wir5lX5SEegz4q0=
X-Gm-Gg: AYBFou15OufrgiQf9swf4s5dulkzkKYnMU0+bkeETNw7v4LVntB6a9UakSxAfbGmQeI
	3Ys8dXLcxDXJtqg416Fd6tWu/5h6GGvjnSUbu5/y0ZtMmFFr+/vYLA7fNAyY0rXHPtPU7gk87GM
	NnQm7UdT3mfNv4B6LyuUNo5vjWlkiaGjOxRuwEXvz4dMGZvUTWpOqXtqgQnAiG/lm5KCYzpJ4cV
	+sA+l4tnd7+Sjj5J2ZmeNrEwafBibg/hwzti7X/06k5nUfn5UasQOuGi/kv+TcxyVtCi4N0rrsH
	aqFfGF8UKSiHha/cWDlgmbFBoRMyP3u070Ys1MMNMRmtVUhhwiy22D5glr6JAaYkSmPC9TwjgMO
	AvHWSymZJN3fV/xtbZY0sf/EBSlYINbETIBxjd1KbcuyxUSY9sNzRMm7zoI48YJG9jrZz7QXJv7
	rOm8emHrNPa/2ELhdOu7L2IgP2ms92u2RNhtLn9Jb1Gafo38nByC7arl4LVjAzeYpoSuihTZ9os
	O7WUGR4EtlsFcRFRwnkOpSiQo3XhBL3Xl3EwzIytyWAePhNv1WCj+PXBv9ZIke4teu2jYUJHMHN
	vZ4yOjBUbQqn7iz0tEoMPosimJU1QIh8akMLFJnz2Jaws3+nbzRUNBAqrUaHHaWAsssLY6IXOJa
	qtcC3aEHAELc=
X-Received: by 2002:a05:6214:3a87:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-91c7cb836c2mr100048286d6.0.1793293245829;
        Thu, 29 Oct 2026 10:00:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca317a421sm870346d6.44.2026.10.29.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:00:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMTUa-0000000G37w-2g1i;
	Thu, 29 Oct 2026 14:00:44 -0300
Date: Thu, 29 Oct 2026 14:00:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, vkuznets@redhat.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] ath11k: use KVM MSI domain for VM passthrough
Message-ID: <20261029170044.GR1685504@ziepe.ca>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
 <20261029163713.1366077-6-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163713.1366077-6-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_100047_919553_AA5B7734 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:37:10PM +0100, Jose Ignacio Tornos Martinez wrote:
> @@ -855,6 +858,13 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
>  
>  	ath11k_pci_msi_enable(ab_pci);
>  
> +#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
> +	if (kvm_pci_msi_wait_ready(ab_pci->pdev, 500) > 0)
> +		kvm_pci_msi_get_address(ab_pci->pdev, &ab->pci.msi.addr_lo,
> +					&ab->pci.msi.addr_hi,
> +					&ab->pci.msi.ep_base_data);
> +#endif

This connection should be done through ACPI somehow, and I think
Thomas would expect this to be modeled on the platform msi domain,
just ported to PCI instead of this.

Jason

