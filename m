Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58828E7718B
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 02:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QSmlNg+F//zJVlkzj0NaebClY5UHMa41ozEyYR4uB0=; b=TJgF/YsL9L4d6e6teDebLPK6IF
	OfNSvi65+HZtWwPPBOmoRLaujDAMYX1Q8iEZFfgNRh57v2vRY6JdGtebSzjWz5OqgtP9ZI+qUyIZg
	ySQbHVHvN2XeCa8PYtPgNnRiGwb1IiZb0MLNMiaNSrXNXJ7rYl4E6iHE1VEATyz0NcWLX5oc5iGNY
	QCLQHb7/N18ZwHcYfKV77ofXVWPWT7NdctYzktH/8AnzVlqpZLmHZD86gIy8DhBc9Kh5XXcPCmRjj
	1ZNbd/vaIP1/inYK+Vgf3TLOP0JrQsHFXq3hM2WOc6JZmexOWjWghOdmcgXI33KoJ5kYaVb2Id7WH
	xODXXgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPv4p-0000000B8ou-0EkY
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 02:55:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPv4k-0000000B8oB-0PoU
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 02:55:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNHVueq007648;
	Tue, 24 Dec 2024 02:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QSmlNg+F//zJVlkzj0NaebClY5UHMa41ozEyYR4uB0=; b=WF3ebRi5yZhbkSf4
	DNxlFkDUvPK8C9gwOapLK0xDu2RO9runPFHnXGe0+bcvF8KD5bLaiHg3J9ZliFw1
	GEOFjJ6ABMzO5QkuFP+YZpSeh3aVuKrDCEMK+DA+SW6T1QpWt9e7vSfH6rQozZX7
	zaHEE0OOBYpFq3z2lJFH9BXFaWzVlLof+z8jbIuealcTiELkKoYQv61QayHTFHB8
	q8MvWQlbPukRVJUNz5/q13ezwuSDrmIT/TZPwjRrI9SYYIkJJhFsL0vDS+6ctd8g
	tQovyadlkMq8zdDokNBKjDYfZONfQzltWtoLgsTiJMKXWaUHcdXjzmSrT20WfWIR
	kczFJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qcbbhcvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 02:55:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO2tAHd003852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 02:55:10 GMT
Received: from [10.253.37.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 18:55:09 -0800
Message-ID: <f42041c6-bc6d-4b0a-b25c-a3656a55fd2d@quicinc.com>
Date: Tue, 24 Dec 2024 10:55:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] wifi: ath12k: some fixes and clean up for
 monitor mode
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241017031056.1714-1-quic_kangyang@quicinc.com>
 <9a928610-aa89-40e6-b5fd-0dd8cf5a3a3d@quicinc.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <9a928610-aa89-40e6-b5fd-0dd8cf5a3a3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WNrFbsABqpWYv_6KDJDuGuLb7QzMhotz
X-Proofpoint-ORIG-GUID: WNrFbsABqpWYv_6KDJDuGuLb7QzMhotz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_185514_280394_0156C774 
X-CRM114-Status: GOOD (  12.04  )
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



On 10/18/2024 4:43 AM, Jeff Johnson wrote:
> On 10/16/2024 8:10 PM, Kang Yang wrote:
>> This patch set does some fixes and clean up for monitor mode.
>>
>> v4: rebase on tag: ath/main(ath-202410161539).
>> v3: rebase on tag: ath/main(ath-202410111606).
>> v2: rebase on tag: ath-202410072115.
>>
>> Kang Yang (11):
>>    wifi: ath12k: remove unused variable monitor_present
>>    wifi: ath12k: optimize storage size for struct ath12k
>>    wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
>>    wifi: ath12k: fix struct hal_rx_ppdu_start
>>    wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
>>    wifi: ath12k: fix struct hal_rx_mpdu_start
>>    wifi: ath12k: properly handling the state variables of monitor mode
>>    wifi: ath12k: delete NSS and TX power setting for monitor vdev
>>    wifi: ath12k: use tail MSDU to get MSDU information
>>    wifi: ath12k: fix A-MSDU indication in monitor mode
>>    wifi: ath12k: delete mon reap timer
>>
>>   drivers/net/wireless/ath/ath12k/core.c   |   5 ++
>>   drivers/net/wireless/ath/ath12k/core.h   |  23 +++--
>>   drivers/net/wireless/ath/ath12k/dp.c     |  25 ------
>>   drivers/net/wireless/ath/ath12k/dp_mon.c | 107 +++++++++++++----------
>>   drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
>>   drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
>>   6 files changed, 115 insertions(+), 122 deletions(-)
>>
>>
>> base-commit: fa934bf3e0a825ee09f035c6580af513187d59a2
> 
> This series looks ok to me, but it conflicts with the MLO branch so I'll defer
> this until the MLO branch is merged. Note that some of these fixes may not
> conflict, so feel free to submit ones that don't conflict as individual patches.

Hi, jeff, MLO branch is merged, and 8/11 of this patch-set are merged. 
So how should i send the reset part? From v5, or from v1?


