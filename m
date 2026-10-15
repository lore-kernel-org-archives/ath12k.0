Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61D1CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlndOUpPD0rIHOGOOB7+cfhvzEcigQMJ8mrT3merEI0=; b=PMZPTJU5ZubfD83Xoj2NwA0BS5
	3LDsO2xDgfEnVKxHRwwKadvdktArJdtv46h1dXsqrmIt1rYDczW9k10Vc0/mHJ9IT9mS1K4taqpE0
	GPgXBTOfny3w4s6Wk1jSXp0URgg1oAvrrAKBAFN7ZbjmHk400BDweu0Ufe+M4fNckIzc6xf8p2LLe
	UgJO8MDZvBC34h1J6NNyyG48B9iHrgDlz46Zhh3pcJitNMnS6UTDCgzv8AJhF+vTzfYBGWWLnpbNb
	4EzDnmUwPMrlDJY7luKd39Eenwb3rfuWbOepu+GNC28Vl42IQoCMUhTVWSJKH9ionoHk6TlNqB/CX
	BREUReuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFP0-0000000Gzfd-1qWW;
	Thu, 15 Oct 2026 06:57:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFOx-0000000GzeX-2UlY
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 06:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792047437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PlndOUpPD0rIHOGOOB7+cfhvzEcigQMJ8mrT3merEI0=;
	b=gDdLA17AtuKbZ/LJYSrS8abkf6Ui7J0UrI0leFXjZy3Bd1xHU6aARzWXXSF6QxbKEo6jZa
	l3QqGOr2cCJjRSnz5/ELeX607I6FzXqTrCtcyiSz01G0UGYlM9RJzCCFiSd5cw8RnniawM
	HP0F21aujN0hUQP6gNkJ1RhSEO+xj6M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-zjakPm4AMKSwoTffPaeZCA-1; Thu,
 15 Oct 2026 06:57:11 +0000
X-MC-Unique: zjakPm4AMKSwoTffPaeZCA-1
X-Mimecast-MFC-AGG-ID: zjakPm4AMKSwoTffPaeZCA_1792047429
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B30B1956071;
	Thu, 15 Oct 2026 06:57:08 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B26353000723;
	Thu, 15 Oct 2026 06:57:02 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: helgaas@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jgg@ziepe.ca,
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
Subject: Re: [PATCH 4/7] ath11k: add PCIe link recovery retry
Date: Thu, 15 Oct 2026 08:57:00 +0200
Message-ID: <20261015065700.120184-1-jtornosm@redhat.com>
In-Reply-To: <20261014165829.GA1636877@bhelgaas>
References: <20261014165829.GA1636877@bhelgaas>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8fQkMV3RcVG66aYLGBvFPrZJTUvU_v9_3lUuvSaPNks_1792047429
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_235719_703023_582B373B 
X-CRM114-Status: UNSURE (   4.66  )
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

Hi Bjorn,

> Link down is a PCIe reset of the endpoint, which should clear all
> PCIe-specific state, e.g., BAR values.  Is that restored somewhere?

PCIE_SOC_GLOBAL_RESET is a device-internal SoC reset, not a PCIe
fundamental reset. The link drops transiently but PCI configuration
space (including BARs) survives. Only a device-specific window
register needs restoration, handled by ath11k_pci_restore_window()
right after. Same pattern as ath12k.

Thanks

Best regards
Jose Ignacio


