Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E92C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5zAxQbACyM6wJZKsUBJnL/IIfNHWJKjt9GVA+vzAyg=; b=HNgkWVoE4anvM0a/HVBGvvQu1T
	8zBm0mrPh77877kZePemzTKeumKRFEdxtyYmIA6Y4QElbM1IuUKf1TzK18XnbPKbREY76FpR2CRAr
	n4iftgP6cPhVKHhCzeDuAf3d/hr8SmvuxlqQ0W7IhP8wh4Ezcz9R9rBDuv2xYwFkqKboccXjtg7V1
	I6uVMHyYi8geM4/9tlFKElvV4pCBhHGqKWoZn/4iMIw/Zvgeqou//xO1DzWHemlLiQIiJL9348f8d
	3TsJD29lFkr4Son8JAb2fq9hl176ZR+Dg5yIC6RSgwCbpEzztj8dBXJKPFAJlp5P9O5+dBkILbm9L
	f5+KUOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdDm3-00000007gSy-2m6g
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 19:30:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdDm1-00000007gSK-0LKV
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 19:30:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TIXMlL021413;
	Wed, 29 Jan 2025 19:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5zAxQbACyM6wJZKsUBJnL/IIfNHWJKjt9GVA+vzAyg=; b=QvrfNZf3nGy+eCnN
	DS7CTA53hjEvBElynFWStcHokhLknjCKymaIwr/SkAxK+03qowW41dreFzsEBG0a
	gy4GQ4Z70oIZKEMLY2i+wIQe0dBFlJfz7eDJORkP4XDJozoN6Bf85QN85XgQErIR
	77S3GI+OGhr9egvX9OkfmkO3Vefe72zFWXY85SYFo20vzZmmzEo9FO/FjUDnjR7V
	7S9d/ykC0g9+30bRpQS//291nlQ09A0o6GnO1KuTLuAxKh5fjJavCsSt3Bv3OcrB
	o7UIMrtJSlL517Mj7D/1l2QjpG5vXTNYd6bt1EBr40e1THvPWY66uAwb+4FIaJvl
	+1tRrQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fsq285ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 19:30:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50TJUnLA018036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 19:30:49 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 11:30:48 -0800
Message-ID: <dedfdb8e-c5b4-42fa-bd76-ca866ab1cf41@quicinc.com>
Date: Wed, 29 Jan 2025 11:30:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
 <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
 <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
 <961df6e7-0b5c-4972-9324-5c4d430cb172@quicinc.com>
 <54d456f00aa8a806768099df55dc9f2ef734209b.camel@freebox.fr>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <54d456f00aa8a806768099df55dc9f2ef734209b.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fhCo870AM7CgWl2gZkp4MvPBHhtAzAOG
X-Proofpoint-GUID: fhCo870AM7CgWl2gZkp4MvPBHhtAzAOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_113053_256321_B5B6EEC2 
X-CRM114-Status: GOOD (  12.49  )
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



On 1/28/2025 11:13 AM, Maxime Bizon wrote:
> 
> On Tue, 2025-01-28 at 10:44 -0800, Pradeep Kumar Chitrapu wrote:
> 
> 
> Hello,
> 
> 
>> Currently default is configured as FORCE_SGI
> 
> "Currently" with or without your patch applied ?
> 
>  From my perspective:
>   - without your patch: DEFAULT_SGI
>   - with your patch applied, no fixed rate: FORCE_SGI
>   - with your patch applied, fixed rates: user decides
> 
Hi Maxime

Yes, your understanding is correct..

This is detailed explanation.

In 11n, 11ac, the supported Guard intervals are
0.4usGI (Short GI)  - enum value used for this in firmware  - 1
0.8usGI (Long GI)   - enum value used for this in firmware  - 0

If peer support SGI, param_value 1 is sent to firmware where firmware 
switches between SGI/LGI based on packet error rate. This param value 1
corresponds to NL80211_TXRATE_FORCE_SGI in nl80211.

If user overrides this by setting default GI specifically, then we will 
override this config to send enum 0 to use LGI always irrespective of 
PER in firmware. Using SGI would slightly give a better throughput.

FW uses 0.8us GI by default for 11ax and 11be.

Hope this helps!

Thanks
Pradeep

