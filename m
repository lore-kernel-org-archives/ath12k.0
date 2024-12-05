Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C735E7716E
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hx57Lu41ib8MxOqYtwF0SnxIqxAgV7Fue5Y4OtnFhH8=; b=Du0jtO63Eij5Exc/fJN+Oq9sqD
	HpL9Lxb3Kn8XAb+Wh38dBW+AmCx1Hqc8xswqTspkHGK+OJLEw2MDTsuqgFG7Lzltwx2hdtutIQGFl
	hi8x+YGwjLwVwbjgQfFQOIEK87XSSIJMAImV85OJ8YUqXFkB3LRV7aKUp3AZVu7EFp8mNvpgYY1Zc
	+4BRJCYS4BTedcYhtPTX/ZBN/TmSCUTF2QtcXSwNcmHfVLEDw5WHYn1bhXU25Gt0JY9DfduX5rnRN
	wijDJbXPftvRpD+oVAwBIohALvNDTH3jhKEkkriu7j2gX1ovYnDRWMVyYZ7qhhcw8+xUBkDtQzJTH
	iWWd7FNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFvD-0000000H0R3-3orz
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 17:45:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFsT-0000000GznH-0hlp
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 17:43:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Ha171019014
	for <ath12k@lists.infradead.org>; Thu, 5 Dec 2024 17:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hx57Lu41ib8MxOqYtwF0SnxIqxAgV7Fue5Y4OtnFhH8=; b=I6Fm9oz4a1EJ7ENG
	PsbiW0IRJMvanLT1b9O8hYQ4fjnKE5m5MnpbeVEjgveE9lo/7NOchAiXMv+8Iu4K
	i7iWuzZ582HcXBmKdY/07iKVFf+bgv5DVpRHBEcdH/1TSGMVRk750D3jtEOHEeHf
	9e6HAOEat3PO6YoEwX1HoDEZs7JRj/FUuezoSRSLIEPka8mHcrNP3u8ulxkVDpZL
	83ErgxQFuDcEdaTCVMHd0lzTbLaleatr+fK+J29Dgg9wWyhNa0WmVUzC2NpADBeF
	sh2xeVw8yQSBe7m3xmDGcLDXSUWtecJPRnLBgXqG9MUi4GGeNZ36p9ydt9paBbak
	bnBO3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w910eh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Dec 2024 17:43:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6846a9b6cso2700985a.0
        for <ath12k@lists.infradead.org>; Thu, 05 Dec 2024 09:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420579; x=1734025379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hx57Lu41ib8MxOqYtwF0SnxIqxAgV7Fue5Y4OtnFhH8=;
        b=iP/i002b5vrUl/UD0n2ETyxMDFucOQb/BOtIv/f7TdM4B/oJlJHx1SKqH4/T7WQXzs
         Dp+srBF/F9lEfe31tMNhSsgTQ/I03bibJQzEgT77QbR2z/HAU1Lz6Q8cWVT+2gtgx700
         07kSTCv8zglfOhaW4T7HoVjqNVExJ/e0tcRzlSO07WVYr0PWpvRBN7WGnN7pRpTmLgRa
         tCFlZdsepB9fLdTZV3inUW0Kxxa537rE7See0ha3+jwFjWR1VG/W15sm7TsT7RrIkqy9
         V+mDpmyug2P3eAhFoE6kcH5/qE67+kfPlvyC7XrM69K7bVf+jgD6ppZUgE4UNue3jnCy
         P8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu9+jN5ytWQPMCT4gPf9u2HzKeHCsE57ia96KvEvNQo+MpFXOoX3gUcovAje1YR3FFysdpKsA=@lists.infradead.org
X-Gm-Message-State: AOJu0YywNfp8Ny9Jei735zYeTKKRIK5IxAEc0FFvWibeu8aFyBaw66vz
	k1pQ2L3EuhJlB/iv0LsydgA6SBQvXXIG9YFJRxQXiTrYVYQ3xeCdIQ6vEtxMsvz20R2nJm/CvHN
	tsXV2D/vdNrLDFjiLnTCDmUDTkdXb1b5edF5Uf2n/F6fp5HV1WZMIQwqCK6l5
X-Gm-Gg: ASbGncvpN1qTnHMBzn80jE+acLa2GGP22+3XlsJ5ivSCyfMrgt5pQbxB79NlXkbIWkJ
	FERTUT2UluyZVdsxa4bpSCLurP4ZmQ+R2icKYffbVlPjMu7ezpxwdeDGqTPUgRYEY/SpbDvpw4D
	GnVuLPL+oUzRCWynpyhoCBJYPyGbaF1ryVQoStBMkxRs88Rw+zjHGIDdCzhpaCbMrxWC4XklvaO
	9XkBd5hjbagn/ddhdrWFqXFLYOnE8VaYalqtA+ZKXivkCmKVhMoy2UcnKz75cLltdb8QassRhm2
	gRiSOHbPihTWY6HDUbflvkv/9s0cY9A=
X-Received: by 2002:a05:620a:2a0a:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7b6bca1437cmr6493085a.0.1733420579473;
        Thu, 05 Dec 2024 09:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqTIBVAUtYMFwIH7nMUAnsmsAxJGz+whkQJCNEPVEIPV7Fzd+DE/MjzrxB52NAzHD9Q0SRpg==
X-Received: by 2002:a05:620a:2a0a:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7b6bca1437cmr6491285a.0.1733420579088;
        Thu, 05 Dec 2024 09:42:59 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbf3sm121879066b.12.2024.12.05.09.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:42:58 -0800 (PST)
Message-ID: <83d216c4-bf9e-4eb4-86d3-e189602f37cc@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:42:55 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3cCaUr5XB6QeisMeS6oZcsVjXFk7whdn
X-Proofpoint-GUID: 3cCaUr5XB6QeisMeS6oZcsVjXFk7whdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_094301_327049_402F9A87 
X-CRM114-Status: GOOD (  13.47  )
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

On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>> memory during QMI memory requests. This memory is part of the
>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>> hardware parameter and provide this memory address to the firmware
>>> during QMI memory requests.
>>
>> Sounds like something to put in the device tree, no?
>>
> 
> This BDF memory address is the RAM offset. We did add this in device tree in
> version 1. This is removed from device tree in v2 based on the review comment that
> DT should not store RAM offset.
> 
> refer below link:
> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/

Right, I think this could be something under /reserved-memory instead

Konrad

