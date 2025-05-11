Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F1C3ABC3
	for <ath12k@archiver.kernel.org>; Sun, 11 May 2025 22:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBnBzoIFoniefJiYbmW76aVR7ezh3i78bBci7FPCGCA=; b=oubJkQNZxT3UH/YibRCu1vK3z7
	TnUyADPq6azlQgTE9XDM+syVRrsjSbrj2QJyyzCQV+RZGo4RxRzfJL/56DKZGnsRh2Zswd3cG4+Yy
	YxdGBA8oon+PHUaRmIZojdzr1ZQo2lTaZ4cAjjGHtTEHkRuvOzX85kPw7WlNd5Nj6J/0ucPdGiI8V
	aKGnYKYVoxCxhZRW9e3fZC4h8Z0SbjcqmZnFN60tKhAW7A7eadYvbNCieK7d+DlTZtJAoEYz2Kz03
	3BfMejs6aUC43hSIPA2cgedxswlQogf8Q+OjOgv3gn9E5+WoIhfW20OjMW8tXoizPtLPlvGEYyHaI
	n50+j7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFCV-00000007xNI-2YeR;
	Sun, 11 May 2025 22:31:15 +0000
Received: from puleglot.ru ([2a01:4f8:1c0c:58e8::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFCS-00000007xKl-2crW
	for ath12k@lists.infradead.org;
	Sun, 11 May 2025 22:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=aBnBzoIFoniefJiYbmW76aVR7ezh3i78bBci7FPCGCA=; b=IVVKuhC0DEdsOc6sHzpOVNlUfU
	78FQCIFqkzBWjL+qDctQYdoLEjs1qgZaqxQi9cgi2YTZRXc3ebRj18UaiGAtTEHxuMP16mm+tqcxV
	dLlbngb6l62d+zkNTNIRfFy5Xgf8t9a2Dr6E3Hg5nTUpwTMR5q7TNhipKtko6SwV6Q1o=;
Received: from [62.217.191.191] (helo=[192.168.1.144])
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1uEFCJ-00000000u85-0GPs;
	Mon, 12 May 2025 01:31:03 +0300
Message-ID: <e63ac0579e0e3851a85020d2e575bd54a3dfd131.camel@tsoy.me>
Subject: Re: ath12k: kernel BUG at net/core/skbuff.c:209!
From: Alexander Tsoy <alexander@tsoy.me>
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 12 May 2025 01:31:01 +0300
In-Reply-To: <d76df512-5098-6e14-113a-bd22fa3b6245@quicinc.com>
References: <9073c24c1fe0e00a8b925548c90ab2f15f3df2b3.camel@tsoy.me>
	 <d76df512-5098-6e14-113a-bd22fa3b6245@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_153113_361107_8B67417F 
X-CRM114-Status: GOOD (  12.39  )
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

=D0=92 =D0=92=D1=81, 11/05/2025 =D0=B2 22:40 +0530, Vasanthakumar Thiagaraj=
an =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>=20
>=20
> On 5/11/2025 12:30 AM, Alexander Tsoy wrote:
> > Hello!
> >=20
> > I recently got two QCNCM865 (wcn7850) cards and experience kernel
> > panics on different systems and different kernel versions. Card
> > info:
> >=20
> > [=C2=A0=C2=A0 13.584230] ath12k_pci 0000:0b:00.0: BAR 0 [mem 0xfc200000=
-
> > 0xfc3fffff 64bit]: assigned
> > [=C2=A0=C2=A0 13.584252] ath12k_pci 0000:0b:00.0: enabling device (0000=
 ->
> > 0002)
> > [=C2=A0=C2=A0 13.584636] ath12k_pci 0000:0b:00.0: MSI vectors: 16
> > [=C2=A0=C2=A0 13.584644] ath12k_pci 0000:0b:00.0: Hardware name: wcn785=
0
> > hw2.0
> > [=C2=A0=C2=A0 14.210605] ath12k_pci 0000:0b:00.0: chip_id 0x2 chip_fami=
ly 0x4
> > board_id 0xff soc_id 0x40170200
> > [=C2=A0=C2=A0 14.210613] ath12k_pci 0000:0b:00.0: fw_version 0x100301e1
> > fw_build_timestamp 2023-12-06 04:05 fw_build_id
> > QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-
> > QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> >=20
> >=20
> > Kernels I've tried so far: 6.12.24..6.12.28, 6.14.5, 6.15.0-rc5
> >=20
> > Synthetic load like pumping traffic via netcat or iperf seems
> > unable to
> > trigger this bug, but something like downloading of Steam games or
> > torrents is triggering this bug very quickly.

I was wrong. iperf3 with multiple parallel streams and bidirectional
mode enabled triggered this panic in several seconds for me:

iperf3 -t 3600 -P 10 --bidir -c ...

> >=20
> > Any ideas on what's going on here? I'm ready to test any patch.
> >=20
>=20
> Can you try with=20
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=3D=
763216fe6c5df95d122c71ef34c342427c987820
> =C2=A0
> ?

This patch seems to fix the problem. Thank you! I see a Fixes tag, so
hopefully this commit will eventually hit stable trees.

BTW, I also see IOMMU page faults under stress test (iperf3 command
above). This seems to cause device reset, but at least my systems
doesn't crash now.

