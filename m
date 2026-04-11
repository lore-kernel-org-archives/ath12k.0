Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88715F3ED5C
	for <ath12k@archiver.kernel.org>; Sat, 11 Apr 2026 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lEBMm5Vq3BijO1ncNlOeFCyYDvvwPRUe+ddmKEuKiW4=; b=4oiviSqu4ijl89GsXYX3P05l1u
	A79Wq+yDRzCJzHUQMQke/ziqzBdrLQkoBzXn8STmBnT13wGAn54lGkIgEDZ10g7hT2+1wAV6Q0P6H
	5ITya/8tPNjr4gNrE0RZiN1eOnO/1IjGJkYnb2h70o7c+DAqaUy8gu1rFmFQyvhbTa/AlS5xf5N58
	DzB7V5GqwZY8njoikj/MTyLrDddaNRSsyAu4lYdl4HnpBHZQi5/gh9JP0FrQ4sdb9Sfc3L1NSAFyJ
	OALgkXF+lOuN4tbYbAYjZELiZ5Xb4eYcy6dX8u5/3nlxryTQEnBcXug3u7fX7D9xHR4mzwSPCk+mr
	qFfUUTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBfye-0000000DoFm-0ZbS;
	Sat, 11 Apr 2026 21:34:52 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBfyc-0000000DoFS-0kd2
	for ath12k@lists.infradead.org;
	Sat, 11 Apr 2026 21:34:51 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12c1a170a50so2876103c88.0
        for <ath12k@lists.infradead.org>; Sat, 11 Apr 2026 14:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775943288; cv=none;
        d=google.com; s=arc-20240605;
        b=QuTGokEXkFhWxS9RMFTnQYqamh+N4XbgFFXKcolBt1jhPMSBktQAMHDZsAkS+byNfV
         puWQbu1oAROKaGFuT+OENBwSkjtxUhSYjr1zcswh+yuzOinnotgf8NuBnCAZ3ogVos5V
         67rLizfQyNbeQvdmyegzh0ykUtdFiNee8gjBWt+7QvVupKYIPJqkjVwD6ujfoXLONakn
         tRWa3AZh2Z2v1TsB/LNrDaFiTPokC/o7wy9ADQJjra/ef9kXx/KitxrauCVuC9mBjpkq
         DoSLJ5rfcXI/HDiy6O5Suf9D42kVuoaTM9x0U8NAHdvDGKV5bMkYTxT685E3QiAPERxT
         ESYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lEBMm5Vq3BijO1ncNlOeFCyYDvvwPRUe+ddmKEuKiW4=;
        fh=1SVnUWCOlqesgPz0exmlrbRHUNpcaNpUxuycVPutrXI=;
        b=PlEq/6tu0CM7iG4ZyO4/DLTAckv8QFIpB31FCRhn0iyWZ1/mZL9feRzmfIf/e4nsA5
         YL6NuvuhjlY29NkYOKiRBD2kqzCVuUcyVHrlmaPxnJt3Of4sbXVkv0Jf8rCKNfUoZklN
         GiqHUKv3wzlDSjrTZ4zGtbeM4yJSycJeXE4UcPnOYXDT2OnnnO3mZXgHNTef5EM3/9FE
         Mxx1ESQwyfExCm/C/fKthNtSxDrzkPP6Z8qr5TP0a7pxZN/TypXofKb0COShWq3zS4I9
         cRd5Td5k0wuh4fFcuKC7C2pe4MR5qUASuDb7jomRzJbD0nZTGU3fHsR/oY0icZ2lcp6O
         6SNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775943288; x=1776548088; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lEBMm5Vq3BijO1ncNlOeFCyYDvvwPRUe+ddmKEuKiW4=;
        b=OqqPMdkCBkRhX6/mBZWa5nw7cuBeWDeMU6E37QrmeKUAKab34+oR6QvXntgpV7r3jU
         hf7tvM1Ijf00uYHHtEm4uIpskOf6gXAol8YO26hEAcGYKK4+2KK2L5A5PFkDacd9hFJk
         M0Ny+DgXWlcKKL9JKFUhPU1gM3BXhHT/NYkRAuUpoEvhbtFfskdScCKsG7cpR+zIqyve
         YZqiHm3GS/mfDEdG3FxMX68zgcPNb3ssKqlzmdJnYpxJYZYpUXSQdbk6lRtRHlciJghX
         4otcA/Mux+5jiDLNIIbw6GhKE9QYYVn2e0T5dQNDHqzBHp8aiuNtHumZYMmT/59DYyIA
         OpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775943288; x=1776548088;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lEBMm5Vq3BijO1ncNlOeFCyYDvvwPRUe+ddmKEuKiW4=;
        b=L/dUx1cysGtHh0Q63gA1mHzifYuc+SnXeKqewunKFMoEGC8tUwlnahN1+HT4nnsaMX
         uHEqCtTEcNdb8q0WfasiTLyBRMblG6fC0x4hQTcJrOO+MeDkBrjSbuYV2ZFBjujsG/qZ
         kKgFQd1hWuaBaCsQUTUg1ETaNhv2oJ08VeSVE2gIpXRpRlmDevxZmok5Wx7oWRHWM2AJ
         Dl1qGn85UuaFy133/sJfuSsAJ74chOIHobszNor4yFdi+lfe+bsneC4Ga5CWP7lnAUFN
         dufurtUuS/Vc6B65Q2tJHmKYvazbAJBbJNZJ23OMIf7DXvh7AshE2QBNqUbMC7Wm4NYp
         dElQ==
X-Gm-Message-State: AOJu0YwlodSRohySsD/5F3U34saLE+uBVDZ4CaQB2yP6Hepcu7kcO9T+
	HNwepOQNUmtY4AW60NHPgxj4YxTPafaP+F4rLIhWclvnQ8UV1fFa+EuALBfOWNyq97tJfgYLvMA
	dUL/0U0WxAl4tvNexeqf1govDj+3EwuJHs56U
X-Gm-Gg: AeBDievzvFykHFl+bG/iWyPGu0m8d3GTACplI77WF+aAGQhh3xa2sa3QCicQ0XdK4s6
	9+a3p5YLFgEVjxgrFyCTb4EXtzfe/3FAmccAGRB68WwW3uYXJAhucQSnAQfs6G8W8ht+fXXIokN
	lr/oH3RzACPF75l35idwV5BDnK3hndNKG84PrWHojCA1fFH6ZUltB8giNuFxwhPIFRgTB2XZmaM
	boMGxs6HhWzutJnarZdrZr7Y/F6uQimpgCyo1wpL90K9V2D351tnsge9zxA8W99/IdA3C9hahMl
	0eBcYRsYMC00eLPmjQ==
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr4424465c88.34.1775943288418; Sat, 11 Apr 2026
 14:34:48 -0700 (PDT)
MIME-Version: 1.0
From: Jacob Wilson <jacobtwilson7@gmail.com>
Date: Sat, 11 Apr 2026 14:34:37 -0700
X-Gm-Features: AQROBzBvsjXwb4J_yJ904AGiH8eMTWyLTmIkYUNkOdowjdo6uX0Ub9ByTTjScis
Message-ID: <CAKYSms0Q1n3YLbCrMEkH+gTzEzmD2UhJjOC+YD3AJhoQebhfRw@mail.gmail.com>
Subject: ath12k: WCN7850 beacon loss on narrower BSS after prior 160 MHz 6GHz association
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_143450_222874_7485B7A6 
X-CRM114-Status: UNSURE (   8.59  )
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

Hi,

I have found what appears to be a repeatable issue with the QCNCM865
M.2 (WCN7850 hw2.0) Wi-Fi radio on the 6.19 kernel. I searched through
https://lore.kernel.org/ath12k/ and didn't find a report matching what
I found here, but apologies if I missed something.

After having a prior association to a 160MHz 6GHz BSS, when
disconnecting and associating to a BSS with a narrower channel width
(80, 40, or 20MHz), repeated CTRL-EVENT-BEACON-LOSS messages are seen
in wpa_supplicant logs, and the connection to the BSS with the
narrower channel width becomes unstable.

This "beacon loss" state persists until either a system reboot or a
manual reload of the PCIe device via:
  echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/remove
  echo 1 | sudo tee /sys/bus/pci/rescan

My setup is as follows:
OS: Gentoo Linux x86_64
Host: HP EliteBook 845 14 inch G10 Notebook
Kernel: 6.19.10, Gentoo dist-kernel (sys-kernel/gentoo-kernel)
/proc/sys/kernel/tainted = 0
Wi-Fi stack: NetworkManager and wpa_supplicant

Test WAPs:
Edgecore EAP105 (160MHz on 6GHz)
Ruckus R310 (80MHz on 5GHz)
Extreme AP3000 (40MHz on 6GHz)

To reproduce:
1. I connect to the 160 Mhz 6GHz AP. The connection at that point is stable.
2. Disconnect manually from the 160 MHz AP and connect to any of my
APs running a narrower channel width
3. Monitor wpa_supplicant logs, and I will see CTRL-EVENT-BEACON-LOSS
within a few seconds, on a repeating cycle.

Of note - when my connection is initially to a narrower channel width
AP (80, 40, 20MHz), and I move from, say, 80MHz to 40MHz, the
connection remains stable and beacon loss events are not seen.

I'd be happy to provide full dmesg, .config, iw reg get output, or test
patches if it's helpful

Thanks,
Jacob Wilson

