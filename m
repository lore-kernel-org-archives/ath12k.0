Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9B9CD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqNaIn1vdQNG08WNesydJO7U23oVtC4uv9qaa9pLUmM=; b=BXfKI79sRnTohiqF11z0XuYIzM
	1Xjmpbz90v2BYZWwnKeAJe6yXio+CPdtOfc7s3Waoc81YLDpMGIyb6qF3aPDR6PYTMMIE/V2OQAIz
	XzJdHy2vFGbkmn1a861VGcy4t/kVSymOInFNBw2O50TZ+Q3rmiKqU3DtTftkyGRNZhcTy8pr/v8Pv
	Gw8encQVzq/omSWxfL2Q3nuxpFQ8prVnAKsDGNwRtZn8/gd0rE87T89p+D7JuEoF5/JZiqrcDPyjm
	sUrYh3rXOhjGGZF+AKJVnDejickJBRHIP+kdDIrDRg/qw1eNKww9Q581Kj6QnhgH8RhYw5WRJA+vj
	DLHb33KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsTa-0000000Ehro-0FX5
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 16:19:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsTW-0000000EhqW-3aIR
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 16:19:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SAVSoi024185;
	Thu, 28 Mar 2024 16:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qqNaIn1vdQNG08WNesydJO7U23oVtC4uv9qaa9pLUmM=; b=Ig
	mHZ63v3Ti230P5scwaVODmoACh7NQU7gAY3yuyZmGiLY8yGmdFA4gCU2dPhekFl1
	4BHiypY1vVm7bTgYzEQi0NKmOJmENwmMlkK/li/iDQ+A1mx1d7pb7m1cQkrBiZqc
	wUKdv50X12BKbY6nlQPAmxQn2OMmnKiJSr2j1yu7/8nQwlWdWk5Lqy4Bh9jZ+3vZ
	qkGkFjrVbTNYU8CVjMFvlEJc13VvQOis1qfmTyg+5G5Cd/80cBtObnEPAVNQCiGf
	tYHG9TfkH0ZjwThlPTxV2y8aJXjMpq2h94OK0jSnwF81GMYSiqSfU0wsdhNC19hJ
	mw5YlVUltSzc+jnbp40g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x54r61h07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 16:19:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SGJWXU010035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 16:19:32 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 09:19:32 -0700
Message-ID: <7c7fa31b-fe2e-4281-8d4c-e62c39cd1b9a@quicinc.com>
Date: Thu, 28 Mar 2024 09:19:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user space
 in multi-hardware wiphy
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
 <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QPY9pI_EXv5in7LVaudwa_xU0QFpehrl
X-Proofpoint-ORIG-GUID: QPY9pI_EXv5in7LVaudwa_xU0QFpehrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_15,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=991
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_091935_062956_F71A8C72 
X-CRM114-Status: UNSURE (   9.13  )
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

On 3/28/2024 6:33 AM, Johannes Berg wrote:
> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
[...]
>> +	hw_combis = nla_nest_start(msg, NL80211_IFACE_COMB_PER_HW_COMB);
>> +	if (!hw_combis)
>> +		return -ENOBUFS;
>> +
>> +	for (i = 0; i < c->n_hw_list; i++) {
>> +		struct nlattr *hw_combi, *limits;
>> +
>> +		hw_combi = nla_nest_start(msg, i + 1);
> 
> And of course the array and splitting discussions apply here too.

This is where I meant to say that I believe we are trying to reuse the same
structure and code as the wiphy-global combinations


