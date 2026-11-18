Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239260A2601
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KKF6Fywg;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=M/NsKIuv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=; b=KKF6Fywg8XA3ET
	adCUTJ5NN5gA8LkuibHLNlwC6AQg36ZQc5kn3XEBXcKKWbqrhzB6IZyyp0qUkoBYdrgLIZfeRi0qL
	tj9RXaLBo9M4YNbEu/4lBU1VbvYzTAUudIc/ieedKQ7hY+nPp/B2qmP2j1Dd2akhBMKz9ppmFHS6y
	Ab6ylG59rlxKI9TqVMK4tc/iF/d/fdEfGmilgO0gol0mStkzafoNmEB+i5UBrnDQT+UQXp2OpKfmz
	3Vsubt5mz0pvHYwh+NJj0vsfu/gd4B9+5hspRloSsAZj6tcZ8xbL4nlUwdTy2gLi3O1TBtkJxYFjB
	WvCZeFwGpfKXfSFgwT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjdc-00000009oJg-2aa7;
	Wed, 18 Nov 2026 17:40:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjda-00000009oJ2-3SQ9
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:40:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so7718805e9.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023600; cv=none;
        d=google.com; s=arc-20260327;
        b=HHpFl5JReIZpA9HfKW9PkkycOi3J+2YDhHNUnymFTOrBir2qE3bLKhiVhiLbNKmI2Z
         zv85fcF5jUvlAtHdIGoxXzgYWkRYgEG3IM/vLwq9agq8sTTgF5887RUFxHWllm2JSMK/
         xsRfHgT6WXCkz37R2IiUFaItCKyHABw2FB7K9z2GvwI/O28amW7boch81dhC4UPRBad8
         Lt4LVHHKUqao+WSJt1vx+P5oHsArYCm3rGOWtrJs7yKrcTbOeLLbrMozM6ZLVqCNbJsl
         LO23KBA8pJlR7QMylq5pYp3lgF2XDLTQMEyTyA+13v2meXkEhmx9k0oYWSsAFLKxEX3A
         uKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        fh=/uj0UkUhNpPjE0sERcKuJ/S8m6jbOi9dl9gJXUTrhrk=;
        b=T1iDuG6Y5JreG6zLSJba7gvGKszlbcUtelwQtOG8PC6T/NFL2vlLnQuiOX3BBRGUIt
         rew1PN0hBuPVWJCVxgBmUl6KlahQfQuyP5IOiBzVP4scnjXZEPrEe/ofxnoJtneNUQP4
         YC5TIBrVUHgxTA3oqUi/7u1xs+RssjJp9IUwAxT6Mm4+QoeSHGgbThy1DJ1YMIkgtW6F
         pKzMHmGKJfSjKik5+Hj38PiegbvTrDSM8E9Oi2nObQwO35G0iVGuBY640xd1tJdxaN6n
         Kc3yqiWeqCwDmhWxOdLlxoC58nZ+JUHCEnWDh7obsJAZMqrFHfjSn1yQbR5DfDyX474R
         +hdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795023600; x=1795628400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        b=M/NsKIuvQjlYBq54PU09mKZHrp6os7lnsGDJO95D90QJrHzLYm/1hwAtDCo/B/FQqz
         vg6H3Lw0e82J2zusfNrCbdeW0rgmtZnsHlrALiaDro4bAIwEXETMrMzD13JJqmm0faNa
         +utFyYzmfHBe/WipY+QbPmANP/4LDQ25B0lXC4wC2Ce9EdIP/PusYWriYSU+N1aqzebX
         40VL54t7I2esPXCtGJI+4Sa1f5luKgekVdOZ8vnL+rm600OHB5agK2y7COISIfkqw6SY
         ZUUUSPrAJPN6MdrZ2nl0jeZdpCRfKSv8rQDxgp7m3WyCC073Pj9Q06nqTDjGFeAmoy7U
         DV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023600; x=1795628400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        b=qNX0D0nNhNplW48v/OA81DVKw/48RExGTtimdOfAv9HWFz1QIVVl9u3NhH+WWtA0WT
         tTA4Ku1Uf0LNYsuKv62xYDMPWX2TD1+PtWHN76Y1DZt8/cnTsLlUWh7lZO2NCckos5Ne
         HOw0Bnzg1xfgGWJCyGRp4au8W/srrBafyiDVEyYLuNzO0UgPwXIIizztbt6o5L60KTbp
         xsQDecdghEF4fMYO2qVThtl9QcVosn4FWz/eowtNhOHv0W2di72QJf6j5556lNIUkQYk
         /Lh50sQl/AW8xn9Nt/Mu1YKWBqlOCoPCUQjBCnvuwLk8atk8O7uFDDUzdSgIcQ+uA/XG
         G+pw==
X-Gm-Message-State: APuU4Z8QgqMdFgYPKE6PNm3z1zc2QxlTQ4Xpp7Ul8AbWEELfFlhG1+Dj
	nHU4WWw0+FqtkFvOKdu8xZiJUKO/Jryiev+G6RaWCyq4PZbl88ThbSYLB15j7Cm50z+0lVBGlwr
	ICf5BQWGtjL+By2xUIrNOlUi6zyVuHjk6nlt57VJBDA==
X-Gm-Gg: AYBFou2tFDEEmo690sZ2fkvKvypcByF1OQq3HFi+AdRIpjNj6GAc9+5g2MKP9vOJNdl
	5ti7DxB2zXN8PeUsi21PDab9DMbE4KHmYlhOOYEsk7hhRtM2c5OgRvz4fOlJii7hAkU91tg04mu
	wSbvs4dw15f/KrFeLCcVZPPP7KfvQELdV+egzdSNaJwTGaHPVdCBFPqr55riAFIyIAZSUqVGtuP
	mGWZwArwYaTaFGRHATDZsITkSYL7QqZmKCRSFMBzgxN+WFAcJ5dr8MecSiXFyKnEyM8lT3iHQ6+
	xiclvMrkxi/slt3dohUoLcFG2wYdm6a292EEqsyAKzbX8d9kWcb5yYcLEFA0uL1iQ4shLnzPf6M
	efGMSXT49gzlYfgC/or17+OCy/yYUvWDk1d/CgKCN8oGMBrg+mReY39cJeu/5npI/WaDnEzG0Ka
	kU6NSWlOP4cfMOX9sah1OMu2F4vDwwVxCantf5F5Jya4SR4jBT+g==
X-Received: by 2002:a05:600c:4504:b0:4ba:7e6:53d6 with SMTP id
 5b1f17b1804b1-4bb7da52ad6mr61041225e9.33.1795023599827; Wed, 18 Nov 2026
 09:39:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118012321.2861920-1-wolf@pi0.com> <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
In-Reply-To: <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
From: Jonathan Wolf <wolf@pi0.com>
Date: Wed, 18 Nov 2026 08:39:23 -0900
X-Gm-Features: Aa3M54pPxvUAq6HMdagxpMC5cxexw9wJ5sM6AWKWY8bBvmK12hLzWm9b3yEHzx8
Message-ID: <CAByFygUwwTx514cAv-i+Nk3enfECtx4NeY-o5PXjGtqG0QYHug@mail.gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability TLVs
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	jjohnson@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_094002_951035_636D295A 
X-CRM114-Status: GOOD (  29.30  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the review, Baochen.

I=E2=80=99ve moved Tested-on above the official trailers and added a warnin=
g
when parsing the DBS/SBS capabilities fails. I=E2=80=99ve also moved the
cutoff assignment and debug print into the DBS/SBS parser helper so
the driver only updates the cutoff after the full array validates.

I=E2=80=99ll retest on the Steam Frame and send v2.

Jonathan


On Tue, Nov 17, 2026 at 11:04=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 11/18/2026 9:23 AM, Jonathan Wolf wrote:
> > The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> > in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> > therefore points to an inner TLV header, not directly to struct
> > ath12k_wmi_dbs_or_sbs_cap_params.
> >
> > Casting the array pointer to that structure reads hw_mode_id as
> > sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> > 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> > cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> > a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> > partner-link deactivation.
> >
> > Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and rejec=
t
> > unexpected tags and payloads shorter than the capability structure.
> > Use the first record, matching the vendor host extractor, and leave
> > the cutoff at zero when the array is empty. Only store the cutoff
> > after the complete array has been validated. This leaves the existing
> > hardware-mode and link-selection policy unchanged.
> >
> > Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
> > patch to Valve's matching 7.2 kernel source. MLO advertisement and
> > radio-mapping diagnostics were enabled separately. The cutoff changed
> > from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
> > and AP-side data counters increased on both links during traffic.
> > No driver recovery or association loss was observed during the test.
> > An unmodified upstream kernel was not boot-tested.
> >
> > Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_f=
req from WMI_SERVICE_READY_EXT2_EVENTID event")
> > Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-pars=
er-live-test.txt
> > Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.=
0_SILICONZ-1
>
> Tested-on: is not an official tag so we usually have it at a separate lin=
e before official
> tags:
>
> <leave a blank line>
> Tested-on:
> <leave a blank line>
> Fixes:
> Link:
> Signed-off-by:
>
> > Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
> >  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
> >  2 files changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wirele=
ss/ath/ath12k/wmi.c
> > index 75b259990..f43c9a359 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> > @@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struc=
t ath12k_base *ab)
> >       return 0;
> >  }
> >
> > +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag=
,
> > +                                    u16 len, const void *ptr, void *da=
ta)
> > +{
> > +     const struct ath12k_wmi_dbs_or_sbs_cap_params **first =3D data;
> > +
> > +     if (tag !=3D WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> > +             return -EPROTO;
> > +
> > +     if (!*first)
> > +             *first =3D ptr;
> > +
> > +     return 0;
> > +}
> > +
> >  static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
> >                                        u16 tag, u16 len,
> >                                        const void *ptr, void *data)
> >  {
> > -     const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
> > +     const struct ath12k_wmi_dbs_or_sbs_cap_params *caps =3D NULL;
> >       struct ath12k_wmi_pdev *wmi_handle =3D &ab->wmi_ab.wmi[0];
> >       struct ath12k_wmi_svc_rdy_ext2_parse *parse =3D data;
> >       int ret;
> > @@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct =
ath12k_base *ab,
> >               } else if (!parse->htt_msdu_idx_to_qtype_map_done) {
> >                       parse->htt_msdu_idx_to_qtype_map_done =3D true;
> >               } else if (!parse->dbs_or_sbs_cap_ext_done) {
> > -                     dbs_or_sbs_caps =3D ptr;
> > +                     ret =3D ath12k_wmi_tlv_iter(ab, ptr, len,
> > +                                               ath12k_wmi_tlv_dbs_sbs_=
caps, &caps);
> > +                     if (ret)
> > +                             return ret;
>
>
> better to leave a warning before return
>
>
> > +
> >                       ab->wmi_ab.sbs_lower_band_end_freq =3D
> > -                             __le32_to_cpu(dbs_or_sbs_caps->sbs_lower_=
band_end_freq);
> > +                             caps ? le32_to_cpu(caps->sbs_lower_band_e=
nd_freq) : 0;
> >
> >                       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_en=
d_freq %u\n",
> >                                  ab->wmi_ab.sbs_lower_band_end_freq);
>
> to follow the convention, would be better to move the sbs_lower_band_end_=
freq cache and
> debug print into the parser as well
>
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wirele=
ss/ath/ath12k/wmi.h
> > index b508aa759..94bb6854b 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.h
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> > @@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
> >       WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD =3D 0x3D8,
> >       WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD =3D 0x3D9,
> >       WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD =3D 0x3FB,
> > +     WMI_TAG_DBS_OR_SBS_CAP_EXT =3D 0x400,
> >       WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM =3D 0x427,
> >       WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
> >       WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,
>

