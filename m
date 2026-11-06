Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4172606A31B
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KUrVT8nW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehX4aPGW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0WHOXQS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=; b=KUrVT8nW+VHJrj
	ECxvzynEZEr1FsZLg/Y3KbmcuGEmOct2XaRAHCTSQUobD0GEUoV4UQYXGtXXzq/dj5OgWZq1xG+SU
	/64nEdjrz8WCWGU7HEB0ramZKBMTKtTthASBuhUjE+E/UjbZm/keJsv8+Zuf5UPE7cTeqW+IP7y90
	XH7tD9OEybW3C/mP6s1iQJAIm+aOz7PdLjL7xvUSKkep55EqCxgx7c4cREK0rqrlNH6Zlj6f89uLV
	fFsWCS9uRMUyl8xW2Z64OS8PI+SFW3Iq2aNQA9cr9w+XvP2HYxkg0BITtVg35tHc/ZFUfKmKvUNf3
	8KCzuOUR299KwGlDhvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCNi-0000000BGII-1wCe;
	Fri, 06 Nov 2026 05:20:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCNf-0000000BGHr-1GS3
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 05:20:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xx4V2833000
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 05:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=; b=ehX4aPGWJA4S1X26
	cEDcWAEDBtkHRQBFnGnSdpcDPltUjxyKCDOFthte90TZ/C2v+I4/VEDNAcTWgHB6
	tFBpjeAVrUyL+2hI9tHjPkzniOJmtduxrTim9/km9aLXxNkosdZ+F4/s+w8+nEq2
	oIOKPHGw1KjWEYH+bcqteuJan+jUMK6bdzmrh4PTvJnjisPn8ypgDTkM/orHVhik
	1Qz2qJRxWYf7CanYaBitOh5DxJTH4MDjKE4TaxFTeoqO+p/UFjB0r0pVAW6/bmr8
	7ooHnCO3ZnVsaFmIY3nhyY+vwesTGDupda0BSZRoC7TX31aNCW8w07hMIEb4LOux
	VARBlQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa12p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 05:20:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so222682a12.3
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 21:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942448; x=1794547248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=;
        b=G0WHOXQSSSjY4ujduEKT6l5YSpj1C4nCFDlgXVUhcQV5DLQwGIIA2mwwqmAT2SxJy5
         Q+BXLFZBZdA0mCvLhrElg/Eqz3dBz6dCX6SZyoSGSDUuR0ggyQTApA5OQacSRBf/HfL3
         GUrDJG42DT2igdOGAP6wPE8EqeLCxs4awS7vyuVdee6LyS7NJa7F+JW9Pst98VJvbNL4
         hAXmegRcQD/+NRMqcEzc00NjT0aBGNmYQyNrTF+Dio2KA5CiW5UbZfDcwCUV53msK53J
         NVh7eolDuUtRvfkRt2+7vKV2dk8ZIoOd0AjgHOMp8XDreKEC2q07SJQhng6xkQHrESUL
         A/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942448; x=1794547248;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=;
        b=kOIbMLYeI4+ekOq0JpyIqMoWT0UkTiPtiO1DXE4nNCnYOMzAhh0uUDa7Maufz5qgJk
         6E+9o/dA4H7tIDZCyWiQZKKLThGOl8X87tO3yEd7Bq5/yCKA2wiXgP51gMjGSWi6nmS3
         5A3w4M+kJvXmaLqi7Wc6eDmYaHUYhdomgMOVZs+lj9uvblt9qE1zfAIwTdQSzqFb74i5
         AcEEMEcqxUJa8wk2RtOo9sW+eFXpZ0E0N7gsu2cZXE8kpdlSotZrEn7rEZpZ7GS/C7Zd
         xC8tsozUOdOWb/PDH4K4ggQriuyC/cqPM1G3N2/KM79t4/56YyEhtPZTOZjOW290sptk
         De/A==
X-Forwarded-Encrypted: i=1; AL+hErH/yrWoVYGrqCsXJE4qS4gi8cp6tudyYy4c6HIUjhbI9uWZY+p4uM98D6XvmfA0or8S4OmdzRw=@lists.infradead.org
X-Gm-Message-State: APuU4Z/7Gy2B9oWX0cbXiBsRCHfBtYQeEOt44smXDxOIZQhaZQgydroG
	rrDLUWAUV5Q1vMxWEmJMz7EEgSSFN0cxNA2vBTHrPI4scBEjrUAID/BfLF0CvVARU0rA+4Cd3iU
	8IbHy+oYfPaNqdM3tPbcOKnzBiOd3jB7nEhBdrMlPhpWb47FVowH9O0xOJPwX5Ssw
X-Gm-Gg: AYBFou2gBvKdjvM8sgtEDYpXeCAYQTVHUthJnD4h/xskh70zhApzUI5iLQprnNQaDmo
	UoWyrS2ptNDQ/3NDJ3DsALEIVCANKMqL9nqYEOC7koAcbYUpVophOpyl/B8O+L5a6AnqgWB801H
	pmOC7SkLNo79Ld1F0bjfy9XRN1xOaLFlJVlP+9b66elW4EmOeuzsoJaSHdO30xnp2ZpBEphQksH
	z0+/y2k8nh/8SBtOmnMmAb2idzdRYisCqHMO2C4/mq0DuSPX+DAMJGY/hOAm7DBjpKUEphzxbOc
	DYQ1da/lhQssgB3vGNWZJxtAq5SYtpnc8wprEDzsMII0NOlPrnHLWObGSDf0vnjHl+AKi2xf5zz
	WLpZDg0cPXawRUBnmHmEDOlyNRoEUjRRIO382GqcfViobQkquB57WzFp2RC7NmACkUYLywXuOtc
	zI+xbYKXabjAyU37N2F0VxkRmYzRn66GqRKzP2tWNvK681
X-Received: by 2002:a17:90b:2891:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b0db6ee368mr1285348a91.58.1793942448482;
        Thu, 05 Nov 2026 21:20:48 -0800 (PST)
X-Received: by 2002:a17:90b:2891:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b0db6ee368mr1285334a91.58.1793942448014;
        Thu, 05 Nov 2026 21:20:48 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm1769378a91.13.2026.11.05.21.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 21:20:47 -0800 (PST)
Message-ID: <4d530236-bc44-4d01-9589-08bf715d8eb9@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:20:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX4e+FDBVaLT+R
 fXZvlmi5QZaA2ApLKbacIzyuVSzg+gKbHZtXmJNrkVgZ6f13a7uIFPzciNEqw4Hhn4zhxMqB4UB
 2U3vRj2pA2OTG+XE9gzS54D+7ObrU45W/rInuIzMo5szF9LrqhNq9zAiwXGjfSpnpsh8C79QKol
 L9jDNgrLvEDIheY1CMSlZxfzzngsJ4ldJYQPswZJaVInu77bDv4J8UrlUeuMOb0m+zajEyG7iUP
 av01gLpUdbtU/QxQkVh4pU6tIf1377YFOsQ+N4a91sbyfyiJOUnude+vhN+BSDd/rgXJGeiiXOQ
 zDO/xrdAg3/2lEQyeHGDi6RZhhXAbTm2sv8UPzeEUGCNCxnFEJ+AtrpAlb8ELeKWw6mZeHjaokb
 nuwao0oBUNsvT43yPhuxf8u2yebj4dB+2PplrBrlPNyfanNkvtp+O6VnD1TrtYj22m3zQYox1fK
 trXYvky0w9afsfUk0EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfXx63W8lC+oino
 cJLuYPfiUjP4ZeJXIf4ewbTel9abX+EQQxNAE4fIRqeMdScEm9xqD86XRxKoNmxOJIAkdQwWbVQ
 hSvQSn7Uj8mfIrSfv/w/gBdv6+DOTHg=
X-Proofpoint-ORIG-GUID: d-y64g95Gt8S9RevssayfvVZ0j8epvBC
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed63b1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qSRq8I4OGtnwRW6ma38A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: d-y64g95Gt8S9RevssayfvVZ0j8epvBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_212051_464207_638ECD12 
X-CRM114-Status: GOOD (  13.34  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/2026 12:57 PM, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> Patch 2 builds on the fix by enabling 1024-entry BA buffers for EHT
> capable links. IEEE 802.11be extends the maximum BA buffer size from 256
> (HE) to 1024 MPDUs; without this patch, EHT-capable links were limited
> to 256.
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> Paulson Raja L (1):
>       wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
> 
> Rameshkumar Sundaram (1):
>       wifi: ath12k: Fix HE BA mode configuration for AP mode
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 41 ++++++++++++++++++++---------------
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>  2 files changed, 25 insertions(+), 17 deletions(-)
> ---
> base-commit: b9acb873d035fccc8824164246535ea6fc95c71a
> change-id: 20261106-eht-ba-window-5c2df1a8e910
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

