Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB20C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSXqZkBG0aQd1sAXt8lAk18tEzsXZx0nYrSAK5+olRo=; b=kS4gUlIFB/Hi0egu7XHz1ALvnf
	Wc6nYdWj1oOuvfPNRek+ukJLBXhP08qYHgVwIQ3q6vnxBFF3o2oi3k1+Lq0DAkkHiut8KApf8LuRD
	MfeAoFRuLrw1NZRqSJrJkoShozC/l+8Rm84QRwGe9W+KeDC28Un2OKqQ09I0stPWDM7vGmfq0OVu/
	naErMKu0Z21Z6DDqM4VJ/SkDNOq6ZFK+4x/O103Uy9NIpV440aQUSHSiVi6twPkNbzPE2VTZA9LTq
	//8/oRWYl3yqZfM4Oa/fQ1WPOzofNaWGoiDgt5lg/2sl25KZ5WpOsMMDcmvU+SfI/6wuj1fNzyT1G
	72PIkkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05Mm-00000009yxv-20Z6
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 20:06:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05Mj-00000009yw4-024I
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 20:06:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P9xulA002621;
	Thu, 25 Apr 2024 20:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=FSXqZkBG0aQd1sAXt8lAk18tEzsXZx0nYrSAK5+olRo=; b=Tr
	yy5F4xtRpiEWriHCFwwq4g/qu5S6Sc/qoDoGCgZBj2fps6afO68oj+G5dVXJ98oy
	5wktx6ztza80HwCTobIWRVWGx6acqbZyQpaM9WENSghjTQjRvVuxiGCGsTNEIycF
	oYzvHL81Z92GLI2F1uR/QO1IeCYZoFad031e/2z6ENY/l9RBc52G2hMyu917doDc
	yPFqZiyDpOnqY98SorLGTYPJHmzRYw99oAgUbe7tNGd7wfplan49RKhrbLiV4flq
	Jx0kEKWbEKYY+x9c2kvFshVY5Qlx2VHx5ykd+j1RjgFWlXy5CAL8YVMJZLWSeCiP
	kEIDSLA0k1quHg0HiGyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqn0whrrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 20:06:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PK6f19017358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 20:06:41 GMT
Received: from [10.227.91.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 13:06:41 -0700
Message-ID: <a81aea48-740e-416e-b29f-e94d7fca371b@quicinc.com>
Date: Thu, 25 Apr 2024 13:06:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/6] bug fixes and enhancements to 6 GHz band support
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
 <6eda8fe4-bd89-425c-8717-65ab42e073ba@quicinc.com>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <6eda8fe4-bd89-425c-8717-65ab42e073ba@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zy0Rh6m6HJezPdG8itOrI1MXRZiW48-l
X-Proofpoint-GUID: Zy0Rh6m6HJezPdG8itOrI1MXRZiW48-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_20,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_130645_191180_C67A08B5 
X-CRM114-Status: UNSURE (   9.82  )
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



On 4/25/2024 10:45 AM, Jeff Johnson wrote:
> On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
>> In 6 GHz band, add support for
>> 1. channel 2.
>> 2. Fix packet drop issues.
>> 3. AMPDU aggregation
>> 4. SMPS configuration
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> changes in v3:
>>   - address review comments for fixing ath12k-check issues.
> 
> this should be more specific. at a minimum it should indicate which patches in
> the series have been modified
> 
Thanks Jeff, I will add acked-by and also address te other comments in 
this series
in next revision.

