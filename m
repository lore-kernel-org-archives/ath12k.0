Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5D7CA601E
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxDtk3DnzXemCG0lxELeWTGbDr6igrYifPXgFdP+uBY=; b=YNaafSZIBu4yBh0iO4KB0hxnra
	0Sc3Il5ymQeOAs7eFk1Ksv9TU6rUDZOwZmANCfezx5tH8MlsqRhStvuuworkqXQ1c0SBpnlsg4Ozb
	SUvQ6FkmpZnDrR84Zci7OkPTo5R3fzVI/6uSwCzjOX9dltBKtZHQdEiRAxaDTcaBSfjdy23i24KJz
	uMg3kLbgptpVYyM1JnfFaSumocrVIyJXxZpGzVihRv7rz1Y9blIdHsGBcNZ8u27dyZmFZggB1wr9l
	rTJnEDLmSqanEZAwuO1c8GexXR0g4XnFIpZ4tWohx5z1x+5upNyCyQFXq18oFMkLnyCeJoPWXQfQa
	r0OJxwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHPd-00000007BrZ-3lmF;
	Fri, 09 Oct 2026 20:41:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHPb-00000007Br1-2PFU
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 20:41:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699K0Ygq1328917
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 20:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxDtk3DnzXemCG0lxELeWTGbDr6igrYifPXgFdP+uBY=; b=lCWoVPT6wrVhFFKW
	p9MuYpPOZX/tAI9AlwLq1RFQ+hzMAKsH/kpj4ncGb28S12W4qtXiTXjO3bM0X19Q
	o+zQO1TttDU9D1Mbxq2bPHyj5yM3EQS0MynREG/etT45uMY7txuiGLTIFLVuXDC3
	II5taTfkeJRRvM2XyNeM57OlcS2emg2WWbNTNrGHjchDTJd9JREDQ7Q0djjBqkxu
	lHVaCM6P9MGpL7A2VpKEYxcYRz/+NQIvKfKIpKUR3Tv7VvkFffWb4xVYaHOz2osb
	MHM3bsbns5pnH3PRqcI1Sm4SaBO4p3YgGldP8v2hHRzsWOSNRZ9AMcioxdDVkaLp
	GhhzKg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88p2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 20:41:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso118000eec.1
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791578510; x=1792183310; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxDtk3DnzXemCG0lxELeWTGbDr6igrYifPXgFdP+uBY=;
        b=PH+VLXezLiCTjTAMDxdFn4KEUBelKtGFTKe+5kdTQxpwrp81e//OPMMb2O2zNBUY9a
         p2yEYE2UI/EMpKv8EGwsKfhItsU/Uhvp/2L4E+3dJTgscuZQ1DXSn25fK5Nn5EI0KTKp
         vJo045MctBrfCQ7AlZUAjWvPR0ziepZPJui+HOFEcKSoUswermTnvbrvKslMVr8hy3Hv
         2K0XlPknicH3QEzfyfXC4B5SWY/YjOMc8GGWnCGCvnOpIoyczd803ZpNig6TurDoFuHk
         j3AmKhJ4vc9Bl4dS37oLXkmWoi/HoPqMeBK6aGWzGmTT4ywLGN7irG3SMTdWrn2bcdMH
         b+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578510; x=1792183310;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxDtk3DnzXemCG0lxELeWTGbDr6igrYifPXgFdP+uBY=;
        b=S43GVH5U5rPkDWcriDBlsHxVHGlwBoWGEt8Hb4hdskPEf4ivBQg2GeVGG7sL1LOj2R
         SDEsx3vEGzv9QkKXSASesNYr2wlLYfQ77AGyAqmxrEdDYkMxoUIM0xxT/V7Kmq7uHMIN
         ZRLZknBiA1sc1UWXRzDXJhVGgLSnKqaJU6AOF+HeErBmfYVDUKbOvqu6PTqnSyrPrKcE
         167bCHnf/5cisZTMMXC5Jdg5xp3yIGi8ftreJp9QWU8AiyRoEx7l2NEg01hzLZxr1oUi
         X4/DwTrJbio3soUZWvuTgT4JWtQVnm6O0mX658wQ9MsWX1y5H1kYHi9QGNmImxusLbks
         CefA==
X-Forwarded-Encrypted: i=1; AKwUvBzmXsaBwm2s2mGaljwsbWS7/PUUExnBvAItN1xbp1HcxkAILB5Dh0CegccOZKby8EtGISHisuM=@lists.infradead.org
X-Gm-Message-State: AFuF++lyBll7Wtl+EFlGXN0FFdsr6LdusqJi7bfv3DRb9LQ9+zWlOwOb
	CmqSIwAdTobabRa4TZTgwZnUlpDbEOhkOy0hG65PWzkl01Xp0utmej4Es69it6VLII78WYXMqO4
	GJsO0DbFI3h87T90jVtZUGyb9DOYq4KtUy3dYXX62Kh21K8/zuIIS4yvy3YquNbGU
X-Gm-Gg: AYBFou06EZ+6YiqP4R/w3FCU/T/hRp6lXmnirFedZp8fXcYQEowZtWcce9L1ZyMHdFw
	P1LV332bgjqQM5k6fM4eSux9RyUKYl0/DZSHwTPXtIBjG57bWo2uLc9CBoMGGgBLAmHDwbh2mTi
	wSSLjYzoz0TKjQvcqWnK52bUWBLcaLzDx8Q2sVd72uP4MMwHNX+y4jw+NiOewDqjj8hkvJZMwOQ
	/9/scWKJtXpd8y/L0pRrZ6jXyC+fpUenGEKqpsfVUoYp9ZLewgbqgEZ/bTf61SxZeDJ+tpQqr3Q
	9Y5gNiVMKcAF8HFBuv2YJBw2/ZhhJDtDR7soTJuU40QZcOhC9u2GSTNdIx3vFPSPREhvh5n7jOR
	BODXHtPN4Q9VlUnBCtOoIdc1Rj6/glfiAGrxDKQw3rmmt4zXSuGEpfmQaDg==
X-Received: by 2002:a05:701b:280e:b0:143:2719:f800 with SMTP id a92af1059eb24-16a633863c2mr3726065c88.40.1791578510107;
        Fri, 09 Oct 2026 13:41:50 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:143:2719:f800 with SMTP id a92af1059eb24-16a633863c2mr3726030c88.40.1791578509427;
        Fri, 09 Oct 2026 13:41:49 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm17297788c88.13.2026.10.09.13.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 13:41:48 -0700 (PDT)
Message-ID: <a3b513c2-24e1-4f4f-bf40-6494ebf2bb99@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:41:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
 <ad47c905-7865-4283-99ba-e246ae44d25b@oss.qualcomm.com>
 <2d52c324-59e3-411a-8012-e530426eed3a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2d52c324-59e3-411a-8012-e530426eed3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8BQnHs1R8uSwptSYOJc6HwC-b1YV6ek6
X-Proofpoint-GUID: 8BQnHs1R8uSwptSYOJc6HwC-b1YV6ek6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4MiBTYWx0ZWRfX1AeneDbEDmnh
 6RHGh2ys+Wd8kfPcZtb3/EcCtav+dUZD1XzCHcPi58vJ9ELWs5XlESaPMt+evGNRf53Xlt8lIKT
 CwCb9CZnpfmgN/bUaAugFmLqPCLfAH8=
X-Authority-Analysis: v=2.4 cv=JuNkP84C c=1 sm=1 tr=0 ts=6ac9518f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-w-nq0dITT5uSUeCWPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4MiBTYWx0ZWRfX5xSBclJ3DW58
 5cW6cKjFS4JEdcLey1UQy987uW/tTC9BhG8B+kCxdxvYNxiu9yWY07FExnQ7e0GUg6fLkolj5VJ
 vnlSZ+6Kzl8nzFHvtT4Uw85ZW9ubynO0JhEFEcOsWh2cs2NI1dqpkPW+Ikwg+P0g2UFiC6ISpic
 7LuOEud9I1p8gBwl9z27r8PFYes20OebUlfX1kNAJ95UvM/hVf3TGSQ4mMBu1OzN9HpSqQS4OMp
 UGAwNZxQVCP/bYyS8dz+DiclYU08KcSO/LnGfjknX6d0b9fuwrZdqSDxt40vcsOB27RJc8E39PD
 O+Lj4OyUREHIXME1DPl5mLqr7uvMUHMyKp5p5LqNyEeQoiBjOhZeEq8JVd1DYMESPgnB+UKVb72
 opFx96sw7uPHGOKMeLui3jPvZx+e0bTHbR5Br5/XSOO7XzgDF9JSvaYfc6uA8ICpoIzCmLk9tTf
 87t2Ndbv/WhwHaE9D9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_134151_618283_BE76B877 
X-CRM114-Status: GOOD (  17.53  )
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

On 10/8/2026 8:38 PM, Aaradhana Sahu wrote:
> On 10/8/2026 10:46 PM, Rameshkumar Sundaram wrote:
>> On 10/1/2026 10:24 AM, Aaradhana Sahu wrote:

>>> @@ -622,8 +642,10 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>>>           irq_grp->grp_id = i;
>>>             irq_grp->napi_ndev = alloc_netdev_dummy(0);
>>> -        if (!irq_grp->napi_ndev)
>>> -            return -ENOMEM;
>>> +        if (!irq_grp->napi_ndev) {
>>> +            ret = -ENOMEM;
>>> +            goto free_napi_ndev;
>>> +        }
>>>             netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>>>                      ath12k_ahb_ext_grp_napi_poll);
>>> @@ -675,12 +697,19 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>>
>>
>> platform_get_irq_byname() can return a negative error code. Should we handle that explicitly before calling devm_request_irq()?
>>
>> Something like:
>>
>>  irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
>>   if (irq < 0) {
>>     ath12k_warn(ab, "failed to retrieve irq number for %s\n", irq_name[irq_idx]);
>>         ret = irq;
>>         ath12k_ahb_free_napi_for_group(irq_grp);
>>         goto free_napi_ndev;
>>   }
>>
> 
> You're right, thanks for pointing this out. This patch focuses on fixing the NAPI resource leaks.
> Since handling the IRQ retrieval error is an existing issue, would it be okay to address it in a
> separate patch?

Yes, please handle as a separate patch.

My review agent notes:

There are three platform_get_irq_byname() call sites in ahb.c:

  ┌──────┬────────────────────────────────┬─────────────────────────────────┐
  │ Line │            Location            │      Checks return value?       │
  ├──────┼────────────────────────────────┼─────────────────────────────────┤
  │ 692  │ ext IRQ loop                   │ No                              │
  │      │ (ath12k_ahb_config_ext_irq)    │                                 │
  ├──────┼────────────────────────────────┼─────────────────────────────────┤
  │ 730  │ CE IRQ loop                    │ No                              │
  │      │ (ath12k_ahb_config_irq)        │                                 │
  ├──────┼────────────────────────────────┼─────────────────────────────────┤
  │      │                                │ Yes — if                        │
  │ 819  │ userpd IRQ                     │ (ab_ahb->userpd_irq_num[i] < 0) │
  │      │                                │  return ...                     │
  └──────┴────────────────────────────────┴─────────────────────────────────┘

So the driver is already inconsistent: userpd checks, CE and ext don't.

That said, the ext and CE sites aren't silently broken — devm_request_irq()
with a negative IRQ number hits irq_to_desc(), gets NULL, and returns -EINVAL,
which the existing if (ret) check catches. The practical impact is a
confusing error message ("failed request_irq") when the real failure was
platform_get_irq_byname() itself.

And further suggest it should be a separate patch. The reasons:

1. This bug is pre-existing at both line 692 and line 730 — it wasn't
introduced by the NAPI leak patch. Adding the check to only line 692 (as the
reviewer suggests) leaves line 730 unfixed and makes the code more
inconsistent than before.
2. A correct fix needs to cover both sites together, with a consistent error
message and error-path handling.
3. This patch already has a well-defined scope (NAPI cleanup). Adding
unrelated error-handling hygiene muddies the Fixes: attribution and makes it
harder to backport.
> 
>>
>>>                              ath12k_ahb_ext_interrupt_handler,
>>>                              IRQF_TRIGGER_RISING,
>>>                              irq_name[irq_idx], irq_grp);
>>> -            if (ret)
>>> +            if (ret) {
>>>                   ath12k_warn(ab, "failed request_irq for %d\n", irq);
>>> +                ath12k_ahb_free_napi_for_group(irq_grp);
>>> +                goto free_napi_ndev;
>>> +            }
>>>           }
>>>       }
>>>         return 0;
>>> +
>>> +free_napi_ndev:
>>> +    ath12k_ahb_free_napi(ab, i);
>>> +    return ret;
>>>   }
>>>     static int ath12k_ahb_config_irq(struct ath12k_base *ab)

