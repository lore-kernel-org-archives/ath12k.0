Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082CBCD4F25
	for <ath12k@archiver.kernel.org>; Thu, 14 May 2026 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pypQ7v8CL+JVUFgy4Cs0pmMSwYEqYl/E2yJuiq2o++w=; b=KxcxB2wue/EaboNCSV6AeGOnUl
	1+MFbx8IGJNl7rGWxRejrSaMuH5QyC5X9q4Ex4Ax4C8WncSYyDg52p1E+Dp3I2O3AGDKCczcdTrtS
	LhmhJPEipdvT1bjJ3xywxcbP1jnIj1KIgSuYvaafIx1ProDXVBlDfmMSBQaO3rEAlseej2tBiFcQ7
	U08QkCsoQbrmXI+fGrz5l7kzgAY2rediybZIeCbAiw4+JwUn9DSL9jTrr9ADfh8lxNww9QdqDqcLY
	gpGokvgce46A6Npm4ja1Ue9ljg3XgNXd3S3fmb3DXmwAbcecDF3zZRQczZfARQJQBbTTnKpUq+Ln+
	QwkTDymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZmD-00000006C3l-2tQT;
	Thu, 14 May 2026 17:23:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZmC-00000006C2n-0Z6m
	for ath12k@bombadil.infradead.org;
	Thu, 14 May 2026 17:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pypQ7v8CL+JVUFgy4Cs0pmMSwYEqYl/E2yJuiq2o++w=; b=AoI0U51BFsVm5neS60WXXwQWUi
	6G+6sXGB/kGAaZZk8dLYAs6vr2Ft6ZfLzHn8vU7a3OXS8Ms92k45UDcOs5GDnOT0yqiIValNFMYSX
	IusoyhfkR/KAyEfspQBmdi50txHTIE6baD0JGVapjai440gML3iQO1ORCdJhNkiNhTz3IFlLmsPVR
	5D8WRsybz3FCBxEPlsY0SEQlq3PKNp7m3/iSmpKR0HFXB5E5qvTPq+auV4P5cmBANSKjvbpIgNeHH
	RGTGmY7hmeF8mKkB2ylSn4BR9nrhsD0LxGQEQ+ilfEbMlGpkLbF4twR2hyTlCdugXl4j4c408y2Xu
	lMR72dRw==;
Received: from gollum.nazgul.ch ([82.197.176.155])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZm7-00000003UWk-463O
	for ath12k@lists.infradead.org;
	Thu, 14 May 2026 17:23:10 +0000
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 665d8560;
	Thu, 14 May 2026 19:20:50 +0200 (CEST)
Date: Thu, 14 May 2026 19:20:50 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Maxim Storetvedt <m.tvedt@tutanota.com>, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, jjohnson@kernel.org, kvalo@kernel.org, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: ath12k WCN7850: Q6 Hexagon fault at WLAON region 0x1792000 ~2s
 post-AUTHORIZE on X1E80100
Message-ID: <yjintdxwvtkgpehyjdtrs4wdwfli3c2vdyp2bweiauwssywjl5@srrtguf5eq4i>
References: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
 <0b450204-9afc-4ba1-b9c5-1876b5a7078a@oss.qualcomm.com>
 <tzkh5t3bmiqff67g72rihapizz2u2dlj4xfrr324d6yg4rtltt@3qrsymzw7c2c>
 <92ace4b9-143e-4962-90fa-215a22e24796@oss.qualcomm.com>
 <cz6dbqafvulifyrefsxzwrlq5z5uojylphqkq5oydbn2bvcns5@bhj3hr2rvxhq>
 <fxrzvhcrbkugzfzmj6h5netczccav5hxfefzyns67t5jhakk5w@pp6addxjkdb2>
 <0ef41d1f-e9ec-4f90-9f6a-77cb8fa3a7e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef41d1f-e9ec-4f90-9f6a-77cb8fa3a7e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_182308_371511_3D40CFD6 
X-CRM114-Status: GOOD (  13.39  )
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

Hi Baochen, all,

On Thu, May 14, 2026 at 09:55:30AM +0800, Baochen Qiang wrote:

> > With that fixed, the firmware error is gone, and we can now receive
> > and IP from DHCP.  We're working on getting the TX path work next.
> 
> OK, good to see it gets fixed!

Since today we also got RX/TX fixed, so we have now an initial working
ath12k device with our qwz driver on OpenBSD.

What is still missing from the firmware side;  The PCI-id of the
WCN7850 chip included in the Samsung Galaxy Book4 Edge isn't included
yet in to the Linux firmware package.  I've addressed this a few times,
but unfortunately no feedback.  That's the additional PCI-id line
which is required for the Samsung Galaxy Book4 Edge:

--- board-2.json.orig	Sun Apr 26 08:06:37 2026
+++ board-2.json	Sun Apr 26 08:07:45 2026
@@ -160,7 +160,8 @@
             {
                 "names": [
                     "bus=pci,vendor=17cb,device=1107,subsystem-vendor=17aa,subsystem-device=e0e6,qmi-chip-id=2,qmi-board-id=255",
-                    "bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8003,qmi-chip-id=2,qmi-board-id=255"
+                    "bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8003,qmi-chip-id=2,qmi-board-id=255",
+		    "bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255"
                 ],
                 "data": "bus=pci,vendor=17cb,device=1107,subsystem-vendor=17aa,subsystem-device=e0e6,qmi-chip-id=2,qmi-board-id=255.bin"
             },
@@ -202,4 +203,4 @@
             }
         ]
     }
-]
\ No newline at end of file
+]

With the resulting 'qwz-wcn7850-hw2.0-board-2' firmware board file,
we have now proved that the ath12k driver is working with Linux and
OpenBSD on the Samsung Galaxy Book4 Edge.  Maxim Storetvedt did test
with Linux.

Given that, would it be possible to include this PCI-id to the next
linux-firmware package?

Thanks and Regards,
Marcus

