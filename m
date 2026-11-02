Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F61606A333
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CEvsuXz7;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ee2pcwJl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9E0zGD2ODat2SvttteActsyR0xXKqRS4RgBIccVpIig=; b=CEvsuXz79mVUPgYXQZwz7e73dP
	xebA/NxxDud47sJN/Dw3rGeunlNF6PgXCSz2BXuoIPdVyr7UjZln4vDYw08kRPNu07e4pP5VYNArF
	YE0vPpYMZGdOGmjmO4uzxAk3tUYZV1LI/8l9NoXj3vazwaSsYLUpljcfsfedp9Mnlb6cFtRBa5uUc
	Ci2W/vXJaIQ5d0ndmDA8gfLVhoAXtQpCwMOXrC/0DazETHkX7WPKJsArXV2HJu/PtzvwSG2+um8fb
	PwbSGwu93vNpIYf63ZafLIey1zwlJEceJIYD3t3cdZjQbMXFFeX2TtXx8ZLeJYbnuG1ojzi9xUNDm
	Yj62AG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmn8-0000000Fn90-2RI3;
	Mon, 02 Nov 2026 07:49:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmn3-0000000Fn7N-3qLz
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 07:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793605752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9E0zGD2ODat2SvttteActsyR0xXKqRS4RgBIccVpIig=;
	b=ee2pcwJl0mnOibAWl2RwhbkW1Y9KQ/4MaN4aezpxIEWu4wmppZNxnk/jzPQvrrK3uQQ1AJ
	XOx80RirLy683av1w6bycBKPYF/iT3BziuIAi0As7+8x1DPNFU6nPBe4nZDSpImjtfx6JV
	EXYekVMcCxX2aF5FkQ+VCR8w0q8LqmQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-rafnIFLNMu2yIqXetp5ebg-1; Mon,
 02 Nov 2026 02:49:11 -0500
X-MC-Unique: rafnIFLNMu2yIqXetp5ebg-1
X-Mimecast-MFC-AGG-ID: rafnIFLNMu2yIqXetp5ebg_1793605749
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C42019560B8;
	Mon,  2 Nov 2026 07:49:08 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5BF2E300019F;
	Mon,  2 Nov 2026 07:49:03 +0000 (UTC)
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
Subject: Re: [PATCH v3 5/8] ath11k: use KVM MSI domain for VM passthrough
Date: Mon,  2 Nov 2026 08:49:02 +0100
Message-ID: <20261102074902.27907-1-jtornosm@redhat.com>
In-Reply-To: <20261029170044.GR1685504@ziepe.ca>
References: <20261029170044.GR1685504@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: EGQaHac-4AKuwjSOR5eQK41x4LYojVP1ZHWEX1qVNno_1793605749
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_234916_238483_E58064DB 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
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

> This connection should be done through ACPI somehow, and I think
> Thomas would expect this to be modeled on the platform msi domain,
> just ported to PCI instead of this.

Thank you for the suggestion. I will explore the ACPI-based
discovery approach and study the platform MSI domain model for
the next version.

Best regards
Jose Ignacio


