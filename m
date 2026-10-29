Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB98606A329
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 08:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TtF8cJXL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WqVwpya8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0tJCH4+9yUTROO3nKwmYaq2yYki3Jr1t2NglbEqv+j8=; b=TtF8cJXLbx+7P6uFR/vFY9sZqe
	zjhFEzniZAMdh6jCx8M0oC4OPyUbv2mDKqmPxo0S4tFNMhfjVCZ4xCa71gXiK/+2ABttQU5tzTTjt
	Do0B05J0xL3NgQbOFIt9mYwy87Ta2s11CQ4qIP+fWC/68PgazZDQbOr3qY/LKpJijM/qqqMewBWbz
	30uH6uXGU/kfkoq0a6w8iWdxcn1KzAaQ35V0z6gavjPQ3TWmrpsC0h3bM4plVhJ0voAAw6XH4w/Ba
	JMWRI5f/eDxmTNep66K+fL5wxOCYvN3F+FDBxRSGFq0VNmrWe6OOxqUoX6UfKC11gLab3tl54miMi
	NwWsB9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLWW-00000008jl2-0xQL;
	Thu, 29 Oct 2026 08:30:12 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLWT-00000008jjd-1ocE
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 08:30:11 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-7cc603a168fso634852137.3
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 01:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793262607; cv=none;
        d=google.com; s=arc-20260327;
        b=KeNWi+eAYa/pqXO3bb6dGW6L8YbTkHG6cRP7DW0rFfdwn386fFhPDWv2ZkwGyd0IoX
         BtREeyGVdo3hmP381dpStF253aevqOHBGN36WlosP1CQj8QUOamyhYTanNEwe5qC+hkw
         XwSustpfk9ei446fijrjMswuL1k5QyOD/vl5G1RSSY1zxOxDw2CDIxFlnIW26womh2/r
         i/7K6TlMC6OxUypKrZYnjXVkB1+TnW7mxFirRv+rLu98z82nWuWKT5aMs5YYYCy4hCXH
         1/pauRHcrh6ft/TtqFO38vlEXgxndiia/fYXciOdQMzZnTw5+d6yF7g6MhefnazRwoVL
         XE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0tJCH4+9yUTROO3nKwmYaq2yYki3Jr1t2NglbEqv+j8=;
        fh=unOd+iR/s4g3ccNRscfqoIvCvfbfQt24cpkffWnNbx8=;
        b=lWf0iOXs4GXAXml3tggwY92AGk6BJpqXT9cams9cp2M1yLICx78lPWhZ0den9uC+bM
         RtioJs+3QaKfKIJY1WmZva1dVBewyXYib4Bg75WD3+QQvztip2ko5nJAa8QgH29GCopH
         HSroKwZrTnG0bBAVSJnWDwQj1V9ntS8Rb5+F46s9mJZ1Mk3V/FtZaMTAnjzlUCaVQKNe
         VGWMXfxU0Jdh8VQZ/SSVMPdJao9L3kcOwqtKPuJqUKvMvEqN7lWJtOq1uupW980bswi4
         68S7iYOkJ8/08/nzzaaFCpNltfEk5f74kO9lT+KWii3h8xWqaPy2NH3OPYJQU3j+gSJB
         khug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262607; x=1793867407; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tJCH4+9yUTROO3nKwmYaq2yYki3Jr1t2NglbEqv+j8=;
        b=WqVwpya8ZPcYxVGnkjP0kqig0O7SFqzBd/lxIyN5gMNuiS7rXrX68GjWnI8w8m4qIO
         98Q9vu4YvsDYb/7nbCGJtYQT3I2dvGvhkjtPkTQLsRbCdYTecFGHruE4EymkG7ru6cYV
         uQAUtbogmcOGRFduAXhzl+5qjKtKWnz2qJ42q2AJky/qbBmm60y3SZaq6fYORVX9bgch
         /hufuDOKG1zkYkipI/upP/nfW46FUsm1zD+gEiy7U50j6JFa/bt51rSmwLkYtocgGjtk
         4bfRA2BtCa9d4tfpZk8ahMnE6dFaBl7JiOIx+l6EvATAW983dkAa4AWbVjRMnVBzo55N
         nuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262607; x=1793867407;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0tJCH4+9yUTROO3nKwmYaq2yYki3Jr1t2NglbEqv+j8=;
        b=iAXVjbHHPYRn8pqRbmcN2lHq4vsWUlPfqegFwzAP/k+1MkHVVKGRaja1kasfEn3JVq
         3HuL508XUYyiYTpUV0ghl0xO7g14tevU3JwdSBgOoLaFrxxSs/OrQLKu+UKvfRbAFbxI
         rN33KO5BrevS3uMpzuHjqmxHn5GxJw1nMccdW90GUz2uSVdbCD3281xKq99z7smL6D2T
         +qu/M3tKoQ4mUDsYVKOWWVDVUxNw67Ogrvgt2bvrJZtO6uzuG9ZL7ibG2q3YwPyb9a6C
         58iQFpJAvFhNBKbMrKMf17lWdzglMErTeUdyO5cMLg3hzOSj0o9XRQjHY38zEaL3FSgp
         Q6Ng==
X-Gm-Message-State: AFq9FYJ74MJ/VxKJNJea9S0pECgwv5S3dHnGPZfNjyX/D8ISegs0n46N
	HJAD5PXilNjkQj+hKRb0Rc0Sv/FgWLzJyodXgR/hg2wTOwCCuzSzxysRaFNEcyUfc0X+++U519Z
	bO51Wpmu1DfPwiULVv1JgG/ku+03V2nR2IeB1
X-Gm-Gg: AYBFou3WkQLLKRZAgMXY3PthhGZWAG3QLQYcDgPGfVgLT28+odRtv0oQli5D4Mf5cTV
	e5baRl2loeQP2479DUjJ7fglToZEp4DkJwNpUIgpvz/AETeM0awFxQZfQDdjhIHte3NwQ2lMBxE
	rsyyRxUnR01dHh9V+wRL7khIM3BpQLQmYBQYV0lGMqkM7r0DNPWjVPe0dDarX8DcVEoMdL1URPP
	SEesSjIiypcQ+yJEVOhl7SEGWADweUaCvn11z7lHestHZl6HWfGJXlWE1Qxi/9Qtx4fd20Ymvbt
	ycnS1k1+dmMgj2a2mPDd4GgoWZx8j0ywdjjVDqT6eGSHmWXlzw6odgYMjbEe6k3RXEFEyehhLZR
	+uWi+MBJon1DhBw+yns2bG2ibcf/gkuDTFpFQD8DTHfqKoDolnORyC+OR
X-Received: by 2002:a05:6102:c4a:b0:7c3:91f5:26f1 with SMTP id
 ada2fe7eead31-7d03a50cf96mr2079444137.6.1793262606857; Thu, 29 Oct 2026
 01:30:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Edward Boyd <foxhis11@gmail.com>
Date: Thu, 29 Oct 2026 16:29:55 +0800
X-Gm-Features: AclHuK-LCpv1UrJxeSfaJV1Q51uJcXCwjy4BnFQK-rtfQapJhBq59VgGFQKZtPQ
Message-ID: <CA+oFqMhOBTPTXB5nG_Ls_UD+j_ODmBX1Uh7RM7aKJZ4ZF9+oZQ@mail.gmail.com>
Subject: [BUG] wifi: ath12k: Oops on rmmod when one device of a hw group
 failed firmware bring-up (QMI_FAIL)
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_013009_554722_A0D1CAF7 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On a board with three QCN9274 (PCI) in one ath12k hw group, removing the
driver after one of the devices failed QMI firmware bring-up crashes the
kernel (NULL pointer read) and the system reboots. Reproduced twice.

Setup
- Askey SBE1V1K: IPQ9570 + 3x QCN9274 hw2.0 on PCIe
  (0001:01:00.0, 0002:01:00.0, 0003:01:00.0)
- kernel 6.18.55; ath12k / ath12k_wifi7 from backports 7.2 as packaged
  by OpenWrt (package/kernel/mac80211; image based on an ImmortalWrt
  snapshot, r42138-da63f7d6ac), no local changes to the driver
- firmware WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
- ath12k_pci_remove(), ath12k_core_hw_group_cleanup() and
  ath12k_core_stop() are identical in ath.git ath-next as of today.

Steps to reproduce
1. Boot normally; all three radios come up.
2. Put an invalid board-2.bin in place (I used 4 KiB of zeros in
   /lib/firmware/updates/ath12k/QCN9274/hw2.0/board-2.bin) and reload:
     rmmod ath12k_wifi7 ath12k; modprobe ath12k_wifi7
   One device fails at BDF/regdb download; the other two never get past
   MHI "Wait for device to enter SBL or Mission mode". This part is
   expected.
3. Restore a valid board-2.bin and run "rmmod ath12k_wifi7" again.

Actual (abridged, full excerpt at the end)

  [  203.584861] ath12k_wifi7_pci 0002:01:00.0: found invalid board magic
  [  203.600721] ath12k_wifi7_pci 0002:01:00.0: found invalid board magic
  [  203.618033] ath12k_wifi7_pci 0002:01:00.0: qmi failed to load regdb bin:
  [  203.618061] ath12k_wifi7_pci 0002:01:00.0: qmi failed to load
regdb file:-12
     (nothing more from ath12k on 0001/0003 for ~120 s)
  [  324.611930] ath12k_wifi7_pci 0002:01:00.0: Mode request failed,
mode: 4, result: 1 err: 90
  [  324.611967] ath12k_wifi7_pci 0002:01:00.0: qmi failed to send wlan mode off
  [  324.619100] Unable to handle kernel read from unreadable memory
at virtual address 0000000000000000
  [  324.634974]   ESR = 0x0000000096000005
  [  324.649897]   FSC = 0x05: level 1 translation fault
  [  324.683072] Internal error: Oops: 0000000096000005 [#1]  SMP
     (system reboots)

I don't have the call trace: there is no serial console on this unit,
the log was streamed from /dev/kmsg over the network and stopped at the
"Internal error" line. kernel.panic_on_oops=0 did not keep the system
alive either.

Expected
The driver unloads cleanly and the device that never came up is skipped
during teardown.

Analysis (from reading the code, not confirmed by a backtrace)
- "qmi failed to send wlan mode off" is printed only by
  ath12k_qmi_firmware_stop(), called from ath12k_core_stop() and from
  the error path of ath12k_core_hw_group_start(). During rmmod it has to
  be ath12k_core_stop() on 0002:01:00.0, the device that never finished
  firmware bring-up. The Oops follows about 7 us later, so it is in the
  rest of ath12k_core_stop() (dp rx reo cleanup / hif stop / wmi detach
  / dp deinit) or right after it.
- ath12k_pci_remove() skips ath12k_core_hw_group_cleanup() only for a
  device that itself has ATH12K_FLAG_QMI_FAIL. The first healthy device
  of the group to be removed calls ath12k_core_hw_group_cleanup(), which
  runs ath12k_core_hw_group_stop() and then ath12k_core_stop() on every
  device of the group unconditionally, including the one that never
  started. For that device ath12k_core_to_group_ref_put() just returns
  ("core already de-attached"), but ath12k_core_stop() carries on and
  tears down state that was never set up.

Suggestion
- In ath12k_core_hw_group_cleanup() (or at the top of
  ath12k_core_stop()), skip devices that never completed firmware
  bring-up, e.g. based on ab->hw_group_ref, ATH12K_FLAG_QMI_FAIL or
  ATH12K_FLAG_QMI_FW_READY_COMPLETE.
- Only do the mac unregister/destroy part of ath12k_core_hw_group_stop()
  if the group was actually registered (ATH12K_GROUP_FLAG_REGISTERED).

Side note: when one device of the group fails BDF download, the others
never proceed (they wait for host cap), so all radios of the group are
lost while the error is only logged for the failing device. That may be
by design.

I can test patches on this hardware.

Thanks

Edward.

---- full excerpt (from "rmmod/modprobe" in step 2 to the Oops) ----

  [  198.990367] ath12k_wifi7_pci 0002:01:00.0 wl0.1-ap0: left allmulticast mode
  [  198.990404] ath12k_wifi7_pci 0002:01:00.0 wl0.1-ap0: left promiscuous mode
  [  198.996288] br-lan: port 4(wl0.1-ap0) entered disabled state
  [  199.411627] br-lan: port 5(wl0.2-ap0) entered disabled state
  [  199.413182] ath12k_wifi7_pci 0002:01:00.0 wl0.2-ap0
(unregistering): left allmulticast mode
  [  199.416355] ath12k_wifi7_pci 0002:01:00.0 wl0.2-ap0
(unregistering): left promiscuous mode
  [  199.424470] br-lan: port 5(wl0.2-ap0) entered disabled state
  [  201.381848] ath12k_wifi7_pci 0002:01:00.0: BAR 0 [mem
0x20400000-0x205fffff 64bit]: assigned
  [  201.381974] ath12k_wifi7_pci 0002:01:00.0: Wi-Fi 7 Hardware name:
qcn9274 hw2.0
  [  201.389669] ath12k_wifi7_pci 0002:01:00.0: MSI vectors: 16
  [  201.402471] ath12k_wifi7_pci 0001:01:00.0: BAR 0 [mem
0x10400000-0x105fffff 64bit]: assigned
  [  201.402595] ath12k_wifi7_pci 0001:01:00.0: Wi-Fi 7 Hardware name:
qcn9274 hw2.0
  [  201.410783] ath12k_wifi7_pci 0001:01:00.0: MSI vectors: 16
  [  201.418504] ath12k_wifi7_pci 0003:01:00.0: BAR 0 [mem
0x18400000-0x185fffff 64bit]: assigned
  [  201.423210] ath12k_wifi7_pci 0003:01:00.0: Wi-Fi 7 Hardware name:
qcn9274 hw2.0
  [  201.431983] ath12k_wifi7_pci 0003:01:00.0: MSI vectors: 16
  [  201.490914] mhi mhi0: Requested to power ON
  [  201.490939] mhi mhi0: Power on setup success
  [  201.624426] mhi mhi0: Wait for device to enter SBL or Mission mode
  [  202.188190] mhi mhi2: Requested to power ON
  [  202.188228] mhi mhi2: Power on setup success
  [  202.321934] mhi mhi2: Wait for device to enter SBL or Mission mode
  [  202.885908] mhi mhi1: Requested to power ON
  [  202.885944] mhi mhi1: Power on setup success
  [  203.021013] mhi mhi1: Wait for device to enter SBL or Mission mode
  [  203.563737] ath12k_wifi7_pci 0002:01:00.0: using reserved
host-ddr-mem 0x0000000054100000 (0x0000000003102000 bytes used of
0x0000000003200000)
  [  203.569253] ath12k_wifi7_pci 0002:01:00.0: chip_id 0x0
chip_family 0xb board_id 0xff soc_id 0x401a2200
  [  203.575415] ath12k_wifi7_pci 0002:01:00.0: fw_version 0x160484db
fw_build_timestamp 2025-12-09 19:48 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
  [  203.584861] ath12k_wifi7_pci 0002:01:00.0: found invalid board magic
  [  203.600721] ath12k_wifi7_pci 0002:01:00.0: found invalid board magic
  [  203.618033] ath12k_wifi7_pci 0002:01:00.0: qmi failed to load regdb bin:
  [  203.618061] ath12k_wifi7_pci 0002:01:00.0: qmi failed to load
regdb file:-12
  [  324.611930] ath12k_wifi7_pci 0002:01:00.0: Mode request failed,
mode: 4, result: 1 err: 90
  [  324.611967] ath12k_wifi7_pci 0002:01:00.0: qmi failed to send wlan mode off
  [  324.619100] Unable to handle kernel read from unreadable memory
at virtual address 0000000000000000
  [  324.625962] Mem abort info:
  [  324.634974]   ESR = 0x0000000096000005
  [  324.637744]   EC = 0x25: DABT (current EL), IL = 32 bits
  [  324.641572]   SET = 0, FnV = 0
  [  324.647031]   EA = 0, S1PTW = 0
  [  324.649897]   FSC = 0x05: level 1 translation fault
  [  324.652943] Data abort info:
  [  324.657795]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  [  324.660933]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  [  324.666218]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  [  324.671345] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000063f20000
  [  324.676722] [0000000000000000] pgd=0800000064474403,
p4d=0800000064474403, pud=0800000064474403, pmd=0000000000000000
  [  324.683072] Internal error: Oops: 0000000096000005 [#1]  SMP

