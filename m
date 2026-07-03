Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDC3C43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO7KICiImDQj+zRAbCrWa+noymeXncMxP471XfTA9zw=; b=ZpmfjAJSk6o3mB4LUcL8u7OBHg
	qrKfQlCXZMnhjgJoFZMN8mxpxznGd4/PNLG12SspjJPi+UVrFtheejshZM1BsIZAloEMrjPajeG2J
	Oh8ozFBFsG3qO3H62OrsF3syWzP7QLFMwsLiqdyZmAm49PRo5iqI4oQhfa5PtW2TfqIew/7Uj6Y0i
	MniCc2lpv6e0YBCI0A0A+Z8I8FWGxvJIQIEgP1cLLBXGfjCYnNAQFE4Q89nppraZhMExAhyse/CZG
	6A0Iqa1GnHiatRFP3QQISRwmyQ5BkkJtRnxldpxNXfvaIwfutfKXO91gPeMnkQ2R2URC4qBnnAwLy
	FseaLiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXRZ-00000006Aaf-3G9P;
	Fri, 03 Jul 2026 06:32:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXRU-00000006AZn-2uLL
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 06:32:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rjus3123373
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 06:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FO7KICiImDQj+zRAbCrWa+noymeXncMxP471XfTA9zw=; b=mni1d88LddJO7GFp
	ZamOkCkFhH5oFFyPX9TD9C97S+l4jeBvUmF1BB1OOkgYVI/pac4jLiqwGyMKw/7L
	Y1L78lOvKbLOdcDpxYZaBH2aHMMltXyESpc2DqTCPVeF7wYj3eAA07NyS/nuiV1t
	7eIlSzYOU+mRn/kENkKDVdU/X/xhhvz/EIjUeFlHSTe1V8KvxifHoOZaKeXMn3D3
	eoAT2Lal439+3zXlxQFv7u3ytQlcGyzn96hpC+NtEe5vx9V7GZ38SO0PZaAgV6W8
	NoOM54lTQYwn/UXTUVera4bXdvt8F5Xbp/UhvdU/5bbvwVk1ixDC+z5eNgoyYRzv
	tBwJXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpbynf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 06:32:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a20348ceso3647365ad.1
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783060323; x=1783665123; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FO7KICiImDQj+zRAbCrWa+noymeXncMxP471XfTA9zw=;
        b=C9BX6d7qaT7HwMcnGBEBq3Y+1XFOlgpSqa5wUKopLam7/02dA8MCymuq4Z6+pFpQUw
         p+K4YswQIs05Tm8Iu71z27rrmAXx/LcLql9LvQ4oR5xbq+gWYA+Uu48c4gWCth25wg9r
         h0MLhqJl9zr7kEGdI+IyRWMIwyR1u4bXaUh3fg4nkZoXLAA04yPcc/wy3HnltUy+5QyX
         Ud1pV6U+PdSOcZ4n4IAa7p38788caGbfuPkT/GY3CS9mM4X4+lj1TKuZjFT3e6UI/f7N
         gj8z2l7e+Q/6LyU0VOvC8WCGXocONucQTlIuacuWfBWbNSCiVF0XfMPNyt7LyMmlmMxJ
         kvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783060323; x=1783665123;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FO7KICiImDQj+zRAbCrWa+noymeXncMxP471XfTA9zw=;
        b=LUuJaZZqsV8VCbu4H4EEk15g/6RaGlers1XY83vddoDIY+6h6h1DHAw1bDJkU8fe1e
         X0OIJJiv1QMJgRR7fRNlugJ2BKCfjM0MkXbdCWQgW/8cN5oS6yDcq0bP81jG0E4Lk8IB
         4mzioRMEFAe5yNOlo+vVTah5//0/hDY1DNKuw9dcfDqfw2Zynlyvw5QzoEMsfl6mbMsz
         BQ7qL73klrqhPLU2Kc2BMP2ybq9e7wgNtyWprXJqVDxywsCjPPa/ZS+gHVd70KUhBILw
         5YYZa5OW/ESKJMSHyT5w8IlUj0x7SvqX67LZ1R5Rq5fxhGIavaBpu3GhsOmLTNGpBzP0
         1VeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMOKBhKhX6QNndS5tK1ETj3iz5q5X5rqc9RIPBQUdQXdxp8S6RLrD/h5J8LstVZJjdIu3A/lA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc6QvxE1N5f10nyg3K0dqu1KpoYO1X2sNiSlYZsn1fdVm3uJ41
	noDDaV8YVBXGDPjigVqtB/YiaWwFw08mcZUK5K2UuncYtSXrARlRmvJLL4w+G+oJPOKaC76Dmtu
	YcHLpBWTL4TGJAKFRy0xXe2yf3rJijo1SazWWXAxPqCJGh/n4qs1d91/U1Hz4Rpwn
X-Gm-Gg: AfdE7ckjn5b7Wqw8+9bWLd58uXstPfOWJ7/QPnhGWolDNkn8ly3iEDv/WH1TUrZf5ae
	qZBDu3XPA61vEyVhxFxRp9cmiPMvoiA0qgxTz8HPCGBOa82ZJFnRWkWWWuEp2+h85ihSGwXK6x1
	nSMRbCpoliqSoRJLgaXEggKGGhyjwAnxD6rFDK8g4xNBH380bk72sidFd92v8hr6lfpHe3TOG6P
	hZDYu+S2gHf3k9iZ2xBssHP3cMaEFvauAcaFH0VMTLyROmUyBrk3Ewhde0rCE0VJ/8Ws3JzRBn9
	8J8oT/fO44n18VTo+VFlnOOHrRg0g9YLN/eROC+2wr6lm3NFx85u3yNhLQJDA0BYoYw73BwH8Eg
	VLo0tIYQIDh05XUEHGHJ7Sk/fh+XHmCS5O+0JGmUucAyIAHsk1yRZhAMBaby4sSBJje1XO3mEaj
	oDPvnd9uns
X-Received: by 2002:a17:902:db07:b0:2ca:d658:d88c with SMTP id d9443c01a7336-2cad658db54mr15623965ad.32.1783060321665;
        Thu, 02 Jul 2026 23:32:01 -0700 (PDT)
X-Received: by 2002:a17:902:db07:b0:2ca:d658:d88c with SMTP id d9443c01a7336-2cad658db54mr15623645ad.32.1783060321152;
        Thu, 02 Jul 2026 23:32:01 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7894b20sm4356225ad.78.2026.07.02.23.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 23:32:00 -0700 (PDT)
Message-ID: <95319952-645e-49b1-904b-599e22ecd429@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix channel list copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260629-fix-channel-list-copy-v1-1-5ab826c46d7c@westermo.com>
 <8b29a6f4-0742-46f3-bc86-defa6e0faeae@oss.qualcomm.com>
 <akYk_pKRd7kR13IL@FUE-ALEWI-WINX> <akZXF0SI8jVky0Wj@FUE-ALEWI-WINX>
 <bf545855-6568-44ad-95eb-ac9c55827e89@oss.qualcomm.com>
 <akdNdQPM2jdbMvgf@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akdNdQPM2jdbMvgf@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA1OCBTYWx0ZWRfX6KVBO49otqsa
 HRJaRY/wFpAKWsOUXrSVVws/4381ECGWb+28nUZrP2TNIeI1wZ6x0WYK77cYrfmPk7WV0ycLz+x
 Xnh1CBvMpZ7zXylITq1KWqHisXaOIWY=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a475763 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=N9GNhs4bAAAA:8 a=OEorHgOQthOkk5lfAioA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA1OCBTYWx0ZWRfXy9L8wIbJQN/5
 s4U82cft9l0OPyEUpElGgG7ZUtiRJya3xnemaOmCWnUDtbUZsLPUgEsfyy5meaqz3EecvRY/akk
 8K3swBUe6sg8fR/Wms2pvXZrvCdhh+K2fS4YokzpG7x9vknZfqnyX17YDV9UIpq2mx+ClMtEC7/
 lm9e85xIcQYCizCopPiX+Fkp0iJb1Jq2z08ipNO+7Rv+qcixJJ6YJqP+QGyUpPsGPNaydbm9QNZ
 i3xkXozed3gMqom3l4rLUPoskWWh1QXO4hz2TzmxtYM5fCaF1I3vIv1U9jeXCjM8j4Gk7Nn9sRa
 YfvtQe6febnsrSWpiKaTUqXT1u6ZtJvlezCIw+tbPy5Rk6fsttqvCwag3icguqzyd5AHezmcEih
 S7t/wnIiFIHEaJR2bmalzkLhK1IHeXN+5GYzNHOpeQWEGIcLt2PQP+Nznmkk9a0qOo3+DXsuEUz
 Z19a65KWqryUZPCSbSw==
X-Proofpoint-ORIG-GUID: foVVA3xu35y3joT5keiFcX4_iPxBw_4w
X-Proofpoint-GUID: foVVA3xu35y3joT5keiFcX4_iPxBw_4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_233204_873898_908AB2A4 
X-CRM114-Status: GOOD (  30.74  )
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



On 7/3/2026 1:49 PM, Alexander Wilhelm wrote:
> On Fri, Jul 03, 2026 at 10:48:11AM +0800, Baochen Qiang wrote:
>>
>>
>> On 7/2/2026 8:18 PM, Alexander Wilhelm wrote:
>>> On Thu, Jul 02, 2026 at 10:44:46AM +0200, Alexander Wilhelm wrote:
>>>> On Thu, Jul 02, 2026 at 04:27:44PM +0800, Baochen Qiang wrote:
>>>>>
>>>>>
>>>>> On 6/29/2026 3:46 PM, Alexander Wilhelm wrote:
>>>>>> The ath12k_wmi_scan_req_arg structure defines the channel list in
>>>>>> CPU-native order, while wmi_start_scan_cmd expects the values in
>>>>>> little-endian format. The simple memcpy causes the hardware scan to fail on
>>>>>> big-endian architectures. Set __le32* type for the tmp_ptr and swap channel
>>>>>> values to support both architectures correctly.
>>>>>>
>>>>>> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
>>>>>> ---
>>>>>>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>>>>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
>>>>>> index 65a05a9520ff..9e1d3c662852 100644
>>>>>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>>>>>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>>>>>> @@ -2571,7 +2571,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>>>>>  	struct wmi_tlv *tlv;
>>>>>>  	void *ptr;
>>>>>>  	int i, ret, len;
>>>>>> -	u32 *tmp_ptr, extraie_len_with_pad = 0;
>>>>>> +	__le32 *tmp_ptr;
>>>>>> +	u32 extraie_len_with_pad = 0;
>>>>>>  	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
>>>>>>  	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
>>>>>>  
>>>>>> @@ -2656,9 +2657,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>>>>>  	tlv = ptr;
>>>>>>  	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, len);
>>>>>>  	ptr += TLV_HDR_SIZE;
>>>>>> -	tmp_ptr = (u32 *)ptr;
>>>>>> +	tmp_ptr = (__le32 *)ptr;
>>>>>>  
>>>>>> -	memcpy(tmp_ptr, arg->chan_list, arg->num_chan * 4);
>>>>>> +	for (i = 0; i < arg->num_chan; i++)
>>>>>> +		tmp_ptr[i] = cpu_to_le32(arg->chan_list[i]);
>>>>>>  
>>>>>>  	ptr += len;
>>>>>>  
>>>>>>
>>>>>
>>>>> seems hint_s_ssid and hint_bssid at the last also need the endian conversion?
>>>
>>> `hist_s_ssid` and `hint_bssid` are both structs within
>>> `ath12k_wmi_scan_req_arg`, and the remaining member variables are also stored in
>>> CPU order. Therefore, it seems wrong to me to perform byte swapping at this
>>> point. What I actually need to swap is the data written through `ptr`, not the
>>> structure members themselves. For that reason, I could also use the `__le32
>>> *tmp_ptr` approach. What do you think about that?
>>
>> Maybe I was not clear. I intended to mean the ptr:
>>
>> @@ -2728,8 +2728,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>                 ptr += TLV_HDR_SIZE;
>>                 s_ssid = ptr;
>>                 for (i = 0; i < arg->num_hint_s_ssid; ++i) {
>> -                       s_ssid->freq_flags = arg->hint_s_ssid[i].freq_flags;
>> -                       s_ssid->short_ssid = arg->hint_s_ssid[i].short_ssid;
>> +                       s_ssid->freq_flags = cpu_to_le32(arg->hint_s_ssid[i].freq_flags);
>> +                       s_ssid->short_ssid = cpu_to_le32(arg->hint_s_ssid[i].short_ssid);
> 
> No, I understood what you meant. The issue is that the upper two lines will
> trigger sparse warnings. The member variables `freq_flags` and `short_ssid` are
> used on both the left-hand side and the right-hand side as members of the same
> `struct ath12k_wmi_hint_short_ssid_arg`. I would keep these fields as `u32` and
> use `tmp_ptr` on the left-hand side instead of `s_ssid` to keep things
> consistent. Alternatively, I could introduce a separate structure specifically
> for this use case.

Ah, I get your point. You are right, the issue is both the WMI cmd member and the arg use
the same definition.

Please introduce new structures for this. Note ath12k has a guidance on WMI interface
naming: for those interfacing with firmware, use the _params as the suffix:

e.g.:
	struct ath12k_wmi_hint_short_ssid_params
	struct ath12k_wmi_hint_bssid_params

for those host-used only use the _arg suffix, like the existing ones:

	struct ath12k_wmi_hint_short_ssid_arg;
	struct ath12k_wmi_hint_bssid_arg;

> 
>>                         s_ssid++;
>>                 }
>>                 ptr += len;
>> @@ -2743,7 +2743,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>                 hint_bssid = ptr;
>>                 for (i = 0; i < arg->num_hint_bssid; ++i) {
>>                         hint_bssid->freq_flags =
>> -                               arg->hint_bssid[i].freq_flags;
>> +                               cpu_to_le32(arg->hint_bssid[i].freq_flags);
>>                         ether_addr_copy(&arg->hint_bssid[i].bssid.addr[0],
>>                                         &hint_bssid->bssid.addr[0]);
>>
>>>
>>> One thing I am still unsure about is the use of `ether_addr_copy()`. Can I
>>> simply copy the bytes as-is here, or does the address also need to be
>>> byte-swapped? I could not find any place where this address is being populated,
>>> so I am not sure what byte order it is expected to be in.
>>
>> I think you are talking about ath12k_wmi_hint_bssid_arg::bssid, right? For now ath12k does
>> not populate hint_bssid or hint_s_ssid members, so bssid always remain empty. But if we
>> are going to populate it I think the address originates from userspace and there it is
>> passed in byte steams, so byte-swapping not required I think.
> 
> Okay, sounds good. I'll keep the `memcpy()` at this location and prepare the
> next patch version.
> 
> 
> Best regards
> Alexander Wilhelm


