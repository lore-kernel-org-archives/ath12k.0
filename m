Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A601FD7F6F
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQkT5daBDycOyMQTG4OEBBlhjqWgEkfRjFH+U9DTcZQ=; b=fwZWYiGkC3ScTZPXTDhtTPvrYe
	UKXfWome3eBEGobridJcse62H0zoNEbc0u/YKRE90jC5txKh02LDziIPEcQh3ds03wbOmlGZOeuCw
	HQZliYfYrHhDJQcFMh9vQSz7AErDCTXG59UCOHj/uIUvW7YwUDNxHHz43NF4/G3ZMz5TRHlXCJNnR
	qBFCwkbZpnGqW8h/k4QOm/c53LejyXwr1gjzv9e48RV7dtS5xSB12Co62GVMD1rRQH+lnbzCrIULq
	Fgzw/rTTcwbD4eNjJa4aWX2ArUUkcgbAG0TJ+iEcZv5VZhzvqD/jXrqSpbJ3NIj6g/bFBplvqOgPN
	Da8lm78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvv98-00000008Eq5-30xD;
	Fri, 27 Feb 2026 10:32:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvv97-00000008EpL-0iiv
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:32:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R4GZW42663263
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQkT5daBDycOyMQTG4OEBBlhjqWgEkfRjFH+U9DTcZQ=; b=lkpXHIDZHzzgNT2s
	B3nAO5yIEDkfj0Ym+tr5mtEfwsq0n8oAaoFfG6wHN/2KF0FsCfsU3e3SKF+L45ye
	OFmc/BZ/risD0WvGFsc7hd7w6T9W0xi7KZweNyYDcR/uvLDUOPQFYp8ZA6uAI0A4
	BP8WA9DJTi4xQy6aiqOwCr97dzLjImCPQTopdJJq1HbV736rAOJTLGsH2yp22NC1
	sgik9loGnGios7iAfsBn170XL5+oCpHLF9G4UhGCBFMrhsN/Ora+PGav8NoccVa9
	09ENgaE4mU8YmeZ4M1+gVXX2JKaioRm4XMrIdcioKgdyMXMYWAdSTVeE/8Eb5ER4
	fPqmAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43r94bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:32:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso8377393a12.3
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188352; x=1772793152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQkT5daBDycOyMQTG4OEBBlhjqWgEkfRjFH+U9DTcZQ=;
        b=REJpc6zg1f4ZPTXZtjKUkFwNlGmSDyCJFjE/Xhej7UXll8Tn8SXgS5uNDH6tod3WKd
         X7Ks3F9p3YSJjbwhmwHUQTSenaQNQRdnwEjNQNE/deZfgT4QisBhaNVs0xyz+ucsfcdY
         9+Md8EExqmt5PNTbXl9pofswRQEzURISEsF4thuCNwz14Je4Dx5mg4oGm8F0mWx9ZgK/
         9UVP/aur3kMpx4R1CX3I2dXBwtdCU+8kCw/pm4vLzGYZDu3YlMPOJFlPxUt3r47Uob3S
         vrgiTUGKW1M/4i9mdXRifLcI46zpC+WzBGKqdhQePfqFIpuSYqu4FZG/PMdbFEZrMsIw
         3ETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188352; x=1772793152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQkT5daBDycOyMQTG4OEBBlhjqWgEkfRjFH+U9DTcZQ=;
        b=PGmbyu3YY+IhS+Dolb9ltVmhe2S45sRgYvTADxj1YtDKHCVeM47y8Yo8tcjyPJ8tho
         AC+Td+XdP3iBOdbK/EtOobUyWzUj72ritHoeev9+Kpa/iH6h7wUZCoRmYQL3LDHiAj8m
         3IlVcMJEp8SiCkWBFHYt1YiGWPABdO1pUV2fgObF1EtMMRbHYMrbAlCOH4wiK//ZaJua
         EdtY0NZUNtzZ/zUssP4tak/YCsnS1tnXIhxyWZAYstUD/Geuf/s2R8FxLTKF6uXWmj1a
         8sPB0MM2Y6GUQIRpLMG8buP+gpi3uKC0ab3lVgRoXt14K+wiuLjZlWSH4bdHCTXJ09Ge
         Pjfg==
X-Forwarded-Encrypted: i=1; AJvYcCVNqXHqf7PU+nOEh58mSHI9iZ5UdOBF+vNjbgh2JtR1G+ttfxW+IPxb26sPjUt0lVCKxGfiU4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXW1jNCrj/eqaZ9ZSABFMT+HEyzYg1A3QXCGIpUdLh/mcAiKaj
	sw2S77TFEKRYOsqKIpa8N/At1xI6kcE4hyIZEf0tTeOdw6lTQrMTIlJNm/3zNBrx6dH1yWOSl3f
	e2G23VHyhvNBosntm2uRDDtUTWQ7ttGY/duZlclaDsdZolq+HmIcJzqFymGdhoHuUB9XjcInb
X-Gm-Gg: ATEYQzy2Jonv39qbhqRllFDL/0Hhy9FsN3E0Ogwo0YBfRtJ5RUs1fYTJu4rJxms8F0p
	yDDPnZiab8pyP4r9sQb7BoGJ/wMInN85UhxuiUeaK0RVm9sg+mYgduPEkHN+S8FfbL1nfGjN8VY
	jZtjyx7tcwGWDZMVc2NiVZki0gK+Ji+v6cTRNYKgpKt4LyY+juiL9IVwy5tkiDycr9MwhhqV0Pa
	nuT+DTGBLpKanyaEccjBmR6//+7o/1+Qiul640qPUnO7SiYolK8iWy16PLQtxsfqVQwS5+JFcNN
	oZvxCrUASfFJFTiV8akard6Pu9hOY3gLpzGnLCHHMF20gGbYyHnUjkxM+X721wdJz5Ti/DJUM/o
	EJkdX81lFIocgKWHj7YsSRzrQdejgnbfA0D1z32EX/qmMY3m7YiEtvfbxM/4ZYH7kbyw=
X-Received: by 2002:a05:6a20:ac43:b0:38b:de3d:d52c with SMTP id adf61e73a8af0-395c3a1bc3bmr2134901637.3.1772188351732;
        Fri, 27 Feb 2026 02:32:31 -0800 (PST)
X-Received: by 2002:a05:6a20:ac43:b0:38b:de3d:d52c with SMTP id adf61e73a8af0-395c3a1bc3bmr2134882637.3.1772188351219;
        Fri, 27 Feb 2026 02:32:31 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa3756dbsm4150790a12.0.2026.02.27.02.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:32:30 -0800 (PST)
Message-ID: <8b9a8d78-dfdb-4ddc-aba7-e1f9065c3fb8@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:02:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable monitor mode support on
 IPQ5332
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tcl7Dbu06kw9cx1XFVZlpa35PcPyIusi
X-Proofpoint-GUID: Tcl7Dbu06kw9cx1XFVZlpa35PcPyIusi
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a172c0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RW0mjsVknEAIwFTJWnUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfX47Ks8jnC9tV7
 ZOzwzvSxWKQQW7UjpCgEiuQ2nWFlzp3YjPDPipWi+e9N+bMWANMiFHtLVsAbbay9tvU6S5OFfnr
 PhOAM4IVs+P5cvwL5x4JEKvyfF97+5fLaapzTax40y6DCDmuzWq7AX/ucmRLbCHDzSxx7Av5Baw
 te71I+bRjKbThS3PBI4ZLMr97Af5D1BQ5YDEW3sPdHD3AZJFEG1j1UzyNrxyXOcxQcqgatuJU+r
 0WKmjO4mnwQxIuSEDzL2iKNFqI1/h8s7Uqa/PyPnf/quABx1Jr6zZ450annhH6hb1+8hCdLxdbP
 59h6+ameLGmb77zqVO/Z5Gk0qcZFIsYjRHDmJ0IaU3edgLfDlHO30podjLsXo3x0341/74wF/jH
 WChsSq9nWAPNW99BtrX191Khh1YywXnz40g7FLKzfJMlbdaAzEs/Omp+WNNHd/EHhDhzIioZ9X+
 bqOzLbEvfBZ6HhEM2jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023233_216487_B3D78AF7 
X-CRM114-Status: GOOD (  15.88  )
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



On 2/27/2026 9:03 AM, Aaradhana Sahu wrote:
> Currently, rxdma1_enable and supports_monitor are set to false in
> IPQ5332 hardware parameters, which skips monitor ring configuration
> and removes NL80211_IFTYPE_MONITOR from the supported interface modes.
> 
> Set rxdma1_enable and supports_monitor to true so that monitor rings are
> configured and monitor mode is enabled on IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index df045ddf42da..27acdfc35459 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -617,7 +617,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
>   		.svc_to_ce_map_len = 18,
>   
> -		.rxdma1_enable = false,
> +		.rxdma1_enable = true,
>   		.num_rxdma_per_pdev = 1,
>   		.num_rxdma_dst_ring = 0,
>   		.rx_mac_buf_ring = false,
> @@ -626,7 +626,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>   				   BIT(NL80211_IFTYPE_AP) |
>   				   BIT(NL80211_IFTYPE_MESH_POINT),
> -		.supports_monitor = false,
> +		.supports_monitor = true,
>   
>   		.idle_ps = false,
>   		.download_calib = true,

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

