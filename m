Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BA0C02182
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 01:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jnzf1dUR07L1zvCIHDCpIhQft6fe3tiV/UuCK3QeC1U=; b=zm4cGpzEsOpxd6sZNi0fgMZb1q
	HptczpwErXADz/SCccMn7JaaL9DE83+eAne21UrpIxBGHRVwVYyYmS13NYQtgyDx5QAq6sAtj5sQl
	gB1UGrpeVkK6mOUkmDhskiTu7YB/T9RopcEzrNUQwcisGMNGHaB4mqA554VY253kHe9rAo9Ivf5aa
	Ci6vsNO7CbJub0g+BmJxpdvG72QHsrcGLQX0FinCTDskZbSJfYWtzLhSZGGSmwsw0Fyls1FOCXtpt
	f5iRWUTshe/hQ5srbeYQPwBY3rEh4Uo48IuUgRuafr8wipfUBc9tHVSy2PAPSyuGdd9Kl/MsYzfaZ
	dhDDqkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb8AF-0000000DdUS-02bd
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 01:07:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb8AC-0000000DdTn-1JAz
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 01:07:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFoSPL021309;
	Fri, 24 Jan 2025 01:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnzf1dUR07L1zvCIHDCpIhQft6fe3tiV/UuCK3QeC1U=; b=BTckb0eD8ADXjqp0
	pjO7hUjKwvwJ/uR5dFtgiGkAPG1R3Qys6bq4MngCBGP0s7gZzGO2Vc7GrJLFt3NI
	4i6TilOk5ShFLMWpfJhrsDi7PbKnnnjqSVUFCycuT8HWfURjdin/snQuC/1Im6Bh
	D5+ajqYTu8LS+VoqV2cWJj39G2KgwPUz3CgFveTlQO4F2OCXk8eIkH106dHW/V7d
	XkUk16gWxfgn1Bu3/5SXQepTRDuKSBjEfQ2bkFp85iojg1gJE2+NyOZEl7MVLe8R
	mYT3PdGoJywE7OGAzEgaF5Pdz9Qz4FkjszTA5e3VW+8cy/IwQusFrnpEtDzeW6pd
	8QPNcA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brs0h1ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 01:07:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O178Xw029278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 01:07:08 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 17:07:08 -0800
Message-ID: <8755c0c1-86f4-416c-a91c-e8bd7373423e@quicinc.com>
Date: Thu, 23 Jan 2025 17:07:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] wifi: ath12k: add 6 GHz params in peer assoc
 command
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Avula Sri Charan
	<quic_asrichar@quicinc.com>
References: <20240508173655.22191-1-quic_pradeepc@quicinc.com>
 <20240508173655.22191-5-quic_pradeepc@quicinc.com>
 <600e45a74fc3ca1bedc12c273a84966fdfa3d908.camel@freebox.fr>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <600e45a74fc3ca1bedc12c273a84966fdfa3d908.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Q8A0Lqv0uzYTiKz2xSiMvb0qdmyUwh6
X-Proofpoint-GUID: 7Q8A0Lqv0uzYTiKz2xSiMvb0qdmyUwh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_10,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 mlxlogscore=968
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_170712_353791_527FB2B9 
X-CRM114-Status: GOOD (  14.89  )
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



On 1/23/2025 3:35 AM, Maxime Bizon wrote:
> 
> On Wed, 2024-05-08 at 10:36 -0700, Pradeep Kumar Chitrapu wrote:
> 
> Hello,
> 
> This patch has been merged, but there may be a bug here:
> 
>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_40)
>> +               arg->bw_40 = true;
>> +
>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_80)
>> +               arg->bw_80 = true;
>> +
>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160)
>> +               arg->bw_160 = true;
>> +
>> +       if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_320)
>> +               arg->bw_320 = true;
>> +
> 
> 
> Downstream driver does this instead:
> 
> if (sta->deflink.bandwidth >= IEEE80211_STA_RX_BW_40)
> 	arg->bw_40  = true
> [...]
> 
> 
> So for a 320Mhz STA, bw_40/80/160/320 are set, resulting in multiple
> bits WMI_PEER_xxxMHZ set the associated WMI command.
> 
> Which one is correct ?
> 
> (This is for EHT, but the same applies for VHT/HE code)
> 
Thanks for reporting Maxime, Will look into it and fix this soon.

