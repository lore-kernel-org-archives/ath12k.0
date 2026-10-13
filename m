Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC96ACC6B0F
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuNOjwtGxdFWi5b1GBEExDlpsvyC11ZHFEhl4qwDTFQ=; b=Uyd3uesPJrlNB2qvVjz3f2OkmJ
	H4vqge3BdBwmNnwgP5084aYKb5RudOqKHhxLIOTXX4e8G0uvQ3uqHzQMMmiuQ4TZfyUdLBNhN8oH7
	B3QSBvasdsnS26FbMOb63vUloWoV8G1IGsdItT4L7p5FF+5rHPa9Bqb6YpLy0LIygJ00pX+/k9eaL
	yY581dof+ug9KEOAEP7GaNER6SmTf5wzGXmVIhp04HtkRErdiR7d0l0L1iaZ/a0ZtGDehKI8z5lio
	5BYX5NQZkmYwRdEY7Jrse2BLdLhQ3S+rNQXUPZNhurNouKtzWxDFse3UCOdYfs4bfJq9EZ55GPBVT
	pz3sTCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcn4-0000000CzGh-27kM;
	Tue, 13 Oct 2026 13:43:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcn0-0000000CzFP-3jaV
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 13:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791899012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuNOjwtGxdFWi5b1GBEExDlpsvyC11ZHFEhl4qwDTFQ=;
	b=ChaIdmigxPRjC27Mp9AOHPnxP8/RIOKSo9sV+ue422c1pzdXovtntxuVC0RPp19maZVl9b
	Hk6zzD4G52i58LNlqOTWaRT9Fp1aSvlUmOl3Pt2yXL+sP3TiHC7hJ9Rli6Ce6PFhfwBNke
	hccsVltfurnOZzz4ZPoRodBZTSvcM2c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-Eo4ETPSKPqS56a6pMauarw-1; Tue,
 13 Oct 2026 13:43:28 +0000
X-MC-Unique: Eo4ETPSKPqS56a6pMauarw-1
X-Mimecast-MFC-AGG-ID: Eo4ETPSKPqS56a6pMauarw_1791899006
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEF501945CBC;
	Tue, 13 Oct 2026 13:43:24 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA6391800592;
	Tue, 13 Oct 2026 13:43:19 +0000 (UTC)
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
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Tue, 13 Oct 2026 15:43:13 +0200
Message-ID: <20261013134317.174234-1-jtornosm@redhat.com>
In-Reply-To: <20261011132558.GD14213@ziepe.ca>
References: <20261011132558.GD14213@ziepe.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: wGfbDoG9GceQ6ErSo4A7zzzbksYfjzk-zFu1SCQxS5w_1791899006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064335_000071_33D98A26 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

I understand the concern about compatibility implications, but to
clarify, my intention is not to create an ABI or a "MSI caching
concept". It is simply passing the necessary information from the
host driver to the VM driver so the device can work. The mechanism
uses the existing VFIO variant driver pattern, but I'm open to any
other mechanism that achieves the same goal.

I can explore converting ath11k/ath12k to
platform_device_msi_init_and_alloc_irqs(). However, if I understood
correctly, the VM problem remains identical after that change — the
firmware still needs physical host addresses, and device MSI domains
in the VM would still provide virtual ones.

I'm happy to do this refactoring if it opens a path to get these
devices working in VMs. What VM mechanism would you accept for
exposing physical MSI values through device MSI domains?

Jeff is escalating to Qualcomm engineering again (thank you for
that), but users with deployed hardware need something working in
a reasonable timeframe.

Thanks

Best regards
Jose Ignacio


