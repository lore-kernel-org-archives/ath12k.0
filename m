Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84024CD11DD
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/GYAbMu31e6e4GTEAGMgR667lTxULcGk9iD21qUsUs=; b=CiWWN29FFC7gFFInyJyA5Bq/y/
	7onAW7D5ffIBGGMxXjRN0MdCQL/R/1wLW1Ozt67udGBqZYla+d4y5x2If/piFa0g5XgRXu+dD+pR5
	opWo5aBvZ9Go0g6oxI40nJaCIUY0mrQDFNzsD9bwMkqA+AWT4gg9Z9dqULuyg3873BVQ1uFcZzJrK
	TEZFUWFHm23RyOOPyQPmCuNQDqCk0Zx29XgYmtJ9OHUQKrUop9xIwhVPWSpw5JGMpz5Th90iH387K
	kovT2liyVo17gV87B28pgmUnvQQ5lSrJ9VBZ8OJmXl/iJjyf69xrleydN7Lxj2kxvQVUQy3rXQCg+
	wQAcRpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCxf-00000000pHA-0gjl
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 14:12:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCxb-00000000pEt-45Bx
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 14:12:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TCoRFK021671;
	Fri, 29 Mar 2024 14:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Q/GYAbMu31e6e4GTEAGMgR667lTxULcGk9iD21qUsUs=; b=np
	52ec7ye5bus7cDAdQHX5GfRNvcXwh1CNOofp0iMuXHlvnxUDhymlPCPbb2Q3gQCO
	EmVKTgEfWJhVadQnHDzz6iJ1Gwe+MV5bXfKXxlnLvEXVlTXCZ1rV17v1L/8gA9uj
	KrTJvY1GXu3pkJRf42Tatu79+5EJz8HAhJmpmT+vUm1GZKMhd4gExCXKBIF6+lb7
	v5yIqgW0QTkcgwrpE8Si6E/NZRBnSY/6/AF8Udnd4FhJtwGUe+ze/G1SxcBz365t
	DGubFjWaKI9baCBYmvPFhiXKrV82yMAIjmW5w++xDwdrtHteb9BmCh3n+5Uw2pNw
	TAUQYlQXiEcsj9mGZjpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5ng9smdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:11:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TEBtg9027982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:11:55 GMT
Received: from [10.216.7.62] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 07:11:52 -0700
Message-ID: <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
Date: Fri, 29 Mar 2024 19:41:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: buJA3IXeJZkBtz1PeN_Yrax5b0X5rbf0
X-Proofpoint-ORIG-GUID: buJA3IXeJZkBtz1PeN_Yrax5b0X5rbf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=647 adultscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_071200_201329_A23804F7 
X-CRM114-Status: GOOD (  12.50  )
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



On 3/28/2024 1:16 PM, Johannes Berg wrote:
> That's a big set, not sure I can review it all at once :)
> 
> 
>> +struct ieee80211_chans_per_hw {
>> +	u32 n_chans;
>> +	struct ieee80211_channel chans[];
> 
> That should probably use __counted_by() these days.
> 
>> + * @hw_chans: list of the channels supported by every constituent underlying
>> + *	hardware. Drivers abstracting multiple discrete hardware (radio) under
>> + *	one wiphy can advertise the list of channels supported by each physical
>> + *	hardware in this list. Underlying hardware specific channel list can be
>> + *	used while describing interface combination for each of them.
> 
> I'd expect there to be a limit on channels being within a single band on
> a single "hardware"?
> 

There are ath12k hardware supporting multiple band which need to be 
registered under one mac80211_hw/wiphy. This design is to support such 
hardware. I agree, it is adding complexities. I was thinking if this can 
be done in steps , first limiting to single band for a single hardware 
then extending it with multiple bands later but that may bring in 
different set of challenges...


Vasanth

