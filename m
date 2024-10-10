Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F95CFC5EC
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLSjiTOUh+E9CxgYwi1U1f5AhkZN84D58GBwPA5jKvA=; b=r//9Vk9zK+OXy86Z38ZdvV3w5B
	Qlyuug5VM8HYxR5qy0eSpBwcOHWpJ2ShxzO5B4pFCvqntt9CZvK4qsSSDwPpjUbLAAjr4Ee/AFD4t
	9/FxQRBDAIE45+gYHiKHgP9z98AQP1m0MCe4CKedhIQKmoieZXHmkbsUyIg98GFiHOAuO0x2D1GFD
	KPU4jUPDoXiuk+bD5hnE1c+vyG2ijVBUYhHVx+ml9e5wfN9w92kvuKMMjpV4R/FBVISUuOtRk7WKD
	/ry1Mcjb/FtzZumAaLMERNyvZnxdVORsFtq3GSflhy2lotRkYHzm00Tf7MA8jeqW891LY+Wga1fWI
	hmEGCFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syxLW-0000000DkTQ-0t76
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 17:53:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxLT-0000000DkSJ-09K5
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 17:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728582781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mLSjiTOUh+E9CxgYwi1U1f5AhkZN84D58GBwPA5jKvA=;
	b=faYeOsdNtn3+BmE8l6ux/LVRsovTT2vZF0hLaZS9EzeMUU+9svlzFdXI4JxE0YMSWoiUfd
	S4R79mXt2tVhNEnO32K/M4+iSjwwpbFDoZwBCIBU8ZGqFxtQ99GchUK8dHpmQ/brjb26mG
	bi63vh0g4AFXUaY08PnNChTYgmewGMk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-YefpJFcHO92pOnqSvKAYyw-1; Thu,
 10 Oct 2024 13:51:21 -0400
X-MC-Unique: YefpJFcHO92pOnqSvKAYyw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D38BA1955D42;
	Thu, 10 Oct 2024 17:51:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.239])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3FE8919560A2;
	Thu, 10 Oct 2024 17:51:16 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com
Subject: [PATCH 0/2] wifi: ath12k: fix issues when unbinding
Date: Thu, 10 Oct 2024 19:48:57 +0200
Message-ID: <20241010175102.207324-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_105303_221671_12D48594 
X-CRM114-Status: UNSURE (   9.17  )
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

wifi: ath12k: fix issues when unbinding

Currently, ath12k driver is not working from VMs but it cannot be unbinded
either from there. I would like to send these patches to fix the issues that
I have found in order to get the unbind operation working there, at least to
fix the errors found during the process when the initial error is detected.

Just FYI and out of the scope of these patches, I am unbinding and binding
to apply a workaround with an extra module to fix the MSI addressing by
means of kprobes to be able to work with this device from VMs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>


