Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70113C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 02:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KC4xQUr0JgE9MWl7+34AveAP7lvWSVW0npuxnAQ4r48=; b=02Pgyir+q35vOWfS1j+ocHxjC0
	H3/pPPWOjZt0bPfa9ae4q0iUZSsfoIVL9jqkV+CDrXO+W8SeSix7xrsfshEWUi4BtE+r4KNNDbfGk
	JuJNqggxsyktPWT0sQ7Dl3mJIBGglnQ2RDnxlOaf0tCLKghlZQDcW0XL5mQoOBVMi26xWpYVBPJbr
	sxssx65GsJy1rMHH0/wQhCxo63paEElJbVkctzrfxoj6OxFjQDuA0k2vnfUjvTFVx+zF5wV0bzHEM
	FZP7a7xTwveGoSNkUnRKfTs9063Y54NC0gaEO8F2iF29j4YPABonJmfN1E/j6wWz0dTe9BL/Z6Mpe
	v4ZZ2Zjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTwz-00000005uBt-0Vjv;
	Fri, 03 Jul 2026 02:48:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTww-00000005uBM-0xb7
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 02:48:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66319r4h2339780
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 02:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KC4xQUr0JgE9MWl7+34AveAP7lvWSVW0npuxnAQ4r48=; b=U4ds7hK+qS+ObUqF
	KZXK1TCtawscb0ePcJNX0rymkgSF1rVj7oGv4fgjt9e0ZNsCoP9Fi+WQlN7iKj9d
	8IUxW1veUhFTPMmb2evYDythDJAfxP/w3H17zsZ2h4dq3eIJe3LiC+XDaUgvxuq6
	3/xOdy53xLGjv8A9pEYE019MAI2GzbzfZuqTMNam2LGsV4+rVGGUjNBWh2Neg0mv
	wQwRhHA0U9fJx1/rO1SPFWD1dFx+1RqkGZLQcwjsPDzRfcWepLQOBUY4NfpohlaZ
	EGmXOoW4V/DSVs8u1zKCKceUD8k2Notq+dJm51+m6wDwFn83wxmdDBhh8SvobHK4
	24miow==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey8qcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 02:48:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a483ea41so154698b3a.0
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783046896; x=1783651696; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KC4xQUr0JgE9MWl7+34AveAP7lvWSVW0npuxnAQ4r48=;
        b=hIA0wcx3UObpn5fqy+P8uM/WcGIGAgkfercTAO8urq5RH1jxBxyLRr4GcexWaLE/Rb
         YaH57vBD2mXx40a69ke4BCK4y/nDBv40sfKkMQ2EIn4evgI+YzIdfukVVbGh0s0wyIFd
         yuHFTkaqwWBQXTTU2xHdMTchS9Vb4IyjvWvanFYw5IYnTuP+tim26p1holTBIy9PCRt7
         IZCa7Pin5hpowyngxOsdX0JAonEb4+d5xeiA5eNVg+TbuyzseOL5lTn3RPKbnul6Opfr
         nJNXuMrDrEFhjrYDTfWv8KJnRLdkz54PHp+NEnTXUNsYyBnsIDr4iPV5YpJ5iVP6LpGu
         7NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783046896; x=1783651696;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC4xQUr0JgE9MWl7+34AveAP7lvWSVW0npuxnAQ4r48=;
        b=R57AkPOvjmYeUrXTG2yWDXGWo+FYpQTghMNgcoWaWiXCI5vC0W8XmO7r3EdQVJ83V2
         BznJmzLZ/wzprwOCSgbqcr4b9MxSdWyMVVDZo92XYBRbMb2uGJkRpvt3JZWgRuuH8QvP
         jgIf6wYc5umuxRf+CXe3nO8KSYUO2wPug8iqFgI44Es1bk7QsyLxPP1SeQAPh/dodNiq
         A+AZmcNnAfI9D1Y74JduyQ4u/QekHdvg7fsiO5Holth6XbQrwC+qnRsUjx9Asq//yl5R
         kDG517vkjysgEkpnkGXaZSr38aT8KpbF2gbA7K370Km9uQxr1XUfxnpevXoOr3zujOnT
         BePw==
X-Forwarded-Encrypted: i=1; AHgh+RqeWeBIo8Z3yRoMz/WLqE8dB78rW4WMjQDH6NXcaKmP/DMTOh1InPB4gM25kgOj3Cm2VXbiJOE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoE9Ib2K7eyNpNpDwVK/48sZh/Zlg1/XdPotI4yAGdpmpfWuSJ
	JmElmqVZD9PaFMIprzWAK5WP6FrdCKqDPeOGL4PMFhiKU2zb6U0Wx1RJbTEDUep8jg/FHVb8227
	ZtjUL4WPCddKD6R/6aL2S01cKl8P8ZiqEDrqYQojGDc1JLLyKEhMj9RX4p/oiWpkh4ZSad9Xr
X-Gm-Gg: AfdE7clDlnNJ4HpQJhzmUsuEpHsm9GvO+9Md5f5GXbHMNMyX0UXZyeq+CuASwtlJbFk
	1QbQGBY+251VOhGGsCCJCo3gQBQ9+imRwifBx3m9btv0Q9MeTP0oP7e7Jy7EL0lChYND1g0p5n7
	/c5knCrpemel3nVP5GT4gozYJu+JFJGTlqiHzH+s+ZTWn9/a9PA+JW/5dpFzAPd9ROTjQepT9BB
	QwefHKbscFtfGeEwDNEvhUL+zH4/EhSJ0x1Nbadp5QA+66bVQCSVxb8y5rl9Nw1esPtIri6K8N4
	upQ3ppTW1hnw7iykj0U2YDFt2qhsEQXmhw6dxupScyhll7WdKerVdufXk8Hvn1Bn/HoEPLRIzzS
	9STpK+a2EdsCoDkYQilVLbqPV4CfVsqYnzRaAJKjBJ1e6Xr/PxQjzVp/kb9Ea4NDdfuK+Qc2jwn
	AUWgq+WCI8
X-Received: by 2002:a05:6a00:419a:b0:846:eaac:a5ea with SMTP id d2e1a72fcca58-847e177a3abmr2024422b3a.3.1783046895908;
        Thu, 02 Jul 2026 19:48:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:419a:b0:846:eaac:a5ea with SMTP id d2e1a72fcca58-847e177a3abmr2024405b3a.3.1783046895295;
        Thu, 02 Jul 2026 19:48:15 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm2251650b3a.27.2026.07.02.19.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 19:48:15 -0700 (PDT)
Message-ID: <bf545855-6568-44ad-95eb-ac9c55827e89@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:48:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix channel list copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260629-fix-channel-list-copy-v1-1-5ab826c46d7c@westermo.com>
 <8b29a6f4-0742-46f3-bc86-defa6e0faeae@oss.qualcomm.com>
 <akYk_pKRd7kR13IL@FUE-ALEWI-WINX> <akZXF0SI8jVky0Wj@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akZXF0SI8jVky0Wj@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAyNSBTYWx0ZWRfXw448QQcC6voW
 NUiYXwwfl3nHXJCkRHTRVh141JjREHWT4WNlHg/2MbnAsJ121BG+hXGcTWiCrDIooub4+SCdcja
 UzUPuGSbP/iOQ/pEsj0YTHnnq3p6pn7eXmBWQofgz85lPb76eJ2t62r//SGtZfN+SPFP+Li7a0A
 wOapVP90RKlM0Qh3YCbE9h4/yn+/TDCdOA4LtCRq6SDq4VkRD20ud+5pUUWITXMug0wMHKl1TCI
 4SUXsz3ze+lWCiKbjSX9vvFYjnm+jqgKCKk6WdLNAfVMWOT5ATFpuYsIlWzldJTuf21QqIcaclr
 yM+Nh4udwFwzWgHznuOJy7+0wrWa3OWnLtMTaAgD9SGJ+i0QIGY2JqBcH1m+9Dl+OmhdIRm4jpE
 OD1GieLQFEu/4/uCc8ORTdNYkf6ehg8QOvZu7CgWToPPQwlt7+V5kiqTfyh2C1cphnhuhEAy+wq
 aC5p0+TNrAX6vhBmAqw==
X-Proofpoint-GUID: 4B1d1x-N_ajNOvEQpgaq0GGfcjeFiMuf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAyNSBTYWx0ZWRfX/7nOUb0HnnSP
 ZIFYKWlMx2j+HAAxmbtqywu/lY6jC04OCivijO33i3J6wbP4qk+qpZA6mEzPIBOzY13JpTJQin/
 VkCktElDPnqUxhjpDt2D37zoJaN8VcA=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4722f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=N9GNhs4bAAAA:8 a=c7I3wfr0XCohLxdBRdcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: 4B1d1x-N_ajNOvEQpgaq0GGfcjeFiMuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_194818_614520_38E368EF 
X-CRM114-Status: GOOD (  24.78  )
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



On 7/2/2026 8:18 PM, Alexander Wilhelm wrote:
> On Thu, Jul 02, 2026 at 10:44:46AM +0200, Alexander Wilhelm wrote:
>> On Thu, Jul 02, 2026 at 04:27:44PM +0800, Baochen Qiang wrote:
>>>
>>>
>>> On 6/29/2026 3:46 PM, Alexander Wilhelm wrote:
>>>> The ath12k_wmi_scan_req_arg structure defines the channel list in
>>>> CPU-native order, while wmi_start_scan_cmd expects the values in
>>>> little-endian format. The simple memcpy causes the hardware scan to fail on
>>>> big-endian architectures. Set __le32* type for the tmp_ptr and swap channel
>>>> values to support both architectures correctly.
>>>>
>>>> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
>>>> ---
>>>>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
>>>> index 65a05a9520ff..9e1d3c662852 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>>>> @@ -2571,7 +2571,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>>>  	struct wmi_tlv *tlv;
>>>>  	void *ptr;
>>>>  	int i, ret, len;
>>>> -	u32 *tmp_ptr, extraie_len_with_pad = 0;
>>>> +	__le32 *tmp_ptr;
>>>> +	u32 extraie_len_with_pad = 0;
>>>>  	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
>>>>  	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
>>>>  
>>>> @@ -2656,9 +2657,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>>>  	tlv = ptr;
>>>>  	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, len);
>>>>  	ptr += TLV_HDR_SIZE;
>>>> -	tmp_ptr = (u32 *)ptr;
>>>> +	tmp_ptr = (__le32 *)ptr;
>>>>  
>>>> -	memcpy(tmp_ptr, arg->chan_list, arg->num_chan * 4);
>>>> +	for (i = 0; i < arg->num_chan; i++)
>>>> +		tmp_ptr[i] = cpu_to_le32(arg->chan_list[i]);
>>>>  
>>>>  	ptr += len;
>>>>  
>>>>
>>>
>>> seems hint_s_ssid and hint_bssid at the last also need the endian conversion?
> 
> `hist_s_ssid` and `hint_bssid` are both structs within
> `ath12k_wmi_scan_req_arg`, and the remaining member variables are also stored in
> CPU order. Therefore, it seems wrong to me to perform byte swapping at this
> point. What I actually need to swap is the data written through `ptr`, not the
> structure members themselves. For that reason, I could also use the `__le32
> *tmp_ptr` approach. What do you think about that?

Maybe I was not clear. I intended to mean the ptr:

@@ -2728,8 +2728,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
                ptr += TLV_HDR_SIZE;
                s_ssid = ptr;
                for (i = 0; i < arg->num_hint_s_ssid; ++i) {
-                       s_ssid->freq_flags = arg->hint_s_ssid[i].freq_flags;
-                       s_ssid->short_ssid = arg->hint_s_ssid[i].short_ssid;
+                       s_ssid->freq_flags = cpu_to_le32(arg->hint_s_ssid[i].freq_flags);
+                       s_ssid->short_ssid = cpu_to_le32(arg->hint_s_ssid[i].short_ssid);
                        s_ssid++;
                }
                ptr += len;
@@ -2743,7 +2743,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
                hint_bssid = ptr;
                for (i = 0; i < arg->num_hint_bssid; ++i) {
                        hint_bssid->freq_flags =
-                               arg->hint_bssid[i].freq_flags;
+                               cpu_to_le32(arg->hint_bssid[i].freq_flags);
                        ether_addr_copy(&arg->hint_bssid[i].bssid.addr[0],
                                        &hint_bssid->bssid.addr[0]);

> 
> One thing I am still unsure about is the use of `ether_addr_copy()`. Can I
> simply copy the bytes as-is here, or does the address also need to be
> byte-swapped? I could not find any place where this address is being populated,
> so I am not sure what byte order it is expected to be in.

I think you are talking about ath12k_wmi_hint_bssid_arg::bssid, right? For now ath12k does
not populate hint_bssid or hint_s_ssid members, so bssid always remain empty. But if we
are going to populate it I think the address originates from userspace and there it is
passed in byte steams, so byte-swapping not required I think.

> 
> 
> Best regards
> Alexander Wilhelm


