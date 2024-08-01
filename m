Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E95DC3DA4A
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 06:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNo6/gxM1rLGBcliP3cTqkYZyKg9Syd+5iPaCoyo5m8=; b=VxLyfbcFoXXaqNVIOic+twMQ7h
	OMpxb1cbNZvpCCj5TBFYVSCureQzZHzrPprkdViKke8ayXGHG6Tbc+WjARBPVdHKv0UWU6+LgYCJF
	CwZEpxX1CiBT5ucN/ZtPiryul6irQ2S6jIOD4U1pd89L53oJtI3BtBB3Z1FhGWG0bMSRjHJFqZfYS
	R+V+CaxWNHaCRHni8OeLuHuR7XlrgkVO7PQ5VAVGFpG+Gfxoj5zuyzyueF7zUQJyfqI1/s38x3zE2
	iBgpci1eFXdMMQVM73avygfN/u/RVHhdY35cv8oMlLmrSg6uLyLlpbZxRdBpcY+DV70Qy801E1AP1
	z8duro0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP09-00000003rgS-1QdS
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 06:09:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZOzm-00000003rV5-2tm9
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 06:09:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VNMb5Y030523;
	Thu, 1 Aug 2024 06:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNo6/gxM1rLGBcliP3cTqkYZyKg9Syd+5iPaCoyo5m8=; b=l6JUvGm2xDHl9R4F
	29LorhF/5Yjtn96DzBhLMUXAzCcjDvOIz0nnj6uV/XeLhICSctA4l6egOiv6jipQ
	Q/CTCUjm/PNk3PbAiiulmUsdpC/e1FaS4R99aT44i84BDFwrzEZWq4MCmDI6hQsl
	kF/1S6HjrAr6uciM698H1rzkEBuQZ6iZLJ0dK6v6vhnzwBKZmORYjjczhNQZxzgA
	THnAMi09z4tu0Y/83WkcYc29z0qD1dyEdpJtWrRSYRKAkOsLN8JjV22McUs/aUoU
	7f6ymjpGRVRaj26Zz6cuaYR489MED3oe7vK/f4VV5liR7ybIhDLZ8wVXuGpteD9o
	NJgK0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qm082ss9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 06:08:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 47168vtE023335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 06:08:57 GMT
Received: from [10.110.121.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 23:08:56 -0700
Message-ID: <4e92994e-33d0-4104-a0a9-5f75833e09f3@quicinc.com>
Date: Thu, 1 Aug 2024 14:08:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] wifi: ath12k: some fixes and clean up for monitor
 mode
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <87ttg5kdvc.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87ttg5kdvc.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OyYX_VDZ5d51Y02P08JRVoDbYkm54BWz
X-Proofpoint-ORIG-GUID: OyYX_VDZ5d51Y02P08JRVoDbYkm54BWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_03,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=773 spamscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_230902_769511_A9AE6FEA 
X-CRM114-Status: GOOD (  11.00  )
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



On 7/31/2024 7:19 PM, Kalle Valo wrote:
> kangyang <quic_kangyang@quicinc.com> writes:
> 
>> From: Kang Yang <quic_kangyang@quicinc.com>
>>
>> This patch set does some fixes and clean up for monitor mode.
> 
> Please fix your SMTP From header, it's currently:
> 
> kangyang <quic_kangyang@quicinc.com>
> 
> It should be:
> 
> Kang Yang <quic_kangyang@quicinc.com>
> 
> When you fix that git won't include the extra From header to the mail body.
> 

Thanks for the reminder, changed.

