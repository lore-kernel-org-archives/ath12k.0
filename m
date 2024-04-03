Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7266CCD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqkf5lQ/fDuGQnjKHJNVonlY9yGRjWaX2QxXO6E+zAc=; b=4JGq8eMNFu+aAC5ILIJmB47Ma7
	qDW2u+rTY4ebaIDQEXEr08d549VK1jAUq7/XisEn0UHuVhoaDNo9aOttVnTlVpo4As5LxBbEC7ySv
	kx4TAvPnZFnzd7bNraeI+aLUBkE5lgjge+SURbaHETNJPtPf9gLzcQae7L1IogqFEfRUOe2Ti5nAX
	tFWHztuLX9E2vRurq58TDlmloc+I0MG1Ef62f7GGoIENN21x7SSY2B5J5UQJbU/q/i4Byu0z8HPM9
	ULvvboID+OnPDGZ1IS1zPKBrupPe8i2r3pqxKND7bHMnk0pbbj6QHFjP9Fz+J7kcE0dksOMvtJYmh
	LYfClK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrygF-0000000FkXX-0JDp
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 11:21:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrygB-0000000FkW7-221c
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 11:21:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4338g8O7021480;
	Wed, 3 Apr 2024 11:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oqkf5lQ/fDuGQnjKHJNVonlY9yGRjWaX2QxXO6E+zAc=; b=X7
	zDRydPnnRp7S0Z6dm5vzxbgn419CGVApA5eEFb2a7ptFQfKrIIoqCoHp0J9fbuO0
	7YOHAyBJalrNMLrUqz1LfhZdDpE7Xxa7RGBFKIXcs7vO6NdGPYb1Xl4YYwBWPs+y
	i46uNyxFpPo6ddpHgBkTf3QcwRbUSsMVHaUJKhNMlnuSAk7l7MSyaFMy/sIhRfp0
	xiWPmo6AzTlJA9yN6UQU1vvKTcrUDdGNgDEhXopsoOLFV/cqpmejvrCVxIsmMWP0
	mluD/JX/LXhrjzShplD32Jum+ji08uXv1R2L6ddrd8MsORHZUrwad+YnmH5AIfMl
	rXpsw3Xr3lJ1RHDY0geA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x93u58b2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 11:21:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433BLE2j025828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 11:21:14 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 04:21:13 -0700
Message-ID: <9200cdc1-00ae-d3bb-1f3d-abb4ce993cf7@quicinc.com>
Date: Wed, 3 Apr 2024 16:51:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/2] [RESEND] wifi: ath12k: refactor the link capable
 flag
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
 <87o7aq68a3.fsf@kernel.org>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87o7aq68a3.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tzwxm9eqnnMIW3H6A0DCNe5yQdNU_LVI
X-Proofpoint-ORIG-GUID: Tzwxm9eqnnMIW3H6A0DCNe5yQdNU_LVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=766
 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_042119_722335_8072C10C 
X-CRM114-Status: GOOD (  11.70  )
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



On 4/3/2024 4:08 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> extend the link capable flag to accommodate inter-device capability.
>>
>> v2:
>>   - Rename the terminology from chip to device
>>
>> Karthikeyan Periyasamy (2):
>>    wifi: ath12k: extend the link capable flag
>>    wifi: ath12k: fix link capable flags
> 
> Why the resend? 

I missed the version log in the commit message.

I'm not really a fan of these "RESEND" versions. If you
> need to resend something simply just increase the version number (in
> this case to v3) and explain in the change log why you sent v3. That's a
> lot more clear for everyone than having "v2", "v2 RESEND", "v2 RESEND
> RESEND" and what not. It's not like we are running out of version
> numbers ;)
> 
> But no need to resend because of this :)
> 

Sure, i got it.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

