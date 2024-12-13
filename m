Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33706E7717F
	for <ath12k@archiver.kernel.org>; Fri, 13 Dec 2024 00:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnJPmrz0LeHN3qYUvxdboiVX678r8gqWXCFVwvYF50g=; b=DvHfVV8Slld33VIAVh8EyZb3mS
	AnRFe4fRl9JjpYjD+LnboAva7irXqm9wkn6w/jK/Nd5jf8zpLKBERu6C9ddoQdgrRoZZtbNBEDnfr
	IrJUXP/jbB5zy2HGFQRxN0ZlfhomWbrDz9nD6geV1/t8LHIwoRv6OljTKaIgl1YVpe2xXsHThMaeC
	8NmcVrhRpAJ02PDADn/wTMIw7ErnwJaUII0a5OWsQrs71n8mPJM1fawwmleMtd3nDHGoRN5p1cAzn
	/1KDmIKS06/cQ4BxPM8BRAB75J42ozVCBRV70F7HmuTQC+WguoPmb223nopt/W4Gti6VmHF/FlnBM
	2+anSDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtOB-00000002GtN-3tqD
	for ath12k@archiver.kernel.org;
	Fri, 13 Dec 2024 00:18:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtO8-00000002Gt0-2DAE
	for ath12k@lists.infradead.org;
	Fri, 13 Dec 2024 00:18:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCH0Oc4032708
	for <ath12k@lists.infradead.org>; Fri, 13 Dec 2024 00:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnJPmrz0LeHN3qYUvxdboiVX678r8gqWXCFVwvYF50g=; b=laxb/s81I0HPC1cI
	dS97cmIsp9fAMYJIfu5n/BJPibeMyPNrRFx6Dsk+BF8tD0o5abj3CxyHbJr6tTri
	a2RHPaF7sXv/x/HHtU4g1lPbU2ixkY1br6atb1+iHfExuKqxZLOa2Ek2BrHdp5at
	rVywxUrvxN50MJjFLJlmZfDlEz7weCBmfORifvf5o+gAzo7rWkH/4z/uZRmOF42l
	hugZWdH0SjiYviDVtsUDlg7AZTV88ZYwUt845dTHZCc5F7uQCfj9L/sLkF5gy0kH
	8j5dzDGnE+Ip1b2FbuKc0Yx6dPyon4eQY+tfpL4no9mpz5CMPjV0GqfYnujCVw4L
	UO8lDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfdtsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Dec 2024 00:18:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f15481bbso3444346d6.1
        for <ath12k@lists.infradead.org>; Thu, 12 Dec 2024 16:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049113; x=1734653913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnJPmrz0LeHN3qYUvxdboiVX678r8gqWXCFVwvYF50g=;
        b=QHjbUXl7czVsN+0Brlw2iNqPXHSE5OEcE1VVRiLAXSpIoYKdBeo4/ixaXhHMjO1Ufr
         2PkI7ybgXyRobJHtW23Pr7nEDyiFZpjFVn+RdwW4nOUCf+/O0AkE3Wd+7078a258fIDg
         J626wBmVHKEbLY5WYqsKRuzR0Ci/Wctc6V8wPeBk2m2kgk+N2KgeTAb3V4iaNKwuC6aa
         ASYIYcJPNSb4sHdJgfk+4s/L17a2deACZ3iPfIV3Wq2VHnHUUSvZoBitZSap+wrgOHtX
         iSwaWTqcsTgazC1aLgWRXTXO1EolPNRy6898FkJx78n+Xh+pcksrIbTBoTkKtPqIqSRt
         uxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpSLktQV5bdv60mRgh7Tq9zLYhrlneYePuMNLRNj9tWmwNu8ZJvcqOCNoE1yKEgeDE8QqCyKI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3e5lvRYzn3wXQfwKV7v+AdX728YcETwRVdrbIkGAeMAOxC1FP
	vPX/gp6yLW4jgmEx14qo16iqawH+snc7ZSELgoLVAGznngfSrrHTc/n1qKrmdj+yV+LW5IO2374
	BHq6FJF/599unvTmlBlI2sMkOWrpNd12ZTfwWixiq+zK0CPhNUSkAUo9pyGT0
X-Gm-Gg: ASbGncsG8OGUqtP8x661bMfMwvb5irrJfc7kj5c5rHcz352tf1e/S1l/L9xjZsCg4lS
	re1s5jCb/BDyPkvm1j1X7+2L+74rhufU3MJnIWmgOLAIjXlfm5xiLGJ8VtPejMinv1XTn80iSlG
	t+POSjr5pBlDqw84uXvXSgoY5w6ojJvexPVCdDi0wE2b83euu4qQYWvxwNg737616Kbf3dCBi7V
	V0p0DxEv9x2sebvBw/ZVzoII+l8mgoLiKJecKa91y48HIompZOuXp1ASyiO+dxNH5+t6p8+VXjl
	C3zx1mkclSZFAhCKmn4KfA02yskc1QL0G8A6
X-Received: by 2002:a05:620a:192a:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7b6fbf088c3mr25647985a.7.1734049113312;
        Thu, 12 Dec 2024 16:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHESuoUw/QDmsrIP5AQDKgWxFZtU5J+bURwDqhfhD9dKJRI8vhhA3/GIlyoCinrIglwX+eP0Q==
X-Received: by 2002:a05:620a:192a:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7b6fbf088c3mr25642585a.7.1734049111911;
        Thu, 12 Dec 2024 16:18:31 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa671f14766sm769393466b.169.2024.12.12.16.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:18:31 -0800 (PST)
Message-ID: <e3dff1d0-989c-48db-9fd6-6b3c209d1452@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 01:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware
 parameter
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
 <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
 <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
 <83d216c4-bf9e-4eb4-86d3-e189602f37cc@oss.qualcomm.com>
 <30e5d714-2e52-4a0e-9dc8-b6cacf6ad382@quicinc.com>
 <e63af513-5fd8-40b0-a1b2-daa9821ebf5a@oss.qualcomm.com>
 <b3581663-8dc0-44d4-9395-df385316bb09@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3581663-8dc0-44d4-9395-df385316bb09@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dXh-ru4mqOYeNy5iF70_qqn8L_E7rT-H
X-Proofpoint-ORIG-GUID: dXh-ru4mqOYeNy5iF70_qqn8L_E7rT-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_161836_574452_1D63C160 
X-CRM114-Status: GOOD (  17.09  )
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

On 9.12.2024 5:23 AM, Raj Kumar Bhagat wrote:
> On 12/6/2024 4:19 PM, Konrad Dybcio wrote:
>> On 6.12.2024 5:34 AM, Raj Kumar Bhagat wrote:
>>> On 12/5/2024 11:12 PM, Konrad Dybcio wrote:
>>>> On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
>>>>> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>>>>>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>>>>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>>>>>> memory during QMI memory requests. This memory is part of the
>>>>>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>>>>>> hardware parameter and provide this memory address to the firmware
>>>>>>> during QMI memory requests.
>>>>>>
>>>>>> Sounds like something to put in the device tree, no?
>>>>>>
>>>>>
>>>>> This BDF memory address is the RAM offset. We did add this in device tree in
>>>>> version 1. This is removed from device tree in v2 based on the review comment that
>>>>> DT should not store RAM offset.
>>>>>
>>>>> refer below link:
>>>>> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/
>>>>
>>>> Right, I think this could be something under /reserved-memory instead
>>>>
>>>
>>> Thanks for the suggestion. However, the BDF_MEM_REGION_TYPE is already within the
>>> memory reserved for HOST_DDR_REGION_TYPE through /reserved-memory. Therefore, reserving
>>> the memory for BDF_MEM_REGION_TYPE again in the Device Tree (DT) will cause a warning
>>> for 'overlapping memory reservation'.
>>
>> Then you can grab a handle to it with of_reserved_mem_lookup()
>> and of_reserved_mem_device_init_by_idx()
>>
> 
> The memory HOST_DDR_REGION_TYPE is a bigger memory around 43MB, while the memory
> BDF_MEM_REGION_TYPE is smaller around 256KB within HOST_DDR_REGION_TYPE, Using the
> above mentioned API we still have to store the offset in ath12k to point at memory
> BDF_MEM_REGION_TYPE from the start of HOST_DDR_REGION_TYPE.

That's still way better than hardcoding platform specifics in the common
driver

Konrad

