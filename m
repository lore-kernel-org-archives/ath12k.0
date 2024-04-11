Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F631CD1284
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6IT8ciYCoJC7997daumFC3Mui7/vKTd0mIgDY/1i2Y=; b=1lDdl/B5VwOyegfe0PcMQLdZ99
	tOtmqY+WJVG6RjjQr78IfNljafqpAav6BIirokIfU2lXi9chxJADZFWIThlOKRzMwYMtR2nBzZdLK
	qtOj1GRaT6KEnZnVxtMWUa9Z51azxxde95KzDGOA+hnVVU+wFkcF3jzmuzUCS4+9YOYLCTUX84RK0
	alZpKdi+DPUDEHOwn64T5tj3/TCsFK1vdKNDzCjGD9iv01dcYIf2e8U7BeRmPm1V+5KkfnurMzwdi
	DrpAKy31xsF0W1Q8/WaOgCrt6cER5HkVP4+D+hacGnDHIubG2jcTYKYdZ9uDW8EIWFd2nxWng3QOh
	UmVsqCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupu5-0000000B7KY-3o2z
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 08:35:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupu3-0000000B7Ii-1GGU
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 08:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 954C761FD6;
	Thu, 11 Apr 2024 08:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75496C433F1;
	Thu, 11 Apr 2024 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712824526;
	bh=N6IT8ciYCoJC7997daumFC3Mui7/vKTd0mIgDY/1i2Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BdOFgHf1/9ot+TvmMZzsXfbiziYh40gHCOFpdfg6ClHUTGXELhPeeIDexGN91arcm
	 ri9boDtD+hAnzGcKttc5AjmUIih9ouyF/FRPd78FzSZ6UQLwWUmsTGs/wmLu4UG7pM
	 2nqcUO8Zoft375hJO+f1+UyiTeZ3D2iTrOGZ9CwpifzANnn7e2fOcXhV5/voyRE9rh
	 Zrr3dYMUOPqZXY4oyxC13qmHk14qX70TxHPMnHdIibd+8QK0ADsyUl2vxoiAymnZFr
	 1mItVq5/G9Bx+/zwTU38DRs4uShv07E6mQygHEXG7athJy/mAvxg9xO6N6WaIHfE5f
	 bHWs3YFixwbAQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: david Atkins <david@3adesign.co.uk>,  "ath12k@lists.infradead.org"
 <ath12k@lists.infradead.org>
Subject: Re: QCN9274 - x64 - AMD or Intel
References: <LO0P123MB4057B28CB310E5A1CEEF92F0D6002@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	<LO0P123MB40575CCD8D6A3AB863596DE2D6062@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	<3ff953f9-d6ce-4e96-9d16-401ddb9ad1d6@quicinc.com>
Date: Thu, 11 Apr 2024 11:35:23 +0300
In-Reply-To: <3ff953f9-d6ce-4e96-9d16-401ddb9ad1d6@quicinc.com> (Jeff
	Johnson's message of "Wed, 10 Apr 2024 09:57:44 -0700")
Message-ID: <87jzl4z48k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_013527_408925_FD75F4D7 
X-CRM114-Status: GOOD (  11.26  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/10/2024 7:52 AM, david Atkins wrote:
>
>>=20
>> I just built the ath-next branch for my AMD Ryzen 3 4300U system
>> with an 8devices QCN9274 module, it appears to have a new message
>>=20
>> memory type 10 not supported
>>=20
>> in the dmesg logs
>>=20
>> [=C2=A0=C2=A0=C2=A0 2.705656] ath12k_pci 0000:03:00.0: BAR 0 [mem
>> 0xfe200000-0xfe3fffff 64bit]: assigned
>> [=C2=A0=C2=A0=C2=A0 2.705672] ath12k_pci 0000:03:00.0: enabling device (=
0000 -> 0002)
>> [=C2=A0=C2=A0=C2=A0 2.705885] ath12k_pci 0000:03:00.0: MSI vectors: 16
>> [=C2=A0=C2=A0=C2=A0 2.705889] ath12k_pci 0000:03:00.0: Hardware name: qc=
n9274 hw2.0
>> [=C2=A0=C2=A0=C2=A0 3.405328] ath12k_pci 0000:03:00.0: memory type 10 no=
t supported
>> [=C2=A0=C2=A0=C2=A0 3.410796] ath12k_pci 0000:03:00.0: chip_id 0x0 chip_=
family 0xb
>> board_id 0xc soc_id 0x401a2200
>> [=C2=A0=C2=A0=C2=A0 3.410804] ath12k_pci 0000:03:00.0: fw_version 0x1011=
001d
>> fw_build_timestamp 2022-12-02 01:16 fw_build_id
>> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> [=C2=A0=C2=A0=C2=A0 3.431347] ath12k_pci 0000:03:00.0: failed to fetch b=
oard data
>> for bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D12 from
>> ath12k/QCN9274/hw2.0/board-2.bin
>> [=C2=A0=C2=A0=C2=A0 3.431375] ath12k_pci 0000:03:00.0: failed to fetch b=
oard.bin from QCN9274/hw2.0
>> [=C2=A0=C2=A0=C2=A0 3.431386] ath12k_pci 0000:03:00.0: qmi failed to loa=
d bdf:
>> [=C2=A0=C2=A0=C2=A0 3.431387] ath12k_pci 0000:03:00.0: qmi failed to loa=
d board data file:-2
>>=20
>> I'll try on my other test bed systems, but is it expected that this
>> will get further than this ?
>
> I believe the memory type 10 message can be ignored (I've received
> conflicting information on that)

BTW I noticed the same warning and I reported this to the QCN9274 team a
long time ago but they didn't do anything, sigh. This needs to be fixed
ASAP. A driver should not print errors.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

