Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE65D3C526
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLSjiTOUh+E9CxgYwi1U1f5AhkZN84D58GBwPA5jKvA=; b=cntoFUm4XCiHu2VFqq38MMHmrd
	sl/n9aZLYgYbLwLVm+i/NTgsUZelv8vdWrTlDkHIxhsOON1c8/UvSvUmyWkk4oLQyKUaJRoXID/jH
	Aqiy68z/V+STWgPOr3X1r/Xl47urO4GE8FWgfUriBUktZqxpoHwrhtwWRRjrxV7WoCktCEqZZnGoa
	FGE8UWpVQLoXR9LD8pTDq06sg/XE/kRdUwKpHHl/rc+DHbV33ykxQDSqgykG/8BjfcIeFBI6SCDMs
	3iMfnjTjy1x0hRH9PSh10JrhQZUkerD6D2vzD5t6BCjqGju6Ao6cM3+dQ3zrQNTh+G41rsx4Iuowo
	D3si18CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UyX-0000000Fpmn-1lj2
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 18:11:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UyS-0000000FpkJ-31ec
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 18:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729188706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mLSjiTOUh+E9CxgYwi1U1f5AhkZN84D58GBwPA5jKvA=;
	b=Y13LKTTSmvsbx5/ZHNMf7oASjWGPYlq9xXtA8Qsh64wCFgfjrs0CLyitA7XE4agtxmtiWX
	yLOVVmms4f+TA5NNBd831TmzncGh5LiozRychF+S9DgbkW94VOg2VjMkCS6h5m+vhA+vsl
	uW/W2rr3196EzD6JhrqF6O7IJbx1HPc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-281-Ehjx0aHHPMOzPn1gosugIw-1; Thu,
 17 Oct 2024 14:10:21 -0400
X-MC-Unique: Ehjx0aHHPMOzPn1gosugIw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17D1019560A3;
	Thu, 17 Oct 2024 18:10:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.106])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D73E1956086;
	Thu, 17 Oct 2024 18:10:17 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com
Subject: [PATCH v4 0/2] wifi: ath12k: fix issues when unbinding
Date: Thu, 17 Oct 2024 20:07:30 +0200
Message-ID: <20241017181004.199589-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_111148_918222_22AE0AC6 
X-CRM114-Status: UNSURE (   8.62  )
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


