Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E9606A327
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B5Fss7zL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lU+HL2ud;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCkHcqLt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=; b=B5Fss7zLPArQEP
	qrKtpmcJgsL5XUTwgDSIIjfs5pr6qOwoNsFVs/d482geDpHoaZv/tDcO13j4jBHUSDA5osaHq+u3q
	MEY8M9Q1MPD3eR6sGRNqkRWK7GEV30xISfo4wAUyilcRcio7JpUJ5BD6I3XT23/hQOVr3A0ELrvkg
	6pKBEpIRg/Uf56ppOusqtPECq3On3U5ciX/vxMxtsu3auobi2mkFaaR28aL4+tKwkHKtnxKuiwRlw
	k6uFYgvQyYdzyd0jUfbL8abTcjA3IdiVEsSYH43f4+vzuKqqlLT56BIaHGnzuFYi+SB/LbdVg7vaO
	Fqkx8hjHbp66OtE47yZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwtO-0000000EAZC-1xbG;
	Fri, 13 Nov 2026 19:24:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwsf-0000000EAXz-3r9Y
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 19:24:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ1qui1085611
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 19:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=; b=lU+HL2ud2sEGYsF0
	7farl98IMwxaGqfMUyiVu/PVRu1s4LSLu+Q2ELEreTcnTCHyVLlMysCsXeoRG1Gs
	+wNel4jLMD8DLg/5KjNypLly3yuj25KDwvCQu5xNUyVN54QwGmktGKs5lhycm48z
	7XHojh8XKF3D+dX/KwkccID1CGcKxfur7gPr6TwrP+o2afwXMS/r2SFumcl4dn+Z
	Pg8CpjKtdYijpfZL4xrP8HA8mwavUm5DbxmL5VJj1RAtY3rwiBSIgjjASQBtJmZI
	tJhb2ORHypnZeajpBlMlXq/mLQlw4lJFTUzxHFvyihR5u5c3D2FpXURlArGNSI0q
	hfBkUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaaw76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 19:24:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-339628f2bbaso174475eec.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 11:24:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794597851; cv=none;
        d=google.com; s=arc-20260327;
        b=eKWH/YJ8WAXl2dbrD7bxf9LleJHvej5trbytukxlwlJK7mZuVNmxjoGlzMmJTNspYW
         NKGmRc39/B02y04zwDCDeWRqy3J2eBJn5cqm4NK+8tv28bi516EJgOdmJJBWM0D+jG9b
         3UnRpyijZJ33tgr9fSlWFhXbUfv5F9rFWLA4tB++7NQUWt4A0xDi5gMntZsqN3AecHt8
         bzz+YttF1BQuR3QFvmXw6a4+0guRXIbN1ivHCqWFQUaz+RYVw6p656DWP62ecMN1w+BN
         LHPHF1LDF96OAc1XP+/LGGab38e7wE4S/hZJKdXAsEGDbWwkI6k0UwVB6Sy0s6nj5V3w
         1TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
        fh=FFdZULrXx8thgMmkmULnWJN6SjGIXnpj+gS+k8U9crs=;
        b=pdZe1zcm6L/SymKtikgwGXKvPsI1kxs8IabVPenWb95DiWvHeHoWR2KZsyHEb9J1p/
         JQCEH47uwHg0coYWlqnHg4LDkf2fEteABVBlHzHMVevIfYxC5RpSTFWfjkem5fTOjCp6
         14WBbaz9PXiTN2lQbFbCebNH4Kb8ZFoi3b5kazFKu8PpF1uwLpcIljB4X1zuZ5FZUYkG
         s5X1hHRjSnl/kQzPiW8PWobDdlKtDo46pmYRb0uS0kVKJ7rGL7F8+LxQo+bCz3aXMZxR
         cT903nalsShGTxZAbdhYQL6HANIrY3h0oID2DjQc1RvXWCtvjw1Qil6pTvc5KQKP+zZc
         XOTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597851; x=1795202651; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
        b=WCkHcqLtBUsCtlHkVx0YWnkQxXkkEq+mxjNnVUuwYxiGmbJthY0WrKxHarcAuyQk8b
         PdGvt59Lai6ugjAx7mHwhkW9SwZm4+R0aDJKxOa0XGfVE/KTpPtGgbYlj7XMhsvM6fAU
         0VtBrjq0eFnitGWFULIaJfc9rCAYPFujv0j6Yjd39Kf09SpOlD8n02envpI/kww/iwN1
         GtW2ZZAkf0bfVvxMGtvUMGPgiCpv9zhBedrR5NBgKIjalglMU65LtctJ3rpYIaZHm+hM
         D1Chhrw9+cnZCFpuCm+lu9cFrgW3zPhi8TV5PRuBXo9+omV3Q1FTwlRZ1F2gpmkWrjpA
         4e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597851; x=1795202651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEXnzhmVLAcxH1soBXizhJLa12Xqac4KvH+xZwh+kRY=;
        b=fP3WHSAv/OQwkhtefMjDH30o3t7iJb6tYGyy/iSe8pNrdYuBCOabtw/bH7qaURv34y
         4Yjo0/FWc5JT/NAVMbCXt2GLaiOPKzg8+ckV8PRsG8B8yhUCtusq+OunSyePdx8+9xCP
         SAjxhgjkvTL5C3flujJBqSrtntvELPl5cfJdyGH6SSd0hEPfSRrYLBJYWvAfalCpH17s
         Vl8LXgF2FSaDxzQO+UilzgnipsUC9Kga7slhCJs6moNVj1EsF7Gwe5+Vu+dZm/lCoq96
         h9ntQ/OxB3kxUlL5Hx4wF1ZOTGPTHipWh+swiHXfBjFck3/wgCNF7FsY+5EXfx4uclv0
         Lcnw==
X-Gm-Message-State: APuU4Z817i8ujYm64KjwPYCznGgr1RVCRaRiU5BranZV9ubem7An4+E5
	FY780d0SY+v4ox3qjFwSg1nuzB2rLXDgg0Zm6C7DdUxDi1QP1NFCSSFgfWbD/O9xPXGxdSmKB2H
	Swl1ZHVCiro4GkBPxGwInaGVPRsl0TLUSr700yzfyl6WxRAtEUhBk914VcJ1BeYyknCzR+lwg/g
	nQixASB5AAlCm800oraWnKqm8Q3DIq1kAJxxQwcEo=
X-Gm-Gg: AYBFou1RhJUL0MKPvgWwam9zuO8ws/fvxnMIOpYy6tD2oNFI63lYzupDQgyTWsGxjdP
	WDlGMajtFXS7kwZSRHDrni+g12S06tjA1Pz3T/rFcQMU+rL6nLItMAjXiYE142/FdnkqFjtkQcs
	BDDWLr7S0lK5eWd5vnar336zRpX6PxxJm7+65PcAxISv6UsCEcywiQQhSRLLTk2GYq1zWj/v+ma
	EXNLLKaqFvRRRXVYw==
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr5606852eec.1.1794597851398;
        Fri, 13 Nov 2026 11:24:11 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id
 5a478bee46e88-37964e03109mr5606809eec.1.1794597850849; Fri, 13 Nov 2026
 11:24:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111215845.814490-1-repaxan@gmail.com>
In-Reply-To: <20261111215845.814490-1-repaxan@gmail.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:53:58 +0530
X-Gm-Features: AclHuK_6dF7HCsH0zkxPTZe8LHnpqOMstzypfJOYUk7ar60_gR3dbF3b-6fTeCQ
Message-ID: <CABkEBKYcabdNgiMNyYEdYPmGUo3z1=p9NtMZC+zRXiZ8gwO4+w@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
To: Ronald Ouyang <repaxan@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eOAzsrhch5DJiG3eTEaJA9BhAlqi8eK4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX8xY/xkken85r
 4L/HUOuScEoNeL8lwzXuV/SDoZbtBZ5oSxiu1cjiyrLxMvBNeIxe709V8o3TfgqeeG8hFaFSHPo
 5ltnH7ZR4BiBnahNPxjGCMuGIsGmsv8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX0XHMTGzruq3z
 mWGZBb2h/OxVhNmEF18Q5OfzuL7XKiouN664RVlNskwCeDJSajdA6XXykK0V+WQ25Fw+CExTzI3
 JuLIpcOQl792b7ifhPZBy2m8flMhP++vmvtNky0U2eZXnYLNQi5DHjzYUiJrnU23G1RunvWOP2x
 h75c6/kL+XX7x7KVn2x9COiNOi874E6FHLs6VBbSdERhFD5YcKKZc3kdwOWR4uBeD8toGaOl5Vi
 5cT8UlmjhHKiF2OkY8JNHSr15qaTGuBWv1i6jGUubDrSwfW5piPurtsUtoCUStRGbuLvwIHgf+J
 Zb0LwniCanXhAtbHOe6X6cyFZKtgZQhXqjhy4ZIz9DcCL/zFDx1Czcsik1rYc0GCiSPlvHn7tC8
 pAMNpYgnSwDfAOz28dl5Ik26f2QgftK3hyBo+lyzOQZjek6isvvfz24rQdTRc28yb+fkOlc2Jh7
 EgWoWY55kMq12ee2ejg==
X-Proofpoint-ORIG-GUID: eOAzsrhch5DJiG3eTEaJA9BhAlqi8eK4
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af763dc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=TztX_nJYAh8Hf7AHscEA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_112413_970092_386D67E0 
X-CRM114-Status: GOOD (  24.52  )
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

It would be better to check vif->type here as well, similar to
ath12k_mac_update_vif_offload(), with explicit checks for AP and
station interfaces.

>         ath12k_mac_determine_vdev_type(vif, ahvif);
>
>         for_each_ar(ah, ar, i) {
> --
> 2.56.1
>
>


--=20
- Tamizh.

