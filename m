Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DBF1088E63
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 02:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHDyHXOy91HF/6i04YQNHlGpN7N/uSNnlOoEpxM8Ovw=; b=ud5vVjvIeZQWTdlKg7ffGjx4/u
	i06UKWqqCPIZyL2fuhS3fa17u11oqCi5fdi4gKxr+fBhqHewd/1FLP0WMOptv4SUHAwpEk+u3JLDP
	C67As5iC95jOFvCjL+LE3OgvC8YE6KjP53vMa+vOCENXypuCbE78yOIABioXxfNbeGIwyveFm8RIa
	o32pRiBjJMiIRvY/IhW3zt8KVM0TVPwQUPeqer3Bss0zeoXG/LP7NA6qLSpm8hflAYq7p3K86s6pk
	AZBFfoFTysh2MaL5FrblBMYWCyz8Gk7U883pBBWv+9c1oANXsNrBd9trK99EQ20o0NZz1f5vcyiWL
	l1uA7RKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33QO-00000009mDc-3Ydu;
	Thu, 19 Mar 2026 02:47:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33QK-00000009mCx-3iT6
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 02:47:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J2cTsH3413864
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 02:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHDyHXOy91HF/6i04YQNHlGpN7N/uSNnlOoEpxM8Ovw=; b=NEijA3RKUt7Ddj4M
	k7VRXMPj3qeVi8KCkJMOcAM8GZWyc89lsScltB3Q6t72P+DdFw0T/BX1kN2C0p8x
	Pgde9h8jZ15lkAdp6sneZy9MHBFdiyl8Xw/p+ytrEONokD96Awek+b896LufMemU
	3YdCdMIy9KVcCsUOee5kJL3u8pQ0wqFEBEndNLIwLaIpgzIuggfPkjryOzzEAFG/
	4ioHO5I06q2xBUTRzdUXr5paM/LDEcexTGupJ8XwxKRoUntlXczJH5NsQJjtX7Gr
	Htx4NlqHvuQw8iIQSs1vGV/SZEmhbkLLdpXw+eJxb2RR54bgMaHCuNWmi/HOQXrs
	ck7u4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032hm4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 02:47:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b068299665so6994075ad.3
        for <ath12k@lists.infradead.org>; Wed, 18 Mar 2026 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773888467; x=1774493267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHDyHXOy91HF/6i04YQNHlGpN7N/uSNnlOoEpxM8Ovw=;
        b=VkST4gcVvTNJJaNKFJqgiB0C4HhzT3ic/oANXHIGJnpYiFDZeFDGfRZOQ/JwVQ1i5s
         vtjZDnbaKA8dRrWFCA6X0MLV0SHM/V9G0kSKSPOqQS7wG8V7IGNVrekO1hSF8ookg32m
         gCwKotopXMjw0GhbCesoENC7vCm4eAPrZ6K83OQJ/EuCw2zwgSc7U4SW1kX2JRUmji/F
         0q4dMIWnXKLdqAEIy2xPr9hJaEIY6GUEC+MKGjApc2yrWMADnKxfIqwz0JUA/cKb8Ejs
         6uYPKea8gazHgaX6LiMO9Y1B/maPPNF4Vj/8ILRVfH1Tqxwkj3A0i/E6QcBsvgnJKrxB
         AWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888467; x=1774493267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHDyHXOy91HF/6i04YQNHlGpN7N/uSNnlOoEpxM8Ovw=;
        b=OteN33YQVf+8Xto6rUXEZ8tiY0aq0cCK9vagPBOV06ZrzBJ+WHEMNbVaUFsHiIjv6k
         k9BEepgH2noJgqgeRWI2SzieDdBXeSaD/r4/tDfRJG+rZtEP6bzXoV28l2QAhcTcAtn0
         fTI8kQSWNfgroCsPSCPvOYHzg79C+Ns/Nv5xImGPEgaWZyxuUovOmDUeWvUQfk2UNU1o
         H/z8Qd/0jfyuDcX9QPRGSOj/5fUpSXnrImJlWI4ODW96D8I+Zpmel7ZmWuGjuyBS1hv/
         uJpOLC2xByEeKtbegOrzr5z+5y18Q3bho4nK3OdbuCw2jSJap0SXCN9OWIsidEFt9Nnp
         VjYg==
X-Forwarded-Encrypted: i=1; AJvYcCW4qBbQr9gX8KLWhGWhpX/Y7aE8wXJIrOg5uMoBoDmP44bKodS8jaLWXvl51coObAwccA4YYpA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHEW/1nCMNq7JYWFMPTNs164wn3vuF5hPdGy5cgKUKaqCf4VBl
	xmxhqKEK/cWH8DaHRtBc4/9dHWRmNRRK/gkwFrtpNg2hT07Sj5bbH329+N+jQaGKMEk6MPEH5rt
	InfFv5lA/uIGaWDC05mS3rgOO8gQpbQecReWIoo/IqMjx3cariYt7zzb42dFU0Lms
X-Gm-Gg: ATEYQzznXrhwp+TPRTn8g3uhxzYxtD4kAXn5CYRZhV/HfdiEZWyHDNHcCXfCtFBXSP4
	TnprZuzXbpOEmrLgdsGACMu7ZjHnGC3oq1ZaegLQ1tZGVIrZ2zSxbFibKbpRWq2EFeFVeOsepy1
	p9la0pM9ebUedFChY3UDDugRhxELQKP20WyNEka02TdZZtmoeCwRLpkCwyoMb9bSpt4ywbbN/SV
	oXHtA2L0eclfDHSmybmRvlWiHpLEPI2vzjD60GDfIQcGxhzyovlNX9SrgOIoX80/7NU19UByGRX
	Bmlhxv2I6jP9nDHtTO2zNHruomddt3S8r1WSU+9eg0IZ9/0oVclwRnWvcTO31poj+hCPSjWw761
	597pOrOFQIgOhCvnwQfloUDdtyovJT1bh9U0X50geFMSLfbvP3jLob3EmuEnewGJOQ5uWN+zh9s
	AtamqTzYaTKoqtTL+uYu0=
X-Received: by 2002:a17:903:46c7:b0:2b0:643b:41d2 with SMTP id d9443c01a7336-2b06e3fe574mr55296195ad.47.1773888466652;
        Wed, 18 Mar 2026 19:47:46 -0700 (PDT)
X-Received: by 2002:a17:903:46c7:b0:2b0:643b:41d2 with SMTP id d9443c01a7336-2b06e3fe574mr55295965ad.47.1773888466150;
        Wed, 18 Mar 2026 19:47:46 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e441374sm41024405ad.29.2026.03.18.19.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 19:47:45 -0700 (PDT)
Message-ID: <47c6626d-14aa-4410-bf75-6720d7673eec@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:47:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix channel list copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260317-fix-channel-list-copy-v1-1-5e1e5ae1c5d5@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260317-fix-channel-list-copy-v1-1-5e1e5ae1c5d5@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VdfQ1hqsiPoxKIvj4EJ2xOsj7IHDbLP6
X-Proofpoint-GUID: VdfQ1hqsiPoxKIvj4EJ2xOsj7IHDbLP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyMCBTYWx0ZWRfX90ZZI1NeuKuB
 0AD5k0GlqF6WvehgBaiQv1tChg6C3TqRt+qzeRrCKvGABJuXP7l1V2SBQ41r16dwhXmYjlIa4Xu
 siQ0h5cq98WLpYDw5hH2AVFMMsZ/uRBPIBeW53aK6iVvKJOA1dyU+OwX764s0T6qGFf/IhMq4gb
 KN0r1x5hQEJla2n0wUkJJu3UqCJHaynokt09RTaWuBRIaPDxCNU2dhDb0Kz8H0x7VY+3G5yLTvC
 L4DO5X+oDOSnjP8kdZmkmi688yoB/qtE1cFAfpidqb5ABJVvGBaTmFOXMIcVK0kE+Ly+6cF6Wr7
 2ZIkhX/hLTUzQ2nBTxW4ZPsXgyHCZ1ATDnZaEUBtEwZfDwqNKRo21+3mvkGVrdepO1srZLoHfCd
 dtxYhm8UQ9sSUjzT7YtA5ODLkcJIpRORkFqFEhUsz7i5PvOCgu3vgYbZkZlKoZ+EHxCUElZUnzL
 MFEN/KdCCfbKQBeIcBA==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb63d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=ywX3x0iTvHv4trEmZJsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_194749_043105_C1C48375 
X-CRM114-Status: GOOD (  17.28  )
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



On 3/17/2026 8:54 PM, Alexander Wilhelm wrote:
> The ath12k_wmi_scan_req_arg structure defines the channel list in
> CPU-native order, while wmi_start_scan_cmd expects the values in
> little-endian format. The simple memcpy causes the hardware scan to fail on
> big-endian architectures. Set __le32* type for the tmp_ptr and swap channel
> values to support both architectures correctly.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 65a05a9520ff..9e1d3c662852 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2571,7 +2571,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  	struct wmi_tlv *tlv;
>  	void *ptr;
>  	int i, ret, len;
> -	u32 *tmp_ptr, extraie_len_with_pad = 0;
> +	__le32 *tmp_ptr;
> +	u32 extraie_len_with_pad = 0;
>  	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
>  	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
>  
> @@ -2656,9 +2657,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  	tlv = ptr;
>  	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, len);
>  	ptr += TLV_HDR_SIZE;
> -	tmp_ptr = (u32 *)ptr;
> +	tmp_ptr = (__le32 *)ptr;
>  
> -	memcpy(tmp_ptr, arg->chan_list, arg->num_chan * 4);
> +	for (i = 0; i < arg->num_chan; i++)
> +		tmp_ptr[i] = cpu_to_le32(arg->chan_list[i]);
>  
>  	ptr += len;
>  
> 
> ---
> base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
> change-id: 20260317-fix-channel-list-copy-cef5cad24fb6
> 
> Best regards,

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


