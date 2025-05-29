Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F197C5AD49
	for <ath12k@archiver.kernel.org>; Thu, 29 May 2025 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zn+VfgXx/qd58N4NU8q9U4ZOuQplpNharM1jlqzXH0Q=; b=MzJ05W7RgHhdNU8Vcm+X6s31eO
	/4PNUV7BKRweJ0wgl7p2g/5W0MCL9KAMK1P3ImMIOxjgkrAPvP75KvIvDS+XXRXmax7jtKihJOFCe
	eGqXcG11dBkdzRXaVwZcTRvmHLJdEirCGcY4goO72X0DH/z+THpDa2M6g7HaPOgfJRb57rMfi2lG7
	ue6NusgQ0GtG4gR/dgptC/C7JqOwmMsGC8UT15YygF1Widiq5ebi+ow3aOEpXOVn+IHyhoQ6QEoyU
	Hr4/pqXjBlvyFbUbEChY7jnDyABd050/0SnzcZhJGynl3zeJ2jpSaZLZ5Q3DePvE5edhqRmqf9TFg
	OEMBaAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPR-0000000Frof-3WH6;
	Thu, 29 May 2025 13:35:01 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcz4-0000000Fp3c-0n92
	for ath12k@lists.infradead.org;
	Thu, 29 May 2025 13:07:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553331c3dc7so1005298e87.3
        for <ath12k@lists.infradead.org>; Thu, 29 May 2025 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748524064; x=1749128864; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zn+VfgXx/qd58N4NU8q9U4ZOuQplpNharM1jlqzXH0Q=;
        b=AtxnfJH7boryD6PImd1c9pjMypykjX6/MybsOd4W2aVXcPgxh7+jbcxJb2ut4Oqbhv
         IjEJCtANGJ2YJ04c7BQW0UvQQcTrI86CKXggG+qvBjZ3JiTjFLXAVIC5fuJo9gsrMhpk
         NpUAgUMoeUayp0FnZAmEZtw/LjMuxt2s0dRj+YygO8Tw4I2olMeF2TW7WYSCrRlMdEIY
         3qt/FG31kHeNUoOZWpydzh/OZEAz9KEdvIttLC5n7PbAP6+55mLn50iSDcfjCDzu1F0l
         +Wxojxgi2kcDJkLneQb51lJ+ksQutx5eMkQZHMVF+vwq+bg6sftfqwZ9PiGlgD2U989x
         z6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748524064; x=1749128864;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn+VfgXx/qd58N4NU8q9U4ZOuQplpNharM1jlqzXH0Q=;
        b=kjrlItNOjMrFe9Foo4qI4Vt8nDMpBDBOV5P7HSgk4gqOMXFoHUUtK+ULuTEAsAI3O2
         vW88FmVAUQLhxiW4rK90tXNCtaLwsUXyVuBVq0I0Q/jZIfpb50BuobffNmn3EMgMqF3K
         +Uy83syFhsB8PB2wYBq8Vpe1JeqNX8KrGmYDpoJvWwswEIOA3iss7wRKtanBVu7laxB6
         5FKe9aPgejaMlclGPA2ypXgo059NpbdNqjVQvgUnRxhr5BVVLltqzkUKAquw4oU3NwjH
         8GAtXwYVPJSG6Zy5KsILq72+0C/ywJoLbClTlMrCI1Fu3ZwzvP+HCP4O7+/3E8DnMVt6
         wZVg==
X-Gm-Message-State: AOJu0Yy/Hjo3zBx+AgA3rJyz3wwvsUzsly9MYhnzkAFginFFanM6L4uA
	sD9ho0xlhojVbTr07PZA8mR/7LVg/5Bm81WmEJTFZt/8E+KW6pN8OIOTb4iJPkab3pIK+HLflm9
	CP9gAkvuCYmf85PlAqx2Yp3KhwHNQraOMYy7JfO0=
X-Gm-Gg: ASbGncvsi+pjVa85IYKNzSakkrhDu8i2XyA2mzMOzOPr9MA1V73LOBWM5WCQur3yTdW
	gAZXKCo1Q5d7x7QfWWGAdKg/Ugu8R6vImCYLUpXyd9+3cBS3S4eoVLvutkw0glIkMyN0qjt/UKH
	XOYU76CQwF4bKCt7M6FSnsSuo5Roswiz4=
X-Google-Smtp-Source: AGHT+IGGFYmDzOf54qOs/wOssU08oYg8N0l4NUWcdgLzpTRnYpljjXxA7lvMv87xIPOAe9ayG4IudF34r508YOW2J4A=
X-Received: by 2002:a05:6512:1085:b0:54e:9066:9af7 with SMTP id
 2adb3069b0e04-5521c7b0373mr6382561e87.27.1748524063433; Thu, 29 May 2025
 06:07:43 -0700 (PDT)
MIME-Version: 1.0
From: Domenico Colella <medevil84@gmail.com>
Date: Thu, 29 May 2025 15:07:07 +0200
X-Gm-Features: AX0GCFsCnvnAVQz2dQCNY56uTfNbnt2y9_MJu7982kTCsAYawzQQKOlQ_RmaXXI
Message-ID: <CAGKP1icLE=R91znFQF1qVP1VeKMyAheY92jY3n6PhJ1t_Nw2bQ@mail.gmail.com>
Subject: Unable to start qcn9274 card under qemu/proxmox guest
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_060746_233385_A2B038CA 
X-CRM114-Status: UNSURE (   7.76  )
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

Hi everyone,
I'm having some trouble using my wifi card (Compex WLE7002E56) in a
virtualized environment (I tried both qemu 10 on debian and proxmox
8.4); the card works fine under the host os but fails to start in the
guest.
The problem seems to be present regardless of the type of kernel in
the host (I tested debian 12 with default kernel, from backports and
manually compiled) and in the guest (both debian and openwrt with
kernel 6.8, 6.12 and from git ath).
Here's a log from openwrt guest with the compiled kernel from the ath
git repository (i'm manually loading the module with
debug_param=0xffffffff) running on proxmox 8.4.1 (with default kernel
6.8.12-10-pve):

[ 1112.284527] ath12k_pci 0000:03:00.0: BAR 0 [mem
0xc1c00000-0xc1dfffff 64bit]: assigned
[ 1112.285027] ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
[ 1112.287138] ath12k_pci 0000:03:00.0: boot pci_mem 0x00000000b852f5e1
[ 1112.287140] ath12k_pci 0000:03:00.0: pci probe 17cb:1109 17cb:1109
[ 1112.287155] ath12k_pci 0000:03:00.0: pci tcsr_soc_hw_version major 2 minor 0
[ 1112.288698] ath12k_pci 0000:03:00.0: MSI vectors: 16
[ 1112.309015] ath12k_pci 0000:03:00.0: msi base data is 0
[ 1112.309017] ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
[ 1112.309734] ath12k_pci 0000:03:00.0: boot firmware request
ath12k/QCN9274/hw2.0/firmware-2.bin size 15376448
[ 1112.309736] ath12k_pci 0000:03:00.0: found fw timestamp 1726657435
[ 1112.309737] ath12k_pci 0000:03:00.0: found m3 image ie (421888 B)
[ 1112.309738] ath12k_pci 0000:03:00.0: found fw image ie (7372800 B)
[ 1112.309743] ath12k_pci 0000:03:00.0: found dualmac fw image ie (7581696 B)
[ 1112.309744] ath12k_pci 0000:03:00.0: found firmware features ie (1 B)
[ 1112.309744] ath12k_pci 0000:03:00.0: features
[ 1112.309745] ath12k_pci 0000:03:00.0: using fw api 2
[ 1112.309752] ath12k_pci 0000:03:00.0: dualmac fw selected for board id: 1006
[ 1112.309753] ath12k_pci 0000:03:00.0: Assign MSI to user: MHI,
num_vectors: 3, user_base_data: 0, base_vector: 0
[ 1112.309753] ath12k_pci 0000:03:00.0: Number of assigned MSI for MHI
is 3, base vector is 0
[ 1112.313035] ath12k_pci 0000:03:00.0: Assign MSI to user: CE,
num_vectors: 5, user_base_data: 3, base_vector: 3
[ 1112.313586] ath12k_pci 0000:03:00.0: Assign MSI to user: DP,
num_vectors: 8, user_base_data: 8, base_vector: 8
[ 1112.313590] ath12k_pci 0000:03:00.0: irq:54 group:0
[ 1112.313659] ath12k_pci 0000:03:00.0: irq:55 group:1
[ 1112.313728] ath12k_pci 0000:03:00.0: irq:56 group:2
[ 1112.313794] ath12k_pci 0000:03:00.0: irq:57 group:3
[ 1112.313858] ath12k_pci 0000:03:00.0: irq:58 group:4
[ 1112.313929] ath12k_pci 0000:03:00.0: irq:59 group:5
[ 1112.313994] ath12k_pci 0000:03:00.0: irq:60 group:6
[ 1112.314049] ath12k_pci 0000:03:00.0: irq:61 group:7
[ 1112.314107] ath12k_pci 0000:03:00.0: irq:54 group:8
[ 1112.314109] ath12k_pci 0000:03:00.0: irq:55 group:9
[ 1112.314111] ath12k_pci 0000:03:00.0: irq:56 group:10
[ 1112.314111] ath12k_pci 0000:03:00.0: pci after request_irq msi_ep_base_data 0
[ 1112.314113] ath12k_pci 0000:03:00.0: unable to get wsi info from
dt, grouping single device
[ 1112.314114] ath12k_pci 0000:03:00.0: wsi group-id 255 num-devices 1 index 0
[ 1112.314114] ath12k_pci 0000:03:00.0: num devices 1 num probed 1
[ 1112.314152] ath12k_pci 0000:03:00.0: pci ltssm 0x11
[ 1112.314160] ath12k_pci 0000:03:00.0: pci pcie_hot_rst 0x3
[ 1112.319190] ath12k_pci 0000:03:00.0: cookie:0x0
[ 1112.319203] ath12k_pci 0000:03:00.0: WLAON_WARM_SW_ENTRY 0x2
[ 1112.339220] ath12k_pci 0000:03:00.0: WLAON_WARM_SW_ENTRY 0x2
[ 1112.339232] ath12k_pci 0000:03:00.0: soc reset cause:0
[ 1112.402449] ath12k_pci 0000:03:00.0: link down error during global reset
[ 1112.414092] ath12k_pci 0000:03:00.0: MHISTATUS 0xffffffff
[ 1112.424128] ath12k_pci 0000:03:00.0: pci link_ctl 0xffff L0s 1 L1 1
[ 1112.425042] ath12k_pci 0000:03:00.0: pci reg 0x3164 instance 0x3
read val 0xffffffff
[ 1112.425044] ath12k_pci 0000:03:00.0: setting mhi state: INIT(0)
[ 1112.425063] mhi mhi0: BHI offset: 0xffffffff is out of range: 0x200000
[ 1112.425449] ath12k_pci 0000:03:00.0: failed to set mhi state: INIT(0)
[ 1112.425779] ath12k_pci 0000:03:00.0: failed to start mhi: -34
[ 1112.426080] ath12k_pci 0000:03:00.0: failed to power up :-34
[ 1112.475594] ath12k_pci 0000:03:00.0: failed to create soc core: -34
[ 1112.476021] ath12k_pci 0000:03:00.0: unable to create hw group
[ 1112.476333] ath12k_pci 0000:03:00.0: failed to init core: -34
[ 1113.130301] ath12k_pci 0000:03:00.0: probe with driver ath12k_pci
failed with error -34

Can somebody help me with this issue?

Thanks,
Domenico.

