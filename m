Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EACC3ABCC
	for <ath12k@archiver.kernel.org>; Tue, 13 May 2025 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=; b=JPWjw2S1GOtsvx3yEaEh0keyxd
	QmJP+dWTMOrQKBls/b+QFogpP9mL0SU5RqYibeMCTY2pYUrqCKV1Z9v4kbK3FN0zprQfZRrdCyepr
	e2/RSn4ZNm3kwn7l0HgVu96HPUPRA6/d+jqCz5UfIw1Ga9NWhUQGRbxnRuUVC+gwsswYRXoFv0Ymo
	EyrEaif4+iofTBit1lI6BIg5w68Y7a5nPStc4xohSe2NdiFeF/iUGZr9zstuOU3JMdJUa+jcThDzp
	6nVGLzUNS7mhuqgODrmP+6jV9AOri69S+lim4+gqeiczma/dlksxvAsQfgFUgY6XzGcFQ4UOiNGnu
	iYN7H5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErR1-0000000ClCT-30VK;
	Tue, 13 May 2025 15:20:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErNM-0000000CkRN-0C3S
	for ath12k@lists.infradead.org;
	Tue, 13 May 2025 15:17:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDMBs8018056
	for <ath12k@lists.infradead.org>; Tue, 13 May 2025 15:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=; b=LIZas53faEkTAKOj
	U+9+fr4CgM/DHXntykZu+DTxCM7n/wNvla8Yh1M+Anl8FZ44LK2LogmklpCLkpK9
	ONsYCV+6mRfxkfS5hLHXeS/+TSb6/aDAEYnmUKnwjV4PqZYtINQKI75BU66Wo+7X
	s8meOhsXZUR2zSgnWQVCvcnBs7z6wEJ2vf1smom/uOYDRtyQ/cak3+CYZ6hjYzs6
	i5OqptPTI4GG74bcH+w9cX4y1HTJ0C0dikakvsFgpOFvAuyk1PcIJtYMRXp2loFa
	Oat6rwKbqMK0h37WAFX9RGU4Juw/aOaCMdsc2RZna9NpYYng9tp5Se0b8TqUYNtW
	ysBcEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfemr6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 May 2025 15:16:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso4032026a12.0
        for <ath12k@lists.infradead.org>; Tue, 13 May 2025 08:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149417; x=1747754217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=;
        b=SaSIzXxVprG5JHitreDqueMb4nvkx6deKZBZU2Hov07U9Btm971ji6Rr7yTxdO09aK
         QGDyrf3G6cnNi1HNNRnzmCsVhYGTrxpyDZ/IWJMcz1lVqp9n9OWlCxGtSeXuEaxaZyji
         Bdt6UdcbhAjER/1DPGbQ+ovaX1S/IM/v+O4cp73qEsNjg15wX3dHPbG3cK/Q0Qng4dHz
         aIfZldGY+lR7EDH1C70vwRf+HcO96Gft85HBkds5nd0Tw40RdPVCVesry9nN00iBVgpd
         9YwasgkdzubhlKtw4S4UcoPvQm14iIKT5Q2S85MNTRZyKoN8NeRZXpql3En5n2e6lKr6
         NfmA==
X-Forwarded-Encrypted: i=1; AJvYcCVilXMOhZa7N9SV8K7Eb592VN+IGbybi+DoWXWt/eWwhbXdAM8kf858E8jlO8tBIBoURNBU5Eg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOaPiUax5dhrWuDZyIJMQNHZiBtK/8RER0ir6+KRFKEqnVfmdi
	AofRtAy8Vrmvg/KygFenNMeIbW4hKPkgJ1T7Xy14FfDgk6LTmtkcMImyyC5aBxb+1N3SVzymAN3
	qrqsI4YwWjwJ2z08SiaMheRBBGqywWVNO6hhgwjHqOB0MnTyZfGgWch151uqH
X-Gm-Gg: ASbGncu7/q6jNA2BbMsV3swkGYYtoZSt5KiidNOAFji8u4985LS2x+ErHJcyXSjE1BM
	s/jjxOWKq5HZkTfGlXlMzCQ7/OS5yQIIdisrdifuc+PnOfAWShvMog4j4cW3PI1WWshD6M5H86n
	ohe+ScNbAU2Zdf5QI4SHQS7/jb4fNV1zQF4xKtKYwUi7z+R2zg6flmgw6wJocXsXqWbgd40d6Ub
	W4J8Et7t6fIktAg4gtcsxquvno0+FwKgHxiYswh/1Meq4TZc0NEo2STZQ840kF7FRWMEk4MPG/a
	Ht8ZdhvlosPuAi8TZdVWUnNVzPR9hyQDS2E3iJ5TOuZtebFUrO1m5rLJAPsa4w==
X-Received: by 2002:a05:6a21:328b:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-215eb73ff9bmr5239882637.10.1747149416976;
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/qZgi8tIjcUeE0ohWzU4Mnw55YfaTgtINhOjXu6Fl8drDxzQO1FyRbVY4oDD29OgLNL9FTQ==
X-Received: by 2002:a05:6a21:328b:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-215eb73ff9bmr5239835637.10.1747149416526;
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3ea02sm6349451a12.39.2025.05.13.08.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
Message-ID: <57e04b5a-9f04-49bb-8a7d-978276e9033f@oss.qualcomm.com>
Date: Tue, 13 May 2025 09:16:53 -0600
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
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE0NSBTYWx0ZWRfX63hAF/4lfIWc
 wf6zEcPMRSfH9avU1AVAmYNIcNL5t5QsNo/RKhR8YxTJHhtFfm5qzI2/y5YOzq2GoxH7FzJuTZA
 TyYcGV4BeFsk7gBElds0zfndNHUmQQ30U/a4RqY1s4rIcCIojTSR7a0lW5P8RslARlowWG9kzQ1
 UMhAe2Oykyxv+sjB3T2u308GIS38uviKcYRcZFIY5NROrr7tBV5s905JoxxTzOoFjO7gvP0uadF
 FCoBfei+9W7PWSGWSjcAiojS7PNKLAuIsX7CG96z7YaMsNmJFFaEqDMUpgi/8i6qa6SZXuQ7j6H
 CxdSUj5qua27zhCROlF5D5V73Y1cRhKpC6jQvL0+8cpO1Uo5gWStTqnO7dHU8y7gFjTW0j2Usej
 gAM2znvtDs9Pj1dUkV9HUJI5y+bleTfe87edOj4JTgeZ/cUvwpG/ZlODpsVDc3ehq2o9PfEV
X-Proofpoint-ORIG-GUID: SYOHAWPCBxyDoYiEUbYnIfrLQDm3DQlS
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6823626a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=ql1YSk0x1lwMMiQrb4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SYOHAWPCBxyDoYiEUbYnIfrLQDm3DQlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_081700_199339_E316CC39 
X-CRM114-Status: GOOD (  27.78  )
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

On 5/13/2025 12:44 AM, Muhammad Usama Anjum wrote:
> On 5/12/25 11:46 PM, Jeff Hugo wrote:
>> On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> The rddm is of constant size for a given hardware. While the fbc_image
>>> size depends on the firmware. If the firmware changes, we'll free and
>>> allocate new memory for it.
>>
>> Why is it valid to load new firmware as a result of suspend?  I don't
>> users would expect that.
> I'm not sure its valid or not. Like other users, I also don't expect
> that firmware would get changed. It doesn't seem to be tested and hence
> supported case.
> 
> But other drivers have code which have implementation like this. I'd
> mentioned previously that this patch was motivated from the ath12k [1]
> and ath11k [2] patches. They don't free the memory and reuse the same
> memory if new size is same.

It feels like this justification needs to be detailed in the commit 
text. I suspect at some point we'll have another MHI device where the FW 
will need to be cached.

>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>> index efa3b6dddf4d2..bc8459798bbee 100644
>>> --- a/drivers/bus/mhi/host/boot.c
>>> +++ b/drivers/bus/mhi/host/boot.c
>>> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller
>>> *mhi_cntrl)
>>>         * device transitioning into MHI READY state
>>>         */
>>>        if (fw_load_type == MHI_FW_LOAD_FBC) {
>>
>> Why is this FBC specific?
> It seems we allocate fbc_image only when firmware load type is
> FW_LOAD_FBC. I'm just optimizing the buffer allocation here.

We alloc bhie tables in non FBC usecases. Is this somehow an FBC 
specific issue? Perhaps you could clarify the limits of this solution in 
the commit text?

> 
>>
>>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>>> fw_sz);
>>> -        if (ret) {
>>> -            release_firmware(firmware);
>>> -            goto error_fw_load;
>>> +        if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
>>> +            mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>>> +            mhi_cntrl->fbc_image = NULL;
>>> +        }
>>> +        if (!mhi_cntrl->fbc_image) {
>>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>>>> fbc_image, fw_sz);
>>> +            if (ret) {
>>> +                release_firmware(firmware);
>>> +                goto error_fw_load;
>>> +            }
>>> +            mhi_cntrl->prev_fw_sz = fw_sz;
>>>            }
>>>              /* Load the firmware into BHIE vec table */
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index e6c3ff62bab1d..107d71b4cc51a 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller
>>> *mhi_cntrl, bool graceful)
>>>    }
>>>    EXPORT_SYMBOL_GPL(mhi_power_down);
>>>    +static void __mhi_power_down_unprepare_keep_dev(struct
>>> mhi_controller *mhi_cntrl)
>>> +{
>>> +    mhi_cntrl->bhi = NULL;
>>> +    mhi_cntrl->bhie = NULL;
>>
>> Why?
> This function is shorter version of mhi_unprepare_after_power_down(). As
> we need different code path in case of suspend/hibernation case, I was
> adding a new API which Mani asked me remove and consolidate into
> mhi_power_down_keep_dev() instead. So this static function has been
> added. [3]

I don't understand the need to zero these out.  Also, if you are copying 
part of the functionality of mhi_unprepare_after_power_down(), shouldn't 
that functionality be moved into your new API to eliminate duplication?


