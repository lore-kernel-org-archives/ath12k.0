Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C306DC982C1
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 06:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3gh9xfQo/aWe9NTkMuu8d6h2PqoLGornjU7sCJIkzs=; b=eTXffwQG94hTE88Jo909HZWvyC
	n8DnA3UbH9rTJdVYH6Rw/s7lqTB5Z3orLqkI0HtzgicMk2wglxSpkU6pjtT1HNupId94MTkKtY4l1
	D7GSetHwbRGZJAL9nO3RUzeq4wwLr4L7rAUrh9rNkLwvkXcysfzwpelN8hdDOL0PSnKhwITHRLjI+
	eqms8yJ3yxOX9QULqkJBr4T6NE94NXsApEwuZSInpGXG64PY48zGGi2qnPwM6Ztz2XPfwX50C/ppd
	7CLW3+VYFXZaoCFSND94x9fFuHCJFqi9UbRfbGKkONHP/80HUVY2YPSwQArX4NQmskkrQYNJSiEXd
	M+xjefoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75gH-0000000AfUq-0Qhb;
	Thu, 17 Sep 2026 06:33:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75gE-0000000AfU9-3h4t
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 06:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789626788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3gh9xfQo/aWe9NTkMuu8d6h2PqoLGornjU7sCJIkzs=;
	b=isztPWKnpWqLDJWsBBGcHywlQInoFlaUmJpGIxfgzM77DMAr3uqaCRdhofZK48vizOt4Qv
	q9nRDgtYdWmFm3oHrfbakj3EEX+Rlc/R62YlDbzuXdZuwerapr5gr4n3VBE6nJKqRz+NKw
	jP6+wcCnS8wLNRdDAdOqV9LN2F1AA4o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-tlbqaWevOFyFAdsXmJOHNA-1; Thu,
 17 Sep 2026 02:33:04 -0400
X-MC-Unique: tlbqaWevOFyFAdsXmJOHNA-1
X-Mimecast-MFC-AGG-ID: tlbqaWevOFyFAdsXmJOHNA_1789626782
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 589DD19541A0;
	Thu, 17 Sep 2026 06:33:02 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ECB661800352;
	Thu, 17 Sep 2026 06:32:59 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Thu, 17 Sep 2026 08:32:57 +0200
Message-ID: <20260917063258.11886-1-jtornosm@redhat.com>
In-Reply-To: <170a200e-f0fc-4e8f-a7c6-72294beb185a@oss.qualcomm.com>
References: <170a200e-f0fc-4e8f-a7c6-72294beb185a@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 19Oh9KulwTjZyVZuVv9cBY_gDf_49pjkKs_5oDi9ghg_1789626782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_233311_006639_1141F216 
X-CRM114-Status: UNSURE (   7.11  )
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

Hello Jeff,

Sorry for the late reply, I was on leave as noted in the v6 cover letter.

> Yes, but if that outer spinlock is ever removed, the inner spinlock would no
> longer be correct. So the defensive pattern is to use _bh in both places, and
> both of my AI review agents concur with this practice.
Ok, changed to spin_lock_bh() in both ath11k and ath12k for v7.

Thanks

Best regards
José Ignacio


