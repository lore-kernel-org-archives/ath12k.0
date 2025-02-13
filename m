Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1C8C021A0
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 02:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ju1CUxdi9qHgTtG7ye6LU9jXq3SmZNCoz31/czRX4eQ=; b=gU6Y6dTrKUE7fjcieypn6VWiIK
	8g4rzyMtZTQgNfjTlwYm1BPiYY7Ub+Y5btYsEX/Ncq8QTpN2PN6yv3JgNpG7wxtdGh5LiiKcCNAGe
	rfER7JQ8SMk6wnbM7l1A2D8dOmddCAxWo8YdaBRGBenO+E1HV3ZNWIei2BOQL+FtSScyW5i2uz8Kf
	+s96MN1lVJSXiIFgZNCWn2w3YHO3rgIGmN8ek97RJCvBwQGDZ08shQB6adQXHN9qFtvwpRSV8n4Mf
	/NmJN7vtH5tjACw/WpZL8A2LIh9LTt1JuMCf/LOh2KO3FQrU1n72FlOLDUDTWIUuk2NPBLXDynKZQ
	IWRYR19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiObL-00000009SWP-3Gme
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 02:05:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOb9-00000009SUq-49Lm
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 02:05:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D1rSrG010369;
	Thu, 13 Feb 2025 02:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ju1CUxdi9qHgTtG7ye6LU9jXq3SmZNCoz31/czRX4eQ=; b=R+uVJyUflZcqLA52
	Zt7zkyA3t74I+5yiM2saixu/f6rU6Vj7A5155NHGyDB/t+AVqjHWMCJw2kBH47zt
	QAPdFd6/773fJc3jDZFHGejZOuXIg/7V3BxRpC9KUtVc2kw7tEO79LznhWkzepLw
	p77BsGwEQT2maSDOWeT2nUUIkHv3zfMRnRdz8a2eUl1RxAOdN6PGrYXlrd96+OIk
	0F7csGP4DwrXSkvQibAk6QyOWwfeO/rikIu33xX9gUZd8wkJg3YdKubl4RE4lOnN
	rNA5rQ/HnDZgEX6M+8uMDG6RR5lS/eu4lQlCA9iyJAJFd7tDTduXqZTfvdZxyXvB
	0Z7djA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5hn9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 02:05:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D250SU003474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 02:05:01 GMT
Received: from [10.110.103.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 18:05:00 -0800
Message-ID: <62873a7f-d62a-4594-a7f8-c29e1df0aa30@quicinc.com>
Date: Wed, 12 Feb 2025 18:05:00 -0800
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
X-Proofpoint-ORIG-GUID: mFZklj5tV6q3-N_CiL_zCxA0-wQcfs7X
X-Proofpoint-GUID: mFZklj5tV6q3-N_CiL_zCxA0-wQcfs7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_180504_146605_EA68681C 
X-CRM114-Status: GOOD (  16.24  )
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
Hi Maxime,

I noticed that currently only one of the bandwidth flags is set in the 
driver. I am inquiring with the firmware team to determine if we need to 
set multiple flags from the driver. I will update you soon and, if 
required, will post the next revision.

Thanks
Pradeep

