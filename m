Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3129DC021AA
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 03:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOXDuzaczed56I7RRNdp8299W+cYa4s2dYdnyMysfdw=; b=x8PcK9pvWVttyCXd7TLmnq1oDP
	o6cG4jv+Lq/FhN4tA9wM6ZergoSszitWlA87/pyokm3OUCrKJ8sk6y22sxVWoFK1aBWEoCQPosfpx
	hqKxu+3qRjKd9EkI58ykLfT7ik+3H7aM3xoIT/gZ+wW7ypc/ALWe2nGNODC/qwhAtrXKi45uWpTjN
	i20rnXQH/RH+H+ye3AtbKhFsXwwGLqm6H67FiiCot3mFv5JnSVuubkbHs224X8skzPpQUyHjESfsq
	e6TS1eHjZnBArXVZWrwEcCKV7pBmxtymXUxdRbY+uHGbW4W98JAlGKppXrMMOl8hLbeVlLDGQG1m7
	qLhzPbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkx23-0000000GVuW-40oY
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 03:15:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwwL-0000000GU6z-1097
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 03:09:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG6nCF026862;
	Thu, 20 Feb 2025 03:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MOXDuzaczed56I7RRNdp8299W+cYa4s2dYdnyMysfdw=; b=BCc7CL5RlZt98FsA
	0EXLcWJkcU4o4QA+PokwwnFltGZT0zsJ/BZOLBL7buVU2pEcywyrmCbQmqReBT3v
	0D4TzpDGYd15fWslcrw2MJD+SSmv8Fjeg/raP8isUWjRVq1GfMulXmmZtWDM5uBW
	lLIycxsJrZXt2Nj/oH2FLcGQBdIiRu0tciwv22Ji6AHW8Zpm5BSnOTKRFhz3+K9p
	41ma4mSTG/iOxCQK7Elel65EZXdaveqWRBlN3eLn2JTagHpSsWdFGJ1ZWzfd4YGM
	ArCMaFJJqKGE3EPOH3Gl1Ny5Pu6G1mVM8kyhRPu6k4kyHIJ7h0LEq51bKha9uklH
	pbltgg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0mpep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 03:09:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K39QZV006485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 03:09:26 GMT
Received: from [10.133.33.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 19:09:25 -0800
Message-ID: <70c3d63c-df03-4956-961e-c7a654568b0b@quicinc.com>
Date: Thu, 20 Feb 2025 11:09:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] wifi: ath12k: use correct WMI command to set
 country code for WCN7850
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250212063200.1631-1-quic_kangyang@quicinc.com>
 <20250212063200.1631-4-quic_kangyang@quicinc.com>
 <c7a422b9-55b9-3f03-a89b-6b5e82d8e3c5@quicinc.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <c7a422b9-55b9-3f03-a89b-6b5e82d8e3c5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g-Nx4B6uiK7IZLPhlihzZ6ZbTc51ZHCB
X-Proofpoint-ORIG-GUID: g-Nx4B6uiK7IZLPhlihzZ6ZbTc51ZHCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=820 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_190929_307960_F5DC308D 
X-CRM114-Status: GOOD (  12.60  )
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



On 2/19/2025 12:35 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 2/12/2025 12:01 PM, Kang Yang wrote:
>> From: Wen Gong <quic_wgong@quicinc.com>
>>
>> When userspace try to set country code by NL80211_REGDOM_SET_BY_USER
>> hint(like iw reg set XX), it will pass new country code to ath12k.
>> Then ath12k will set this new country code to firmware by
>> WMI_SET_INIT_COUNTRY_CMDID. But for WCN7850, this WMI command won't
>> take effect.
>>
>> For AP based chips(QCN92xx), WMI_SET_INIT_COUNTRY_CMDID is the correct
>> command. However, for STATION based chips(WCN7850), it need to use
>> WMI_SET_CURRENT_COUNTRY_CMDID.
>>
>> Add flag current_cc_support in hardware parameters. It is used to
>> distinguish AP/STA platform. After that, the firmware will work
>> normal and the regulatory feature works well for WCN7850.
>>
> 
> Should this patch be the next in the series right after the patch
> (patch 1/4) that adds WMI command implementation for
> WMI_SET_CURRENT_COUNTRY_CMDID?

Indeed, will change it.

> 
> Vasanth


