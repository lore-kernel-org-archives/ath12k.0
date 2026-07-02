Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39212C43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 06:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4UvuXefX8yd84GaG25xUb95oI2RF2HujmNeaEeoIYs=; b=B83LRFqTPNY8JGBsXW9hKNMpCt
	4b5AxW6fp3vvh9bYplyCTe93aK9HUJMtdHb4/11aNMx+C4sZ9/trFvF/QCk2rWOYIWZmVvuldaaiN
	AyeZWALGkTAb4bF24oBPe3EYOygArX/JtCtcwQqEB2zc7i2tldZ1cpMhHGR/SrsZovFgl9/SSinTa
	m243kUdEjsk2fMPN6Ri3MQ5HpczdXgZl/bkzLoWvubHC7+eNIRLyT/G8VD5Z80VI3bbGSJiG+uBOi
	okh+WYSdI3LziWh7BI4DZdFfgG0gbFVPB0aQZrKE/0TGlXnH0+HQLlnw0bm27ClC3IrrVu/l6zNTW
	9p6iiUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAae-00000003chU-2zar;
	Thu, 02 Jul 2026 06:08:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAab-00000003ch4-2tXi
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 06:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782972474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4UvuXefX8yd84GaG25xUb95oI2RF2HujmNeaEeoIYs=;
	b=Km8rfoS6yQjHWQnLHMmcOQR5aECqC0BfQUwINRqm8UO+BrIpJn8f0u8roTD3NXLOfHOM71
	I1cDjelgP+Fd1N000+neuA0B4VPM5ckD6OISI38h3GIQo5Nanc8aaNjwNhcmOk4Huz2EAp
	ae735jtFLc+pDqeO238HHi6mWZ+tHq8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-M9B-jmFmO5ib1ycgkmwL0w-1; Thu,
 02 Jul 2026 02:07:51 -0400
X-MC-Unique: M9B-jmFmO5ib1ycgkmwL0w-1
X-Mimecast-MFC-AGG-ID: M9B-jmFmO5ib1ycgkmwL0w_1782972470
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9801418C1054;
	Thu,  2 Jul 2026 06:07:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.33])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8963E3000C2F;
	Thu,  2 Jul 2026 06:07:46 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jtornosm@redhat.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ath12k: fix NULL pointer dereference in rhash table destroy
Date: Thu,  2 Jul 2026 08:07:44 +0200
Message-ID: <20260702060744.478850-1-jtornosm@redhat.com>
In-Reply-To: <20260615112103.601982-1-jtornosm@redhat.com>
References: <20260615112103.601982-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: sRPHJgXWHqX9zsKlsy5O5XlZQJpzA5GBtphSpXmAv3w_1782972470
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_230757_809680_7E8BC4EF 
X-CRM114-Status: UNSURE (   8.64  )
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

Gentle ping on this patch.

This fixes a NULL pointer dereference during driver unbind that
crashes the kernel when initialization failed partially. The crash
is 100% reproducible when unbinding after an initialization failure.

This is particularly critical for VM environments with VFIO passthrough.

Regarding the concern from v1 about preferring symmetric init/deinit:
I understand the preference for unwinding init failures at each stage.
However, implementing full symmetric cleanup would require extensive
refactoring of multiple error paths across ath12k_core_start(),
ath12k_dp_alloc(), and related initialization functions.

The NULL check approach provides a safe, minimal fix that:
1. Prevents the crash without changing complex init logic
2. Follows the same pattern used elsewhere in the kernel for
   conditional cleanup (e.g., other rhashtable users)
3. Has been tested and validated in the failing scenario

I've addressed the guard(mutex) feedback from v1 in this v2.

If Qualcomm engineering prefers a different approach, I'm happy to
revise, but no alternative has been suggested since the v1 discussion.

Please let me know if there are any other concerns.

Thanks

Best regards
Jose Ignacio


