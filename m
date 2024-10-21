Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF7CD0E6D6
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDgdU1n3NSZ18mfp8AusY3Rj4Du7Q8R28DmTiU6cuus=; b=YaGbo1fBAMrxKqlMgG36dnMWa7
	DY2g7avP6SjO1S8L2QEA6etRuM9zGQnIXeneEzJkSb57XCikwK4X2DTTpM4jiH49smlOtDtCg7ZGr
	+PZdAs/+qCVk0UIB3Ym1qGUExW5CrBnebUQwOKVr2B38MSf0fOFL9qDKfp1obey7bqdj7uQYmdgzY
	GYoRcqgNabJa/eDv67bisodMBIOQNWrhtOHKjLuIb8bTMXl3hmMV/rgXCfAIInQOo+IReHGNFJzMm
	9M5oTbp6MNLLE01C3XT783xxGDi3+JBCSGYI+SKb22Jl572iW1LhX9HiwWQvANLuQUJ3uUUki8Gr9
	N7Sr/x+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2orq-00000006jPU-1qiu
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 09:38:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2olu-00000006i0Y-1kCE
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 09:32:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L8JrWY009625;
	Mon, 21 Oct 2024 09:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDgdU1n3NSZ18mfp8AusY3Rj4Du7Q8R28DmTiU6cuus=; b=S4s9EYU3PF0t+iRv
	dR1fBdLGFG8sTSdpl1SxC0+8+ZdrdPJr9LkuuhgpnbYQ4sJnZ/osRhbkdx+JmUwD
	VCPRiEW43aQ19EU3wzI6Wdo0wqJhUCJA/v3j6S5gkta9NR6UlfpUU+I4G81iwKj/
	GOnCzVwgwKCUeODcDUz/lIqP4xV4mn88adqi0hsKxYCw9uz/9nu8/ZGZE2IYSFD6
	YFwS0BisaZEURvMzec1xxqKunDU7fYw/q3wPeMe8mvnCtggGMqi5Zx3BhRHeBA0U
	adHdsS/mAkm6yNIa3ErGt1w/7KLNx67zHyusFodKkPZBQb37EltQjkSnL5UT1AEN
	q75ZEg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkbt0br3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:32:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L9WDsS010012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:32:13 GMT
Received: from [10.253.15.238] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 02:32:12 -0700
Message-ID: <a0a3c468-6f6a-4236-9b09-45534ac51c37@quicinc.com>
Date: Mon, 21 Oct 2024 17:32:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] wifi: ath12k: fix struct
 hal_rx_ppdu_end_user_stats
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
 <20241016065700.1090-4-quic_kangyang@quicinc.com> <875xplrgj5.fsf@kernel.org>
 <87sespq1pa.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87sespq1pa.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R9gNbjjRYcyRPOyeXix8GsLv-KMn08qi
X-Proofpoint-GUID: R9gNbjjRYcyRPOyeXix8GsLv-KMn08qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=557 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_023218_603649_6448DFA1 
X-CRM114-Status: UNSURE (   8.57  )
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



On 10/21/2024 4:50 PM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Kang Yang <quic_kangyang@quicinc.com> writes:
>>
>>> Current struct hal_rx_ppdu_end_user_stats in hal_rx.h is not matched
>>> with hardware descriptor definition.
>>>
>>> So update this structure and related code.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>>
>> What about QCN9274? The commit message doesn't mention anything about
>> that.
> 
> I have the same question for patches 3-6. Also I would like to
> understand the backwards compatibility with older WCN7850 firmwares.

For QCN9274, we reuse the same struct for them.
WIN team already checked them during internal review.

The struct definitions in patch 3-6 are hardware descriptor definition, 
won't be affected by firmware and host. They are fixed.

> 


