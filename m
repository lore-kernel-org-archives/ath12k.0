Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C93EBFD17
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T7zWQv6f5Kd001LwzZiHvzQamGOXU+AsETKL2/hMJf8=; b=LOKsMggEh9Hi010u4HOGTtjUiz
	fNLh/5PPscaA15hccjpka0P3rfjQ87YjMVMfaI9ceAkieOHpQzf/CLLDIyY5JUUAk3snW13UOhEhp
	xYkh/cPwYvmtSMfEXzP+ftKmBt9jt4mHNJ0Wu9kBPLUx6c52mLHwt4njfKNKbLFwNRgPKNKWLBg/b
	fMcTNt922wtpvErSYJVKWTkxuThAZ6yQHJRBIWqtbegQc9BZFQmYotqrii1QU76Nndk/h1ddapwTQ
	gYwUAc5i526uzSpcUi6znL2vViEC2AdonMSoAIl6PpI69ljZPJ7Bvpc0LF/qy99sAnHk0ikT1dgst
	ZkWw+7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCoD-0000000FHjq-2cxy;
	Mon, 13 Apr 2026 08:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCoC-0000000FHjQ-1od9
	for ath12k@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=T7zWQv6f5Kd001LwzZiHvzQamGOXU+AsETKL2/hMJf8=; b=iHH4ffxOxef2Ec2H0EVzIx6qjA
	S2ludBrzrLj7f6dxEG9QUsU7JAmiE3KnWoZo7GUOpTchWHUp8Yq/KOWKx5kdJrjTzBgdiCNHIly0V
	B1cFis09FitFB4vCNQZPE5QNjyBrkcVg8NMKVXVKfi4qdRRh0rpQKo+b0emfS+wAl4avf9LTV719Z
	cBJ76f3Yq6qwIwmlyya5FoAurk2j4AT3+CAmqNoqApxfWcikobAhIY+qNWz+LgfN65V83DbpSPVCH
	nIMGHzM5MNuiQYqQT6ueH903q9DfISL/WkhnlcPFA2Xajw02nvumWxzx5hdIcM4ex7PPgTS+MVC9q
	MEy+QqPA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCo8-0000000GPU7-2jwG
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 08:38:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso38821505e9.1
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776069489; x=1776674289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7zWQv6f5Kd001LwzZiHvzQamGOXU+AsETKL2/hMJf8=;
        b=M64WTpVm4X/A6LTKmhnXfbsMIkTp16gujzfPtYO0UdT2C5UoY72IR76fHQr/ebltXV
         fbxHC0XZr10lvmYEFbQP//4pOPJc6JylaMEosxFF2qHMUPB6vhSckWgG7jjx9f4JN09R
         rqwoAH2xqWL5uzos81Xo+ZZrn9XKqjCm7jUJkQHeg8y8I+F2Wo+o261ibUd5/PvJzXtc
         Vi8HloR3DuBHMZ6/cTDSxSvvOScKvmX15tEi+un1fSh4vWkKzWfFuPN1VL0KeLsi4Epr
         5dR/YW2TNkY9nqRBE9rKhM3ogOP2IfyDTNmUk1TqIKkzVlQUnVpfFXjJk7T8Q0VZpBeb
         NHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069489; x=1776674289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7zWQv6f5Kd001LwzZiHvzQamGOXU+AsETKL2/hMJf8=;
        b=M3Ql3dKWzcbN6Ehus+2JBsqk1zak/UJ3aPYIS1aKZ0b4enlgLxccuwJo40uFwz7nsz
         fOhNl75eXFC21eHo7fhHTrqerBPegoUDidH+TMnjZc8sR9Ffusx/4jRL3Ne1JFs+xxB4
         m39dRyUJQ/j0QXq9O1NK/l76S6vI6gHqaCGo+TaQdBELCXJerDWrcy5SYgt4suxTqqoR
         ELRhCvtkdC8hCGyIpb26TqZ6DnjBi/CLjK8lXXGfoGAcpMFgh6F2tN63xZcZgQUs1y4g
         3GjvQJX4gqIKQNxA2EoxPzvK3SNhc929tEkWKwNZQXbmysO0Y7IPYBgPlcI7HngPBQXl
         DFaQ==
X-Gm-Message-State: AOJu0Yy5bt7czCuaVnojiD4IdF05KeeLgWwSB/lQYu5JxsWGKNSLqT2z
	++ADQXFq1AYCGBaCSXVZttZIJa8C1uFXWHQnkwwFGYr5y0aAObUQM/MGR0FJuQ==
X-Gm-Gg: AeBDievPQXuVj823Ty+B4/YE0Cfb8nIwHQH0RzvJNG+btPfkKTEYAkqSvNw/qbuWgrH
	oSGGANrKEKuhAqTfowNLAa0MDE5kQbpsw9ai96VA35S3qzOnCEZ8VS1YSqfF/XA0H1klIbkMobH
	4lePhHQSEbP27ywuBVXFiXz5HwsIma9D3LADwE4+I3s9pVvvoL/s9OXD/nSUZCvDX0qhvSZ2OSt
	NE/ooxUkAcALIXM/wVhwcHbSV16tk3lDcVZKX83/fdq4omQi/+3D3/A3kYMknikxYPqTSYRDqL2
	RhR7y9/k/kGj9b/SSEMyNoMHSZ131c6hxfCPjdQKzIZdjBhs920lrd35KV3HQcZqqUPb1sKevIT
	DPyL1PyAsdgaCLf8phxk8PdIajLfytJB3D5mYr3FN80kYEuQQkBgwWPwjZfZ4CppZMtF+gHToxT
	MUSTgVCrf88Qb4fqPSPpO8vAt/4mNROdq6/QeZlY89Dzk3kKqLB5m+DiaN
X-Received: by 2002:a05:600c:5306:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-488d68c3385mr170053005e9.27.1776069489040;
        Mon, 13 Apr 2026 01:38:09 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm139406055e9.3.2026.04.13.01.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:38:08 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	maharaja.kennadyrajan@oss.qualcomm.com
Subject: [PATCH ath-next 0/1] thermal read locking problem
Date: Mon, 13 Apr 2026 10:38:06 +0200
Message-ID: <20260413083807.1727905-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_093813_602272_37F26304 
X-CRM114-Status: GOOD (  10.47  )
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

So I hit a deadlock between ath12k_pci_remove() and reading the hwmon
temperature of the same device. See the stack trace bellow

	[  369.804971] INFO: task sh:7638 blocked for more than 122 seconds.
	[  369.804991]       Not tainted 6.19.0git+ #15
	[  369.805000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
	[  369.805005] task:sh              state:D stack:0     pid:7638  tgid:7638  ppid:7637   task_flags:0x480100 flags:0x00080800
	[  369.805022] Call Trace:
	[  369.805028]  <TASK>
	[  369.805038]  __schedule+0x45b/0x1780
	[  369.805057]  ? rwsem_mark_wake+0x1a9/0x2c0
	[  369.805076]  ? wake_up_q+0x37/0x90
	[  369.805090]  schedule+0x27/0xd0
	[  369.805102]  kernfs_drain+0xec/0x170
	[  369.805116]  ? __pfx_autoremove_wake_function+0x10/0x10
	[  369.805130]  __kernfs_remove.part.0+0x85/0x220
	[  369.805144]  kernfs_remove+0x61/0x70
	[  369.805157]  __kobject_del+0x2e/0xa0
	[  369.805167]  kobject_del+0x13/0x30
	[  369.805175]  device_del+0x283/0x3d0
	[  369.805185]  ? rtnl_is_locked+0x15/0x20
	[  369.805200]  wiphy_unregister+0x10a/0x3f0 [cfg80211 6168fbe3683cd298138328882cdf9008f30e4673]
	[  369.805417]  ieee80211_unregister_hw+0x10c/0x130 [mac80211 a4ced2a7a5c741afca2c73dab2ee07ceec04d385]
	[  369.805625]  ath12k_mac_hw_unregister+0x71/0x100 [ath12k 6ccd74c4d10a7837e98e0ec39774107bc2e6daf1]
	[  369.805746]  ath12k_mac_unregister+0x2e/0x50 [ath12k 6ccd74c4d10a7837e98e0ec39774107bc2e6daf1]
	[  369.805895]  ath12k_core_hw_group_stop+0x18/0xa0 [ath12k 6ccd74c4d10a7837e98e0ec39774107bc2e6daf1]
	[  369.805972]  ath12k_core_hw_group_cleanup+0x37/0x90 [ath12k 6ccd74c4d10a7837e98e0ec39774107bc2e6daf1]
	[  369.806051]  ath12k_pci_remove+0x60/0x110 [ath12k 6ccd74c4d10a7837e98e0ec39774107bc2e6daf1]
	[  369.806137]  pci_device_remove+0x4a/0xc0
	[  369.806151]  device_release_driver_internal+0x19e/0x200
	[  369.806165]  unbind_store+0xa4/0xb0
	[  369.806179]  kernfs_fop_write_iter+0x14d/0x200
	[  369.806194]  vfs_write+0x25d/0x480
	[  369.806214]  ksys_write+0x73/0xf0
	[  369.806228]  do_syscall_64+0x11c/0x1610
	[  369.806242]  ? __folio_mod_stat+0x2d/0x90
	[  369.806252]  ? set_ptes.isra.0+0x36/0x80
	[  369.806266]  ? do_anonymous_page+0xfb/0x830
	[  369.806276]  ? __pte_offset_map+0x1b/0x100
	[  369.806291]  ? __handle_mm_fault+0xb46/0xf60
	[  369.806310]  ? count_memcg_events+0xd7/0x190
	[  369.806323]  ? handle_mm_fault+0x1d7/0x2d0
	[  369.806356]  ? do_user_addr_fault+0x21a/0x680
	[  369.806372]  ? exc_page_fault+0x82/0x1d0
	[  369.806385]  ? __irq_exit_rcu+0x4c/0xf0
	[  369.806397]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
	[  369.806408] RIP: 0033:0x7f2d2d5163be
	[  369.806443] RSP: 002b:00007fff2b63ea90 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
	[  369.806455] RAX: ffffffffffffffda RBX: 00007f2d2d66b580 RCX: 00007f2d2d5163be
	[  369.806462] RDX: 000000000000000d RSI: 0000561010670560 RDI: 0000000000000001
	[  369.806469] RBP: 00007fff2b63eaa0 R08: 0000000000000000 R09: 0000000000000000
	[  369.806476] R10: 0000000000000000 R11: 0000000000000202 R12: 000000000000000d
	[  369.806481] R13: 000000000000000d R14: 0000561010670560 R15: 0000561010670080
	[  369.806496]  </TASK>
	[  369.806502] INFO: task cat:7652 blocked for more than 122 seconds.
	[  369.806512]       Not tainted 6.19.0git+ #15
	[  369.806519] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
	[  369.806524] task:cat             state:D stack:0     pid:7652  tgid:7652  ppid:611    task_flags:0x400000 flags:0x00080000
	[  369.806538] Call Trace:
	[  369.806542]  <TASK>
	[  369.806549]  __schedule+0x45b/0x1780
	[  369.806565]  ? page_counter_try_charge+0x90/0x150
	[  369.806580]  ? mod_memcg_lruvec_state+0xc5/0x1f0
	[  369.806594]  schedule+0x27/0xd0
	[  369.806621]  schedule_preempt_disabled+0x15/0x30
	[  369.806634]  __mutex_lock.constprop.0+0x545/0xae0
	[  369.806644]  ? obj_cgroup_charge_account+0x23e/0x420
	[  369.806670]  ath12k_thermal_temp_show+0x2b/0x130 [ath12k 6ccd74c4d10a7837e98e0ec39774107bc2e6daf1]
	[  369.806854]  ? __kvmalloc_node_noprof+0x696/0x720
	[  369.806869]  dev_attr_show+0x1f/0x50
	[  369.806909]  sysfs_kf_seq_show+0xcc/0x120
	[  369.806921]  seq_read_iter+0x128/0x490
	[  369.806947]  ? rw_verify_area+0x56/0x180
	[  369.806959]  vfs_read+0x268/0x390
	[  369.806970]  ? __folio_mod_stat+0x2d/0x90
	[  369.806985]  ksys_read+0x73/0xf0
	[  369.807010]  do_syscall_64+0x11c/0x1610
	[  369.807028]  ? count_memcg_events+0xd7/0x190
	[  369.807041]  ? handle_mm_fault+0x1d7/0x2d0
	[  369.807060]  ? do_user_addr_fault+0x21a/0x680
	[  369.807075]  ? exc_page_fault+0x82/0x1d0
	[  369.807090]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
	[  369.807099] RIP: 0033:0x7f2e4bd6d3be
	[  369.807139] RSP: 002b:00007ffcd412d410 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
	[  369.807149] RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f2e4bd6d3be
	[  369.807156] RDX: 0000000000040000 RSI: 00007f2e4bc96000 RDI: 0000000000000003
	[  369.807162] RBP: 00007ffcd412d420 R08: 0000000000000000 R09: 0000000000000000
	[  369.807167] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffcd412d7a8
	[  369.807172] R13: 00007f2e4bc96000 R14: 0000000000040000 R15: 0000000000000000
	[  369.807204]  </TASK>

This can be replicated at will on my side by force unbinding the driver
while reading in a loop:
  - while [ true ]; do cat /sys/class/ieee80211/phy0/hwmon2/temp1_input; done
  - echo 0000:01:00.0 > /sys/bus/pci/drivers/ath12k_wifi7_pci/unbind

I'm not sure if the way of fixing things is the best, but it works around
the deadlock in my tests.

Also as this is just in ath-next for now not sure if I should add a proper
fixes tag ?

Nicolas Escande (1):
  wifi: ath12k: avoid deadlock in thermal read

 drivers/net/wireless/ath/ath12k/thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.53.0


