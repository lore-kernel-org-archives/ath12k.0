Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AC5C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=; b=LHU6kwAY0QAv14vAw+OpSrbCXt
	b9BfjQMHWyurVGWpgDf4TIIvZ9V987rOtOkoYsu5edblYSxZK1X3pcPN30nKLIqsiD6Fk789EOPj+
	fKc+tfqjfNfq4d0Qd117ameTP90NeFKHajJ1GKce6yb5vVeQd5G0NbpgDwh1C3OMhZPU/93SIPJ2H
	6x1fpQmNKvBFOz5x+u+VMfKBGEnVQClhU9/pBriS3kc9gE+6xnQFDm+EN1CohusNgpZ0KXwJFCi5o
	A6wC0VWDwXBLDFrIbiQBGk/L4ei4/d7NXtT0lCN6WHB+AulK+3ly6V24B3+YhQYUwLwjM2Nf2NjCa
	riti1nUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgT2-0000000C29f-1Mcz;
	Fri, 18 Jul 2025 08:29:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgHG-0000000C07x-30Kv
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 08:17:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HNSBZL000552
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 08:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=; b=YS6d4pEWNQ86kyze
	B3uKrZ6/ciQRyaccGTChUVg0jamBZrUYwPUhJNunx8nOA6Rc8Hy9Dh1TLmubbPPD
	M7hOEZxmAoCjybdFStKqwHaGOEflvdyjZOEVi2vGVbjx7F1UntJ9P2mNfyPj51CH
	wHTiVWtJA/Y0HR+gwbtwsZGTz/OqQUDAA2J4Rgmkb2BdbljzYnaur4blmMYLC9Ua
	FPX1pIsu149aJ+XJYKXTDbBd1zQzVR5/BzFJBjlVEVdtojT5MFcs3mteqTJaXTPU
	4nzsIBjxnFHeVVXhvFFSw3VpF/xzzjJmAOihDB9YpkPPQdjAlx8F+JKaWmRtYPsN
	TTeg5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drwrr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 08:17:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237f8d64263so18776425ad.1
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 01:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826629; x=1753431429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sz6UouOYzYap4GYepp/i96AYC8KEzgfVubsa4OTvKg=;
        b=aikb0J+VNqGUF0Vu9eRo8YAyTqCx/f/NKdVaA8vIhbwuMzsTS9FISIS8V4PNbE2XJ1
         ZACarIP/JK6aFUueWLFh52xsB0FxbpfkZ7Nt30cVPeFtZP84Byt/tmO2NeyJR7/VKsHF
         YKLmK7rXfI/ht0JdxK+ME/qsRuDyB3cdXXkvtjsBAj5XCwRL/dnJD6t/dw8y5JYmKC0s
         9h085giFlnAaTJftUR7GxbIkaeha0wULPNmPvjHwqnO/kAjaKeSrFpNz/r5DQ/2CGwUZ
         nG3QYv+CBzQ3sKOqpePyJ4HKqkA13hpJ75V1fZbxQq8SAbh8q2y3TlN2LKY6hPg1K43u
         kBLw==
X-Forwarded-Encrypted: i=1; AJvYcCV0OXjcRZKBM3clRRQL+bYVfljRcOITUS576+Qky0X/+2Q5VFgrHqMT6HqLF9zQBy+r0dYDTLg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1oLmjo1mZESO6n4BiuWVravSyxIrMV0CJdi6a5sRDOBpekq4r
	R06sLTZ2cDgI9PXJ5IdGyLkeh/+OqRBxPQacv2ZD9sGC/v4Zwpp6KkBKjgHg58UhzqhaGERTuIq
	wjFm0nZWDygRvsGhQfKESiE6XDWTXzFXTQkoErnYkJ1rIASzcx5MWotieM6EbbkqG
X-Gm-Gg: ASbGncsrTF46uBsav9XyoJxvw0hXMFViPwEbmvVNaBpEYwGoI8eEVbATGCDBOwOd75p
	yXVH0k3PMQg8tCl0MMduP1Mx6UGQn4yANOvJLhQHiJrOcq0l/3VQP6cSHhHYl59PiO5fsfh2m+I
	O3TwnuPmXLKnms7AqZVdKB8d65eW6ByGNzJ4oNHXuARBFxelCI+eSaivGYPERReAjSTe2QIcjka
	RFtpry749eBwNG0rT0P5/jW00PoACyUd2RveTpxIihykW7XfAIPS+Tc4pFjqgZTnqUU/8/k4DBR
	DXwhW+GUnCHa9naALJlwkvMb3GPV4zFZKulYKTrBAp04H9GmwSKa6V61Knl2yY4SSqYgtA==
X-Received: by 2002:a17:903:182:b0:237:e696:3d56 with SMTP id d9443c01a7336-23e24fbef08mr150794735ad.32.1752826628983;
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTX0ICCMvqiCRiHCtB0fXgHKCePe7G4D1Ocxr/5VJZponrjW4cuIj/Sc2rud59/D0HbeHIPQ==
X-Received: by 2002:a17:903:182:b0:237:e696:3d56 with SMTP id d9443c01a7336-23e24fbef08mr150794305ad.32.1752826628462;
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e400esm8408515ad.47.2025.07.18.01.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:17:08 -0700 (PDT)
Message-ID: <94944e2f-545d-4185-8679-65404cd01951@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 13:47:01 +0530
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
 <aa2f6350-3235-422b-be04-a03bd3a1010d@oss.qualcomm.com>
 <wbmxxpmcjhsxbracfpvaoishnfz5foqy2rdbp3syqrd377koon@t56m44jvdyft>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <wbmxxpmcjhsxbracfpvaoishnfz5foqy2rdbp3syqrd377koon@t56m44jvdyft>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hlVA0vjN58bdFi9N1emvKO4mdUElzPAs
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a0306 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Dy8vuA9QIKNjNhFCyMYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hlVA0vjN58bdFi9N1emvKO4mdUElzPAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2NCBTYWx0ZWRfX42+kuNVAsdgP
 M1lEqCy/W6fbIOrm5+6jGzf6rnvxT/jWKgIShRtti61448todfS9Eb+FG0AFSVmLGa95UAcvVfQ
 ePz3IHQdJ+EiIY61J+9uOY/ZVRpUkCwmz4+5eCI4uaL1WbUv6t3p5d2/epqPZtwucmoR2eOjFzC
 3ixhUKpsQw0V1ncrcjJSaVO0UsbI6O52XgkljUHiH1wH9J1OZPDuj6WsIFDGpb09+Izict302xg
 JcoOpo9t7wgT79ffXx/fKMlcBHAlIlixuP1En7iKDtEEEZI9klWgKrtGipkNp/5PNXCRPRr7w6J
 R8ehJZ6Q0ntdWYNELx+W+sNjupA9KryRQ5vHLlW4w9W9AIFfeEUhRDBmjpgV8wghxRjN+8jfpsA
 2pzgDMrxaZQPQqyLa29VnvS9YSEKTg23eg+459xYFp4OrwMEzOulPTZtRkzJfdUEt2l+1c7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_011710_814844_40306B01 
X-CRM114-Status: GOOD (  21.46  )
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



On 7/18/2025 1:42 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 01:33:46PM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/18/2025 1:27 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>>>
>>>>>>
>>>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>>>    #include "mhi.h"
>>>>>>>>>    #include "debug.h"
>>>>>>>>> +#include "../ath.h"
>>>>>>>>> +
>>>>>>>>>    #define ATH12K_PCI_BAR_NUM		0
>>>>>>>>>    #define ATH12K_PCI_DMA_MASK		36
>>>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>>>    		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>>>    	/* disable L0s and L1 */
>>>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>>>
>>>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>>>
>>>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>>>
>>>>>>>>
>>>>>>>>>    	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>>>    }
>>>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>>>    {
>>>>>>>>>    	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>>>    	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>>>> -						   ab_pci->link_ctl &
>>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>>>
>>>>>>>> always, the 'enable' is not working:
>>>>>>>>
>>>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>>>
>>>>>>>
>>>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>>>> reboots):
>>>>>>
>>>>>> I was not testing reboot. Here is what I am doing:
>>>>>>
>>>>>> step1: rmmod ath12k
>>>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>>>> the issue)
>>>>>>
>>>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>>>
>>>>>> step3: insmod ath12k and check linkctrl
>>>>>>
>>>>>
>>>>> So I did the same and got:
>>>>>
>>>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>>>
>>>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>>>> reason why the drivers should not muck around LNKCTL register manually.
>>>>
>>>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>>>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>>>
>>>> How many iterations have you done with above steps? From my side it seems random so better
>>>> to do some stress test.
>>>>
>>>
>>> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
>>> didn't spot the disparity. This is the script I used:
>>>
>>> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
>>> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
>>>
>>> And I always got:
>>>
>>> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
>>> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
>>> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
>>> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
>>>
>>> Also no AER messages. TBH, I'm not sure how you were able to see the random
>>> issues with these APIs. That looks like a race, which is scary.
>>>
>> How about using locked variants pci_disable_link_state_locked &
>> pci_enable_link_state_locked give it a try?
>>
> 
> Locked variants should only be used when the caller is holding the pci_bus_sem
> lock, which in this case it is not. Unlike the name sounds, it doesn't provide
> any extra locking.
> 
Got it. Thanks for the info.

Qiang,

Can you narrow down AER issue if it is coming always while enabling ASPM 
only. And can you share us lspci o/p of the endpoint and the port to
which it is connected before and after.

- Krishna Chaitanya.
> - Mani
> 

