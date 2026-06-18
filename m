Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984BECD98ED
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 06:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxEPUDJEb/E2TNBGBdy1DqfUWhcoKOjLbBcYOBP7BPY=; b=CfA1M3BticpZRUvZrw3vZJoEAE
	RruFDF/QuDMAgwR7d6aTST+apJHkB27GKgQOJTJyxXHbkhEsaZhlAlfv7dCY5fjPHA6A1ph5gUbui
	dhZupuitdBOU8fQFiIC8Eg2+Zjfsg0Tjk0eTYkyamW7WAFGOio0K+pFnUItpn4dKa4n9XNll7gh1v
	ThguNzh7UnQZjMe/2RuQx2te7aRI73bcumfLWWBLFQLFApSDJvEPcuGXIdQXd7FwyWvg+zEyAb660
	jUdSEeXnxkVlFEhE72QTeVAxj4NouXgXUVtWOy8qpqaMWWozvhxlOEl8BKTUmIZvlBF1ZxeE0ph3Q
	o1ws/Uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Je-00000000hFD-0Tbw;
	Thu, 18 Jun 2026 06:33:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Jb-00000000hET-2crO
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 06:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781764406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxEPUDJEb/E2TNBGBdy1DqfUWhcoKOjLbBcYOBP7BPY=;
	b=E1coXiMWys6+060hmuP4Ka7LZXAhJDypjqOWuxCN7CSjkkpWv2Wy1t+WW2rRpOLE157NTv
	81dECEgkzVDFlE5tx107AvuqLUY6y2V+yoFPy96w5Yb0QW1UDaLVWmH28RHfiN2qgvz7Qg
	nDSi91d7UCNJx5u7WhVz8Pa8xAH9iJg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-sZX7nJgjPVaSpqNJyJkT1w-1; Thu,
 18 Jun 2026 02:33:20 -0400
X-MC-Unique: sZX7nJgjPVaSpqNJyJkT1w-1
X-Mimecast-MFC-AGG-ID: sZX7nJgjPVaSpqNJyJkT1w_1781764399
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54C011955F0A;
	Thu, 18 Jun 2026 06:33:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 589073000238;
	Thu, 18 Jun 2026 06:33:13 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: mani@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Date: Thu, 18 Jun 2026 08:33:08 +0200
Message-ID: <20260618063309.9536-1-jtornosm@redhat.com>
In-Reply-To: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
References: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Og_vNpoqM6IjwsdGJ7CgQ1Ayb08VpQRcfuuqF_0ZEjk_1781764399
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_233327_730897_5BF843DA 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Mani,

Let me clarify the exact scenario and where the reset is necessary:

* For the commented WiFi devices (WCN6855/WCN7850):

Standard VFIO passthrough flow (this works fine):
  1. Unbind native driver (ath11k/ath12k/MHI)
  2. Bind vfio-pci driver
  3. Assign device to VM
  4. VM boots, loads its own driver → device works perfectly
  5. VM shuts down cleanly → device can be reassigned → works fine

The problem occurs with unclean VM termination:
  1. VM crashes or is force-terminated
  2. VFIO tries to reset the device before reassignment
  3. Without a working PCI reset method, reset fails
  4. Device stuck in undefined state → cannot be reassigned to another VM
  
     Unbinding the driver again doesn't help because the device hardware
     itself is in a bad state. From hypervisor:
     $ lspci -vvv -s 0000:03:00.0
        03:00.0 Network controller: Qualcomm Technologies, Inc (rev ff) (prog-if ff)
            !!! Unknown header type 7f
     And a full host power-cycle is necessary to recover.
     
* For the commented modem devices (SDX62/SDX65): 

Even worse because it fails during the first VM boot without proper reset
capability, standard VFIO passthrough flow:
  1. Unbind native driver (MHI)
  2. Bind vfio-pci driver
  3. Assign device to VM
  4. VM boots, loads its own driver and crashes:
     [   24.024165] mhi mhi0: Device failed to enter MHI Ready
     [   24.024168] mhi mhi0: MHI did not enter READY state
     
     Unbind/rebind attempts fail:
     [  352.643601] mhi mhi0: Requested to power ON
     [  352.643611] mhi mhi0: Power on setup success
     [  373.442954] mhi mhi0: Device failed to clear MHI Reset
     [  373.442970] mhi mhi0: MHI did not enter READY state
     And requires a full host power cycle to recover,
     even outside of VFIO scenarios.

* MHI Host driver's remove callback may handle clean software state
teardown, but it doesn't provide a PCI reset capability that VFIO can
invoke. VFIO needs a reset method registered in the PCI reset hierarchy
(device_specific, pm, flr, bus, etc.). VFIO invokes this reset both during
initial device binding (before the VM starts) and when reassigning the
device between VMs - without a working reset method, the device cannot
reach a clean state for initialization.



I hope this clarifies the scenario better. Please let me know if I can
provide more information or run any specific tests to help investigate this
further.

Thanks

Best regards
José Ignacio


