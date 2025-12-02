Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E571CD12663
	for <ath12k@archiver.kernel.org>; Tue,  2 Dec 2025 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=; b=S5tWdt+jJeOf9v9MCrBFZ6ADyh
	7lIr/lODH3Cq4SJOfFW94tiy9GSjz9MRxz3eyIRO6eEWhHNuIQtaYu77a23snOHRwNetGsEF3HI0B
	BUj2aMBwHhVdiVkILWcBSw/CALHDKZcVBfYTHYI3VvmJUNg3PMqVP/HIzEb4bZ2leZDMWiE0u/HoX
	0B/jKSpINwIR8bYx0+1fj8dkk7OnFbKtaGJIn+OzfjP1WN6btzulmtxAloM8VpbD0t4P2sfE6d/f5
	x0rxhycJhGE3AWr6o3nltnboMdeyIJAZwOQG32KUu/fSKMFYmSL/1nwdOMCGFLCZyt0803CS5rsLE
	njlFXXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQVW0-00000005jr6-2bsS;
	Tue, 02 Dec 2025 18:54:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQVVx-00000005jqO-395r
	for ath12k@lists.infradead.org;
	Tue, 02 Dec 2025 18:54:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2Hueur1358489
	for <ath12k@lists.infradead.org>; Tue, 2 Dec 2025 18:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=; b=ALp3ckUUHlsHUsdj
	Rd1Y+DpvI04kJ61unC51UMChiu0za2yA1ERP2mFmpDlUkoUiv5Vkks9h/CAxDv9Z
	Bb7RoRwwVX+a6QISn3k0Z1JCKio3aOivY+iGtWSAmE08Q3s2ujuWAEHzaP/NQU+2
	dzv8cX+a3SvOBmV8IGTalQwjsryIcQIDYu9TtvWGjOPikNZFGHlFJge2hfayX6lw
	hUyvHmcvErgD8FQTJsufNfgdCcpHiT2M9Wn3zNF/Of4N/1XTOhcZ1ARD/mlkD2ca
	I2NzufK2phGwtwEvWTnN5K5ew29QZwaV79xx/wktR8/AQv1heEN1uoiH7Q3QOY8j
	ao4/hA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asp63k5ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Dec 2025 18:54:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982b47ce35so65238465ad.2
        for <ath12k@lists.infradead.org>; Tue, 02 Dec 2025 10:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764701655; x=1765306455; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=;
        b=R+nPPYFuHgGFLyEDbOoIs5gDdf/aU8Y2FmRYEgj3V6j8tYivdWsmQv60stcSvvy7DF
         Px6eoPt+Fp0OWCGA4AsA2K+kzv/7LCoQL9NSR3uZnXTfunMVhyYHC8VF6/N9YtDEW40x
         s3KBx8F0gm6Lh5NCGlfPE8M00xt6efI3k776JI+WfCLtXzO4dv8wg2n5eBwo1e7eF7Iu
         VoCesnghKmAEPNPhlHM9Gmi3HMTdh6sZoV4TKz3VIpnUNDjcL06/cqMYwOxBBeTWtWO7
         V/N7atOreMPh/aRDwHEto6s1J9NeE4cHuUOfXqp9nXCb0LxEnkZZvkfoTv5epOmIymIj
         7MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764701655; x=1765306455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=;
        b=iH4PCMclELQmG9UNw3ydeCrrcCO+c9Qil2DJTWW9d9ajYo3Inw+LlMIKnDOwLdGNXE
         73Rq1t3ycFoMRNGY6WaPTGQXPSEEQvkav/jCzGzoBYKzgj1zA+craMtHDd3Re+vFVLMR
         MUdFxjm9QIpWJeL2+ajHHaRQM3qS58PFQ4DohwGU9OX+ngFD0zd3Y7F3NYn0o8vxIML6
         Jn6Vg1YQJhnoDNbnKwONijUNAMwcSxrE/ZPliJOk91QsdUZ0qU9omOwSyRdnZL1z+Clt
         GShTrnjoA1mQvsQie7Z4Gd+CzYz0LNBS2Cs1WpMe1JrYDPDr0dGq8UFnA4bbwZ2fo8h9
         XBGg==
X-Forwarded-Encrypted: i=1; AJvYcCUlDIa1BrxtoBINO/yvd/CcLN3hMQ1oa0PhPlD7Dgt4HN6/LHm/zMGtYaYqI2c7qTjh4/NoK+g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwU6Cx8lAaSwrvAaU7Fs1cPnvm3Khem4i0PB+3sW6zPimViEljL
	/R8wXWBwKl1Bx2ld20S9DNzxHAGglO7Eby/ddjI6Oel0FGzjo/xrq0rMzFh0436pQf1JcetHuN4
	jqD7oOWCQUAKpG2B3MclcTZzdcLJsaABVSZCxK4CbY4tLVVy8mkh5vpjiQjXp6PtY
X-Gm-Gg: ASbGncvyKzXFSOBRBh441IXTtsx10gd4bjXBWQ5iucRjuMK7vA5bjIyUvuZq+fZYxu2
	9d/rqlDvaV6w9bCoz2tUrKjsI8+c+nZ3Rk2QXQOdB2hCpkAzAEB/MxuQRiagorv2Cf2E+YkCcf6
	UZVcu/DZdcSyy6JEg5Dn4NBxjHo2cAkKA3w+78Rille/q+ZJpoMe+kfj+jdbrSLefU+ajlJkh2I
	bfZ9RSfYJ0KKAvOVAZZFR5H8Nty+Z9rjjJhBHhXAJEM+HoAjyWIU0XoVYWCNJrI8jtTZ+eoHs/N
	w37mhpmOvK3AfCAaL4AITI0ZwkdtyMhhEUqX8LQ12ZNf+jKapuCqiExisB09vMzxHLJlSgEr/Sp
	R6wz84VvS3uxL3qvmPTM0s6I+20gnyy5U0OF82/uwGloTb6J5xJFQyMZq
X-Received: by 2002:a17:902:cf4a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29d65dcf153mr3194975ad.31.1764701654703;
        Tue, 02 Dec 2025 10:54:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ/RzWsFhuxc2+iwjgFwfUTjpK4qX1voFjw3XyGlKEHTYHR3nxGS9zclRDNjBfyGa0y30Nkg==
X-Received: by 2002:a17:902:cf4a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29d65dcf153mr3194655ad.31.1764701654151;
        Tue, 02 Dec 2025 10:54:14 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bd96307ebsm136616815ad.36.2025.12.02.10.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:54:13 -0800 (PST)
Message-ID: <cb5cfffe-dbba-4da2-ac1f-de4a9a31f057@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:54:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
 <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
 <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Sysu2oIBGqb977ZWTJhV95hWO3FODxjU
X-Proofpoint-ORIG-GUID: Sysu2oIBGqb977ZWTJhV95hWO3FODxjU
X-Authority-Analysis: v=2.4 cv=XM49iAhE c=1 sm=1 tr=0 ts=692f35d7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PkJSjolnkn3GvNMOFesA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0OSBTYWx0ZWRfX39iHIHHKtJMA
 oF2WSS0pR1U6tlFrS88k7OYIMNvHPU+tyMcxiHElPQywE5W7+7+CzFJW9X8/lPoyNd+BCDXSgJD
 BhbPWbYQV5V6Ilg9YmzxC1C7mK2mGsEfQ9q5eEaWwLHG0kojxlVD2qlYCNYYSaNd3IuMOiv1D2V
 gnjZLOxBkupgSp73QM6qVt5gRL7Lte6B+cQE1x5UODT3Q787KJDfjEwzWxuREe/MkTp3x1wjCQ1
 w29uyEWY917jR8rgYYUCjCXZJGxPpgn2RoGchVT+zBhbBPAJJ1rM/UPrGi7/yFKLKaTCcBSI7Zy
 P5gPwXatHvtx1MpmUntuSLY16RCmYMoOt4aoo3Qu0wr7WGZXg0BYHg8PJJ17fKq68Fx2GM6vfK5
 A/gCFHCj6eSGqz7Qfppi9ypJyHOlZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_105417_825745_DC8DE7E0 
X-CRM114-Status: GOOD (  23.94  )
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



On 12/1/2025 9:26 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 12/2/2025 12:03 AM, Mayank Rana wrote:
>> Hi Krishna
>>
>> On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
>>> The current MHI runtime PM design is flawed, as the MHI core attempts to
>>> manage power references internally via mhi_queue() and related paths.
>>> This is problematic because the controller drivers do not have the
>>> knowledge of the client PM status due to the broken PM topology. So when
>>> they runtime suspend the controller, the client drivers could no longer
>>> function.
>>>
>>> To address this, in the new design, the client drivers reports their own
>>> runtime PM status now and the PM framework makes sure that the parent
>>> (controller driver) and other components up in the chain remain active.
>>> This leverages the standard parent-child PM relationship.
>>>
>>> Since MHI creates a mhi_dev device without an associated driver, we
>>> explicitly enable runtime PM on it and mark it with
>>> pm_runtime_no_callbacks() to indicate the PM core that no callbacks
>>> exist for this device. This is only needed for MHI controller, since
>>> the controller driver uses the bus device just like PCI device.
>>>
>>> Also Update the MHI core to explicitly manage runtime PM references in
>>> __mhi_device_get_sync() and mhi_device_put() to ensure the controller
>>> does not enter suspend while a client device is active.
>> Why does this needed here ?
>> Isn't it MHI client driver take care of allowing suspend ?
>> Do you think we should remove mhi_device_get_sync() and 
>> mhi_device_put() API interfaces as well ? And let controller/client 
>> driver takes care of calling get/sync directly ?
> These API's not only  do runtime_get & put but as also do wake_get & 
> wake_put which make sure endpoint also doesn't go M1 state.
ok here we are doing 2 different devices based pm runtime API usage in 
this core MHI driver.
1. mhi_cntrl->dev
2. mhi_cntrl->mhi_dev->dev

Those are seperate devices, and here we are mixing those usage.
Is it correct or I am seeing differently ?

Regards,
Mayank

>>
>> How are you handling cases for M0 and M3 suspend ?
>> Do we need to tie runtime usage with M0 (pm_runtime_get) and M3 
>> (pm_runtime_put) ?
> M3 are controlled by the controller driver, they usually do it as part 
> of their runtime suspend
> and M0 as part of runtime resume.
 > once the mhi driver gives pm_runtime_put() then only controller can go
 > keep MHI in M3.
 > So we can't tie MHI states pm_runtime_get/put.
Ok sounds good.
>>
>> Regards,
>> Mayank
>>
>>> Signed-off-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>   drivers/bus/mhi/host/internal.h |  6 +++---
>>>   drivers/bus/mhi/host/main.c     | 28 ++++------------------------
>>>   drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
>>>   3 files changed, 15 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/ 
>>> internal.h
>>> index 
>>> 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 100644
>>> --- a/drivers/bus/mhi/host/internal.h
>>> +++ b/drivers/bus/mhi/host/internal.h
>>> @@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct 
>>> mhi_controller *mhi_cntrl)
>>>   static inline void mhi_trigger_resume(struct mhi_controller 
>>> *mhi_cntrl)
>>>   {
>>>       pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
>>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> +    pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
>>> + pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
>>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>>   }
>>>     /* Register access methods */
>>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>>> index 
>>> 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 100644
>>> --- a/drivers/bus/mhi/host/main.c
>>> +++ b/drivers/bus/mhi/host/main.c
>>> @@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller 
>>> *mhi_cntrl)
>>>           if (ret)
>>>               put_device(&mhi_dev->dev);
>>>       }
>>> + pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
>>> + devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
>>>   }
>>>     irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>>> @@ -658,12 +660,8 @@ static int parse_xfer_event(struct 
>>> mhi_controller *mhi_cntrl,
>>>               /* notify client */
>>>               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>>   -            if (mhi_chan->dir == DMA_TO_DEVICE) {
>>> +            if (mhi_chan->dir == DMA_TO_DEVICE)
>>>                   atomic_dec(&mhi_cntrl->pending_pkts);
>>> -                /* Release the reference got from mhi_queue() */
>>> - pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -                pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> -            }
>>>                 /*
>>>                * Recycle the buffer if buffer is pre-allocated,
>>> @@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device 
>>> *mhi_dev, struct mhi_buf_info *buf_info,
>>>         read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>>>   -    /* Packet is queued, take a usage ref to exit M3 if necessary
>>> -     * for host->device buffer, balanced put is done on buffer 
>>> completion
>>> -     * for device->host buffer, balanced put is after ringing the DB
>>> -     */
>>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>> -
>>>       /* Assert dev_wake (to exit/prevent M1/M2)*/
>>>       mhi_cntrl->wake_toggle(mhi_cntrl);
>>>   @@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device 
>>> *mhi_dev, struct mhi_buf_info *buf_info,
>>>       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>>>           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>>   -    if (dir == DMA_FROM_DEVICE) {
>>> -        pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -        pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> -    }
>>> -
>>>       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>>         return ret;
>>> @@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct 
>>> mhi_controller *mhi_cntrl,
>>>       ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
>>>       if (ret)
>>>           return ret;
>>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>>         reinit_completion(&mhi_chan->completion);
>>>       ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
>>> @@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct 
>>> mhi_controller *mhi_cntrl,
>>>         trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, 
>>> TPS("Updated"));
>>>   exit_channel_update:
>>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>>       mhi_device_put(mhi_cntrl->mhi_dev);
>>>         return ret;
>>> @@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct 
>>> mhi_controller *mhi_cntrl,
>>>       while (tre_ring->rp != tre_ring->wp) {
>>>           struct mhi_buf_info *buf_info = buf_ring->rp;
>>>   -        if (mhi_chan->dir == DMA_TO_DEVICE) {
>>> +        if (mhi_chan->dir == DMA_TO_DEVICE)
>>>               atomic_dec(&mhi_cntrl->pending_pkts);
>>> -            /* Release the reference got from mhi_queue() */
>>> -            pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -            pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> -        }
>>>             if (!buf_info->pre_mapped)
>>>               mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index 
>>> b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct 
>>> mhi_controller *mhi_cntrl)
>>>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>>           ret = -EIO;
>>> +        read_unlock_bh(&mhi_cntrl->pm_lock);
>>>           goto error_mission_mode;
>>>       }
>>>   @@ -459,11 +460,9 @@ static int 
>>> mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>>        */
>>>       mhi_create_devices(mhi_cntrl);
>>>   -    read_lock_bh(&mhi_cntrl->pm_lock);
>>>     error_mission_mode:
>>> -    mhi_cntrl->wake_put(mhi_cntrl, false);
>>> -    read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +    mhi_device_put(mhi_cntrl->mhi_dev);
>>>         return ret;
>>>   }
>>> @@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct 
>>> mhi_controller *mhi_cntrl)
>>>           read_unlock_bh(&mhi_cntrl->pm_lock);
>>>           return -EIO;
>>>       }
>>> +    read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +
>>> +    pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
>>> +    read_lock_bh(&mhi_cntrl->pm_lock);
>>>       mhi_cntrl->wake_get(mhi_cntrl, true);
>>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>>> -        mhi_trigger_resume(mhi_cntrl);
>>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>>         ret = wait_event_timeout(mhi_cntrl->state_event,
>>> @@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller 
>>> *mhi_cntrl)
>>>                    msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>>         if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>> -        read_lock_bh(&mhi_cntrl->pm_lock);
>>> -        mhi_cntrl->wake_put(mhi_cntrl, false);
>>> -        read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +        mhi_device_put(mhi_cntrl->mhi_dev);
>>>           return -EIO;
>>>       }
>>>   @@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device 
>>> *mhi_dev)
>>>         mhi_dev->dev_wake--;
>>>       read_lock_bh(&mhi_cntrl->pm_lock);
>>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>>> -        mhi_trigger_resume(mhi_cntrl);
>>>         mhi_cntrl->wake_put(mhi_cntrl, false);
>>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>>   }
>>>   EXPORT_SYMBOL_GPL(mhi_device_put);
>>>
>>
> 


