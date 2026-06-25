Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A91CDB479
	for <ath12k@archiver.kernel.org>; Thu, 25 Jun 2026 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1RjNSxi6/DZ1slyVUbnnH4tQHsFe5xiJqc+dcxVOzE=; b=NtfnyXP0/cG8nWcHhiits+/Ts4
	psne4+gn0esW1wBP0ZWNFqQPSLrUt2z/cJld3rQH5ejQapugkNsF9/VnDVNyCuuFffdSayaZiVeXL
	cf/8WPLmDhsQ4PdVD7SceljQF2iC+qJjhsMZzR3m7r42PkWLuVF/6i56iAvRpmx6vaTUNwzJkjVm0
	i3n6KjQ6S04z0+4zE4gldbMWhCOz6PAbc97uLRRiJOGoA+usBLXpSGPdmTc7mCy8OtLB8ALf4cXgt
	tiFvCN14/D6ay/r3H7tCnJjN0RrkYUPNOhVqCFF/IZ8Q+I0o/+SBUN+FPZpZbkbYqQ2GV7cSvHcuX
	oxSNaGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchQi-00000008zec-2Goh;
	Thu, 25 Jun 2026 10:35:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchQf-00000008zdg-1yUS
	for ath12k@lists.infradead.org;
	Thu, 25 Jun 2026 10:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782383727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1RjNSxi6/DZ1slyVUbnnH4tQHsFe5xiJqc+dcxVOzE=;
	b=DOp7t6RQxSkly2Z/awxntqkvf1DBzmMlq9uCijYC4UBTbhmCShwzTTv31hhBUwFC5mYaVO
	AbGbPLDKS8GSUUDr8ycuZyYd5kqR5c6QlJ0JDh+vd7W8WmafZj0+gN9B8myTWxCVvCMta2
	A5qjCDSNGUWK+u1qGPVt9JgBflrNyQM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-XJDlf0bfPs-KqjrzTaxxaQ-1; Thu,
 25 Jun 2026 06:35:22 -0400
X-MC-Unique: XJDlf0bfPs-KqjrzTaxxaQ-1
X-Mimecast-MFC-AGG-ID: XJDlf0bfPs-KqjrzTaxxaQ_1782383721
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E0931955F75;
	Thu, 25 Jun 2026 10:35:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.60])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A052630003B6;
	Thu, 25 Jun 2026 10:35:15 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v10] Add device-specific reset for Qualcomm devices
Date: Thu, 25 Jun 2026 12:35:14 +0200
Message-ID: <20260625103514.602783-1-jtornosm@redhat.com>
In-Reply-To: <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
References: <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: LuiEI4h8yWf_yV99C5odp3sT46nKE6ACOcJbA22eqLY_1782383721
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_033529_590857_9CB85A0B 
X-CRM114-Status: UNSURE (   8.20  )
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

Hello Baochen and Mani,

> QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET is beyond the first 4K bar area hence requires MHI
> wakeup before accessing, see [1]. the wakeup callback for WCN6855 is
> ath11k_pci_bus_wake_up() which calls mhi_device_get_sync(). Not sure how this can be done
> here. Maybe Mani can provide some hints?

I've analyzed the driver code and see that ath11k_pci_power_down() calls
ath11k_pci_force_wake() before sw_reset(). 
I can add the same force_wake sequence to the WiFi quirk before accessing
the reset register:

/* Force wake before accessing registers beyond 4K boundary */
iowrite32(1, bar + QUALCOMM_WIFI_PCIE_SOC_WAKE_PCIE_LOCAL_REG);  // 0x3004
ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_WAKE_PCIE_LOCAL_REG);      // Flush
msleep(5);

With this addition, both WCN6855 (ath11k) and WCN7850 (ath12k) show successful
reset and shutdown cycles in VFIO scenarios, same stability as without it.

Do you consider this addition necessary, or is the current v10 implementation
sufficient given that testing shows direct register access works without
wakeup in VFIO scenarios (where no driver is loaded)?
If you recommend including it, I can send v11 with the force_wake sequence
added.

Thanks

Best regards
Jose Ignacio


