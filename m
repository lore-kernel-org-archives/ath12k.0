Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B3C83F22
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=; b=3cByjbDs3pwOwcFbDEskPUG43M
	1rFD7P8aas3PsPuCfiiDa83y1CzQKSBnLgNW+CQKK8VlpKRTNrdUlUsS9M52/yiN8UKOstog7JhMU
	ACB44WkJpxU1UTc53lunRXDd0Sn/VFUV2/YA5K4TorGDlJGsIp+8msLfYvD458BYYv/NaWNv/pyUs
	Bh38IprDv8d0+RL9xVV+aop3DN6gjpH4pz1w+wId5Kao6U3r8XbXhTB5OgCTRzXzgrD9n4idPDoN3
	XhoAvaEqzwJ2dzN4zTKGBffAMXoH/GkV5/VF8RAa5KUnoEpoG9J/RM7hECnYJvpsK233Bn4LOJGfD
	5+Uc9hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNmc-0000000A7Xu-44DG;
	Thu, 17 Jul 2025 12:32:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMKt-00000009vuw-3TXK
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 10:59:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H46iWq004564
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=; b=lcCN/7ii+6ET6bQm
	W5JrOXTbbJCbkNfiX90VFzbFNdnsU89a6yKqCm+gzmQQAopy7HKsInmt/7b0KfCW
	CrMJ+zifO1sCVrSDy2XozNYjbi2J1RrZD/ID8aWW3uY+Yd/mej6t901aSHQC/j0F
	UQVMGzHYRRhRkB50lYLjBjKGsdM3r2zolpzCtpWu2vIKhMRg3ygMb6tMGgPLnPUT
	Kddr/9vO2X9atuwi3AJDBKWHI1nTjf9QNJKiwKSu7jUyfAZ/t/DKBmj+D0D5TFeS
	QkXd6PAw4KKQ0oK/6itX5Et1huo/K4b0ul9qLoOi47OgldpKY93VtU5mbagw3LDY
	OUQgOg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xsuks4hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:59:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so827858b3a.3
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 03:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749974; x=1753354774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m1vcYVumY1HNbRTAgr3tsYxKmOeN38kHcJutqp6GcY=;
        b=sX+xv4WO/SVCYKXg4ab8h81aFNWwEKXv9YviHft3PAOF4spbO5SlObYni0D0gh5jVX
         bMaEhJXRAz0lPxcr7YVWUa/fVyAMd8dKVDzp8FFc2ha0mtor5dFTWxmu80/JlL5bIfG0
         R6L1huPdCKkzA6rNGjd9lYQC8DqH+vnv2UkzJSMj0Ct4uSXqxpYUldwfNUM9E6jy+wZm
         5cNbOrcuoh2HBer46hPC9UNCT2TUa3gTYkOSm/eEjn2vi2Ft3o41EbDChkwp/wNE2yZv
         Ntn6pr6jF4pAYHZrAJd484H2iEVA3zOPs9KY+YiDHYsPTjFvCixzXa9dT9kKUYX0W2HE
         PVDw==
X-Forwarded-Encrypted: i=1; AJvYcCWur1AjIGFLsJHIQcxdSl6uagUsufAz+31ehW4gfYl9xW6BHblMSe9ldEIwm81RR0dl3v/HlpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn5Kx5p2p/c9vrh49d92VINHLUDfHzv2LaWSYKv+UR5FB/3L5t
	w+hUYdGCByYhrs7sO+9q8hP+dyVZP6dWuRfwRYJEbeoSLcsCEe6ZbIsFWM+EJyi70PWcilz4fbK
	K3hBe4s9zFsfD2yLQBMH+CMfSnOu4c0FXxexcXSltBUd4mVAct4DHsFcQECNjR1UW
X-Gm-Gg: ASbGnctR/8hFRXixTUIr6In7isGNxNimTcoc/5meqF5uiTk2PI//eK+SiCbLenMFWRD
	W7t5p6jtvLrtgbMFPiDco1H28M68tPR2TWnqVovgJHIHeM9l+lET7B+Ugn66gtYrJmNu2SEsERN
	vTR/PbIyIpbg4lwsFrKg1TXK3cqkTknyYWfF6HNVN7yOO6ZF2QqgFvPn3hAzVE2JiuYjqMAuxbf
	MUOAdc0GxRu2n3eUaXZ935nJXed8a9fib9hGoKWVkwu/YeVA0OMRl/WaTSUWkWVbfOPg2n5ovBZ
	iQq2pjp8ZbHx7ll4sXJwdt6/91YJ6jb6GzTMKG+n49mNLi104/OafPU7zUtUbxLFCO3x0H8Hupw
	lj/PBV60KpAVBlFKoRR7cGS8XVdlQWF52
X-Received: by 2002:a05:6a00:1945:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-75722869e2dmr8491734b3a.9.1752749974378;
        Thu, 17 Jul 2025 03:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS/1Q6FwFVvJNpwEqbklIvf1jeMXGBNVBGHmlE5Rp/k57dq0BzAzgcVPz3GfhsuMeAZ0ucYA==
X-Received: by 2002:a05:6a00:1945:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-75722869e2dmr8491687b3a.9.1752749973872;
        Thu, 17 Jul 2025 03:59:33 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75914e6f81asm309433b3a.152.2025.07.17.03.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:59:33 -0700 (PDT)
Message-ID: <c4a4d594-a705-4de1-af08-42a72ec44023@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:59:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
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
 <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2uL_IPpi13pwYwGehAXz1HuyslTjXj-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NiBTYWx0ZWRfX6ucnIuLKNWIu
 oW6nBYrD9W9VzzIrpcygdv1W1wcf558bMaRo6iZqkuQx4GiCGX3ApMbn5nYEvAipAVRBbWjjF/S
 bZcHWYc4855nLVBriDY+vG/bPUUNIQJD18qBrpWGMyxu650fh3QyNvSuPfj3NE/BDT3pTEv3SwG
 pUkN6pAwrGwfyJMGoXjdzedwDqw293kHIlfwdwFsmds69PxekpAhYaj4/XMQp1YouKn4Dnxiw1f
 8JFNuqDAfBpbhYavcEoMtdELtzYfdF6BJaNAnbXvKjLbuTdqHYfdRxhXBw4VWVLdR5GK4glo/ht
 YK0mO4vnxFwQReVkYENApv5JsUs/ZF6EupHZhpUVpHlNbovYR6I/zaIROB1R/+27wIAYhzs5ZAA
 JMDH85YNNoPBOZ6Qw/Hzp+whT5Qs4RqvRYXn/Q5qS8Y1VqWNYCWRfeuuJdVXsiS35Hg/0V+D
X-Proofpoint-GUID: 2uL_IPpi13pwYwGehAXz1HuyslTjXj-p
X-Authority-Analysis: v=2.4 cv=JJk7s9Kb c=1 sm=1 tr=0 ts=6878d797 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Ghoe0wLkBCzmZIYDIaAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_035935_873743_FA9668FD 
X-CRM114-Status: GOOD (  12.19  )
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



On 7/17/2025 6:55 PM, Konrad Dybcio wrote:
> On 7/17/25 12:46 PM, Baochen Qiang wrote:
>>
>>
>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>
> 
> [...]
> 
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
> 
> It'd be useful to know whether that's a Qualcomm platform running
> an upstream-ish kernel, or some other host - we've had platform-
> specific issues in the past and the necessary margining/tuning presets
> were only introduced recently

It is an Intel based desktop, so not a Qualcomm platform. But it is indeed an upstream
kernel:

	https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git

> 
> Konrad


