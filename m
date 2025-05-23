Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE6C54F30
	for <ath12k@archiver.kernel.org>; Fri, 23 May 2025 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WZKHVX1SoX76iCdr9eUwSznmo4DZk0Nvw57g9VWXTs=; b=FYNbxjrPhPr7Frbd7bTx43/sx4
	cusvg9vNdlTbDlZc5K7sar9dYZI35tkpxMFVxqxfvTnwfLFVgf8pyybdSLNfBu3HnZGOzEfMjh8ex
	uwi8z+zPsWDO39S1Ovpn+6exP0LJQsJIQd+S/S+rdt/EiLj1fcfXnC0mjFxI4dQBZxB+Cp/GkmsRu
	1CEB0k3Vq3cdbWYwvbCBGCSAfHGqgwvoMcV2ECkzbnBXHJtfAeC1NQvuj4E/NWoKm6PfXa0iQm+Uv
	WvWrXNe1PEan3lRUM5Uye8yrpF3eV4F30B+mZ2hW7shxOOxjdf3bkPxZyVOT5IRS/5u06h1k2Bm+n
	GGTYGrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbn-000000046e0-3Jhu;
	Fri, 23 May 2025 14:42:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISlC-00000004134-09mX
	for ath12k@lists.infradead.org;
	Fri, 23 May 2025 13:48:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so76201245e9.0
        for <ath12k@lists.infradead.org>; Fri, 23 May 2025 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748008108; x=1748612908; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WZKHVX1SoX76iCdr9eUwSznmo4DZk0Nvw57g9VWXTs=;
        b=LnFm7Q6hcU2Dwcn0E/0NMUo+9aS0iMgdLzzQK7mGvlbGPaUV6PO6GkmD5iSIdrhJDF
         62rx0xbXefU4YETTaILYXNfQyobqU3ZbiVuVzbXDMM0/FBOvN/hkvNDUIGTRSxCM2bPl
         uRKYgblUqJg5n+lWP70OaESDc4toC9x6jXcdCuctIJAPd0Ig1vNDoxGuYUb6xuy06Vrf
         MZWoXlY5bF9iu3rj7VjHHJ6r1Bm23NR07mUf0hZQfYPW8yVW/3uLsFyAurlttcN3jjdz
         h4dWvp5oDAn7GBrfDGA7WLZoghd8K1uWD9MzW3EoKgjKG36c/LslIRfEnGgDLa2QPPH7
         sX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748008108; x=1748612908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WZKHVX1SoX76iCdr9eUwSznmo4DZk0Nvw57g9VWXTs=;
        b=dw+Kj7bTVU/c0415mzpEY2gQho3mIe06ssKYqEXot1gAcwOwx9bIuckS6gLOLCkf18
         XbqUTeRYvs0KNXvULFtfwrLo0hk0ZG3avMzcpPxijBbbMXpvvyCPvr3vKHvkxmZxASqN
         EbHxkZTaSZs1D96DA9/cZX/QDhTWIFe1zdmDWI8cGda28Hq3Km0dc2vLX7PS8lFb/Xmw
         S0hki6mo6+3gkO4ujcA2G/zCFdCx1Sf6talOpITzytsjkol7J+K0Yz8mQDSVyGG74Vs2
         gqHd1M372yf2Xxds9uIoOjjl3JGgw8ytOxCzVqhRZF55AmonI5a1A0gbvInxZTpJ2bv1
         Us0A==
X-Forwarded-Encrypted: i=1; AJvYcCWQYr+2BFuZw8B3ShoDndIrFKqpBbJ8Iy3fo3lGRbcy7g0OFKL0YS+jlTXiGP/akYjhxSe49vU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyymqZbwU/5uuteGv1g9WIz91DYkIUbai8Te+b+eV+zrVQtA6ak
	TnRysZLPHzErskjmcMBV4rrUI03obyloSZuGLc+FupJGZKvsZwipx3HS
X-Gm-Gg: ASbGncugtEY/GiNCF2Wn/GvEfnIQOMH7B/BIeDy+0v2hEmX1Hz+abAQbGqw9rxJ8heJ
	c2u89mLzrZAyZ71XgZtlevIuS9IAwrl2lzVV41Y1/jgp9WFIerpxigB7GaKOKRVgrcTGw7LXxyH
	fkLPBa3VuzeSum+d7O4AOv0Jn5SaX+/OEVp9l05tcFokzmPZxJ5MfdgkIMt5AU82irEm3JSpU1o
	tMDb7SZtHsG0NOLTEra8YsYqifCyHhY9hqAbW96A1yIRzA+m6JsYBkEnom4rHI5SAu2+NDyoDCj
	cHQoUh2WY7rNwLO7WtzeVIWpRi3IR7wGIgfihcFNaOqZAMVuyG75hjZVcBakcJOQC5O3FxrNVPJ
	EOi5XGgH9NEcRqtP+uh57qS8nMVxALfdHZmPWr/ACbu0/qK0vIY6ooQ2Ap+DSwig=
X-Google-Smtp-Source: AGHT+IHCHWgzs6ok+9oUDkNDixpXJM3owBcKd/3Mx5okhrSd+/1j2ORV0V99xgFBPmR9KO9HsFGkBA==
X-Received: by 2002:a05:6000:188c:b0:3a3:79cb:8b14 with SMTP id ffacd0b85a97d-3a379cb8e37mr14344708f8f.33.1748008107615;
        Fri, 23 May 2025 06:48:27 -0700 (PDT)
Received: from dominikat-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3648baa6asm24418561f8f.91.2025.05.23.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:48:27 -0700 (PDT)
Message-ID: <91bc6f30004f80feb193a24292f841ee88d48504.camel@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST
 definition for WCN7850
From: Parth Panchoil <parth105105@gmail.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>, Jeff Johnson
 <jjohnson@kernel.org>,  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
 Wen Gong <quic_wgong@quicinc.com>, Vasanthakumar Thiagarajan
 <quic_vthiagar@quicinc.com>, Bhagavathi Perumal S
 <quic_bperumal@quicinc.com>,  P Praneesh <quic_ppranees@quicinc.com>
Cc: Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, Francesco Dolcini
	 <francesco@dolcini.it>
Date: Fri, 23 May 2025 15:48:26 +0200
In-Reply-To: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
References: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064830_078873_FDA14246 
X-CRM114-Status: GOOD (  19.40  )
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

Thanks Baochen for the patch.=20

This patch fixes a bug in older kernels, so it should be backported.
Minor correction needed on the reported tag.
Tested on TI AM69 SK board with SX-PCEBE (WCN7850) Wi-Fi module and did
not observe the reported crash anymore.

Cc: stable@vger.kernel.org
Reported-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>

Regards,
Parth P

> GCC_GCC_PCIE_HOT_RST is wrongly defined for WCN7850, causing kernel
> crash
> on some specific platforms.
>=20
> Since this register is divergent for WCN7850 and QCN9274, move it to
> register table to allow different definitions. Then correct the
> register
> address for WCN7850 to fix this issue.
>=20
> Note IPQ5332 is not affected as it is not PCIe based device.
>=20
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-
> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>=20
> Reported-by: Parth Panchoil <parth105105@gmail.com>
> Closes:
> https://lore.kernel.org/all/86899b2235a59c9134603beebe08f2bb0b244ea0.came=
l@gmail.com
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7
> devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> ---
> =C2=A0drivers/net/wireless/ath/ath12k/hw.c=C2=A0 | 6 ++++++
> =C2=A0drivers/net/wireless/ath/ath12k/hw.h=C2=A0 | 2 ++
> =C2=A0drivers/net/wireless/ath/ath12k/pci.c | 6 +++---
> =C2=A0drivers/net/wireless/ath/ath12k/pci.h | 4 +++-
> =C2=A04 files changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c
> b/drivers/net/wireless/ath/ath12k/hw.c
> index
> 7e2cf0fb2085ab014fc14a5c81074802674b154e..8254dc10b53bbfb54a44c7ff2f7
> 05c72461d1031 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -951,6 +951,8 @@ static const struct ath12k_hw_regs
> qcn9274_v1_regs =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce0_dest_reg_ba=
se =3D 0x01b81000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce1_src_reg_bas=
e =3D 0x01b82000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce1_dest_reg_ba=
se =3D 0x01b83000,
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.gcc_gcc_pcie_hot_rst =3D 0x1e=
38338,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ath12k_hw_regs qcn9274_v2_regs =3D {
> @@ -1042,6 +1044,8 @@ static const struct ath12k_hw_regs
> qcn9274_v2_regs =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce0_dest_reg_ba=
se =3D 0x01b81000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce1_src_reg_bas=
e =3D 0x01b82000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce1_dest_reg_ba=
se =3D 0x01b83000,
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.gcc_gcc_pcie_hot_rst =3D 0x1e=
38338,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ath12k_hw_regs ipq5332_regs =3D {
> @@ -1215,6 +1219,8 @@ static const struct ath12k_hw_regs wcn7850_regs
> =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce0_dest_reg_ba=
se =3D 0x01b81000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce1_src_reg_bas=
e =3D 0x01b82000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hal_umac_ce1_dest_reg_ba=
se =3D 0x01b83000,
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.gcc_gcc_pcie_hot_rst =3D 0x1e=
40304,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ath12k_hw_hal_params
> ath12k_hw_hal_params_qcn9274 =3D {
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h
> b/drivers/net/wireless/ath/ath12k/hw.h
> index
> 0fbc17649df463334aa0ebb3da407115985335ca..0a75bc5abfa2410ab3c7b6ce038
> f4d5f6445ecf9 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -375,6 +375,8 @@ struct ath12k_hw_regs {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 hal_reo_cmd_ring_base=
;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 hal_reo_status_ring_b=
ase;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 gcc_gcc_pcie_hot_rst;
> =C2=A0};
> =C2=A0
> =C2=A0static inline const char *ath12k_bd_ie_type_str(enum
> ath12k_bd_ie_type type)
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c
> b/drivers/net/wireless/ath/ath12k/pci.c
> index
> 489d546390fcdab8f615cc9184006a958d9f140a..1f3cfd9b89fdcfd84731ec90c9c
> 678b0c477a2af 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -292,10 +292,10 @@ static void ath12k_pci_enable_ltssm(struct
> ath12k_base *ab)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ath12k_dbg(ab, ATH12K_DBG=
_PCI, "pci ltssm 0x%x\n", val);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D ath12k_pci_read32(ab, =
GCC_GCC_PCIE_HOT_RST);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D ath12k_pci_read32(ab, =
GCC_GCC_PCIE_HOT_RST(ab));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val |=3D GCC_GCC_PCIE_HOT=
_RST_VAL;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ath12k_pci_write32(ab, GCC_GCC=
_PCIE_HOT_RST, val);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D ath12k_pci_read32(ab, =
GCC_GCC_PCIE_HOT_RST);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ath12k_pci_write32(ab, GCC_GCC=
_PCIE_HOT_RST(ab), val);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D ath12k_pci_read32(ab, =
GCC_GCC_PCIE_HOT_RST(ab));
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ath12k_dbg(ab, ATH12K_DBG=
_PCI, "pci pcie_hot_rst 0x%x\n",
> val);
> =C2=A0
> diff --git a/drivers/net/wireless/ath/ath12k/pci.h
> b/drivers/net/wireless/ath/ath12k/pci.h
> index
> 0b4c459d6d8eabb0773162e6bb3ca666c0a8f15a..d1ec8aad7f6c3b6f5cbdf8ce57a
> 4106733686521 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.h
> +++ b/drivers/net/wireless/ath/ath12k/pci.h
> @@ -28,7 +28,9 @@
> =C2=A0#define PCIE_PCIE_PARF_LTSSM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
0x1e081b0
> =C2=A0#define PARM_LTSSM_VALUE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A00x111
> =C2=A0
> -#define GCC_GCC_PCIE_HOT_RST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1=
e38338
> +#define GCC_GCC_PCIE_HOT_RST(ab) \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0((ab)->hw_params->regs->gcc_gc=
c_pcie_hot_rst)
> +
> =C2=A0#define GCC_GCC_PCIE_HOT_RST_VAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x10
> =C2=A0
> =C2=A0#define PCIE_PCIE_INT_ALL_CLEAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1e08228
>=20
> ---
> base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
> change-id: 20250506-ath12k-wrong-global-reset-addr-b75ddc6e7850
>=20
> Best regards,


