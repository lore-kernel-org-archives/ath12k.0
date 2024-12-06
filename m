Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5008AE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmzSUIXipKayF3xY1od8zx8fw3lJ7UPJ30/Nq5MaUlM=; b=u0BU8egbv0xcBGGe/xD6PrAXd8
	KmS8NebEq8Xf8CakHzmWRDclJazT7042vfsBiV3ZTNnV0m+sIVdBcFn5cpZk63HNOgmgR4eevzDzU
	fiGd0sbnl0O+rOu5Xov8XfPfLMTTm7+bgSeyH1bBgX29i91qiVRdMjvPaUNOV18J7KUOYfVEWeOuH
	uOLaauaSEQ+1B8Q7TgtpaJIbZRKAGgasVj//DnChPZyvV5iEz8rFRq7SQDxhVvAWYXZak7JkR+Hop
	6/6VsHCrPbZMx22VB0W3XKynGKSYroctpgoZgS+4BsbkYg66ofu3wG5wrICorLZcjkcMSS4my3gki
	QPz8Z2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVvy-00000001MpT-0CQn
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 10:51:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVtg-00000001MLA-1uIy
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 10:49:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69c4tW026575
	for <ath12k@lists.infradead.org>; Fri, 6 Dec 2024 10:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmzSUIXipKayF3xY1od8zx8fw3lJ7UPJ30/Nq5MaUlM=; b=O1qqw88731XtBylV
	g5W3rltm9Bj0Oo9ofChkoRJ6tEtMQ1v+2lFYhL/PKUxGpcV2HogsaiXE7YJy/A2K
	LVNStJg1gRd1GFjMczVs1Xy0p+6EPhcdZSRXTYs8jYD7lzTkMq0ka2UczSipuIEt
	ThHJyDcnd5qC089b91HL+46xXw7B3KOvCXQqBY2vbqHndZfqkOdEdyH8Zo6lysi4
	/tHZZdl7AFJn6ivlSvvR9SNULc/x1xwo37lihMClzn6cSGnA1MrZH0PdIGzzqxRT
	tealzV4VfhPUXIHuwu0Q9MVUHQUJn65AnFCPQtOO3D16VfWNvrdmpSDGi4HgMcqK
	rD7emA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc86gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 10:49:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8824c96cdso5058346d6.2
        for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 02:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733482158; x=1734086958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmzSUIXipKayF3xY1od8zx8fw3lJ7UPJ30/Nq5MaUlM=;
        b=jgXqOkhzrz7KnimYXFkFponXg+sMCz/xArOerUxBx1wlfVcq9ioU1c/R1agFgM5b5b
         Wlqsa4LFDaS16m3n38fH1lW1uhOXiGS/pW99i1Rh00Ov/GGdDGlD8ekVz0uMOcl7rs/a
         ux6KWu+07er5yZA4ClCuwa4VXAIgnxkhCS0IM88vq/iRNlN2GRE+PT8EuLeklKpnfrYc
         rAg/ScebN9MUP9be9rVny+22o3u+/oF+G/D3RxzgH3BKuaEYzJMl4atBjTt4ETCrkBlK
         KpJkullJ9rvmwMDsVHM/0rNe0P0WpDd6svSS2FPqCL7LFgnQQQUDs9MoqU0cT5KmuR7e
         qxCw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9Q4dhJqjJUeOF2k3ROOos6Ewanz1BPz0s09WGeAhDDRSuIkxJ6vW8nXtANyV3fjEc1CPUXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWHd2nuZEMfpNPc1yUT5YaFv8m+88N5YhloPI+MERmk/Ipahg/
	+9+fqm3+pz5JQQDFTROHNJ4C/Fq0BEr3pQy+Pk5XwRzt/R5JyY3j9s0mtUaoSPm3k4Vfm65P+iL
	cYsJIVibLhlpW8HeOF0ShqzwUaNBZN4ZfCsFqe8Pvxw0P0R3S/9R0oI7GUVaQ
X-Gm-Gg: ASbGnctFh4m0wTsyOqxFXInLO+0MYgJYkSTId96Z6+WjocfCG3A2If7EJ8u5apDy7QP
	jy1AaG3XCZfgXkzFDvq2Y/ZJj5BiUl/pDvBUJqjVIYhEPLcCbCWDZnjlROb2fICHibEpfpoIWlr
	0+PiML34bPotijG4d7Z4A35zr/8FStp0KifUl2WcXo8rlnMlD3KBCYPXvK7PkJKUWUXNRQhLsbO
	NDSuGulWLvmW6y+Rs7de5NbDf5BZlq4IjviGn3hwXJ78oop9yYD+BFBxSHG205DN6NPQp7AwbJz
	N2k0Uep+rm5BILkC+0UMg2mSFdtGdLU=
X-Received: by 2002:a05:620a:2905:b0:7a9:b9dc:1b95 with SMTP id af79cd13be357-7b6bcb04ec6mr134939385a.9.1733482158483;
        Fri, 06 Dec 2024 02:49:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNXW/loUXUOCTdG4RUTS4LHcC86Y48mc4tNSrPbk0WXGI8Acu/+JWm0senE7i5qm0oyG2niw==
X-Received: by 2002:a05:620a:2905:b0:7a9:b9dc:1b95 with SMTP id af79cd13be357-7b6bcb04ec6mr134937585a.9.1733482158106;
        Fri, 06 Dec 2024 02:49:18 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa3besm1975925a12.75.2024.12.06.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 02:49:16 -0800 (PST)
Message-ID: <e63af513-5fd8-40b0-a1b2-daa9821ebf5a@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 11:49:14 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30e5d714-2e52-4a0e-9dc8-b6cacf6ad382@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xTb7cR_bP32N0zsr6Uq6ruyds2w1onOJ
X-Proofpoint-ORIG-GUID: xTb7cR_bP32N0zsr6Uq6ruyds2w1onOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_024920_625020_0AE3C311 
X-CRM114-Status: GOOD (  15.36  )
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

On 6.12.2024 5:34 AM, Raj Kumar Bhagat wrote:
> On 12/5/2024 11:12 PM, Konrad Dybcio wrote:
>> On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
>>> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>>>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>>>> memory during QMI memory requests. This memory is part of the
>>>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>>>> hardware parameter and provide this memory address to the firmware
>>>>> during QMI memory requests.
>>>>
>>>> Sounds like something to put in the device tree, no?
>>>>
>>>
>>> This BDF memory address is the RAM offset. We did add this in device tree in
>>> version 1. This is removed from device tree in v2 based on the review comment that
>>> DT should not store RAM offset.
>>>
>>> refer below link:
>>> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/
>>
>> Right, I think this could be something under /reserved-memory instead
>>
> 
> Thanks for the suggestion. However, the BDF_MEM_REGION_TYPE is already within the
> memory reserved for HOST_DDR_REGION_TYPE through /reserved-memory. Therefore, reserving
> the memory for BDF_MEM_REGION_TYPE again in the Device Tree (DT) will cause a warning
> for 'overlapping memory reservation'.

Then you can grab a handle to it with of_reserved_mem_lookup()
and of_reserved_mem_device_init_by_idx()

Konrad

