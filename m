Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF14ECA5FC7
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kog7asmMh6wog1adNQUGIn243OW/BEgANRMVLg38o7k=; b=t7VmyurTNv6xs8JO9s99f6CA2+
	0Ja783GInuhfsCKWcEsjCqzZzRFVpMvyoCHpEsIkUWv9o8Kvvy7oIVel6SBBeCMK5rxP4b7JMGPqY
	LWHlAQqcSLMJzRDdKQn01r5eAZhs23aATZwKKo5mtZfLfNpUARjtHX9NH7ZFF2Rr3VPnQmmLTHmZc
	3hFTz4SxMCw2L3m/iOj+Qih2g3JBSr8vj1JcloP5Hsh1E01OnKW2OG2OH/vppxBMJfmsTOGYGWGrW
	sjr2Y2JRzXEhTrLSj2w/4qlOSGUyDeC1MHPHka/x8ypmAkLib74uERLj10EV9bs+bdqU+50eyahzx
	UTbkvoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1S-00000006F7j-1i7e;
	Wed, 30 Sep 2026 14:11:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1N-00000006F5a-3Al4
	for ath12k@lists.infradead.org;
	Wed, 30 Sep 2026 14:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kog7asmMh6wog1adNQUGIn243OW/BEgANRMVLg38o7k=;
	b=ha9U6P/5yRbPSvfKUiio+hCm+iNn5nkQRjvfEoDttctNx533AjKfJOJQzVBe6eje08f3BU
	Qe531WJcHQMyFgRgQB2CS0ziwsAAE+HVvxvp7rSUjztCTv1ge2WYw4z3cqNJlLDz3Vp2iR
	VHOz573M4fzJEjiOnBl1B6Q3W9PxpK4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-DJl6E92WOv2gFGzQ13y3SA-1; Wed,
 30 Sep 2026 10:10:53 -0400
X-MC-Unique: DJl6E92WOv2gFGzQ13y3SA-1
X-Mimecast-MFC-AGG-ID: DJl6E92WOv2gFGzQ13y3SA_1790777451
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF668197700A;
	Wed, 30 Sep 2026 14:10:50 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18C2C1956044;
	Wed, 30 Sep 2026 14:10:46 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	jjohnson@kernel.org
Cc: johannes@sipsolutions.net,
	mani@kernel.org,
	jgg@ziepe.ca,
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
Subject: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Wed, 30 Sep 2026 16:10:45 +0200
Message-ID: <20260930141045.577212-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: m8ZivKRdNNLI522mXh_Sobkku_1W9dfh-IGZ6mTwG2A_1790777451
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071058_450801_701C21CD 
X-CRM114-Status: UNSURE (   8.80  )
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

This series enables Qualcomm ath11k/ath12k WiFi devices to work in VM
passthrough scenarios, addressing a long-standing issue where these
devices fail to initialize when passed through to VMs via VFIO.

Qualcomm ath11k/ath12k WiFi devices have been broken in VM passthrough
since they were introduced. The devices use an embedded interrupt
controller that requires physical host MSI addresses programmed to
device registers, but in VMs the driver only sees virtualized guest
addresses. This causes firmware initialization to fail with errors like
"BHI offset: 0xffffffff is out of range".

Multiple attempts have been made to solve this over the past 2 years:

March 2024: Workaround using module parameters [1]
  - Required manually copying MSI values from host to VM
  - Rejected by Johannes Berg as too manual, suggested VMM solution

August 2024: QEMU + kernel solution by Alex Williamson [2]
  - Kernel disables MSI virtualization, QEMU intercepts config writes
  - Uses brute force pattern matching to infer MSI data writes
  - Stuck as RFC - no progress in 8+ months

No action from Qualcomm: Despite multiple reports, no vendor solution

The solution in this series provides a clean, kernel-only solution that
addresses the previous concerns.

Architecture:
1. qcom-vfio-pci variant driver caches physical host MSI values and
   exposes them via extended config space with magic signature "QMSI"
   In this way, device-specific hardware quirks belong only in kernel
   drivers, not userspace, independent of the tools used.
   This follows the established VFIO variant driver pattern used by
   other drivers like mlx5-vfio-pci (netdev tree) and nvgrace-gpu (platform
   tree).
2. VM drivers (ath11k/ath12k) automatically discover and use cached values
3. PCIe link recovery handles VM timing variations

Thoroughly tested: 3 VMs across 2 WiFi generations, all devices successfully
initialized and are ready for use.
- VM1: ath11k (WCN6855)
- VM2: ath11k (WCN6855)
- VM3: ath12k (WCN7850)

[1] https://lore.kernel.org/all/20240322104912.94811-1-jtornosm@redhat.com/
[2] https://lore.kernel.org/kvm/20240812170014.1583783-1-alex.williamson@redhat.com/
[3] Original problem report:
    https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/

Jose Ignacio Tornos Martinez (7):
  PCI: Add pci_find_free_ext_cap_offset() helper
  vfio: Add qcom_vfio.h header for MSI cache protocol
  vfio/pci: Add qcom-vfio-pci variant driver
  ath11k: Add PCIe link recovery retry for VMs
  ath11k: Use VFIO MSI cache when available
  ath12k: Add PCIe link recovery retry for VMs
  ath12k: Use VFIO MSI cache when available
--
2.53.0


