Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB3CC54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8uXItxpnC4YHT2PaqPywcT/FiBXK0Bmjj42RkCqRp8=; b=ByxzpPbcYK/3eWKKqm1/h52Q2i
	IB0kbV8/PUWpxCnZ7vMAY9nlNZg/EK5iRWKaXlQ15yqqvTeec+zDvvvh/r24b0G7+1m7LMUkv9Ib4
	f2hAS+d50uLPwRE5qrTVE9gxwaQz0ErE1we4nlp1ruzEdWBCMbMTwqKNbOhe/89DRZS2fo/rJButd
	SlI+X8nanUbO47jTCPDZ+WGerTJicDOVc9qk/n1UoXox9z2CUQseC5NyqWaH2ivU/+aRJSzhxouIf
	6THQVp6NHfE8zAdk7b6DAnK8YgsgTPyHNxIuaGbfhDX3WCGt701xz8pBsY0llOX+tssWs7BZanukl
	HLTeZdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHuO-00000009hw0-3X13
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 18:40:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHuL-00000009hrw-2nFQ
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 18:40:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I9DurL017612;
	Mon, 18 Mar 2024 18:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=T8uXItxpnC4YHT2PaqPywcT/FiBXK0Bmjj42RkCqRp8=; b=MS
	fRft/3tYKAXBwInpZkebOzuH9K3bYcpVtMwCR3Ibz0e+PtPAyH+uwj5frn3/arXg
	qNkFlryAn+/RX8IzxIgG6gz4LeN/D+WqyrFGjPqQ5bhMYOIpT2dZrUPiAkGtifBQ
	CtJHUYC3Wl+S2Tbo7gzRAj7MCNFgS/kge30q3gq4af0+tNJD7NtMLmh3+x/OhnmB
	K0JpwR2NJrrSN2vc4ocmpkVteplLilnoIZSDJJwMp5fd1UxKdjX+AoprwZLcEQb5
	zvQdngB29dyEXoZf3/wS0qqjOcQtv1bKfU3SLtpaw9ICVsTB9PMKWrqXJTaoKuIr
	uE50SZX7zYmdD13u0aow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxjt4s8x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 18:40:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42IIe6gW005290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 18:40:06 GMT
Received: from [10.111.166.62] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 11:40:05 -0700
Message-ID: <4940b6cf-a68d-4799-ccf3-f90dcc105e3e@quicinc.com>
Date: Mon, 18 Mar 2024 11:40:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
 <87sf0nczca.fsf@kernel.org> <878r2fctng.fsf@kernel.org>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <878r2fctng.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s_l9ruhOXrEZeU3zjDl5ZmACsWWiqOKS
X-Proofpoint-ORIG-GUID: s_l9ruhOXrEZeU3zjDl5ZmACsWWiqOKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=615 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_114025_883358_864712F7 
X-CRM114-Status: GOOD (  10.82  )
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

On 3/18/2024 10:54 AM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Aloka Dixit <quic_alokad@quicinc.com> writes:
>>
>>> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
>>> peer_flags by peer_flags_ext while sending peer data.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
>>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>>
>> What does this fix from user's point of view? Does it mean that 320 MHz
>> chanels were broken before and this commit fixes that? I can ammend the
>> commit message.
> 
> And what about WCN7850? Does it work the same?
> 

Hi Kalle,
320 MHz association was broken. It was a re-basing error while sending 
the original patch because the correct field was added during testing, 
still used that way internally too. I have not tested WCN7850 on this 
patch but yes will require the same field. Current code was setting  QOS 
bit instead of 320MHz.

