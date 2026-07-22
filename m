Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85448C44539
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOkzl25QMkR31KWjR8NOxhwtgyg0bzm7KtlMeuS5bG4=; b=M/HfsRkVdPkmRWIxk+6RWRYQPz
	x7iANH16bBt7tusAeNyKra6uQWrhEScx+vxW98MtFL3CKZf4L+Vo/w7qeivcJwMFAt1+q5dc7dx2n
	BHQolkMWE241pcYv9mg+QyibChXSjbsjURJ/KPTNc4Jfdi9thw+cVEG5Zqi635i5e4mHHpLK5lBxX
	fvJN/2yCT93zFqC3ieAM2Wy3U+TrlBk79aOmQyzB21eY7dWeZiaP4LxxKOntLy8romhvfRp4uayGm
	icIHHI7hpVAcbqmZO7VMaZGdMikBJcjc2KrvsRLN8WCkc0QEElcRrtT29RxeEad+zzpwPDsdoG3SH
	HZox21DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmV8r-0000000BeHN-3f7z;
	Wed, 22 Jul 2026 11:29:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmV8p-0000000BeGz-1eBA
	for ath12k@lists.infradead.org;
	Wed, 22 Jul 2026 11:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784719774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOkzl25QMkR31KWjR8NOxhwtgyg0bzm7KtlMeuS5bG4=;
	b=Ty3TeIumIPUi4KCIzm0TdDlZJ5s1iNAOSv+fbAjlaX4pZf2f5R9wlcAs3AOhYBo4glCK6r
	RY9yivjRpxDwAVUU1Q/BgK+lUwP2lVDa79euZlD25LbMlz4+/0OGdL54IAMQ95R35zaRxi
	GGKlMI1SMCd7IJcBtm+0pV96U/1PObI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-Uzggo0ZANlGaYbji_F0fhQ-1; Wed,
 22 Jul 2026 07:28:23 -0400
X-MC-Unique: Uzggo0ZANlGaYbji_F0fhQ-1
X-Mimecast-MFC-AGG-ID: Uzggo0ZANlGaYbji_F0fhQ_1784719701
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA896191DFEB;
	Wed, 22 Jul 2026 11:28:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.27])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8B96195423C;
	Wed, 22 Jul 2026 11:28:14 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	mani@kernel.org
Cc: jtornosm@redhat.com,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	jjohnson@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Date: Wed, 22 Jul 2026 13:28:13 +0200
Message-ID: <20260722112813.33153-1-jtornosm@redhat.com>
In-Reply-To: <20260721082933.7B5A41F000E9@smtp.kernel.org>
References: <20260721082933.7B5A41F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: xlVNpBcfYKR9P9W0WaSD8OXSvqFyFripVnP8hu6q83E_1784719701
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_042935_517617_D604B8A5 
X-CRM114-Status: GOOD (  12.45  )
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

> [Severity: High]
> Will this sequence of ioread32 flush reads and
> read_poll_timeout trigger Master Aborts on architectures
> with strict error handling?
>
> The SoC global reset explicitly drops the device PCIe link.
> Performing ioread32 flush reads immediately after asserting
> the reset, and then actively polling the disconnected MMIO
> space with read_poll_timeout while the link recovers, can
> result in Unsupported Request errors.
>
> On strict platforms like ARM64 or x86 servers with APEI/GHES
> Firmware First error handling, these can escalate to fatal
> Uncorrectable Errors and cause a host kernel panic when a
> guest VM exits.
>
> Should this avoid MMIO flush reads during these reset
> sequences and instead use fixed delays to safely bridge the
> link-down period?

The SoC global reset at 0x3008 does not immediately drop the
PCIe link. The flush reads execute while the device is still
responsive - the actual reset takes effect during the
subsequent msleep. The ath11k/ath12k drivers perform the same
register accesses during this reset sequence, including on
ARM64 Qualcomm platforms, without issues.

The read_poll_timeout polling for link recovery follows the
same pattern used elsewhere in the PCI subsystem for waiting
on device responses after reset.

Tested over 100+ VM crash/reset cycles on x86 with VFIO
passthrough without errors.

> [Severity: High]
> Could this immediate ioread32 flush read also trigger a
> fatal Master Abort if the link drops instantly after writing
> the MHI SoC reset request?

Same as above - the MHI SoC reset does not instantly drop the
PCIe link. The flush read completes before the reset takes
effect, and the 2-second delay covers the actual reset period.
This replicates the MHI driver behavior
(mhi_pci_reset_prepare()).


