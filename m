Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6DCC3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 15:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ch0BYBwSZN5KXFGrDCxm1IpVItg6AEzdyvHnT6AfyU=; b=jsIzjOdbbYInxVU6zXHXmkkLzC
	qQuyDV/I5su13zHQszOZiG+ceS1twZepXcX49txaScjtJS6dNUSjfQjb/IsSXTYGSuqq6eLWvpwXs
	4JLiC9eVXkINHnIpUxPY/7bQdQ5ITe7/hXSjYnSuvNJfRBRrJ+FLH1f0qQrrm9nAzon7pRGZ7F/MW
	+TE+DFW1mIIXZNT8EFmC8p5Z0CBRwjfGqY4Gh57ElThJ3yrW06MJg0MBiQ864zW2e8wrnM5O6InaZ
	3GHC+Dh6w16q1HB5PXyMldjxlWGV73G2u4g1jgUnSqF+7E7sIzxlb4rQJSpIvw2UVr/PTNI9y99/T
	Pwj2xTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwj0-00000003njG-1dAO;
	Fri, 16 May 2025 15:11:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwP3-00000003jHr-3co4
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 14:51:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBkRTE032604
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 14:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ch0BYBwSZN5KXFGrDCxm1IpVItg6AEzdyvHnT6AfyU=; b=O3d3BJn/2q4ugIal
	t/vAI1TUHWnLK+8C+cqeWybg0HXH3gOp4T8Bxn9/jG3fwVk9Hxz8yt5n0+BFzYb7
	ejPc0F2YiMgwhUabmwTMskCploHa5INOkqVBe38BnMYNz7HtcQ651unTsz8UU1O3
	ArWXXp9VkF1/SPWRdB9APnIiKwdacm+VJQfV1OFUautq0X0vKQs1utO6Zfam178i
	6X3aAL7IEkv7s9bCWzwo0ckInaAp7KZDzKLNTUV252T+XqIghB3bO67tVt1FdDLb
	af40HP1tLe6rL5FaT3rzdxr3nXVWHvBp2rT7a9TcYMuzDMZJp30b9olE3kTOSaIZ
	cXE+ng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp27x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 14:51:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0ae9e87fe2so2630128a12.0
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 07:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407071; x=1748011871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ch0BYBwSZN5KXFGrDCxm1IpVItg6AEzdyvHnT6AfyU=;
        b=r7/sjPoJ92fxvvu6ReaPTh6psTb5u/SQvUptGWuJ8EH6pssk50OqfWd7QoIdGSJJKI
         cs1T1Xp+3aTc/I0r+mCQPArf52JZSXKYEawXUhPforWw6QkqxtQau4CS/ZiP33bzIT9R
         o+pytqhdhUDLLdZ+3C1IBnwSo2ix2qaObaiu7XU7ivxfTsHp8ZmnYBp0LK0z2K4KFIZ1
         a5mUjsaQCMDKUt5kwUOJE0YKNWgH33q4ep1x7NwzIxAYTQ1MgHIXIoPDI7cB4upgB275
         d9/i3m3bAYDNz+B26dWsbNx5/RohJH2hS2p3WRafSY6js3bhfvqyAEgLjCvuTTjvQ4nf
         SPyg==
X-Forwarded-Encrypted: i=1; AJvYcCWj+2RNPQQpFu8YfM4KOGu54EJgJenVSP6WgNIwBUrtJC/LQyNLkgzRuPPJy7SpLbn3MM6OaqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKfc07sFCfLizYlg9ut/7eMxty9BxkNPYY9Uxry5Gci+dSyUGX
	ps9Fgh3uxyyagehxwrD4oXXXZ7XuDlPQe9cH6clFASgjoU2rVxT5d/5tQKhPsSaFum5wA9um3q6
	F62KdsVKCbdbfgiiLweij73oznEWiF3In/NEYQ7I6TiJgeKvmBPLIDVFBn4RNXG4E
X-Gm-Gg: ASbGncv2GPIAQ0rEVAxFBqs/xW+Nl/TjUzAq+XG7bCVCywQrfHUcL9KXCtZY2mgLV6a
	o+eo1fEH7V4fwzYtlbowpHx1E+C7GJyZ7Et3H/4OkbIhwlWbUAwV55GpVFuuh2SUgQL40o2t+0s
	W4fOhRAIX67RqmG4bvN/MP3BZT4fy+4rlnr7bixiPHVuMfKsdxwlDsctk9Yob3NXkV57wCRKirl
	BapgpXH7eGxA8eqlNflAksQotXSkPZnzkAbeV9wEbFX4Gt8aNHagxO8xdSSyrkiWWh2tvxy8MmC
	yHvZ+w1Xw5td9AtRHx3OGtFkgEXe7F+Kb3kBA5LukCkOOYxQOfCWp7tNkz6zGA==
X-Received: by 2002:a17:903:2391:b0:22e:491b:20d5 with SMTP id d9443c01a7336-231d4eafb92mr44472145ad.26.1747407070857;
        Fri, 16 May 2025 07:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41uGVPM/WG1xEbUbYIeUABAxvP4p+9qesBcCJl/FXidzWoV+dxou7/6C+oR6dLx8Hn1EVOQ==
X-Received: by 2002:a17:903:2391:b0:22e:491b:20d5 with SMTP id d9443c01a7336-231d4eafb92mr44471735ad.26.1747407070393;
        Fri, 16 May 2025 07:51:10 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0f5sm15098265ad.192.2025.05.16.07.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:51:09 -0700 (PDT)
Message-ID: <eb376c5e-3805-4ce4-a1d8-60ca1d5d5fda@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:51:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
 <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
 <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
 <57e04b5a-9f04-49bb-8a7d-978276e9033f@oss.qualcomm.com>
 <951203c6-44a6-4fa9-afad-6ce3973774ae@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <951203c6-44a6-4fa9-afad-6ce3973774ae@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NRAgWB3EPMMR-kOGVxUza0uEBIFSBnJo
X-Proofpoint-ORIG-GUID: NRAgWB3EPMMR-kOGVxUza0uEBIFSBnJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0MiBTYWx0ZWRfX/bzRHmvB6CHP
 A0DsTpgZs+fNJ20911f2ClYnTeFywR5ydt87URiftDUIVKLnWog8gNXhgClAmZPCFxCW8zLyLId
 U30rNIBfjiXhzLbuaO6SaLHG+g5zWKL58WKEMJDqF7VpQUh6ESWSheappiXqTPfiwu4wKxK3sNI
 AmD/vIqMvh52bYlSX0BlFIfqwDg+yr1/vGDM2LZyX6Q+hrdyKoiP9J1+IF++TJLk9lzuIEcLPwp
 JaUPOjYwjR6lnMeckkq4leszRNAU+3VvxjNa+WE0D0sph/nM6F0EiWrQftEwFkgpJV2NuzOaCfR
 BNmEgZWywh9RCywXhQpyBoUB8/ByGrNNC0RIYjR5CY0D6Pyy+w+HSq3NK/k7iuPj4ChNcIbUYE5
 xCmzoIlEcuVokacrvvwYR18n0SstKqi9ugueeoS0/UQRyMBmwf8u8/GzM9lH6NSyWU2EbJuQ
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=682750e0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=la5BVXO8aNgUUJlq0p0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_075114_015618_9F224125 
X-CRM114-Status: GOOD (  29.54  )
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

On 5/14/2025 1:17 AM, Muhammad Usama Anjum wrote:
> On 5/13/25 8:16 PM, Jeff Hugo wrote:
>> On 5/13/2025 12:44 AM, Muhammad Usama Anjum wrote:
>>> On 5/12/25 11:46 PM, Jeff Hugo wrote:
>>>> On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>>> allocation because of memory pressure. There is a report where at
>>>>> resume time, the memory from the dma doesn't get allocated and MHI
>>>>> fails to re-initialize.
>>>>>
>>>>> To fix it, don't free the memory at power down during suspend /
>>>>> hibernation. Instead, use the same allocated memory again after every
>>>>> resume / hibernation. This patch has been tested with resume and
>>>>> hibernation both.
>>>>>
>>>>> The rddm is of constant size for a given hardware. While the fbc_image
>>>>> size depends on the firmware. If the firmware changes, we'll free and
>>>>> allocate new memory for it.
>>>>
>>>> Why is it valid to load new firmware as a result of suspend?  I don't
>>>> users would expect that.
>>> I'm not sure its valid or not. Like other users, I also don't expect
>>> that firmware would get changed. It doesn't seem to be tested and hence
>>> supported case.
>>>
>>> But other drivers have code which have implementation like this. I'd
>>> mentioned previously that this patch was motivated from the ath12k [1]
>>> and ath11k [2] patches. They don't free the memory and reuse the same
>>> memory if new size is same.
>>
>> It feels like this justification needs to be detailed in the commit
>> text. I suspect at some point we'll have another MHI device where the FW
>> will need to be cached.
> Okay. I'll add this information to the commit message. Currently I've
> not seen firmware caching being used other than graphics driver.
> 
>>
>>>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>>>> index efa3b6dddf4d2..bc8459798bbee 100644
>>>>> --- a/drivers/bus/mhi/host/boot.c
>>>>> +++ b/drivers/bus/mhi/host/boot.c
>>>>> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller
>>>>> *mhi_cntrl)
>>>>>          * device transitioning into MHI READY state
>>>>>          */
>>>>>         if (fw_load_type == MHI_FW_LOAD_FBC) {
>>>>
>>>> Why is this FBC specific?
>>> It seems we allocate fbc_image only when firmware load type is
>>> FW_LOAD_FBC. I'm just optimizing the buffer allocation here.
>>
>> We alloc bhie tables in non FBC usecases. Is this somehow an FBC
>> specific issue? Perhaps you could clarify the limits of this solution in
>> the commit text?
> Okay. I'll add information that we are optimizing the bhie allocations.
> It has nothing to do with firmware type. I've found only 2 bhie
> allocations; fbc_image and rddm_image. So we are optimizing those.

There is a 3rd allocation, and it has everything to do with firmware 
type. Did you miss mhi_load_image_bhie()?  I'm not asking you to touch 
mhi_load_image_bhie(), but to recognize that what you are doing is 
specific to some BHIe devices, not all.

> 
>>
>>>
>>>>
>>>>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>>>>> fw_sz);
>>>>> -        if (ret) {
>>>>> -            release_firmware(firmware);
>>>>> -            goto error_fw_load;
>>>>> +        if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
>>>>> +            mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>>>>> +            mhi_cntrl->fbc_image = NULL;
>>>>> +        }
>>>>> +        if (!mhi_cntrl->fbc_image) {
>>>>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>>>>>> fbc_image, fw_sz);
>>>>> +            if (ret) {
>>>>> +                release_firmware(firmware);
>>>>> +                goto error_fw_load;
>>>>> +            }
>>>>> +            mhi_cntrl->prev_fw_sz = fw_sz;
>>>>>             }
>>>>>               /* Load the firmware into BHIE vec table */
>>>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>>>> index e6c3ff62bab1d..107d71b4cc51a 100644
>>>>> --- a/drivers/bus/mhi/host/pm.c
>>>>> +++ b/drivers/bus/mhi/host/pm.c
>>>>> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller
>>>>> *mhi_cntrl, bool graceful)
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(mhi_power_down);
>>>>>     +static void __mhi_power_down_unprepare_keep_dev(struct
>>>>> mhi_controller *mhi_cntrl)
>>>>> +{
>>>>> +    mhi_cntrl->bhi = NULL;
>>>>> +    mhi_cntrl->bhie = NULL;
>>>>
>>>> Why?
>>> This function is shorter version of mhi_unprepare_after_power_down(). As
>>> we need different code path in case of suspend/hibernation case, I was
>>> adding a new API which Mani asked me remove and consolidate into
>>> mhi_power_down_keep_dev() instead. So this static function has been
>>> added. [3]
>>
>> I don't understand the need to zero these out.  Also, if you are copying
>> part of the functionality of mhi_unprepare_after_power_down(), shouldn't
>> that functionality be moved into your new API to eliminate duplication?
> This how the cleanup works mhi_unprepare_after_power_down(). Yeah, it
> makes sense to use this function in mhi_unprepare_after_power_down().
> 
> Sending next version soon.
>>
> 
> 


