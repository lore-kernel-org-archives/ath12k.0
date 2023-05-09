Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55310C7EE22
	for <ath12k@archiver.kernel.org>; Tue,  9 May 2023 03:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjILubGP9vS/bSKo5ni7lcSXKje5aZZeX/YnX3W+xAs=; b=oq5olyz1jSnKkK
	VD7x02QHx5dKZlgWoVvnLtuaDK5M/0NjWQM1qW3ehui5jEppm/rO260XQeYTEe2Q30KJMXCJippZV
	9RzRD4LYG1HeUwL62KhNegzusTjHkAQW8SDFmcS/LwRHtl32GIWEfYiYZgwmLjW1a0s5zoaDE9YaO
	QSe9sdml3yvW3NtoUR1+ywZCWaAIBfocuCEu2J1AAqhk9VssfrykHZm/ailYGryij8kwRJKrDrsZn
	ZOYRyQE32fP7j9tjNrofEpPpR+Yw8SshC/rLzFgc/A/oDEsvs5XPr+wX5b3NvL/LS0cFBzHMZPZ2n
	yfeh/mA9/Sm3niix0i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwEFz-002CW1-34
	for ath12k@archiver.kernel.org;
	Tue, 09 May 2023 03:43:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwEFx-002CVh-08
	for ath12k@lists.infradead.org;
	Tue, 09 May 2023 03:43:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3493F0ii006760;
	Tue, 9 May 2023 03:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=95NsRauO8AStDzIRFJuJ8KLehYEfBimDTI1KRKGBzv4=;
 b=inBRS/ieG6OcdTOCCdjGpurDtFMvcjYhP0e3D/bJlKeGiwgEwJPCnDajpvVtezrgWvs8
 t7TJSTCdupxMS3Y8+R7MgLIRIPV6acm37GY3nypKkSAa7z9bP8MqkX8Rwo/O5AWIgBMy
 8CHlIeOswf5dO0tIxxzYkKkKPpyxFQrWmaVgGHIZQ+viUclENdMroPl7EAf4B92TXBGm
 fQyL9oepoEeyl2Av372AWHT/oR0GemXNgFm6FBirgBmWiuhGLObiw74sqS8+AN39YGRO
 2zfxT5dQnNam1Z7PGqmAdIFDi4iGITGoUFd34U4kdjRHJ/wdhb9XsZIXHEahK37juoum +g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf7860qfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 03:43:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3493hB1E015029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 May 2023 03:43:11 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 20:43:10 -0700
Message-ID: <b0321483-ae4e-c44f-ed41-4a83e8693f09@quicinc.com>
Date: Tue, 9 May 2023 11:42:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] wifi: ath12k: Use msdu_end to check MCBC
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230427013021.29792-1-quic_bqiang@quicinc.com>
 <87zg6rqnhv.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87zg6rqnhv.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h229tHraor-Z1vMoA4MBuqPQ1BxYY3zu
X-Proofpoint-ORIG-GUID: h229tHraor-Z1vMoA4MBuqPQ1BxYY3zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_204317_199476_A0C7FD0B 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On 4/29/2023 1:13 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> We are seeing a very low TCP throughput testing with some specific
>> tools. This is because for sub-frames of an AMSDU, MCBC flag in
>> mpdu_start may be not valid, and as a result those frames would be
>> dropped by kernel.
>>
>> Change to get it from msdu_end.
>>
>> Tested-on: WCN7850 hw2.0 PCI
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/hal.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c
>> b/drivers/net/wireless/ath/ath12k/hal.c
>> index 0ec53afe9915..980ec2024b37 100644
>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>> @@ -889,8 +889,8 @@ static u8
>> *ath12k_hw_wcn7850_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
>>   
>>   static bool ath12k_hw_wcn7850_rx_desc_is_mcbc(struct hal_rx_desc *desc)
>>   {
>> -	return __le32_to_cpu(desc->u.wcn7850.mpdu_start.info6) &
>> -	       RX_MPDU_START_INFO6_MCAST_BCAST;
>> +	return __le32_to_cpu(desc->u.wcn7850.msdu_end.info5) &
>> +	       RX_MSDU_END_INFO5_DA_IS_MCBC;
> New warnings:
>
> drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast to restricted __le32
> drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast from restricted __le16
>
> Please remember always run ath12k-check (with sparse installed).

Hi Kalle,

I have sent v2 where I change __le32_to_cpu to __le16_to_cpu which 
should fix this warning.

But I can not find ath12k-check, where is this tool? Could you help 
point out?


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
