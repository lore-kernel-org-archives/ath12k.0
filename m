Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910F7C04FCE
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvPMzCzP8mrRcQBl8KqdX8+hJTq/BnPlP8s2hiGeXrA=; b=kIy66ksU1wAbcd
	y1rYizRlrOH7AiQ7i89Tl429FUE/5MXTh2xLnNthEqEADl2/gd7NNjBihkO9dtzwqBfRO+u6SlX0m
	sZLGLJ3xuTGqLsH/S8HWDHRciwXhqPDASFb1qlUuz6lllMa1A0E5yWsdaWP/i6BbKsenKfObCDqdT
	6rTrpWdG+AxgKbJboSNp/QfW/mslKzUJKFWZoj3LYXAUib6HmIu/rAQ4g5g1x76b6mPg0YyyaRXQ/
	sU4rNEERBa/5KkfnqvqbnddOG3gNK7XYaBktjW/pjP+UJvkqAmhMq0g4Dj37OsYMW2XgKeN5BbGQ/
	aMiGFRhAvlYgM/LpRhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1dd-003okK-0k
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 18:09:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1da-003oim-0R
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 18:09:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KHKL1n026261;
	Wed, 20 Sep 2023 18:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nt4Ss+85durL6GZWDe0NgGhFyFK13LTwhwqza+lJ2MA=;
 b=lCX3q+woF/QCnE8IISQ78ytTxhzchplvZS6eyYssR/8iR7IBw4zpVeLP8P09syUZvdyO
 2Ns1Du03xbDeK+ffwM2nlWd28rWHhR0Goo9jVS1YCXuzrFcKHrOWqEQHIYz2d6RcznwX
 lkC1f+0XY8ii3xQZcUB1k1fS1hTpyWBwa1M5RXrhA+X0+w9TBXl3maWUQvvOaaRTnNd+
 Z6MGzzKw+WoiojI4wd6CxC8P4osNNtbhoTC4EdCS2tstBMo1aafNyV2CDQSt65fKijxD
 piYJdyaJsA4JnXEY6aMHAfrSiIYnqZgig+ihdeanj5VtNrNS05Vjoo78YlDo9m+4AFP8 1w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7sh3su2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 18:09:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KI9Ivl006444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 18:09:18 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 11:09:18 -0700
Message-ID: <4c9423bf-1667-45dd-ab06-e5183875a21d@quicinc.com>
Date: Wed, 20 Sep 2023 11:09:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] wifi: ath12k: add support to select 6 GHz Regulatory
 type
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, Aishwarya R <quic_aisr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230919071724.15505-1-quic_aisr@quicinc.com>
 <20230919071724.15505-2-quic_aisr@quicinc.com>
 <4282f92a-3543-4863-bc00-478ae03759e0@quicinc.com>
 <46b69fe7-d007-18b0-baae-e59ffb035e42@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <46b69fe7-d007-18b0-baae-e59ffb035e42@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HxVbA9xIIBzmy26n1itSot4yXLtWZqbT
X-Proofpoint-GUID: HxVbA9xIIBzmy26n1itSot4yXLtWZqbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_08,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=618
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_110922_178973_BB4F1A0A 
X-CRM114-Status: GOOD (  12.12  )
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

On 9/19/2023 7:10 PM, Wen Gong wrote:
> On 9/20/2023 1:47 AM, Jeff Johnson wrote:
>> On 9/19/2023 12:17 AM, Aishwarya R wrote:
>>> There are 3 types of regulatory rules for AP mode and 6 types for
>>> STATION mode. This is to add wmi_vdev_type and ieee80211_ap_reg_power
>>> to select the exact reg rules.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Wen,
>> Can you provide a "Tested-on: WCN7850" tag for this series?
>>
> Jeff, it is this tag below.
> 
> I have not tested this serials on WCN7850.
> 
> Should I test this serials on WCN7850?

For a large, non-trivial patchset such as this I'd like to be sure that 
both AP-focused and STA-focused products are tested before merge.

/jeff


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
