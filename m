Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0284ECF9C5B
	for <ath12k@archiver.kernel.org>; Sat, 21 Sep 2024 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nroEnhjnvQNnCk8gNeOcxvGvp7KFXgRaHzfE/4hXkC0=; b=Z4uwm4jYiRlGPzoEXtTqIongGX
	PvkO6yGGF94rejFVBovNYb3pn0McfOMCtQaiI8uZrxR3wn7zuD7oTEIX/haziL8ptbokfMtDWAVup
	f9CoIcRle7pJeEb1nN2mdwCVtoKwPHIe7SpdUMonfyIBxpWU89gPEGDdxCujUa3dnrB4EiRaof/nV
	FwYQGGP/9IFZeKLjYFMjHXH57azmGJcPbMDzY6Bg8xPNJLEXd0brAspAwxjt8HKUWVd9DAifrTIL4
	Om9DF/CkSK3M2m8dBHmTXO7MYeH2wFDQ5FO1bIHTjaxpn+jTO1rrq/4BerSeyOqwr9dhV5uyndDsY
	RtKs1ZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srxMK-0000000DcML-2RUk
	for ath12k@archiver.kernel.org;
	Sat, 21 Sep 2024 10:29:00 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srxMG-0000000DcLy-2vPL
	for ath12k@lists.infradead.org;
	Sat, 21 Sep 2024 10:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1726914519; x=1727519319; i=dknueppel@online.de;
	bh=nroEnhjnvQNnCk8gNeOcxvGvp7KFXgRaHzfE/4hXkC0=;
	h=X-UI-Sender-Class:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-ID:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eeC0Zbu2F+dbW5B2TqhrMn05xw61Z6kUacoMtFE/g0MUMjs/wnt02ez94Y2wexQT
	 AEoZysAgh7MGZsWPnrFMyabVMrST2TK4I2syW/JqkZFO0lUXZIv2UE0Q3pAYNZpDJ
	 YFKXC+aGu7nQx6nx1tfeihPyZGxN3Ad+lTMSdDzKJeGSWXRS5TQ4IPBDlm6HqdJAW
	 sbK3/wgI4g1gKOqaR5bFBdNuBtymzDWdTS4Nlql+ihWJ+ctArNXs2H6bBqfITNW2Y
	 c240/CbxXRkrI20E3v8mlj3NuqIgEo990GSpMmFXB2WhzAlxRwq9NKOCQuyl+Ym//
	 85sSdrzPrn6I0aRlDg==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from xXx ([87.122.97.75]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MeC5x-1sHEp73uul-00fUEe; Sat, 21
 Sep 2024 12:28:38 +0200
Authentication-Results: kalliope-7.home.xx;
	auth=pass smtp.auth=dknueppel@home.xx smtp.mailfrom=dknueppel@home.xx
Date: Sat, 21 Sep 2024 12:28:37 +0200
MIME-Version: 1.0
Subject: Re: ath12k - HTT timeout error with NCM86
To: pgupta@hindutool.com, dknueppel@online.de, quic_jjohnson@quicinc.com,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <14e17e9a-638b-4bfe-8a2a-99b524a20acf@home.xx>
 <1MvJjz-1s0CoP3EEz-00rhmL@mrelayeu.kundenserver.de>
 <7488ed13-82dd-4b41-97c7-5692cacfa631@quicinc.com>
 <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
 <eb1c8576-bf2f-4ec0-8651-62e97446e940@home.xx>
 <2271e7e8-2e25-42e5-a162-e79f65ee8798@home.xx>
 <1N4h7p-1rrEib2AJr-01163u@mrelayeu.kundenserver.de>
 <1920f9bd1b8.285f.40f506ff0c43803c7e4cd5785e25da93@hindutool.com>
 <1726839690.xnskyi9sg84wgsw4@mailapp03.register.com>
Content-Language: en-US
From: Dieter Knueppel <dknueppel@online.de>
In-Reply-To: <1726839690.xnskyi9sg84wgsw4@mailapp03.register.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.10 / 6.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: kalliope-7
X-Rspamd-Queue-Id: 43D69418CC
Message-ID: <1MGyl3-1snIOL45Y3-009Sn2@mrelayeu.kundenserver.de>
X-Provags-ID: V03:K1:oRg55dOJqyl6Fa0363AqC9gHxikTKCeKcnyArx0AS3potAElr5T
 zFKiH5i7fkyJVPHB1mxohIThD90KfvELq47lLIwPYTmB986I2mOegrrFBPV2wRIOyLoOp7i
 S9BTdeCcKY1IYA+Qv4jVixmJGyUrb2FoB55MMywXBkasOScfCiEimuUMaevPaqAL3Aqt19/
 IPB59iclcMjr95tqtHKoA==
UI-OutboundReport: notjunk:1;M01:P0:OQVGFM2BloI=;LgdXCpo6DuZKUJnhRhw6VQgSBhI
 gdx/BtYRmQtpwiONclTSuQebVXjnN74tsJpssyHXLI2WS7hnT1AdQJ13SAkcgPoi9+JWXw/HY
 uLr0bcH8vmxrNVdcQD45nCx9/WTJzpmIVzTWGkBIMjwmt2fK4v4BiHJ/mqRuJd0XEtAPFMD8E
 6UPKP7mS11WoSsaBQCoE0gVdMUSfU60dHCIBTA5jSMwuzZu2uojT38Jk+fk6G2DlZP4CYa3Xv
 /8M4djJfsILyxjWhm2SCaYI0tuuU9ZE0rY2gOdMOmzgJjPn+7A/9vLeM3wtqGy6fMcPza7EqP
 yb03fKYk5cWDKQdHau9g0tyw2gMXJfbIHGzXrc6ck/A5jUasjjptWBgFOk4NCzwzTUEtET3QK
 C+FYrund+4b0y2OoTfC1t598/X7SqtHDlN1dDlggUbid8d84dnJzYBRVxx+rTEJldUh7/uaT6
 +i5Ke8CzHH8YsoHg2LpD1n/iy6dxgSU1bONPIQoy3zKx4NysClGjaGMOCB9+rY+qKqmnuPP1U
 csbjYpZ8OZM8PVM+g0TQPQlUCOZ5/vdMhmNLOOOOAzrmICNicdekRSZgN0AWFDepMEVigEgFc
 DPpkzUOosE/GCfNU9Tlpj3nhlTxiGQbkP5fDHzZ1SW6Ybv4bU0WMrYXzzv9Yn9hF7xOZWAU98
 eCTS8Df0S0+T8jr02RAMqRstA1XAPHBdzuYOVobawu6nctIifxe3RgUEUrsFIde009Ksmi83+
 iNToD9Y8mey2KEPtqrM6uZS7xzAHz7rEQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_032857_138811_7D90DBA7 
X-CRM114-Status: GOOD (  39.61  )
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

Hi Prashant,

thanks for confirmation and sharing my pain ;-)

Earlier i patched the ath12k driver in HW detection, i.e. to not
complain about version 0xf, but continue as if it would be version 2.

Driver then crashed more deeper in the code. That might have been the
case, due to missing ath12k vfio support.

As my physical machine hosts a bunch of VMs, per design I keep this
machine as slim as possible.

Custom kernel or driver would break this design, hence i have to keep
the adapter hosted within a VM.

Up to now i had a QWA-AC2600 (with two QCA9984 onboard), perfect for
dual band concurrent AP.

Unfortunately newer kernel prevent pass through for this card, probably
due to onboard PCI switch limitation (investigation ongoing as well).

Now I'm looking in parallel for legacy PCE AC-88 adapter .. to be
continued :-(

Kind regards,

Dieter





Am 20.09.2024 um 15:41 schrieb pgupta@hindutool.com:
> I purchased my hw modules (2.4, 5, 6 GHz) from compex. They were not rec=
ognized on my std Ubuntu 24.04 installation. According to compex the hw bi=
t needs to either be hard coded into the module or a software patch applie=
d. Because I am using all three modules in one machine (Dell R730xd) and u=
sing PCIE to M.2 riser cables they had to hardcode the identification bit =
and I had to send the modules back. I would ask your hardware manufacturer=
. I was told that the encoding will vary depending on the use of the modul=
e.  You are right in that Wifi 7 has proved to be exceedingly difficult co=
mpared to the wifi 5 router I built. I have almost given up myself but con=
tinue to fight the good fight.
>
> Cheers
>
> Prashant gupta
>
>
>
> On September 20, 2024 6:17:01 PM Dieter Knueppel <dknueppel@online.de> w=
rote:
>
> I'm wondering, is this the correct mailing list for my questions?
>
> I know you are all working on best effort basis, but at least my
> questions related to supported HW shouldn't be too complicated to answer=
.
>
> The information I found so far are almost not existent, stone old,
> misleading or even proofed to be wrong (e.g.
> https://wikidevi.wi-cat.ru/Ath12k, 17cb:1107 equals HERALD-BE as well,
> not sure who maintains this page).
>
> I'm almost at the point moving back to my legacy HW.
>
> Anyway, I would still be very happy to receive any feedback :-)
>
> Thanks a lot,
>
> Dieter
>
>
> P.S.: Due to my background in mobile networks radio interface, i would
> have a good starting point to contribute myself. Unfortunately I'm
> involved in plenty of other things and don't have the time for another
> job :-(.
>
>
>
>
>
> Am 19.09.2024 um 11:41 schrieb Dieter Knueppel:
> Minor update:
>
> I just figured out, that even the physical machine with std. Ubuntu
> 24.04 server (before the VM gets started and PCI device vanishes on
> PM) reports: "Unknown hardware version found for WCN7850: 0xf"
>
> Hence the earlier question, whether "MSI HERALD-BE" or "Gigabyte
> GC-WIFI7" is supported, seems still to be valid.
>
>
> Am 18.09.2024 um 19:54 schrieb Dieter Knueppel:
> Hi Jeff,
>
> thanks a lot for your update on ath11/ath12 related vfio support.
>
> That's actually bad news!
>
> Do you know whether vfio support vanished per accident or intention?
>
> I.e. I'm wondering on why the ath11 patch haven't made it into mainline?
>
> Assume there are no other 802.11be Chipsets supported by Linux, which
> can be used as AP within a VM?
>
> Kind regards,
>
> Dieter
>
>
> Am 18.09.2024 um 18:13 schrieb Jeff Johnson:
> Resend since I had a typo in the ath12k e-mail list
>
> On 9/18/2024 9:05 AM, Jeff Johnson wrote:
> On 9/18/2024 7:40 AM, Dieter Knueppel wrote:
> Dear developer team,
>
> I have to admit, the earlier post "HTT timeout error with NCM86"
> is my
> fault, sorry for causing confusion.
>
> Due to earlier tests with legacy cards, the PCIe slot was still
> forced
> to Gen2 :-(
>
> Putting it back to <auto>, with "MSI HERALD-BE", similar to "Gigabyte
> WC-WIFI7" i
>
> consistently get: "Unknown hardware version found for WCN7850: 0xf"
>
> Which nails down to the question whether any of these adapter is
> already
> supported?
>
> The M.2 NCM865 card as such seems to be supported.
>
> I'm wondering about the difference, as there seems to be no
> additional
> logic compiled
>
> on one of the two PCIe boards, just bit of glue logic.
> For better support on ath12k driver issues please include the
> ath12k driver
> list (I've added it to this reply).
>
> In your original e-mail you said:
> I'm trying to get "MSI HERALD-BE NCM865" up and running within a kvm
> The ath12k driver does not support running in a VM. Even prior
> ath11k-based
> hardware doesn't support it.
>
> For ath11k there are some manual steps that have made it work, so
> if you are
> adventurous you can try doing something similar with ath12k. Refer to:
> https://lore.kernel.org/all/adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.c=
om/
>
>
> /jeff
>
>

