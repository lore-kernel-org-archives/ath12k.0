Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421DFCA9EC9
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEcJ/pFItgtT4/Uq84V4nCOcw5lFpC5TWp8hGwZydFE=; b=2+nwBtwu814/H4+hGX3iULkCyS
	qLEeA3QrpMoILLyfFXU0WJly1JtCXtQSuwuBsQHp8MrfKFL1uoKRjRIBMT5fREM1UoLhH/YMbal63
	dFlKoUhnmDJ+ZX8xSZeGU5wCIpi6/wk7FjpFOTxpRkMZ/TFbHB59Ed0L7Wjv0r17B0pdOGSicnqFZ
	cdG5HMWqP6tEfXCtaTFsp0rUZBRmJG5WAt7QviDhnIDB3yf+PtJZo6bSIkFVvIb4mKipZ6l8ZBHza
	eDV8Wubmhtr6OfDjNGmCYqODc4DWw/W1a2Kh6Gv7KC6G1I+dKq8zSjRRw/mb4Wo0b7gONqi8sJNT/
	vod7EKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoOG-00000008puS-3paN;
	Sun, 11 Oct 2026 07:54:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoOE-00000008pts-2V9B
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 07:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791705277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEcJ/pFItgtT4/Uq84V4nCOcw5lFpC5TWp8hGwZydFE=;
	b=PnxsobV62Z3iv13XOgWya/FTYeUB2HR1PFf/PoOCZHqWP3TGhO4QhfwZ/LY0OcRxTM0raN
	cXl7BDogfzBlOQbelQrL2kf7ka/hZyiB9ex14cTtW7u1dtj6ZOzDw7718HDRVY5PBrZb1H
	qTn2O2NqXGKqpgc+sIPQJzbLX+5+ABA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-76GULbi8MJqa5ia54w_hFw-1; Sun,
 11 Oct 2026 07:54:33 +0000
X-MC-Unique: 76GULbi8MJqa5ia54w_hFw-1
X-Mimecast-MFC-AGG-ID: 76GULbi8MJqa5ia54w_hFw_1791705271
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C0F31800A7F;
	Sun, 11 Oct 2026 07:54:31 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FEC8472;
	Sun, 11 Oct 2026 07:54:26 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca,
	alex@shazbot.org,
	bhelgaas@google.com,
	jjohnson@kernel.org
Cc: jtornosm@redhat.com,
	johannes@sipsolutions.net,
	mani@kernel.org,
	yishaih@nvidia.com,
	skolothumtho@nvidia.com,
	kevin.tian@intel.com,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Sun, 11 Oct 2026 09:54:25 +0200
Message-ID: <20261011075425.516927-1-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 7L9d7qb4t7yHXPFlzSOIxlK6wjyD-EB_P5NuTGFxljE_1791705271
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_005438_732137_8096953E 
X-CRM114-Status: UNSURE (   4.26  )
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

Hi,

Since no further feedback was received after the last discussion,
I proceeded with v2 addressing review findings (Sashiko):
https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

I remain open to suggestions and happy to iterate further if needed
to get this acceptable.

Thanks

Best regards
Jose Ignacio


