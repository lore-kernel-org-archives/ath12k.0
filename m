Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE5C54E90
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhUlLBeUPNrxixNqYDdgu9rpqgKRCrk+ZY7Iw2xZMLs=; b=BwhkoemzFQ/xOhRV90Kum+X51E
	grfT03CWBqiOLHVbeXuhvY0AUqXaC7ETkvoj0aEff7IRUBjeMzy561xkZIX8FWQ83vRC47vD122r+
	oard7WNGjFUlyFvuHR5dWDuuYW1UNb+0Xc1X+JgMyVvf4iUfgtJjvUJ2uQ/aOvw5NmhM4ATQ9HtjO
	/gy9sjLHTctAK5KOUqJ86Jkpu/S5tVAuQLIV5BwfwDrIhslw0250oLznEi2wnL5Krh7fJq44ggyIH
	YT+4yqCEVpVKthVqOAEEHFYIoEtvWE5SQ2Zz/6g8/90g2tg9kvX96xj293k25ojiO2GTknD3CZlU3
	Tc7ycgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHr9W-0000000GsLH-1bic;
	Wed, 21 May 2025 21:39:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHr9U-0000000GsKr-1dgm
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 21:39:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI2Or6031724;
	Wed, 21 May 2025 21:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhUlLBeUPNrxixNqYDdgu9rpqgKRCrk+ZY7Iw2xZMLs=; b=nA8XFlW2BO5zh0Q+
	iHZ6a29lvp3g578TaGM40Xl7HK8EEZVbTXKvPCYC8PF/AF7vkjFxin11D3oKQF3m
	MjSzlaW9FVjbBon0sYB+IsCY7uSH7g5y3XFvF0cEtlfzN9NaTYjvEJ7YQReEq3nE
	lU43fRX4KEbtxfUFWlve5/tEw0bdkjGGJua6QMRoieguF89pSwFzn1ZYnPc5AyFN
	7iX0/lrBkCtvsSEOd3Z61F/y3jDxY3oYJJthAmLO7TJYgQ7JG1oDc6xORp2hEpIm
	kxijKRuvNrBja8IRy2qEi4h2ciS+c+Lyi96n71o8ofsH1SAr0ms8fochW5Iu/w0i
	pmDIQA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c22txf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:39:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LLd3Xo021657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:39:03 GMT
Received: from [10.227.105.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 14:39:02 -0700
Message-ID: <71b78c07-03cd-4179-b162-0866b1a48b3f@quicinc.com>
Date: Wed, 21 May 2025 14:39:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
 <20250418174818.3336510-7-quic_pradeepc@quicinc.com>
 <5d61a6b8-e259-4683-94a8-911dcf2b9e81@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <5d61a6b8-e259-4683-94a8-911dcf2b9e81@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNSBTYWx0ZWRfX+IY3rtqrDo8Z
 I2IKvnvgGLBPexSxvZs+DfMy2ZG6Fsq9T2o/nAuHGapW1yIsexzzxD2fYgso5Qtgd4raBcNRaC/
 urR8RSlB5LRs7dCokoz01f18YQCvqqHfnzVKlxuFN5Q1Itnh0L7K2xxRlshJG6N60mz9bgAE1fH
 +PyjQh4T/djOLB9eBR9ek27HbG5TdZ8ggWsHsfPliVpj2yIt7f5emP9xtxc4n7JY5ZRIDkgAPI/
 WTI2js/e0Kcv1iSpzfEyMa/eV3sZ2sSXoIgxc6iH7O06jMAtz9TybTLjVa/P2z27yxF5nwHsIBw
 bzIV4kZZj6X4FQnEKL5NE6LI7eJjw8/3au+r3yctKbOq8NoobyZGmOJ8Xp9IdOr7jRTL/P41iz5
 FdYgVTH7FO55yFJJCBM3a3Y4cl3rWBpLM1QQYnY9Z6NLxJr/8sorWSiUL+w2FIca09T+efjQ
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682e47f7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=4d3U5Okv3gj4gmqRzPQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Js4T3ZGdVECrhyfXgAdnLpUd5oe9SZJZ
X-Proofpoint-GUID: Js4T3ZGdVECrhyfXgAdnLpUd5oe9SZJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=887 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_143904_441703_71D5F78E 
X-CRM114-Status: UNSURE (   8.76  )
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



On 5/14/2025 7:54 AM, Jeff Johnson wrote:
> On 4/18/2025 10:48 AM, Pradeep Kumar Chitrapu wrote:
>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>> Reuse parts of the existing code path already used for HT/VHT
>> to implement the new helpers symmetrically, similar to how
>> HT/VHT is handled.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> 
> Internal testing revealed interop issues with this patch, so this series is
> being dropped for now.
Thanks Jeff. Will address it in next revision

