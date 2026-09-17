Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDDCC982C1
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 07:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMxOVldMppZYEYJrsXwBLCFt4totNBD3YxtZh9MydWg=; b=KW84VyA3/GDYniwXjkYchYhQrN
	BuX2EQwtTmxPn8lO7U7VD/NlKj6NGLn1DXb1AHK6bAeeKfJj10A6BQfBAIHse41Hikrhi4wS0W5wz
	4I3cqKkEV3EBYCcDVBXcqiX5DMdcT/q5QGnGtMSSeqHI9AkG7OKdsF9bGu2Laiz1aFC6NMdv1S5bg
	6IZaEiuyoNGriRbor/YTHuVUK/sUqd8qpPcvzvrII7RRXhJAihbASyK3Ybc7mBCANhgY6F4tY19jh
	ACL/md0s5MglCUMGuJbI7HDgrZILeV9opPa83lRCbcVoMJv5no/PirCx8j4QXYLfJR6timCodgXgi
	Oprk4frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76lC-0000000AnIx-1JmW;
	Thu, 17 Sep 2026 07:42:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76l8-0000000AnFc-3s62
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 07:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789630937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMxOVldMppZYEYJrsXwBLCFt4totNBD3YxtZh9MydWg=;
	b=iAR/0uJ2bdxMR+OQ1JmoJuYZ0Usb4oCN6JCfUYurqF3+WmYgbRsp/e752pDtWZnvQew/TO
	8QMQOvxotc2JGNZMx7d3wIOhCWeSHzm6arqvvXEmNyngfvyXp/c+8cvV4RKtmSd6DVdank
	4XsFPdHcBASyrGI4wQMkINgHlELjYLM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-GQDA2DOYMw2bf1RgTwG5uw-1; Thu,
 17 Sep 2026 03:42:14 -0400
X-MC-Unique: GQDA2DOYMw2bf1RgTwG5uw-1
X-Mimecast-MFC-AGG-ID: GQDA2DOYMw2bf1RgTwG5uw_1789630932
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2BB9195F144;
	Thu, 17 Sep 2026 07:42:12 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9BAA11977588;
	Thu, 17 Sep 2026 07:42:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/3] wifi: ath12k: fixes to improve MLO station stability
Date: Thu, 17 Sep 2026 09:42:07 +0200
Message-ID: <20260917074209.15553-1-jtornosm@redhat.com>
In-Reply-To: <20260804175004.1761075-1-jtornosm@redhat.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 44sRN7NDqZPrKbBPwDxNNQ3Oo5KH4K1jkoXyF9-M5R4_1789630932
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_004219_316177_BE8EAB5A 
X-CRM114-Status: UNSURE (   5.52  )
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

Hi Jeff, Baochen,

Friendly ping on this series. v2 addressed all the comments from v1
(rebased on ath/main, removed HAL CRASH_FLUSH guards, fixed radio[0]
usage, dropped patches already covered by Baochen's ML peer ID series).

Any further comments, or anything I can do to move forward?

Thanks

Best regards
José Ignacio


