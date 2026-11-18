Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5F606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkhsfQx6;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=eawyZez8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KtJsCQtB4slLzmfLD0s11tSr8dU3d9fsZniscQImFmA=; b=RkhsfQx6EzPnDOM+S3ZirKRn1u
	IXUgO3b0SRc2KtLPkSEXw8Zkvu95xIbmI0LvRvFysyCVCKNO+idmlvX3QCiPbh1h1KL9ypEb6mYRE
	4WoEIlJi4ogMd90NnRTWgtWpLFCSLzWEFFuqMZ6njVNHaFSZmp6pe4in7tilzhM5NsqxPBsw1qZti
	cu56TNzX3tYWazcKFYn+CR6Q/qj5p+6xKe7//HGCWx/dJONnFN62m1rWn2OxsvV3Unp78oJRujJwV
	7FZlcALtL39jzuzF6ZV2X4fd6hIwKEc6vrcbJjN/EZdXeBZMwgTfp10ap4JX1akoGdSvTOtyBShsI
	iX60IIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgQ7-000000094VH-1VRF;
	Wed, 18 Nov 2026 14:13:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgQ4-000000094U5-3Iyh
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 14:13:54 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8AB753F51A
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795011227;
	bh=KtJsCQtB4slLzmfLD0s11tSr8dU3d9fsZniscQImFmA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=eawyZez81rU5yJF1wXuX5dbkaNAwO++19D0aBZIvXwHWFkxkQPGfw7Ohl8g1LE8Di
	 tmslF4ljvEjOpYpEGkdm3T4M/k0KHd4KMbldqbh+gndMtE5ghg/fW/cdAMccDXKD2L
	 0WaPvRRRw2YP3yLWE5Q8/7Jl9dhgsSFjDG+Vx5cdmM7pCM9fv++UsunP619b9ugZFO
	 ItW2pjs5PLyVtjSlepFXweCy8VMbh76rs7eTwjPI0YCnDk6WPIMDTrLaFKpbu//RZ+
	 2Jfdfd1X0+jO/xbQ7NLkxlgavaGr6LK4v0QtBFNpFJbCcw7v1rQ2qUEIPAxH4HTnbf
	 akMF79sS4Gjb3FXIAIvi0NyIrzZK6C8ToEngr9fNw/jnAib6oiV2gVaoJZ5wDlR15B
	 f3KJXyAkvxGzWMhKraBRGMrE3Vn9xNjQtRieryx43FUJ4qb8bra5sfmwGoFGuFA7N2
	 McytTnS/sRngRcefJcFudkhx35sBjIxv6KO9TsqDYH/uLjieeDgh8AdHGSBg+RUO4e
	 6XeFWnRk0RHV7Sy758JlG+Q2P9j1Glt7SvCLW0xdITwv9/zli0B0MfLfJ8zQaXuAG/
	 DNAMKCbkT9tmuiB+0HcYqKmq7oMNd+6244lVIvSz/gFXcl6V8DGpPMadylItRw8qaL
	 NuJbPDfLZlobpB2tWJnaeLjo=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4d288b67ccso71720966b.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795011227; cv=none;
        d=google.com; s=arc-20260327;
        b=BzJRZVnhj/gLkkbpvFyPOq0FAMKpxNDy6/DYyIIAlQ9eAv4Z9/lL0Ja66saj7/UdaJ
         yvD2DeChIT72n4CuGIRhQVe6tA4zT4blbLoDKHYiVngIahJgUKFPCDe61mjVsjDOWiM1
         4sOgkj15jl3dI07Qn8v8T6bsCAYIJLWKYd4MFvCAfZFdWBYLJCfnzP8q+WhcQLf/J5z/
         03Vizbsg/frFOr8JGBudnxDH8yBkX9HkXSrpJ7e+Zr6XXxmZj5+lcO9QpNkEfoFC5p52
         NTI2RzxiXNMM7vxoMmkzluz1f39lJgmAj3Sbcj0OlhpNeqbhRQGRGXer7eqKSIQpEjq2
         wInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version;
        bh=KtJsCQtB4slLzmfLD0s11tSr8dU3d9fsZniscQImFmA=;
        fh=TWDsSRgyohn4tqBl1K27wbdYEFgnq/cRJ7k6iWPjWxs=;
        b=aE6FWdSdhgLCVEvJWsN2kri2MH17GJGE3Gc11aGoH3FpyNo0pQGmZXV2+l3SUoOgw0
         0ghROnuKc1Sxe7f/AYUhf5c6lBIDfijDNtEITZo09KGQGNsABGfpm7S+wAr4Ro106xZO
         RJPyv1bKYqyWWDYBFXjCvT3ZgjL3O2Gs4YTzDtMHYw5VWRzVi9R39n1fQkQ5wN4K22i3
         xgluc9KC5enfQP/01E8yzBchYwhIwyZp4CeSeJ2G8cdkE8c4fT0kn9m4J7jdg8ZSej+Z
         aW5SZhHycjtQ4dlmhyi73Jt0m+wcGGxOdgbXmsDLtvHhmedkGCessGEZPlsycBDBxCJZ
         ELjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011227; x=1795616027;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KtJsCQtB4slLzmfLD0s11tSr8dU3d9fsZniscQImFmA=;
        b=HJmjLXYB34Wpo+Vdh7d4R4aXxdOpdGejIEVZNpiY5g7aW3p2bMiOQ+H5Lfn7opCH2N
         tc93UthM0JuIvCzXhK4dsIU4nmvZa2x4cus5SyIQd/UXvDy2Uyq3AW5OMEiXvcdhFRJt
         CbBxbZoSD5Yh9oVmmjd6vqVuWY30gjmR0/NADLbbwdMOG5uzj4n4Hqq1sJfsPAbcewt6
         D6qQ105MonhMGbKl3jX7IpApSCXWLuPFMRsBWtoUKIWxrf5UNLRmj0gnSDn3Moy6VCzg
         LJwrDhc265YqaOWmJRFjfDnbWzNU31RVNrOB0fVvXDF4AvQgKzq0q+8La0SSURwixJSU
         r0wQ==
X-Gm-Message-State: APuU4Z8l7TEL6tlcqXfQ5FFEQ7mYrTh9xahGpy1bhO7+4ygoqANAP8VB
	/Pate9Hjej4aFL4wBpt0ziJBVetdtU+QBe87O9wlEKubeHc8+HJI4trIUPAQKUccBlBY2kJLyVL
	QbsE40sbeFEIqOsRLfuRTgxpqEWUjrGHIfaO7ZR6iVabJ9KpTq5U6gN7BzrBExhV/kRQFEelunA
	7o7+6mAkntOrYgemFTbGZWyD/e2Y9mnx8F2jl1Q4Wl1deCw0C2sg8pv1ydvzZSou6MBYg=
X-Gm-Gg: AYBFou0vtvdDamUwQmGM7u2OPGstxll3UDkZcuVAGlYaqo0gs2vnPgRFIuf4al47U2y
	3zdE9QCjNLnzCIC5kYbiaDQ5MKb8Vw9hUxLFC0YmrmOUWpKBzyf+t8VZ8fkgmFrpeAYC8ejcrUK
	NPr36Y1B22UjAzq5j/IxGGc5+yH3dSj7eSCdHH3ZXae8gajQ5AlrJ3V4kY
X-Received: by 2002:a17:907:ea94:b0:c4c:b4fe:c9f1 with SMTP id a640c23a62f3a-c510e518e67mr260745866b.35.1795011227148;
        Wed, 18 Nov 2026 06:13:47 -0800 (PST)
X-Received: by 2002:a17:907:ea94:b0:c4c:b4fe:c9f1 with SMTP id
 a640c23a62f3a-c510e518e67mr260742866b.35.1795011226779; Wed, 18 Nov 2026
 06:13:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Tobias Heider <tobias.heider@canonical.com>
Date: Wed, 18 Nov 2026 15:13:34 +0100
X-Gm-Features: AclHuK9HfFywsV5OnifLmbEOwb2bUF_IOO00_nvD-rPve7wXsTyjzkFR6oG_6yU
Message-ID: <CAARv3RRwnmtaC7ZJVD0tEc3VVOWh8AaTpp+TuNzR+D1M-fQF-w@mail.gmail.com>
Subject: ath12k: WCN7850: Missing board data for HP EliteBook X G2q
To: ath12k@lists.infradead.org
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_061353_259046_FC1DF876 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -3.3 (---)
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
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,LOCALPART_IN_SUBJECT,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I'm working on getting Linux working on a HP EliteBook X G2q Glymur
laptop which is using a WCN7850 card.
With the latest git linux-firmware I get:

[    4.939104] ath12k_wifi7_pci 0004:01:00.0: chip_id 0x2 chip_family
0x4 board_id 0xff soc_id 0x40170200
[    4.939109] ath12k_wifi7_pci 0004:01:00.0: fw_version 0x1103006c
fw_build_timestamp 2026-03-06 09:10 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
[    4.958280] ath12k_wifi7_pci 0004:01:00.0: failed to fetch board
data for bus=pci,vendor=17cb,device=1107,subsystem-vendor=103c,subsystem-device=8e64,qmi-chip-id=2,qmi-board-id=255
from ath12k/WCN7850/hw2.0/board-2.bin
[    4.958283] ath12k_wifi7_pci 0004:01:00.0: failed to fetch
board.bin from WCN7850/hw2.0
[    4.958285] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load bdf:
[    4.958286] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load board
data file:-2

I added my IDs to the existing e0ee entry as we did for similar
devices like this:

--- board-2.json 2026-11-18 15:02:25.041598035 +0100
+++ board-2.json 2026-11-18 15:03:11.825069089 +0100
@@ -68,7 +68,8 @@

"bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e114,qmi-chip-id=2,qmi-board-id=255",

"bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e122,qmi-chip-id=2,qmi-board-id=255",

"bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e125,qmi-chip-id=2,qmi-board-id=255",
-
"bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255"
+
"bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255",
+
"bus=pci,vendor=17cb,device=1107,subsystem-vendor=103c,subsystem-device=8e64,qmi-chip-id=2,qmi-board-id=255"
                 ],
                 "data":
"bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e0ee,qmi-chip-id=2,qmi-board-id=255.bin"
             },

This is enough to get the card working on my machine, I hope we can
get it added to the offical boards-2.bin

Regards,
Tobias

