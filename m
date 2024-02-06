Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA67C48297
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jzvTRvTHnNAqPpd7v6l1oIeYqPT8wbi+L8ob8OzDhDU=; b=Vs//EJ4opwUuCHp55/VRVa67m9
	SaaYraCtGhfMRRz/S7lZzDDeH33zivWq0Yt03pFQ/lC8G8n70+yvhflFKxRD8t2VOkHMi5chAicK/
	HmQF29Ts8zZ5+VKjF0gMm5zY3IMnJcufJiVPO1Lwof+WRWOnN4EsV2/fyV6mDgPJs35eKkcD5uHuG
	1ciOBGTxl66dQYqRlnekqcK05FpYUzDn/MWozGjkHprRcJCB6LWTmbtJ39CmYWBBGKiwzBWrRdN1p
	UdVKLRENdz0AOUPxmbSg63oWUB1RGxbiJ48+l61F4ZkTg+qiKyZ3HnKQ/+f88lN1xqmOskbylM4Kw
	SYKP/Ogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKL5-00000007WLh-2GfL
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 12:14:11 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKL3-00000007WL7-1i2M
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 12:14:10 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc6f6d10ea9so3680885276.2
        for <ath12k@lists.infradead.org>; Tue, 06 Feb 2024 04:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707221647; x=1707826447; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jzvTRvTHnNAqPpd7v6l1oIeYqPT8wbi+L8ob8OzDhDU=;
        b=ZIDIG2vEVT+GTuZksxZvxnDorUJRAcCVIxTxwQUtQ2Y3vxQqhbzNIQhYl0RtIkBEXj
         LuLzcZYcjneBKWHIfdxQvMGTvtW1YzJ68vYOzeiuXye/m3WW5nKVE6TUFJxE7YaNw0eW
         qbs1q0VPtRtSPyG6ncnSFbC+WvtUl+WKEjCMMwMptFaztgZlRoNDz3VAjtytOvoZJ17M
         DSIyKTGQ9AMM5SB+mf45Z6NHBOvcrMjis7lsadr8DvxKGQ9KoqPW2mbgqYZxG5YSGwbP
         Vt+jsrHNNl1f1Pvd/0ZmoC4ZtiTl/D+uYovHLZILr8g7JQqj25tgPx3xKoHvWBmPhkli
         OYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221647; x=1707826447;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzvTRvTHnNAqPpd7v6l1oIeYqPT8wbi+L8ob8OzDhDU=;
        b=i82EGEG9CRkoHrZtykwHxMjeC9EXRvyNklp0Q1e35M/0Lds2Q+Mf9GZZ/EMYlnZz40
         hUGzDfn715acP+2QT09HGI8+1PN2Y9nQ5GdmUlBOGoDgCUHJXZxYcbk8fsAFPMtTDwZF
         +8YVstc+BELoncnXZAPzQfAcKg3xdFUcelu6GpFFe/9EWXdeF+urr8vXRHoySr9iaBD/
         gxGEEDXhLe+hyWvBtbyDfvvhXVmlYxpPQcELF/CWVVfiXUjqpmhk2UdKQbSWXB1um4bl
         aCfwlx3yNxEDk1yOXOP3OS2V6AqH6cs/fXkjgPI70+WX1QLCZj2aUgoh3ETg5QYOj+Jt
         RacA==
X-Gm-Message-State: AOJu0Yy//kzxzE4R3vyZq0ud8+xrZjhmVGCBZO8hKAGnDITysXxCAJYb
	SfU09LcyvCqQT1/lZOoX9tb+WrYWwr09dcyVzNA6Sv11PHLD/VAhgtc/KMybIZ8eFUeyo0hDbC0
	3tHS4D9gxAbxiOmIJSQFvtEuYJgLBZtPP5HY=
X-Google-Smtp-Source: AGHT+IHT7oAE7YEGw81mipbLhk3kjKpOF9eNz2bIXJF6MZ7gAB37a6675nbs39BmdKuAxvKPdSuYlXJWhKeFJi3d2EM=
X-Received: by 2002:a25:206:0:b0:dc2:1f56:11e4 with SMTP id
 6-20020a250206000000b00dc21f5611e4mr1399860ybc.24.1707221647082; Tue, 06 Feb
 2024 04:14:07 -0800 (PST)
MIME-Version: 1.0
From: Dave Jones <s.dave.jones@gmail.com>
Date: Tue, 6 Feb 2024 20:13:56 +0800
Message-ID: <CANf5e8YuWEp-NdF1+nhtH6t2KLac8MqMX8HyiZgUE=MvQBiefw@mail.gmail.com>
Subject: WCN7850 doesn't work on Linux kernel 6.8-rc3
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_041409_469188_CF3CEAB8 
X-CRM114-Status: UNSURE (   5.50  )
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

Hello,

I tried to test a wcn8750-based wifi adapter under Linux kernel 6.8-rc3,
it's not working. dmesg below:

ath12k_pci 0000:02:00.0: BAR 0 [mem 0x90400000-0x905fffff 64bit]: assigned
ath12k_pci 0000:02:00.0: MSI vectors: 1
ath12k_pci 0000:02:00.0: Hardware name: wcn7850 hw2.0
ath12k_pci 0000:02:00.0: qmi dma allocation failed (7077888 B type 1), will try
later with small size
ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x4017
0200
ath12k_pci 0000:02:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:
05 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
ath12k_pci 0000:02:00.0: qmi failed to load regdb bin:
ath12k_pci 0000:02:00.0: qmi failed to load regdb file:-2

Should I need regdb.bin? If so, where can I get that file? Thanks.

Regards,
Dave

