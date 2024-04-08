Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C700CD129A
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DOc43ENOSYzL745L66G4N3iRCacHDFhiFHWbvRmax4=; b=uDFFnAHlMAVYModphJVKSjkwgj
	PesgR3njtNNfc8Vtdkaad2YEo34Q30KfiudIPhKH5gls+MjVEBJg9O9u8NOQuAZD4Q2GnZjqWaDZ9
	+PwtrrarxDjYK8uqF9EDdhifxD1/lI6qVvdQHKRRABNnkDrvHRJhI3iz8AQvKm4MeM49OV5gs5Kyh
	bP8phZLe0loe+ETC3aZ3FgtcbtG/hAJH8wlxqXjyFWUZ4fn8/god6n5iS+whNBML38N4+TOzWjc94
	O3egSb2ksSGP9s12O+fFdtAnAyqHxnT5qmyXRiQGXmsVfXebw/nvpTWFfKKYE2Kirk0jfVsUyaqvM
	cctPOB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtut9-0000000GeuK-2urO
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 19:42:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtut5-0000000GeqE-06Bs
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 19:42:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438IxGmr009106;
	Mon, 8 Apr 2024 19:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2DOc43ENOSYzL745L66G4N3iRCacHDFhiFHWbvRmax4=; b=J5
	hEsaiV0TZYnc97LSwFQR4AOTwjZxZ1vKn9cW8kGoBfKlgsPA4UJkcvZkNR0hOIar
	+QWGPS6aAKkkrK0dmCe5xepAryhVBNY1YD1TL0c0iNXDgtFI79jPUb4WTxbCGj7Q
	fLWv69fGarXxwSTQRF9qIaEaAx+srKKoWXQAXjGJCeE1mqk7ixukssqtyaIf+71h
	l0hDCbHEBVAbnSyGdOIJdnnHwg8KhjT2Jf9DZuW9n24X4S1Bzz78jScwj+o4gbfy
	YzVwwOKjlaTGvgvttP2XXXqlDoqn++Wjf+ieaHidYF07EOsoXpnlfbzvhAqXcg/C
	3/mtptVWdKNPvtOcTCnw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg0hrq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 19:42:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438JgZJA002558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 19:42:35 GMT
Received: from [10.110.80.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 12:42:34 -0700
Message-ID: <4987737e-df85-452c-85a6-9032fb620dd5@quicinc.com>
Date: Mon, 8 Apr 2024 12:42:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: cfg80211: Clear mlo_links info when STA disconnect
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Xin Deng
	<quic_deng@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240327032448.15098-1-quic_deng@quicinc.com>
 <e599d1b1c7c6e32856eb5374cfaa20965b49b44c.camel@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <e599d1b1c7c6e32856eb5374cfaa20965b49b44c.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zxj-cKJSY_TBDvTso3m0_mAocGSkxNVw
X-Proofpoint-ORIG-GUID: zxj-cKJSY_TBDvTso3m0_mAocGSkxNVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_124239_339518_788CCE21 
X-CRM114-Status: GOOD (  14.31  )
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

On 4/8/2024 11:41 AM, Johannes Berg wrote:
> On Tue, 2024-03-26 at 20:24 -0700, Xin Deng wrote:
>> wdev->valid_links is not cleared when upper layer disconnect from a
>> wdev->AP MLD. It has been observed that this would prevent offchannel
>> operations like remain-on-channel which would be needed for user space
>> operations with Public Action frame.
> 
> I agree that's a problem, we shouldn't leave the valid_links set.
> 
>> Signed-off-by: Xin Deng <quic_deng@quicinc.com>
>> ---
>>  net/wireless/sme.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/net/wireless/sme.c b/net/wireless/sme.c
>> index 82e3ce42206c..86e837f37f8c 100644
>> --- a/net/wireless/sme.c
>> +++ b/net/wireless/sme.c
>> @@ -492,6 +492,7 @@ void cfg80211_wdev_release_link_bsses(struct wireless_dev *wdev, u16 link_mask)
>>  				 &wdev->links[link].client.current_bss->pub);
>>  		wdev->links[link].client.current_bss = NULL;
>>  	}
>> +	wdev->valid_links = 0;
>>
> 
> But this is (very obviously, even with only the limited context shown!)
> in the completely wrong place.

Concur, so NAK my Reviewed-by:

That function is potentially only removing a subset of links, so it should not
be setting the valid_links to 0 since not all of the links may have been removed.

/jeff


