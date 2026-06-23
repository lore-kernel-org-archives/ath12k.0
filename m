Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E14FCD98F2
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0c4tLuBDb8dVN7iShZ9BiQoIw7SYRkSb2UZsD6lR2k=; b=LSn5ouuoDfVPYniA7tujxLqnXu
	at7bKmxqQUrCWN3IH9csiAEVe+OWZtSMV2kmi8AfQPrppgK0KUQFJPpuFoft9dfYBIfgUWWfeCCoq
	hKBV+CNzQBDIbDNwOupqKXciwawqGb1Y8jEmz3MXNZEhACWUWsRrQ7wx6+uNlhLy1H919tzgVIfLP
	XV4tGm1VP4unXiEDZ/lfUREumAu73Rv0laodtqCRojyL5RQo09MTBc0aAKJ3CMMlD9obi4E2sxzVF
	1gl7mqRpxdIirVv6lg5XSlMaT6MXmrpI5LDMsa64nDGU9RU6uWje7AyLq+wHoLNK/7hciygp9zKNr
	67SjKEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0hS-00000006IZw-3gkH;
	Tue, 23 Jun 2026 12:57:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0hQ-00000006IYl-2SJn
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 12:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782219475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0c4tLuBDb8dVN7iShZ9BiQoIw7SYRkSb2UZsD6lR2k=;
	b=EJcxsHRE0IIMdRLcDM0Zk0Mj7Sxbn0HURMYUGBetcNKVi4Q58zWY6SRaXm8/9cZq8TdEg1
	7LbRYOjK3QDOWVpaHO06keCmRjMlOmdf+yHFFgeoDvBLrUDnn1PlNXzbyirpqYlKvmhICk
	EmPstzi/mEZdz6gKODdmq0e+KaYOwRs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-vj2Kf3YuNxC8J4DH6BZXUA-1; Tue,
 23 Jun 2026 08:57:50 -0400
X-MC-Unique: vj2Kf3YuNxC8J4DH6BZXUA-1
X-Mimecast-MFC-AGG-ID: vj2Kf3YuNxC8J4DH6BZXUA_1782219468
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAAB11955E8E;
	Tue, 23 Jun 2026 12:57:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.11])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2F06618005A2;
	Tue, 23 Jun 2026 12:57:43 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
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
	mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 23 Jun 2026 14:57:41 +0200
Message-ID: <20260623125742.1188945-1-jtornosm@redhat.com>
In-Reply-To: <5abb5812-cdd8-47d4-b5a0-33f7351589ea@oss.qualcomm.com>
References: <5abb5812-cdd8-47d4-b5a0-33f7351589ea@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: RlwiYFcErtqZTBTjcQCVS5gkl2NO-pcTlZ6w1gVgG-8_1782219468
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_055756_701427_56C0ED86 
X-CRM114-Status: GOOD (  10.18  )
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

Hello Baochen,

> what is the difference between a clean VM shutdown and an unclean termination?
> specifically, will pci driver's .shutdown callback be triggered during the clean VM
> shutdown, and not be triggered during a unclean termination?

Clean VM shutdown: The guest OS shuts down normally, so the guest kernel
calls the driver's .shutdown/.remove callbacks. The driver can properly
deinitialize the device, leaving it in a clean state.

Unclean VM termination (crash, force-off): The guest kernel never runs, so
driver callbacks are not triggered. The device remains in whatever state it
was in (DMA active, interrupts enabled, etc.). At this point, only VFIO on
the host can interact with the device to reset it before reassigning it to
the next assignment. Without a working reset method, the device stays in this
undefined state and can't be reused.

That's why VFIO calls pci_try_reset_function() - it's the only way to clean
up the device when the guest driver couldn't.

Best regards
José Ignacio


