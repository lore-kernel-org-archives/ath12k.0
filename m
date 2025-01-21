Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A2C02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EfEz8vizuQoVkRitl/ucOWM7li3IRfnr9/8/F2wewm0=; b=uNqE/2i3pIZQMiFugvvA5zs/mf
	lERubMnysOK8yK3NHhApmm8S/dI+v4AAY7BM2Vu4Qx4qB5V6YwF0QuMJLzIHBBIKM8gYoZECy3+Tl
	8I0y5ueKOOcMqo36shA3YV5skh6w8nBsxfMF/pkkWc5nspAmcMSXFRgRnfsTlNjSrP0Z9jA7/ka1I
	Kmn0mbSwDWEd0naZI+AynmEK9gU8xoAs49nJ+FPdvzZNf8/K60TfU4Ab/kss89BGx1FOyjIaekFme
	V328zFexCYDJGkIMmKuvplFZU3oV0WVvpp6symHTsZ5yd77QWqmy4Bo1kG/kOsNIJEX7TsH0xFJJx
	D1wHUiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taF84-000000083Py-3OsL
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 14:21:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taF6X-00000008350-0AB2
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 14:19:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so4355218f8f.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 06:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737469182; x=1738073982; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EfEz8vizuQoVkRitl/ucOWM7li3IRfnr9/8/F2wewm0=;
        b=mOuwk/Ygzg8ol32ioVwPvOyJoKzoDjFHyViHZxW3bPgp7/SozlHhl/c223ceSD+FYw
         IaDoTADaiChVbPAlcYaJAlN4w6meDKXS0RePYS0b6oaODX2KCwE3k7kbQJwmeNvpx75P
         n/o8+xDiOKIdTwPHyciLdRuw0EBW+qRPEI9yXaEEKLw1i7BDEE4vgy/sSE1wgBjE8aZ4
         1lP6Cw1g8S4mNusAn9WrgNGUByzJ8VVsV5E47Es0jwfVMjrqzM2W1L2+Km2aVNmgCRJG
         XtS/Mnt9sPnqGqyjrGSqtHF4Q4Y4+qLJ1UVRmWoJqE+xwuk8cQow0YatFTJf4IMyWpet
         cPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737469182; x=1738073982;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfEz8vizuQoVkRitl/ucOWM7li3IRfnr9/8/F2wewm0=;
        b=qCJYeTmoYmxs38vx5UNBqI0DP+wWf9nFH13DN3LCE1No59tH+65W+Nh/0D6VhbLQP2
         +hCrjz0ye9FWB5RTYqP9wk+OvcrXaamdpAQZtaxlCiyhHWFqXjnaWxd+sl+QS98EBWy3
         H9XsbX4RNJ/7hKRvrDZiuUws+KNV5MKgrIoP6bYKWZ+2NsSr584J88hdr84mxsIVDBGt
         9sscmEvpAf+HPiTBzHfA90bBllD4qjU/7uOMOu3/r2SW+6S/SA3g6e0IIxIgbBRXoBTt
         YRl93HsyxHvtncjGvBHUhAR4uvMLzfFiMi4aDSDnXYJvg1E81zQI/tjLt//Z0KR+D4U8
         67cg==
X-Gm-Message-State: AOJu0YwpDASLvDeSpzEv4CxBm5ICm5yb43M+CN+3UNsQ2WEt1Js59+NM
	xIfYThcvBRDQYqwGsdt6sDzcvR2MbKG9nPT5Wi8qaHGQm3Q21EeoVVvviA==
X-Gm-Gg: ASbGncuCmFCjDCYm6yyVIqUVC6RAGHfZB37eUoap1/jemKwmS8f3DSOm80OJ6+YEKFu
	JRdoFdffE/AsWlrlgZXR9E4z7szVPWyxd0FB65wh9kgvo+KlkFSkUkRyxojLlFsv5B9aiy8mgdJ
	MZ/3at9iNql/skOhKa9rb2YOqhb9KUou24VhUP5GUnoETyUaXpwTsOdznBow5mmMcM/q7a6l4Pn
	wI3baonFewcthtWiDLxbfFmtY7Qo1t1hepdG00tKSnlW+wsCcOgOE36GXqSCDPj7Vx0FdUk04Kv
	LnYqmCsXrywRnrM5BSxV8Z4r6UuJfXU5PrEOAvo4rJyI6YQ=
X-Google-Smtp-Source: AGHT+IF+sVxJl2tEzD0qTLjPst4I3hRhalC5Jf+faBPbBDmthHLkspsLPwaRVa2Pm1bLh/0c5A4NbQ==
X-Received: by 2002:a5d:648a:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38bf57bfba2mr17387872f8f.45.1737469181996;
        Tue, 21 Jan 2025 06:19:41 -0800 (PST)
Received: from dominikat-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327556dsm13479115f8f.71.2025.01.21.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 06:19:41 -0800 (PST)
Message-ID: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
Subject: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK board
From: Parth Panchoil <parth105105@gmail.com>
To: ath12k@lists.infradead.org
Cc: Francesco Dolcini <francesco@dolcini.it>
Date: Tue, 21 Jan 2025 15:19:40 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_061945_084153_556084E6 
X-CRM114-Status: UNSURE (   9.53  )
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

Hi All,

I am performing tests on the SX-PCEBE Wi-Fi module, which utilizes the
ATH12k driver, on the Texas Instruments AM69-SK board.
The board is running the TI Linux Kernel from the ti-linux-6.6.y
branch. During testing, I observed a kernel crash from the ATH12k
driver as soon as the probe is called. The crash log is as follows:

[    9.492631] Kernel panic - not syncing: Asynchronous SError
Interrupt
[    9.492634] CPU: 7 PID: 222 Comm: (udev-worker) Not tainted 6.6.58-
01497-ga7758da17c28-dirty #1
[    9.492638] Hardware name: Texas Instruments AM69 SK (DT)
[    9.492640] Call trace:
[    9.492642]  dump_backtrace+0x94/0xec
[    9.492658]  show_stack+0x18/0x24
[    9.492662]  dump_stack_lvl+0x48/0x60
[    9.492669]  dump_stack+0x18/0x24
[    9.492672]  panic+0x320/0x378
[    9.492677]  nmi_panic+0x8c/0x90
[    9.492681]  arm64_serror_panic+0x6c/0x78
[    9.492686]  do_serror+0x3c/0x78
[    9.492692]  el1h_64_error_handler+0x34/0x4c
[    9.492697]  el1h_64_error+0x64/0x68
[    9.492700]  ath12k_pci_read32+0x1bc/0x1e8 [ath12k]
[    9.492725]  ath12k_pci_power_up+0xdc/0x340 [ath12k]
[    9.492747]  ath12k_core_init+0x2c/0xa8 [ath12k]
[    9.492769]  ath12k_pci_probe+0x698/0x908 [ath12k]
[    9.492791]  pci_device_probe+0xa8/0x16c
[    9.492800]  really_probe+0x110/0x27c
[    9.492805]  __driver_probe_device+0x78/0x12c
[    9.492808]  driver_probe_device+0x3c/0x118
[    9.492810]  __driver_attach+0x74/0x124
[    9.492813]  bus_for_each_dev+0x78/0xd8
[    9.492819]  driver_attach+0x24/0x30
[    9.492824]  bus_add_driver+0xe4/0x208
[    9.492828]  driver_register+0x60/0x128
[    9.492831]  __pci_register_driver+0x44/0x50
[    9.492835]  ath12k_pci_init+0x2c/0x6c [ath12k]
[    9.492858]  do_one_initcall+0x70/0x1b4
[    9.492861]  do_init_module+0x58/0x1e4
[    9.492867]  load_module+0x19bc/0x1a8c
[    9.492869]  init_module_from_file+0x88/0xc4
[    9.492873]  __arm64_sys_finit_module+0x1c0/0x2ac
[    9.492877]  invoke_syscall+0x44/0x108
[    9.492882]  el0_svc_common.constprop.0+0xc0/0xe0
[    9.492885]  do_el0_svc+0x1c/0x28
[    9.492889]  el0_svc+0x2c/0x84
[    9.492892]  el0t_64_sync_handler+0xc0/0xc4
[    9.492895]  el0t_64_sync+0x190/0x194
[    9.492899] SMP: stopping secondary CPUs
[    9.492908] Kernel Offset: disabled
[    9.492909] CPU features: 0x0,80000200,28020000,1000420b
[    9.492913] Memory Limit: none

Upon searching online, I found the OpenWRT patch that appears to
address a similar issue: OpenWRT Patch: Prevent LTSSM Startup Crash.
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dpackage/kerne=
l/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-crash.patch;h=3D=
cd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=3D935b2b7dcef61b2893ed5dff307dd=
8f8a1156899
With the above patch applied, I do not see the crash anymore.

Could anyone confirm if this issue has been reported before/known bug
or provide any insights?=20
Any additional information or suggestions would be greatly appreciated.

Details about the test setup,
TI-AM69-SK board:
https://www.ti.com/tool/SK-AM69?keyMatch=3Dam69%20sk&tisearch=3Duniversal_s=
earch
Silex WiFi card SX-PCEBE:
https://www.silextechnology.com/connectivity-solutions/embedded-wireless/sx=
-pcebe
TI Linux Repo:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=3Dti-linux-6.6.y

Thank you.

Regards,
Parth P

