Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA50C5AC7A
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lbe9xYGQF7MxxngD6GwpHij7lEf9Aywcs+3bJ2Be0Uc=; b=Hk0G0ZWREHEp2+UOPpO3/r+eXw
	SnycX8X+8z/4EjtYp1zJ61EPVhdQDygGfreVvdcuggyKeGjgpT3T/GUzvYtcxlHI872bxgfJYjtTz
	B/w3NYcjWEiYv8MKb7lV9B8azlR4w2um+HsaimTmYhC6K90lBHxL8Bvoej5V0sMbJ7vRDJMCb6e9e
	9/j9bJf/fSY0aiUJ3ea4ipShdT3TOloz/5OH0WOHWR10BzZceXxutHFsuzq34rDf3lDCaBc/JWueE
	oOBRXdWTm1n6N7vHD8u7soiPvpuNNIDihfqJOAZAMwtspSwi4+TdBg1yEC+Tz4picx8dY3EYQNKqt
	3Wnm9+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIIB-00000007mV3-1k3h;
	Fri, 07 Aug 2026 10:59:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsII8-00000007mSI-28nj
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 10:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786100347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lbe9xYGQF7MxxngD6GwpHij7lEf9Aywcs+3bJ2Be0Uc=;
	b=Mjhwn70YZ2KonEnuWHw6107IUv2bkPN1nF4aj68xGuMTTx8WNrTy9NLiOHtSZOoZ7F8N68
	4YHu9udT/uKlLtijnoBjVf/RkK1M1iUSMxKaJobA3UUrlNwXzodRNru1LSoTT3J19dXNyt
	9vwftN+410aZ5vhnSfBcwscfVDAJmZQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-nR0bDJalPhmZFZ05DUiFaw-1; Fri,
 07 Aug 2026 06:58:54 -0400
X-MC-Unique: nR0bDJalPhmZFZ05DUiFaw-1
X-Mimecast-MFC-AGG-ID: nR0bDJalPhmZFZ05DUiFaw_1786100333
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A95F19560AD;
	Fri,  7 Aug 2026 10:58:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE349180049F;
	Fri,  7 Aug 2026 10:58:48 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v5 0/4] ath11k/ath12k: implement TX flow control
Date: Fri,  7 Aug 2026 12:58:39 +0200
Message-ID: <20260807105843.20203-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: nS8Et0sfufG8cPUCojBIMIBXDkeMa-nZN50QknPnCKU_1786100333
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_035908_737230_C6118D0E 
X-CRM114-Status: UNSURE (   4.74  )
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

This series implements custom wake_tx_queue operations for ath11k and
ath12k drivers to prevent hardware ring overflow issues under heavy
traffic.

Without proper flow control, both drivers experience -ENOMEM errors
("failed to transmit frame -12") when the hardware TCL ring fills up.
Additionally, ath12k can hang under sustained high throughput. These
issues are more commonly observed in VMs with PCIe passthrough but
also occur on bare metal systems.

The implementation follows the pattern used in the iwlwifi driver,
adapted for ath11k/ath12k hardware ring architecture, checking
hardware ring space before dequeuing packets from mac80211.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Note: I will have limited availability from mid-August to
mid-September. I will address any review feedback before then
or promptly after returning.

Jose Ignacio Tornos Martinez (4):
  wifi: ath11k: use queue mapping for WCN6750 ring selection
  wifi: ath11k/ath12k: remove skb parameter from get_ring_selector
  wifi: ath11k: implement custom wake_tx_queue with flow control
  wifi: ath12k: implement custom wake_tx_queue with flow control

v5: No modification in patches 1,2 and 3
    Remove an unused variable in patch 4
v4: https://lore.kernel.org/all/20260724053121.15759-1-jtornosm@redhat.com/
--
2.49.0


