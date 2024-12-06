Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B528FE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 07:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfGCMWZ6xexpjcMNpgFhCbMlBLvMZEm37v71W1xQsQs=; b=tHWLY6HvksLLjFRhKaPsvDLh38
	qz0JE8DuQ2oqamZ1FSWW2GA4rRONQ+GIPwBX4mwyLPaOFDMFVWSpHPgmzFnSxa5fcxlv3XYQLjItU
	aDEOqExSjOfA7cBzUK4WwZs2gpswIEoFZ8TAAcWFE9sNSydfPHTEgrbycHP/LPNE3BFUlrmyPt96M
	vf/dbuxG0ydJDgyQNTgw5cQe1Yy3Ls3C4hYc4V4oGl3UtL/ULE5S7aQDMjGEURddQ3D8RIBU2OdyN
	cQEMHjQ7KS1D1S2bcZUT/uHy/cm3T0innOtGppHDfn4cgzld/HGiwgSULyU+qeYm1ufZCDvBHhyCc
	fILTD17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT3w-00000000pxv-1iKS
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 07:47:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT3t-00000000pwJ-1A3s
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 07:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99B76A44059;
	Fri,  6 Dec 2024 07:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770F7C4CEDD;
	Fri,  6 Dec 2024 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733471260;
	bh=wfGCMWZ6xexpjcMNpgFhCbMlBLvMZEm37v71W1xQsQs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PmyxtJ05QgQtBVF38iApkrYqWtNl1OoPlixogjNxOFhYHlPwInftDxzIL7CUbpOAK
	 62CBRhuxexSDcFlBXTruH1HQKDp6XNcfq99tNlzdUUGa5BWFlDoPqPw5gEgRvw6IBw
	 Mr5UIkh7zH85aBkJ/R10FvZubNj5g6xd1GIy3vcT0UZ9Z34UITslHUReyCwtgKIZku
	 N1OXz5pb1gg7uHeYvpyI52E4DgFvMDkAInvZ8Sr4MtVYbBmD1oMWwOfH3m01xtlWV3
	 V22fYkGvojSuoxXmc7gX46iUfqrpT9Heml6FviVUG463ZTCzSg3akX5wKTNGSuaSxe
	 2M26iyrAhT/Dw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/7] wifi: ath12k: rename mlo_capable_flags to
 single_chip_mlo_supp
References: <20241204163216.433795-1-kvalo@kernel.org>
	<20241204163216.433795-3-kvalo@kernel.org>
	<88e0116c-778f-4861-8751-b30a09d3d2b4@oss.qualcomm.com>
Date: Fri, 06 Dec 2024 09:47:37 +0200
In-Reply-To: <88e0116c-778f-4861-8751-b30a09d3d2b4@oss.qualcomm.com> (Jeff
	Johnson's message of "Thu, 5 Dec 2024 14:32:38 -0800")
Message-ID: <87zfl9jlra.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_234741_374453_7AEDB548 
X-CRM114-Status: GOOD (  11.33  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:

> On 12/4/2024 8:32 AM, Kalle Valo wrote:
>
>> From: Aditya Kumar Singh <quic_adisi@quicinc.com>
>>=20
>> At present, the mlo_capable_flags in ath12k_base is used to indicate whe=
ther
>> the chip supports inter (QCN9274) or intra (WCN7850) chip MLO. However, =
it=E2=80=99s
>> possible that the chip supports neither, especially with older firmware
>> versions. Additionally, if intra chip MLO is not supported, inter chip M=
LO will
>> also be non-functional. Therefore, having two separate flags for this is
>> unnecessary.
>>=20
>> Therefore, rename this flag to single_chip_mlo_supp. At the same time co=
nvert
>> it into a bool data type. Also, get rid of the enums defined earlier.
>>=20
>> For the QCN9274 family of chipsets, this will be set only when firmware
>> advertises the support during the QMI exchange.
>>=20
>> For the WCN7850 family of chipsets, since the event is not supported,
>> assumption is made that single chip MLO is supported.
>>=20
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_=
SILICONZ-3
>>=20
>> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>
> Kalle, this patch is missing your SOB.
> Please reply with the tag and I'll fix in 'pending'

Oh darn, sorry about that. Here it is:

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

