Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D05C25B74
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8E6p7Y+ouLSYIiXoIeFn2ZMIwfFJft8t7wvd/QdN3s=; b=4/BCCYCuQCL86dRQHJ2QOtkgdK
	KLPRSuvnSSaijJD4TXjYuVZ26gJISaaluBc3zI76tR+PwBZHr8OubLE9YNNpvg+rlGLrgnFam7E7L
	NSynnH/6a6yBaM9IhRuM2oRtIfhg/OQ+XWfu2Waxa7AKt8UMEBPypp3NFgNnqas9jt1dPopoN1YZy
	gKaw3gKeXlZWDZUfFtxjU05gK1zYTE9oqu2/GoXUPlfvtrOEnMkUpqXGC57uCrfAE5SeNGJGVD+e1
	k48gRSn2BV0htVivGLH6Hv1HIxGL8OXy8gflztqGjMXemPjr4wcTZkHS1hlNF/qwWZfdcOLZ/zEhF
	q3Ri987w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9LCs-0000000GpOE-1yJr
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 08:50:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9LCp-0000000GpNA-2Ore
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 08:50:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4202cea98daso28127465e9.0
        for <ath12k@lists.infradead.org>; Tue, 21 May 2024 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716281444; x=1716886244; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8E6p7Y+ouLSYIiXoIeFn2ZMIwfFJft8t7wvd/QdN3s=;
        b=ETaEswK3yU9cbCuccpcp9Gig89XDhPzILFSfI/giD8mHXr5GVrq1JdHXko78su++tN
         A1JPYaF0GR0rlK6g0EVHsvgGwSrKo05WZavPIlrxixexrQ8I4zlyATiC+4SXRAztTtWF
         ToIwk2hV1KecnDtWcY04haBCSN/AmfpZLeEKhM2Kd/fS0tIVnwyUHsWW5C4lFpKjdjje
         baVcVFY0gR3bXVVTjfAXfCX15La0f5UtkdeYpMBW6aJEyxvql6xZ372xl2Uyaw2B9iVX
         aWnPGLZiD2X0GEWcsM4jnlquNho05YVCbVye+rRiOlg5lqVKFrGlJj0mOUCPMQ+PVBJa
         qfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716281444; x=1716886244;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8E6p7Y+ouLSYIiXoIeFn2ZMIwfFJft8t7wvd/QdN3s=;
        b=ZbYqs8adg1/ZIn1zmgQe7Kf1jVg3vwZwcdXOh4LJhiO7b9asx2g51qb4VXyDY8pHuN
         cbYHT/WcxqTYfA//eajr751362LTFOQvwlo17cpMPOgpYd02Il//KmWTZFQOjLwqKTIw
         bgRnXCGeTL72GFGY57F24Gt+Jl5R8Sj+LUV37ZYbLOmQEwXrsb0LGxFFKcOdXMO4FTEa
         gPQlMkJout9ciGpB1qdJCcx+ar74MZFDG8xufIB+22RJX5hJuL2ntDGJJzcCABmcT2Gj
         w2CB4PpMg2PwDzXqlZIywyTiVHfbqc2FYXYkBy6uxHif4wvCCQ2hWejxvQ+2ItKDZF1y
         2xiA==
X-Forwarded-Encrypted: i=1; AJvYcCXAktlLvwh1WAt9AZvm0Q98YGB/aUouXx4esW1ST87GIrpxXLJfRBAh4K0dJHzG26z1KEeOOqdJICqdF2Rc7RAlNLXC9sHfH10+jg==
X-Gm-Message-State: AOJu0YxPCFd5CshB4Zdqf6lApji6OcqKWpflQwHGlOFRKwIng+Lp5bZ3
	ehton5FeMfnoWIezyi+DCDNq0HAP7GIUfb/WUy6N1XZdeSN2R4UY
X-Google-Smtp-Source: AGHT+IEg/FD3vmCrHSoKeq7lm5iF6Dw6sxIoc/VEcAkFAmQqWfIfIBzp/KhMcfxlcqVmlnUr61qRDQ==
X-Received: by 2002:a05:600c:468c:b0:420:1067:d698 with SMTP id 5b1f17b1804b1-4201067d80bmr222351055e9.23.1716281443688;
        Tue, 21 May 2024 01:50:43 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351d3bdad9bsm14709572f8f.46.2024.05.21.01.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 01:50:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 May 2024 10:50:42 +0200
Message-Id: <D1F6ZU89YWPF.X1SZ9JNQNPFC@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: ath12k: fix firmware crash during reo
 reinject
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "P Praneesh" <quic_ppranees@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
 <20240520070045.631029-4-quic_ppranees@quicinc.com>
In-Reply-To: <20240520070045.631029-4-quic_ppranees@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_015047_635904_A11FD3EC 
X-CRM114-Status: GOOD (  17.65  )
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

On Mon May 20, 2024 at 9:00 AM CEST, P Praneesh wrote:
> When handling fragmented packets, the ath12k driver reassembles each
> fragment into a normal packet and then reinjects it into the HW ring.
> However, a firmware crash occurs during this reinjection process.
> The issue arises because the driver populates peer metadata in
> reo_ent_ring->queue_addr_lo, while the firmware expects the physical
> address obtained from the corresponding peer=E2=80=99s queue descriptor. =
Fix it
> by filling peer's queue descriptor's physical address in queue_addr_lo.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
>
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wirele=
ss/ath/ath12k/dp_rx.c
> index 2bfcc19d15ea..2adb6c7d4a42 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -2967,7 +2967,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struc=
t ath12k *ar,
>  	struct hal_srng *srng;
>  	dma_addr_t link_paddr, buf_paddr;
>  	u32 desc_bank, msdu_info, msdu_ext_info, mpdu_info;
> -	u32 cookie, hal_rx_desc_sz, dest_ring_info0;
> +	u32 cookie, hal_rx_desc_sz, dest_ring_info0, queue_addr_hi;
>  	int ret;
>  	struct ath12k_rx_desc_info *desc_info;
>  	enum hal_rx_buf_return_buf_manager idle_link_rbm =3D dp->idle_link_rbm;
> @@ -3060,13 +3060,11 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(str=
uct ath12k *ar,
>  	reo_ent_ring->rx_mpdu_info.peer_meta_data =3D
>  		reo_dest_ring->rx_mpdu_info.peer_meta_data;
> =20
> -	/* Firmware expects physical address to be filled in queue_addr_lo in
> -	 * the MLO scenario and in case of non MLO peer meta data needs to be
> -	 * filled.
> -	 * TODO: Need to handle for MLO scenario.
> -	 */
> -	reo_ent_ring->queue_addr_lo =3D reo_dest_ring->rx_mpdu_info.peer_meta_d=
ata;
> -	reo_ent_ring->info0 =3D le32_encode_bits(dst_ind,
> +	reo_ent_ring->queue_addr_lo =3D cpu_to_le32(lower_32_bits(rx_tid->paddr=
));
> +	queue_addr_hi =3D upper_32_bits(rx_tid->paddr);
Shouldn't there be a cpu_to_le32 somewhere here ? It just seems asymetrical
between the two values extracted from rx_tid->paddr
> +	reo_ent_ring->info0 =3D le32_encode_bits(queue_addr_hi,
> +					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
> +			      le32_encode_bits(dst_ind,
>  					       HAL_REO_ENTR_RING_INFO0_DEST_IND);
> =20
>  	reo_ent_ring->info1 =3D le32_encode_bits(rx_tid->cur_sn,


