Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EE7C8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zIz6r0gkXpoyWiHLW8SVM9dnNFe34WoYcz0SXbP6s0=; b=z4XGvOrB/nGfQoM2ommMXWe2zo
	RJ9zesfU6pgjGPZL/nJLFdQaRP2x3FslL6CSDJOTYDMdG/nukOwyM3xPZftQVLH8SclcHT9kbE7/8
	EM6hS2V2V7nhtpNG2X1p2UJuFLWQeJKw1wZ2NtyV0ofEsjB5dnccyW2iJjLLNhSt0X6zC3V4GjyK9
	TwvtEWrkuikZuLucvNZUBpgReWw2XE44p/VKjY75BZGAEMqs2uMKsw8uYRqFIswAr6gOEQF0DpZL9
	QZowuiBCaG/WI3F46YRTQZo86GY8t7P55sNvhKd++thaFQyVs5ms6bX9R/HIYSMLpE1aEFpaVpF6j
	shwrCeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjP-00000004U8O-3AOv;
	Tue, 01 Jul 2025 08:52:47 +0000
Received: from mail-10630.protonmail.ch ([79.135.106.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWQ0-00000004QGW-0soM
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 08:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1751358756; x=1751617956;
	bh=5zIz6r0gkXpoyWiHLW8SVM9dnNFe34WoYcz0SXbP6s0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FBIJKRCWh4EK6Rmxfd5Tp5i+ImL03y3f/+bkNZk4vpN7dlTk1+InwP1spyJDnOCe4
	 eGD7cGtLBvG5TdrXOApmKiD2+zZzV7fCMFoszayqqCfTid0P0Gu782T01TYSSEkg+w
	 1OIKcNBqThNNxtfAvFSd7OzyhcnlyF5z0H1R592M7H1oHnd25uEg94FtGoeLac+Ka5
	 6SNNTxBCBUE6WmH7QkeZwv19UtpXFNr27lvsBg14FoYlM8qYH6cXfhrRBs9Y0YuiKw
	 TDF0rx1iadhjv4uz7vCfuDN0RYvVNDEmy35fcJDxCNZnNww31wTgXHRUd5UWN0LaHS
	 RqLfH+YTRdKfw==
Date: Tue, 01 Jul 2025 08:32:29 +0000
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
From: Janek K <janekkw@proton.me>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: 6GHz issue QCNCM865 (WCN7850) firmware
Message-ID: <RTHZInEjrzmjGT00LL9zKu9HbpzLQbkWs2eVlKPySP72iZuhhLsMumRn4oWqVj7BFrguFVTVPL4S5r1bo_UaI1t8RQ5OYJxYliPCAu8ZmaY=@proton.me>
In-Reply-To: <3bd353e1-56a7-4d91-9192-593b3f886eb5@oss.qualcomm.com>
References: <l262t2ImXM_3Szbm3CnRu6PnXIAgw32DZBoz-Oai5GGVy-GbMqeAQLGO8Uu1PU4do9tMF0kpAZ3GFk40Nnq2fPjj2hVwCDmEuao3Xfqq6nQ=@proton.me> <3bd353e1-56a7-4d91-9192-593b3f886eb5@oss.qualcomm.com>
Feedback-ID: 113248985:user:proton
X-Pm-Message-ID: 9eccbbdacbdf95bb6efeec200d540427cf37dae0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_013244_851848_F6300C74 
X-CRM114-Status: GOOD (  19.20  )
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

I've opted to install the current mainline (6.16rc4) from Fedora-Vanilla re=
po.=20
Using the new firmware and the mainline kernel did solved the 6GHz issue, b=
ut now it removed the 5GHz 160MHz option, that is not a deal breaker, but i=
s nice to have.

now I get the correct country in iw reg get:

~$ iw reg get
global
country PL: DFS-ETSI
=09(2400 - 2483 @ 40), (N/A, 20), (N/A)
=09(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
=09(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
=09(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
=09(5725 - 5875 @ 80), (N/A, 13), (N/A)
=09(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
=09(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country PL: DFS-ETSI
=09(2402 - 2482 @ 40), (N/A, 20), (N/A)
=09(5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
=09(5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
=09(5490 - 5590 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
=09(5590 - 5650 @ 40), (N/A, 30), (600000 ms), DFS, AUTO-BW
=09(5650 - 5710 @ 40), (N/A, 30), (0 ms), DFS, AUTO-BW
=09(5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW
=09(5855 - 5875 @ 20), (N/A, 14), (N/A), AUTO-BW
=09(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW

Thanks for the help


On Monday, 30 June 2025 at 03:48, Baochen Qiang <baochen.qiang@oss.qualcomm=
.com> wrote:

>=20
>=20
>=20
>=20
> On 6/28/2025 3:19 AM, Janek wrote:
>=20
> > Hi,
> >=20
> > Yesterday, I noticed that I could not "see" or connect to any 6GHz SSID=
/AP. After some checking, I noticed that my WiFi card was stuck with the re=
g country 00, as below:
> >=20
> > $ iw reg get
> > global
> > country PL: DFS-ETSI
> > (2400 - 2483 @ 40), (N/A, 20), (N/A)
> > (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> > (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> > (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> > (5725 - 5875 @ 80), (N/A, 13), (N/A)
> > (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
> > (57000 - 66000 @ 2160), (N/A, 40), (N/A)
> >=20
> > phy#0 (self-managed)
> > country 00: DFS-UNSET
> > (2402 - 2472 @ 40), (N/A, 20), (N/A)
> > (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> > (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> > (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> > (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >=20
> > I'm not sure what caused this, but I suspect that is the firmware that =
was updated on last Sunday, as part of the Fedora 42 package named atheros-=
firmware-20250613-1.fc42 (WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILI=
CONZ-3).
> >=20
> > I've tried reverting the kernel to 6.14.9 (that I was running before th=
e 6.15.3), it did not help, after manually downloading and installing the p=
revious known good firmware, I got it to connect to 6GHz networks (both ax =
and be).
> >=20
> > Currently installed firmware: atheros-firmware-20250410-1.fc42 (WLAN.HM=
T.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3) 6GHz working.
> >=20
> > My system details
> > WiFi card: QCNCM865 (WCN7850)
> > Distro: Fedora 42
> > Kernel: 6.15.3 from Fedora
>=20
>=20
> Recently a series fixing 6 GHz issue has been merged upstream
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/net/wireless/ath/ath12k?id=3Dd662c14a51910ba0ad66afd248b601ba30b9f=
7f1
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/net/wireless/ath/ath12k?id=3D37e775a0a9d79a031d28d9e21480f99f448e9=
215
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/net/wireless/ath/ath12k?id=3D886bb3624e4c9914a943b63fcfdf30b8d2f2b=
66e
>=20
> Can you pick them and try again? Or even better to try the latest mainlin=
e kernel?
>=20
> > Affected firmware: WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICON=
Z-3 (from Fedora package atheros-firmware-20250613-1.fc42)
> >=20
> > related dmesg output:
> > [ 5.082826] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x90600000-0x907fffff 6=
4bit]: assigned
> > [ 5.082844] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> > [ 5.083105] ath12k_pci 0000:01:00.0: MSI vectors: 16
> > [ 5.083110] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
> > [ 5.733493] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_=
id 0xff soc_id 0x40170200
> > [ 5.733499] ath12k_pci 0000:01:00.0: fw_version 0x1108811c fw_build_tim=
estamp 2025-05-17 00:21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.=
c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > [ 5.733744] ath12k_pci 0000:01:00.0: failed to get ACPI BDF EXT: 0
> > [ 5.958726] ath12k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> >=20
> > Let me know if there is any other info that I could get from my machine=
.
> >=20
> > Thanks in advance,
> > Janek
>=20
> 

