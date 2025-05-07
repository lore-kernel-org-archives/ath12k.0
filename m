Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA91C3ABBF
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 02:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wZOjd8ceYaj0jg8B4gKb3L865zn1+qkmaarQvnEXoo=; b=IFDGyTACuGd4utUA2RyfOJa1B7
	hwmzEeJ+rAGlSY5fSbpOKd6m74po3gFcvhmS3Ig+WqaLfVKoIRh1lkezPd8IRG9IvJZrf6o/fE5fL
	YRu4OjkY6zV84cW3ULKaJgqZOqDA2Mnq9y/v5xiQ86eaHdxsH3b9TAnPtK7xMYDMH8gBKHbg+tr1w
	GonSZKxCGYsZcy6dbAs6LSJYYq4yvZEAJbuKb9qySn9ZeClZQqdIUpyYgLgexWmCI44ZMyAQIX9Nf
	08kf08JkyFwHgeB/PXUR5wO7xdY7ELUvLM6CDUDTNt6WeUy7rffU0c+tvGxAGe+V+HaFLSGHVd5Au
	d0h4gAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUdc-0000000Dzso-2ynK;
	Wed, 07 May 2025 02:36:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUCZ-0000000DsxV-0gGg
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 02:08:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Gl5P002513
	for <ath12k@lists.infradead.org>; Wed, 7 May 2025 02:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wZOjd8ceYaj0jg8B4gKb3L865zn1+qkmaarQvnEXoo=; b=aMnLQoCExPgi8WeA
	FXVNlWQLqaR7AhLnBh0cghR3a+Zgybvs4xwxDcq/09gptfI7dWIGkANtS0veHCtV
	qope+QTGXstOR4OwAhnhApMYerL9xzgkVIiARxRQogg4LxHVShOf0buyCcCDcpHE
	IvKzlbCoYHWHBMbsuviIxlOgi0djgIezDQiP2Thm+mVeAiyBFGDt+nu/hgJjwvFz
	qi3MNMvMOHMCPPH73VpG8DqUZdcvI4THghqx0VE+JdMtM8Ydnyy7N7xVGnr/9Z95
	6ZaF6ZV2kGPm+sonJb8KDD7N+vM/a0wMHIIvp09PwI7u355dMTgNHsCX9YRqclNs
	sHJNww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fsmt0kgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 May 2025 02:08:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b431ee0dso4703030b3a.0
        for <ath12k@lists.infradead.org>; Tue, 06 May 2025 19:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746583679; x=1747188479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wZOjd8ceYaj0jg8B4gKb3L865zn1+qkmaarQvnEXoo=;
        b=pVzjvxbb7c+UEEZXnhzOm5n1GiYzTovXQ30huGRIZ5qgjmov+XBK9njvd1jbv39iQX
         D3KK0kVPrN8TfmsiUrq3k726500eF4DYUDTZpgOk9UgkGwEMo6fim90XiG7OZKsmF7hc
         bByYeHDVhg54YEaLDOu/0rUUc1Is57euaiUlTHn/lYgwzIt0JFonQwuPluSCTUytmyOk
         X4JRXqRCF6tUduWYWnY8o9FhJWum0ZTdVpzdyeRFg+zsCxaxtZVrF/QW97/CWiKFBdXR
         HtWW8dtJN++zhFKXEim/UWAHwwCPmZZmrhq+X6WShF+mPIOuWLZkhZQmDgB8feokrSXX
         2tnA==
X-Forwarded-Encrypted: i=1; AJvYcCVXG8NA2f0K0zcNh0wXZ0oaXH1f6ofD1ofhXQWruUUYoYSXxS5N5etYKmz9jkmfmKQi0WCSPwk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5avAyKRAp9mbeaPDE8Vooc1yo8ubJR69SlTCL6WWBA6B7ObTc
	Pkb7YWo4o827n5EFf7nwkHqgjyR7zKZdrLcyNnfC4QsM0XIH3RodJeWXzJx0GTL2D4TWfKDCFLd
	ZDVaT9YxVN8eP0zvPOI2MXGoT1F/Z7GiFYhrhqAFcX7sNc3P/ZcC3hJmKvbXS
X-Gm-Gg: ASbGncvLhvLDGBRANPl9XI9qWJACrDqLrD5N8SgzQa8DW99/XqqtV74duhFfcDLRuGD
	9vBOSR8xHFguIt06lWepbXzX9bqEYaBBSwkgLxhP7D4xsrv8njd755JkER9HVivVmlKCVX1ryDe
	MPhNP660LcbtPl+aGIRtlK+VJzy+ZAxloBuUxcksBZ7owgMtDKT++5aoixlg2eUjMglFQm0r0rw
	n3zh32d9gqkbuK1z2KY/cNC4sITzkXWFpWthYJ5PCnPP58SyVniigzo308csuBBWbewsLvMiTkr
	9NriDputykvJX/B2NjgdFm0mK1XOQMn4+J19iQy4/vl53E1ckpyTXtVhpIq6raNzwyEU5OcG9eE
	=
X-Received: by 2002:a05:6a21:9203:b0:1f5:80a3:b006 with SMTP id adf61e73a8af0-2148be0d1ffmr2006539637.21.1746583679369;
        Tue, 06 May 2025 19:07:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/uUMV/wZt5ljG6wdlTNRYDgj/VDqH6QBHtVVvFKegyCB66lIbkhWcRfuZj76r2zSQ82jSug==
X-Received: by 2002:a05:6a21:9203:b0:1f5:80a3:b006 with SMTP id adf61e73a8af0-2148be0d1ffmr2006515637.21.1746583679040;
        Tue, 06 May 2025 19:07:59 -0700 (PDT)
Received: from [10.133.33.216] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3925ae3sm8385333a12.12.2025.05.06.19.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 19:07:58 -0700 (PDT)
Message-ID: <afd009c0-38aa-422c-9aeb-665ada3c9235@oss.qualcomm.com>
Date: Wed, 7 May 2025 10:07:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] wifi: ath12k: delete mon reap timer
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250107025621.1907-1-quic_kangyang@quicinc.com>
 <20250107025621.1907-4-quic_kangyang@quicinc.com>
 <9f7dcede-caa3-970e-6d37-9f18344665e8@quicinc.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <9f7dcede-caa3-970e-6d37-9f18344665e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U9KSDfru c=1 sm=1 tr=0 ts=681ac080 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=aE2tVh0QiOHCoEqsSJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZjaU0I5BRVJ6uMJ3a4Vprm8e0U1IQJVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAxOCBTYWx0ZWRfX0Tq3/ZBNIt3Y
 6KjxhpTJ026U40S45uLpjIz5F0PVioEzpnvlfBnk8/2+6hIFsakWJvyQ47quwjS1xRN6SxQ3aOh
 DuA8hzUV3TGjSxD8CHl9ferwlhi7fqIVmmQxTn58+OjN9wYgxObupG5AHERB88kfsQcHD3u/15x
 eivOVGqhus5xdWRtzTWXxzWFrYhQ3+FxK/C8Sajp23rcp2zPv2cE99NFKEEWbxlkP7mxu3YAjLh
 KeFtbidGUoIMgGensAByqq6tPmUit4OLRcNe6WkEsFVCm5W1AGs2C8cAjOwZ33YMAWH+lNRm1n8
 wnhj6vI9BGgdCUxyopdajeX1bzJJCtAyJGjhrijoU/vhlwmKSYdvrQsOIgYq7QeKpooKrQmCJHj
 m6wleS0oE3SYqtSpelYBeETI24MoAsKaF5F9N+RTsoF8Qvv6zHsZbfbnFcguXPZabEq3eJeK
X-Proofpoint-ORIG-GUID: ZjaU0I5BRVJ6uMJ3a4Vprm8e0U1IQJVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=990 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_190803_206469_FC560632 
X-CRM114-Status: GOOD (  17.83  )
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



On 5/1/2025 11:34 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 1/7/2025 8:26 AM, Kang Yang wrote:
>> Currently mon reap timer is not used, and it is not needed anymore.
>>
>> So remove related code.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.h |  2 --
>>   drivers/net/wireless/ath/ath12k/dp.c   | 30 +-------------------------
>>   2 files changed, 1 insertion(+), 31 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/ 
>> wireless/ath/ath12k/core.h
>> index 41a51c7bad6c..ad2451fd7ce9 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -992,8 +992,6 @@ struct ath12k_base {
>>       struct ath12k_dbring_cap *db_caps;
>>       u32 num_db_cap;
>> -    struct timer_list mon_reap_timer;
>> -
>>       struct completion htc_suspend;
>>       u64 fw_soc_drop_count;
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/ 
>> wireless/ath/ath12k/dp.c
>> index 9e5a4e75f2f6..f162f98e7b79 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>>   /*
>>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #include <crypto/hash.h>
>> @@ -982,11 +982,6 @@ void ath12k_dp_pdev_free(struct ath12k_base *ab)
>>   {
>>       int i;
>> -    if (!ab->mon_reap_timer.function)
>> -        return;
> 
> This dead code removal change also fixes a memory leak in 
> rxdma_mon_dst_ring with QCN
> chipset. Bailing out based on the timer setup will leave the memory 
> allocated
> for rxdma_mon_dst_ring unfreed as rxdma_mon_dst_ring is allocated when 
> the mon_reap_timer
> is not setup.


Praneesh told me about this.

This change is in master-pending now.
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=main-pending&id=c23cc8ea2d104fecd0a54ca691cf8d58fe956fa7


> 
> Vasanth
> 


