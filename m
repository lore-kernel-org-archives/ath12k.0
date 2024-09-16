Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1401CC3ABA2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bf3e4ZW/awI5y7NWL8d0vf7OpKh1WeGVRKbMxwjqiMA=; b=AkfPWsilvaCVjFJkepUNrBYs4y
	ZSFHEuP3dQ83wfVOpQClzykBwicgOjlmhYewL00zESHMTJ5q9GHJ/0Mmg2xdKqgFlYPVxviDSEjJ8
	Ox/NgqlphdN7Wr4+QhkL0eh326q0GDluDzCCccGJpaGZoCiQuh0OMEntd0TMrAkYT9Io644x0od4l
	U8ZK4lYGrI2nHrN8BqhG0GtUaMOzkpi0K5Cuo/pwBRF5dNzuVnwCFNIuovGSqVVbpv2W0Ozs2byID
	oo+3pMSQrFmGvsgFWD2/eeJW4PbIs6hMOBZy7ZZAfxQZ8tFz9n/BVffsaBVWK9g1GYWylSHk5URWR
	sUYBUVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqD31-00000004G2b-2wTS
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 14:49:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqD2B-00000004Fs3-0wB6
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 14:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60292A42880;
	Mon, 16 Sep 2024 14:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C190C4CEC5;
	Mon, 16 Sep 2024 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498137;
	bh=bf3e4ZW/awI5y7NWL8d0vf7OpKh1WeGVRKbMxwjqiMA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=J+CTRrMsTlbq0Z+BvsPzQWmABzas4wYpmIAmOwvaOSWD0iDEVUJsM0XFTbRh3xeRn
	 RaztTfXCkqPHcPwz2+9KhucYTIY57jHx1PFDg6SKoZSgLf8FZyPnbN4N42yE9erQLa
	 B4AA7W7LOJeA+ry3zmbcuKDEyLPudz3hWsawbvqLl6JLvff8/VzMenaP7l4eO7g4ts
	 16Gmzm+EpmcMiE18rFLvdrYIcxHg+5apqs0rz1IVQMqns1TQLLyoK3B94a1j3I7pe7
	 6+U64VW9Jy0JI3w6FTsYaLFYllvO4YcUUWWjuZA3+fr8b37VLYhMQ5bQI4St0HBP9K
	 t9+dUQwnCOyxQ==
From: Kalle Valo <kvalo@kernel.org>
To: Benoit Masson <benoitm@perenite.com>
Cc: ath12k@lists.infradead.org
Subject: Re: Fwd: ath12k driver on Debian 12 - High ping latency and MLO
 support query on 6.11rc7
References: <CAGHj7OK5tvjfUkb_oFMwk041mo_41WV0Uu-h2v_0_YQqjTrFyA@mail.gmail.com>
	<87msk8dmts.fsf@kernel.org>
	<CAGHj7OK2dwy9LbbZWC_WdV0evhmKfjwyn2bTy4Dz5-XNxtcsyQ@mail.gmail.com>
	<CAGHj7OLRyHScHTYpzWEyj1RhfoW1hce761b+eKKcDe0WA943mA@mail.gmail.com>
Date: Mon, 16 Sep 2024 17:48:55 +0300
In-Reply-To: <CAGHj7OLRyHScHTYpzWEyj1RhfoW1hce761b+eKKcDe0WA943mA@mail.gmail.com>
	(Benoit Masson's message of "Mon, 16 Sep 2024 15:39:44 +0200")
Message-ID: <871q1jejs8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_074859_419994_1ED1E707 
X-CRM114-Status: GOOD (  29.25  )
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

Benoit Masson <benoitm@perenite.com> writes:

> Hi Kalle thanks a million for answering and taking the time!
>
> On Mon, Sep 16, 2024 at 10:28=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wr=
ote:
>>
>> > While generally stable, I'm encountering two issues:
>> >
>> > 1. High ping latency/jitter:
>> > - ath12k: 3.5ms to 55ms (40ms jitter)
>>
>> Is this from network to ath12k or from ath12k to network? I recommend
>> testing both.
>
> Below the test both way;
> 1) From station to access point:
> ping 192.168.1.1
> PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
> 64 bytes from 192.168.1.1: icmp_seq=3D1 ttl=3D64 time=3D13.7 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D2 ttl=3D64 time=3D15.5 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D3 ttl=3D64 time=3D3.70 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D4 ttl=3D64 time=3D12.2 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D5 ttl=3D64 time=3D23.4 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D6 ttl=3D64 time=3D12.8 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D7 ttl=3D64 time=3D13.2 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D8 ttl=3D64 time=3D12.0 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D9 ttl=3D64 time=3D11.9 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D10 ttl=3D64 time=3D23.3 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D11 ttl=3D64 time=3D12.9 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D12 ttl=3D64 time=3D12.2 ms
> 64 bytes from 192.168.1.1: icmp_seq=3D13 ttl=3D64 time=3D6.48 ms
>
> 2) from access point to station:
> ping 192.168.1.169
> PING 192.168.1.169 (192.168.1.169): 56 data bytes
> 64 bytes from 192.168.1.169: seq=3D0 ttl=3D64 time=3D5.582 ms
> 64 bytes from 192.168.1.169: seq=3D1 ttl=3D64 time=3D4.469 ms
> 64 bytes from 192.168.1.169: seq=3D2 ttl=3D64 time=3D357.588 ms
> 64 bytes from 192.168.1.169: seq=3D3 ttl=3D64 time=3D398.582 ms
> 64 bytes from 192.168.1.169: seq=3D4 ttl=3D64 time=3D419.028 ms
> 64 bytes from 192.168.1.169: seq=3D5 ttl=3D64 time=3D449.935 ms
> 64 bytes from 192.168.1.169: seq=3D6 ttl=3D64 time=3D21.677 ms
> 64 bytes from 192.168.1.169: seq=3D7 ttl=3D64 time=3D3.836 ms
> 64 bytes from 192.168.1.169: seq=3D8 ttl=3D64 time=3D370.563 ms
> 64 bytes from 192.168.1.169: seq=3D9 ttl=3D64 time=3D17.126 ms
> 64 bytes from 192.168.1.169: seq=3D10 ttl=3D64 time=3D3.833 ms
> 64 bytes from 192.168.1.169: seq=3D11 ttl=3D64 time=3D58.386 ms
> 64 bytes from 192.168.1.169: seq=3D12 ttl=3D64 time=3D81.823 ms
> 64 bytes from 192.168.1.169: seq=3D13 ttl=3D64 time=3D107.806 ms
> 64 bytes from 192.168.1.169: seq=3D14 ttl=3D64 time=3D170.339 ms
> 64 bytes from 192.168.1.169: seq=3D15 ttl=3D64 time=3D52.075 ms
> 64 bytes from 192.168.1.169: seq=3D16 ttl=3D64 time=3D7.189 ms

Yeah, this look like delay caused by IEEE 802.11 Power Save Mode. But of
course this is just a guess still, not a full analysis :)

> Thanks a million for having me to look in this direction ! Any thoughs
> on power_saving settings for ath12k and best way to make those value
> kept after boot if any in firmware or config of the driver or module
> parameters ? Indeed that would be great to have TWT activated for
> phone and tablet battery saving but ath12k on desktop to ignore it.

Do you use Network Manager? I don't use it but there seems to be a
wifi.powersave setting:

https://askubuntu.com/questions/1386217/wifi-power-management-keeps-turning=
-on

>> > 2. MLO support:
>> > - When connected via MLO, performance mirrors 6GHz-only connection
>> > - Doesn't appear to utilize all three bands
>> >
>> > Questions:
>> > 1. Are there any recent patches addressing the latency issue for
>> > kernel 6.11rc7?
>>
>> At least I can't think of any fix right now.
>
> Thanks for lettings me know, any though about the firmware binary are
> there beta firmware somewhere that would make sense to test or is the
> linux-firmware git main branch the more recent one ?

If you are feeling brave, the latest firmware images are here:

https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware

And the latest driver is here:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/

You can update the firmware and driver independently, there should not
be any dependencies.

>> > 2. Is MLO fully supported by Linux/Qualcomm for this hardware? I'm
>> > willing to test any proposed solutions or gather additional data if
>> > needed.
>>
>> MLO is not yet supported. Once there is something to test we will
>> announce it in this ath12k list.
>
> Perfect I'll be reading the mailing list, if you need tester able to
> compile a kernel and module don't hesitate. or need tester with wifi7
> access point (I only own TP-Link BE800 but is it in beta firmware mode
> with terminal access so I can also do some test the device)

Great, thanks. We will be sending an announcement once there's something
to test, but we are not there yet (even though we just created
ath12k-mlo branch).

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

