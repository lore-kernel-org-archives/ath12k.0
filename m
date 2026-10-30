Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE8606A31E
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8hgaKgk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMAxc9Ha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXieRcB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=; b=H8hgaKgkYFsz2U
	9D0jTeDxadx/ED6BELP8JDbe9knYXbzAvZWbLcZfxf0//NG7OzMXB0W1UUafqVLRgTD/r2bvrzMb3
	9p7uIcufo4lOl76+scWsfsTDexHOih/tVjuYJMDkPyw3SA61M1XQbOCc9Mg21rDnfFkmQf6/HwEOm
	3065Qzk2MrZPlMeuY/Zx+t/KbXhzMrsQ68nkvM+LJY2fwvC8ltWz/jhRER235pyMkYls/AmFyUp5O
	90j6Oj5raNEySsTad+dR7qN64SHidj72UjjNTjyU6vx159zuA50HlZaRmo2bslyFtzngmPIkJCgoO
	+NB3tdIfw+QPFLhBtf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj7T-0000000BH3T-2qFw;
	Fri, 30 Oct 2026 09:41:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj7R-0000000BH1f-0x9E
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 09:41:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIXk2733206
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 09:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=; b=fMAxc9HafL57ftM4
	FY0MTvhj3gxGQWVRAqEL8qfVFSCVB4BhWm9HZ0Kl5XsD24BHweZhXMa5YQdbifJ8
	ilGTd4IWMghb9S2E+ujc5rQ6CXYD/I2t9kUpOBCwa/UqzH3QENska+7aljbxsXUK
	oNgImzBi33U3TlSGVW5CnzDLTcLxZHSMY/WPK2hV15xR2zJDhropF6pelhqA+T98
	6FxhspGZNMPVEbSGrC6I28JgeOLR4+OZeku9AFvLV8H2tTcDYBIkhkaF2IkUTPPW
	rs3FESlRBr7I6ibkzhI5zp+731b16beh6ClHlU9QXTaqZ/mVoEdxIhhB5gWZCcyJ
	SH0RKg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj953-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 09:41:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-339628f2bbaso75200eec.1
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 02:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353310; cv=none;
        d=google.com; s=arc-20260327;
        b=cGOmuaWECgpsVbkSxhy+acr/IoC2MKt6/8YdkpQFaNgT3JnA6UEQEWlpK1FbUsTPpQ
         +yScMrXEF693ELyp7dK8Q4gNG11BvhEYKvoZfxsroRULOPHSwNBzZIfkhvwYxltbNvFl
         F2BUgl8HvjXaDOc+CBWhQG2Zg+xe4iZBqNwzjFYpKykplFHq9Oe9DJgKnJLF4ctch0Z9
         xNsY5CQIjJ+X1xUiNyAUAQX4oAwcIpUaNE4/mBsg/nBQEaOuq5V/5UTOWWYOSskizcfV
         kPkOS4DlHPe43WOXECTncfKaFky4XYijGACt+AdFwyZbmFcFc0GBHqA5GDyrYRKeRKCi
         0tNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
        fh=7b3fa/vIV8XYEAZcu9R/ayGTxogIPaFzfTRCqJh582U=;
        b=f/2NjrdfZ9GynmB8Y6+cGtK1oL/sAaywSiLcyYKwSmMTQxdawwob0gyKUYus85BTrn
         H4cfNwiVp5+Wf6B0BL2eLykzDru2ec/SR3ad8SdlgC9rxki2MC8eTEOdgQ1UueTI6eky
         WqN4Yy/FWPgIoYxfOKP3lIllZJ8YHhL0mDTSfk7FRZuy8N5kGCEPwIt3vrq42t863nq8
         gUK0NgWi8ykOuaYMpwu+3fHXmvEUxPx+JvEJGcvYL+P7ob40X/hJFGk3j/SWdz/15c04
         Qf7Rqc3+S7z895sAKxDR0GkX67lD9PY7ID3N8ebAm/EsUP+zH/Sz4uKk+wNBMypLqT9H
         6/TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353310; x=1793958110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
        b=QXieRcB+5GSFhjprwqVXZAk9s2RMi1qMlKECJ6C9orRYK27xh73fJBfkmp6J7KifJy
         tWg0hd2xnbqsuZkj/Vmsr+fx0r1dh9+cCvevSkG6WH16ZZuk89+8MHkbN5yeDqjkviD/
         TUVcb9fQfVel/FGvmK7W2++CAZNb2432lJRBBC5Gpl7kGc7zFuJWdUiGT0WbpZfE8CwA
         d5ckyjxbVql9f3G38TcxykHJKo1u5vbYPUuiLIAV1gBqLW0N797fM0orsDlPv0mtFs8s
         21lxbIqcsXZrk9S3bSyKaIpEg+kFH+u8MT5tsIbWVDKVOWUPhSLSYENJYLwESLaBjKei
         fh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353310; x=1793958110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
        b=PCD69zCm0MwGCcW/jxRoPrQyNcSqKCsXXHcZnAs2W9vz2HWv5f1a4qSNY6wwe4EQtZ
         gQ+Fxi3eLEUlqAZ50ho/+toNWXDFc47TDCJ0VzhZ//VetYRQhKO4sNxaSn9I8hR0mLIp
         54Sclvc+m2Eympkl8fMwbpfA8lnJOyakscED99ZVLivaPFYVRkPPJddzAD3v10UzqFXJ
         apjevMamPBKvTdIANtQTqxNXZpR8FknXb6cGiRT8eltsOw/MeS4R5IOgBzakt8lT02BF
         VUv18zGWluSw9iwpRwNiaUx8fPw9kMZ/XKMfI95fovFVSF9nSb76Dp1G0BjBQ7LTmK/V
         0LfA==
X-Forwarded-Encrypted: i=1; AKwUvBzI7s1r1DgSsAjbh3I2i7XjRO803NiNMhJMPzet70KFH6umhvgeaH6Tg29JlR++I7qDC8pGhvo=@lists.infradead.org
X-Gm-Message-State: AFq9FYLb61dDXgaSB89uTL04BGiZqIQkKGaKyV4Cfkb80JIy8IKEd0MB
	ltV2IrEe6O3+/cVPiXP2734X/CKpjI2Mv4jwZorbzninFc8mBHnWuqOGRrZr/8mEyJ6AHkFEdT0
	FuBHPylJXBv5OHJ7/d5fkYLgK7b9na0vSB5SYwLx3XXLPugIUc/4vBHieB7AT0EqU+hR4UuXL2n
	+KWLEPc8hsrzVaSMhZ+hpEdu7vanU6Vh1NhrA1H58=
X-Gm-Gg: AYBFou3LqYvSJqPBk88PbJe99au4mw1z/dMoP0OYo6O/qEbFgws5c2SujJAg4qf6Wun
	AOPTpe/2p8/RYPFbfinzrzc9zmpfhS8Cs1YPBO1G6HgldybXRz6uZHRwNPKjGljLLVjRgnYFkl6
	Pb1eq0poaQ79hJR+gXHKSsfhS2c4Q0VgxXE+G6wfNTvcgtl3pmTAhu3QH5Ouq1XYwoDdLhNKsqA
	Zz+pPQzegu3/kchGpE=
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id 5a478bee46e88-36a4231f759mr4734663eec.1.1793353309996;
        Fri, 30 Oct 2026 02:41:49 -0700 (PDT)
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id
 5a478bee46e88-36a4231f759mr4734614eec.1.1793353309428; Fri, 30 Oct 2026
 02:41:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030090906.298234-1-jtornosm@redhat.com>
In-Reply-To: <20261030090906.298234-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:11:37 +0530
X-Gm-Features: AclHuK9KIEENlHpS4wLIfGVb6D26SoMd1PZo5XAEkqihEp0H0825EShVfmY1brU
Message-ID: <CABkEBKZP_NFzoKEgdyTriGZqjYiDUMqOE2jL-NAkGEFBtJF+Zw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix wrong register read for RU start index
 of 80_3 segment
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: k2RLrW7YijBBJOpV8-6ouwqrv1ZziAf7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX/8fxf7HrLmK0
 vofcNsVBSNRd0TSwCn01luLBblEbKyGCdVyYOJeNnvAYj1qgYMW56VW1HDu/y+VMzy8Sqz8ZilU
 9wNGT9HKyq2dq5HUAiOHEK6a0gGEd48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXy3KVpL19yguS
 mj2AHke/8x7WKCOgxX4DVdRPcyC0oEUNPrBPug28QvzyBgNujZl/1RhulCRJVglT/R3FDBnqYja
 BPjzOOpjv09JdH1n34k47E2cp/86xPOdYp5S91pi/7UUK8pFHSblab3GP/FgYrZBMWfKBP14eRd
 ZsJ2Y0+2QFDfRpDY0VVEXcG65xlPNc9b5zXrxwZiK7XxNs3i4AkadxHeCcKCx18yxfG/Mbbk05G
 hdYEO4t1weDk/ktSB9TgV0TjyLWnN3V0f9SzXF7nX+9/OJIuRHfkvH94i4UBzitywVsBAUyHYGQ
 NsxEZ8YRYx+RtCLgb3pfnB0mODa7wOluLHaeSTJuJ9IcDqGKf5+DIc08nruDCW5TsNAOz4/iAl/
 MWuzJobQ97ZZI5raeaGP+fgubezHM/ygrX5Ppig6Pi84muMdnRpQ+9Kw0uHMxkg1fGb47SVP6cU
 /aPaczMR9rwMpfXlUmA==
X-Proofpoint-ORIG-GUID: k2RLrW7YijBBJOpV8-6ouwqrv1ZziAf7
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4665f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=LQZMuA99dPo4G15aSkQA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024153_379587_9548B9BC 
X-CRM114-Status: GOOD (  13.01  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 2:39=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> The RU start index for the fourth 80 MHz segment (80_3) is read from
> rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
> (HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
> it to info2 extracts garbage bits, producing an out-of-range shift
> exponent that triggers a UBSAN splat:
>
>   UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_=
mon.c:302:22
>   shift exponent 284 is too large for 64-bit type 'long long unsigned int=
'
>   Call Trace:
>    ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wif=
i7]
>    ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
>    ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
>    ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]
>
> Read from the suitable info (in this case info3) like the other three
> segments do.
>
> Fixes: 5db19c488413 ("wifi: ath12k: Move MU user processing to Wi-Fi 7 mo=
dule")
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Reviewed-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

