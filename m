Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE30C5B56A
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPlqeWxM+x2WItnybXha9BD+uNfcp/QU8sKnK1YwN7s=; b=VkN6+lcsebDHZX1vSfqSxmix1x
	7yleOHOHUygJBVTEjVIZ9bmo94wcx7p8Zvc774mSo/19Oyd+n2OWCRssd4rk+eOMiYA7D/LIFfgCY
	pFtIvE8KBRjeHJ9W6cSgshcX0OgO+ITHP7Cyv8o9shxuxitLRWxqOuxoPAK7VYGDJSp9/YBi/lXVu
	b/uYOSmDeqiXF47yDnbH6WpqdQvq+yEx0wVMG8LVsyFkaV3iizMfm+FjEujMqJ1JqDZMTo9J87TE0
	QdU6K6fMYjutmDRSMcTrJIrhgk/J7kymEm46TXfqRRmZs9YZu2+AlXWslalGIYaNu/KwAJjdHPIYr
	1092deGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqDi-0000000EdRD-3Gza;
	Tue, 11 Aug 2026 17:24:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqDf-0000000EdQN-1MNB
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 17:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786469093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IPlqeWxM+x2WItnybXha9BD+uNfcp/QU8sKnK1YwN7s=;
	b=gpdZQvD8NBJ+GiP6PwiJVbL8twGJ8A1PKGDQMmeeDyMCpcZMW9mwQOFU+Y/ujSvhWM3c2s
	j0SDktQkBvzn8aR2rQGffbUGH4kZS1ut01uawphp8oggYJafL0LTTKMnSXqikAQaPhbIUa
	QL2RFE0Yl+o+4EdanRTtZmS6eQr6sPQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-q5Id0HgKPE2W7U1wNrFPkQ-1; Tue,
 11 Aug 2026 13:24:45 -0400
X-MC-Unique: q5Id0HgKPE2W7U1wNrFPkQ-1
X-Mimecast-MFC-AGG-ID: q5Id0HgKPE2W7U1wNrFPkQ_1786469084
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98E4B1800846;
	Tue, 11 Aug 2026 17:24:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.68])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65638180049F;
	Tue, 11 Aug 2026 17:24:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v6 0/4] ath11k/ath12k: implement TX flow control
Date: Tue, 11 Aug 2026 19:24:31 +0200
Message-ID: <20260811172435.616200-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 5atywES1G20srOL-g9GPDXRIcuWu6EcCdbe-xpAMK_o_1786469084
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_102455_529435_49BD5B6F 
X-CRM114-Status: UNSURE (   6.15  )
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

v6: No modification in patches 1 and 2
    Address comments from Jeff Johnson:
      Patch 3: Remove unnecessary if (!ar) check, add Tested-on tag
      Patch 4: Use EXPORT_SYMBOL instead of EXPORT_SYMBOL_GPL,
               use guard(spinlock_bh), add Tested-on tag
v5: https://lore.kernel.org/all/20260807105843.20203-1-jtornosm@redhat.com/
--
2.49.0


