Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FF5E7717F
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ort0GV31p2YM3MvyRNsoGkSoXOVVWpb4ngbvI+xOaDA=; b=dftRmEAxPb9bxL5tlH2ZSJVCVC
	TIIK3fSQAXeDjhTccTshBpqYekgzo6C5kr/6akN0qXZ2aeq4tq9Bb+yk2oi/tGZmwcsbv0LRmG8ze
	lI+Tbo9z9LtEjMwV+LUJnj/7y/6AJC0Yh6/IQ0upnXt2/7aA3Fr55BqH3Vxl0LIMrtcRCoPGGi+EN
	KvzOIY+qFGo58aAzM+2xsSwTmhf2gDumejdJqK1uQoFv7+9i4G+EEg/qh4SUEDMS7JIQwSxFWRG+x
	S6mphFWc5A+dmXYBF78RsHIEMyqRODQXndWPDnv57bU60zwNNPDWVXbHh4D/ovH6s5GDepVsmJK8Q
	4xYr3POw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfep-0000000HWhY-44Pv
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 09:38:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfOC-0000000HTAA-0Uii
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 09:21:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7YbXO032522;
	Thu, 12 Dec 2024 09:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ort0GV31p2YM3MvyRNsoGkSoXOVVWpb4ngbvI+xOaDA=; b=X0EipQOn/rTDLZdK
	TOz/fcWTZlbkYaZLywngtoWu5nAZlzdMnfpYnflha6NqomhVaq7otN1o0J0v/aC4
	mNxrv3Efz1HXY4NxrbJW/2UaQL64cnEEMfzLHoU3qRthwFPpFj+pWh51tmWUD7Oi
	IwowjwHb9IHKusNsdtO4n9hCVGt9W1DWDVJCFan5jvNlhjInwxjJAw+3xt9YqUQM
	5/+Buem0Z8HEzJFZfsKsHedGj4YUq9ibu29nFHV+qPhATD2fKvJEN3ADEKgxPD4t
	kQFwqW5XA5cx7uAs8aVddQ+tYPWiH+NgYPB1Y3dYR+UJB61jodF2NHWW9xBhqdf4
	eVz0zg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfbn8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:21:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9LXna002207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:21:33 GMT
Received: from [10.50.0.236] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 01:21:31 -0800
Message-ID: <c9605cae-809b-6f52-927e-9bc59a6d9c02@quicinc.com>
Date: Thu, 12 Dec 2024 14:51:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] wifi: ath12k: Refactor ath12k_hw set helper function
 argument
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
 <20241212004906.3087425-2-quic_periyasa@quicinc.com>
 <878qslqr70.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <878qslqr70.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2I9on2QdY9TfPxn6MG3FGOCgB_rN4xVk
X-Proofpoint-ORIG-GUID: 2I9on2QdY9TfPxn6MG3FGOCgB_rN4xVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=752 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_012144_173446_0310636C 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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



On 12/12/2024 1:16 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
>> ath12k_hw set helper function takes the device handle and the index as
>> parameters. Here, the index parameter is specific to the group handle.
>> Therefore, change this helper function argument from the device handle to
>> the group handle.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> What's the user visible impact here?
> 

No user visible, it just help to avoid the dependency of device handle 
(ab) for using the helper function ath12k_*_set_ah().


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

