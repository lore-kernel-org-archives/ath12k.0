Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BBBC87FC3
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxueihSNUT2gvfRCYLszVQxvKLpm8BbA2TEvBIULlTw=; b=ffTngIBfv1uZmLkEbS6b99TxN7
	XA4CXuaY8hSzJpQlWncr/FNZh9wqobAE+2VUweg1NO7RwAVFKq0bMcGtMRO4PjQ2s/e48etIDxW8x
	mMafefU349Y6/KBHnWHi8oX9ZQ/K0j5IBn0ZDyjuXJPPZEVP4S8mNy6X/lv2sX4kQYhDpGvcdocQ9
	YBRsyfil/GJJkVOUOsrjzO+hb9WfPl7cBQlfEfB6/r6pJj8RRjl7tsxp6d3eReEa+HehTZtLWvmVK
	3x/n4npMgOypLkaZknhyZv4NM13kFi3kXJy3y+R1JrCibmOnzcT5u3Hz+UTKQcKzKM+B37Xt0fhkO
	FXCGefag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg9J-0000000ByZM-3YdV;
	Fri, 18 Jul 2025 08:08:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg4S-0000000By0L-2b0L
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 08:03:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I07JEt015963
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 08:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxueihSNUT2gvfRCYLszVQxvKLpm8BbA2TEvBIULlTw=; b=R6hI3PNgaBmb/wKU
	275ikXLUpWvTan0VU9GJXpxejQRUnNmYjnz3Mjm+JRaQKEbHtpKcco40BPvput0d
	puOMJKcwtKqrsuQ2OHqbMBHdCuUtebky9mT1WZcjzgj6uVfCu43dqDULfuW08Q5/
	TtBicGgbRW/EQqxyOxhIi3MVKKDq0IzmdayJQEuVIYc7BoEfF38Rpmd2RW9WKmmU
	ipF0/rUS1BDPZsI0gy3p11dQvPviH3W/C03bxuszcW/qEluvI0XXHe79F2wP3dqx
	M/fBzMbRZjT0jGgnqMTSTD6nfLu3AgAAkJq3SDOWiAKKqhS0vdPHRr2JjTJwPs7N
	RhZIUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc2gup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 08:03:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso1818545a91.1
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 01:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825835; x=1753430635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxueihSNUT2gvfRCYLszVQxvKLpm8BbA2TEvBIULlTw=;
        b=MNrvDTHL9xbDm8p99cY5qn13Rfx1r+AfiZoB47Rf8t7kx6VvioxLzlhO2uSeoqT7CJ
         rK/NeNksdrhp8DbnjetAJKuHU3mKeWwL0MoZiB/NSFkwFI6Vb64EVjZgDPBY7qbhfy0u
         WQdpUDMVOpJANicmldkbdbKueoouceds0pcS+3r+hbb7gfHmK+cXTU6Bgzz8Nngu68TS
         JS5z361WN4WKvSFgZae2c2Dw2ZnfM6Ux+PKehJSXrVIoEkrPa13ToxUpSs14z3Tugjrm
         Kd4V+1YDXGT6jKJGigBOtrLq6uJcRICkF8Cx0R1Xl07d2ycsA0+IWpL/lnNoGRvDW/9F
         mxuw==
X-Forwarded-Encrypted: i=1; AJvYcCU+aFZByGGBEKYrm924NDFGQyNqUi9xhP1Lt44czMEyU108buuDFcoWclqLyiz0tp3E2t39FB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfIeIZ+zOa00kq1yGYpQo2n4ao1hAV+QErwYqVUxPjWcm64aW
	IuOX/atDkobt9cYZTW8XXZGJbObqnvKdXTHt/B1yxb5/cq/c14VdQS5Pkepc52n05ZQ06deL3KY
	O/B0kB4PkUY8RTJdfn8lZSHOA3Jlw7PKgtWEbGZUFbT29eDbsE0wqbkjCFfOl0mO0
X-Gm-Gg: ASbGncsAEfo99iaHDZjzLZH7I4iHwr1SwFl9dBaNIXRO0lhGEfFxs16Xipt0N2QAE+w
	H4U1DUA1HsdsVugP6PhKy7Des+O6Xu7uq1ozx7I5JJfGQzuWAxs2MAHIALxUDdeirxD7XazFR8/
	Pr4TBVtDk1BiZpDqSGdzuUcJ6PqnOk7Q83ZkOsVGQosYTyL+StbrvW4CfimRyS6TxETr9rl5Uck
	m1e+G5uGbrsxcARgRZyBjdjeexnUDxQSm4XnW4iefYWWleFSmJyfZ1lHla/mugsiH0Qw/s5DAeb
	lsBSzyWbT+vESleQpY3yd3eivUpZdcW5cgKim4pGjG5VTFZWOwD8+Xg+OvSUihra5jlp2g==
X-Received: by 2002:a17:90b:38c8:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31c9f4c46d3mr14699053a91.33.1752825834937;
        Fri, 18 Jul 2025 01:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxPYhZgCck07MGmNFAvaF85ucZQYS+3cPmHxVMPoQhjM4CsqlXubj80zgLzii9a5VFOEcvWQ==
X-Received: by 2002:a17:90b:38c8:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31c9f4c46d3mr14698992a91.33.1752825834371;
        Fri, 18 Jul 2025 01:03:54 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc0be8975sm737350a91.1.2025.07.18.01.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:03:54 -0700 (PDT)
Message-ID: <aa2f6350-3235-422b-be04-a03bd3a1010d@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 13:33:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
 <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
 <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=6879ffeb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=bhzlIsU2D2yyHOt3_ukA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 26Oky5QHSRJ_IBSrg4YOvSpwEzMuiRn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2MiBTYWx0ZWRfX79hXyYyQMY5m
 ZQyyY9TvQwIu3ItjBI9qPCj0XbpAvwhNQcguo8C2xcICKkjAmySyrh5QxqlHtIUlB4zC146RIjl
 FCqKVp6QtOAHZlEA18A9580CBttKNiFbCOor9G283qpZYkIrTakHn3khfQutydtSdtcvGbwhh7J
 krF5bhvo3h1k8Ykr7MHWdFBIGCDD1/+h6EM8OoPwByEIwiF8y5yoS593bUWtHHfSxH5oHe7MU31
 AV5pSD77EQsGd7UPiuCwJYmjZjhJhvZalz3Ft4Rb+ffDgPoOM46UPg95SWIYHk0ow0b3FyBjqIS
 6txXk/+gQZnyh3rQGpI7GzLRzefC+e++szGVdE5ptA/NzlMT/nLBEEkzSCzX4BtTrc+X9Lk+iX6
 clhsQHE71nHcarTuYI0mu0hIJM5onbIA6wcRc58qB4LE1lE2cJoHT8AJUUBoaF58yfMQh5zo
X-Proofpoint-GUID: 26Oky5QHSRJ_IBSrg4YOvSpwEzMuiRn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010356_675220_8B600B38 
X-CRM114-Status: GOOD (  21.76  )
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



On 7/18/2025 1:27 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>
>>
>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>   #include "mhi.h"
>>>>>>>   #include "debug.h"
>>>>>>>   
>>>>>>> +#include "../ath.h"
>>>>>>> +
>>>>>>>   #define ATH12K_PCI_BAR_NUM		0
>>>>>>>   #define ATH12K_PCI_DMA_MASK		36
>>>>>>>   
>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>   		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>   
>>>>>>>   	/* disable L0s and L1 */
>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>
>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>
>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>
>>>>>>
>>>>>>>   
>>>>>>>   	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>   }
>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>   {
>>>>>>>   	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>   	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>> -						   ab_pci->link_ctl &
>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>
>>>>>> always, the 'enable' is not working:
>>>>>>
>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>
>>>>>
>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>> reboots):
>>>>
>>>> I was not testing reboot. Here is what I am doing:
>>>>
>>>> step1: rmmod ath12k
>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>> the issue)
>>>>
>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>
>>>> step3: insmod ath12k and check linkctrl
>>>>
>>>
>>> So I did the same and got:
>>>
>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>
>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>> reason why the drivers should not muck around LNKCTL register manually.
>>
>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>
>> How many iterations have you done with above steps? From my side it seems random so better
>> to do some stress test.
>>
> 
> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
> didn't spot the disparity. This is the script I used:
> 
> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
> 
> And I always got:
> 
> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
> 
> Also no AER messages. TBH, I'm not sure how you were able to see the random
> issues with these APIs. That looks like a race, which is scary.
> 
How about using locked variants pci_disable_link_state_locked &
pci_enable_link_state_locked give it a try?

- Krishna Chaitanya
> I do not want to ignore your scenario, but would like to reproduce and get to
> the bottom of it.
> 
> - Mani
> 

