Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D190FC5CFCF
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VR/FR12up2l3bccBXUXL/3VFyoBK3DsRHlCU42gGUeo=; b=v3SVmlLcRk9Nqlvsj2wFQaph8P
	KZ5Yv+XAE1GRxRSe6+wYcH3ZzTuP5pw5vFdUTVSH6gLAAY95KGamo41yUxnWyFjh5l7lYhqkDSTT8
	JUYAHVWXscRQQ+JaL1Zk2nKU4ob849kicd1Ky2AiY4sTQxDXGSR4Jk2oHtPp07qaMDUkF/G1TxORV
	WfPsoiN8fhWFXjrujL2qMSL2Dxl+ZtGWgOjymw8k9VGW0vJ8jYJyNwiPH6erQGq6EoRG07VVQM6RM
	whgjQFAELuHxuVvj5qetk7j+AEC43dYQ+OnUs8GXgsrVClQu5FnLi7Vvrknxr8hU3afMwr4/M/Hri
	YsEOq5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkt8-0000000Dx31-3uLP;
	Tue, 11 Aug 2026 11:43:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkt5-0000000Dx2Q-41cN
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 11:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786448597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VR/FR12up2l3bccBXUXL/3VFyoBK3DsRHlCU42gGUeo=;
	b=eGJPqJnsP4bNdV9HxztkA+C3e7zzKfrPAnq40MWpQrTKrf69S6i9XXVudGZ8ZqenCowN7H
	iWrGHoTWQ/mLI4eeztmoqwVe2DJUVz4JypayizMraIs0JIG8oclytjxabcfa2FdcXHjbYM
	BoMgWnLzB/0vJ45nWKnttaEtp1ZrTk0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-Pc4_KJBhMvORZ46iogtoQQ-1; Tue,
 11 Aug 2026 07:43:15 -0400
X-MC-Unique: Pc4_KJBhMvORZ46iogtoQQ-1
X-Mimecast-MFC-AGG-ID: Pc4_KJBhMvORZ46iogtoQQ_1786448593
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD492195604E;
	Tue, 11 Aug 2026 11:43:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.68])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 39A743001D38;
	Tue, 11 Aug 2026 11:43:06 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: lkp@intel.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 11 Aug 2026 13:43:05 +0200
Message-ID: <20260811114305.400333-1-jtornosm@redhat.com>
In-Reply-To: <202608110204.wb17Qqit-lkp@intel.com>
References: <202608110204.wb17Qqit-lkp@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: UQxe0DJPHmTYdyGpXzwVQC4tau2eccMpBUxxsZpRSc4_1786448593
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_044320_071069_744641DF 
X-CRM114-Status: UNSURE (   4.23  )
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

Please, use the latest version (v13):
https://lore.kernel.org/all/20260721081301.205374-1-jtornosm@redhat.com/
That and more things are fixed there.

Thanks


