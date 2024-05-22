Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20310C25B77
	for <ath12k@archiver.kernel.org>; Wed, 22 May 2024 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64AnY6F3RdWDInMyOjMvRf1vmka0/6tUbxzfZZCY5iY=; b=EgYpyDvAwqGJyvFH0nr2RvHpxg
	cHCjaflo77TIvS/V6gK/oP48nDnNScsx8tx3E+XEK+Kcu4rbclcf21pcPpSrYeURAYVUlCu9Upk3n
	RmV6bhA8FwAtVhtbwNcDuvIYnYBIoeKkerIGel+U+oOl/KWle+a16BFeG+BfoBtm4R1NFEB/eb4QI
	cYEAyq6vWfMmLicJQL+2nJxULZ1TzLLXKM3fUrc1yc/HDkfIBcq06TRM2vj6oZ1RcrtdYE+XN5GFJ
	oggNcL/kA/5Za8IE67r9YCLvNREE30cPIEL+qSBrYC/NgVpZiD83AHKjN+NRshTfcjosyEJjUMNRO
	5RKMMtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gOR-00000002E3d-3ZEG
	for ath12k@archiver.kernel.org;
	Wed, 22 May 2024 07:28:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gOP-00000002E2w-24c1
	for ath12k@lists.infradead.org;
	Wed, 22 May 2024 07:28:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-51f45104ef0so5995910e87.3
        for <ath12k@lists.infradead.org>; Wed, 22 May 2024 00:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716362887; x=1716967687; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64AnY6F3RdWDInMyOjMvRf1vmka0/6tUbxzfZZCY5iY=;
        b=K5Oz65dP0GWPyPqoqFNer6A3t8CMOq+FCRJl/A5WRtbigVFT2uj3f9awUTwmWFUGm8
         WuV3nLjXMxgoTvVYiyxOAOiYXoViZ2p3jbppoFZyaooIJLaRJ/AbQrdG5T+weFRPKXSW
         sXQcE5aW3eCyE48PhKCEoP3ODs1X6HpZbn0BM0A+gLAAoPr0NcMoepSnn2cTazd4t9L3
         IHFLL/D/w3RoHxYUS2xBIigcCPdFYAC6koAVy0F+itwFHeBCx5VT+ni3cLOmcdhRCenS
         ceFrfUfps7O+spYd7i8J/Fg7j7h447rplbeOB99Sqsxrp4lO5w/1VxzeTPtQ+O5QR1DV
         2g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716362887; x=1716967687;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64AnY6F3RdWDInMyOjMvRf1vmka0/6tUbxzfZZCY5iY=;
        b=ctv/QE4KEO2hHtO4/SpKxjSpivkuYLcRPoVhyy0SosBbdSWoQrePGUQlSEKKqj7Jpl
         IZOrTPg0IqZDNH0nKN2GY5pxcVKKzkzX0zrnosCsEX+5DIqivP0hi8gOKknjZwFQazu1
         wylcYNysleJgOP7ZVkDPIRCr9diW86lkZWxup8C51ObT9N0dxjJQV3pymSIrrxzUpyKS
         CX9+o60breBJmsZRqSN9vjHyJkdBeB5t4sU5xWfqcNH45CsOVZYrd+udpjZNd6qEU+iJ
         RfhQyxzjiEA7BJtcRIfI4D9bOlaXMowK1cn189lYHlojaQdAAw+ELpV8dEe5GvRRAAlR
         brKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI4RjRYrOJJYi61j5PsLdW7wX56ANQQLkO5ttlop4Srx33C/HHPjU2QIIbB6Gct1XMEwUSIwMaucPth6SrI9gAoGqpmSiZaswPeg==
X-Gm-Message-State: AOJu0YzGIB5a/szjqZjrj251zngU3azRyr6fV68s+a+Ztt4f2hUudoCH
	Tz6194VNq7dIhej1mPi3B2ydTJB9cKZqR9qahqhc+SqBMW18qyJn
X-Google-Smtp-Source: AGHT+IGMkE7CI24VJe+1teST6wVn87Qp5VhfR81Aytb16FIJmsIScvNTAjXSWyt0wEFhcFXjWQLs0Q==
X-Received: by 2002:ac2:59d9:0:b0:51e:41a1:4d5 with SMTP id 2adb3069b0e04-526be6ea7c3mr619614e87.9.1716362886504;
        Wed, 22 May 2024 00:28:06 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe9080sm493255405e9.5.2024.05.22.00.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:28:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 09:28:05 +0200
Message-Id: <D1FZV4IMV3FE.UZTMPWY3J3KB@gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath12k: fix firmware crash during reo
 reinject
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Praneesh P" <quic_ppranees@quicinc.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
 <20240520070045.631029-4-quic_ppranees@quicinc.com>
 <D1F6ZU89YWPF.X1SZ9JNQNPFC@gmail.com>
 <e8e4a015-3610-4f12-9ed8-e8281af8bf4f@quicinc.com>
In-Reply-To: <e8e4a015-3610-4f12-9ed8-e8281af8bf4f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_002809_557140_0A05C34F 
X-CRM114-Status: GOOD (  19.84  )
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

On Wed May 22, 2024 at 9:15 AM CEST, Praneesh P wrote:
>
>
> On 5/21/2024 2:20 PM, Nicolas Escande wrote:
> > On Mon May 20, 2024 at 9:00 AM CEST, P Praneesh wrote:
> >> When handling fragmented packets, the ath12k driver reassembles each
> >> fragment into a normal packet and then reinjects it into the HW ring.
> >> However, a firmware crash occurs during this reinjection process.
> >> The issue arises because the driver populates peer metadata in
> >> reo_ent_ring->queue_addr_lo, while the firmware expects the physical
> >> address obtained from the corresponding peer=E2=80=99s queue descripto=
r. Fix it
> >> by filling peer's queue descriptor's physical address in queue_addr_lo=
.
> >>
> >> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> >>
> >> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 device=
s")
> >> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> >> ---
> >>   drivers/net/wireless/ath/ath12k/dp_rx.c | 14 ++++++--------
> >>   1 file changed, 6 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wir=
eless/ath/ath12k/dp_rx.c
> >> index 2bfcc19d15ea..2adb6c7d4a42 100644
> >> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> >> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> >> @@ -2967,7 +2967,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(st=
ruct ath12k *ar,
> >>   	struct hal_srng *srng;
> >>   	dma_addr_t link_paddr, buf_paddr;
> >>   	u32 desc_bank, msdu_info, msdu_ext_info, mpdu_info;
> >> -	u32 cookie, hal_rx_desc_sz, dest_ring_info0;
> >> +	u32 cookie, hal_rx_desc_sz, dest_ring_info0, queue_addr_hi;
> >>   	int ret;
> >>   	struct ath12k_rx_desc_info *desc_info;
> >>   	enum hal_rx_buf_return_buf_manager idle_link_rbm =3D dp->idle_link_=
rbm;
> >> @@ -3060,13 +3060,11 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(=
struct ath12k *ar,
> >>   	reo_ent_ring->rx_mpdu_info.peer_meta_data =3D
> >>   		reo_dest_ring->rx_mpdu_info.peer_meta_data;
> >>  =20
> >> -	/* Firmware expects physical address to be filled in queue_addr_lo i=
n
> >> -	 * the MLO scenario and in case of non MLO peer meta data needs to b=
e
> >> -	 * filled.
> >> -	 * TODO: Need to handle for MLO scenario.
> >> -	 */
> >> -	reo_ent_ring->queue_addr_lo =3D reo_dest_ring->rx_mpdu_info.peer_met=
a_data;
> >> -	reo_ent_ring->info0 =3D le32_encode_bits(dst_ind,
> >> +	reo_ent_ring->queue_addr_lo =3D cpu_to_le32(lower_32_bits(rx_tid->pa=
ddr));
> >> +	queue_addr_hi =3D upper_32_bits(rx_tid->paddr);
> > Shouldn't there be a cpu_to_le32 somewhere here ? It just seems asymetr=
ical
> > between the two values extracted from rx_tid->paddr
> le32_encode_bits of queue_addr_hi does that conversion, so there is no=20
> need to explicitly convert cpu_to_le32 while fetching rx_tid->paddr's=20
> upper 32 bits.
OK, got it,
> >> +	reo_ent_ring->info0 =3D le32_encode_bits(queue_addr_hi,
> >> +					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
> >> +			      le32_encode_bits(dst_ind,
> >>   					       HAL_REO_ENTR_RING_INFO0_DEST_IND);
> >>  =20
> >>   	reo_ent_ring->info1 =3D le32_encode_bits(rx_tid->cur_sn,
> >=20
Thanks

