Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D7CCC6B34
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSE6SF/O7vjB6gvtVPX8GgYZcDaIDXMtT2/2oI7pXAI=; b=qmOAz4UKO6A0WMBnB/eX+yYJFE
	T57U0eP/3cE2tSx7eAwwG35pNDLlP+ix2Xsjv19aXBsae9pOtYvi/4kQpFLiUCntakGnCa/hPE+ZZ
	N9xaZuupFINqwVzB5stCc6NoeNeZCVeZYsU/8l+I+NjY6DCxlZFcIaJYA1amS9F9fn0mPtpaPd6z2
	fq2+4X/d4GkcbSF4cTENr4IWDuT1A4LrWDVW+Dd3KsbHnFY0vn52JwZ/Iui3tvWXVhuJE2B1mxACm
	+JYwCgcBNl7NBHpbXOs+1EMtMRhvrtY5EULUyb9t/DJ5Uy/xi5hSl1ndeNaaKFDzjrS9vZK6KipDX
	z0Ui9odQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFap-0000000H12S-2dEN;
	Thu, 15 Oct 2026 07:09:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFan-0000000H11Z-0Cz3
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 07:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792048172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSE6SF/O7vjB6gvtVPX8GgYZcDaIDXMtT2/2oI7pXAI=;
	b=f0q4/wgUS/gYleb3hVIBROzDqjhV0TOh8+4HJm0xl3xxmKmvnUrmnjamekspn58/Wg5Kcn
	OhMfWPgrMHB4dzsi5T1zFNM5sjPhEzj7BRKZ/SqR9DoC+L3VVDNa9VsB3IpdX7v0oHIa/P
	GrjdgM3O2DdMX4GXR8ZXpax/Jw6JgsQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-SirXxdeDPEuJ2pN2inpTCA-1; Thu,
 15 Oct 2026 07:09:28 +0000
X-MC-Unique: SirXxdeDPEuJ2pN2inpTCA-1
X-Mimecast-MFC-AGG-ID: SirXxdeDPEuJ2pN2inpTCA_1792048166
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BCE31956067;
	Thu, 15 Oct 2026 07:09:26 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 485A8300072E;
	Thu, 15 Oct 2026 07:09:20 +0000 (UTC)
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
Date: Thu, 15 Oct 2026 09:09:19 +0200
Message-ID: <20261015070919.466876-1-jtornosm@redhat.com>
In-Reply-To: <20261014150047.GO14213@ziepe.ca>
References: <20261014150047.GO14213@ziepe.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 1LT65rj_JGtjKTYZf38_PPwASNlfsbBWPx-oNkhLQmE_1792048166
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_000933_155992_743B7487 
X-CRM114-Status: UNSURE (   5.08  )
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

Hi Jason

Thank you very much for this. This is a very good and complete analysis.
I need some time to study this carefully and understand all the
implications. After this I will try to do an initial proposal to work on.

Best regards
Jose Ignacio


