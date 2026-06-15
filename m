Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BACCCD98DE
	for <ath12k@archiver.kernel.org>; Mon, 15 Jun 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FpQspOt3oBlmx1ICglqJz9lIvpUfboVOloEqqL6E+S0=; b=e9k05LJA0Vx57CL2Che4O2EBwq
	rIz8ouzo01EwUSasT0feEEhLYbvSMUmvVr5nXAw/OFuIG0fZVjFDLSxpnn7M6qk5nmaAEaJXmm17o
	1pI9QB5w614wUc9km0w8mUd6D+acDx67Gvsnfhm80oHSTcH5xmIyJTdzxHjQcfQoZIXym/lltqiwP
	3G1sXCZy3UqwmEDkBZqA7yT28J67GOEg4EekIhGcrStyv2Hndnlt6FQAoQmDMOWltKyETo+UBvVSA
	LL+x3v7SPqO21db1MJ89b2WuMpHO2oS4naq+AqXcTXEFIqMTOW/TBjQZGgTup6N3/DlS2c335O5Gc
	TEWOllPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2pT-0000000DtMJ-42lC;
	Mon, 15 Jun 2026 08:37:59 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2pP-0000000DtLD-1gBj
	for ath12k@lists.infradead.org;
	Mon, 15 Jun 2026 08:37:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-91591f19c30so444066885a.1
        for <ath12k@lists.infradead.org>; Mon, 15 Jun 2026 01:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781512674; cv=none;
        d=google.com; s=arc-20240605;
        b=GOHC8ej5MdHsTyaNO/ei6vWYpO+kjPZj4xVVTM0zQSy2wcBC5fRHIJRhUH7MQg8IFs
         7saf9gi7HCcVvgO23Znq38RphYY+G0njsLzlipeTpMQMFNlPgvbdGMU5FnLDwNA7q6oe
         Ol/9yl+t2pmdD/rN6Eks9kMvnatxR6i+48ptrbD2X1t2YAzzKBzJLHKjD9f+CuAvzVt2
         4AwRexWLPrFW/ma+fp5eQ/lcQ5SDaK66lCzuAo2zMgVuChikPImqN09ihR/NQGkQnu1n
         FZ9r6DAiylzNcYWjc9UQbxTTGzbxRDVBSKdkky7bd1owTGPifCu80eERB9myfTIdk5LR
         DJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FpQspOt3oBlmx1ICglqJz9lIvpUfboVOloEqqL6E+S0=;
        fh=7aUtyT8zpJGScMHyGjywsrvfXXRZJK3Rofi+q1nz8Gk=;
        b=CqWFOibD0ONyRpZAHV7Dj10FJBumEmg/u7xY8NXUuZx53nu1lfiFonyi82QIRH6W2r
         uL3XwfuRapB7Mos9wBMWGbqA37myte1L9pZljqVjDlGkG/4Nr/htL1G6BExNqSZw0TJb
         zBRhA/Dp+VondX38yxuJ/ODAqbjIhDmMjNlv1QjaVN9WL8nOL1sOoI9bKEGH2KIPg4RC
         G71+YYbx+7h5HJgo/ISHbucRhcFCiuLtbqGZ1l0oyprGR/kFrgWu8+i/Dw9CZpvvef7o
         V7cONszG2ggyKGU5R0S9X/k4p68qeby7fuSw3ZT/d7pJOWsVxPYTyd6WBgDjUI0s/eRA
         YEiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781512674; x=1782117474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FpQspOt3oBlmx1ICglqJz9lIvpUfboVOloEqqL6E+S0=;
        b=MHpvecjcxOXOEL+6JcdMhOENdZ2d9e2+Yxdhjk5269L2X+LNjiuPX4zPLGUtqpYYdk
         btzIsNJFxqiu8Pq6SsmN4LPf/7Qf8Fop2cuxpH9BLyTYX+0heXoqqy0vnDB0ZBa5BgXO
         v7ZqMC7/QxAHos+mrDOkOKhebXWREPDSl+LBzkqJByokHypG+zWtHuBKmhRAzul9ONmB
         GZFWrlD2Hxc6mTKAUE0jvUVqh/2MNi+WSWaxUmBZ7fQgKXHl8a04qz/z6ms+QtF1fQkr
         XviSIwtm5kh+DAMA2nA7d2xsuLZXcWd1TgNUIGjzeOB0KO9Woxtvx59AE/vYBYcE5TXJ
         3mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512674; x=1782117474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpQspOt3oBlmx1ICglqJz9lIvpUfboVOloEqqL6E+S0=;
        b=cFEEqgv+nYt0iVYkBll1/g23wDnYHF1MZ5na+nXxCx9pFrq+dessUOKvtNlnsDK7yy
         ejvH0mu19o6BndOhQK8YgAsXoN3Lc0x4/OcCui4QLd2wiaFRz9RnCXLv43BGMZNMg1kW
         8J/i5fC1ogN4S8yvBs8fOeSwoXYJCtUuhKpDKentdVGy+t7UsyyvP/gVAeBCP6GD/Rtr
         Hypq+6trjORFOtie7CpVwQCItIgxublnabK0bxFAQRqAIzmO0yyEWxWCa4q/yqUN9a8Q
         yKj5uAhjS901/yhOjqNgQYiN0M6COk5/FPWfGUmqhlJtzys6Je5+WhUt86sRJczaqJDK
         6Xmw==
X-Gm-Message-State: AOJu0YzvWL0xjdAQUTvK1m3oJWDKH0SHCbl4bdO28mWIzvLzt5y4lYqb
	9t3NcZ+eusVB+0HkSqwWNHEce3Pujnj6wF844EEqsQQ601/XCOShXL4Ill+Zf1+vsNBISdHnCfa
	D6El7N6ReIyqZZZPPwxMm/X69oh5zrOgEdDuqwOY=
X-Gm-Gg: Acq92OGPrz9KP0I0JoOIFKIl05T8nnivo3RLsnEyl7bHCny4y2uGU5uoWrae1nh1x97
	2fbLojJEhgjGtZma5F3S1YHQoP9n8J1g7GI8rfjTlD15KyKSnZlaTn2zXWxlhwKwyikzQa+43NU
	w/jevbep8MlO5BYUMsf2sU9NHugJaFG+FqBLELV75U2L5OS0uc/iojJJljaj3zlvMGjY2aE6erm
	nMmkHg5IIYDG87BkApSPOJJ1xPGLZsS/WWqAK8jzSI3hjxGLpFu8wPyc2OBaLtXzDOMSkv67YWZ
	9ck5r8Hf9n8wW43g/7AmlX6M/r3507C4LxWlSwWKT+cvwqj9vA==
X-Received: by 2002:a05:620a:2a15:b0:915:b9f6:71a1 with SMTP id
 af79cd13be357-917f1f4b4fcmr1445280985a.45.1781512673970; Mon, 15 Jun 2026
 01:37:53 -0700 (PDT)
MIME-Version: 1.0
From: Paolo Ferraris <paoloferrarisperso@gmail.com>
Date: Mon, 15 Jun 2026 10:37:42 +0200
X-Gm-Features: AVVi8CdNIkSw2jDRK5rfxm4oEMNyllliAxvyxzjlLQaUxh_QzJuI80m1x50uFzU
Message-ID: <CALHCNm8dsuWWYRCsGNa=1ii-Xx=Qeu4LPQ7XfbaPwhwA61zxsw@mail.gmail.com>
Subject: [Feature Request] ath12k: Optimize s2idle wake latency / Implement
 Fast Resume for WCN785x
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013755_447415_D07CEFA2 
X-CRM114-Status: UNSURE (   5.90  )
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

Hello ath12k maintainers and developers,
I am writing to respectfully request an optimization for the  ath12k
firmware/driver regarding the resume latency from  s2idle  on modern
Intel platforms.
Hardware Details:
  =E2=80=A2 Laptop: HP Spectre 16 (Intel Meteor Lake Ultra 7 155H)
  =E2=80=A2 Wi-Fi Module: Qualcomm WCN785x Wi-Fi 7 (FastConnect 7800)
  =E2=80=A2 Kernel: Linux 7.0 (Arch Linux)
The Issue
When the laptop resumes from  s2 idle  sleep, the WCN785x takes a
consistent 10 to 15 seconds to establish a connection. Based on  dmesg
 logs, it appears the firmware undergoes a full cold-boot sequence (
fw_version  is re-logged) followed by a lengthy passive regulatory
sweep of the channels before allowing Authentication

Diagnosis & Isolation:
To ensure this was not a motherboard ACPI issue or an Intel PCIe
dropout bug (like the  0xffffffff  ASPM bug seen on some Intel cards),
we physically swapped the Wifi module on this exact same motherboard
to a MediaTek MT7922 (Wi-Fi 6E). The MT7922 resumed and authenticated
almost instantly upon waking from  s2idle . This confirms that the HP
BIOS and the Linux kernel are handling the PCIe wake states correctly,
and the latency is strictly isolated to the  ath12k  firmware
initialization and scanning routine.

Feature Request:
Would it be possible for the Qualcomm firmware team to implement "Scan
Caching" or a "Fast Resume" state for  s2idle  in a future firmware
release? Ideally, allowing the chip to cache the connected AP's
channel before sleep to bypass the massive 15-second passive sweep
upon waking.
Thank you very much for your hard work on the ath12k driver!

Best regards,
Paolo Ferraris

