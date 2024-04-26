Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7B2C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRY/RZMc/3INa+zmPsFIGXrzZeeosFmug48uKm0/Iho=; b=r0hdMF050yNi4hr9zYbP8WcO8f
	c1/wGrwB5YxHbIf1197Vwwru8AV+z+pcyHTBSr+gHqmB+rqkc6yzeVy5eQPIPaYW5ZPsyslPM1IBV
	TaBiS1f3iCYnZ8/d9G6HKPGqhfDOXcc7OR/CVeDTHS7K/q8/k+ZLrDYGomEqDej+CWLCoPHuaTAmu
	JguD4himsulCO1AgOVZiWXIMPRXpjqzE7VXvBmtdIuPnLePTQSUbdKvvWfox0ikVpfSNTKgplQhyW
	emwKaeXzSRMKRYgxWpRf+zx2UeY+9YfAx6b9kzWi14D4OQgfq7J+7H6Q7C3jqil3zFquhDiGKLayN
	SHStN3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0VD6-0000000ENcO-1Ol2
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 23:42:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0VD3-0000000ENbf-3Jdq
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 23:42:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QMTfum026679;
	Fri, 26 Apr 2024 23:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aRY/RZMc/3INa+zmPsFIGXrzZeeosFmug48uKm0/Iho=; b=bA
	2zcwADef2wQxLCTqHgydvJ7ve14VSr8GOjUGpM7B2d6hF8yIAV/Qo21bhFJ7+L0y
	/fTK4BcRjBoYRt8ngeLp/H4KzuijPsOEHDKWPuSWETyrFiezV3TfIgLpDz+5451U
	zvSUfiacaX9Zr0L3Yjiv48PM6KddLXUwB52KaZRUA31ydkSsyPHKSE/ukP1smcOk
	46XsjUQl/c40zMktBtiWmahGmTUcw9kxyXlO9OzOflQ6KaWnVwDS1WOeQLAFa74B
	Yu3ODpPR6Cft1+SFlc8yy4zvgVYwizyXstDHPogJnRmBhnqWHml45ROrZHpxwcB3
	fROYicCEGxCmrU01tEJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xr88fhvjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 23:42:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43QNgNQD014138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 23:42:23 GMT
Received: from [10.227.91.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 16:42:22 -0700
Message-ID: <198e317f-a849-4fe2-8080-3d1834d07481@quicinc.com>
Date: Fri, 26 Apr 2024 16:42:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Muna
 Sinada" <quic_msinada@quicinc.com>
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
 <20240424201959.935-8-quic_pradeepc@quicinc.com>
 <72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
 <87y190fulv.fsf@kernel.org>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <87y190fulv.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Np6wtzd7dsvfKjCt2n7XefWjG8mXNSSP
X-Proofpoint-GUID: Np6wtzd7dsvfKjCt2n7XefWjG8mXNSSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_20,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404260167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_164229_935738_CA8F924A 
X-CRM114-Status: GOOD (  12.86  )
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



On 4/26/2024 12:31 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 4/24/2024 1:19 PM, Pradeep Kumar Chitrapu wrote:
>>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>>> Reuse parts of the existing code path already used for HT/VHT
>>> to implement the new helpers symmetrically, similar to how
>>> HT/VHT is handled.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> @@ -7753,7 +8034,20 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
>>>   			return false;
>>>   	}
>>>   
>>> -	if (ht_nss_mask != vht_nss_mask)
>>> +	he_mcs_map = le16_to_cpu(ath12k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
>>
>> drivers/net/wireless/ath/ath12k/mac.c:8041:22: warning: incorrect type in argument 1 (different address spaces)
>> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    expected struct ieee80211_sta_he_cap const *he_cap
>> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *
> 
> ALWAYS run ath12k-check, we wrote the tool for a reason. Skipping these
> tests is disrespect for maintainers' time and a great way to get your
> patches to the bottom of the queue.
> 
Hi Kalle

I did run ath12k-check but I don't see these errors. Trying to see if 
this is due to version differences. will update further once I have more 
information on this.

This is version I ran:
qca-swiss-army-knife/tools/scripts/ath12k/ath12k-check --version
ath12k-check (md5sum cb8a85242f2ec7343f6f94af9fa5ebb2)

python:         3.6.9 (default, Mar 10 2023, 16:46:00)
[GCC 8.4.0]
host gcc:       gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
config cc:      gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
sparse:         v0.6.4
checkpatch.pl:  Version: 0.32 (md5sum 12ea394e9bf27280f30a684ff937cc57)
gtags:          gtags (GNU GLOBAL) 6.6.2


I see some notes like below this in all files:
drivers/net/wireless/ath/ath12k/mac.c: note: in included file (through 
include/linux/bitops.h, include/linux/kernel.h, include/net/mac80211.h):
drivers/net/wireless/ath/ath12k/mac.c: note: in included file (through 
include/linux/bitops.h, include/linux/kernel.h, include/net/mac80211.h):

Thanks
Pradeep

