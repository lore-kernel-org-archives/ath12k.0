Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CC8606A32E
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 20:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b0Un3aFZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOPLmYEP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BJ0UqDSR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=; b=b0Un3aFZarq6AD
	W9Mb9HijgaTDDe4R8gSTOpzmsf4NEF31v4y9vWu+P0hjo8/r0Ip/tzzqusBDM8EUDWOhOIJBmHF0U
	U5TnFHHdPrM29NFF8BZyvl/XJj4EqYW4ogvGBSBHE43LwP4qJsUrjbxOnfeT8h6ok/NJOjmqsPZbS
	VrQ1cTCzPAgk+NcK2AX2r/QVramc5XGM3TLWn8BFdFE1fpzjmypn1fyYTGW9NJn8rCbhssPS9daXb
	BGdBZ6EnC96eFvLGTQqY381WAfLXfw2z+FKFfNDnpnPkqAqEhfPlaMyhyWp4UYfxYl4U96Xhl0yK/
	d6e7Kgf2N6S+hsh+bfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxu6-0000000EPfE-0wZw;
	Fri, 13 Nov 2026 20:29:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxu3-0000000EPdd-1Zne
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 20:29:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADKK19n1496838
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 20:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=; b=GOPLmYEPh04PW3YX
	8Nce5qkrKkuCVzrvmL8eqNRNpEXIcE39p8rP84n7/YuLWEdpTjsniYwZ6PDKMdgE
	BI8MPd2uhF+sNSKaVSA+VTcMEtvPQ9xRWRyCDsjgZFNnB4Ul0Llw8t+IYifWajjS
	VFovn1KxgU/CoGj+4YvFdi4eocfbPUewsja0w+973/oX66H0Sy6Y+EV9jKMOxbGu
	pCXj5pBBTRAv2O0A6RfvoLHXuT9khGBZVRD/g4hwUZTUZ776dLw6mUNv6lo7WNHL
	wshPZEm4MB3GFDhd7iO6Gxui0klUlhi5+m5oJrrDxBH0XY+p2V3SY4KY5q+mMbSE
	4mS1gQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37k8bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 20:29:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a6f57c066so140012eec.2
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 12:29:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601781; cv=none;
        d=google.com; s=arc-20260327;
        b=LykGjixB2YTfrlpNZfvjtC3LM6dG8xnU2lrjijVqMfbQq31FrsJyavUYAx0OHpEyVY
         NVGZEOrcdb3xUx43dBH8BML26O+8Hnf9iecTeeAHryMecTUAg+0xV1UHSPzpj6PdhBMF
         Qfsn93LHzWo0/+GkBsel2BFKfntOcbuW364j1AieZWDRP8mpmNboEXKsfLlq3QSagABx
         gxP2DvjOnp7B/+ANQd4JSHc8H+Xb91rwXGnB7k8wkIazSAiF7IgfCrDlFfVe717+DfPF
         DxQiY47OUxyQan4GB6r91mYlJEyBqCQZ13mym68Au356Y6xuoMZaDn4EbRBXM+OmHaaP
         m9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
        fh=FFdZULrXx8thgMmkmULnWJN6SjGIXnpj+gS+k8U9crs=;
        b=BbOD8Bj2+gHFNfKav1/g+qjm4qeYf9vcaC4HLvD1VmMmKg96x8bwfsG1sfWRJrDbwT
         VI4pP2x9wEj1o6T8B+8eM2kF5zU5xezki05DvufWRhG2KQHLKd+xg4wYjng/K5CZqU8y
         ARCVn7cMm8XCecJFx3RLpi5F7Bmz0B6ZsXE4Wrf6NbD8fo8CFUcEtjoBNmYrwu846uzz
         Wdr/Bc7sL4ahga8O6EbyIg6wX0CUmRQWOb76Gr/RrYKadPDASvrttXF1UwQJNQDoHA25
         omPJ64Ksx6wm9DpHF1wGa70HuCmvHZIb2HTuBqUp7bV1NXmxwruUsudMvi/hX2Qz7lX+
         ajzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794601781; x=1795206581; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
        b=BJ0UqDSRvGTBZRXj0mSiklJkCp9md5lXb41WVjNX37QF3pgAANanOtwAcsC8z49mKy
         13VJhujwyeK4l9d3UnLermj9fTXwUzTc2hG1yQQseMVp4zLjbZAYhpHJHz2+hZL4S1UH
         95SZWZVKomBiROXgxB1a6CQtAEVlQbOiFmTdymR2WTmhUKjt4O9UO67P4kaVHsFx80Tu
         X8CNjqFxn6R5ZoHZ/o5dCpB5nlrvTaVojIAEqXtljZOVB0MyCkLgkuQNa1PYEzwwWS4t
         rkvnumaPhe1A5xf8sLeIiwh3shZg4rIKQzTZFEwh5FMeUdFXv3JTARb+x0/4vsQCSsFr
         HeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601781; x=1795206581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFe+AyFfsmZF4om7iPqNoRuz2TcNc0/Ih+4asOBhSgw=;
        b=hcUYQCT/d2jiVbjma9pHjeCBG2Fcyr7PiMeOqxhrmenjAwptc+2GH99rG1Lm/B/CyV
         sY2d5SZbGMoFana4Q2I6BBBx/3rcqCDR/hUjb9LQzItlDFQWaveC6s35phTxvvEQYSlT
         kbNXYGlByY0cY4TE8XYB1JaTo+BNxj+T8N/w/Gf7QY6g0Eh7SlnxqrHh4KZoRlZswVka
         CFXjf2QSoqkme4EZwpThMY01nN5pBBl98kq+LPTJhSQBnWnA5ZLxP6IopkmdBh9+ObKr
         o3rwi/Hot+p3DgLUvBIi8BD2Y///+uEt2+0Xg5x91mh4G2s8TcB31Nu60WDN4Yj9qL2P
         JSOQ==
X-Gm-Message-State: APuU4Z/N8WfpTn0uS6nsrVIvObTfIEmvk/dIXR+5QPd3oiAc4xv/DYKa
	ruzmtb4vhGJaLuzgTOW67tczy+IaxSWZqpFXsqQ//plULRWWiD0TudnmaYheXswJFoFynXMfEU8
	J/YJaJDBcYf8X2TTG75MYjABASmRGRDV2jAJFrGDj2D+GsbbELS0i5UY2usXXh1zDUPE4UOgD3L
	6uXd2ssksV7BQZOYYC+hMjSWkf6Mifp3KdCb4OdECBFZ2IgZaHDg==
X-Gm-Gg: AYBFou1QdZ/YURHYtnmReMRfhOGF8fYvD2CwtVNBpSz+Ph7IaPISd7exknjm9lxEhX6
	YjPtLECISr+ulDM5Z+90K+zragbSVb7VUYk9olRX0eU9TM/DRpjtgOcsZgL/lBNbMDzgMT1zqId
	gyKjFjunMZEz9RFltuNyMrviKSNl5g4lccmf4cAa7vFDz8RVqTQidVOwloWrdL8yvoj8ObATCaw
	C0mniO6C3Zh/CEolQ==
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr4590536eec.0.1794601780565;
        Fri, 13 Nov 2026 12:29:40 -0800 (PST)
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id
 5a478bee46e88-3796057b529mr4590496eec.0.1794601779900; Fri, 13 Nov 2026
 12:29:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111215845.814490-1-repaxan@gmail.com>
In-Reply-To: <20261111215845.814490-1-repaxan@gmail.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 01:59:28 +0530
X-Gm-Features: AclHuK8RT9v9dug-GCIyDGLN86sk991awGjHBNSSxZ4IERLQW12YfxPL_9Djvus
Message-ID: <CABkEBKYwC4h1Sq0cpzTwfBm2obdK8EBkvgk1ZOo+XgtbmWsRWA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
To: Ronald Ouyang <repaxan@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4MSBTYWx0ZWRfX8Eo99mzxI4qa
 OIr58D35DrHilrL+Z4n9Suk9vC6B0n1UiM2tvvYo061eSKv0AiCcKzFvXJfs0tE0fkGCDTUuJpX
 jaij9C/123f8GYRoeIu307UBBtNvMH8=
X-Proofpoint-ORIG-GUID: 1xYWGLMZoOag2zsesOY88rmlzxImmp4g
X-Proofpoint-GUID: 1xYWGLMZoOag2zsesOY88rmlzxImmp4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MSBTYWx0ZWRfXz2/MsfADopY2
 sbNwJ31LIbQFZw5fTp4KuG2q+josslROLvYLx9rY/ojX6qeZNKEDxZW7hC9AvlwGqDlTY7HouT5
 k8IkMJmIFIWvs3lk3HNF5BDLlBUiCfSIrd2XyV8RCzWjbiwt1lzfiIMzjDxuHj+MYAQsofq2aYN
 nENkYHcj4YroIxCATywMCvJ4XZZQGEOIBAs80kyNcoTk2XC0oLUtP4vk+gtWauxmtrfdV8NZ/j/
 xCGbpOasdvNbAYRl2SpOOK8X3KdXWbg8NZgW/+Ms4oH9Gp3VTO9AbovP99mq86rxRVAwseI6R2/
 1rCFg5DnYNvFo1uOTILzgE5iMuWacx0sW2+AxI9Bhl2Pm+yQkTDOgXSRUO4bXrWJzga7TQ5XOhc
 3NtYheC2/M0HDwxsh+J/3aXC+GC9uEspnrRzDJSxtmyHrtcEI6p4eqxe3cr8Uu2xtM3wIh+WuYv
 et7cmzvdg+jeKUoJ8GA==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af77336 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=uwKDZdRe1lDUAdHoeJQA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_122943_541307_B10329C8 
X-CRM114-Status: GOOD (  24.34  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 3:29=E2=80=AFAM Ronald Ouyang <repaxan@gmail.com> w=
rote:
>
> I tried the WDS support added in https://lists.infradead.org/pipermail/at=
h12k/2026-May/009382.html.
> With a ath12k WDS client, the frames received by the WDS AP had some extr=
a bytes in the beginning of the frame.
>
> My understanding of the problem:
> 1 - this is a WDS client, 4 address mode.
> 2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_EN=
CAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
>     so it software encaps the ethernet frames and sends the resulting wif=
i frames to the vdev

How does mac80211 queue a packet before the vdev is even brought up?

> 3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offl=
oad), it has OFFLOAD_ENCAP_ENABLED.
>     so it expects to receive ethernet or "native wifi" frames.
>     it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
> 4 - the wifi frame from (2) gets passed to the vdev marked as "native wif=
i".
>     it already had a QOS field in it, the vdev adds an extra one when doi=
ng the hardware encap
>
> This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth of=
fload")
>
> Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index afa3556480d3..1b1c3f738590 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -10275,7 +10275,8 @@ static void ath12k_mac_update_vif_offload(struct =
ath12k_link_vif *arvif)
>         if (ret) {
>                 ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\=
n",
>                             arvif->vdev_id, ret);
> -               vif->offload_flags &=3D ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
> +               vif->offload_flags &=3D ~(IEEE80211_OFFLOAD_ENCAP_ENABLED=
 |
> +                                       IEEE80211_OFFLOAD_ENCAP_4ADDR);
>         }
>
>         if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
> @@ -10939,6 +10940,9 @@ int ath12k_mac_op_add_interface(struct ieee80211_=
hw *hw,
>
>         vif->driver_flags |=3D IEEE80211_VIF_SUPPORTS_UAPSD;
>
> +       if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
> +               vif->offload_flags |=3D IEEE80211_OFFLOAD_ENCAP_4ADDR;
> +
>         ath12k_mac_determine_vdev_type(vif, ahvif);
>
>         for_each_ar(ah, ar, i) {
> --
> 2.56.1
>
>


--=20
- Tamizh.

