Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D6BC54E66
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 03:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAmrHMQaRhpNKwTcYiIzpc+fyv8/JvxKZ7z8xq0tZT4=; b=Ip8gDCjbtNqbEpSi+YqRsV5yEF
	WB5JBcKQmZ/zGMTGqIYc9XjhBlHzzNl/Ivy4er9ZBjavzZXm+UKLUnkBtJeWPBFE46J591OXOy6kZ
	2SUsX1bvZ2EdUARu19Ft59NbqpvxgMwJu/4KvXnHp8r1///Kq+oqFzuUwgdxnhhOyw7rl6k6sJvWe
	xo0bJ3zLLv9Ly3FE5lEmlyBDElO9PdFJ1Fq36AyvVsrDu9uOskcnJO4OfxKVdaz4A1iNlbf1tY207
	XuWCJgXfqvxbjKPD8jVyhcIa6rrdqkvGcIbyPqbbz8YSFLmLgeuQdCR6BjkKgiO0VyEg4R5nIfjtZ
	TwP/0VaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbg1-0000000CnHr-2s6b
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 03:22:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbfy-0000000CnGq-26cF
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 03:22:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E1FwJm027195;
	Thu, 14 Mar 2024 03:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EAmrHMQaRhpNKwTcYiIzpc+fyv8/JvxKZ7z8xq0tZT4=; b=W7
	vAQkyn+QAjjxQdZlickSQQCP/7iWhJRxxN3eM3FqBLlLNF78V17iSVPi8DYCdzoA
	7NhRgMLHv+QyeOGcBHbPxgYUiIQRYAAnc9FrucWj83rN+00tzOOz3U7KTnk4ttVd
	Wtx6egH++nXbEHKAtmwvFnK3XqMUK6QtPg6EDSoBUW57i2rA1cjT2oV9UAieCSyI
	fznMYbFC0NPRkEYxbHlJ6+xAf4+DpEG9Pga3eTajvcquAw8UCnHwbug335/oeLUe
	euDPfm+aWggeWDsljk8PMnPFkFNkgOsJZcMrkVYrXPAQRT1OYsCsVLaChhA96Lu4
	o/nVNCtoVMLgQqG/cO+Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuc5f9ty6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 03:22:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42E3M1bX026185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 03:22:01 GMT
Received: from [10.253.38.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 20:22:00 -0700
Message-ID: <4f79391f-cd81-4a3d-a236-447cb4c1f4d2@quicinc.com>
Date: Thu, 14 Mar 2024 11:21:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: mac80211: supplement parsing of puncturing
 bitmap
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
 <20240312045947.576231-2-quic_kangyang@quicinc.com>
 <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ea00wEw_5WFrFE92N0m03flU5jqox_Hb
X-Proofpoint-ORIG-GUID: ea00wEw_5WFrFE92N0m03flU5jqox_Hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_11,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=955 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_202238_820937_CCBD5485 
X-CRM114-Status: GOOD (  10.93  )
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



On 3/12/2024 4:16 PM, Johannes Berg wrote:
> On Tue, 2024-03-12 at 12:59 +0800, Kang Yang wrote:
>> Current mac80211 won't parsing puncturing bitmap when process EHT
>> Operation element in 6 GHz band or Bandwidth Indication element. This
>> leads to puncturing bitmap cannot be updated in related situations, such
>> as connecting to an EHT AP in 6 GHz band.
>>
>> So supplement parsing of puncturing bitmap for these elements.
> 
> Hah, yes, I just noticed that too and fixed the second part yesterday,
> and was still thinking about how I could test the first part :-)
> 


So what are you planning to do with this patch?

Any suggestions or you want to add puncutring bitmap parsing by your patch?


> johannes
> 
> 

