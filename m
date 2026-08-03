Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E797C55184
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk0+6ARBqcP9auye9CJ7PQZYSy+uWfnEwN1ENbN5FxA=; b=m9ThMSB95DjpjBd4/z0UcT8csv
	dqRO6JacY4xNVY4ySwAn9BqTlivYu44ZUMReG7Lcp2PmX6OZVLFL6vn52kbHA3uE1JRtLc+zpSatZ
	PnDcp/IWwod8XWzmXKVe8MPxupuyfslsmjxk0eKLfDGCeO1Gf2OLITyl3nEo8larB39DDgzXxZOqW
	6ypfV/bkEfKRZ+1UvaZb2ltjFPXFrTRLBidpmJZXgkwQhI02lmPVbbR4rSDMChsYfTi++L/ct0wt/
	L0vE7ZibivWrXn+O5Iaza2H+eH+k7gsQ0oItMLMh9MXgqHf33q/K/ryiBS508GwuHXpsfiav3YdYc
	ZzoLqD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquLY-0000000HU5k-3h7V;
	Mon, 03 Aug 2026 15:12:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquLX-0000000HU4q-0cF5
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 15:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785769974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rk0+6ARBqcP9auye9CJ7PQZYSy+uWfnEwN1ENbN5FxA=;
	b=N4i/Pnun0hxwAFRzH9QLCvSjbLLFsX/jpqM+Kbm6qc4TFv4vdje+XxnULBOsS23LJPUtxO
	Fj+LZmOb/0Gqw//iuuB+DoNv3CF8lfjsWqi02gp25/v6gGLdO7Mm4XB4BXQkaFmh3RwHrq
	CteZ7yxmwgGohECtscB6Fm9f4RSaAjg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-dhasU5nhPTWKT7lp6M0ttw-1; Mon,
 03 Aug 2026 11:12:51 -0400
X-MC-Unique: dhasU5nhPTWKT7lp6M0ttw-1
X-Mimecast-MFC-AGG-ID: dhasU5nhPTWKT7lp6M0ttw_1785769969
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 509DC1956046;
	Mon,  3 Aug 2026 15:12:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.107])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E8276195608E;
	Mon,  3 Aug 2026 15:12:46 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/5] wifi: ath12k: fix MLO dp_peer ID desync with firmware
Date: Mon,  3 Aug 2026 17:12:44 +0200
Message-ID: <20260803151245.28946-1-jtornosm@redhat.com>
In-Reply-To: <f7e90024-df8e-4fad-ad42-864c092a56d2@oss.qualcomm.com>
References: <f7e90024-df8e-4fad-ad42-864c092a56d2@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: OT3SoYEmlE-WfscUzxSDaxQ8Ve0YO-XNkXJmphSAgZ8_1785769969
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081255_243381_366CD475 
X-CRM114-Status: UNSURE (   6.43  )
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

Thanks for the pointer. I will test with the fix from [1] on
ath/main and drop this patch in v2 if it fixes the problem
reported here too.

[1] https://lore.kernel.org/ath12k/20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com/

Thanks

Best regards
José Ignacio


