Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3842FC531FA
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY8zT4JmqSPdATyDqCCVUYQ0HFP8LkYhfzBPXdqUyvA=; b=TAOKM6VtiAA+XZDURpS5MQRKKS
	GpiQMSPV4S20LAuvEA+5Rh+/UJDQoPp26GAJBTnIEB0/vCQgXQqR50X8yDaUIJGJXtDYvaxXnvsky
	HsGOB7IYAaGSrODsMCQkHtUNlS/Oi971J06W6O6tupDw7h7FEY48PKeOSFSSRnX476KX38nn05tsv
	cUlfTJcFUV+4EQf5kJUc47QysCg0eBxwyYkb8SL3p5WC8QK/Wik3hQLpIfOCL+a43vEhAJ0RHKomH
	T+sg3amu33ZzpfTNrAqJT6dVoKOATPiPZX7ihbQ+TF4fFznQi3GP3to/sThmyGjPkPsDN+00cxMCB
	bjWbC5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCQU-0000000FzbT-2frK;
	Fri, 24 Jul 2026 09:42:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCQQ-0000000FzaD-3Z4Q
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 09:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784886158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YY8zT4JmqSPdATyDqCCVUYQ0HFP8LkYhfzBPXdqUyvA=;
	b=XJjO+oQsHdBSO6a5lxDRMSzQUgHYVBlY4BMhSDrwJHfHrr0ApfmlKa8ZF0TGjGQ2nNt7/L
	TqYgWrx5juDEjNkMgy7NmfTSG9tvnROa2JJPV37Ypl9v1dmUGl+R4Fw0RXaSNnIf/X1Ndf
	WuXKWSnHJGRuYPdCEb4ukzJxrNTEjoM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-4kBllGYVNnGpIMs-uDq9KA-1; Fri,
 24 Jul 2026 05:42:33 -0400
X-MC-Unique: 4kBllGYVNnGpIMs-uDq9KA-1
X-Mimecast-MFC-AGG-ID: 4kBllGYVNnGpIMs-uDq9KA_1784886152
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D29D81801201;
	Fri, 24 Jul 2026 09:42:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5667A1954226;
	Fri, 24 Jul 2026 09:42:28 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
Date: Fri, 24 Jul 2026 11:42:10 +0200
Message-ID: <20260724094226.227200-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
References: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: B086Dcyqx0ox0vjpu1rplTip7vN3kK4VcPmLXGz9opg_1784886152
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_024238_952605_1401966F 
X-CRM114-Status: UNSURE (   4.62  )
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

Hello Tamizh,

This is the same mapping already used by WCN7850 via skb_get_queue_mapping().
The patch only aligns WCN6750 with that existing approach.

Thanks

Best regards
José Ignacio


