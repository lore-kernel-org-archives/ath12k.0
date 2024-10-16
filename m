Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAFED1AD53
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fxQ2m9WNRH1Jtz7v1wsGZ2v7fCiu2LTJ3s6phMhobAM=; b=DwAlm/6QCEnNqxgjishXX2fqVM
	jBjw0NkE4bIraGlQy4Gq7hpVNd0ueewJ+YpljM0ZMsrlpHHOrtB6pZFKYCNah5SLMfRi/kULnuuQ8
	XCsw33QjHcuylXnQHSKqJdY4tZ09ZjrkBDVsKTrA7z/thvKuc/I+cXsMLSfFtev5m+qU2Znq/SNu3
	gGBGPczE+7nW97MR8ks0GNNSlABWoLzgP8AeZO+sLq39/z0GRTfENWwg375JfS+KgM0XcMHQYafDq
	WlWBDS0GiFa0HxkZSwAm1SWA19cjq9Lop5yOpVTATfTfq/3L8xRBDoklWU1blTQVXwosImt+1azzr
	cy+8TuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t13FA-0000000BkvF-1PPD
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 12:35:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t13F6-0000000Bkuo-1zZh
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 12:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fxQ2m9WNRH1Jtz7v1wsGZ2v7fCiu2LTJ3s6phMhobAM=;
	b=Ntyg635i6QtjXn/+kG6CUrW0R8JT4AUuf/7Nn4S5q4ALw+iTpQl96pVWmzp2Zho41wpCao
	e7+laDcgGN+Tp2y4EkS3SiXhmafbtR5jQBg4SXOXWWp30gAE2LG2PdHMHDYI+NgL9OpdbB
	tTl7KSnoLIhvwlwd5xrJIGxLXesd/bI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-416-J-AnC9xANo2B9f_KCGF05A-1; Wed,
 16 Oct 2024 08:35:05 -0400
X-MC-Unique: J-AnC9xANo2B9f_KCGF05A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13E5C19560B0;
	Wed, 16 Oct 2024 12:35:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.76])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B4AC19560A2;
	Wed, 16 Oct 2024 12:35:01 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath12k: fix crash when unbinding
Date: Wed, 16 Oct 2024 14:34:47 +0200
Message-ID: <20241016123452.206671-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_053508_605905_CFCC183C 
X-CRM114-Status: GOOD (  12.91  )
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

If there is an error during some initialization realated to firmware,
the funcion ath12k_dp_cc_cleanup is already call to release resources.
However this is released again when the device is unbinded (ath12k_pci),
and we get:
[  382.050650] BUG: kernel NULL pointer dereference, address: 0000000000000020
[  382.050656] #PF: supervisor read access in kernel mode
[  382.050657] #PF: error_code(0x0000) - not-present page
[  382.050659] PGD 0 P4D 0
[  382.050661] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[  382.050664] CPU: 0 UID: 0 PID: 6541 Comm: bash Kdump: loaded Not tainted 6.12.0-rc1+ #14
[  382.050666] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
[  382.050667] RIP: 0010:ath12k_dp_cc_cleanup.part.0+0xb6/0x500 [ath12k]
[  382.050688] Code: 8b 76 28 48 8b 7b 10 45 31 c0 b9 02 00 00 00 e8 30 3d 35 c2 be 02 00 00 00 4c 89 f7 e8 e3 00 fb c2 49 83 c7 28 49 39 ef 74 31 <41> f6 47 20 01 75 ab 4c 89 ff e8 2b de a2 c2 84 c0 74 0e 49 8b 17
[  382.050689] RSP: 0018:ffffa3e3c0e83990 EFLAGS: 00010297
[  382.050691] RAX: 0000000000000000 RBX: ffff90de08750000 RCX: 0000000000000000
[  382.050692] RDX: 0000000000000001 RSI: ffff90de08751178 RDI: ffff90de08751970
[  382.050693] RBP: 0000000000005000 R08: 0000000000000200 R09: 000000000040003f
[  382.050694] R10: 000000000040003f R11: 0000000000000000 R12: dead000000000122
[  382.050695] R13: dead000000000100 R14: ffffffffc0b6f948 R15: 0000000000000000
[  382.050696] FS:  00007f216b1ab740(0000) GS:ffff90de5fc00000(0000) knlGS:0000000000000000
[  382.050698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  382.050699] CR2: 0000000000000020 CR3: 000000001a26c000 CR4: 0000000000752ef0
[  382.050702] PKRU: 55555554
[  382.050703] Call Trace:
[  382.050705]  <TASK>
[  382.050707]  ? __die_body.cold+0x19/0x27
[  382.050719]  ? page_fault_oops+0x15a/0x2f0
[  382.050723]  ? exc_page_fault+0x7e/0x180
[  382.050724]  ? asm_exc_page_fault+0x26/0x30
[  382.050729]  ? ath12k_dp_cc_cleanup.part.0+0xb6/0x500 [ath12k]
[  382.050740]  ? delay_halt_tpause+0x1a/0x20
[  382.050742]  ath12k_dp_free+0x67/0x110 [ath12k]
[  382.050753]  ath12k_core_deinit+0x8d/0xb0 [ath12k]
[  382.050762]  ath12k_pci_remove+0x50/0xf0 [ath12k]
[  382.050771]  pci_device_remove+0x3f/0xb0
[  382.050773]  device_release_driver_internal+0x19c/0x200
[  382.050777]  unbind_store+0xa1/0xb0
...

The issue is always reproducible from a VM because the MSI addressing
initialization is failing.

In order to fix the issue, just set to NULL the relaeased structure in
ath12k_dp_cc_cleanup at the end.

cc: stable@vger.kernel.org
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v2:
  - Fix the commit size in Fixes
v1: https://lore.kernel.org/linux-wireless/20241010175102.207324-2-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath12k/dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 61aa78d8bd8c..789d430e4455 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1241,6 +1241,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	}
 
 	kfree(dp->spt_info);
+	dp->spt_info = NULL;
 }
 
 static void ath12k_dp_reoq_lut_cleanup(struct ath12k_base *ab)
-- 
2.46.2


