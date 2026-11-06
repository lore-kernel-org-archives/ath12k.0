Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813D606A32F
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DYhpIc3I;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TwMKA+vO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=py3eBtt8P5bhIku2z3P55+R55Vv5f4EkkhmMuJFNNdQ=; b=DYhpIc3IYiEq+ZU+kYDbf90yJI
	58awUDC6KqSaSEGjPlnShyXf+75D6LIaH3HVJCxkSU87xeYVS5NpwopRXvemt+QxNVC5YezMxqg5W
	OZWmWygaxWLfnKzDNxQB07uNZNo85x62XlpaejvXF+ZWOyJxG4BwTYZ5KwmjaIOrK+V9Fov807Ln+
	poRi/FgI74h4bFbQEzeBTvFztwdXeDDIL0zs3eyzOOSuq/Vi4o8oGUpOrNTTEd0odMQoe6Ho5A7oi
	KSgzR3dKDvUphLxOMH00lh8xswb1JV1mQkHoQSf7QOhiPFOiP6ohF5gOjImqlLqZc4WV5sqxgGA/n
	nFwL/yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIjM-0000000CGa6-1QAF;
	Fri, 06 Nov 2026 12:07:40 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIjJ-0000000CGZN-1fXa
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 12:07:38 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-15dd124bbe7so1208462c88.1
        for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 04:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793966856; cv=none;
        d=google.com; s=arc-20260327;
        b=NWhRxt52NT3C0qRCmg7tsiq3mLdKVY4ZFybqVKHHoa0VFEDY1VfJc22aL9KU2vvWi6
         NdDh6Fekn/6ELDE6maw6b+isLaaUIevrx0+JXklyh8rWrzUzMvfZX/1lbp9cBQpt+wD4
         0kHRN/wyrMDqOsF8E+adffbDwec9ZLSniRnnFzTIRP5S1NOpDJjARzDTbSh8K6ONWpzM
         153DRA1OfvLcH5dIxZLpnKAnfdfI30N0NSS9qaXa9IQdf9ZqJRMX1uKeHQrYp2SASsR2
         z/RVAobpKXd5v+9NKagwkEWGWtWnbVE3tCbNdgeVeQqd8ajL4I3QUCvbUd04xSf/75oj
         8jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=py3eBtt8P5bhIku2z3P55+R55Vv5f4EkkhmMuJFNNdQ=;
        fh=e0hiaC9xgf4GgM7P/vAKFWFdVpLxR0r1Sbf++nBbX44=;
        b=SPU0uYfoXtz0ej+ctM7dAH5fY6NkxMUNTQ9/DqJosU/ykhBKl970COG1Ad4EHZG9eL
         efODryriSSP5FnZwBaiI76RCrbjZdbSeF/jUgO76NoeUS3RcxtwSKacyUHmOgp5tkHLy
         Z2ndn34ubtMdfS6blaFF4H8eEosH4L0V5cdsb97FkjOgh/pGJk3RwnFQ4buhOT4s1QMH
         V9fDvwwWuDztNejIRWtWkBhQ8A7g2u9jLgfmtG6FfKkrRsRLWj1axEImNi8rvZVxbDmh
         D0dTEnOCVDSNyQ63xc+PD/QiivoMTxcwykAf8FUILd9cDncxgHCCZLsxDBhBsrM09gRy
         WBYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966856; x=1794571656; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=py3eBtt8P5bhIku2z3P55+R55Vv5f4EkkhmMuJFNNdQ=;
        b=TwMKA+vOTVlqYEF+BeBJ1gBPmCELDSSZ7II5ul7GKhKdbYBWEvL88bpRulZGqRcNVs
         R42DEBLhfAOF22LmqxjbFIdu6163rPQUPyTyx3pyW5FQEL13rc2ubu3xLVhmzFvxRi/y
         SHJf2bFuoCvriHH/Mygp4BQB7F0Mrx+VH1SZe/WPM50cjaS3J+yKXWS0dvSUYjovmTPM
         TcKzQ3pKEb+aO2NGt13/K9JjK5BiO5BI0Bi4Nny5upXDAlnB9NHKn7VbnDgUydUbJnqJ
         o/o/g1XCEbjPhci0KojCMxff27Ar0nTg3QeVApt991XET09npgU7alwOicE64uBEY7z+
         oCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966856; x=1794571656;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=py3eBtt8P5bhIku2z3P55+R55Vv5f4EkkhmMuJFNNdQ=;
        b=BGdFL8qOvp3YHhp5O2OZIYl98DnPCnm3S47XtSfGMvIGR7JTpScsj7q/jROiWuGXM+
         Up2TeCQi9YFKygHRX1rzWsffABjccbPf4gDVHyKnqc+xLxjBfVXSUlEwLusikXaGuYza
         A6V9lZcIO2eS5GrF/jYC6WpXm0/34tKug7OdJvIngPX32tvgGV2jnX39nh9QeOUgvMnx
         DADoDDurvz62gcpn8yurvZHuQDILGBUfJQE2lFSZI8l+PpvEpfcjeoCalrhm0zbq8GYq
         0xDZ5CrVEuHTxp1ZZnjKZf0tLsfuqHSeYma7mv07ucYxG7XerNA/LgU9SoA6Oql/bH0M
         mD3Q==
X-Gm-Message-State: APuU4Z/WAY7Efzr0dh6v7E+zKXfsK3E+g2qi22dCk2kSJlQdKsVuoj6N
	7DRZOOO3MmrJDsPvDwRru2N4sa06ag/++kyJs8V/o9td8BA1RKSO04n/Ud19stcPAJyQnUIsvpK
	pyQlujo2kRqC7nf+suW72WDDQtWkHKx4=
X-Gm-Gg: AYBFou0ZSzzN7ymj2w0uSpXUDCFyTqDoiEJFd8rFbZNQoz4vKIMQKP2nY98oU0fuB4B
	D6bSI+UVEYY/pffsxKeThLP3zUI4gvdlYrLT+v35m5FJReD/X0KwpUKCRYr0szQqRStyFkg0ETk
	ls+ciVtEZJZ/vcT3VATSCxEAJo+I3wrV8m7MtJfDkQDUll5d5ErpMBHRGwvQhqrDTbAIEaDhZCN
	ZSlU/82w9jzMKM5kdTHb4A5maXxTS2ySOGsSAoo7muVzp8OjoMsngh8tXg5h8OjmEKchLe4PxpE
	A3JWbX9D28PEaU/IAtOMt24W6WsRPaeh7k5+wm06ymOEEmsfTa1emQnl7idl/9WpTagGrxWXllM
	smgm7hVL+wQMEPZ0QGnS2FshGKHf8UzsFrQ==
X-Received: by 2002:a05:7022:1702:b0:187:7514:47f4 with SMTP id
 a92af1059eb24-1b25d3927dcmr2536752c88.46.1793966855022; Fri, 06 Nov 2026
 04:07:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Rahul Balakrishnan <rahulbal29@gmail.com>
Date: Fri, 6 Nov 2026 04:07:34 -0800
X-Gm-Features: AclHuK8BGNXkZKg3kxkBKPc12vNFTGIurvqilUCXNILdY1Fwr1YUHwExKh7w-Rw
Message-ID: <CAMOo2XeHzsWR_f5j1+ukPn97CpSNtPM7WLm1Y8cWqdGm3=yJFA@mail.gmail.com>
Subject: Issues with ath12 wifi driver on WCN7850
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040737_445320_A338D2DA 
X-CRM114-Status: GOOD (  11.06  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Mr Johnson,

I have been encountering an issue with my Qualcomm Wi-Fi chipset. Here
is my currrent system configuration.

Environment
===========
  Board:     MSI PRO X870E-P WIFI (MS-7E70), BIOS 2.A52
  Device:    17cb:1107, subsystem 105b:e0f7 (Foxconn)
             "Wi-Fi 7 Hardware name: wcn7850 hw2.0"
             chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
  Firmware:  fw_version 0x1103006c fw_build_timestamp 2026-03-06 09:10
             WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
             (Arch linux-firmware 20261019)
  Kernel:    7.2.11-arch1-1 (Arch distribution kernel, not yet
             reproduced on mainline)
  Userspace: iwd 3.12
  AP:        5 GHz, 5240 MHz (channel 48), beacon interval 100 TU, PMF
             in use

Symptoms
=========
The problem surfaces after S3 resume. The AP beacon is missed about
~12 seconds after establishing a link with the AP. At that point, the
AP disconnects. It then loops back into scanning for available
networks, and the cycle repeats. The issue is infrequent but it's
rather annoying, which is why I decided to investigate it.

Here is a Journal log of what I see with (debug_mask=0x1132)
  03:16:32.917  keys installed, "connection done, update reg rules"
  03:16:32.935  txpower fetched from firmware 1 dBm
  03:16:44.567  wmi roam event vdev 0 reason 2 rssi -128   <- beacon miss
  03:16:46.397  5x mgmt rx stype d0 (protected action, len 49), snr -44
  03:16:46.575  scan started (iwd roam scan after CQM beacon loss)
  03:16:46.586  mgmt rx stype 50 (probe response, len 708), 5240 MHz,
                snr -44
  03:16:47.574  wlan0: Connection to AP xx:xx:xx:xx:xx:xx lost
                (deauth reason 4, from_ap: false)

I initially reduced the signal strength required to maintain a link.
Then I assumed the kernel was setting the module to low power mode. I
disabled low power mode. That didn't fix the issue. I noticed that we
still receive management messages from the AP. So I looked into the
driver code and saw that "no beacon forwarded" is treated as "AP
gone," which might be the issue.

I might try to get this to Qualcomm too just in case through a channel I know.

Regards,
Rahul

