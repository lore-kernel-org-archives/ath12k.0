Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27512CED63E
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahCNDTY0nVOifi3pmg+ZttAOzsh0sxA+SIzoiLNG0+o=; b=3yPPSe+opsWL4EOvqLJILTB8WS
	ljGcd6qecej9QYDeN3GaNmAocMWdeW97EokywhBzDwLX61MHztQMFcepLLiuggHA/d4yKmQvVpbLb
	ElSN4r5TTV3vsQD5Rk+jm6L9iTLQt+Rk6Z0yV55os4cE3H7kcRXek1h7QC0hVssCJHGTDJ8ILWbdR
	/19O1aFfVVGyELchQaL0qnyBU84+UjoPmPz3sjO2r5LFw8eYBArr8iwbu8QpmVOErCX4KBwXwSXco
	nFUnRUCaXUqUced6X21fPlU3J7Mk9vK01d3GQj3zHz5DiI/ePZ41IqoRPlnANlx2qFYc0KtnAWOcE
	pHcSoFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTGO-00000008jr8-3P4R
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 09:45:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sySAt-00000008UbR-2rys
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 08:36:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498KxEon017879;
	Wed, 9 Oct 2024 08:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahCNDTY0nVOifi3pmg+ZttAOzsh0sxA+SIzoiLNG0+o=; b=OF81mdv2xWKyLDbr
	k08kF9JiDMJ/tG0BVN7Q0sDZNGbZVh1xD2Mr5etMlyLd8zTg4qU0HxziNQpQJAeR
	t7UbRUa37gzdQyJPDQzSOztGkZMI5QSGkaJ1unkFyIJ/LY95iyk52BGrR4d5p1e/
	UOPXcRgU6s6BJfVwKjoxtyJe1wkhUjs0/T/bWXJ2F5aYAU47zo3tatI/Ixi8GUc4
	oX4X9Dqb/G5C1Bwr/iW58+jSRFBljAMtAtD5bW/Q9z5qAi750iVuAQ6l1lWGoQw9
	OJv9z11e6ZjZw4buGdWerXwpVnmLKGNKFf0vbw7pHOPQ1HTgbXvgVED0uBMGuV5I
	o6IGZA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qsdvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 08:36:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4998Zx3g030162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 08:35:59 GMT
Received: from [10.253.72.222] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 01:35:58 -0700
Message-ID: <fc004753-2e5d-4694-9c35-8a4c4ccab7ed@quicinc.com>
Date: Wed, 9 Oct 2024 16:35:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] wifi: ath12k: some fixes and clean up for
 monitor mode
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241008073534.1195-1-quic_kangyang@quicinc.com>
 <D4R4RHZM9GWX.2V6MHL6HW9YG3@gmail.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <D4R4RHZM9GWX.2V6MHL6HW9YG3@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PxBfLCA3YSSheeR7-ZLgWBkXz2o4qQrp
X-Proofpoint-ORIG-GUID: PxBfLCA3YSSheeR7-ZLgWBkXz2o4qQrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410090056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_013603_905850_3011F28C 
X-CRM114-Status: GOOD (  15.33  )
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



On 10/9/2024 4:25 PM, Nicolas Escande wrote:
> On Tue Oct 8, 2024 at 9:35 AM CEST, Kang Yang wrote:
>> This patch set does some fixes and clean up for monitor mode.
>>
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
>>   drivers/net/wireless/ath/ath12k/dp_mon.c | 108 ++++++++++++-----------
>>   drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
>>   drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
>>   6 files changed, 114 insertions(+), 124 deletions(-)
>>
>>
>> base-commit: b9545f4570fcfebe982439de7c9106e55b4bf756
> 
> Hello,
> 
> Two quick questions there:
>   - If monitor works for wcn7850 shouldn't you set supports_monitor=true in hw.c
>     Or does it still require more work for it work ?

Yes, still have many monitor mode patches. Will set this hw parameter in 
those patches.


>   - This whole series seems to have been tested only with wcn7850 and not qcn9274
>     Is it still not supported on qcn9274 ?

Actually, this is classic monitor mode for wcn7850, not sure whether 
qcn9274 supports it(I think theoretically it is supported).
As far as I know, they are using full monitor mode.

> 
> Thanks


