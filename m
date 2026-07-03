Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E01CC43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwnRVOxgKogi71l6aiWlYjqOlv2v06YgcWQWPZimHNI=; b=Q0jF0SCFjMi2+U2l3hv8vcY3dp
	jA/eq/dW1Pzme/i4o9RaXJSyoc44tnS+jFh7VZWk9twTKWsaeYva4/WH7H79Tkcc6jmQYPwHAmfub
	lDavVDYuWLoaoyLK2rLnUTA/s5NTjWh3KrG848P0lRfY/gYJ4GcR3Aui8Xix2Sy/4qzpJePCfHDke
	s/3P6rjEyDAW5Mne8Iw2li1NpNaQrrXoibt9yy5RX/cdNUcpRsHykWHLetgrYOgxGkldQ0RG2VDfO
	oWSmBh7lV3/deJlKpXEK9LbqmehaRL8E615wTlVlcrqRDejy88Gc9gkg4j0iVxPpuAJeu69KkIH1A
	BCcUMERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZ6f-00000006LVX-2iBC;
	Fri, 03 Jul 2026 08:18:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZ6d-00000006LV8-1ltK
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 08:18:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635riqs2994900
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 08:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwnRVOxgKogi71l6aiWlYjqOlv2v06YgcWQWPZimHNI=; b=kmxcBCvyMaU/p+kB
	zzhEgZ4vWZgVc2/mt9f5A5HP/igM3oFqpfHBsS9G2827jXqzw2aRmY0fwivmmvOt
	Kbz6VcaZEAknQfvfFjIYke7BARBbnS9RyA59Xwpwt3hAjJUKNODzjgenYMpUu0XQ
	XoHXW3Fbp5NxXi3UFM2Xtg33Y/tdFVGXIGXM4HTQe6B1FHQ76GSZUWOF1JJg/h6v
	cvQlYA/dZ7mTkjunzLh1K7grMzTUMsM5DzOKOoHwaDfb3vz7tsCZH/dmALnH7KFx
	fmv2ayRJpzosYP5i0CRjVL8dBr1kqrqaHQAFGIrmbX238dMrT+rIy7QQPFdOHRce
	QqFFwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1dhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 08:18:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so504006a12.3
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066717; x=1783671517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwnRVOxgKogi71l6aiWlYjqOlv2v06YgcWQWPZimHNI=;
        b=YasUfvnPL8mCOdS4hR3EQNVJiLgo9oTBWz4eaDo1PlMNpi9lP6BTQBOJKbXEuRAjRV
         zwTPRUjS+dS9DUMT3LJVg4bqN4JqvWV0m+pEXC345NhwN6dW24quOx/TNNwOyPf10DpT
         xPhOxwWqDSxAejIVqJHlCvIQlJ3Hnn8QyfTz6kV5+8tjyfQmm0pm7PPncTu2CUV0GIAf
         BIrv0yqy/mRY36kGKVD3Gn96jiEoKZpyaee6UQ2/D0izjFvDlHSzPN4jZ/sx7WUaMJlC
         i01Tbas2p0pTq7m5opygy8W2DjkLBOEixuQHqMRR1gX1AtkAFCBAUpGJlxuzNvoSvxky
         kHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066717; x=1783671517;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwnRVOxgKogi71l6aiWlYjqOlv2v06YgcWQWPZimHNI=;
        b=MIUQSAdVLt4ECOBhJtozwvLeToJfnL9q728GvsIJPB72Vbaywe942p/eUseZjcS+1r
         1RokO4ZguZ6xk8dWQw8GoTZhomB0h15mwbG4Z7LtC8uhq8GNfrToP0vDuOCwnhMajtYb
         6d+sbIhPzndBjIdguKkMTlelr+ss6mF9VMNrh4NCuRa40jm4qW2ibfWMUZKHvqvT2yiF
         YZ+pc1LAZ+/f3iVWUj9oenvelrS1ssPmxK7fb4WpKOv8QWQuRB4y9sh4NVX/C3r5uHUY
         L9PWu1SUf/CgEvjUI9weHi2SK4/pEI6/J2a/RkyJy+yHbHLqGZnK0hTZ7Rt7jwI182Ex
         /ojw==
X-Forwarded-Encrypted: i=1; AFNElJ+zYCCXG8g+ppzRWF2MvSI3zr4aE3pSFKXdPCHh/PFCn2/0WJEPwE0NMzRgT8Lx3g0T4tajT/o=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq7Dwmxd/5nWQz2i0H878Nw7zyB2mO+DH7Rgy8cqpWVBVHLO7l
	pSt0Kpbgqh+zdBAO0dMwrsDQ3KvqrbjolWKBN+sCEeobbveY+16YYWPnxWXeVkx7AMVWv0o+sot
	P+pZBPw3cS/NA91/2ETO9XC9KrIcn56rOSAx/cUwruA74AxTXKBl3XC0YYR8uVcwpWZIwptCd
X-Gm-Gg: AfdE7ckPQkPqWFfT83maIAW+fjitBX8CMr2scsQi/KUIjvQOh1KMo5HKTZONrPAQKhe
	s5vagTmZXf3mmZt9tlBZR//uQC/rikfAD8/zkuzs3eVOmskXUssvmXFoNLgNuOG1x7G79tiDE6h
	hUSEr2aCiQHAnsTAyArLH6PK1yYtDhjxrFdjN6pjrdWgxKiFk/S+hTKRIIjFd7TZPLu/cPn+4f6
	jcBev21OEoPIXXwT+X7sXjP5cr2tK96mWpy+cuFt/X2NZnVxuJNqM2skjHxVUb6e/xtT+L+8jER
	bmIoEWrUUcYoDrTlXKWGrLswL5XWIbfOdYC0gaKhYuRnqWzzsDJ+XTtub+Q1CMvDvsbwTeihx3T
	v0O6QR1VrmYdvGcN6bcCsAGrFvkKuw7gqJkls8752JpKjVQ5QadvVbiFq6YFERW0jws/c7D5tUr
	FzQlxk04XM
X-Received: by 2002:a05:6a20:ae2f:b0:3b4:b2d7:c146 with SMTP id adf61e73a8af0-3bfed2a2cc6mr11509193637.21.1783066716809;
        Fri, 03 Jul 2026 01:18:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:ae2f:b0:3b4:b2d7:c146 with SMTP id adf61e73a8af0-3bfed2a2cc6mr11509150637.21.1783066716310;
        Fri, 03 Jul 2026 01:18:36 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ec6bsm2322108a12.7.2026.07.03.01.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:18:35 -0700 (PDT)
Message-ID: <afbff608-a005-43c4-af76-968a58bf0cc3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:18:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix scan command endianness on big
 endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX8LOsdTp5aUOD
 h4NbbdjOieU+k+fhmv1RRe7yaP5x+/U4sUuuass5gLMDiFO6ou9fw+o9eSpYTtfgMmxyw39CehW
 ZjP1Hm78/vKignrlq3VUmzD6JqyqEZo=
X-Proofpoint-ORIG-GUID: PFFAPrgJApdDQ4HqxXaXJXMqLbgp-CX4
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47705d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=BEeBCuFZ1JbOFoEgvSgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: PFFAPrgJApdDQ4HqxXaXJXMqLbgp-CX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfXx41Q8NQGSNEN
 Gz9aAiFwkX+olaxtif88Dutp4G4wkDyZtYTGzrqXL/Ck27tA0L5stWcNhTDTxzlOO+QFvlF5USD
 c5vMIlQwk9paQ5UvgyYLx2iGYhJW9jG3fNk56U1YlvKZQ0cowTEoNXZBhtZGrVZ7BDKg8e3TGvZ
 qUUr0CpURBOSQ3/iLD1+DA1oaflWPFRNdcdNmU3UiwwX7oVi/h+OAsWTOSsC+dgBqzdlv5Mj05F
 Tm95O+K4lwiHNZhc8AXX38FMXixV3tYmJXz3wt7GWZ1B3I8ZYCbppGRnqMz9JLXAhxagVYRuLIZ
 CcJNtTzPSkFO8yxfQQbfUk+attEuCoxXnMUNfYEVSxK+aZDFjaqF0SP32jGDJiPqjOsyplrHDM/
 dA/mJtoa9kteGqGZyZJJH1hNAlIDi9Mclx7nt1ESY1gmRMDJj6/ByK/nRxcIwSK+lRmUdZGn4yC
 JogHaCrnARFVCnuV76w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_011839_606387_B693994F 
X-CRM114-Status: GOOD (  22.82  )
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



On 7/3/2026 3:35 PM, Alexander Wilhelm wrote:
> ath12k_wmi_scan_req_arg stores scan parameters in CPU-native byte order,
> while ath12k_wmi_send_scan_start_cmd() writes them into a WMI command
> buffer whose contents must be in little-endian format. The existing code
> copies the channel list and writes s_ssid and hint_bssid related values to
> the command buffer without endian conversion. As a result, scan requests
> contain invalid parameters on big-endian systems and fail.
> 
> Convert the channel list as well as the s_ssid and hint_bssid related
> values to little-endian before writing them to the WMI command buffer. This
> preserves the existing behaviour on little-endian systems while fixing scan
> requests on big-endian architectures.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
> Changes in v2:
> - Rebase on latest ath/master
> - Use additional __le32 conversion for s_ssid and hint_bssid related values
> - Reword commit message and description
> - Link to v1: https://lore.kernel.org/r/20260629-fix-channel-list-copy-v1-1-5ab826c46d7c@westermo.com
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 20 ++++++++++++--------
>  drivers/net/wireless/ath/ath12k/wmi.h | 10 ++++++++++
>  2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index ad739bffcf88..4dab6eee80a1 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2637,9 +2637,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  	struct wmi_tlv *tlv;
>  	void *ptr;
>  	int i, ret, len;
> -	u32 *tmp_ptr, extraie_len_with_pad = 0;
> -	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
> -	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
> +	__le32 *tmp_ptr;
> +	u32 extraie_len_with_pad = 0;
> +	struct ath12k_wmi_hint_short_ssid_params *s_ssid = NULL;
> +	struct ath12k_wmi_hint_bssid_params *hint_bssid = NULL;
>  
>  	len = sizeof(*cmd);
>  
> @@ -2722,9 +2723,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
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
> @@ -2780,8 +2782,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  		ptr += TLV_HDR_SIZE;
>  		s_ssid = ptr;
>  		for (i = 0; i < arg->num_hint_s_ssid; ++i) {
> -			s_ssid->freq_flags = arg->hint_s_ssid[i].freq_flags;
> -			s_ssid->short_ssid = arg->hint_s_ssid[i].short_ssid;
> +			s_ssid->freq_flags =
> +				cpu_to_le32(arg->hint_s_ssid[i].freq_flags);
> +			s_ssid->short_ssid =
> +				cpu_to_le32(arg->hint_s_ssid[i].short_ssid);
>  			s_ssid++;
>  		}
>  		ptr += len;
> @@ -2795,7 +2799,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  		hint_bssid = ptr;
>  		for (i = 0; i < arg->num_hint_bssid; ++i) {
>  			hint_bssid->freq_flags =
> -				arg->hint_bssid[i].freq_flags;
> +				cpu_to_le32(arg->hint_bssid[i].freq_flags);
>  			ether_addr_copy(&arg->hint_bssid[i].bssid.addr[0],
>  					&hint_bssid->bssid.addr[0]);

the src and dst are wrongly swapped, should be

ether_addr_copy(&hint_bssid->bssid.addr[0], &arg->hint_bssid[i].bssid.addr[0]);

However since this is a pre-exising issue and not related to endian handling, not sure if
we should fix it as well in the same patch.

Jeff, your thought?

>  			hint_bssid++;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 51f3426e1fcd..52e6068d9a64 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -3556,6 +3556,16 @@ struct ath12k_wmi_hint_bssid_arg {
>  	struct ath12k_wmi_mac_addr_params bssid;
>  };
>  
> +struct ath12k_wmi_hint_short_ssid_params {
> +	__le32 freq_flags;
> +	__le32 short_ssid;
> +};
> +
> +struct ath12k_wmi_hint_bssid_params {
> +	__le32 freq_flags;
> +	struct ath12k_wmi_mac_addr_params bssid;
> +};
> +
>  struct ath12k_wmi_scan_req_arg {
>  	u32 scan_id;
>  	u32 scan_req_id;
> 
> ---
> base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
> change-id: 20260317-fix-channel-list-copy-cef5cad24fb6
> 
> Best regards,


