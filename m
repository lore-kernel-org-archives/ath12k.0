Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB7C83F22
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukDmLOBA9Me68ebZBlzYCp7a83Bc1sghnwXXZNSGT/k=; b=yZqcoMg/TDDXsKkrdPmSECc+LJ
	hSJVQTXuZRruNdtdwJg8g+o1BticARiCq7YWA0jsr3F3GivxM3ma9LRJKiO3sseTgjq6C1F68VZH2
	y+rh24s2V2fL8yjoBHLGKVhfhwHxa02GYIVc2aOA3s3YjhCG8caahSXJq/bQa9393aaM4kw4qprFI
	/nCI70UDctWR7EVS65qhsuxjimx3hf/Enm+Z04e9o69WlIrhBVrsCe5yl+HkptAv9xpuNxqQ1kt10
	cIInUNwXhsByS2NS/tJXzc9SpcXUqXmUNEQcfokCfKUouZAOnhSOagOSjrPlleYBRnm7BHOFSHq4e
	qfUUBuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucadX-0000000BWrG-2fob;
	Fri, 18 Jul 2025 02:15:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaTT-0000000BVlY-1DzI
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 02:05:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HL9l1U032515
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukDmLOBA9Me68ebZBlzYCp7a83Bc1sghnwXXZNSGT/k=; b=KtxVv2G7r6dPu94+
	AUnmdiwdI4mGN7ZscNcbkhidqi+r8pnCPrcf+tQHHrZ/8vBQZ23RrSZt7+bcuHoe
	BHVKoOb4x5sDu6B0KrglM+fTxJHX2WCmkbz/ebhnG0KH/SBmDFBNGjUunccNRuIT
	8BeCg44lOl8yLHvliJ7V0caSwzA1A20Oe4k9e8z03e0Sj3ekCiLsWN7Fqj4/MOvv
	VByiPiibQ2QA7XijlHyPejJZBSSLDHcpFz0jmwUHGLmU2/Pev5yWn7aNLw+zgSjQ
	sR9XApZ2mpKuARfL3SQIUTevCsPBhBFDJiKeKW4kux8h/XhqjRR2KVu20uLZkCJd
	eL2fyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug389yjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:05:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31cb5cc3edcso979425a91.0
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752804309; x=1753409109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukDmLOBA9Me68ebZBlzYCp7a83Bc1sghnwXXZNSGT/k=;
        b=KeYuav1lGw4ZKy3X4PcA4KPQ0q0mMT2vaNPI4uAwxV9bMLdSj1gn/kkMI82Dgbu2cV
         IJFvab2HK0svjsD0Q94PAmura6aVlCWH7rVFKMaCX8rBoBA9TnsA4BPfG97eSFabSHb3
         KO6/egSzXbSLwP3yCTeFX+DgsVHpIouAL8UkkdWE1qclYVqux4tumIQ6RKI2E1cWIPh4
         rFVpAO45Q+aho+H7NiQtV8aOnp6NW8e4qr2DTasBwy2CQvIAQbAfDXzDVXZaKMtpTvKn
         qiPwBwUaIwOYdalsur1svKjGqflq1OAK9EnWdgr99LMbg6e20bZzCWntqO5mV8mGBHpO
         gqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+N4d2suIOl+Jhd87zdPzbu1hQ4u/szyBUGFRFToUFFiznnPPtaocZu91BkXMtccbc2EDEDQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSYvSwygCuHxizE0YJbYdz78O3PEHvNqxEkelVlh/xrGz9VtZn
	8VUMWQ8QpjipS1SswQk6074cvHJCM251px1qQkjX3uJA0ISNvpaQhOv7nvAnDOp7Dw9dOnPq1Dk
	gjbA6eGRp1tYgTMK6uu2tZiWyAEf59IpmQYNy0gdHoEfuxP/150Sa8vF5SMns//HT
X-Gm-Gg: ASbGncsxeJmsMzItgChHCMIuDr52b810cFazJ8Se23amBBdrfelItUU9kJ3tIZYLrMe
	yq+yRyp0Rnsi8D/N6X6W15qk58kgjyZrH75efbAqQQSTpgpzwYtN/XeFcq1O7bgalZE1OsslC5b
	aLYXUlmMdIg1TKK4+mTAMCU73Uu3Wqb2y+/vFGkj3sr+Q76ddD0kvU6Sc4RNvzOPiNiFv4/SO4Q
	FsZW2SXfvrDhvcxewgiLE8wFwvkuHiM+AOyuOzAXKqOQwM+LuDGmLcY5Oin2AbaOxqleunvc5FW
	VvM6i2sX6eaerpjJeYG+eEwG550w1p/Oy3PemTKV7LBHDTeireMWN0JsNoNqIO7nC1NvxYkk8hM
	ZI07wZz30XFW5psaZklBXQ2yidLYZ3KGi
X-Received: by 2002:a17:90b:3c4b:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31c9f45c8e9mr12273912a91.35.1752804309271;
        Thu, 17 Jul 2025 19:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHleUA4lqoylvc2MFKPhIkTtj2OpjdSpesz+JpNk4bXp3YNmyys7zS5On4MFq6zBZbVyFLw4w==
X-Received: by 2002:a17:90b:3c4b:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31c9f45c8e9mr12273871a91.35.1752804308759;
        Thu, 17 Jul 2025 19:05:08 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1ba792sm4071428a91.5.2025.07.17.19.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 19:05:08 -0700 (PDT)
Message-ID: <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 10:05:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>
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
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAxNSBTYWx0ZWRfX90SvxY1qdK0c
 anTJk/uzB6bPiUR3BCNPvAHs8A4DZcykgUxZn8R9A79PSS5NVil5AJwsl+M0qoJ3EGS2A07d5/O
 K9XKUU5XOO77sAKxvXQzqEIGh3CGviOassmyi0WDM2p09xCt6yYiBs14Aas8yKd1f6l1Bdj/tvg
 PK702W7ImeTCGcBowOiAUUpfOoTqSmrK+iT+WPyOiKdrfl8Chs//fOWiyiDpL3hBOMCILVBbINo
 51CK44f0UlgKo5X9NkBfJyct3gl7pixROjXhqzqLHVVs18Z+mcA0RGGvPhPWlVI9iuyXNuHkkbV
 TTtma+Mr3plCz1odDhV8kYLYWBRGEq9ghAJV98rUFDwAvbqPj47qpmhqQ/SXag1bhLp85h0RgrR
 p8GaHpTUEjRdr2xvXsv6D0jMvAUycWTUcgKYspfOQ4f6X6u1xTHjU4RJOy6gGqDbX/wP5ajL
X-Proofpoint-GUID: Oj-QUWfJ_Tzm0wZUSN6vTsppMdFoLQ7y
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6879abe1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=J7HomXw41qA7Or-Ob6oA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Oj-QUWfJ_Tzm0wZUSN6vTsppMdFoLQ7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_190523_445243_26BA1329 
X-CRM114-Status: GOOD (  22.35  )
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



On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>
>>
>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>
>>> [...]
>>>
>>>>> @@ -16,6 +16,8 @@
>>>>>  #include "mhi.h"
>>>>>  #include "debug.h"
>>>>>  
>>>>> +#include "../ath.h"
>>>>> +
>>>>>  #define ATH12K_PCI_BAR_NUM		0
>>>>>  #define ATH12K_PCI_DMA_MASK		36
>>>>>  
>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>  
>>>>>  	/* disable L0s and L1 */
>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>
>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>
>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>
>>>>
>>>>>  
>>>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>  }
>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>  {
>>>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>> -						   ab_pci->link_ctl &
>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>
>>>> always, the 'enable' is not working:
>>>>
>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>
>>>
>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>> reboots):
>>
>> I was not testing reboot. Here is what I am doing:
>>
>> step1: rmmod ath12k
>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>> the issue)
>>
>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>
>> step3: insmod ath12k and check linkctrl
>>
> 
> So I did the same and got:
> 
> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
> 
> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
> reason why the drivers should not muck around LNKCTL register manually.

Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.

How many iterations have you done with above steps? From my side it seems random so better
to do some stress test.

> 
>>>
>>> [    3.758239] ath12k_pci_power_up 1475: link_ctl 0x42
>>> [    3.758315] ath12k_pci_power_up 1480: link_ctl 0x40
>>> [    4.383900] ath12k_pci_start 1180: link_ctl 0x40
>>> [    4.384026] ath12k_pci_start 1185: link_ctl 0x42
>>>
>>> Are you sure that you applied all the 6 patches in the series and not just the
>>> ath patches? Because, the first 3 PCI core patches are required to make the API
>>> work as intended.
>>
>> pretty sure all of them:
>>
>> $ git log --oneline
>> 07387d1bc17f (HEAD -> VALIDATE-pci-enable-link-state-behavior) wifi: ath12k: dump linkctrl reg
>> dbb3e5a7828b wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable
>> ASPM states
>> 392d7b3486b3 wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable
>> ASPM states
>> f2b0685c456d wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable
>> ASPM states
>> b1c8fad998f1 PCI/ASPM: Improve the kernel-doc for pci_disable_link_state*() APIs
>> b8f5204ba4b0 PCI/ASPM: Transition the device to D0 (if required) inside
>> pci_enable_link_state_locked() API
>> 186b1bbd4c62 PCI/ASPM: Fix the behavior of pci_enable_link_state*() APIs
>> 5a1ad8faaa16 (tag: ath-202507151704, origin/master, origin/main, origin/HEAD) Add
>> localversion-wireless-testing-ath
>>
> 
> Ok!
> 
>>
>>>
>>>>
>>>>>  }
>>>>>  
>>>>>  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
>>>>>
>>>>
>>>> In addition, frequently I can see below AER warnings:
>>>>
>>>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>>>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>>>> 0000:00:1c.0
>>>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>>>> Layer, (Transmitter ID)
>>>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>>>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>>>
>>>
>>> I don't see any AER errors either.
>>
>> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
>> never saw them until your changes applied.
>>
> 
> I don't think it should matter. I have an Intel NUC lying around with QCA6390
> attached via M.2. Let me test this change on that and report back the result.
> 
> - Mani
> 


