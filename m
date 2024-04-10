Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F80C67861
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 02:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2dQUsTm542y6Sf1p1cbVhWM99T2QSB+mY4ltVuG0UI=; b=zcwuFYzKa/3a/n1iJ4aXZl+7eW
	0krSGD9MLpHtkIKasbxF5d/2z4Cn38ZuSmzTCnhjopkTt2tTXYx+ydQfztdue9cdonfmGS/7mQRro
	dWexsuzxeYG7eghTjEc6dagsAQxJut8TjZ583QBXk9wHAPkCUvxOtzpx3Uuqx9ynEFumDE8mcgtpU
	hLpqvaTNpV1TTco9LnbpjB2tbuZM7JHbntdcAjuevGZz0Kmf5PKFX3tWu3QjHKY9ww1rTwCv2y7b3
	GGhTxLmszw4myxEz6WLRGBXnIj511qiTbBmBBstdLXJeCOonf8FJRq0paMVYij7OHgRXvHnxC0KvG
	RnDtw47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruNcW-00000004ji1-1pjz
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 02:23:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruNcS-00000004jgp-0qpB
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 02:23:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43A0pAhe020742;
	Wed, 10 Apr 2024 02:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=u2dQUsTm542y6Sf1p1cbVhWM99T2QSB+mY4ltVuG0UI=; b=bv
	SNwlGHvWAinwHY/0x+Z7Pvbqaj2ubmDZAu87ZxXyac7MUaUv3nhqxdOXe2CbaxO0
	Am0wfDgxy+2kth7XrvFAYWQcatr/fNcy1GIxiHAgQUBT2YgnCfHVCH01XuenWqWM
	uxDJ+G4MV+Toh4cvU6jfzSCQu+9W57rd+uXDPQDM8onzES8nLGmjLG/YDSrf/LmL
	3YCFaQs0HtQa/54HWq85QGcHYqeCzlwVplxQDIEWC9o/Pu7jcZ3sBQ5310erMAiT
	8LZg3VunnfBfFgPKjjnSm/KwA6iITphjPy/UQ+0s+Sd1agR+zE0y+nYbdM5pqP0J
	XskHG+KTEjtTdKi6rffQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xd3dyagu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 02:23:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43A2NI7G003226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 02:23:18 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Apr 2024
 19:23:17 -0700
Message-ID: <3a1c916e-b9eb-43b8-a6f8-896d8d889d1b@quicinc.com>
Date: Wed, 10 Apr 2024 10:23:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 disconnects and reconnects in a loop
To: Gregoire <gregoire.s93@live.fr>, <ath12k@lists.infradead.org>
References: <87ttkc1dkp.fsf@kernel.org>
 <AS8P190MB1205F5A75A6569B2E6F6C02687072@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <AS8P190MB1205F5A75A6569B2E6F6C02687072@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UWzr4HDtEzOR6FPwoWhxzT5LkwQ9JyoZ
X-Proofpoint-ORIG-GUID: UWzr4HDtEzOR6FPwoWhxzT5LkwQ9JyoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=685
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404100015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_192324_467365_AA65308F 
X-CRM114-Status: GOOD (  10.45  )
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



On 4/9/2024 6:49 PM, Gregoire wrote:
> I've found a workaround:
> I had to add
> [General]
>   ControlPortOverNL80211=false
Why are you adding this? Any logs or behavior get your attention to it?

 From naming of this option, seems it affects the delivery of some kinds 
of frames from cfg80211/mac80211 to IWD. What I know now one example of 
them is the EAPOL frames, but from IWD logs EAPOL is good. Any other 
kind of frames?

> 
> in my /etc/iwd/main.conf
> 
> And now I can connect and I don't have this issue anymore.
> 
> are there any plans to avoid having to add this option in iwd?
> 
> 

