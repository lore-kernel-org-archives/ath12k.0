Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBCCCCF9E0
	for <ath12k@archiver.kernel.org>; Tue, 28 Oct 2025 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzqxQn44Rawu4KHqmc2QSbe6uu5cIZQPifWK4yIyKYI=; b=wywK4fMZDlWrNJc8uW5INw8ynB
	oV9GR8UUQAw3VbckpSaA2TcZSRzjLJdbFQxRKdkeQGL9tAU7PzktJ0xYxwuB6E7svP3eGoqJpUxnz
	XEzh3amJL335JPiENpiWSfuhTgo5rjQIXa+6DRrMGNWBxLyKCrdEZ/FJQGb9N13xYu6sTF/fJFOBc
	h8DEYHGQJr2+7/Nd2mYyZUFFh7LOS1qHe/BPe5p2d6WukY/wWzF/pmwE6hCVkp+vmwEoiwUXJcd5f
	w5+XnajUsunszCR91MlYihJoZCzO9sn0Aq+/9EMNloCMqsGX/ukffV6YDYHg8r6WqU3KbRK1u6x6X
	G7Pk3R1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDY6z-0000000F2Yi-1KwZ;
	Tue, 28 Oct 2025 01:02:57 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDY6w-0000000F2Y9-2p24
	for ath12k@lists.infradead.org;
	Tue, 28 Oct 2025 01:02:55 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so5253762a12.1
        for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 18:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761613373; x=1762218173; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bzqxQn44Rawu4KHqmc2QSbe6uu5cIZQPifWK4yIyKYI=;
        b=H64d7yAUkmjgN5uE5qvtI5jg630VWADpSnmBWPsGZCuykrLsKRJzOafbXaXig/+KZz
         IE9w7AqFz2u9U5KyT34s1Oi3umGrpH/s6KK+CGRE+JfZqgAbukJVv4Nk3ymX3fTfQRPA
         DDNN1/vY7VhfKMXl6KSF36zddPWgYoTeQAu0D3QYgeN6T10rEWHjh9j3gz5FnggxNpJf
         4/aW6DjYDwu8Em1J2dafpsymV2sE4eUpi8l/oZxpX2S7m6bqbWmGbliP1rM8gdFeTTPN
         W0PBzPXKJANjPer5Bifhg0lE1bhlVh9RXHPZApoHSPqm8WgfrAXtNzy+PzDvuOG4UPcQ
         ij1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761613373; x=1762218173;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzqxQn44Rawu4KHqmc2QSbe6uu5cIZQPifWK4yIyKYI=;
        b=vZRwSYvCWXDJVkfzi/cxrjtFsvOQl/eQG620hjGBjDiODlrc0KQlfgXL6SSeo3hsL/
         j2fY57srNNthdP4/hH/UyX8aiWoDuk2ZVl1iHh7Y3GgZnuRkhhoxnRazfpE/O2L1Hbsr
         pTeee4+5TCnB2v/+WLdvTAO7li8UlTnLVxghKIa3BdI9/OXNyLU8qlbMsQaGCjCBpAau
         PxIxi6nmdfEzBjA8AamRkR3nGSoJJonWdrGIEWd6NMKNN9bodEAsd8kkDOV5pcXGgXwO
         Og4wzwpR/W4KPIdx6QCxNXq73dQuf0SD5RWNoY3Lr/5G3hGzbknBBCEg6ADv7ypc7oox
         op0w==
X-Gm-Message-State: AOJu0Yz3c61wCBhtEKdUZFhtgcAgM4zdn/7mtK8OcjXenTwNP1mlAjA4
	KU6z2BUIkAsvDCfuUn0Ktlg+B6msjh22vWWFsZUEDZhSEn8W0l0Ls3IwBOzpX4rTGmHamdJcJIQ
	OxqNkT7wkk5Zs4RehPpql8hhJKimnlooP+4GT
X-Gm-Gg: ASbGncudJjbtQDbscsf1xuv4dIxoPZ1dB/eyyPPALx+iE1Q9xw1mQt1RsjT4Spqc6u/
	WToZD9gy0ER7Yb59tTcNP09Orscfq4zyCXojAXpSi2g6sB+J/F6zv3ieDA4B7ooO2sNxGOblB8F
	kPSNUb4H/wStWDLVvVl+qBLuS9EWLYpKr4gXyDLpeDIaHvsytz4+O1sfbppVx6AphMTh6W4Nka7
	AV+13j9wHTHbMzW7sgvp4UMrPTWRiJ3Aos5gpofQUtvqkZqclS9RZjd7NfXQtTcZMHMDp4=
X-Google-Smtp-Source: AGHT+IHcvvlF/897SPU8q51vP5J87F/Wbpug8NiCXViP98El9mrd+EgLPnisXsnvXuTpDWB7byf0VchK3xYzU5b8F6I=
X-Received: by 2002:a17:902:ea08:b0:273:ef4c:60f3 with SMTP id
 d9443c01a7336-294cc6868fbmr16813095ad.4.1761613373061; Mon, 27 Oct 2025
 18:02:53 -0700 (PDT)
MIME-Version: 1.0
From: Dave Jones <s.dave.jones@gmail.com>
Date: Tue, 28 Oct 2025 09:02:42 +0800
X-Gm-Features: AWmQ_bkIRKMfTQN3bIC2xMut6HH6enHFq71KwIwSCVcDAYla0OI6UjS6GEMOFo0
Message-ID: <CANf5e8aUfBN2-OHZQumg63Z_j5T_Bf1YEwZgDSZNeZJbjKg_Sw@mail.gmail.com>
Subject: qcn9274: dualmac firmware IE not present in firmware-N.bin
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_180254_718589_004AEAB5 
X-CRM114-Status: UNSURE (   3.74  )
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

Tested QCN9274 on Linux kernel 6.17.2, but the firmware was not found:

ath12k_pci 0001:11:00.0: BAR 0 [mem 0xf2200000-0xf23fffff 64bit]: assigned
ath12k_pci 0001:11:00.0: enabling device (0000 -> 0002)
ath12k_pci 0001:11:00.0: MSI vectors: 16
ath12k_pci 0001:11:00.0: Hardware name: qcn9274 hw2.0
ath12k_pci 0001:11:00.0: dualmac firmware IE not present in firmware-N.bin
ath12k_pci 0001:11:00.0: failed to register mhi: -2
ath12k_pci 0001:11:00.0: probe with driver ath12k_pci failed with error -2

My firmware files are from https://git.kernel.org/pub/scm/linux/kernel/git/firmw
are/linux-firmware.git/tree/ath12k

Any idea? Thanks.

Regards,
Dave

