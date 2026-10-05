Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8BACA5FF0
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR9p+VjROivHPCcQOHzYwQJDmbJUOUEqe/SJl79LCD8=; b=sMWCdowZRZLbjq9YNjNE0ub0wl
	u9t5eyd3jmLhkKJMrDabiB7Xr4EgcNGk88U6HGo3lAvDjIEtMgz3k313ZREpDl2C6lyFNT8zO0YMF
	16XVLL+7WXHUEvyyomOa+qEJ5mgjMD26cTmRigs7xo/wCNQfxiXtyqbjcdDdfx3vwqo7xyxtaYL8B
	D1xsBqRMXQSoLnrktKnowQTWcVa69tSV1KYeCPbstE53wICYbFngOvHRdDn4uB4ck8cQmD9rD/hmu
	1vYxMf7OZiKamnifofvao9qe2vaVbb+L3spqW1YxrHWkGZsNEiT2pyrfHKT5ZZL1JR6Ri7xoBmmNQ
	9gvkjOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgFD-0000000GDsC-0D6i;
	Mon, 05 Oct 2026 10:48:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgFA-0000000GDqQ-3JUe
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 10:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791197306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR9p+VjROivHPCcQOHzYwQJDmbJUOUEqe/SJl79LCD8=;
	b=Q2xk0j/CN9hi3BmxbKts4ZYwTXevPTBNlAhDkoBONRpMy9AENTAbKP7KPx+SowIdNxzMWe
	Ma/xtYYsTWuehS+iHOOoPWbyjO2UEByI4rGC4t8GUnpp2JBi72ZZGpyiCzqiwehxgzXN1y
	iFrOvrImOySDMbpgHUiJrMLntUiAprc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-pb7Iyv_NOo2UQC-rFUkeSg-1; Mon,
 05 Oct 2026 06:48:22 -0400
X-MC-Unique: pb7Iyv_NOo2UQC-rFUkeSg-1
X-Mimecast-MFC-AGG-ID: pb7Iyv_NOo2UQC-rFUkeSg_1791197301
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E1C11955F6F;
	Mon,  5 Oct 2026 10:48:20 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF3521800446;
	Mon,  5 Oct 2026 10:48:15 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: helgaas@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jgg@ziepe.ca,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org
Subject: Re: [PATCH v14 0/2] PCI: Add device-specific reset for Qualcomm devices
Date: Mon,  5 Oct 2026 12:48:11 +0200
Message-ID: <20261005104814.77479-1-jtornosm@redhat.com>
In-Reply-To: <20261002234749.GA411439@bhelgaas>
References: <20261002234749.GA411439@bhelgaas>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: toCCglgFGQ8YOlOj24uMMrvmRy1ntVKk3NxDkhi0jro_1791197301
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_034828_900006_A81FEC06 
X-CRM114-Status: UNSURE (   5.45  )
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

Thanks Bjorn for the feedback, and thanks Alex for the Acked-by.

I'll send v15 with the commit messages updated as suggested,
emphasizing isolation and referencing 6a4f64c3a3ad.

Best regards
José Ignacio


