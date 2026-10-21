Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049CC606A334
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+vIF53Y;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X49LXUbe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y3Kbd4rECN07DcxByi+wY4G9Biu9iKfm+5QZE7UXzxc=; b=u+vIF53YDU/V4tHVVpPNF50NuP
	71tfpMdkXio6eLWP2HCkapCJlitF72TNwBsvAZP8m/igo56x69cf63ZiV2Zy9I1F3s6rSu19nN8+t
	B9nOGpEabcOBVrLwD8w//V1bwiSZ6HgupdPb9O4B7gihSuxpyH36J7IfO5Wmm+9Hg1glztZpoEGo5
	cZzdj1jKN4sEdFgSUOPRAh0hZKCukl//fxNUtdgosaeC1d3T7ZW8AWPw3CERU0F/aKAXT1+hA46i+
	Rg62I3GU84/WNEga1wpobt2DFdopopRMk0JWYwOkuJMI9ZcpGLqD5Vej1uXqHwGbOXdNJAXshb1vc
	14gEdmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPWF-0000000B96S-388x;
	Wed, 21 Oct 2026 06:09:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPWC-0000000B95D-3UNS
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 06:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y3Kbd4rECN07DcxByi+wY4G9Biu9iKfm+5QZE7UXzxc=;
	b=X49LXUbeVPVVUbUukoGkmsC0DUMEn+5OzS0xjn+IPXnJpERUeVbYFyPiA+LDKO4+z4qTSf
	CFNTJ1pBh4GOZ3sDjM0TLrD1NLgpJviwy7PMgqHHMsfrDyba6gMQDTRGMjj8fOz5NAubRd
	xarArV7hjcK5FP751LfALR/QuwTUMZ8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-bItbCJ_LODKIpUzCS97Hhg-1; Wed,
 21 Oct 2026 06:09:40 +0000
X-MC-Unique: bItbCJ_LODKIpUzCS97Hhg-1
X-Mimecast-MFC-AGG-ID: bItbCJ_LODKIpUzCS97Hhg_1792562979
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E44751956065;
	Wed, 21 Oct 2026 06:09:38 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A51B1800347;
	Wed, 21 Oct 2026 06:09:36 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 0/2] wifi: ath12k: implement TX flow control
Date: Wed, 21 Oct 2026 08:09:29 +0200
Message-ID: <20261021060931.249629-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: BRpPvb05jWIZ9FvyCsEzffhkwqAWKrHcvEm7saaOGFA_1792562979
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_230944_982402_67A0D1F2 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series implements a custom wake_tx_queue operation for the ath12k
driver to prevent hardware ring overflow issues under heavy traffic.

Without proper flow control, the driver can hang and experiences -ENOMEM
errors ("failed to transmit frame -12") when the hardware TCL ring fills
up. These issues are more commonly observed in VMs with PCIe passthrough
but also occur on bare metal systems.

The implementation follows the pattern used in the iwlwifi driver,
adapted for ath12k hardware ring architecture, checking hardware ring
space before dequeuing packets from mac80211.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (2):
  wifi: ath12k: remove skb parameter from get_ring_selector
  wifi: ath12k: implement custom wake_tx_queue with flow control

v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-1-jtornosm@redhat.com/
--
2.54.0


