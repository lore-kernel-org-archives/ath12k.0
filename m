Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C1606A330
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xuxt2MYh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RzvF3R6b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KrQofYlY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=; b=Xuxt2MYh1OhUfM
	IoGE84WARcqJIKSifgemKGTWIvo86OZkhAiUpJ+fo38QuSqUnFpHObAPbwbsYU6YLpcF91q0CL+Ua
	PyaJ2kJ6beqf92BLAokcXmsYp2SEOvK+sckorhQ2fMRYFXmPcgJx2Vn8D1sYsil9/l78/Rv20eVt+
	zHHQ5Nd3YuKpLxg6tynBZfRSFyi6QdSgq0KZmgNA8Uuxl4MnQm0V85HFvBHgJ00ByIdeLJDcatv7k
	lnHf15qFgl0/wwy6X24+HT2vWuyYJFdLuB3TRNxNi7SDlKap4yDyD/EZtnVpO0tbl4or1ZDEGVaOu
	88XNtidP6RNnkPGbnFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaeh-000000086Ig-0G01;
	Wed, 18 Nov 2026 08:04:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaed-000000086HG-3TVA
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:04:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwI12602462
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=; b=RzvF3R6b4G1KVhWk
	3AQI4qjpD+PaHjvYzu1uKVXQrUCNhmuoRYuO6Rqu8m7s7mM8nRaYBYxcx4hOgVBL
	wNZ1on2jv2jcsnfOa8m+ctg7Vez8iMvMin9ltA1nkm7nwmo1PecV4tVS/B6nv6Ze
	JlAi/YSev/3j5YHMmwB7yslr+W0L8cXjxNasUAlKZh+pT7fSWlLPia3y9/XAujyF
	IvX1iKc8XaqnbrsG9B/hqb4hCcHZ2nUg7ViiHXqSqYl7/dIDuaUKF2kfdjGIczrD
	f4mnuyEQ6/mkyZ2AFH8rYHWfeYuNoigspuZ0HzUliDRf4WQ5EU83mv8z9spMSW45
	I2I1bA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71yef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:04:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065e2933fso976452b3a.3
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989070; x=1795593870; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=;
        b=KrQofYlY8DBlvDwJhMSmVU4EdHG+RjvCTNHlmHQMDMZp0/N6JYslLcqUWmTutKjZws
         jvpZFpVtqTDcJh+zphkX2wA8JzoEyltDHx/0rMzD6BOM4DSx7UKKTp0DWzHZMY8LQSSy
         ggaPjX2ytpdSs8G4FST8OufKl6D3huxMJ4UtGUoJxoeRZbLq/2W4H/DQ8PcpA6+P0JaF
         HJ03rlc0m6rBluHXvDETMQxEoEnICo9TmsNQ4mFELe1rXcaRE00xJYpzdAKZYFA5fbYs
         OQAvDBZe005SESEhZi2RiSWn5c6rjVFBJJ6RRnKFhXdWtCCN5mAI1wxlCdD6LHXwUcFR
         Ch/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989070; x=1795593870;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=;
        b=m2cdhRm3/2dXBviR79TqB5cg8Mf8Ij0sCOjKaO8Tk9MhpWjD9PfJYD75Wnbg9sPcoB
         DnhvYKSx0WWnW/8vfz1TrrrEi9AvjyCmMgF/CuVJ8/OjdtfNg/4SJIdJORFhYWjYmX6U
         zGHEu6nUcIhM3TdU45spTNQTsCYUiZ2KO96fz3G98M8bAauG6D4QHhUK4vBT6Yr4Hr1F
         jOCUwrhZkAM8vEmJQ1AqIodgJyJlCXzxmNDLiD9xVDbj5ucJ/DZWRc44NX9Y4ChQa3XS
         CVbRtAyctkGI17SWUp1I5aQbi9ryZuDiqJRDYOI5ssagHkAODfZtRNp5Gm1ZcStpqdMQ
         IdsA==
X-Forwarded-Encrypted: i=1; AL+hErFKsMd24JD989rJvP7OLx/hOaOT2alODrhw1m4/BadNG4+C3B/nR8Tukm0/1B9pGK62ILgw02A=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ojYusEYvemCiqSc4rD637f07ZuXM5SbdvihrsFePEHz/rlRJ3
	SwM5YAdntZ3di9x+GGa97kozYN4YQlt2/ssCjlnkrLTigQ4FqZBL+XB7Nmq9qf+TVgFxHHp/e+j
	lwzP9ZECvCpGPx+e57PI4VOPF8wg6gjNPdQB7NzO8qhLDkStXPaipjwIrBsz4f2NR
X-Gm-Gg: AYBFou2Z30ILeiCk+lRBCH59b6uyV66WaCE4O+Sf4UGytpnsvirnN+Jom7TfUO8NO7V
	zqw2hHeIvym0Wwlb4KCXYmVeZD6Ve/sbkl4qV/1+5SS0mbSYy/d5J0TzrBR+7AbNBhZLn/Mt/Ol
	h3q6ysegdERNAlkQVq/a9LKKyppYIrCGwkA+IzaXrLofLmWtCComVSQi9Vh49t3ltQXUPf7r/2O
	prNdj6puANMtrL1c0NUnCOyExwaSQNbZlLWZvUeH+KMGTBe6pbhrjwbjBhY/VU/Snhm+a1Ig+Ef
	RKv4nOv23sv62MBfoDsNT5pSqNtZ95SPn1OFl5nfGgn4dNCGFnbt7olH9ChIF64e+bTkJ1/ZErS
	Z8f+DkMSQ2BWo5soW4SlBW3fdt+qXsV7bUHXe507s/xfIRAVPKLZUfwOvjWN1+aLO8dR8lr3I8v
	r+tk8No5YnD7piBGoN0qWHrJM7/r7Huurd8zfjvRceXqp90A==
X-Received: by 2002:a05:6a00:4c92:b0:8a0:4493:50b3 with SMTP id d2e1a72fcca58-8c5cfe8d666mr1680901b3a.2.1794989070378;
        Wed, 18 Nov 2026 00:04:30 -0800 (PST)
X-Received: by 2002:a05:6a00:4c92:b0:8a0:4493:50b3 with SMTP id d2e1a72fcca58-8c5cfe8d666mr1680865b3a.2.1794989069662;
        Wed, 18 Nov 2026 00:04:29 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93c255sm750578b3a.46.2026.11.18.00.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:04:29 -0800 (PST)
Message-ID: <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:04:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability
 TLVs
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118012321.2861920-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118012321.2861920-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nRgoE4L_x9TOToXEqw2IJCD0jFVkP2ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX2FgLdVMKVWAY
 uwqMJcZTTXWI72zuf1u2WClKW+H3LRh2M7bB+d8tjuQFGNN1Gup1j5a5U4AQyL+pDfls+LA2eDi
 jXyNAwSVsdsUMmbVIOdtLhpVVkeDLYJsSEuUn9hR5JLw1TdzUUxONTptmNolqVzjDKysyfWvP9g
 9SO8MnWc52jIiPvhYDQdodkTiduOEVscDzry4iY88TEOrA7+mlWsSOf/TtAhl+HrY6SKB76Q3M3
 33VZx/qKX2Z3AT0dyzOZWL03hOEcjqLI4vhPlP3xKd8E8AvUVTduh7CZ488fZLU2T8FkS6JcMX6
 6Ez0hHolDeRK9YrTacYPr2KGJaz9JP4gx57Gk9RPuGhH4FkRh4BE9j8dDSwzq6uKRfpBGM4R3Vl
 V8YGzUTOdSFBCVegvlu2/7pStJgur7OleDm+90jNXYl0fQbZcHVu9jHg7O78XtZe8jLjswrrtgn
 UrCOXz67zN+3MmxWKAQ==
X-Proofpoint-ORIG-GUID: nRgoE4L_x9TOToXEqw2IJCD0jFVkP2ae
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd5c0f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YjeMgbq9AAAA:20 a=apydtGMFAAAA:8 a=YzE7GG5PtzhQLXrrimcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=_GdCGhGMWlTvChih0T78:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX+f2YbWWx76+X
 r/DuJ6m4uNaPZECuikDhlvjdEg3Jk8TQjn/FHLmNv46Wxci1obYSOQ9Qg+Ovc+eJZS8w/bER5gJ
 aW1O9N8oBvXOOCzJdwSOhUqFGeTJnqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000431_883163_8D82F513 
X-CRM114-Status: GOOD (  28.71  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 9:23 AM, Jonathan Wolf wrote:
> The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> therefore points to an inner TLV header, not directly to struct
> ath12k_wmi_dbs_or_sbs_cap_params.
> 
> Casting the array pointer to that structure reads hw_mode_id as
> sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> partner-link deactivation.
> 
> Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
> unexpected tags and payloads shorter than the capability structure.
> Use the first record, matching the vendor host extractor, and leave
> the cutoff at zero when the array is empty. Only store the cutoff
> after the complete array has been validated. This leaves the existing
> hardware-mode and link-selection policy unchanged.
> 
> Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
> patch to Valve's matching 7.2 kernel source. MLO advertisement and
> radio-mapping diagnostics were enabled separately. The cutoff changed
> from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
> and AP-side data counters increased on both links during traffic.
> No driver recovery or association loss was observed during the test.
> An unmodified upstream kernel was not boot-tested.
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-parser-live-test.txt
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Tested-on: is not an official tag so we usually have it at a separate line before official
tags:

<leave a blank line>
Tested-on:
<leave a blank line>
Fixes:
Link:
Signed-off-by:

> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 75b259990..f43c9a359 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
> +				       u16 len, const void *ptr, void *data)
> +{
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
> +
> +	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> +		return -EPROTO;
> +
> +	if (!*first)
> +		*first = ptr;
> +
> +	return 0;
> +}
> +
>  static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
>  					 u16 tag, u16 len,
>  					 const void *ptr, void *data)
>  {
> -	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
>  	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
>  	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
>  	int ret;
> @@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
>  		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
>  			parse->htt_msdu_idx_to_qtype_map_done = true;
>  		} else if (!parse->dbs_or_sbs_cap_ext_done) {
> -			dbs_or_sbs_caps = ptr;
> +			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
> +						  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
> +			if (ret)
> +				return ret;


better to leave a warning before return


> +
>  			ab->wmi_ab.sbs_lower_band_end_freq =
> -				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
> +				caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
>  
>  			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
>  				   ab->wmi_ab.sbs_lower_band_end_freq);

to follow the convention, would be better to move the sbs_lower_band_end_freq cache and
debug print into the parser as well

> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index b508aa759..94bb6854b 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
>  	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
>  	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
>  	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
> +	WMI_TAG_DBS_OR_SBS_CAP_EXT = 0x400,
>  	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
>  	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
>  	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,


