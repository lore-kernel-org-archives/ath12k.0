Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F4C47258
	for <ath12k@archiver.kernel.org>; Thu, 18 Jan 2024 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsomCbX7hSZoUAk1T+f3+Fxks88sbYfcTG6Oma0Lryg=; b=ktiAxZIeHIr126pB7gWe2uc0hl
	PVPOHh079XpywntUZRY1R23dou+fMQra9wXdHAhGvgvzyRg10t1fOfqj7y1JB0ZWzwH/pv95RttZL
	2XP8fXRn8uIB/b84D9cdPBNDb4nk1IVKG77CIUurItKIgqziG5S/5b9fi/TBPuKhK5VNWVfG5k7ge
	lJAZgh178fHtSVDqBxbCXNR8Rad3awTcUss78BDut1e5yShSBHBliMfsbL05CbULwr446pYHLpMOi
	X+kgfGaS2QepLCxRoebYKfBfKmQyz+NyUeqobw5TBiOCjj/oAkzOJVK3PgNCESiS3v0Mc+yVdCQP4
	Ej417qrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQI2U-001Onu-1s
	for ath12k@archiver.kernel.org;
	Thu, 18 Jan 2024 02:21:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQI2Q-001OnF-3C
	for ath12k@lists.infradead.org;
	Thu, 18 Jan 2024 02:21:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I0sxiB010946;
	Thu, 18 Jan 2024 02:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rsomCbX7hSZoUAk1T+f3+Fxks88sbYfcTG6Oma0Lryg=; b=iv
	MNd1Wv49k5+yllRBwxSW9LYHkz+IkjhqY2Mmq5driBGgHXbdaGfAy4sypQ8zRPC5
	ugIaH4hCa/Mi9AeY24hThJJC9oqPUsCQQOxeMcijY8m6HV7yK2fXmsZB4szMBtSf
	To5eG/pQD47EAvXu4DELEI+uAhIepPAq6SelMyCk8LTgF9GhiWbZhmuW8S5dUeZK
	ybAO9nu9Ik36MJEXXdFXvL2pJJ4WW3R1DG1rq8hnRUqiziMpf5krqOkISDJ6CKvI
	nasHFhA6BPQVYk7TtV9xdo5g37JvHrl4khkZfF/1Ny5yk/Om9n5n+wsYOxJ7wBQM
	vvN53IVOtOvw60TwrLeA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vp6p3tpe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 02:21:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40I2LlI0029578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 02:21:48 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 18:21:46 -0800
Message-ID: <cbf6f724-747d-4539-b9b4-dc3f39763148@quicinc.com>
Date: Thu, 18 Jan 2024 10:21:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] wifi: ath12k: some improvement to RX throughput
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231129020414.56425-1-quic_bqiang@quicinc.com>
 <874jfc5ayb.fsf@kernel.org>
 <6da888c4-be62-4373-8527-996dddb436f3@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <6da888c4-be62-4373-8527-996dddb436f3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eEiK0rFc87ZSCbKThw_tbJY3zKzRl9Uj
X-Proofpoint-ORIG-GUID: eEiK0rFc87ZSCbKThw_tbJY3zKzRl9Uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_14,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=732 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_182151_039409_8743A4F9 
X-CRM114-Status: UNSURE (   9.90  )
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



On 1/17/2024 11:32 PM, Jeff Johnson wrote:
> On 1/17/2024 5:46 AM, Kalle Valo wrote:
>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>
>>> Some fields of hal_reo_update_rx_queue are wrongly
>>> defined, fix it in the first patch.
>>>
>>> Currently the maximum block ACK window size is 256,
>>> with the second patch, it is extended to BA1024.
>>>
>>> The small MAC buffer ring becomes the bottle neck
>>> in RX throughput test, so enlarge its size to get
>>> a better peak result. This is done is the third patch.
>>>
>>> With above three changes, more than 6% increase is
>>> seen in RX throughput test.
>>>
>>> v2:
>>>   1. wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
>>> 	no change.
>>>   2. wifi: ath12k: add support for BA1024
>>> 	a) s/doen/done
>>> 	b) update struct hal_rx_reo_queue_1k
>>>   3. wifi: ath12k: change MAC buffer ring size to 2048
>>> 	no change.
>>>
>>> Baochen Qiang (3):
>>>    wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
>>>    wifi: ath12k: add support for BA1024
>>>    wifi: ath12k: change MAC buffer ring size to 2048
>>
>> I had conflicts, please double check:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=1ee7c1872873d82a71e05a4e17cbf9a569bc8ec9
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=4d75db679457b5b7e04271f5174d9128d7d73ecf
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=db549be42740d286ee6ec8b2860b4e4789be2167
> 
> These look good to me, but Baochen should also confirm
> 
Also looks good to me.

