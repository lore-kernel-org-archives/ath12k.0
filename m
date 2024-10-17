Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44517D3C52B
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDNf5bi3twqEz+hgY2kMChRHbeH1tAYHf98OMmN/pYw=; b=YWG5Q8ql/GbeU9D/mWOHK/0XYD
	WhKC1rAhD1MzAAOuojwlXMBV0cxoW/43wiDnaanLnKI3Ihll+5wU7oCyCEzbJwP0i+Mw5lqsnEA0h
	l6GlrYDkKUU5qj+dhNCXe428QHr8GNahD4Uk+KHTKgUI7AaWGjI+Fqk+4X5eiQ61QhpsMzAJjYNeG
	KeWp3h58fHdIaIMwfBu+DKpU/EJAAUzVoPI7/PljQAP4jygVuYLdR7KQDqCo6eUkGa9lXCFtvm1K2
	G6wXOZuvEwC+ynMc98PpHE5EntffCwB7oO6l4dMd1++Jb5pSCT04pekm2YDDSY98x7nBhbUQQhfCk
	mml4M+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UyK-0000000Fphy-3hsP
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 18:11:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UxI-0000000FpXu-2Uns
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 18:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729188635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDNf5bi3twqEz+hgY2kMChRHbeH1tAYHf98OMmN/pYw=;
	b=Ea79wiMXdDJ9P4TZx8sXRY3AJFQX4zIzbwn8Qh/+aWIl78I5VRI0euE79t6AcL6terGN/W
	8niEXPVkYdcb6ASaWQvpApgrmC9Sk9ME3TtoRSTqixlFv7kmm+qeDjXgch2Yvn8uzU83hO
	tDDHmLrhQ3UsCHcDNhs2VyRy18rRkwQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-6bZPmiw7PDmBCipasXQD2Q-1; Thu,
 17 Oct 2024 14:10:31 -0400
X-MC-Unique: 6bZPmiw7PDmBCipasXQD2Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9C7C195609E;
	Thu, 17 Oct 2024 18:10:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.106])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 550101956086;
	Thu, 17 Oct 2024 18:10:27 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] wifi: ath12k: fix crash when unbinding
Date: Thu, 17 Oct 2024 20:07:31 +0200
Message-ID: <20241017181004.199589-2-jtornosm@redhat.com>
In-Reply-To: <20241017181004.199589-1-jtornosm@redhat.com>
References: <20241017181004.199589-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_111036_727676_E9ADB60D 
X-CRM114-Status: GOOD (  10.91  )
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

If there is an error during some initialization related to firmware,
the function ath12k_dp_cc_cleanup is called to release resources.
However this is released again when the device is unbinded (ath12k_pci),
and we get:
BUG: kernel NULL pointer dereference, address: 0000000000000020
at RIP: 0010:ath12k_dp_cc_cleanup.part.0+0xb6/0x500 [ath12k]
Call Trace:
ath12k_dp_cc_cleanup
ath12k_dp_free
ath12k_core_deinit
ath12k_pci_remove
...

The issue is always reproducible from a VM because the MSI addressing
initialization is failing.

In order to fix the issue, just set to NULL the released structure in
ath12k_dp_cc_cleanup at the end.

cc: stable@vger.kernel.org
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v4:
  - Send with cover letter to get reference with 2/2
v3: https://lore.kernel.org/linux-wireless/20241017074654.176678-1-jtornosm@redhat.com/
v2: https://lore.kernel.org/linux-wireless/20241016123452.206671-1-jtornosm@redhat.com/
v1: https://lore.kernel.org/linux-wireless/20241010175102.207324-2-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath12k/dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 61aa78d8bd8c..789d430e4455 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1241,6 +1241,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	}
 
 	kfree(dp->spt_info);
+	dp->spt_info = NULL;
 }
 
 static void ath12k_dp_reoq_lut_cleanup(struct ath12k_base *ab)
-- 
2.46.2


