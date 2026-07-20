Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52568C4451B
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24KfME6YaK0rFqYLax/YOH/Kr2A1S3NsrP5E8iqazls=; b=n2+hImoIQ5rNrdxSEsBzpPR9VO
	wQnilU83O7qtgozht4vSxuyCsLkZRUeTynLilcKTks2zk8rkpLinnSxwnk0+8XMwekw8yLkZqb8m6
	f1cOKoOaHGXKtVkEQxaGWiKOztGORoOd7oC7qtOkRtnc0Y0L9b9MGowPjYKipiu6EejOok4VCteEN
	Q9qRMDna8gFmnNkmfgDNVE12fyfpfeViqXquV49H7W1uLTcZ8vYO981T8XhWaDYjC1yRvu1kpQZ2g
	3G/BPWDqK8EkVLmo2tFfSJDz6rfoEdSxJWljOjlgUe771bWzF5TR1Q+KmHq6ErIvv1thpIU9gJOaB
	YLAlKrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQw-00000005wS3-05rW;
	Mon, 20 Jul 2026 06:24:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQt-00000005wQL-1nLW
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784528694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24KfME6YaK0rFqYLax/YOH/Kr2A1S3NsrP5E8iqazls=;
	b=K1SIqIiewl+hY+7/EvakRR0efYaGfCJxXDp4Dbrf9UJYpVCjbSFjYsP/IDM3N0ai/pFPzh
	qpGl66pvMs7s/WuT+z3QkxDDt5vs+IzgZfDpPCQ8FUUzEdg3NEv3im3rBNWWfJs/gPPBhS
	g+QTIRHg0nK1bCTxhpwxQ6/T3+8Prfw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-63QoUVMuPE6Au3c6VZwjVQ-1; Mon,
 20 Jul 2026 02:24:48 -0400
X-MC-Unique: 63QoUVMuPE6Au3c6VZwjVQ-1
X-Mimecast-MFC-AGG-ID: 63QoUVMuPE6Au3c6VZwjVQ_1784528687
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4D9D180134A;
	Mon, 20 Jul 2026 06:24:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.69])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B1CB4195422C;
	Mon, 20 Jul 2026 06:24:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	mani@kernel.org
Cc: jtornosm@redhat.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v12] PCI: Add device-specific reset for Qualcomm devices
Date: Mon, 20 Jul 2026 08:24:39 +0200
Message-ID: <20260720062439.8993-1-jtornosm@redhat.com>
In-Reply-To: <20260630065815.199693-1-jtornosm@redhat.com>
References: <20260630065815.199693-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: oXckgqND8WbUOChbZkAZDRvTuFOkEjsuvthFnSHtZVY_1784528687
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232455_527484_5E90D49A 
X-CRM114-Status: UNSURE (   5.69  )
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

Gentle ping on this patch. It has Mani's Reviewed-by and has
been tested over 100+ VM reset cycles for both WLAN and modem
devices.

This patch adds device-specific reset for Qualcomm PCIe devices
(WCN6855, WCN7850 WLAN and SDX62/SDX65 modems) that lack working
reset methods for VFIO passthrough. The reset uses BAR-space
hardware registers, replicating the sequences from ath11k/ath12k
and MHI drivers. Without this, these devices cannot be reused
after an unclean VM termination.

The approach follows Alex's guidance through the series:
device-specific reset via pci_dev_reset_methods[] (suggested
in v5), and BAR-space hardware reset registers instead of
D3hot power cycling (refined with Mani from v10 onwards).

The quirk_no_bus_reset part was already merged for v7.2, and
this device-specific reset completes the solution.

Is there anything else needed for this to be considered?

Thanks,
Jose Ignacio


